> 🌐 Tłumaczenie społecznościowe. Wersja angielska jest źródłem prawdy i może być nowsza. Znalazłeś błąd? Zgłoś to w [zgłoszeniu (issue)](https://github.com/lildebil0/awesome-bc250/issues). ([oryginał angielski](../en/07-windows.md))

# Sterowniki i konfiguracja Windows

> **W skrócie** — Na **początku 2026 nie istnieje działający sterownik GPU dla BC-250 pod Windows.** Windows instaluje się i uruchamia, ale GPU stoi z **Code 43** i zerową akceleracją 3D — każdy gotowy sterownik AMD (Adrenalin, Pro, sztuczka z `.inf` od W5700) jest odrzucany przez sprzęt. Społeczność **tworzy go od zera metodą inżynierii wstecznej**, a uczciwy stan to „podstawowa hydraulika działa, ale nic jeszcze nie renderuje gier". Jeśli chcesz dziś naprawdę *używać* tej płyty, **zainstaluj Linuksa** ([06-linux.md](06-linux.md)) — to tam żyje działający sterownik. Traktuj wszystko na tej stronie ze sceptycyzmem i sprawdzaj daty commitów w repo, zanim temu zaufasz.

Od dawna utrzymujący się werdykt społeczności, przypięty dla nowicjuszy od 2025 roku: *„Porzućcie wszelką nadzieję, wy, którzy tu wchodzicie. Sterowniki pod Windows nie powstaną z prawdopodobieństwem 99,5%. Bez sterownika ta płyta jest prawie całkowicie bezużyteczna. Sterownik linuksowy istnieje — jeśli nie jesteś gotowy na ten system, ta płyta nie jest ci potrzebna."* ([src](https://t.me/c/2424231195/28109))

To był konsensus przez ponad rok. W 2026 jest on **wreszcie podważany** — ale powoli, i uczciwa odpowiedź wciąż brzmi: jeszcze nie.

---

## Dlaczego Windows jest tu trudny (ściana Code 43)

APU BC-250 („Cyan Skillfish" / Oberon, GFX10.1.3) przedstawia się systemowi jako **nieznane urządzenie** — PCI ID `1002:13FE` — którego nie rozpoznaje żaden dostarczany sterownik AMD. Ludzie próbowali wszystkiego:

- **Wmuszanie oficjalnego `.inf`** do Menedżera urządzeń: jedyny sterownik, który Windows oferuje jako „zgodny", to **Radeon Pro W5700**. Instaluje się, a potem zawisa na **Error 43**, dokładnie jak każdy inny próbowany sterownik. ([src](https://t.me/c/2424231195/57123))
- **Edytowanie `.inf` / podmiana ID urządzeń** (gfx1013, 1014, Navi 21/22/23 „Dragonball", wpisy legacy), wyłączanie wymuszania podpisu sterownika, a nawet uruchamianie Windows 10 z USB i próba sterownika ze Steam Decka — **wszystko to ślepe zaułki**. Wpisy legacy pokazują się bez błędu tylko z powodu błędu wyświetlania, a nie dlatego, że działają. ([src](https://t.me/c/2424231195/94029))
- **Modyfikacja BIOS-u** w celu zmiany ID urządzenia też nie pomogła — iGPU nadal raportuje `1002:13FE`. Dev ID wydaje się być **wlutowany w APU**, a nie tylko w BIOS, więc załatanie jednego miejsca nie wystarczy. ([src](https://t.me/c/2424231195/57123))

Dlaczego Linux działa, a Windows nie? Na Linuksie otwartoźródłowy stos **amdgpu/Mesa** został załatany przez społeczność (i częściowo trafił do upstreamu), aby rozpoznawać dokładnie ten układ; na Windows nie ma otwartego sterownika do załatania — AMD nigdy nie dostarczyło sterownika windowsowego dla tej koparkowo-serwerowej części, a zamknięty stos Adrenalin/Pro odrzuca nieznane ID. ([src](https://t.me/c/2424231195/13210)) Własny wątek AMD na forum o „sterownikach BC-250" donikąd nie zaprowadził. ([community.amd.com](https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692))

> **Nie ma też furtki ucieczki przez przekazanie GPU (passthrough).** Uruchomienie Windowsa w maszynie wirtualnej z przekazanym BC-250 nie działa: ścieżka passthrough IOMMU jest na tej płycie zepsuta, a do tego to *APU* (a nie osobna karta, którą host może czysto oddać), i układ jest na wstępie błędnie wykrywany jako nieznane urządzenie. ([src](https://t.me/c/2424231195/64772))

---

## Aktualny stan sterowników — co naprawdę istnieje (na początku 2026)

Pod koniec 2025 społeczność przestała czekać na AMD i zaczęła **budować sterownik windowsowy od zera** metodą inżynierii wstecznej sprzętu. Liczą się dwa przedsięwzięcia; oba są **eksperymentalne, w toku (WIP) i jeszcze nie renderują gier.**

### Keshas-dev — sterownik WDDM tworzony od zera (najbardziej aktywny)

Para współpracujących sterowników trybu jądra, najaktywniej rozwijane windowsowe przedsięwzięcie (**sam sterownik PSP ma ~56 commitów** w chwili pisania):

- **[Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver)** — niskopoziomowy sterownik dla **PSP** (Platform Security Processor). **Co działa:** ładuje się, uruchamia firmware **SOS**, czyta/zapisuje rejestry sprzętowe przez BAR5 MMIO (bloki GC, MMHUB, HDP, NBIO, DF), wykonuje odblokowanie NBIO i działa jako proxy rejestrów dla sterownika GPU. **Co nie działa:** tworzenie pierścienia GPCOM (firmware SOS nie wspiera protokołu pierścienia TOS), ładowanie firmware GPU przez bufor pierścieniowy oraz inicjalizacja Trusted Memory Region. Innymi słowy: potrafi rozmawiać z układem, ale **nie potrafi jeszcze podnieść silnika graficznego.** ([repo](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver/commits/main/))
- **[Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver)** — towarzyszący sterownik GPU. Dzieli tę samą infrastrukturę certyfikatów / podpisu testowego co sterownik PSP i używa go jako mostka rejestrów. Wciąż wczesny; brak użytecznego wyjścia 3D. ([repo](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver/commits/main/))

Pierwszą publiczną oznaką życia był członek raportujący **„mój pierwszy działający sterownik (OpenGL 1.1)"** w październiku 2025 ([src](https://t.me/c/2424231195/83320)) — świętowane właśnie dlatego, że nawet ledwo funkcjonalny sterownik *instalujący się i działający* był prawdziwym kamieniem milowym po roku Code 43: *„jeśli ten sterownik naprawdę się zainstalował i działa (nawet źle) — to ogromny krok."* ([src](https://t.me/c/2424231195/83332)) Zrzut sterownika z tej fali, `AMD Radeon BC-250 (Cyan Skillfish) driver 00.00.01.7z`, został udostępniony/przypięty na czacie. ([src](https://t.me/c/2424231195/83322)) **Traktuj każdy taki wczesny zrzut jako eksperymentalny — wersja `00.00.01` jest dokładnie tak surowa, jak brzmi.**

### ZEROAESQUERDA — referencyjna implementacja WDDM 2.0

**[ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest)** — osobne przedsięwzięcie („Portugalczyk coś zaczął"), przypięte na czacie w marcu 2026 jako znak, że lody pękają. ([src](https://t.me/c/2424231195/123644)) Najlepiej rozumieć je jako **referencyjną/edukacyjną implementację WDDM 2.0**, a nie użyteczny sterownik:

- Implementuje tylko **Direct3D 9 DDI**; **D3D11, D3D12 i Vulkan nie są zaimplementowane.**
- **Kompilacja shaderów dla RDNA2 (ISA GFX10.1) nie działa** — przyjmuje zgłoszenia shaderów, ale nie potrafi ich skompilować dla rzeczywistego sprzętu, więc nic się nie renderuje.
- **Nie** ładuje mikrokodu procesora poleceń (Command Processor) (polega na firmware ładowanym przez BIOS); **kodowanie/dekodowanie wideo VCN niewspierane**; wyłącznie pojedyncze wyjście DisplayPort.
- Wymaga **trybu podpisu testowego** (brak podpisu WHQL). Tylko ~2 commity na main.

Zanim poświęcisz na to czas, zobacz własną sekcję projektu **[Znane ograniczenia](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas)**.

> ⚠ **Sprostowanie nazwy repo.** Główna lista repozytoriów wskazuje na `ZEROAESQUERDA/PS5GPU-BC250` pod „Drivers → Windows". Po sprawdzeniu to repo okazuje się być **linuksowym governorem GPU** (forkiem Oberon-governora z GUI), a **nie** sterownikiem windowsowym. Właściwy kod windowsowy tego autora to **`BC250-windowsDriverTest`**.

### Stan w skrócie

| Projekt | Typ | Co działa | Co nie działa | Używać dziś? |
|---|---|---|---|---|
| Keshas-dev/AMD-BC-250-PSP-Driver | sterownik jądra PSP (WIP) | Uruchamia firmware SOS, odczyt/zapis rejestrów BAR5, odblokowanie NBIO, proxy rejestrów | Tworzenie pierścienia GPU, ładowanie FW, inicjalizacja TMR | Nie — tylko hydraulika |
| Keshas-dev/AMD-BC-250-Windows-Driver | sterownik GPU (WIP) | Ładuje się obok sterownika PSP | Brak użytecznego 3D | Nie |
| ZEROAESQUERDA/BC250-windowsDriverTest | referencja WDDM 2.0 | Rusztowanie modelu sterownika, obecne D3D9 DDI | Kompilacja shaderów, D3D11/12, Vulkan, VCN | Nie — edukacyjne |
| Adrenalin / Pro / `.inf` od W5700 | Oficjalny AMD | — | **Code 43**, nic | Nie |

**W skrócie:** dziś nikt nie gra w gry pod Windows na BC-250. Praca jest realna i przyspiesza, ale jest na etapie „czy w ogóle damy radę zainicjalizować GPU", a nie „ile mam FPS w Cyberpunku".

---

## Jeśli mimo wszystko chcesz spróbować sterowników WIP

To dla majsterkowiczów, którzy chcą **pomóc testować**, a nie dla uzyskania działającego pulpitu. Będziesz potrzebować:

- **Windows 10 (build 1607+) lub Windows 11, x64.**
- **Włączonego podpisu testowego (test signing)** i **wyłączonego Secure Boot** (te sterowniki są niepodpisane / podpisane testowo):
  ```
  bcdedit /set testsigning on
  ```
  Zrestartuj. ⚠ zweryfikuj — dokładne kroki podaje README każdego repo; komendy tutaj to standardowy przepływ podpisu testowego WDK, a nie skopiowane ze skryptu projektu.
- Zainstaluj przez dostarczony przez repo **skrypt PowerShell** (np. `Install-Driver.ps1`) lub ręcznie przez `pnputil`. Kieruj się **README repo**, a nie tą stroną — te projekty zmieniają się szybko, a kroki instalacji przesuwają się wraz z nimi.

Oczekuj: w najlepszym razie urządzenie się wyliczy i pojawią się logi wczesnej inicjalizacji; w najgorszym nic się nie zmieni albo dostaniesz inny kod błędu. **Zrób kopię zapasową wszystkiego, na czym ci zależy, i zakładaj, że nic nie wyrenderuje.**

### ⚠ Niezweryfikowana plotka: „wyciek sterowników brickuje płytę"

Podczas wczesnej fazy beta-testów na początku 2025 członek ostrzegał, że **BC-250 były zdalnie brickowane za wyciek przedpremierowych sterowników** — twierdząc o doniesieniach z Reddita o brickowaniu, zdalnym blokowaniu urządzeń, i że nawet programator sprzętowy nie potrafił ich odblokować. ([src](https://t.me/c/2424231195/26231)) **Nie udało nam się tego zweryfikować**, a całe otaczające to ramowanie „prywatnej bety" jest wątpliwe (zobacz następną sekcję). Wspomniane dla kompletności; nie traktuj tego jako ustalonego faktu. Jeśli zbrickujesz płytę z niezwiązanych powodów, zobacz [08-bios.md](08-bios.md) w sprawie odzyskiwania.

---

## Mistyfikacje, żarty i ślepe zaułki — nie daj się na nie nabrać

Hype wokół sterowników windowsowych dla BC-250 ma długą historię **żartów i pobożnych życzeń**. Poznaj te słynne, żeby nie zmarnować weekendu:

- **„Sterownik NVIDIA dla AMD BC-250".** Żart **prima aprilisowy (1 kwietnia 2026)** — efektowny fałszywy baner „NVIDIA NEW DRIVER RELEASE … for AMD BC-250", który na chwilę sprawił, że ludzie pytali *„czy NVIDIA naprawdę wydała sterownik BC-250 pod Windows?!"* ([src](https://t.me/c/2424231195/130053)) Nie wydała. NVIDIA nie robi sterowników dla APU od AMD. Reakcja na czacie brzmiała *„długo wyczekiwany żart nadszedł."* ([src](https://t.me/c/2424231195/130727)) Zwróć też uwagę na `.exe` nazwany w stylu `whql-amd-software-adrenalin-edition-25.5.1-...-bc250.exe`, który krążył — normalny instalator Adrenalin z dopisanym do nazwy pliku „bc250" **nie** czyni go sterownikiem BC-250. ([src](https://t.me/c/2424231195/73924))
- **„Wymuś po prostu instalację sterownika podobnej karty".** RX 6700 / W5700 / Radeon Pro V340 — pierwszy pomysł każdego nowicjusza, który przyszedł do głowy *„każdemu głupcowi, który kiedykolwiek trzymał BC-250"*. Nie może zadziałać z całego stosu powodów niewartych ponownego wyprowadzania: **na BC-250 nie ma sterowników windowsowych, nie ma honoru ani piwa.** ([src](https://t.me/c/2424231195/29710))
- **Malware na kanale.** Ludzie wrzucali fałszywe „sterowniki", które były wirusami / zip-bombami / phisherami. Moderatorzy banują na pierwszy rzut oka; raz pojawił się plik nazwany dosłownie `Trojan.txt`. ([src](https://t.me/c/2424231195/49668)) **Uruchamiaj binaria tylko z wymienionych repozytoriów GitHub i czytaj kod.**

---

## A co ze skryptem odblokowania 40 CU, o którym ludzie wspominają?

`git clone https://github.com/duggasco/bc250-40cu-unlock.git` pojawia się w rozmowach na temat Windows, a główna lista zasobów nawet taguje go pod „Windows". **To linuksowy patch / skrypt jądra `amdgpu`** (`bc250-enable-40cu.sh`), a nie narzędzie windowsowe — odblokowuje wszystkie 40 CU na sterowniku linuksowym. Jest porządnie omówiony w [09-overclock-undervolt.md](09-overclock-undervolt.md); pod Windows nie robi nic. ⚠ zweryfikuj (żadna historia powłoki z korpusu Command nie potwierdza użycia pod Windows; jedyna uchwycona komenda to zwykłe `git clone` powyżej).

---

## Rekomendacja

| Chcesz… | Zrób to |
|---|---|
| Grać w gry / naprawdę używać płyty teraz | **Zainstaluj Linuksa.** Zobacz [06-linux.md](06-linux.md). Działający sterownik GPU istnieje tylko tam. |
| Śledzić / współtworzyć windowsowe przedsięwzięcie | Obserwuj **Keshas-dev** (sterownik PSP + GPU) oraz **ZEROAESQUERDA/BC250-windowsDriverTest**; oczekuj pracy nad jądrem / WDK, a nie grania. |
| Magiczny `.inf` lub sterownik „podobnej karty" | Takiego nie ma. Zatrzymaj się tutaj — trafisz tylko na Code 43. |

Wsparcie dla Windows to **ruchomy cel**: zanim zaczniesz działać, sprawdź ponownie daty commitów w repo oraz datę tej sekcji (odzwierciedla **początek 2026**). Werdykt z 2025 brzmiał „nigdy"; 2026 obniżyło to do „jeszcze nie" — realny postęp, ale postęp na warstwie inicjalizacji firmware, a nie grywalnego pulpitu.

---

## Źródła

- Przypięte ostrzeżenie dla nowicjuszy („porzućcie wszelką nadzieję") — https://t.me/c/2424231195/28109
- Code 43 / `.inf` od W5700 / próby modyfikacji BIOS — https://t.me/c/2424231195/57123 · https://t.me/c/2424231195/94029
- „Brak sterowników windowsowych, brak honoru, brak piwa" — https://t.me/c/2424231195/29710 · dlaczego Linux, a nie Windows — https://t.me/c/2424231195/13210
- Passthrough w VM nie zadziała — https://t.me/c/2424231195/64772
- Pierwszy „działający" sterownik (OpenGL 1.1) i reakcja — https://t.me/c/2424231195/83320 · https://t.me/c/2424231195/83332 · zrzut sterownika `00.00.01` — https://t.me/c/2424231195/83322
- Projekt ZEROAESQUERDA przypięty / „lody pękają" — https://t.me/c/2424231195/123644
- Prima aprilis „sterownik NVIDIA" — https://t.me/c/2424231195/130053 · https://t.me/c/2424231195/130727 · błędnie oznaczony `.exe` Adrenalin — https://t.me/c/2424231195/73924
- Polityka banowania malware — https://t.me/c/2424231195/49668 · plotka o brickowaniu za wyciek (niezweryfikowana) — https://t.me/c/2424231195/26231
- Repozytoria — [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) · [Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver) · [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) ([known limitations](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas))
- Wątek na forum AMD (donikąd nie zaprowadził) — https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692
- Odblokowanie 40 CU (Linux, błędnie otagowane jako Windows) — https://github.com/duggasco/bc250-40cu-unlock → zobacz [09-overclock-undervolt.md](09-overclock-undervolt.md)

> Odblokowanie 40 CU, governor i konfiguracja sterownika linuksowego żyją w [06-linux.md](06-linux.md) i [09-overclock-undervolt.md](09-overclock-undervolt.md). Odzyskiwanie po bricku: [08-bios.md](08-bios.md).
