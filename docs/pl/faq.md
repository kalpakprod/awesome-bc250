> 🌐 Tłumaczenie społecznościowe. Wersja angielska jest źródłem prawdy i może być nowsza. Znalazłeś błąd? Zgłoś to w [zgłoszeniu (issue)](https://github.com/lildebil0/awesome-bc250/issues). ([oryginał angielski](../en/faq.md))

# FAQ

> **W skrócie** — Pytania, które początkujący zadają w pierwszym tygodniu, z krótkimi poprawnymi odpowiedziami i odnośnikiem do pełnej sekcji dla każdego z nich. Jeśli odpowiedź wydaje się za krótka, to celowo — głębia kryje się na podlinkowanej stronie podręcznika.

To szybki przewodnik. Po prowadzoną ścieżkę „płyta w pudełku → uruchomione gry” zacznij od [00-start-here.md](00-start-here.md).

---

## Sprzęt i co kupiłem

**Czym właściwie jest BC-250?**
APU wywodzące się z PlayStation 5 (AMD **Cyan Skillfish** / Oberon) na płycie koparkowej/serwerowej: **6-rdzeniowy/12-wątkowy CPU Zen 2 + GPU RDNA 2 z 24 CU + 16 GB wlutowanej GDDR6**. To nie karta graficzna ani normalny komputer — brak slotu PCIe, brak 24-pinowego ATX, brak znajomego BIOS-u. Zobacz [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Czy działa „podłącz i graj”? Czy powinienem był to kupić?**
Nie. Wymaga pracy ze sterownikami, modyfikacji chłodzenia i nietypowego zasilania — to płyta dla majsterkowicza. Jak to ujął jeden z weteranów: „wymaga pewnych umiejętności, wysiłku i głowy”. Jeśli chcesz zero kłopotów, oddaj ją; jeśli lubisz projekty, to najtańszy w tej półce komputer do grania na Linuksie / lokalnego AI. Zobacz [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Czy mogę dodać więcej RAM?**
Nie. 16 GB GDDR6 jest wlutowane i współdzielone między CPU a GPU; nie ma slotów DIMM. Wybierasz tylko, ile z tej puli rezerwuje GPU (UMA), co ustawia się w zmodyfikowanym BIOS-ie. Zobacz [01-what-is-bc250.md](../en/01-what-is-bc250.md) i [08-bios.md](../en/08-bios.md).

**Czy ma przycisk zasilania?**
Nie. Włącza się w momencie, gdy pojawi się 12 V — wyłącznik samego zasilacza jest twoim przyciskiem zasilania. Zobacz [03-power-supply.md](../en/03-power-supply.md).

**Moja płyta nie przechodzi POST / czarny ekran prosto z pudełka — martwa?**
Często nie. Wiele płyt przychodzi tak, że przed przejściem POST wymagają **resetu BIOS/CMOS**, a niektóre docierają lekko **wygięte** od mocowania radiatora — jeden właściciel naprawił brak rozruchu, podkładając papier, by wyprostować płytę na płasko. Spróbuj tego, zanim uznasz ją za martwą. Zobacz [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Czy może nagrywać/streamować gry z użyciem GPU?**
Nie sprzętowo. Blok kodowania wideo (VCN) jest niedostępny, więc OBS/streaming przełącza się na **programowy (CPU) enkoder** — działa (ludzie używają Sunshine/Moonlight), ale kosztuje to CPU i jakość. Zobacz [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Jakie są grubości padów termicznych do modyfikacji backplate?**
Zgłaszane przez społeczność: **pamięć 2 mm, chipset 1,5 mm** ([src](https://t.me/c/2424231195/22442)). Tylna GDDR6 nie ma czujnika temperatury, więc chłodzisz ją „na ślepo”. Zobacz [04-cooling.md](../en/04-cooling.md).

## Zasilanie

**Jakiego zasilacza potrzebuję?**
Źródła **12 V z pojedynczej szyny** dostarczającego **≥300 W** na złącze **PCIe 8-pin (6+2)**. Trzy popularne drogi: normalny zasilacz ATX/SFX (po prostu wepnij jego kabel PCIe — najprościej), tani używany serwerowy zasilacz HP Flex 500 W albo przemysłowy brick Mean Well. Zobacz [03-power-supply.md](../en/03-power-supply.md).

**Czy mogę użyć 8-pin CPU/EPS z mojego zasilacza?**
**Nie — może spalić płytę.** Wtyczki 8-pin PCIe i CPU/EPS wyglądają niemal identycznie, ale mają **odwróconą polaryzację**. Płyta nie ma żadnego zabezpieczenia; użyj kabla **PCIe** i w razie wątpliwości sprawdź multimetrem. Zobacz [03-power-supply.md](../en/03-power-supply.md).

**Mój stary zasilacz 750 W ma mnóstwo watów — dlaczego sobie nie radzi?**
Stare jednostki często **dzielą 12 V na kilka słabych szyn** i żadna pojedyncza szyna nie pokrywa ok. 235 W, które płyta pobiera. Wybierz nowoczesny zasilacz z pojedynczą szyną / typu DC-DC albo taki z dużym zapasem. Zobacz [03-power-supply.md](../en/03-power-supply.md).

**Mój kabel zasilający się nagrzał / zaczął dymić. Dlaczego?**
Niemal na pewno **fałszywa miedź** — przewód miedziowany na stali lub aluminium, który ma wielokrotnie wyższą rezystancję niż prawdziwa miedź i przegrzewa się pod obciążeniem (gotowy rozgałęziacz PCIe jednego z członków dosłownie zaczął dymić) ([src](https://t.me/c/2424231195/97202)). Sprawdź magnesem: przyciąga się do stali, nie do miedzi. Używaj prawdziwej miedzi, **16 AWG lub grubszej**. Zobacz [03-power-supply.md](../en/03-power-supply.md).

## Chłodzenie

**Dlaczego przegrzewa się / dławi prosto z pudełka?**
Fabryczny radiator jest **pasywny**, zaprojektowany pod tunel wymuszonego nawiewu w szafie koparkowej. Na biurku bez przepływu powietrza nagrzewa się i dławi. Throttling zaczyna się ok. **85 °C**, twardy reset ok. **90 °C**. Zobacz [04-cooling.md](../en/04-cooling.md).

**Jakie jest najtańsze rozwiązanie chłodzenia, które naprawdę działa?**
**Zeszlifuj gęste fabryczne żebra** (szlifierka oscylacyjna jest najszybsza) i przykręć **wentylator 120 mm o wysokim ciśnieniu statycznym** dmuchający przez nie poprzez osłonę z druku. Wyniki odniesienia: Noctua NF-P12 → ok. 73 °C w Furmarku, 63–65 °C w grach ([src](https://t.me/c/2424231195/42843)); Arctic P12 Max utrzymuje ok. 75 °C ([src](https://t.me/c/2424231195/58869)). Zobacz [04-cooling.md](../en/04-cooling.md).

**Dlaczego wentylator o wysokim ciśnieniu statycznym, a nie „obudowowy” o wysokim przepływie?**
Gęste żebra to obciążenie o wysokim oporze — wentylator obudowowy o wysokim przepływie po prostu się o nie zatrzymuje, podczas gdy wentylator o wysokim ciśnieniu statycznym (Noctua/Arctic P12) faktycznie przepycha powietrze *przez* nie. Przy bardzo gęstych żebrach zastosuj dwa wentylatory w układzie **push-pull (szeregowo)**, a nie obok siebie. Zobacz [04-cooling.md](../en/04-cooling.md).

**Skąd mam wiedzieć, że moje chłodzenie wystarcza?**
Obciąż **GPU i CPU jednocześnie** (dzielą jeden radiator) — Furmark VK plus obciążenie CPU — **przy twoim podkręceniu** (2000 MHz, nie fabrycznie) i utrzymuj obciążenie poniżej ok. 85 °C. Jest przypięta procedura testowa. Zobacz [04-cooling.md](../en/04-cooling.md).

## Linux

**Którą dystrybucję zainstalować?**
Pod „po prostu graj w gry” wgraj **Bazzite** i przerebejsuj na obraz **`bazzite-bc250`** — poprawki GPU są wbudowane. Żeby poznać maszynę: **Fedora** (COPR + skrypt konfiguracyjny) albo **CachyOS/EndeavourOS** (Arch). Zobacz [06-linux.md](../en/06-linux.md).

**Zainstalowałem Linuksa i wszystko jest wolne / FPS jednocyfrowy. Dlaczego?**
GPU nie jest akcelerowane — działasz na renderowaniu programowym (LLVMpipe). Potrzebujesz **świeżej Mesy (25.1+)**, **dowiązania symbolicznego firmware `cyan_skillfish`** (albo załatanego pakietu) oraz właściwych parametrów jądra. Potwierdź przez `vulkaninfo | grep deviceName` (nie powinno pokazywać `llvmpipe`). Zobacz [06-linux.md](../en/06-linux.md).

**Czarny ekran po aktualizacji jądra — jak to naprawić?**
Na większości dystrybucji rozwiązaniem jest dowiązanie symboliczne firmware, by amdgpu mogło się załadować:
```bash
sudo ln -s /lib/firmware/amdgpu/navi10_gpu_info.bin.zst \
           /lib/firmware/amdgpu/cyan_skillfish_gpu_info.bin.zst
```
Przetrwa ono aktualizacje jądra (ale **nie** na Bazzite, a aktualizacja firmware/amdgpu może je wymazać) ([src](https://t.me/c/2424231195/98882)). W innym wypadku uruchom starsze/LTS jądro i zablokuj wersję tego wadliwego. Zobacz [06-linux.md](../en/06-linux.md).

**Czy powinienem instalować aplikacje jako Flatpaki?**
Unikaj ich w przypadku czegokolwiek graficznego. Flatpaki niosą **własną Mesę**, nadpisując załataną wersję płyty, więc działają **bez akceleracji sprzętowej**. Na przykład PortProton trzeba zainstalować z terminala, a nie przez Flatpaka ([src](https://t.me/c/2424231195/17949), [src](https://t.me/c/2424231195/47092)). Zobacz [06-linux.md](../en/06-linux.md).

**Mój CPU wydaje się słaby — jakieś szybkie wygrane?**
Dwie modyfikacje jądra: **`mitigations=off`** (wyłącza zabezpieczenia przed podatnościami CPU) ([src](https://t.me/c/2424231195/23359)) oraz **`nosmt=force`** (wyłącza SMT — +15–25% FPS w grach słabo korzystających z wielu wątków, ale szkodzi przy ciężkiej wielozadaniowości, np. OBS przy wysokim bitrate) ([src](https://t.me/c/2424231195/61332)). Oba to kompromisy między bezpieczeństwem/przepustowością. Zobacz [06-linux.md](../en/06-linux.md).

**GNOME/KDE na Waylandzie się glitchuje — co robić?**
Znany problem. Członkowie zgłaszają, że sesje Wayland (zwykle GNOME/KDE) źle się zachowują na tej płycie; zamiast tego **użyj sesji X11** ([src](https://t.me/c/2424231195/19623)). Zobacz [06-linux.md](../en/06-linux.md).

**RAM szybko się zapełnia — czy mogę mieć więcej swapu?**
Tak, powiększ swap **zRAM** (skompresowany swap w RAM) — przepis społeczności podbija go do 32 GB i czyni go trwałym w `/etc/systemd/zram-generator.conf` ([src](https://t.me/c/2424231195/38703)). Nie dodaje to prawdziwej pamięci, ale amortyzuje skoki. Zobacz [06-linux.md](../en/06-linux.md).

**Aktualizacja jądra coś zepsuła — jak się cofnąć?**
System zachowuje kilka ostatnich jąder. Na Fedorze wylistuj je przez `grubby` i `grubby --set-default /boot/vmlinuz-…`, a następnie zrestartuj ([src](https://t.me/c/2424231195/39393)). W razie wątpliwości uruchom **jądro LTS**. Zobacz [06-linux.md](../en/06-linux.md).

## Windows

**Czy jest już sterownik dla Windows?**
Nie — według stanu na początek 2026 **nie ma działającego sterownika GPU dla Windows**. Windows się uruchamia, ale GPU tkwi na **kodzie 43** bez 3D. Istnieją dwa próby inżynierii wstecznej od zera (Keshas-dev, ZEROAESQUERDA), ale są na etapie „czy GPU w ogóle się zainicjalizuje”, a nie grania. Zobacz [07-windows.md](../en/07-windows.md).

**Czy nie mogę po prostu wymusić instalacji sterownika RX 6700 / W5700?**
Nie. Każdy oficjalny `.inf` (w tym W5700, który Windows oferuje jako „zgodny”) instaluje się, a potem zawiesza na kodzie 43 — identyfikator urządzenia `1002:13FE` jest na stałe przypisany do APU. To pierwszy pomysł każdego początkującego i nie może zadziałać. Zobacz [07-windows.md](../en/07-windows.md).

**A co z maszyną wirtualną Windows z passthrough GPU?**
Nie działa — passthrough IOMMU jest zepsute na tej płycie, to jest APU (a nie czysta dedykowana karta do przekazania), a chip i tak jest błędnie wykrywany. Zobacz [07-windows.md](../en/07-windows.md).

**Widziałem „sterownik NVIDIA dla BC-250” / plik `…bc250.exe` — to prawda?**
Nie. „Sterownik NVIDIA” był **żartem primaaprilisowym**, a instalator Adrenalin z doklejonym do nazwy pliku „bc250” to wciąż zwykły instalator Adrenalin. Uruchamiaj wyłącznie pliki binarne z wymienionych repozytoriów GitHub i czytaj kod — fałszywe „sterowniki” bywały złośliwym oprogramowaniem. Zobacz [07-windows.md](../en/07-windows.md).

## BIOS i odzyskiwanie

**Czy powinienem wgrać zmodyfikowany BIOS?**
Tylko jeśli chcesz odblokować podkręcanie/timingi/VRAM iGPU **i** masz przygotowany sprzęt do odzyskiwania. Złe ustawienie może **zamienić płytę w martwą cegłę**, a na tej płycie **czyszczenie CMOS nie zawsze ją ratuje**. Użyj aktualnego moda opartego na 5.00, zweryfikuj SHA-256 i nigdy nie wyłączaj Integrated Graphics (to twoje jedyne wyjście obrazu). Zobacz [08-bios.md](../en/08-bios.md).

**Zrobiłem z niej cegłę — czy da się ją odzyskać?**
Zwykle tak, ale tylko sprzętowo: programator SPI klasy **CH341A** podłączony do złącza **J4004** płyty (klips SOIC tutaj *nie* działa), by ponownie zaprogramować układ 16 MB. Uważaj na pułapkę z liniami danych 3,3 V w CH341A. Zobacz [08-bios.md](../en/08-bios.md).

**Zmieniłem podział VRAM, ale system nadal pokazuje starą ilość.**
**Wyczyść CMOS** po flashowaniu/zmianie UMA — wyjmij CR2032 na 60+ s albo zewrzyj zworkę CMOS. Niektóre ustawienia (zwłaszcza VRAM/UMA) nie zastosują się, dopóki tego nie zrobisz ([src](https://t.me/c/2424231195/97290)). Zobacz [08-bios.md](../en/08-bios.md).

## Podkręcanie i undervolting

**Jak podkręcić? Czy warto?**
Uruchom **governor** (większość konfiguracji używa **oberon-governor**) i podnieś GPU w stronę **2000 MHz** (~+30% FPS *gdy ograniczeniem jest GPU*). Nowszy `bc250_smu_oc` podkręca też CPU (~4 GHz @ 1275 mV). **Najpierw schłódź płytę** — OC powyżej ok. 90 °C ją resetuje. Zobacz [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**Czym jest odblokowanie 40 CU?**
Krzem fizycznie ma **40 CU**, ale firmware pozostawia aktywne tylko **24**. Załatane amdgpu + `amdgpu.bc250_cc_write_mode=3` ponownie włącza wszystkie 40 — większy zysk z GPU niż zegary (jeden przebieg Superposition skoczył z 4647 do 6863). Wymaga to przebudowania modułu jądra i działa tylko na Linuksie. Zobacz [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**Jakie napięcie ustawić?**
Każdy chip jest inny (loteria krzemowa). Częste punkty stabilne w grach: **2000 MHz ≈ 955 mV** (~75 °C). Waliduj w **prawdziwych grach + alt-tab/menu**, a nie tylko w Furmarku, który ukrywa niestabilność. Twardy limit CPU: **nigdy nie przekraczaj 1,325 V Vid**. Zobacz [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**Czy zbyt agresywny undervolting jest niebezpieczny?**
Nie — w najgorszym razie płyta odpada lub wyłącza slot M.2, a wszystko czyści się w kilka sekund, bo OC nie jest zapisane w BIOS-ie. To *podbicie* napięcia CPU jest niebezpiecznym kierunkiem. Zobacz [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

## Obraz, WiFi i Bluetooth

**Brak obrazu przez HDMI?**
Płyta daje obraz przez **DisplayPort**; do HDMI/TV użyj **adaptera lub kabla DP→HDMI** (dobry działa też w BIOS-ie i obsługuje 4K) ([src](https://t.me/c/2424231195/24107)). Wybierz prawdziwy **kabel DP→HDMI** zamiast taniego pasywnego adaptera — zły adapter spowodował czarne ekrany u jednego z członków ([src](https://t.me/c/2424231195/96416)).

**Dźwięk przez DisplayPort jest zniekształcony.**
Znany problem na Linuksie. Proste rozwiązanie to wyprowadzenie obrazu przez adapter **DP→HDMI**, który przenosi czysty dźwięk ([src](https://t.me/c/2424231195/17953)). Zobacz [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Czy ma WiFi/Bluetooth?**
Brak łączności bezprzewodowej na płycie — potrzebujesz **dongla USB**, wybranego według **chipsetu, a nie marki**. Najlepiej udokumentowany jest dongiel **aic8800d80**; tanie dongle Realtek RTL8821/8822 działają z `lwfinger/rtw88`, ale odpadają pod obciążeniem. Do konfiguracji przewodowy adapter USB-Ethernet całkowicie omija ten problem. Zobacz [10-wifi-bt.md](../en/10-wifi-bt.md).

**Mój dongiel WiFi ciągle się rozłącza.**
Klasyczny objaw Realteka na BC-250: zainstaluj właściwy sterownik spoza drzewa jądra (rtw88 / rtl8831), spróbuj tylnego portu USB i resetuj przez `usbreset` zamiast wypinać. Jeśli niezawodność jest ważniejsza od ceny, przesiądź się na aic8800d80 albo potwierdzonego dongla Digma. Zobacz [10-wifi-bt.md](../en/10-wifi-bt.md).

## Gry i AI

**Jakiego FPS mogę oczekiwać?**
Przy realnym OC **2000 MHz**: nowoczesne AAA na **40–60 FPS**, lżejsze/starsze gry powyżej 60. Najlepiej w **1080p–1440p** z FSR. Płyta jest zwykle **ograniczona przez CPU**, więc rozdzielczość często jest „za darmo”, ale gry mocno oparte na fizyce/źle zwątkowane i tak się tną. Zobacz [11-gaming.md](../en/11-gaming.md).

**Które gry działają najlepiej?**
**Porty first-party z PlayStation** (God of War, Horizon, The Last of Us, Spider-Man, Ghost of Tsushima) — opierają się na GPU i są dobrze zoptymalizowane. Emulacja: Switch (Eden) i PS4 (shadPS4) są solidne; Xbox 360 (Xenia) nie. Zobacz [11-gaming.md](../en/11-gaming.md).

**Dlaczego moje GPU jest na ok. 40% obciążenia, ale FPS jest niski?**
Jesteś **ograniczony przez CPU** — wąskim gardłem jest 6-rdzeniowy Zen 2, a nie GPU. Skalowanie obrazu w tym przypadku niewiele podniesie FPS; spróbuj `nosmt=force`/`mitigations=off` i pogódź się z tym, że niektóre tytuły są ograniczone przez CPU. Zobacz [11-gaming.md](../en/11-gaming.md).

**Czy mogę uruchamiać na niej lokalne LLM / AI?**
Tak — 16 GB GDDR6 pomieści średniej wielkości modele przez `llama.cpp`/Jan na backendzie **Vulkan**; najpierw ustaw w BIOS-ie przydział ~12 GB dla GPU. Zobacz [12-ai-llm.md](../en/12-ai-llm.md).

## Zakupy

**Jaka cena jest uczciwa i gdzie kupować?**
Ceny i źródła zmieniają się szybko i zależą od regionu (eBay, AliExpress, Ozon/Avito w WNP) — ostatnie zgłoszenia oscylują wokół niskich stu kilkudziesięciu dolarów do ~13 tys. ₽. Zobacz [02-buying.md](../en/02-buying.md).

**Jakie są ryzyka zakupu?**
To używany sprzęt koparkowy/serwerowy: płyty mogą przyjść wymagając resetu BIOS-u, lekko wygięte albo czasem wadliwe, i nie ma wsparcia producenta — twoim wsparciem jest społeczność. Zarezerwuj sobie czas, nie tylko pieniądze. Zobacz [01-what-is-bc250.md](../en/01-what-is-bc250.md) i [02-buying.md](../en/02-buying.md).

**Czy mogę uruchomić na niej macOS?**
Nie rób tego. CPU może się uruchomić, ale **GPU nigdy nie będzie akcelerowane** (brak wspieranego bliźniaka do podszycia się, a żadne iGPU APU AMD nigdy nie zadziałało w macOS). Użyj Linuksa. Zobacz [13-macos.md](../en/13-macos.md).

---

## Źródła

- Czat źródłowy: *społeczność AMD BC-250* (Telegram). Większość odpowiedzi streszcza pełną sekcję podręcznika — podążaj za odnośnikiem do sekcji po źródłowe cytaty.
- Grubości padów termicznych — https://t.me/c/2424231195/22442
- Arctic P12 Max ~75 °C — https://t.me/c/2424231195/58869 · Noctua P12 ~73 °C — https://t.me/c/2424231195/42843
- Naprawa przez dowiązanie symboliczne firmware przy czarnym ekranie po jądrze (nie Bazzite) — https://t.me/c/2424231195/98882
- Flatpak psuje akcelerację sprzętową — https://t.me/c/2424231195/17949 · PortProton przez terminal — https://t.me/c/2424231195/47092
- `mitigations=off` dla słabego CPU — https://t.me/c/2424231195/23359 · zysk FPS z `nosmt=force` — https://t.me/c/2424231195/61332
- Glicze Wayland, użyj X11 — https://t.me/c/2424231195/19623
- Zwiększenie swapu zRAM — https://t.me/c/2424231195/38703 · wybór/cofanie jądra — https://t.me/c/2424231195/39393
- Rozgałęziacz zasilania przegrzał się/zadymił (fałszywa miedź) — https://t.me/c/2424231195/97202
- Konieczne czyszczenie CMOS po zmianie VRAM — https://t.me/c/2424231195/97290
- Adapter DP→HDMI (4K/TV, działa w BIOS-ie) — https://t.me/c/2424231195/24107 · zły adapter → czarny ekran — https://t.me/c/2424231195/96416 · naprawa zniekształconego dźwięku DP — https://t.me/c/2424231195/17953

> To FAQ jest mapą, a nie terenem — każda odpowiedź wskazuje sekcję, która niesie szczegóły i źródła pierwotne. Poprawki mile widziane przez PR (zobacz [CONTRIBUTING.md](../../CONTRIBUTING.md)).
