<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — the newcomer's bible for the AMD BC-250" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> The newcomer's bible for the **ASRock AMD BC-250** — a PlayStation 5-derived APU board (Cyan Skillfish / Oberon, 6-core Zen 2 + RDNA 2, 16 GB GDDR6) repurposed as a cheap **Linux gaming & AI mini PC** — a DIY budget Steam Machine.

Everything you need to go **from a board in a box to running games** — curated from 130k+ messages of the BC-250 community, ranked by what people upvoted and pinned, and cross-checked against the canonical project repos.

🌍 **English** · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<sub>_Maintained · last updated **August 2026** · [llms.txt](llms.txt) for AI agents_</sub>

---

## ❓ Quick answers

- **What is the ASRock AMD BC-250?** A PlayStation 5-derived APU board — 6-core Zen 2 + 24/40 RDNA 2 CUs ("Cyan Skillfish"), 16 GB GDDR6 — sold cheap as an ex-mining card and repurposed into a Linux gaming & AI mini PC, a DIY budget Steam Machine.
- **How much does it cost?** Around **$60–130** for the bare board; a full build (PSU, cooler, SSD) lands near **$150–250**. See [Buying](docs/en/02-buying.md).
- **How well does it game?** Roughly **1080p 60 FPS** in most titles (RX 6600-class) with FSR / Frame-Gen and a GPU+CPU overclock. See [Gaming results](docs/en/11-gaming.md).
- **Which OS?** **Linux only** for GPU acceleration — Bazzite, Fedora, CachyOS or Arch with Mesa 25.1+. There is no Windows GPU driver. See [Linux setup](docs/en/06-linux.md).
- **Can it run LLMs?** Yes — llama.cpp / Ollama over Vulkan use the 16 GB GDDR6 as VRAM (~30–47 tok/s on small models). See [AI / LLM](docs/en/12-ai-llm.md).
- **How do I cool it?** The stock server heatsink throttles on a desk; thin the fins and add a 120 mm fan, or go water. See [Cooling](docs/en/04-cooling.md).

---

## ⚡ Start Here

New board, know nothing? Follow the golden path in order:

**[docs/en/00-start-here.md](docs/en/00-start-here.md)** — Buy → Power → Cool → Install OS → Drivers → Overclock → Play.

---

## 📈 What tuning actually buys you

Every knob on this board trades something. These are the four that matter, drawn from what the community measured — read them before you flash anything.

<p align="center">
  <img src="assets/diagrams/gpu-clock-tradeoff.svg" width="100%" alt="GPU core clock: FPS gain rises to about 95% by 2000 MHz and then flattens as the CPU limits it, while power and heat keep climbing to 95%. Sweet spot around 2000 MHz, roughly +30% FPS.">
</p>

<p align="center">
  <img src="assets/diagrams/undervolt-tradeoff.svg" width="100%" alt="Undervolt: efficiency climbs from 20% to 95% as voltage drops from 1129 mV to 700 mV, while instability risk climbs from 15% to 100%. Game-stable range is roughly 905 to 955 mV; below 700 mV the GPU locks itself to 1500 MHz.">
</p>

<p align="center">
  <img src="assets/diagrams/cu40-tradeoff.svg" width="100%" alt="40-CU unlock: compute rises from 40% to 90% while gaming FPS moves only from 40% to 47%, and power with instability climbs from 25% to 100%. 38 CU is the typical stable maximum; 40 CU is a lottery needing over 300 W and an AIO.">
</p>

<p align="center">
  <img src="assets/diagrams/memory-tradeoff.svg" width="100%" alt="GDDR6 memory tuning: bandwidth and FPS gain move only from 30% to 52% while brick risk climbs from 20% to 100%. 1950 MHz is where boards came back bricked.">
</p>

<p align="center">
  <img src="assets/diagrams/power-by-config.svg" width="100%" alt="Measured wall draw by configuration: 200 W at 38 CU and 1200 MHz on 850 mV, 260 W at 40 CU and 1800 MHz on 860 mV, 310 W at 38 CU and 1500 MHz, and 350 W at 40 CU and 2000 MHz on 960 mV, with 1025 mV adding only 2 W more. The best watts-per-frame point reported is 40 CU at 1800 MHz.">
</p>

Those five points are measurements, not a model: going from 1800 to 2000 MHz costs about 90 W — roughly what the previous 600 MHz cost — and pushing 960 mV to 1025 mV buys nothing but 2 W of heat. At 350 W a 300 W supply trips within 30 seconds and the +12V rail is carrying 26 A.

<details>
<summary>Idle power — why the wall meter barely moves</summary>

<p align="center">
  <img src="assets/diagrams/idle-power-tradeoff.svg" width="100%" alt="Idle power: GPU draw falls from 80 W to 5 W across governor, undervolt and auto-suspend, but total wall draw only falls from 125 W to 110 W until suspend drops it to 10 W.">
</p>

The governor and undervolt cut the GPU, but the CPU and GDDR6 keep drawing regardless. Until auto-suspend kicks in, the wall meter hardly notices. High-leakage batches floor out around 70–80 W.

</details>

<sub>Source data: [`assets/diagrams/data.json`](assets/diagrams/data.json) · rebuild with `node assets/diagrams/build.mjs`</sub>

---

## 📚 Handbook

| # | Section | For |
|---|---------|-----|
| 01 | [What Is the BC-250](docs/en/01-what-is-bc250.md) | specs, sizes, pinout, expectations |
| 02 | [Buying Guide](docs/en/02-buying.md) | where, price, risks, group buys |
| 03 | [Power Supply](docs/en/03-power-supply.md) | LOP / Flex ATX, 8-pin pinout, wiring |
| 04 | [Cooling](docs/en/04-cooling.md) | heatsink, fan shrouds, test method |
| 05 | [Cases & 3D Printing](docs/en/05-case.md) | printable cases catalog (STL) |
| 06 | [Linux Drivers & Setup](docs/en/06-linux.md) | distro choice, amdgpu, install |
| 07 | [Windows Drivers & Setup](docs/en/07-windows.md) | driver status, how-to |
| 08 | [BIOS & Brick Recovery](docs/en/08-bios.md) | mod BIOS, flashing, un-brick |
| 09 | [Overclocking & Undervolting](docs/en/09-overclock-undervolt.md) | governor, SMU, 40CU unlock |
| 10 | [WiFi & Bluetooth Dongles](docs/en/10-wifi-bt.md) | dongles that actually work |
| 11 | [Gaming Results & Settings](docs/en/11-gaming.md) | benchmarks, per-game tuning |
| 12 | [AI / LLM on BC-250](docs/en/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/en/13-macos.md) | status |
| 14 | [Display & Output](docs/en/14-display.md) | DisplayPort, DP→HDMI adapters, dual screen |
| 15 | [Emulation](docs/en/15-emulation.md) | every console/platform, realistic status |
| 16 | [USB, Hubs & Storage](docs/en/16-usb-peripherals.md) | hubs, 5V mod, M.2 / SATA adapters |
| ❓ | [FAQ](docs/en/faq.md) · [Troubleshooting](docs/en/troubleshooting.md) | common problems |

---

## 🔗 Awesome Resources

Canonical community projects, ranked by how often the community pointed to them.

### Documentation
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) — the main hardware reference (reverse-engineering)
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [site](https://elektricm.github.io/amd-bc250-docs/) — comprehensive community docs (pinouts, per-distro, troubleshooting)
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — organization documentation
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — builds and scripts

### Overclock / Undervolt / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — the governor most builds run (sets clocks and voltage)
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — oberon-governor fork with a Linux GUI
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [bc250-collective fork](https://github.com/bc250-collective/cyan-skillfish-governor)
- [rw-r-r-0644/bc250-core-unlock](https://github.com/rw-r-r-0644/bc250-core-unlock) — unlock the 2 disabled CPU cores (stock mask 0x77; a 0xB7 mask means physically defective cores — forcing it gives artifacts and crashes)
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — unlock all 40 CUs
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Toolkits & ready-made images
- [redbeard1083/bc250-toolkit](https://github.com/redbeard1083/bc250-toolkit) — menu-driven setup for CachyOS: kernel, CPU/GPU governors, swap, ZRAM→ZSWAP, ACPI and boot tweaks
- [62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images](https://github.com/62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images) — prebuilt Bazzite Deck/GNOME/KDE images with the BC-250 patches applied

### Drivers
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — Windows GPU driver (experimental, no full acceleration as of early 2026)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — PSP and GPU driver development
- [DryhoppedIPA/bc250-gfx1013-fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix) — kernel + Mesa/RADV patches for the broken GPU compute queue (async compute); also fixes the FSR 4 / XeSS 3 INT8 path
- [MastaG/linux-cachyos-bc250](https://github.com/MastaG/linux-cachyos-bc250) — CachyOS kernel with BC-250 cherry-picks
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — Linux kernel

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — most-referenced BIOS images and mods
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

## 🤝 Contributing

This is a **living** repo. Knowledge is extracted from the community chat by a reproducible pipeline (see [CONTRIBUTING.md](CONTRIBUTING.md)) and re-run on new exports. PRs with fixes, new dongles, new cases, verified commands welcome.

## 📄 License

Docs: [CC-BY-SA-4.0](LICENSE). Scripts under `assets/scripts/`: MIT. Mirrored third-party firmware/drivers retain their original rights — see [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md).

## 🙏 Credits

The entire BC-250 community — see **[CREDITS](CREDITS.md)** for the top contributors who made this handbook possible. Source: *the AMD BC-250 community chat*. Project authors credited by their repo handle above.
