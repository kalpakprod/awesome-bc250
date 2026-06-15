# FAQ

> **TL;DR** — The questions newcomers ask in the first week, with short correct answers and a link to the full section for each. If an answer feels too short, that's deliberate — the depth lives in the linked handbook page.

This is a quick-reference. For the guided "board in a box → running games" path, start at [00-start-here.md](00-start-here.md).

---

## Hardware & what I bought

**What actually is the BC-250?**
A PlayStation 5-derived APU (AMD **Cyan Skillfish** / Oberon) on a crypto-mining/server board: **6-core/12-thread Zen 2 CPU + 24-CU RDNA 2 GPU + 16 GB soldered GDDR6**. It's not a graphics card and not a normal PC — no PCIe slot, no 24-pin ATX, no familiar BIOS. See [01-what-is-bc250.md](01-what-is-bc250.md).

**Is it plug-and-play? Should I have bought it?**
No. It needs driver work, a cooling mod and weird power — it's a tinkerer's board. One veteran's line: it "requires certain skills, effort and brains." If you want zero hassle, return it; if you like projects, it's the cheapest Linux gaming / local-AI box at this tier. See [01-what-is-bc250.md](01-what-is-bc250.md).

**Can I add more RAM?**
No. The 16 GB GDDR6 is soldered and shared between CPU and GPU; there are no DIMM slots. You only choose how much of the pool the GPU reserves (UMA), set in a modded BIOS. See [01-what-is-bc250.md](01-what-is-bc250.md) and [08-bios.md](08-bios.md).

**Does it have a power button?**
No. It powers on the instant 12 V arrives — the PSU's own switch is your power button. See [03-power-supply.md](03-power-supply.md).

**My board won't POST / black screen out of the box — dead?**
Often not. Many boards ship needing a **BIOS/CMOS reset** before they'll POST, and some arrive slightly **bent** from the heatsink mount — one owner fixed a no-boot by shimming the board flat with paper. Try those before declaring it dead. See [01-what-is-bc250.md](01-what-is-bc250.md).

**Can it record/stream games with the GPU?**
Not in hardware. The video-encode block (VCN) is unavailable, so OBS/streaming falls back to a **software (CPU) encoder** — it works (people use Sunshine/Moonlight) but costs CPU and quality. See [01-what-is-bc250.md](01-what-is-bc250.md).

**What are the thermal-pad thicknesses for the backplate mod?**
Community-reported: **memory 2 mm, chipset 1.5 mm** ([src](https://t.me/c/2424231195/22442)). The back GDDR6 has no temperature sensor, so you cool it blind. See [04-cooling.md](04-cooling.md).

## Power

**What power supply do I need?**
A **single-rail 12 V** source delivering **≥300 W** into a **PCIe 8-pin (6+2)** connector. Three common roads: a normal ATX/SFX PSU (just plug its PCIe cable in — easiest), a cheap used HP Flex 500 W server PSU, or a Mean Well industrial brick. See [03-power-supply.md](03-power-supply.md).

**Can I use the CPU/EPS 8-pin from my PSU?**
**No — it can burn the board.** The PCIe and CPU/EPS 8-pins look almost identical but have **reversed polarity**. The board has no sense-check; use the **PCIe** cable, and verify with a multimeter if unsure. See [03-power-supply.md](03-power-supply.md).

**My old 750 W PSU has plenty of watts — why does it struggle?**
Old units often **split 12 V across multiple weak rails**, and no single rail covers the ~235 W the board pulls. Prefer a modern single-rail / DC-DC PSU, or one with big headroom. See [03-power-supply.md](03-power-supply.md).

**My power cable got hot / smoked. Why?**
Almost certainly **fake copper** — copper-clad steel or aluminium wire, which has many times the resistance of real copper and overheats under load (one member's pre-made PCIe splitter literally smoked) ([src](https://t.me/c/2424231195/97202)). Test with a magnet: it sticks to steel, not copper. Use real copper, **16 AWG or thicker**. See [03-power-supply.md](03-power-supply.md).

## Cooling

**Why does it overheat / throttle out of the box?**
The stock heatsink is **passive**, built for a mining rack's forced-air tunnel. On a desk with no airflow it heat-soaks and throttles. Throttling starts ~**85 °C**, hard reset ~**90 °C**. See [04-cooling.md](04-cooling.md).

**What's the cheapest cooling fix that actually works?**
**Thin out the dense stock fins** (orbital sander is fastest) and bolt a **120 mm high-static-pressure fan** blowing through them via a printed shroud. Reference results: Noctua NF-P12 → ~73 °C Furmark, 63–65 °C games ([src](https://t.me/c/2424231195/42843)); Arctic P12 Max holds ~75 °C ([src](https://t.me/c/2424231195/58869)). See [04-cooling.md](04-cooling.md).

**Why a high-static-pressure fan, not a high-airflow "case fan"?**
Dense fins are a high-resistance load — a high-airflow case fan just stalls against them, while a high-static-pressure fan (Noctua/Arctic P12) actually pushes air *through*. For very dense fins, two fans in **push–pull (series)**, not side-by-side. See [04-cooling.md](04-cooling.md).

**How do I know my cooling is enough?**
Stress the **GPU and CPU together** (they share one heatsink) — Furmark VK plus a CPU load — **under your overclock** (2000 MHz, not stock), and keep load under ~85 °C. There's a pinned test procedure. See [04-cooling.md](04-cooling.md).

## Linux

**Which distro should I install?**
For "just play games," flash **Bazzite** and rebase to the **`bazzite-bc250`** image — the GPU fixes are baked in. To learn the machine: **Fedora** (COPR + setup script) or **CachyOS/EndeavourOS** (Arch). See [06-linux.md](06-linux.md).

**I installed Linux and everything is slow / single-digit FPS. Why?**
The GPU isn't being accelerated — you're on software (LLVMpipe) rendering. You need a **fresh Mesa (25.1+)**, the **`cyan_skillfish` firmware symlink** (or a patched package), and the right kernel params. Confirm with `vulkaninfo | grep deviceName` (it should *not* say `llvmpipe`). See [06-linux.md](06-linux.md).

**Black screen after a kernel update — how do I fix it?**
On most distros the fix is the firmware symlink so amdgpu can load:
```bash
sudo ln -s /lib/firmware/amdgpu/navi10_gpu_info.bin.zst \
           /lib/firmware/amdgpu/cyan_skillfish_gpu_info.bin.zst
```
This survives kernel updates (but **not** on Bazzite, and a firmware/amdgpu update can wipe it) ([src](https://t.me/c/2424231195/98882)). Otherwise boot an older/LTS kernel and version-lock the bad one. See [06-linux.md](06-linux.md).

**Should I install apps as Flatpaks?**
Avoid them for anything graphical. Flatpaks bundle their **own Mesa**, overriding the board's patched one, so they run **without hardware acceleration**. PortProton, for example, must be installed via the terminal, not Flatpak ([src](https://t.me/c/2424231195/17949), [src](https://t.me/c/2424231195/47092)). See [06-linux.md](06-linux.md).

**My CPU feels weak — any quick wins?**
Two kernel tweaks: **`mitigations=off`** (disables CPU vulnerability mitigations) ([src](https://t.me/c/2424231195/23359)) and **`nosmt=force`** (disables SMT — +15–25 % FPS in lightly-threaded games, but hurts heavy multitasking like OBS at high bitrate) ([src](https://t.me/c/2424231195/61332)). Both are security/throughput trade-offs. See [06-linux.md](06-linux.md).

**GNOME/KDE on Wayland is glitchy — what do I do?**
Known issue. Members report Wayland sessions (typically GNOME/KDE) misbehave on this board; **use the X11 session** instead ([src](https://t.me/c/2424231195/19623)). See [06-linux.md](06-linux.md).

**My RAM fills up fast — can I get more swap?**
Yes, grow the **zRAM** swap (compressed RAM swap) — the community recipe bumps it to 32 GB and makes it persistent in `/etc/systemd/zram-generator.conf` ([src](https://t.me/c/2424231195/38703)). It doesn't add real memory but absorbs spikes. See [06-linux.md](06-linux.md).

**A kernel update broke things — how do I roll back?**
The system keeps the last few kernels. On Fedora, list them with `grubby` and `grubby --set-default /boot/vmlinuz-…`, then reboot ([src](https://t.me/c/2424231195/39393)). When in doubt, run an **LTS kernel**. See [06-linux.md](06-linux.md).

## Windows

**Is there a Windows driver yet?**
No — as of early 2026 there is **no working Windows GPU driver**. Windows boots but the GPU sits at **Code 43** with no 3D. Two from-scratch reverse-engineering efforts exist (Keshas-dev, ZEROAESQUERDA) but they're at the "can the GPU initialize at all" stage, not gaming. See [07-windows.md](07-windows.md).

**Can't I just force-install an RX 6700 / W5700 driver?**
No. Every official `.inf` (including the W5700 that Windows offers as "compatible") installs then hangs on Code 43 — the device ID `1002:13FE` is welded to the APU. This is every newcomer's first idea and it can't work. See [07-windows.md](07-windows.md).

**What about a Windows VM with GPU passthrough?**
Doesn't work — IOMMU passthrough is broken on this board, it's an APU (not a clean discrete card to hand off), and the chip is mis-detected anyway. See [07-windows.md](07-windows.md).

**I saw an "NVIDIA driver for BC-250" / a `…bc250.exe` — real?**
No. The "NVIDIA driver" was an **April Fools' joke**, and an Adrenalin installer with "bc250" tacked onto the filename is still just a normal Adrenalin installer. Only run binaries from the named GitHub repos, and read the code — fake "drivers" have been malware. See [07-windows.md](07-windows.md).

## BIOS & recovery

**Should I flash a modded BIOS?**
Only if you want to unlock overclock/timings/iGPU-VRAM **and** you have recovery hardware ready. A wrong setting can **brick the board dead**, and on this board a **CMOS clear doesn't always recover it**. Use the current 5.00-based mod, verify the SHA-256, and never disable Integrated Graphics (it's your only display). See [08-bios.md](08-bios.md).

**I bricked it — can I un-brick it?**
Usually yes, but only with hardware: a **CH341A-class SPI programmer** wired to the board's **J4004 header** (the SOIC clip does *not* work here) to re-flash the 16 MB chip. Watch the CH341A 3.3 V data-line trap. See [08-bios.md](08-bios.md).

**I changed the VRAM split but the OS still shows the old amount.**
**Clear CMOS** after flashing/changing UMA — remove the CR2032 for 60+ s or short the CMOS jumper. Some settings (notably VRAM/UMA) don't apply until you do ([src](https://t.me/c/2424231195/97290)). See [08-bios.md](08-bios.md).

## Overclock & undervolt

**How do I overclock? Is it worth it?**
Run a **governor** (most builds use **oberon-governor**) and raise the GPU toward **2000 MHz** (~+30 % FPS *when GPU-bound*). The newer `bc250_smu_oc` also overclocks the CPU (~4 GHz @ 1275 mV). **Cool the board first** — OC above ~90 °C resets it. See [09-overclock-undervolt.md](09-overclock-undervolt.md).

**What's the 40-CU unlock?**
The die physically has **40 CUs** but firmware leaves only **24** active. A patched amdgpu + `amdgpu.bc250_cc_write_mode=3` re-enables all 40 — a bigger GPU win than clocks (one Superposition run went 4647 → 6863). It needs rebuilding the kernel module and is Linux-only. See [09-overclock-undervolt.md](09-overclock-undervolt.md).

**What voltage should I set?**
Every chip differs (silicon lottery). Common game-stable points: **2000 MHz ≈ 955 mV** (~75 °C). Validate in **real games + alt-tab/menus**, not just Furmark, which hides instability. Hard CPU limit: **never exceed 1.325 V Vid**. See [09-overclock-undervolt.md](09-overclock-undervolt.md).

**Is a too-aggressive undervolt dangerous?**
No — at worst the board drops out or disables the M.2 slot, and it clears in a few seconds because the OC isn't stored in BIOS. Over-*volting* the CPU is the dangerous direction. See [09-overclock-undervolt.md](09-overclock-undervolt.md).

## Display, WiFi & Bluetooth

**No picture over HDMI?**
The board outputs over **DisplayPort**; for HDMI/TV use a **DP→HDMI adapter or cable** (a good one also works in the BIOS and does 4K) ([src](https://t.me/c/2424231195/24107)). Prefer a real **DP→HDMI cable** over a cheap passive adapter — a bad adapter caused black screens for one member ([src](https://t.me/c/2424231195/96416)).

**Audio over DisplayPort is distorted.**
Known issue on Linux. The simple fix is to output through a **DP→HDMI** adapter, which carries clean audio ([src](https://t.me/c/2424231195/17953)). See [01-what-is-bc250.md](01-what-is-bc250.md).

**Does it have WiFi/Bluetooth?**
No onboard wireless — you need a **USB dongle**, chosen by **chipset, not brand**. Best-documented is an **aic8800d80** stick; cheap Realtek RTL8821/8822 sticks work with `lwfinger/rtw88` but drop under load. For setup, a wired USB-Ethernet adapter sidesteps the whole issue. See [10-wifi-bt.md](10-wifi-bt.md).

**My WiFi dongle keeps disconnecting.**
Classic Realtek-on-BC-250 symptom: install the right out-of-tree driver (rtw88 / rtl8831), try a rear USB port, and reset with `usbreset` instead of unplugging. If reliability matters more than price, switch to aic8800d80 or a confirmed Digma stick. See [10-wifi-bt.md](10-wifi-bt.md).

## Gaming & AI

**What FPS can I expect?**
At a real **2000 MHz** OC: modern AAA at **40–60 FPS**, lighter/older games past 60. Best at **1080p–1440p** with FSR. The board is usually **CPU-bound**, so resolution is often "free" but physics-heavy/badly-threaded games stutter regardless. See [11-gaming.md](11-gaming.md).

**Which games run best?**
**First-party PlayStation ports** (God of War, Horizon, The Last of Us, Spider-Man, Ghost of Tsushima) — they lean on the GPU and are well-optimized. Emulation: Switch (Eden) and PS4 (shadPS4) are solid; Xbox 360 (Xenia) is not. See [11-gaming.md](11-gaming.md).

**Why is my GPU at ~40 % load but FPS is low?**
You're **CPU-bound** — the 6-core Zen 2 is the bottleneck, not the GPU. Upscaling won't lift FPS much in that case; try `nosmt=force`/`mitigations=off` and accept that some titles are CPU-limited. See [11-gaming.md](11-gaming.md).

**Can I run local LLMs / AI on it?**
Yes — the 16 GB GDDR6 holds mid-size models via `llama.cpp`/Jan on the **Vulkan** backend; set the BIOS to allocate ~12 GB to the GPU first. See [12-ai-llm.md](12-ai-llm.md).

## Buying

**What's a fair price, and where do I buy?**
Prices and sources move fast and are region-specific (eBay, AliExpress, Ozon/Avito in CIS) — recent reports cluster around the low-$100s to ~13k₽. See [02-buying.md](02-buying.md).

**What are the risks of buying one?**
It's used mining/server hardware: boards can arrive needing a BIOS reset, slightly bent, or occasionally faulty, and there's no vendor support — the community is your support. Budget time, not just money. See [01-what-is-bc250.md](01-what-is-bc250.md) and [02-buying.md](02-buying.md).

**Can I run macOS on it?**
Don't. The CPU may boot, but the **GPU will never accelerate** (no supported twin to spoof, and no AMD APU iGPU has ever worked in macOS). Use Linux. See [13-macos.md](13-macos.md).

---

## Sources

- Source chat: *AMD BC-250 community* (Telegram). Most answers summarize a full handbook section — follow the section link for the underlying citations.
- Thermal-pad thicknesses — https://t.me/c/2424231195/22442
- Arctic P12 Max ~75 °C — https://t.me/c/2424231195/58869 · Noctua P12 ~73 °C — https://t.me/c/2424231195/42843
- Black-screen-after-kernel firmware symlink fix (not Bazzite) — https://t.me/c/2424231195/98882
- Flatpak breaks hardware accel — https://t.me/c/2424231195/17949 · PortProton via terminal — https://t.me/c/2424231195/47092
- `mitigations=off` for weak CPU — https://t.me/c/2424231195/23359 · `nosmt=force` FPS gain — https://t.me/c/2424231195/61332
- Wayland glitches, use X11 — https://t.me/c/2424231195/19623
- zRAM swap increase — https://t.me/c/2424231195/38703 · kernel selection/rollback — https://t.me/c/2424231195/39393
- Power splitter overheated/smoked (fake copper) — https://t.me/c/2424231195/97202
- CMOS clear needed after VRAM change — https://t.me/c/2424231195/97290
- DP→HDMI adapter (4K/TV, works in BIOS) — https://t.me/c/2424231195/24107 · bad adapter → black screen — https://t.me/c/2424231195/96416 · DP audio distortion fix — https://t.me/c/2424231195/17953

> This FAQ is a map, not the territory — every answer points to the section that carries the detail and the primary sources. Corrections welcome via PR (see [CONTRIBUTING.md](../../CONTRIBUTING.md)).
