> 🌐 Tłumaczenie społecznościowe. Wersja angielska jest źródłem prawdy i może być nowsza. Znalazłeś błąd? Zgłoś to w [zgłoszeniu (issue)](https://github.com/lildebil0/awesome-bc250/issues). ([oryginał angielski](../en/15-emulation.md))

# Emulacja

> **W skrócie** — BC-250 to zaskakująco dobra maszyna do emulacji, bo łączy GPU RDNA2 klasy PS5 z 16 GB szybkiej pamięci GDDR6 — ale emulacja jest **mocno ograniczona przez CPU**, a okrojony **6-rdzeniowy Zen 2** taktowany ~3.5 GHz stanowi sufit dla wymagających systemów. **Wszystko do PS2 / GameCube / Wii / PSP / Dreamcast włącznie to komfortowa strefa** (retro jest trywialne; PSP jest potwierdzone na czacie, działa w rozdzielczości wewnętrznej 4×). **Switch / PS3 / PS4 są wymagające i różnie bywa**, a **Xbox 360 ledwo się uruchamia**. Potwierdzone na czacie dla tej płyty: **Switch przez Eden** „działa dobrze i szybko", **PS3 przez RPCS3** działa przy strojeniu per gra, **PS4 przez shadPS4** dobrze uruchamia Bloodborne, **PSP przez PPSSPP** działa świetnie, a **Xbox 360 przez Xenia** jest zepsute w grze. **Najpierw podkręć i schłodź płytę** — bez „governora" GPU siedzi na ~1000 MHz wewnątrz emulatora i się dławi. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/130879))

Ta strona to szczegółowe omówienie; [11-gaming.md](11-gaming.md) ma wersję skróconą w swojej tabeli wyników. ROM-y/klucze/BIOS to twój problem do legalnego zdobycia — nic z tego nie jest tu omawiane.

> **Jak czytać kolumnę statusu.** Ta płyta była omawiana nierównomiernie: garść systemów przetestowano z pierwszej ręki na czacie, większości systemów retro nie. Więc każdy wiersz jest oznaczony:
> - **✅ / ⚠️ / ❌ (czat)** — członek uruchomił to *na BC-250* i zgłosił wynik, z cytowaną wiadomością.
> - **(general ⚠)** — **najlepiej znany emulator linuksowy i ogólne oczekiwanie wobec tej klasy sprzętu** (Zen 2 + RDNA2). **Nietestowane na BC-250.** Traktuj to jako „powinno być w porządku / powinno być trudno", nigdy jako zmierzoną obietnicę. Nigdzie na tej stronie nie zmyślono żadnych liczb FPS specyficznych dla BC-250.

---

## Zrób te dwie rzeczy, zanim cokolwiek wyemulujesz

Emulacja wzmacnia obie dziwactwa płyty, więc warunki wstępne mają tu większe znaczenie niż w zwykłym graniu:

1. **Najpierw podkręcanie.** Członek, który spróbował emulacji Switcha na fabrycznej płycie, zauważył GPU przypięte do **1000 MHz wewnątrz emulatora**, mimo że zwykłe gry taktowały się prawidłowo — rozwiązaniem było ręczne ustawienie „governora" na jego maksymalny zegar przed uruchomieniem. ([src](https://t.me/c/2424231195/130879)) Uruchom **oberon-governor** na **2000 MHz** (i rozważ OC CPU do 4 GHz), zgodnie z [09-overclock-undervolt.md](09-overclock-undervolt.md) — emulacja potrzebuje każdego megaherca, jaki CPU może dać.
2. **Najpierw chłodzenie.** 2000 MHz wymaga modyfikacji chłodzenia, inaczej płyta throttluje/resetuje się. Zrób [04-cooling.md](04-cooling.md), zanim ruszysz po podkręcenie.

> **Dlaczego ograniczenie przez CPU ma tu tak duże znaczenie.** Silnik gry jest dostrojony do sprzętu, na którym wychodzi; emulator zamiast tego *symuluje* CPU innej konsoli na twoim, co jest znacznie cięższe w przeliczeniu na klatkę. Na BC-250 **6 rdzeni Zen 2 taktowanych ~3.5 GHz** ([specyfikacja sprzętu](https://elektricm.github.io/amd-bc250-docs/hardware/specifications/)) są ogranicznikiem dla Switcha/PS3/PS4 — GPU klasy PS5 zwykle ma zapas mocy. Jeden członek goniący za lepszą wydajnością Switcha zobaczył dokładnie to: w grze **GPU siedzi mocno niewykorzystane, podczas gdy CPU jest ścianą**. ([src](https://t.me/c/2424231195/136712)) Więcej rdzeni nie pomaga gorącemu wątkowi emulatora; pomaga taktowanie zegara i IPC. To to samo wąskie gardło CPU opisane w [11-gaming.md](11-gaming.md), tylko ostrzejsze.

---

## Pierwsze kroki — trzy sposoby na instalację

Ta płyta nie ma żadnych dziwactw specyficznych dla emulacji poza dwoma warunkami wstępnymi powyżej — dla emulatorów to zwykły linuksowy PC. Wybierz jeden z:

- **EmuDeck** — najszybszy sposób na uzyskanie pełnej, wielosystemowej konfiguracji za jednym razem. Pobiera i wstępnie konfiguruje cały standalone'owy stos (RetroArch, PCSX2, Dolphin, DuckStation, PPSSPP, melonDS, Ryujinx, …), podłącza kontrolery i został potwierdzony jako działający na płycie („Ryujinx, który wychodzi z EmuDeck, też jest dobry"). ([src](https://t.me/c/2424231195/99039)) Celuje w Steam Deck / Linux, co pasuje do typowej instalacji Bazzite/CachyOS/Arch na BC-250 ([06-linux.md](06-linux.md)). **RetroDECK** (odpowiednik zamknięty we Flatpaku) to ten sam pomysł, jeśli wolisz jedną aplikację w piaskownicy.
- **RetroArch** — jeden front-end, wiele „rdzeni" (emulatory-jako-wtyczki). Idealny do wszystkiego 8/16/32-bitowego aż po PS1/N64/DS — zainstaluj raz, dodaj poniższe rdzenie, wskaż mu swoje ROM-y. Dostępny jako Flatpak na każdej dystrybucji BC-250.
- **Standalone'owe emulatory** — dla ciężkich systemów (Switch, PS3, PS4, PS2, GameCube/Wii, Xbox) dedykowana aplikacja standalone bije rdzeń RetroArch pod względem funkcji i kompatybilności. **Zainstaluj natywny build linuksowy** tam, gdzie się da — wczesne testy BC-250 pokazały, że natywne buildy (Ryujinx) zachowują się lepiej niż buildy windowsowe uruchamiane przez Proton. ([src](https://t.me/c/2424231195/23577)) Większość jest na Flathubie lub w Arch AUR (np. `paru -S cemu`). ([src](https://t.me/c/2424231195/74138))

Następnie **uruchom przez Steam** („dodaj grę spoza Steam") dla obsługi kontrolera i nakładki — ten sam przepływ, którego czat używa do wszystkiego innego (zobacz [11-gaming.md](11-gaming.md)).

> **Wolisz dedykowaną dystrybucję do emulacji?** **Batocera** (gotowa dystrybucja do emulacji + frontend) jest **potwierdzona przez społeczność jako działająca na BC-250** ([wątek społeczności r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)) — uruchom ją zamiast desktopowego Linuksa, a dostaniesz maszynę do emulacji w stylu konsoli, plug-and-play, zamiast instalować emulatory jeden po drugim. Jest wymieniona jako potwierdzona-uruchamiająca-się dystrybucja w [06-linux.md](06-linux.md). Te same warunki wstępne podkręcania + chłodzenia nadal obowiązują.

> **Pilnuj „governora".** Jeśli emulator działa wolno, sprawdź swoje zegary, zanim obwinisz emulator: może siedzieć na 1000 MHz. Ustaw oberon-governor na jego maksymalną wartość (niektórzy uruchamiają go przypiętego do ~2250 MHz) przed uruchomieniem, a potem zweryfikuj nakładką (`amdgpu_top` / MangoHud). ([src](https://t.me/c/2424231195/130879), [src](https://t.me/c/2424231195/130955))

> **Brak prekonfigurowanego obrazu do emulacji.** Nowicjusze regularnie proszą o gotowy obraz z ustawionymi emulatorami. Społeczność traktuje współdzielony „skonfigurowany obraz BC-250" jako tabu — ustaw go sam według poradników; to nie jest trudne, gdy płyta jest podkręcona. ([src](https://t.me/c/2424231195/130845), [src](https://t.me/c/2424231195/130877))

---

## Co społeczność faktycznie uruchomiła

Najbardziej przydatnym pojedynczym punktem danych jest podsumowanie jednego członka po przetestowaniu kilku emulatorów na płycie ([src](https://t.me/c/2424231195/78988)):

- **Switch (Eden)** — „działa dobrze i szybko".
- **PS3 (RPCS3)** — działa, ale „wymaga indywidualnego strojenia od gry do gry".
- **PS4 (shadPS4 0.9.0)** — Bloodborne działa dobrze bez spadków; The Last Guardian zaczął artefaktować, ale utrzymał stabilną liczbę klatek.
- **Xbox 360 (Xenia Canary)** — menu gier się uruchamiają, ale rozgrywka spada do czarnego ekranu (nadal reaguje na gamepad); nierozwiązane.

Więcej potwierdzeń z pierwszej ręki:

- **Switch / Eden to konsensusowy wybór.** Gdy nowicjusz zapytał, który emulator Switcha wziąć, odpowiedź była dosadna: **„Eden jest najbardziej przyzwoity."** ([src](https://t.me/c/2424231195/130842)) Inni potwierdzili, że **Eden instaluje się i działa dobrze** ([src](https://t.me/c/2424231195/98942)) oraz że **Eden działa świetnie, a Ryujinx, który wychodzi z EmuDeck, też jest dobry.** ([src](https://t.me/c/2424231195/99039)) Ciężkie tytuły first-party nadal obciążają CPU: członek grający w **Tears of the Kingdom na Eden (z NX Optimizer) zgłosił spadki klatek**. ([src](https://t.me/c/2424231195/124216))
- **PS4 / shadPS4** — jeden członek **sprzedał swoje fizyczne PS4 i teraz przechodzi ponownie Bloodborne na BC-250 przez shadPS4**, mówiąc, że „uruchamia się w 2 kliknięcia". ([src](https://t.me/c/2424231195/38704), [src](https://t.me/c/2424231195/38706)) Inny potwierdził, że **Drive Club działa w 100 %** na shadPS4. ([src](https://t.me/c/2424231195/82128))
- **PS3 / RPCS3** — poza podsumowaniem członkowie zgłosili **Uncharted ze „stabilną liczbą klatek, grywalne"** ([src](https://t.me/c/2424231195/74644)) oraz płaskie **„działa świetnie w RPCS3."** ([src](https://t.me/c/2424231195/53601))
- **PSP / PPSSPP** — wielokrotnie uruchamiane z pierwszej ręki i chwalone: jeden członek uruchomił **PPSSPP w rozdzielczości wewnętrznej 4×** bez throttlingu termicznego na płycie. ([src](https://t.me/c/2424231195/101579), [src](https://t.me/c/2424231195/103218), [src](https://t.me/c/2424231195/111096))

### Uwaga o historii emulatorów Switcha (Yuzu → Eden / Ryubing)

Emulacja Switcha na płycie przeszła ten sam wstrząs co wszędzie indziej. Wczesna migawka stanu rzeczy wykazała, że **Yuzu i Suyu zawieszają się przy uruchomieniu**, podczas gdy **Ryujinx działał** (natywne buildy). ([src](https://t.me/c/2424231195/23577)) Yuzu zostało zamknięte przez Nintendo w 2024 roku, a jego następcy niosą pochodnię dalej: **Eden** (fork Yuzu) to wybór społeczności BC-250, który „działa dobrze i szybko", a linia **Ryujinx** żyje dalej jako społecznościowy fork **Ryubing**, który pozostaje aktywnie rozwijany w 2026 roku. Zwróć uwagę, że Nintendo agresywnie pozywa emulatory Switcha i czyści klucze/linki do pobrania — w lutym 2026 wystawiło DMCA na Eden razem z kilkunastoma innymi forkami, więc spodziewaj się polowania zarówno na binaria, jak i na klucze. ([src](https://t.me/c/2424231195/136649))

---

## Pełna tabela kompatybilności — każda platforma

Jeden wiersz na platformę. **Emulator** to najlepszy obecny wybór linuksowy; **Status na BC-250** jest cytowany z czatu tam, gdzie członek to przetestował, w przeciwnym razie to ogólne oczekiwanie dla sprzętu Zen 2 + RDNA2 (oznaczone `general ⚠`, **niezmierzone na BC-250**).

### Nintendo

| System | Najlepszy emulator linuksowy | Status na BC-250 | Uwagi |
|--------|--------------------|------------------|-------|
| **NES / Famicom** | Mesen (lub FCEUmm) — rdzeń RetroArch | ✅ Trywialne (general ⚠) | 8-bit; każdy ziemniak to uruchomi. Nie potrzeba raportu z BC-250. |
| **SNES** | Snes9x (bsnes dla dokładności) — RetroArch | ✅ Trywialne (general ⚠) | Snes9x jest szybki i ~99 % kompatybilny; bsnes, jeśli chcesz dokładności cyklicznej. |
| **Game Boy / GBC** | SameBoy / Gambatte — RetroArch | ✅ Trywialne (general ⚠) | SameBoy to wybór pod dokładność. |
| **GBA** | mGBA (standalone lub RetroArch) | ✅ Trywialne (general ⚠) | mGBA to złoty standard. |
| **N64** | simple64 / RMG (mupen64plus); rdzeń RetroArch | ✅ Łatwe (general ⚠) | simple64 jest zarchiwizowany; jego deweloper przeszedł na **gopher64** (Rust). RMG albo gopher64 są w porządku. Komfortowe na tym CPU. |
| **DS** | melonDS (standalone lub RetroArch) | ✅ Łatwe (general ⚠) | melonDS dawno zastąpił DeSmuME. |
| **3DS** | **Azahar** (połączenie Citra/Lime3DS) | ✅ Powinno być łatwe (general ⚠) | Citra dostała DMCA; **Azahar** to utrzymywany następca. Komfortowe dla tego sprzętu. |
| **GameCube** | **Dolphin** | ✅ Powinno działać świetnie (general ⚠) | Dolphin jest dojrzały i akcelerowany przez Vulkan. Wspomniany na czacie (multi-okno/CLI), ale nie podano FPS z pierwszej ręki — traktuj jako łatwe, nie zmierzone. ([src](https://t.me/c/2424231195/19715)) |
| **Wii** | **Dolphin** | ✅ Powinno działać dobrze (general ⚠) | Ten sam build Dolphina. Komfortowa epoka dla BC-250; nie zbenchmarkowane na BC-250 na czacie. |
| **Wii U** | **Cemu** (natywny Linux, open-source) | ⚠ Pytane, niepotwierdzone | Członek pytał o uruchomienie go (a `cemu` jest w AUR), ale **nie opublikowano żadnego działającego wyniku z BC-250**. Cemu jest cięższy niż Dolphin — zweryfikuj sam. ([src](https://t.me/c/2424231195/68253), [src](https://t.me/c/2424231195/74138)) |
| **Switch** | **Eden** (następca Yuzu) | ✅ Działa dobrze i szybko (czat) | Wybór nr 1 społeczności. Ustaw „governor" na max przed uruchomieniem. Niektóre tytuły wychodzą zablokowane na 30 FPS i potrzebują łatki 60 FPS (np. Zelda); ciężkie tytuły first-party (TOTK) nadal gubią klatki — ograniczone przez CPU. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/130842), [src](https://t.me/c/2424231195/124216), [src](https://t.me/c/2424231195/130887)) |
| **Switch** | **Ryujinx** (teraz fork **Ryubing**) | ✅ Działa (czat) | Natywne buildy uruchamiały się pomyślnie; Ryujinx dołączony do EmuDeck jest „też dobry". ([src](https://t.me/c/2424231195/51606), [src](https://t.me/c/2424231195/99039)) |
| **Switch** | Yuzu / Suyu | ❌ Zepsute przy uruchomieniu — legacy (czat) | Wczesne raporty: zawieszał się przy starcie gry. Yuzu jest porzucone — używaj Eden. ([src](https://t.me/c/2424231195/23577)) |

### Sony

| System | Najlepszy emulator linuksowy | Status na BC-250 | Uwagi |
|--------|--------------------|------------------|-------|
| **PS1** | **DuckStation** (standalone lub RetroArch) | ✅ Trywialne (general ⚠) | DuckStation to nowoczesny standard; funkcje ulepszeń za darmo. |
| **PS2** | **PCSX2** (v2.x, Qt + Vulkan) | ✅ Powinno działać dobrze (general ⚠) | 98 %+ kompatybilności, klasyczny cel „łatwej emulacji". Nie zbenchmarkowane z pierwszej ręki na BC-250 na czacie — ale spokojnie w klasie tego sprzętu. |
| **PSP** | **PPSSPP** | ✅ Działa świetnie — rozdz. 4× (czat) | Z pierwszej ręki: działał w rozdzielczości wewnętrznej 4× bez throttlingu. Jeden z najbardziej komfortowych systemów na płycie. ([src](https://t.me/c/2424231195/101579), [src](https://t.me/c/2424231195/103218), [src](https://t.me/c/2424231195/111096)) |
| **PS Vita** | **Vita3K** | ⚠ Eksperymentalne (general ⚠) | Vita3K to jedyny emulator Vity i nadal wczesny wszędzie; spodziewaj się psucia per gra. Brak raportu z BC-250. (Wypowiedź z czatu „w zasadzie maksymalnie podkręcone PS Vita" dotyczyła sprzętu, nie emulatora. ([src](https://t.me/c/2424231195/86140))) |
| **PS3** | **RPCS3** | ⚠️ Działa, strojenie per gra (czat) | Najbardziej karzący CPU spośród realistycznych celów. Zgłoszono Uncharted „stabilne, grywalne", „działa świetnie"; wczesny tester natrafił na błędy. Wymaga dostrajania tytuł po tytule. Istnieje społecznościowy film-przewodnik po PS3. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/74644), [src](https://t.me/c/2424231195/53601), [src](https://t.me/c/2424231195/13)) |
| **PS4** | **shadPS4** (0.9.0+; 0.16 w 2026) | ✅ Bloodborne / Drive Club grywalne (czat) | „Uruchamia się w 2 kliknięcia." Bloodborne płynne i bez spadków; Drive Club 100 %; niektóre tytuły artefaktują, ale trzymają FPS. Per gra. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/38706), [src](https://t.me/c/2424231195/82128)) |

### Microsoft

| System | Najlepszy emulator linuksowy | Status na BC-250 | Uwagi |
|--------|--------------------|------------------|-------|
| **Xbox (OG)** | **xemu** | ⚠ Powinno działać (general ⚠) | xemu jest LLE z ~80 % grywalnych gier; natywny linuksowy AppImage. Brak raportu z BC-250 — ale lekki cel dla tego CPU. Zweryfikuj per gra. |
| **Xbox 360** | **Xenia** (stock) | ⚠️ Uruchamia się, niska wyd. (czat) | Zwykła Xenia działa, ale „wydajność na stocku jest na podłodze" — podkręcanie jest obowiązkowe. ([src](https://t.me/c/2424231195/23577)) |
| **Xbox 360** | **Xenia Canary** | ❌ Czarny ekran w grze (czat) | Menu się ładują i gamepad reaguje, ale rozgrywka to czarny ekran. Na Linuksie backend Vulkan jest nadal niekompletny. Nierozwiązane. ([src](https://t.me/c/2424231195/78988)) |

### Sega

| System | Najlepszy emulator linuksowy | Status na BC-250 | Uwagi |
|--------|--------------------|------------------|-------|
| **Master System** | Genesis Plus GX — RetroArch | ✅ Trywialne (general ⚠) | Jeden rdzeń obsługuje SMS/Genesis/Game Gear/SG-1000/Sega CD. |
| **Genesis / Mega Drive** | Genesis Plus GX (BlastEm dla dokładności) | ✅ Trywialne (general ⚠) | Trywialne dla tego sprzętu. |
| **Game Gear** | Genesis Plus GX — RetroArch | ✅ Trywialne (general ⚠) | Ten sam multi-rdzeń Sega. |
| **Saturn** | **Mednafen/Beetle Saturn** (lub Kronos) | ✅ Powinno być w porządku (general ⚠) | Saturn jest słynnie ciężki do emulacji pod CPU, ale trywialny dla Zen 2. Brak raportu z BC-250. |
| **Dreamcast** | **Flycast** (standalone lub RetroArch) | ✅ Powinno działać dobrze (general ⚠) | Flycast jest dojrzały i lekki; komfortowy na tym sprzęcie. Nie zbenchmarkowany na czacie. |

### Inne / arcade / komputery

| System | Najlepszy emulator linuksowy | Status na BC-250 | Uwagi |
|--------|--------------------|------------------|-------|
| **Arcade / MAME** | **MAME** (lub FinalBurn Neo) — RetroArch | ✅ Łatwe dla większości (general ⚠) | FBNeo dla popularnych zestawów; pełny MAME na wszystko. Ciężkie płyty arcade z końca lat 90. / 3D nadal mogą być wymagające. |
| **Neo Geo** | **FinalBurn Neo** — RetroArch | ✅ Trywialne (general ⚠) | FBNeo to wybór pod Neo Geo / CPS. |
| **TurboGrafx-16 / PC Engine** | **Beetle PCE** — RetroArch | ✅ Trywialne (general ⚠) | Rdzeń Beetle/Mednafen PCE. |
| **Atari (2600/5200/7800/ST/…)** | Stella / RetroArch (Atari800, Hatari) | ✅ Trywialne (general ⚠) | Stella dla 2600; rdzenie istnieją dla reszty. |
| **DOS** | **DOSBox** (DOSBox-Staging / DOSBox-X) | ✅ Trywialne (general ⚠) | Albo rdzeń DOSBox-Pure dla RetroArch. |
| **ScummVM** | **ScummVM** (natywny Linux) | ✅ Trywialne (general ⚠) | Reimplementacja silnika, nie emulacja — działa wszędzie. |

> ✅ działa / trywialne · ⚠️ działa z zastrzeżeniami · ❌ zepsute · **(czat)** = raport z pierwszej ręki z BC-250 (cytowany) · **(general ⚠)** = najlepszy emulator linuksowy + oczekiwanie dla tej klasy sprzętu, **nietestowane na BC-250**.

---

## Realistyczne oczekiwania — co jest łatwe, a co trudne

| Poziom | Systemy | Rzeczywistość na schłodzonym BC-250 na 2000 MHz |
|------|---------|--------------------------------------|
| **Komfortowe** | NES · SNES · GB/GBC/GBA · N64 · DS · 3DS · **PS1 · PS2 · PSP** · Genesis/SMS/Game Gear · Saturn · Dreamcast · Arcade/Neo Geo/PCE · Atari · DOS · ScummVM · **GameCube · Wii** | Słodki punkt płyty. Retro jest trywialne; PSP jest potwierdzone na czacie w rozdz. 4×; PS2/GC/Wii są spokojnie w klasie tego sprzętu (ogólne oczekiwanie — zbenchmarkuj własne wymagające tytuły). Użyj EmuDeck lub RetroArch i jazda. |
| **Wymagające / różnie bywa** | **Switch · PS3 · PS4** | Realne, ale ograniczone przez CPU i per gra. Switch (Eden) „dobrze i szybko", ale ciężkie first-party gubi klatki; PS4 (shadPS4) świetne dla odpowiednich tytułów (Bloodborne); PS3 (RPCS3) działa, ale wymaga strojenia per gra. Najpierw ustaw „governor" na max. |
| **Ledwo / jeszcze nie** | **Xbox 360** · Wii U · PS Vita | Xenia uruchamia menu, a potem czarny ekran w rozgrywce (czat). Wii U (Cemu) i Vita (Vita3K) są niepotwierdzone na płycie i ogólnie wymagające/eksperymentalne — zweryfikuj, zanim na nich polegniesz. |
| **Doświadczenie bez zachodu, bez OC** | (dowolny wymagający system) | Nie. Bez podkręcenia GPU obniża zegary wewnątrz emulatorów i nawet Switch się dławi. Najpierw zrób OC + chłodzenie. |

---

## Źródła

- Podsumowanie emulatorów (Switch/Eden, PS3/RPCS3, PS4/shadPS4, Xbox360/Xenia) — https://t.me/c/2424231195/78988
- „Eden jest najbardziej przyzwoity" — https://t.me/c/2424231195/130842 · Eden instaluje się i działa — https://t.me/c/2424231195/98942 · Eden + EmuDeck Ryujinx — https://t.me/c/2424231195/99039 · Ryujinx działał — https://t.me/c/2424231195/51606 · TOTK na Eden gubi klatki (NX Optimizer) — https://t.me/c/2424231195/124216 · CPU jest ścianą, GPU niewykorzystane — https://t.me/c/2424231195/136712
- Wczesny stan emulatorów (Yuzu/Suyu zawieszają się, Ryujinx ok, Xenia niska, RPCS3 błędy) — https://t.me/c/2424231195/23577
- PS4/shadPS4 Bloodborne („2 kliknięcia") — https://t.me/c/2424231195/38704 · https://t.me/c/2424231195/38706 · Drive Club 100 % — https://t.me/c/2424231195/82128
- PS3/RPCS3 Uncharted stabilne i grywalne — https://t.me/c/2424231195/74644 · „działa świetnie w RPCS3" — https://t.me/c/2424231195/53601 · film-przewodnik po emulacji PS3 — https://t.me/c/2424231195/13
- PSP/PPSSPP działał (rozdzielczość 4×, bez throttlingu) — https://t.me/c/2424231195/101579 · https://t.me/c/2424231195/103218 · https://t.me/c/2424231195/111096
- Wii U/Cemu pytane na kernelu 6.15+ — https://t.me/c/2424231195/68253 · cemu przez AUR (paru) — https://t.me/c/2424231195/74138
- Dolphin z terminala — https://t.me/c/2424231195/19715 · „w zasadzie maksymalnie podkręcone PS Vita" (sprzęt, nie emulator) — https://t.me/c/2424231195/86140
- „Governor" utknął na 1000 MHz w emulatorze; ustaw max ręcznie — https://t.me/c/2424231195/130879 · https://t.me/c/2424231195/130955 · łatka Zelda 30→60 — https://t.me/c/2424231195/130887
- Brak prekonfigurowanego obrazu (tabu społeczności) — https://t.me/c/2424231195/130845 · https://t.me/c/2424231195/130877
- Nintendo pozywa emulatory Switcha / klucze trudno znaleźć — https://t.me/c/2424231195/136649
- Batocera (dystrybucja do emulacji) potwierdzona jako działająca na BC-250 — [wątek r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- Specyfikacja sprzętu (6× Zen 2 @ ~3.5 GHz, RDNA2 24→40 CU, 16 GB GDDR6) — [elektricm/amd-bc250-docs](https://elektricm.github.io/amd-bc250-docs/hardware/specifications/)
- Ogólne ujęcie możliwości emulacji (⚠ zweryfikuj; ten zewnętrzny poradnik błędnie liczy rdzenie jako 8) — [poradnik koukan.co.uk BC-250](https://www.koukan.co.uk/blog/amd-bc-250-guide)

> Podkręcenie, od którego zależą te wyniki, mieszka w [09-overclock-undervolt.md](09-overclock-undervolt.md); zrób modyfikację z [04-cooling.md](04-cooling.md), zanim uruchomisz 2000 MHz. Po szerszy obraz grania i wyjaśnienie ograniczenia przez CPU zobacz [11-gaming.md](11-gaming.md); po instalację systemu, na którym działają emulatory, zobacz [06-linux.md](06-linux.md).
