<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — die Einsteiger-Bibel für die AMD BC-250" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> Die Einsteiger-Bibel für die **AMD BC-250** — ein von der PlayStation 5 abgeleitetes APU-Board (Cyan Skillfish / Oberon, 16 GB GDDR6), zweckentfremdet als günstige Linux-Gaming- und KI-Kiste.

Alles, was du brauchst, um **vom Board im Karton bis zum laufenden Spiel** zu kommen — kuratiert aus über 125.000 Nachrichten der BC-250-Community, gewichtet nach dem, was die Leute tatsächlich hochgevotet und angepinnt haben, und gegengeprüft mit den maßgeblichen Projekt-Repos.

🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · **Deutsch** · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

---

## ⚡ Hier starten

Neues Board, keine Ahnung? Folge dem goldenen Pfad der Reihe nach:

**[docs/de/00-start-here.md](docs/de/00-start-here.md)** — Kaufen → Strom → Kühlen → OS installieren → Treiber → Übertakten → Spielen.

---

## 📚 Handbuch

| # | Abschnitt | Für |
|---|---------|-----|
| 01 | [Was ist die BC-250](docs/en/01-what-is-bc250.md) | Specs, Größen, Pinout, Erwartungen |
| 02 | [Kaufberatung](docs/en/02-buying.md) | wo, Preis, Risiken, Sammelbestellungen |
| 03 | [Netzteil](docs/en/03-power-supply.md) | LOP / Flex ATX, 8-Pin-Pinout, Verkabelung |
| 04 | [Kühlung](docs/en/04-cooling.md) | Kühlkörper, Lüfter-Shrouds, Testmethode |
| 05 | [Gehäuse & 3D-Druck](docs/en/05-case.md) | Katalog druckbarer Gehäuse (STL) |
| 06 | [Linux-Treiber & Einrichtung](docs/en/06-linux.md) | Distro-Wahl, amdgpu, Installation |
| 07 | [Windows-Treiber & Einrichtung](docs/en/07-windows.md) | Treiberstatus, Anleitung |
| 08 | [BIOS & Brick-Wiederherstellung](docs/en/08-bios.md) | Mod-BIOS, Flashen, Entbricken |
| 09 | [Übertakten & Undervolting](docs/en/09-overclock-undervolt.md) | Governor, SMU, 40CU-Freischaltung |
| 10 | [WLAN- & Bluetooth-Dongles](docs/en/10-wifi-bt.md) | Dongles, die wirklich funktionieren |
| 11 | [Gaming-Ergebnisse & Einstellungen](docs/en/11-gaming.md) | Benchmarks, Tuning pro Spiel |
| 12 | [KI / LLM auf der BC-250](docs/en/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/en/13-macos.md) | Status |
| 14 | [Display & Ausgabe](docs/en/14-display.md) | DisplayPort, DP→HDMI-Adapter, Dual-Screen |
| 15 | [Emulation](docs/en/15-emulation.md) | jede Konsole/Plattform, realistischer Status |
| 16 | [USB, Hubs & Speicher](docs/en/16-usb-peripherals.md) | Hubs, 5V-Mod, M.2 / SATA-Adapter |
| ❓ | [FAQ](docs/de/faq.md) · [Troubleshooting](docs/de/troubleshooting.md) | häufige Probleme |

---

## 🔗 Awesome-Ressourcen

Maßgebliche Community-Projekte, gewichtet danach, wie oft die Community auf sie verwiesen hat.

### Dokumentation
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) — die zentrale Hardware-Referenz (Reverse Engineering)
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [Seite](https://elektricm.github.io/amd-bc250-docs/) — umfassende Community-Doku (Pinouts, pro Distro, Troubleshooting)
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — Org-Doku
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — Builds & Skripte

### Übertakten / Undervolten / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — der Governor, den die meisten Builds nutzen (setzt Takt/Spannung)
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — oberon-governor-Fork mit GUI (Linux)
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [bc250-collective-Fork](https://github.com/bc250-collective/cyan-skillfish-governor)
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — alle 40 CUs freischalten
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Treiber
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — Windows-GPU-Treiber (experimentell, Stand Anfang 2026 keine volle Beschleunigung)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — PSP/GPU-Treiberarbeit
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — Linux-Kernel

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — die meistreferenzierten BIOS-Images & Mods
- Siehe [docs/en/08-bios.md](docs/en/08-bios.md) für Flashen & Brick-Wiederherstellung

### WLAN- / BT-Dongles
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### KI / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Gehäuse / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables & MakerWorld — siehe [docs/en/05-case.md](docs/en/05-case.md)

---

## 🤝 Mitwirken

Dies ist ein **lebendiges** Repo. Das Wissen wird durch eine reproduzierbare Pipeline aus dem Community-Chat extrahiert (siehe [CONTRIBUTING.md](CONTRIBUTING.md)) und bei neuen Exporten erneut durchlaufen. PRs mit Korrekturen, neuen Dongles, neuen Gehäusen, verifizierten Befehlen sind willkommen.

## 📄 Lizenz

Doku: [CC-BY-SA-4.0](LICENSE). Skripte unter `assets/scripts/`: MIT. Gespiegelte Drittanbieter-Firmware/-Treiber behalten ihre ursprünglichen Rechte — siehe [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md).

## 🙏 Danksagung

Der gesamten BC-250-Community — siehe **[CREDITS](CREDITS.md)** für die wichtigsten Mitwirkenden, die dieses Handbuch möglich gemacht haben. Quelle: *AMD BC-250 Community-Chat*. Die Projektautoren sind oben unter ihrem Repo-Handle genannt.
