<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — biblia początkującego użytkownika AMD BC-250" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> Biblia początkującego użytkownika **ASRock AMD BC-250** — płyta z APU wywodzącym się z PlayStation 5 (Cyan Skillfish / Oberon, 6-rdzeniowy Zen 2 + RDNA 2, 16 GB GDDR6) przerobiona na tani **linuksowy mini PC do gier i AI** — budżetowa, samodzielnie składana Steam Machine.

Wszystko, czego potrzebujesz, by przejść **od płyty w pudełku do uruchomionej gry** — wyselekcjonowane z ponad 130 tys. wiadomości społeczności BC-250, uszeregowane według tego, co ludzie faktycznie najczęściej pozytywnie oceniali i przypinali, oraz zweryfikowane względem kanonicznych repozytoriów projektu.

🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · **Polski** · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<sub>_Utrzymywane · ostatnia aktualizacja **sierpień 2026** · [llms.txt](llms.txt) dla agentów AI_</sub>

---

## ❓ Szybkie odpowiedzi

- **Czym jest ASRock AMD BC-250?** Płyta z APU wywodzącym się z PlayStation 5 — 6-rdzeniowy Zen 2 + 24/40 CU RDNA 2 („Cyan Skillfish”), 16 GB GDDR6 — sprzedawana tanio jako używana karta do kopania kryptowalut i przerabiana na linuksowy mini PC do gier i AI, budżetowa Steam Machine (DIY).
- **Ile kosztuje?** Około **$60–130** za samą płytę; kompletna budowa (zasilacz, cooler, SSD) to **$150–250**. Zobacz [Poradnik zakupowy](docs/pl/02-buying.md).
- **Jak dobrze gra?** W większości tytułów mniej więcej **1080p 60 FPS** (klasa RX 6600) z FSR / Frame-Gen i podkręconym GPU+CPU. Zobacz [Wyniki i ustawienia w grach](docs/pl/11-gaming.md).
- **Jaki system?** **Tylko Linux** dla akceleracji GPU — Bazzite, Fedora, CachyOS lub Arch z Mesa 25.1+. Nie ma sterownika GPU dla Windows. Zobacz [Konfiguracja Linuksa](docs/pl/06-linux.md).
- **Czy uruchomi LLM-y?** Tak — llama.cpp / Ollama przez Vulkan wykorzystują 16 GB GDDR6 jako VRAM (ok. 30–47 tok/s na małych modelach). Zobacz [AI / LLM](docs/pl/12-ai-llm.md).
- **Jak to chłodzić?** Fabryczny radiator serwerowy dławi na biurku; przerzedź lamelki i dodaj wentylator 120 mm albo idź w wodę. Zobacz [Chłodzenie](docs/pl/04-cooling.md).

---

## ⚡ Zacznij tutaj

Nowa płyta, nic nie wiesz? Przejdź złotą ścieżkę po kolei:

**[docs/pl/00-start-here.md](docs/pl/00-start-here.md)** — Kup → Zasil → Schłódź → Zainstaluj system → Sterowniki → Podkręć → Graj.

---

## 📈 Co faktycznie daje strojenie

Każde pokrętło na tej płycie to kompromis. To są te cztery, które mają znaczenie, wyciągnięte z pomiarów społeczności — przeczytaj je, zanim cokolwiek flashujesz.

<p align="center">
  <img src="assets/diagrams/gpu-clock-tradeoff.svg" width="100%" alt="Zegar rdzenia GPU: wzrost FPS sięga około 95% przy 2000 MHz, a potem się wypłaszcza, gdy ogranicza go CPU, podczas gdy pobór mocy i temperatura nadal rosną do 95%. Optimum w okolicach 2000 MHz, mniej więcej +30% FPS.">
</p>

<p align="center">
  <img src="assets/diagrams/undervolt-tradeoff.svg" width="100%" alt="Undervolting: wydajność rośnie od 20% do 95% wraz ze spadkiem napięcia z 1129 mV do 700 mV, a ryzyko niestabilności rośnie od 15% do 100%. Stabilny w grach zakres to mniej więcej 905–955 mV; poniżej 700 mV GPU blokuje się na 1500 MHz.">
</p>

<p align="center">
  <img src="assets/diagrams/cu40-tradeoff.svg" width="100%" alt="Odblokowanie 40 CU: moc obliczeniowa rośnie z 40% do 90%, podczas gdy FPS w grach przesuwa się tylko z 40% do 47%, a pobór mocy z niestabilnością rośnie z 25% do 100%. 38 CU to typowe stabilne maksimum; 40 CU to loteria wymagająca ponad 300 W i chłodzenia AIO.">
</p>

<p align="center">
  <img src="assets/diagrams/memory-tradeoff.svg" width="100%" alt="Strojenie pamięci GDDR6: przepustowość i zysk FPS przesuwają się tylko z 30% do 52%, a ryzyko zamiany w cegłę rośnie z 20% do 100%. 1950 MHz to punkt, w którym płyty wracały jako cegły.">
</p>

<p align="center">
  <img src="assets/diagrams/power-by-config.svg" width="100%" alt="Zmierzony pobór z gniazdka w zależności od konfiguracji: 200 W przy 38 CU i 1200 MHz na 850 mV, 260 W przy 40 CU i 1800 MHz na 860 mV, 310 W przy 38 CU i 1500 MHz oraz 350 W przy 40 CU i 2000 MHz na 960 mV, przy czym 1025 mV dodaje tylko 2 W. Najlepszy zgłoszony punkt watów na klatkę to 40 CU przy 1800 MHz.">
</p>

Te pięć punktów to pomiary, a nie model: przejście z 1800 do 2000 MHz kosztuje około 90 W — mniej więcej tyle, ile kosztowało poprzednie 600 MHz — a podbicie z 960 mV do 1025 mV nie daje nic poza 2 W ciepła. Przy 350 W zasilacz 300 W wyzwala się w ciągu 30 sekund, a szyna +12 V niesie 26 A.

<details>
<summary>Pobór w bezczynności — dlaczego miernik przy gniazdku ledwo się rusza</summary>

<p align="center">
  <img src="assets/diagrams/idle-power-tradeoff.svg" width="100%" alt="Pobór w bezczynności: pobór GPU spada z 80 W do 5 W dzięki governorowi, undervoltingowi i auto-suspend, ale całkowity pobór z gniazdka spada tylko ze 125 W do 110 W, dopóki uśpienie nie obniży go do 10 W.">
</p>

Governor i undervolting obcinają GPU, ale CPU i GDDR6 i tak pobierają prąd. Dopóki nie zadziała auto-suspend, miernik przy gniazdku prawie tego nie zauważa. Partie o dużym prądzie upływu osiągają minimum w okolicach 70–80 W.

</details>

<sub>Dane źródłowe: [`assets/diagrams/data.json`](assets/diagrams/data.json) · przebudowa przez `node assets/diagrams/build.mjs`</sub>

---

## 📚 Podręcznik

| # | Sekcja | Dla |
|---|---------|-----|
| 01 | [Czym jest BC-250](docs/pl/01-what-is-bc250.md) | specyfikacja, wymiary, pinout, oczekiwania |
| 02 | [Poradnik zakupowy](docs/pl/02-buying.md) | gdzie, cena, ryzyka, zakupy grupowe |
| 03 | [Zasilacz](docs/pl/03-power-supply.md) | LOP / Flex ATX, pinout 8-pin, okablowanie |
| 04 | [Chłodzenie](docs/pl/04-cooling.md) | radiator, osłony wentylatora, metoda testowania |
| 05 | [Obudowy i druk 3D](docs/pl/05-case.md) | katalog obudów do druku (STL) |
| 06 | [Sterowniki i konfiguracja Linuksa](docs/pl/06-linux.md) | wybór dystrybucji, amdgpu, instalacja |
| 07 | [Sterowniki i konfiguracja Windows](docs/pl/07-windows.md) | status sterowników, instrukcje |
| 08 | [BIOS i ratowanie cegły](docs/pl/08-bios.md) | modyfikacja BIOS, flashowanie, odzyskiwanie |
| 09 | [Podkręcanie i undervolting](docs/pl/09-overclock-undervolt.md) | governor, SMU, odblokowanie 40CU |
| 10 | [Dongle WiFi i Bluetooth](docs/pl/10-wifi-bt.md) | dongle, które faktycznie działają |
| 11 | [Wyniki i ustawienia w grach](docs/pl/11-gaming.md) | benchmarki, strojenie pod konkretne gry |
| 12 | [AI / LLM na BC-250](docs/pl/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/pl/13-macos.md) | status |
| 14 | [Obraz i wyjście wideo](docs/pl/14-display.md) | DisplayPort, adaptery DP→HDMI, dwa ekrany |
| 15 | [Emulacja](docs/pl/15-emulation.md) | każda konsola/platforma, realistyczny status |
| 16 | [USB, huby i pamięć masowa](docs/pl/16-usb-peripherals.md) | huby, modyfikacja 5V, adaptery M.2 / SATA |
| ❓ | [FAQ](docs/pl/faq.md) · [Rozwiązywanie problemów](docs/pl/troubleshooting.md) | typowe problemy |

---

## 🔗 Świetne zasoby

Kanoniczne projekty społeczności, uszeregowane według tego, jak często społeczność na nie wskazywała.

### Dokumentacja
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) — główny opis sprzętu (inżynieria wsteczna)
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [strona](https://elektricm.github.io/amd-bc250-docs/) — obszerna dokumentacja społeczności (pinouty, per dystrybucja, rozwiązywanie problemów)
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — dokumentacja organizacji
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — kompilacje i skrypty

### Podkręcanie / Undervolting / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — governor, na którym działa większość konfiguracji (ustawia zegary/napięcie)
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — fork oberon-governor z GUI (Linux)
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [fork bc250-collective](https://github.com/bc250-collective/cyan-skillfish-governor)
- [rw-r-r-0644/bc250-core-unlock](https://github.com/rw-r-r-0644/bc250-core-unlock) — odblokowuje 2 wyłączone rdzenie CPU (fabryczna maska 0x77; maska 0xB7 oznacza fizycznie uszkodzone rdzenie — wymuszenie jej daje artefakty i crash'e)
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — odblokowanie wszystkich 40 CU
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Zestawy narzędzi i gotowe obrazy
- [redbeard1083/bc250-toolkit](https://github.com/redbeard1083/bc250-toolkit) — konfiguracja CachyOS sterowana menu: jądro, governory CPU/GPU, swap, ZRAM→ZSWAP, poprawki ACPI i rozruchu
- [62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images](https://github.com/62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images) — gotowe obrazy Bazzite Deck/GNOME/KDE z naniesionymi poprawkami BC-250

### Sterowniki
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — sterownik GPU dla Windows (eksperymentalny, brak pełnej akceleracji według stanu na początek 2026)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — prace nad sterownikiem PSP/GPU
- [DryhoppedIPA/bc250-gfx1013-fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix) — poprawki do jądra + Mesa/RADV dla uszkodzonej kolejki obliczeniowej GPU (async compute); naprawiają też ścieżkę FSR 4 / XeSS 3 INT8
- [MastaG/linux-cachyos-bc250](https://github.com/MastaG/linux-cachyos-bc250) — jądro CachyOS z cherry-pickami dla BC-250
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — jądro Linux

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — najczęściej przywoływane obrazy i mody BIOS
- [TheRetroWeb — baza BIOS BC-250](https://theretroweb.com/bios?itemsPerPage=24&chipsetIds%5B%5D=1990) — oryginalne zrzuty BIOS, przeglądanie/pobieranie według wersji
- [Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script](https://github.com/Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script) — skrypt z menu do tworzenia kopii firmware i flashowania niestandardowego firmware
- Flashowanie i odzyskiwanie cegły opisano w [docs/pl/08-bios.md](docs/pl/08-bios.md)

### Dongle WiFi / BT
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### AI / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Obudowy / Druk 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables i MakerWorld — zobacz [docs/pl/05-case.md](docs/pl/05-case.md)

---

## 🤝 Współtworzenie

To **żywe** repozytorium. Wiedza jest wydobywana z czatu społeczności przez powtarzalny proces (zobacz [CONTRIBUTING.md](CONTRIBUTING.md)) i przetwarzana ponownie na nowych eksportach. Mile widziane PR-y z poprawkami, nowymi donglami, nowymi obudowami i zweryfikowanymi poleceniami.

## 📄 Licencja

Dokumentacja: [CC-BY-SA-4.0](LICENSE). Skrypty w `assets/scripts/`: MIT. Lustrzane firmware/sterowniki firm trzecich zachowują swoje oryginalne prawa — zobacz [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md).

## 🙏 Podziękowania

Całej społeczności BC-250 — zobacz **[CREDITS](CREDITS.md)**, gdzie wymieniono najważniejszych współtwórców, dzięki którym ten podręcznik powstał. Źródło: *czat społeczności AMD BC-250*. Autorzy projektów wymienieni powyżej według ich nazw w repozytoriach.
