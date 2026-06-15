<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — biblia początkującego użytkownika AMD BC-250" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> Biblia początkującego użytkownika **AMD BC-250** — płyta z APU wywodzącym się z PlayStation 5 (Cyan Skillfish / Oberon, 16 GB GDDR6), przerobiona na tani komputer linuksowy do grania i zadań AI.

Wszystko, czego potrzebujesz, by przejść **od płyty w pudełku do uruchomionej gry** — wyselekcjonowane z ponad 125 tys. wiadomości społeczności BC-250, uszeregowane według tego, co ludzie faktycznie najczęściej pozytywnie oceniali i przypinali, oraz zweryfikowane względem kanonicznych repozytoriów projektu.

🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · **Polski** · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

---

## ⚡ Zacznij tutaj

Nowa płyta, nic nie wiesz? Przejdź złotą ścieżkę po kolei:

**[docs/pl/00-start-here.md](docs/pl/00-start-here.md)** — Kup → Zasil → Schłódź → Zainstaluj system → Sterowniki → Podkręć → Graj.

---

## 📚 Podręcznik

| # | Sekcja | Dla |
|---|---------|-----|
| 01 | [Czym jest BC-250](docs/en/01-what-is-bc250.md) | specyfikacja, wymiary, pinout, oczekiwania |
| 02 | [Poradnik zakupowy](docs/en/02-buying.md) | gdzie, cena, ryzyka, zakupy grupowe |
| 03 | [Zasilacz](docs/en/03-power-supply.md) | LOP / Flex ATX, pinout 8-pin, okablowanie |
| 04 | [Chłodzenie](docs/en/04-cooling.md) | radiator, osłony wentylatora, metoda testowania |
| 05 | [Obudowy i druk 3D](docs/en/05-case.md) | katalog obudów do druku (STL) |
| 06 | [Sterowniki i konfiguracja Linuksa](docs/en/06-linux.md) | wybór dystrybucji, amdgpu, instalacja |
| 07 | [Sterowniki i konfiguracja Windows](docs/en/07-windows.md) | status sterowników, instrukcje |
| 08 | [BIOS i ratowanie cegły](docs/en/08-bios.md) | modyfikacja BIOS, flashowanie, odzyskiwanie |
| 09 | [Podkręcanie i undervolting](docs/en/09-overclock-undervolt.md) | governor, SMU, odblokowanie 40CU |
| 10 | [Dongle WiFi i Bluetooth](docs/en/10-wifi-bt.md) | dongle, które faktycznie działają |
| 11 | [Wyniki i ustawienia w grach](docs/en/11-gaming.md) | benchmarki, strojenie pod konkretne gry |
| 12 | [AI / LLM na BC-250](docs/en/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/en/13-macos.md) | status |
| 14 | [Obraz i wyjście wideo](docs/en/14-display.md) | DisplayPort, adaptery DP→HDMI, dwa ekrany |
| 15 | [Emulacja](docs/en/15-emulation.md) | każda konsola/platforma, realistyczny status |
| 16 | [USB, huby i pamięć masowa](docs/en/16-usb-peripherals.md) | huby, modyfikacja 5V, adaptery M.2 / SATA |
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
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — odblokowanie wszystkich 40 CU
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Sterowniki
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — sterownik GPU dla Windows (eksperymentalny, brak pełnej akceleracji według stanu na początek 2026)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — prace nad sterownikiem PSP/GPU
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — jądro Linux

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — najczęściej przywoływane obrazy i mody BIOS
- Flashowanie i odzyskiwanie cegły opisano w [docs/en/08-bios.md](docs/en/08-bios.md)

### Dongle WiFi / BT
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### AI / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Obudowy / Druk 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables i MakerWorld — zobacz [docs/en/05-case.md](docs/en/05-case.md)

---

## 🤝 Współtworzenie

To **żywe** repozytorium. Wiedza jest wydobywana z czatu społeczności przez powtarzalny proces (zobacz [CONTRIBUTING.md](CONTRIBUTING.md)) i przetwarzana ponownie na nowych eksportach. Mile widziane PR-y z poprawkami, nowymi donglami, nowymi obudowami i zweryfikowanymi poleceniami.

## 📄 Licencja

Dokumentacja: [CC-BY-SA-4.0](LICENSE). Skrypty w `assets/scripts/`: MIT. Lustrzane firmware/sterowniki firm trzecich zachowują swoje oryginalne prawa — zobacz [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md).

## 🙏 Podziękowania

Całej społeczności BC-250 — zobacz **[CREDITS](CREDITS.md)**, gdzie wymieniono najważniejszych współtwórców, dzięki którym ten podręcznik powstał. Źródło: *czat społeczności AMD BC-250*. Autorzy projektów wymienieni powyżej według ich nazw w repozytoriach.
