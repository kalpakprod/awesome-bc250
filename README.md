<p align="center">
  <img src="assets/readme/bc250-hero.svg" alt="Awesome BC-250 — a source-linked guide to the ASRock AMD BC-250: Zen 2, RDNA 2 and 16 GB GDDR6 as board context, not a performance claim." width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> A curated guide to the **ASRock AMD BC-250**: a PlayStation 5-derived APU board (Cyan Skillfish / Oberon; 6-core Zen 2 plus RDNA 2 graphics, 16 GB GDDR6) repurposed as a low-cost Linux gaming and AI mini PC.

<sub>_Maintained · last updated **September 2026** · [llms.txt](llms.txt) for AI agents_</sub>

**English** · [Русский](README.ru.md) · [Українська](README.uk.md)

---

## Quick start

- **New owner.** Follow [docs/en/00-start-here.md](docs/en/00-start-here.md) in order: buy, power, cool, install an operating system, tune, play. The guide index below explains each step.
- **Gamer.** Start with [Gaming results & settings](docs/en/11-gaming.md) and [Emulation](docs/en/15-emulation.md). Read [Overclocking & undervolting](docs/en/09-overclock-undervolt.md) before you change clocks or voltage.
- **Researcher.** Start with [SOURCE_STATUS](SOURCE_STATUS.md), the dated source audit. Then read [BIOS & brick recovery](docs/en/08-bios.md) and [AI / LLM](docs/en/12-ai-llm.md).

---

## What the board is

- **Board.** An ex-mining APU board from the PlayStation 5 family: a 6-core Zen 2 CPU, 24 or 40 RDNA 2 **compute units** (CUs, the GPU's basic execution blocks), and 16 GB GDDR6 memory.
- **Price.** Community reports put a bare board near **$60–130**, and a full build with power supply, cooler, and SSD near **$150–250**. These are reports, not quotes.
- **Operating system.** Linux only for GPU acceleration: Bazzite, Fedora, CachyOS, or Arch with Mesa 25.1 or newer. The Windows GPU driver is experimental and is not a supported path.
- **Display, network, storage.** Display output is DisplayPort. WiFi and Bluetooth need a tested USB dongle. Storage uses an M.2 or SATA adapter.
- **Cooling and power.** Community guides describe added airflow for the stock heatsink and several power-connector configurations. Check the exact connector pinout and size the power supply for the measured build; see [Cooling](docs/en/04-cooling.md) and [Power supply](docs/en/03-power-supply.md).
- **Tuning evidence.** Community measurements compare GPU clocks, voltage, GDDR6 speed and CU counts; outcomes vary by board. The [source data](assets/diagrams/data.json) is not a universal safe setting or a board test.
- **Evidence caveat.** This page collects links and community reports. A README entry, a code match, or a successful build is not a board test. [SOURCE_STATUS](SOURCE_STATUS.md) separates what was verified from what remains open.

---

## Guide

- **[Start here](docs/en/00-start-here.md)** — the full path from a bare board to a running game.
- **Build basics:** [What is the BC-250](docs/en/01-what-is-bc250.md) · [Buying](docs/en/02-buying.md) · [Power supply](docs/en/03-power-supply.md) · [Cooling](docs/en/04-cooling.md) · [Cases & 3D printing](docs/en/05-case.md).
- **Software:** [Linux drivers & setup](docs/en/06-linux.md) · [Windows drivers & setup](docs/en/07-windows.md) · [macOS / Hackintosh](docs/en/13-macos.md).
- **Tuning & firmware:** [Overclocking & undervolting](docs/en/09-overclock-undervolt.md) · [BIOS & brick recovery](docs/en/08-bios.md).
- **Peripherals & output:** [WiFi & Bluetooth dongles](docs/en/10-wifi-bt.md) · [Display & output](docs/en/14-display.md) · [USB, hubs & peripherals](docs/en/16-usb-peripherals.md).
- **Workloads:** [Gaming results & settings](docs/en/11-gaming.md) · [AI / LLM](docs/en/12-ai-llm.md) · [Emulation](docs/en/15-emulation.md).
- **Help:** [FAQ](docs/en/faq.md) · [Troubleshooting](docs/en/troubleshooting.md).

---

## Community resources


### Documentation
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) — the main hardware reference (reverse-engineering)
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [site](https://elektricm.github.io/amd-bc250-docs/) — comprehensive community docs (pinouts, per-distro, troubleshooting)
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — organization documentation
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — builds and scripts

### Overclock / Undervolt / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — GPU clock and voltage governor; check its own prerequisites before use
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — oberon-governor fork with a Linux GUI
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [bc250-collective fork](https://github.com/bc250-collective/cyan-skillfish-governor)
- [rw-r-r-0644/bc250-core-unlock](https://github.com/rw-r-r-0644/bc250-core-unlock) — project for enabling disabled CPU cores; a mask value alone does not prove core health, and forcing extra cores can hang a board
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — project for enabling up to 40 CUs; the result is board-specific and unverified here
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Toolkits & ready-made images
- [redbeard1083/bc250-toolkit](https://github.com/redbeard1083/bc250-toolkit) — menu-driven setup for CachyOS: kernel, CPU/GPU governors, swap, ZRAM→ZSWAP, ACPI and boot tweaks
- [movacx/bc250-control-center](https://github.com/movacx/bc250-control-center) — Linux GUI project for BC-250 monitoring and tuning; it also offers privileged and firmware operations, so read its prerequisites and recovery guidance before using those functions
- [62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images](https://github.com/62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images) — prebuilt Bazzite Deck/GNOME/KDE images with the BC-250 patches applied

### Drivers
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — Windows GPU driver (experimental, no full acceleration as of early 2026)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — PSP and GPU driver development
- [DryhoppedIPA/bc250-gfx1013-fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix) — kernel + Mesa/RADV patches for the broken GPU compute queue (async compute); also fixes the FSR 4 / XeSS 3 INT8 path
- [MastaG/linux-cachyos-bc250](https://github.com/MastaG/linux-cachyos-bc250) — CachyOS kernel with BC-250 cherry-picks
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — Linux kernel

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — community BIOS images and modifications
- [TheRetroWeb — BC-250 BIOS database](https://theretroweb.com/bios?itemsPerPage=24&chipsetIds%5B%5D=1990) — stock BIOS dumps, browse/download by version
- [Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script](https://github.com/Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script) — menu-driven firmware backup and custom-firmware flashing
- See [docs/en/08-bios.md](docs/en/08-bios.md) for flashing and brick recovery

### WiFi / BT dongles
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### AI / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Cases / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables & MakerWorld — see [docs/en/05-case.md](docs/en/05-case.md)

---

## Research scope and status

<p align="center">
  <img src="assets/readme/evidence-flow.en.svg" alt="Evidence flow: code and community reports are pinned to fixed revisions, compared, then summarised in a guide of facts and open questions; a source report is not a board test." width="100%">
</p>

- **Scope.** [SOURCE_STATUS](SOURCE_STATUS.md) reports a dated source audit as of 2026-09-29, not all information about the BC-250. Coverage is bounded to the source set stated there.
- **What was inventoried.** A repository-name search found 971 public GitHub repositories; known Discord sources hold 338,589 message IDs; three Reddit listings exposed 1,441 post IDs. These are counts of identifiers.
- **What remains open.** Archived forum threads, deleted or private messages, attachment contents, and many repositories outside the name set are not covered. Disputes such as whether `I2C_HEADER1` reaches a live PMBus stay unresolved.
- **Translation note.** Detailed Ukrainian guide pages may lag the English and Russian factual updates. This README itself is translated in all three languages.
- **Reading the numbers.** An identifier count shows coverage of a source list; it does not confirm that any listed project works on the board.

---

## Contributing and safety

- **Contributions.** The knowledge here is extracted from community chat by a reproducible pipeline; see [CONTRIBUTING.md](CONTRIBUTING.md). Fixes, new dongles, new cases, and verified commands are welcome.
- **Safety.** Firmware and BIOS changes carry brick risk. Keep a full dump and a tested recovery path before flashing; see [BIOS & brick recovery](docs/en/08-bios.md).
- **Reported risk.** The 40-CU and memory overclocks have returned boards as bricks in community reports. Prefer the smallest staged change and keep a stock control.
- **No guarantee.** Nothing here is board-verified unless a specific test says so. Do not treat a merged file or a passing build as hardware confirmation.
- **License.** Documentation uses [CC-BY-SA-4.0](LICENSE); scripts in `assets/scripts/` use MIT.
- **Third-party rights.** Mirrored firmware and drivers retain their owners’ rights; see [the firmware disclaimer](assets/firmware/DISCLAIMER.md). Contributors are listed in [CREDITS](CREDITS.md).
