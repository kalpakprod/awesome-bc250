<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — die Einsteiger-Bibel für die AMD BC-250" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> Die Einsteiger-Bibel für die **ASRock AMD BC-250** — ein von der PlayStation 5 abgeleitetes APU-Board (Cyan Skillfish / Oberon, 6-Kern-Zen-2 + RDNA 2, 16 GB GDDR6), zweckentfremdet als günstiger **Linux-Gaming- & KI-Mini-PC** — eine DIY-Budget-Steam-Machine.

Alles, was du brauchst, um **vom Board im Karton bis zum laufenden Spiel** zu kommen — kuratiert aus 130k+ Nachrichten der BC-250-Community, gewichtet nach dem, was die Leute tatsächlich hochgevotet und angepinnt haben, und gegengeprüft mit den maßgeblichen Projekt-Repos.

🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · **Deutsch** · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<sub>_Gepflegt · zuletzt aktualisiert **August 2026** · [llms.txt](llms.txt) für KI-Agenten_</sub>

---

## ❓ Schnelle Antworten

- **Was ist die ASRock AMD BC-250?** Ein von der PlayStation 5 abgeleitetes APU-Board — 6-Kern-Zen-2 + 24/40 RDNA 2 CUs („Cyan Skillfish“), 16 GB GDDR6 — günstig als Ex-Mining-Karte verkauft und zu einem Linux-Gaming- & KI-Mini-PC umfunktioniert, einer DIY-Budget-Steam-Machine.
- **Wie viel kostet sie?** Etwa **$60–130** für das nackte Board; ein kompletter Build (Netzteil, Kühler, SSD) liegt bei **$150–250**. Siehe [Kaufberatung](docs/en/02-buying.md).
- **Wie gut zockt sie?** Grob **1080p 60 FPS** in den meisten Titeln (RX-6600-Klasse) mit FSR / Frame-Gen und einer GPU+CPU-Übertaktung. Siehe [Gaming-Ergebnisse](docs/en/11-gaming.md).
- **Welches OS?** **Nur Linux** für GPU-Beschleunigung — Bazzite, Fedora, CachyOS oder Arch mit Mesa 25.1+. Es gibt keinen Windows-GPU-Treiber. Siehe [Linux-Einrichtung](docs/en/06-linux.md).
- **Kann sie LLMs ausführen?** Ja — llama.cpp / Ollama über Vulkan nutzen die 16 GB GDDR6 als VRAM (~30–47 tok/s bei kleinen Modellen). Siehe [KI / LLM](docs/en/12-ai-llm.md).
- **Wie kühle ich sie?** Der serienmäßige Server-Kühlkörper drosselt auf dem Schreibtisch; Lamellen ausdünnen und einen 120-mm-Lüfter montieren, oder auf Wasser gehen. Siehe [Kühlung](docs/en/04-cooling.md).

---

## ⚡ Hier starten

Neues Board, keine Ahnung? Folge dem goldenen Pfad der Reihe nach:

**[docs/de/00-start-here.md](docs/de/00-start-here.md)** — Kaufen → Strom → Kühlen → OS installieren → Treiber → Übertakten → Spielen.

---

## 📈 Was Tuning dir tatsächlich bringt

Jeder Regler an diesem Board erkauft etwas. Das sind die vier, die zählen — abgeleitet aus dem, was die Community gemessen hat. Lies sie, bevor du irgendetwas flashst.

<p align="center">
  <img src="assets/diagrams/gpu-clock-tradeoff.svg" width="100%" alt="GPU-Kerntakt: Der FPS-Gewinn steigt auf etwa 95% bei 2000 MHz und flacht dann ab, da die CPU limitiert, während Leistungsaufnahme und Wärme weiter bis 95% klettern. Sweet Spot um 2000 MHz, grob +30% FPS.">
</p>

<p align="center">
  <img src="assets/diagrams/undervolt-tradeoff.svg" width="100%" alt="Undervolting: Die Effizienz steigt von 20% auf 95%, wenn die Spannung von 1129 mV auf 700 mV fällt, während das Instabilitätsrisiko von 15% auf 100% steigt. Der spielstabile Bereich liegt grob bei 905 bis 955 mV; unter 700 mV sperrt sich die GPU auf 1500 MHz fest.">
</p>

<p align="center">
  <img src="assets/diagrams/cu40-tradeoff.svg" width="100%" alt="40-CU-Freischaltung: Die Rechenleistung steigt von 40% auf 90%, während die Gaming-FPS nur von 40% auf 47% steigen, und Leistungsaufnahme samt Instabilität von 25% auf 100% klettern. 38 CU ist das typische stabile Maximum; 40 CU ist eine Lotterie, die über 300 W und eine AIO braucht.">
</p>

<p align="center">
  <img src="assets/diagrams/memory-tradeoff.svg" width="100%" alt="GDDR6-Speichertuning: Bandbreite und FPS-Gewinn bewegen sich nur von 30% auf 52%, während das Brick-Risiko von 20% auf 100% klettert. 1950 MHz ist der Punkt, an dem Boards gebrickt zurückkamen.">
</p>

<p align="center">
  <img src="assets/diagrams/power-by-config.svg" width="100%" alt="Gemessener Verbrauch an der Steckdose nach Konfiguration: 200 W bei 38 CU und 1200 MHz auf 850 mV, 260 W bei 40 CU und 1800 MHz auf 860 mV, 310 W bei 38 CU und 1500 MHz und 350 W bei 40 CU und 2000 MHz auf 960 mV, wobei 1025 mV nur 2 W mehr bringt. Der beste gemeldete Watt-pro-Frame-Punkt ist 40 CU bei 1800 MHz.">
</p>

Diese fünf Punkte sind Messwerte, kein Modell: Der Wechsel von 1800 auf 2000 MHz kostet etwa 90 W — ungefähr so viel wie die vorherigen 600 MHz gekostet haben — und 960 mV auf 1025 mV zu erhöhen bringt nichts außer 2 W Wärme. Bei 350 W löst ein 300-W-Netzteil innerhalb von 30 Sekunden aus, und die +12V-Schiene trägt 26 A.

<details>
<summary>Leerlaufleistung — warum sich der Stromzähler kaum bewegt</summary>

<p align="center">
  <img src="assets/diagrams/idle-power-tradeoff.svg" width="100%" alt="Leerlaufleistung: Der GPU-Verbrauch fällt über Governor, Undervolt und Auto-Suspend von 80 W auf 5 W, aber der Gesamtverbrauch an der Steckdose fällt nur von 125 W auf 110 W, bis Suspend ihn auf 10 W fallen lässt.">
</p>

Governor und Undervolt kappen die GPU, aber CPU und GDDR6 ziehen unabhängig davon weiter. Bis Auto-Suspend greift, merkt der Stromzähler kaum etwas. Chargen mit hoher Leckage landen im Minimum bei etwa 70–80 W.

</details>

<sub>Quelldaten: [`assets/diagrams/data.json`](assets/diagrams/data.json) · neu bauen mit `node assets/diagrams/build.mjs`</sub>

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
- [rw-r-r-0644/bc250-core-unlock](https://github.com/rw-r-r-0644/bc250-core-unlock) — die 2 deaktivierten CPU-Kerne freischalten (Standardmaske 0x77; eine 0xB7-Maske bedeutet physisch defekte Kerne — das Erzwingen erzeugt Artefakte und Abstürze)
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — alle 40 CUs freischalten
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Toolkits & fertige Images
- [redbeard1083/bc250-toolkit](https://github.com/redbeard1083/bc250-toolkit) — menügesteuerte Einrichtung für CachyOS: Kernel, CPU-/GPU-Governoren, Swap, ZRAM→ZSWAP, ACPI- und Boot-Tweaks
- [62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images](https://github.com/62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images) — vorgefertigte Bazzite-Deck/GNOME/KDE-Images mit den BC-250-Patches

### Treiber
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — Windows-GPU-Treiber (experimentell, Stand Anfang 2026 keine volle Beschleunigung)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — PSP/GPU-Treiberarbeit
- [DryhoppedIPA/bc250-gfx1013-fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix) — Kernel- + Mesa/RADV-Patches für die defekte GPU-Compute-Queue (Async-Compute); behebt auch den FSR-4-/XeSS-3-INT8-Pfad
- [MastaG/linux-cachyos-bc250](https://github.com/MastaG/linux-cachyos-bc250) — CachyOS-Kernel mit BC-250-Cherry-Picks
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — Linux-Kernel

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — die meistreferenzierten BIOS-Images & Mods
- [TheRetroWeb — BC-250-BIOS-Datenbank](https://theretroweb.com/bios?itemsPerPage=24&chipsetIds%5B%5D=1990) — Original-BIOS-Dumps, nach Version durchsuchen und herunterladen
- [Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script](https://github.com/Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script) — menügesteuertes Firmware-Backup und Flashen von Custom-Firmware
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
