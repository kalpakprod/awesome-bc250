> 🌐 Tłumaczenie społecznościowe. Wersja angielska jest źródłem prawdy i może być nowsza. Znalazłeś błąd? Zgłoś to w [zgłoszeniu (issue)](https://github.com/lildebil0/awesome-bc250/issues). ([oryginał angielski](../en/12-ai-llm.md))

# AI / LLM na BC-250

> **W skrócie** — Atrakcyjność BC-250 dla AI to jego **16 GB GDDR6** w cenie z przeceny. Realistyczny sposób korzystania to **llama.cpp / Ollama na backendzie Vulkan (RADV)** — *nie* ROCm. GPU to **gfx1013 (Cyan Skillfish)**, którego żadna kompilacja ROCm oficjalnie nie obsługuje, więc ROCm to głęboka królicza nora, którą większość ludzi omija. Na Vulkan, z modelem MoE mieszczącym się w VRAM, społeczność widzi mniej więcej **30–40 tok/s** (np. gpt-oss-20b, Qwen3.5-35B-A3B, Gemma-4-26B-A3B). Haczyk to **pamięć**: te 16 GB jest współdzielone przez CPU+GPU, więc duże modele żyją na samej krawędzi, a OOM (brak pamięci) jest awarią numer jeden. Ustaw VRAM w BIOS-ie, podnieś limit stron TTM jądra i uruchamiaj modele **MoE** — to cała gra.

BC-250 jest niezłą *budżetową maszyną do inferencji* i kiepską *maszyną do trenowania*. Traktuj go jako „kartę 16 GB, która uruchamia modele kwantyzowane przez Vulkan", a będziesz mieć dobry czas.

---

## Dlaczego Vulkan, a nie ROCm

Układ GPU to **Cyan Skillfish = `gfx1013`** (część klasy RDNA-1.x, rodzeństwo Navi 10/`gfx1010`). Ten jeden fakt decyduje o wszystkim:

- **ROCm nie dostarcza wsparcia dla `gfx1013`.** Stos ROCm AMD obsługuje konkretną listę dozwolonych identyfikatorów GPU, a Cyan Skillfish nie ma na niej. Więc oficjalna ścieżka `ROCm/ROCm` po prostu nie widzi karty. Konkretnie: `gfx1013` *jest* wymieniony w LLVM jako zdolny do `rocm-amdhsa`, ale **przestrzeń użytkownika ROCm AMD (rocBLAS/Tensile) nie dostarcza żadnych bibliotek matematycznych (rozwiązań) dla `gfx1013`** — więc w momencie, gdy GEMM trafi na rocBLAS, dostajesz `rocblas_abort()` („GFX1013 not in GPU list"). Nie ma jądra matematycznego do wywołania ([akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)).
- **Nawet pomijając to, ROCm nie ma użytecznej pamięci podręcznej shaderów na tych APU — rekompiluje przy każdym uruchomieniu**, podczas gdy **backend Vulkan zapisuje skompilowane shadery na dysk**. Już samo to czyni Vulkan praktyczną ścieżką obliczeniową: testy akandr wnioskują, że Vulkan był jedyną ścieżką GPU-compute uznaną za użyteczną na tej płycie ([akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)). (Zauważ, że to luka *sterownika/biblioteki*, a **nie** brakującej funkcji sprzętowej — ISA `gfx103x` RDNA2 zawiera INT8 dp4a, np. `v_dot4c_i32_i8`; problem polega wyłącznie na tym, że ROCm nie dostarcza nic dla tego ID.)
- Dobrze znane repozytoria „odblokuj ROCm na starych kartach" **też tego nie obejmują**:
  - [`woodrex83/ROCm-For-RX580`](https://github.com/woodrex83/ROCm-For-RX580) jest **tylko dla `gfx803`** (Polaris: RX 580/570/480). Zupełnie zła architektura — nieużyteczne tutaj.
  - [`ulyssesrr/docker-rocm-xtra`](https://github.com/ulyssesrr/docker-rocm-xtra) dodaje dodatkowe cele (`gfx803`, `gfx900/906/908`, `gfx1010/1011/1012`, `gfx1030…`) — ale **`gfx1013` nie ma na liście**, a repozytorium zostało **zarchiwizowane 2025-08-12**. Możesz *spróbować* podszyć się pod `gfx1010` (Navi 10) za pomocą `HSA_OVERRIDE_GFX_VERSION=10.1.0`, tak samo jak ludzie tworzą dowiązania symboliczne firmware'u Navi 10, aby uruchomić sterownik wyświetlania (`navi10_gpu_info.bin → cyan_skillfish_gpu_info.bin`, [src](https://t.me/c/2424231195/7458/136321)), ale to niezweryfikowane dla obliczeń na BC-250 i nikt na czacie nie zgłasza działającego stosu LLM na ROCm.  ⚠ zweryfikuj

Pozostałe repozytoria, którymi ludzie rzucają — [`xuhuisheng/rocm-build` (navi10)](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) i [`robertrosenbusch/gfx803_rocm`](https://github.com/robertrosenbusch/gfx803_rocm) — są odpowiednio dla dGPU Navi 10 i Polaris, a nie Cyan Skillfish. Są przydatne jako tło, a nie jako przepis na tę płytę.

**Wniosek końcowy (stan na połowę 2026):** ROCm na BC-250 to nierozwiązany/nieopłacalny hack. Każda działająca konfiguracja, którą społeczność udostępniła, działa na **Vulkan przez Mesa RADV**, którą stos sterowników BC-250 już ci daje do grania. Jeśli komuś uda się uruchomić ROCm, to przez podszywanie się pod `gfx1010` w załatanym kontenerze — spodziewaj się straty weekendu, bez gwarancji.

> **Aktualizacja — komuś udało się uruchomić HIP/ROCm (Discord, połowa 2026).** Po wydaniu powyższego werdyktu "nikt nie zgłasza działającego stosu", jeden z członków społeczności zgłosił **uruchomienie obliczeń ROCm, HIP i PyTorch** na BC-250 po **zmodyfikowaniu firmware MEC**, zmianie ustawień BIOS-u i rekompilacji stosu ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1482848457478901851)). Na tej ścieżce, **`llama.cpp` skompilowane z obsługą HIP** osiągnęło **709 tok/s na TinyLlama-1.1B (pp512)** oraz **115 tok/s na Llama-3.1-8B (pp512)** przy domyślnych taktowaniach ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1483073888551440384)), a faza prefill skalowała się wraz z odblokowaniem CU — **~230 tok/s przy 24 CU (94–95 W) vs 371,6 tok/s przy 40 CU (125 W), oba przy 1500 MHz** ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1506023598048022588)). Jest to eksperymentalna ścieżka ingerująca głęboko w firmware — nie jest to zalecana droga — ale pokazuje, że werdykt "ROCm jest niemożliwy" nie jest już absolutny. ⚠ zaawansowane.

---

## Przewaga 16 GB VRAM (i jej haczyk)

16 GB wystarcza, aby pomieścić model 20–35B, gdy jest **kwantyzowany** (Q3–Q4) — VRAM, który w przeciwnym razie kosztowałby cię 4060 Ti 16 GB lub używaną 3090. To cały powód, dla którego ta płyta jest interesująca dla LLM-ów.

Haczyk: **te 16 GB jest współdzielone między CPU a GPU.** Nie ma osobnej puli RAM systemowego, na którą można się cofnąć. Więc:

- Model + KV-cache + system operacyjny + każdy proces w tle — wszystko mieści się w *tych samych* 16 GB.
- Przesuń model za daleko i nie dostaniesz „wolno" — dostaniesz twardy **OOM (brak pamięci)**, a na niektórych dystrybucjach KDE pada i wyrzuca cię do konsoli ([src](https://t.me/c/2424231195/101077)).
- Werdykt jednego regularnego współtwórcy po miesiącach testów: *„Wydajność wystarcza na wiele; to **pamięć** jest tym, czego nie wystarcza."* ([src](https://t.me/c/2424231195/101077))

Dwie dźwignie kupują ci zapas:

1. **Ustaw VRAM w BIOS-ie.** Działanie z `vram = 12` (GB) to znana-dobra baza, która zostawia RAM dla systemu ([src](https://t.me/c/2424231195/101077)). Wyższe podziały VRAM pozwalają załadować większe modele, ale głodzą system operacyjny.
2. **Podnieś limit stron TTM jądra**, aby menedżer pamięci GPU faktycznie przydzielał duże alokacje, których potrzebuje model 14B+ (zobacz konfigurację poniżej). To jedyna zmiana, która odblokowuje większe modele na Vulkan.

Trik społeczności, aby odzyskać 1–2 GB: uruchom **bezgłowy system serwerowy** i rozmawiaj z nim przez sieć (np. Open WebUI / API), żeby żaden pulpit nie pożerał VRAM ([src](https://t.me/c/2424231195/101077)).

---

## Uruchamiaj modele MoE, a nie gęste

To najważniejszy wybór modelowania na maszynie 16 GB z pamięcią współdzieloną, a czat jasno mówi dlaczego ([src](https://t.me/c/2424231195/125233)):

- Dla modelu **gęstego** możesz go podzielić tylko *sekwencyjnie* warstwa po warstwie; sztuczki tensor-parallel nie pomagają, więc jesteś ograniczony tym, co się mieści, i surową przepustowością.
- Dla modelu **MoE** trzymasz część gęstą/uwagi na karcie i aktywujesz tylko kilku małych ekspertów na token. Rezultat: **dużo większy model mieści się przy przyzwoitej jakości i dostajesz mnożnik przepustowości**, ponieważ tylko ułamek wag jest dotykany na token.

Dokładnie dlatego modele, które ludzie faktycznie uruchamiają na BC-250, to MoE z małą liczbą aktywnych parametrów: **gpt-oss-20b** (faworyt czatu), **Qwen3.5-35B-A3B** (35B łącznie / ~3B aktywnych), **Gemma-4-26B-A3B**. Biją daleko ponad to, co mógłby zrobić model gęsty o tym samym śladzie VRAM.

> Powiązany wgląd dla konfiguracji wielokartowych: dla MoE możesz podzielić **kolumny ekspertów** między płyty i zyskać zagregowaną przepustowość, podczas gdy stan ukryty modelu gęstego jest maleńki (~1 MB nawet dla 70B), więc gigabitowe łącze między węzłami *nie* jest wąskim gardłem ([src](https://t.me/c/2424231195/125233)). Dla pojedynczego BC-250 to bez znaczenia, ale wyjaśnia, dlaczego ludzie łączą je w łańcuch.

---

## Konfiguracja A — Ollama + Vulkan (zalecana, odtwarzalna)

Najbardziej kompletny, odtwarzalny przepis na BC-250 to przewodnik społeczności [`akandr/bc250` → *Ollama + Vulkan setup*](https://github.com/akandr/bc250#3-ollama--vulkan-setup) (wielokrotnie przywoływany na czacie). Zakłada działający stos graficzny BC-250 (zobacz [06-linux.md](06-linux.md)) — Fedora z niedawną Mesa/RADV — a następnie nakłada Ollamę na wierzch. Odtworzone z tego repozytorium:

**1. Zainstaluj Ollamę:**
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

**2. Włącz backend Vulkan + opcje bezpieczne pamięciowo** przez nadpisanie systemd (`/etc/systemd/system/ollama.service.d/override.conf`):
```ini
[Service]
Environment=OLLAMA_VULKAN=1
Environment=OLLAMA_FLASH_ATTENTION=1
Environment=OLLAMA_KV_CACHE_TYPE=q4_0
Environment=OLLAMA_MAX_LOADED_MODELS=1
Environment=OLLAMA_KEEP_ALIVE=30m
Environment=OLLAMA_CONTEXT_LENGTH=65536
Environment=OLLAMA_GPU_OVERHEAD=0
Environment=OLLAMA_MAX_QUEUE=4
OOMScoreAdjust=-1000
```
Następnie:
```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```
`OLLAMA_FLASH_ATTENTION=1` i `OLLAMA_KV_CACHE_TYPE=q4_0` zmniejszają KV-cache, aby długi kontekst się zmieścił; `OOMScoreAdjust=-1000` powstrzymuje jądro przed zabiciem Ollamy jako pierwszej pod presją pamięci.

**3. Kluczowa poprawka pamięci — podnieś limit stron TTM** (to właśnie pozwala modelom 14B+ / o dużym kontekście w ogóle się załadować):
```bash
echo 4194304 | sudo tee /sys/module/ttm/parameters/pages_limit
echo 4194304 | sudo tee /sys/module/ttm/parameters/page_pool_size
```
Spraw, aby przetrwało restarty:
```bash
echo "options ttm pages_limit=4194304 page_pool_size=4194304" | \
  sudo tee /etc/modprobe.d/ttm-gpu-memory.conf
```

**4. Pobierz i uruchom model MoE**, np.:
```bash
ollama run gpt-oss:20b
```

> Przewodnik `akandr/bc250` został zwalidowany na **Fedora 43 / jądro 6.18.9 / Mesa 25.3.4 RADV / Ollama 0.20.0**. Dokładne wersje pakietów będą się zmieniać — zachowaj zmienne środowiskowe i poprawkę TTM; resztę aktualizuj. ⚠ zweryfikuj wersje względem repozytorium przed kopiowaniem.

**Dołóż gubernator Oberon.** Uruchomienie [`mothenjoyer69/oberon-governor`](https://gitlab.com/mothenjoyer69/oberon-governor) (ten sam gubernator używany do grania, zobacz [09-overclock-undervolt.md](09-overclock-undervolt.md)) ma według zgłoszeń dodawać **+10–20 tok/s na gpt-oss-20b** przez utrzymywanie wyższych zegarów ([src](https://t.me/c/2424231195/101077)). To najtańsze dostępne przyspieszenie.

---

## Konfiguracja B — llama.cpp (Vulkan), zbudowana lub spakowana

Jeśli chcesz surowego `llama.cpp` (więcej kontroli, GGUF z dowolnego miejsca, kompatybilne z OpenAI API `llama-server`):

**Arch / paru (jedyna komenda zweryfikowana na czacie):**
```bash
paru -S aur/llama.cpp-vulkan
```
([src](https://t.me/c/2424231195/101026) — jedyna komenda budowania w korpusie czatu tej sekcji; sprawdzona krzyżowo względem nazwy pakietu.)

**Zbuduj ze źródeł** (zgodnie z [dokumentacją budowania `ggml-org/llama.cpp`](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md)) — Debian/Ubuntu:
```bash
sudo apt-get install libvulkan-dev glslc spirv-headers
cmake -B build -DGGML_VULKAN=1
cmake --build build --config Release
```
(Na Fedorze pakiet nagłówków SPIR-V to `spirv-headers-devel`.) Następnie uruchom ze wszystkimi warstwami na GPU:
```bash
./build/bin/llama-cli -m PATH_TO_MODEL.gguf -ngl 99 -p "Hi, how are you?"
```
`-ngl 99` odciąża każdą warstwę na urządzenie Vulkan. Użyj `--list-devices`, aby potwierdzić, że BC-250 to urządzenie wybrane przez llama.cpp, oraz `--device`, aby je wymusić, jeśli masz więcej niż jedno. Prekompilowane pliki binarne są na [stronie wydań llama.cpp](https://github.com/ggml-org/llama.cpp/releases).

> **Nie buduj backendu HIP/ROCm** (`-DGGML_HIP=ON -DGPU_TARGETS=gfx1013`). Nie ma środowiska uruchomieniowego ROCm dla `gfx1013`, więc nie uruchomi się, nawet jeśli się skompiluje. Vulkan to wspierana ścieżka tutaj. ([dokumentacja budowania](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md))

**Front-endy, których ludzie faktycznie używają:**
- **[Jan AI](https://jan.ai/)** — obecny codzienny wybór czatu: duży wybór modeli, ustawienia kontekstu/narzędzi, może dać modelowi dostęp do sieci + czytać obrazy/dokumenty, wsparcie MCP. Uruchamia model pod spodem przez Vulkan ([src](https://t.me/c/2424231195/101077)).
- **[KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)** — jednoplikowa nakładka na llama.cpp z Vulkan, poręczna do wdrożenia z jednego pliku.
- **Open WebUI** — sparuj z bezgłową maszyną, aby sterować nią z innego komputera (oszczędza VRAM pulpitu).

---

## Realistyczne oczekiwania co do tok/s

Liczby poniżej są **zgłaszane przez społeczność na Vulkan**, modele MoE dobrane tak, aby zmieścić się w 16 GB. Traktuj je jako rząd wielkości, a nie zestaw benchmarków — pochodzą z przewodnika `akandr/bc250` i czatu, na pojedynczej płycie z poprawką TTM + flash-attention + KV-cache `q4_0`.

| Model | Kwant | Aktywne / łączne parametry | Zgłoszona szybkość generowania |
|---|---|---|---|
| Qwen3.5-9B | Q4_K_M | gęsty 9B | ~32 tok/s |
| Gemma-4-26B-A3B (MoE) | UD-Q3_K_M | ~3B / 26B | ~39 tok/s |
| Qwen3.5-35B-A3B (MoE) | UD-IQ2_M | ~3B / 35B | ~38 tok/s |
| gpt-oss-20b (MoE, MXFP4) | MXFP4 | ~3.6B / 20B | faworyt społeczności; +10–20 tok/s z gubernatorem Oberon |

Źródła: szybkości z [`akandr/bc250`](https://github.com/akandr/bc250#3-ollama--vulkan-setup); użycie gpt-oss-20b i wzrost od gubernatora ([src](https://t.me/c/2424231195/101077)). GGUF-y modeli pochodzą z Hugging Face — np. [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF), [unsloth Qwen3.6-35B-A3B](https://huggingface.co/unsloth/Qwen3.6-35B-A3B-GGUF), [Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M).

**Szczera ocena:** ~30–40 tok/s na MoE 20–35B jest naprawdę użyteczne do czatu, pomocy w kodowaniu i pętli agentowych/narzędziowych. To **nie** jest 4090. Jakość jest ograniczona przez agresywną kwantyzację, którą wymuszają 16 GB (IQ2/Q3 na modelach 35B) — a jeden użytkownik zauważył, że przepychanie 30B w ostrzejszym kwancie „prawdopodobnie spowoduje wiele błędów" ([src](https://t.me/c/2424231195/101077)). Słodki punkt to **gpt-oss-20b**, wielokrotnie opisywany jako „mądrzejszy niż wszystkie te małe", pozostając stabilnym ([src](https://t.me/c/2424231195/101077)).

### Czy odblokowanie 40 CU przyspiesza LLM-y? Tak — zmierzone na żywo na modelu gęstym

Odblokowanie 40 CU (zobacz [09-overclock-undervolt.md](09-overclock-undervolt.md)) pomaga inferencji bardziej niż grom, ponieważ generowanie tokenów faktycznie używa jednostek obliczeniowych. Film zmierzył to **na żywo**, przełączając CU na modelu **gęstym** — Qwen3.5-9B (~10 GB GDDR6) na **Ollama + Vulkan** — a przepustowość śledziła liczbę CU niemal liniowo ([Old Lamer — film o odblokowaniu CU, RU](https://youtu.be/M7PsojWr4KA), ~8:30–12:03): *(⚠ napisy automatyczne — traktuj wartości dziesiętne jako ≈.)*

| Aktywne CU | Szybkość generowania | vs 24 CU |
|---|---|---|
| 24 CU (fabryczne) | ≈25.7 tok/s | baza |
| krok odblokowania | ≈31.9 tok/s | **~+16–17 %** |
| 36 CU | ≈33.4 tok/s | **~+20 % łącznie** |

Ta płyta **wyczerpała się przy 36 CU** — dwa ostatnie CU były naprawdę wadliwe, a **llama crashowała przy ładowaniu**, gdy były włączone, konkretny przykład punktu „38/40 to loteria" z rozdziału o OC. Środowisko Ollamy odpowiadało przepisowi powyżej (`OLLAMA_VULKAN=1`, KV-cache `q4_0`, kontekst 65536, `ttm.pages_limit=4194304`). Ponieważ to model *gęsty*, zysk to czyste skalowanie CU — bez mnożnika routingu ekspertów MoE na wierzchu ([Old Lamer — film o odblokowaniu CU, RU](https://youtu.be/M7PsojWr4KA)).

Przewodnik `akandr/bc250` przeprowadził pełniejsze A/B na modelach **MoE** w ramach odblokowania 40 CU (sama łatka odblokowująca mieszka w [`duggasco/bc250-40cu-unlock`](https://github.com/duggasco/bc250-40cu-unlock), nie u akandr; akandr dodaje niezależną kontrolę poprawności FP32 + ponowny przebieg przepustowości). Dwie czołowe różnice generowania, obie **przez llama.cpp** ([akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results)):

| Model | Kwant | Gen @ 24 CU | Gen @ 40 CU | Δ |
|---|---|---|---|---|
| gpt-oss-20b (MoE) | MXFP4 | 66.1 tok/s | 87.5 tok/s | **+32 %** |
| Qwen3.5-35B-A3B (MoE) | — | 59.5 tok/s | 78.7 tok/s | **+32 %** |

W 11 modelach mediana wyniosła **+32 % generowania / +50 % prefill** z odblokowania. Dwie rzeczy warte wyciągnięcia z tej tabeli: **gpt-oss-20b działa komfortowo (66 → 87 tok/s)**, potwierdzając faworyta czatu, a akandr zmierzył modele MoE **znacznie szybciej przez `llama.cpp` bezpośrednio niż przez Ollamę** (ścieżka rozsyłania ekspertów Ollamy jest mniej wydajna dla tej architektury — np. Qwen3.5-35B-A3B miał 25.1 tok/s na Ollamie vs 59.5 tok/s na llama.cpp przy fabrycznych zegarach) ([akandr/bc250 §4](https://github.com/akandr/bc250#4-benchmarks)).

> 💬 **Niezweryfikowane punkty danych MoE (komentarze Hackaday — traktuj jako pogłoski).** Z komentarzy czytelników, a nie z odtworzonego przebiegu: Qwen „27b" z **MTP** (predykcja wielu tokenów) przy **≈14.5 tok/s** oraz „35b" z MTP przy **≈47 tok/s**. Szeroki rozrzut to dokładnie to, co dałyby różnice MTP + aktywnych parametrów MoE, ale żadna z liczb nie jest tutaj niezależnie potwierdzona — oznaczone dla kontekstu, a nie jako benchmark. ⚠ zweryfikuj

---

## Co jest bolesne (bądźmy szczerzy)

- **OOM (brak pamięci) to domyślny tryb awarii.** Duży model w 16 GB pamięci współdzielonej = życie na krawędzi. Spodziewaj się crashy; na KDE pulpit może paść i zostawić tylko konsolę ([src](https://t.me/c/2424231195/101077)). Łagodź przez podział VRAM w BIOS-ie, poprawkę TTM, KV-cache `q4_0`, flash attention i konfigurację bezgłową.
- **Stabilność dystrybucji bywa różna.** Czat stwierdził, że **Ubuntu jest stabilniejsze niż Fedora** pod względem niecrashowania pod presją pamięci na Vulkan, mimo że Fedora jest udokumentowaną bazą ([src](https://t.me/c/2424231195/101077)). Jeśli jedna dystrybucja ciągle crashuje przez OOM, spróbuj drugiej.
- **ROCm jest praktycznie wykluczone** (zobacz sekcję na górze). Nie pal dni na pogoń za trenowaniem PyTorch/vLLM na tej karcie — [ścieżka AMD vLLM](https://docs.vllm.ai/en/latest/getting_started/installation/gpu/#amd-rocm) potrzebuje ROCm, który potrzebuje wspieranego ID GPU, którego ta płyta nie ma.
- **To maszyna do inferencji, a nie trener.** Dostrajanie w jakiejkolwiek realnej skali chce więcej VRAM i działającego stosu obliczeniowego. Używaj go do *uruchamiania* modeli, a nie do ich trenowania.
- **Przepustowość zależy od zegarów.** Bez gubernatora utrzymującego wysokie zegary zostawiasz 10–20 tok/s na stole ([src](https://t.me/c/2424231195/101077)); chłodzenie też ma tu znaczenie (zobacz [04-cooling.md](04-cooling.md)), bo trwała inferencja to trwałe obciążenie.

---

## Zalecana konfiguracja startowa

| Poziom | Zrób to | Spodziewaj się |
|------|---------|--------|
| Minimum | Działający stos RADV ([06-linux.md](06-linux.md)) → Ollama + `OLLAMA_VULKAN=1` → poprawka TTM → `ollama run gpt-oss:20b` | ~30+ tok/s, stabilny czat |
| Lepiej | Dodaj gubernator Oberon + flash-attn + KV-cache `q4_0`; front-end przez Jan AI | +10–20 tok/s, dłuższy kontekst, narzędzia/MCP |
| Większy model | 35B-A3B MoE przy IQ2/Q3 z podniesionym `pages_limit` TTM; bezgłowo + Open WebUI, aby zwolnić VRAM | ~38 tok/s, blisko sufitu pamięci |
| Nie rób | Trenowanie ROCm / HIP / vLLM na `gfx1013` | ślepy zaułek, pomiń |

---

## Źródła

- Przepis na LLM dla BC-250 (Ollama+Vulkan, poprawka TTM, tok/s) — [akandr/bc250 §Ollama+Vulkan](https://github.com/akandr/bc250#3-ollama--vulkan-setup)
- Dlaczego ROCm zawodzi na gfx1013 (brak bibliotek rozwiązań rocBLAS/Tensile → `rocblas_abort()`; ROCm rekompiluje przy każdym uruchomieniu vs Vulkan cache'uje shadery) — [akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm) · ISA `gfx103x` RDNA2 ma INT8 dp4a (`v_dot4c_i32_i8`), więc to luka biblioteczna, a nie sprzętowa — [LLVM GFX1030 ISA](https://llvm.org/docs/AMDGPU/AMDGPUAsmGFX1030.html)
- Odblokowanie 40 CU na MoE, zmierzone różnice generowania (gpt-oss-20b 66.1→87.5, Qwen3.5-35B-A3B 59.5→78.7, mediana +32 % gen / +50 % prefill w 11 modelach; llama.cpp ≫ Ollama dla MoE) — [akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results) · [§4 benchmarks](https://github.com/akandr/bc250#4-benchmarks) · łatka odblokowująca: [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock)
- Działająca konfiguracja, gpt-oss-20b, wzrost od Oberon, notatki o OOM/dystrybucjach — https://t.me/c/2424231195/101077
- MoE vs gęste, przepustowość wielokartowa — https://t.me/c/2424231195/125233
- Skalowanie LLM przy odblokowaniu 40 CU, zmierzone na żywo (⚠ ASR — przybliżone) — Qwen3.5-9B gęsty na Ollama+Vulkan: 25.7 → 31.9 → 33.4 tok/s (24 → odblokowanie → 36 CU, ~+20 % łącznie); płyta ograniczona do 36 CU (2 CU wadliwe, llama crashowała przy ładowaniu) — [Old Lamer — film o odblokowaniu CU, RU](https://youtu.be/M7PsojWr4KA)
- Punkty danych MoE z MTP (⚠ niezweryfikowane, komentarze Hackaday) — Qwen „27b"+MTP ≈14.5 tk/s, „35b"+MTP ≈47 tk/s — wątek komentarzy artykułu Hackaday o BC-250
- Zweryfikowana komenda pakietu — https://t.me/c/2424231195/101026 · dowiązanie symboliczne firmware'u Navi10→Cyan Skillfish — https://t.me/c/2424231195/7458/136321
- Budowanie llama.cpp (Vulkan / HIP) — [ggml-org/llama.cpp build.md](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md) · [wydania](https://github.com/ggml-org/llama.cpp/releases) · [instalacja](https://github.com/ggml-org/llama.cpp/blob/master/docs/install.md)
- Rzeczywistość ROCm na gfx1013 — [ROCm/ROCm](https://github.com/ROCm/ROCm) · [woodrex83/ROCm-For-RX580 (tylko gfx803)](https://github.com/woodrex83/ROCm-For-RX580) · [ulyssesrr/docker-rocm-xtra (zarchiwizowane; brak gfx1013)](https://github.com/ulyssesrr/docker-rocm-xtra) · [xuhuisheng/rocm-build navi10](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) · [robertrosenbusch/gfx803_rocm](https://github.com/robertrosenbusch/gfx803_rocm)
- Front-endy — [Jan AI](https://jan.ai/) · [KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)
- Modele (GGUF) — [Hugging Face](https://huggingface.co/) · [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF) · [Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M)
- Overclock/gubernator — [09-overclock-undervolt.md](09-overclock-undervolt.md) · Baza Linux — [06-linux.md](06-linux.md) · Chłodzenie — [04-cooling.md](04-cooling.md)
