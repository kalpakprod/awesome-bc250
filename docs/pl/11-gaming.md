> 🌐 Tłumaczenie społecznościowe. Wersja angielska jest źródłem prawdy i może być nowsza. Znalazłeś błąd? Zgłoś to w [zgłoszeniu (issue)](https://github.com/lildebil0/awesome-bc250/issues). ([oryginał angielski](../en/11-gaming.md))

# Wyniki w grach i ustawienia

> **W skrócie** — BC-250 to **GPU klasy PS5 przyśrubowane do okrojonego 6-rdzeniowego Zen2**. GPU jest naprawdę zdolne: przy realnym podkręceniu do **2000 MHz** odpala współczesne tytuły AAA w **40–60 FPS**, a lżejsze/starsze gry sporo powyżej 60. Haczyk to **CPU**. Połówka Zen2 tego APU jest wąskim gardłem znacznie częściej niż GPU — benchmarki społeczności wielokrotnie pokazują kartę siedzącą przy **~36–47 % obciążenia GPU, zablokowaną na ~38 FPS**, ograniczoną przez CPU. Więc: **najpierw podkręć** (fabryczne ~1500 MHz jest ~30 % wolniejsze), oprzyj się na **FSR** i generowaniu klatek, celuj w **1080p–1440p** i pogódź się z tym, że gry obciążające fizykę lub źle wątkowane będą się zacinać niezależnie od rozdzielczości. Portowane gry first-party w stylu konsolowym (God of War, Horizon, Last of Us, Spider-Man) to idealny przedział.

Ta sekcja ustawia oczekiwania i zbiera prawdziwe, wrzucone wyniki społeczności — wiele z nich to zrzuty ekranu z benchmarków. Liczby różnią się z taktowaniem, dystrybucją, sterownikiem i podziałem VRAM, więc każdy wiersz jest powiązany ze swoim źródłem.

---

## Jedna rzecz do zrozumienia najpierw: jest ograniczony przez CPU

GPU BC-250 to część RDNA2 wywodząca się z PS5 (RADV raportuje je jako `GFX1013` / klasa NAVI10). To *nie* jest słabe ogniwo w większości gier. Słabym ogniwem jest **6-rdzeniowy CPU Zen2** pracujący przy ~3.5 GHz z okrojonym cache w stylu PS5 i bez zapasu SMT.

Benchmark społeczności przy **1080p, High, GPU @ 2000 MHz / pamięć @ 3600 MHz** czyni to konkretnym: przebieg **„osiągnął 38 FPS"** z **GPU Limited Percentage zaledwie 36.5 %** — wątek symulacji CPU był bramką (CPU sim ~70 / CPU render ~43 / GPU ~47 na mierniku per-etap). GPU bezczynnie stało na jednej trzeciej swojej wydajności, podczas gdy CPU trzymał liczbę klatek w dole. ([src](https://t.me/c/2424231195/136242))

Praktyczne konsekwencje:

- **Rozdzielczość jest często „za darmo".** Ponieważ jesteś ograniczony przez CPU, przejście z 1080p na 1440p (albo nawet 4K z FSR) często kosztuje niewiele FPS — GPU i tak miało zapas. Kilka wyników 4K poniżej wygląda niemal tak dobrze jak ich odpowiedniki 1080p dokładnie z tego powodu.
- **Upscaling pomaga mniej niż na normalnym PC.** FSR odciąża GPU, ale jeśli to CPU jest ograniczeniem, obniżenie rozdzielczości renderowania nie podniesie znacząco twojego FPS. Używaj FSR dla jakości obrazu / temperatur, nie jako magicznego przycisku FPS.
- **Źle wątkowane lub obciążające fizykę gry cię karzą.** Zacinanie i skoki czasu klatek (Gothic Remake, Doom: The Dark Ages przed poprawkami) pochodzą z CPU, nie z GPU.
- **Podkręć GPU mimo to** — gdy gra *jest* ograniczona przez GPU (4K, ciężki ray tracing, dobrze wątkowane silniki), 1500 → 2000 MHz to ~+30 % FPS. Zob. [09-overclock-undervolt.md](09-overclock-undervolt.md), jak tam dotrzeć, i najpierw [04-cooling.md](04-cooling.md), bo 2000 MHz wymaga moda chłodzenia.

---

## Ustawienia, które faktycznie robią różnicę

- **Taktowania.** Fabryczne GPU ~1500 MHz to wolny domyślny stan; społeczność uruchamia **GPU 2000 MHz, pamięć ~1900–2000 MHz** jako codzienny cel, a niektórzy pchają **2.65 GHz na rdzeniu w buildzie klasy dGPU**. Fabryczne vs. 2000 MHz to mniej więcej **+30 % FPS** w scenach ograniczonych przez GPU. ([przewodnik podkręcania](09-overclock-undervolt.md))
- **Odblokowanie 40 CU.** Płyta jest sprzedawana z wyłączonymi CU. Odblokowanie wszystkich **40 CU** daje mierzalny, szeroki wzrost — jeden użytkownik zgłosił, że Doom: The Dark Ages przeszedł z zepsutego do **60 FPS High**, tytuł „007" do **60 FPS High** oraz stabilniejsze czasy klatek w Great Pragmata po odblokowaniu. ([src](https://t.me/c/2424231195/141193)) Zob. [09-overclock-undervolt.md](09-overclock-undervolt.md).
- **FSR / FSR 4.** Używaj Quality lub Balanced przy 1440p/4K, by trzymać GPU nakarmione, a temperatury w dole. Społeczność aktywnie portuje **FSR 4** (pakiety DLL udostępniane w wątku). ([src dyskusji FSR4 INT8](https://t.me/c/2424231195/136354)) Zmierzone zyski FSR przez elektricM: **Quality +20–30 %, Balanced +30–40 %, Performance +40–60 %** FPS; **generowanie klatek może z grubsza podwoić** liczbę klatek (niewielkie opóźnienie). **FSR 4 przez Optiscaler** — społeczność uważa, że **Balanced bije natywny FSR 3.1.5 Quality**. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
  - **Którego upscalera faktycznie używać:** **FSR 1–3 to praktyczny wybór** tutaj — jest dojrzały, tani i dobrze wspierany. **FSR 4 i XeSS technicznie *mogą* działać** na tym krzemie RDNA2 przez ścieżkę **DP4a (INT8)** — RDNA2 ma dp4a/Rapid Packed Math, więc build FSR 4 INT8 z OptiScalera i wariant XeSS-DP4a niezależny od GPU oba się ładują — ale na tak słabym GPU są **wolne i eksperymentalne**: fallback DP4a jest ~10–20 % cięższy niż ścieżka WMMA używana przez nowsze karty, a jakość obrazu na XeSS-DP4a jest poniżej wersji XMX. Traktuj FSR 4 / XeSS jako coś do eksperymentów, nie codzienny wybór. ([OptiScaler FSR4 INT8 na RDNA2 — VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/)) **Oficjalny AMD FSR 4 dla RDNA2 (klasy RX 6000) ląduje ~na początku 2027**; do tego czasu jest to droga OptiScaler/moddowana. ([Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals))
- **Generowanie klatek poza FSR — LSFG.** **Lossless Scaling Frame-Generation (LSFG)** działa na Linuksie przez warstwę Vulkan **`lsfg-vk`** ([github.com/PancakeTAS/lsfg-vk](https://github.com/PancakeTAS/lsfg-vk)) — niezależną od gry warstwę frame-gen, która podpina się pod dowolny tytuł Vulkan. Społeczność używa jej, by **z grubsza podwoić FPS** (np. 30 → 60) w grach bez wbudowanego generowania klatek. Jak całe frame-gen dodaje opóźnienie i chce rozsądnej realnej liczby klatek do interpolacji, ale to prawdziwa opcja, gdy własne FG z FSR nie jest dostępne.
- **Podział VRAM (UMA).** To zunifikowana pula 16 GB. W jednym starannym przeglądzie (1440p, 1850 MHz) podział GDDR6 (512 MB vs 8 GB zarezerwowane) **ledwie zmienił średni FPS** — ale zbyt mały lub błędny ustawienie UMA może zrzucić cię do renderowania programowego (`llvmpipe`) lub zawiesić benchmark. Auto / rozsądny rezerw jest w porządku; nie przekombinuj. ([src](https://t.me/c/2424231195/81203))
- **VSync wyłączony** do benchmarków; **generowanie klatek włączone** tam, gdzie oferowane (pomogło Wukongowi osiągnąć trzycyfrowe średnie, zob. niżej).
- **`mitigations=off`** (flaga boot kernela) to powszechna poprawka; w przeglądzie VRAM miała tylko niewielki, zaszumiony wpływ na FPS. Traktuj jako mały. ⚠ **zweryfikuj (skala sporna)** — elektricM raportuje znacznie większy zysk (**+18 FPS w Cyberpunku, „+10–15 %"** w swoich poradach). Wyraźnie zależy od gry: duży w niektórych tytułach ograniczonych przez CPU, pomijalny w innych. Wypróbuj i zmierz; nie zakładaj żadnej liczby. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

---

## Wyniki, które ludzie faktycznie wrzucili

To liczby zgłoszone przez społeczność z ich ustawieniami i źródłem. **Wyniki benchmarków i FPS są takie, jak wrzucono** — taktowania/dystrybucja/sterownik różnią się między wierszami, więc czytaj kolumnę kontekstu, nie porównuj na ślepo.

| Gra | Ustawienia (rozdz. / preset / upscaling) | Wynik | Sprzęt / taktowania | Źródło |
|------|--------------------------------------|--------|-------------|--------|
| **Black Myth: Wukong** (bench) | 1080p, High, FSR + Frame Gen wł. | **śr. 96** (min 78, max 113) | BC-250, Windows, RADV NAVI10 | ([src](https://t.me/c/2424231195/10069)) |
| **Black Myth: Wukong** (bench) | 1440p, Medium, bez FSR | **śr. ~48** (max 56) | BC-250, 1850 MHz, Linux | ([src](https://t.me/c/2424231195/81203)) |
| **Shadow of the Tomb Raider** (bench) | 1440p, Max | **śr. ~70** | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Marvel's Guardians of the Galaxy** (bench) | 1440p, High | **śr. ~70** (89 max, min spada do ~3) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Dying Light 2** (bench) | 1440p, High, bez VSync | **śr. ~48** (max 62) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Cyberpunk 2077** (bench) | 1440p, Ray Tracing **min** | **śr. ~36** (min 30) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Indiana Jones and the Great Circle** | 1440p, low, bez upscalera | **45** | BC-250, GPU ~1900 MHz, Vulkan | ([src](https://t.me/c/2424231195/36931)) |
| **Indiana Jones and the Great Circle** | 1440p, medium, upscaler wł. | **60** | BC-250 | ([src](https://t.me/c/2424231195/36931)) |
| **Forza Horizon 5** | **4K**, preset High, **bez FSR** | grywalne (wideo) | BC-250 | ([src](https://t.me/c/2424231195/81891)) |
| **The Witcher 3** | 4K, Medium, FSR Balanced | **~50** | BC-250 | ([src](https://t.me/c/2424231195/81894)) |
| **Kingdom Come: Deliverance II** | 4K, Med/High, FSR Quality | **~30** („doświadczenie PS5") | BC-250 | ([src](https://t.me/c/2424231195/81893)) |
| **The Last of Us Part II** | 1080p, preset domyślny | grywalne (wideo) | BC-250 | ([src](https://t.me/c/2424231195/94237)) |
| **Doom: The Dark Ages** | High | **60** (po odblokowaniu 40 CU + poprawce) | BC-250, 40 CU | ([src](https://t.me/c/2424231195/141193)) · [poprawka Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/) · [Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS) |
| **Doom Eternal** | RT wł. (zgłoszone przez społeczność) | **60 + RT** | BC-250; zgłoszone przez społeczność (r/BC250Gaming) | ([synteza Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Tekken 8** | (zgłoszone przez społeczność) | **~60** | BC-250; zgłoszone przez społeczność (r/BC250Gaming) | ([synteza Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Street Fighter 6** | (zgłoszone przez społeczność) | **~60** | BC-250; zgłoszone przez społeczność (r/BC250Gaming) | ([synteza Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Stellar Blade** | (zgłoszone przez społeczność) | **~70–80** | BC-250; zgłoszone przez społeczność (r/BC250Gaming) | ([synteza Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | Generowanie klatek wł. (zgłoszone przez społeczność) | **60 → 100** (FG) | BC-250; zgłoszone przez społeczność (r/BC250Gaming) | ([synteza Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | (wideo) | grywalne | BC-250, CPU fabryczny, **GPU 2000** | ([src](https://t.me/c/2424231195/121772)) |
| **Gothic Remake** | Medium | **zacina się** — „brak optymalizacji" | BC-250 | ([src](https://t.me/c/2424231195/142708)) |
| **Hi-Fi Rush** | (wideo, przechwyt OBS) | płynne | BC-250, `mitigations=off` | ([src](https://t.me/c/2424231195/91022)) |
| **Cyberpunk 2077** | 1080p, High, FSR Quality, **bez RT** | **70–90** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Cyberpunk 2077** (bench) | 1080p (fabryczne 2000 MHz / 1000 mV) | **57.66** → **60.82** OC (2230 MHz); `mitigations=off` **+18** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **The Last of Us Part I** | 1080p, Medium-High | **60** (stabilnie) | BC-250 — 90–100 °C podczas kompilacji shaderów; trochę trzasków audio | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Devil May Cry 5** | 1080p, High | **100** (najniższe opóźnienie, ~10 ms) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Detroit: Become Human** | 1080p, Medium | **60** (z capem) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Control** | 1080p, pełny **RT** | **40** | BC-250 — dobre na RT poziomu wejściowego | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Company of Heroes 3** | 1080p | grywalne — **wymaga podziału VRAM 4 GB** (512 MB artefakty/crashe) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Red Dead Redemption 2** (bench) | użyj flagi `-useMaximumSettings` | **45+** min | BC-250 — może wykryć zły adapter GPU, ustaw go ręcznie | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **CS2** / **Rocket League** / **Elden Ring** | 1080p | **100+** / **120+** / **60** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Helldivers 2** | 1080p, low (zgłoszone) | **≈82** | BC-250, fabryczne, pojedynczy Noctua NF-P12 — GPU 73 °C / CPU 76 °C; ⚠ ASR | ([„Temps Shocked Me"](https://youtu.be/d7Hwqxn9yg8) ~5:08) |
| **Stalker 2** | medium (zgłoszone) | **≈80** | BC-250 — autor sygnalizuje ograniczenie przez CPU / 8 GB RAM; ⚠ ASR | ([recenzja RU](https://youtu.be/19l03qneKJ4) ~0:23) |
| **Stalker 2** | QHD (2560×1600), FSR Quality + Frame Gen, patch 1.21 (zgłoszone) | **57–70** (1080p, bez FG **≈45**) | BC-250; ⚠ ASR | ([recenzja RU](https://youtu.be/19l03qneKJ4) ~18:52) |
| **Arc Raiders** | 1080p (zgłoszone) | **≈56–80** | BC-250, fabryczne; ⚠ ASR | ([Temps Shocked Me](https://youtu.be/d7Hwqxn9yg8) ~5:58) |
| **Spider-Man 2** | 1080p, High, FSR Frame Gen (zgłoszone) | **≈100** śr. (poniżej 60 natywnie) | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~11:04) |
| **Forza Horizon 5** | 1080p, Medium, bez FSR (zgłoszone) | **70–95** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~12:19) |
| **Metro Exodus** | QHD, High (zgłoszone) | **≈58** | BC-250; ⚠ ASR | ([recenzja RU](https://youtu.be/19l03qneKJ4) ~14:12) |
| **Palworld** | 1080p, med-high (zgłoszone) | **<60** (grywalne) | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:04) |
| **Red Dead Redemption 2** | 1080p, med-high, FSR Quality (zgłoszone) | **solidne 60** | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:19) |
| **Left 4 Dead 2** | 1080p, max (zgłoszone) | **>150** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~10:18) |
| _Odniesienie: build z dedykowanym GPU_ | bench RE-engine, 1080p, High, bez RT | **śr. 67.99** (min 58, max 82) | **RX 6600** + Xeon E5-2667v4, Win10 | ([src](https://t.me/c/2424231195/116494)) |

> Wiersz RX 6600 to **nie wynik BC-250** — to członek uruchamiający dedykowaną kartę na tym samym chassis/CPU jako punkt porównania. Dołączony, by pokazać, co sam *CPU* potrafi utrzymać.

> ⚠️ **Elden Ring — wyniki się różnią.** ~60 FPS powyżej (elektricM, 1080p) nie jest uniwersalne: jeden build społeczności był **zablokowany na 30 FPS na High i nie mógł osiągnąć 60 nawet w 720p low** (ograniczony przez CPU). Traktuj 60 jako najlepszy przypadek, nie gwarancję. ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:50)

### Porty first-party / konsolowe — idealny przedział

Te chodziły wystarczająco dobrze, że jeden członek po prostu wymienił je jako „działają" (porty w stylu PS opierają się na GPU i są dobrze zoptymalizowane, co pasuje tej płycie):

> Days Gone · Death Stranding · DIRT 5 · Ghost of Tsushima: Director's Cut · God of War (2018) · God of War: Ragnarök · Horizon Forbidden West · Horizon Zero Dawn · The Last of Us Part I · The Last of Us Part II Remastered · Returnal · Uncharted: Legacy of Thieves

([src](https://t.me/c/2424231195/99563))

---

## Znane problematyczne gry (nie działają / wymagają obejścia)

elektricM śledzi tytuły, których nie pokryliśmy, a które **zawodzą lub walczą z platformą** — sprawdź, zanim kupisz:

| Gra | Problem | Obejście |
|------|---------|-----------|
| **Fortnite** | Easy Anti-Cheat **nie wspiera Linuksa** | **Brak — nie da się uruchomić** na BC-250 z Linuksem |
| **Valorant** | Anti-cheat na poziomie kernela | Problemy techniczne na Linuksie; faktycznie nie |
| **Magic: The Gathering Arena** | Crashe/zawieszenia konkretnie na **Fedorze** | Działa lepiej na **Manjaro / Bazzite**; spróbuj innego Protona |
| **Final Fantasy VII Rebirth** | „DX12 is not supported on your system" (sprawdzenie zgodności GPU) | **Brak poprawki na razie** |
| **Black Myth: Wukong** (cracked) | „CreateProcess() returned 2" (anti-tamper) | Użyj **niemodyfikowanych plików gry** |

(Status anti-cheat zmienia się z czasem — sprawdź dodatkowo [areweanticheatyet.com](https://areweanticheatyet.com) i [protondb.com](https://www.protondb.com).) ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

### Twardo zablokowane przez brakujące funkcje GPU (nie do naprawienia)

To jest **krzem klasy RDNA 2** (GFX1013). Garstka nowszych tytułów **twardo wymaga funkcji GPU, których RDNA 2 nie ma** — głównie **mesh shaders** i **sprzętowy variable-rate shading (VRS)** — i odmawia uruchomienia. Brakujący krzem to **ograniczenie sprzętowe, nie błąd sterownika**: żadna aktualizacja Mesa, parametr kernela ani wersja Protona nie dodaje samej funkcji. **Mesh shaders** to prawdziwa ściana. Wymóg **VRS** jest czasem tylko sprawdzeniem przy uruchomieniu, które warstwa Vulkan w userspace może zaślepić (zob. notkę o Doom poniżej) — więc nie zawsze jest fatalny. Potwierdzone przykłady ([wątek społeczności r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)):

| Gra | Twardy wymóg, którego BC-250 brakuje |
|------|------------------------------------|
| **Final Fantasy VII Rebirth** | **Mesh shaders** — nie uruchomi się (to też dlatego potyka się o sprawdzenie zgodności GPU DX12 w tabeli powyżej) |
| **Doom: The Dark Ages — Update 2** | **Vulkan fragment shading rate** (sprzętowy VRS) — Update 2 uczynił VRS obowiązkowym *przy uruchomieniu*; GPU go nie ma, więc niemodyfikowana gra już się nie startuje (build sprzed Update 2 chodził w 60 FPS po odblokowaniu 40 CU, powyżej). **Obejście istnieje** — zob. notkę poniżej. |

> **Doom: The Dark Ages Update 2 — istnieje teraz obejście.** Gra tylko *sprawdza* VRS przy uruchomieniu; nigdy nie potrzebuje go faktycznie do rozgrywki. Warstwa Vulkan **`bangstk/Vulkan_NullVRS`** ([github.com/bangstk/Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS)) przechwytuje `vkCmdSetFragmentShadingRateKHR()` i czyni z niej no-op, zaspokajając sprawdzenie przy uruchomieniu, więc gra działa bez efektów ubocznych w grze. Więc Doom: The Dark Ages **nie** jest trwałą twardą blokadą. **Mesh shaders to co innego** — nie ma równoważnego shima dla wymogu mesh-shaderów FF7 Rebirth, więc ten naprawdę się nie uruchomi.

> Przed kupnem zupełnie nowego tytułu AAA sprawdź, czy wymienia mesh shaders lub sprzętowy VRS jako wymóg. **Mesh shaders** to prawdziwa ściana sprzętowa tutaj (brak obejścia). Wymóg **sprzętowego VRS** jest często tylko bramką przy uruchomieniu — czasem do zashimowania (jak z Doom powyżej), czasem nie — więc sprawdź społeczność, zanim założysz cokolwiek.

## Ray tracing — co faktycznie przetestowano

BC-250 ma **prawdziwy sprzętowy RT RDNA2** (nie emulację programową, przy Mesa 25.2+). Przetestowane tytuły RT według elektricM:

| Gra | Rozdz. | FPS | Uwagi |
|------|-----|-----|-------|
| Cyberpunk 2077 | 1080p | 50–60 | Tylko oświetlenie RT, FSR Quality |
| Control | 1080p | 40 | Pełny RT |
| Portal 2 RTX | 720p | 40 | Programowa ścieżka RT w Mesa 25.2+ |
| Half-Life 2 RTX | 720p | 20–30 | Bardzo wymagające |

RT jest tu poziomu wejściowego — w porządku do *samego oświetlenia* w dobrze zoptymalizowanych grach, nie do pełnych obciążeń path-traced. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

## Proton i opcje uruchamiania (Linux)

- **Wersja Protona:** zacznij od **Proton GE** (najlepsza zgodność) lub **Proton Experimental**; w razie czego wróć do stabilnego **8.0 / 9.0** per gra. Zainstaluj GE przez **ProtonUp-Qt** (`protonup-qt`). Niektóre tytuły działają tylko na konkretnej wersji — testuj, jeśli jeden zawiedzie. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Opcje uruchamiania Steam** warte poznania:
  - `mangohud %command%` — nakładka FPS/temperatur.
  - `RADV_DEBUG=nohiz %command%` — wymusza RADV / naprawia niektóre glitche.
  - `gamemoderun %command%` — governor CPU na performance na czas sesji (pomaga tej ograniczonej przez CPU płycie).
  - Połączone: `RADV_DEBUG=nohiz mangohud gamemoderun %command%`.
- **VRAM per gra (podział UMA):** esport/indie są w porządku na **512 MB**; **większość gier chce 4 GB**; AAA/RT chcą też parametrów kernela na dodatkowy VRAM (`amdgpu.gttsize=...`, zob. [06-linux.md](06-linux.md) / [08-bios.md](08-bios.md)). Zbyt mały podział powoduje artefakty, crashe albo spadek do renderowania programowego. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Zacinanie przy pierwszym uruchomieniu** to zwykle **kompilacja shaderów** — pozwól Steamowi dokończyć wstępną kompilację przed oceną FPS; większy cache shaderów pomaga. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Poprawki per gra** (zgłoszone przez społeczność, r/BC250Gaming — wypróbuj, jeśli trafisz na te dokładne bugi):
  - **Resident Evil Requiem — zepsute/glitchujące włosy:** dodaj `RADV_DEBUG=nohiz %command%` do opcji uruchamiania (ta sama flaga RADV wymieniona powyżej, zastosowana tu konkretnie). ([synteza Reddit](https://www.reddit.com/r/BC250Gaming/))
  - **Spider-Man 2 / Assassin's Creed Shadows — zawieszenia:** włączenie **zswap** (kompresowany swap) podobno zatrzymuje zawieszenia. ([synteza Reddit](https://www.reddit.com/r/BC250Gaming/))

---

## Emulacja

Emulatory są ciężkie dla CPU, więc wyniki są mieszane, ale kilka jest solidnych ([src](https://t.me/c/2424231195/78988)):

- **Switch — Eden / Ryujinx:** działa dobrze i szybko. Zgłoszone przez społeczność (r/BC250Gaming): **Mario Kart ~60 FPS**; **Tears of the Kingdom ~30–40 FPS**. ✅ ([synteza Reddit](https://www.reddit.com/r/BC250Gaming/))
- **PS4 — shadPS4 (0.9.0+):** Bloodborne chodzi dobrze bez spadków; niektóre tytuły (The Last Guardian) artefaktują, ale trzymają stabilny FPS. ✅
- **PS3 — RPCS3:** działa, ale wymaga dostrajania per gra. ⚠️ **Znany dziwactwo** (zgłoszone przez społeczność, r/BC250Gaming): bug emulatora **blokuje GPU na 1000 MHz** pod RPCS3, więc GPU nie może podbić taktowania — obejściem jest **podkręcenie CPU, by skompensować** utracony zapas GPU. ([synteza Reddit](https://www.reddit.com/r/BC250Gaming/))
- **Xbox 360 — Xenia Canary:** menu się ładują, rozgrywka spada do czarnego ekranu (wciąż badane). ❌

---

## Gdzie zobaczyć to w akcji (wideo)

Społeczność wrzuca dużo wideo z rozgrywki/benchmarków. Kilka przechwytów w wątku i kanałów:

- Klipy rozgrywki/benchmarków BC-250: [youtu.be/CYDv1SfD2Pc](https://youtu.be/CYDv1SfD2Pc) · [youtu.be/g3uWOfqcexA](https://youtu.be/g3uWOfqcexA) · [youtu.be/9fozmRrAouc](https://youtu.be/9fozmRrAouc) · [youtu.be/q64M2XzADjA](https://youtu.be/q64M2XzADjA) · [youtu.be/0LEkOG1yqqw](https://youtu.be/0LEkOG1yqqw)
- Społecznościowy arkusz śledzenia przetestowanych gier (FPS/ustawienia): [Google Sheet](https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing)

---

## Ściągawka realistycznych oczekiwań

| Chcesz… | Rzeczywistość na zmoddowanym BC-250 @ 2000 MHz |
|-----------|--------------------------------------|
| 1080p AAA, 60 FPS | Czasem — zależy od obciążenia CPU. FSR + Frame Gen pomaga. Starsze/lżejsze AAA: tak. |
| 1440p AAA | 40–60 FPS w większości portów; GPU ma tu zapas. Najlepsza rozdzielczość pod względem wartości. |
| 4K AAA | 30–50 FPS z FSR w dobrze zoptymalizowanych/konsolowych portach (Forza, Witcher 3, KCD2). |
| Ray tracing | Tylko na minimum, niski FPS (Cyberpunk ~36 @ 1440p RT-min). Nie mocna strona płyty. |
| Zablokowane 60 wszędzie | Nie. Tytuły ograniczone przez CPU i obciążające fizykę będą spadać/zacinać się niezależnie od ustawień. |
| Porty PS first-party | Idealny przedział — to jest to, co płyta robi najlepiej. |

---

## Źródła

- Benchmark ograniczony przez CPU (38 FPS, 36.5 % GPU) — https://t.me/c/2424231195/136242
- Duża tabela benchmarków VRAM/taktowanie (Wukong, Tomb Raider, Dying Light 2, Cyberpunk, Guardians) — https://t.me/c/2424231195/81203
- Wukong 1080p High FSR+FG, śr. 96 — https://t.me/c/2424231195/10069
- Indiana Jones Great Circle, wiele rozdzielczości — https://t.me/c/2424231195/36931
- Forza Horizon 5 4K — https://t.me/c/2424231195/81891 · Witcher 3 4K — https://t.me/c/2424231195/81894 · KCD2 4K — https://t.me/c/2424231195/81893
- Wyniki odblokowania 40 CU (Doom Dark Ages 60 FPS) — https://t.me/c/2424231195/141193 · poprawka Doom — https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/
- TLOU II 1080p — https://t.me/c/2424231195/94237 · Resident Evil Requiem — https://t.me/c/2424231195/121772 · Gothic Remake zacinanie — https://t.me/c/2424231195/142708
- Lista portów first-party — https://t.me/c/2424231195/99563
- Podsumowanie emulacji — https://t.me/c/2424231195/78988
- Przebieg porównawczy RX 6600 dGPU — https://t.me/c/2424231195/116494
- Zgodność gier elektricM (ustawienia/FPS per gra, problematyczne gry, tabela RT, Proton i opcje uruchamiania, zyski FSR) — https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/
- Przechwyty FPS z YouTube (auto-napisy / ASR — liczby przybliżone): ETA Prime (Spider-Man 2, Forza H5, Left 4 Dead 2) — https://youtu.be/q_CxcbS5HI8 · „Temps Shocked Me" (Helldivers 2, Arc Raiders) — https://youtu.be/d7Hwqxn9yg8 · recenzja RU (Stalker 2, Metro Exodus) — https://youtu.be/19l03qneKJ4 · Pixels & Power (Palworld, RDR2, Elden Ring 30 FPS) — https://youtu.be/4S0DvIpqm0E
- Twarde blokady mesh-shader / sprzętowy-VRS (FF7 Rebirth, Doom: The Dark Ages Update 2) — [wątek r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- **Doom: The Dark Ages obejście VRS — `bangstk/Vulkan_NullVRS`** (warstwa Vulkan no-op dla `vkCmdSetFragmentShadingRateKHR`) — https://github.com/bangstk/Vulkan_NullVRS
- **Generowanie klatek LSFG na Linuksie — `lsfg-vk`** (warstwa Vulkan) — https://github.com/PancakeTAS/lsfg-vk
- **FSR 4 / XeSS przez DP4a (INT8) na RDNA2** — build OptiScaler FSR4 INT8: [VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/) · [wiki zgodności OptiScaler FSR4](https://github.com/optiscaler/OptiScaler/wiki/FSR4-Compatibility-List)
- **Oficjalny AMD FSR 4 dla RDNA2 (~początek 2027) / RDNA3 (lipiec 2026)** — [Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals)
- **Wyniki gier zgłoszone przez społeczność (r/BC250Gaming)** — Tekken 8, Street Fighter 6, Stellar Blade, RE Requiem Frame-Gen, Doom Eternal RT, Switch (Mario Kart / TOTK), blokada GPU 1000 MHz RPCS3, poprawki włosów RE Requiem / Spider-Man 2 / AC Shadows — https://www.reddit.com/r/BC250Gaming/
- Społecznościowy arkusz testów gier — https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing

> Taktowania i odblokowanie 40 CU żyją w [09-overclock-undervolt.md](09-overclock-undervolt.md); zrób moda [04-cooling.md](04-cooling.md) przed uruchomieniem 2000 MHz.
