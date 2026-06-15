# Emulation

> **TL;DR** — The BC-250 is a surprisingly good emulation box because it pairs a PS5-class RDNA2 GPU with 16 GB of fast GDDR6 — but emulation is **heavily CPU-bound**, and the cut-down **6-core Zen 2** at ~3.5 GHz is the ceiling for the demanding systems. **Everything up to and including PS2 / GameCube / Wii / PSP / Dreamcast is the comfortable zone** (retro is trivial; PSP is chat-confirmed running in 4× internal res). **Switch / PS3 / PS4 are demanding and hit-or-miss**, and **Xbox 360 barely boots**. Chat-proven on the board: **Switch via Eden** "works well and fast", **PS3 via RPCS3** works with per-game tuning, **PS4 via shadPS4** runs Bloodborne well, **PSP via PPSSPP** runs great, and **Xbox 360 via Xenia** is broken in-game. **Overclock and cool the board first** — without a governor the GPU sits at ~1000 MHz inside an emulator and chokes. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/130879))

This page is the deep dive; [11-gaming.md](11-gaming.md) has the short version inside its results table. ROMs/keys/BIOS are your problem to source legally — none of that is covered here.

> **How to read the status column.** This board was discussed unevenly: a handful of systems were tested first-hand in the chat, most retro systems were not. So every row is tagged:
> - **✅ / ⚠️ / ❌ (chat)** — a member ran it *on a BC-250* and reported the result, with the message cited.
> - **(general ⚠)** — the **best-known Linux emulator and the general expectation for this class of hardware** (Zen 2 + RDNA2). **Not BC-250-tested.** Treat it as "should be fine / should be hard", never as a measured promise. No BC-250-specific FPS numbers are invented anywhere on this page.

---

## Do these two things before you emulate anything

Emulation amplifies both of the board's quirks, so the prerequisites matter more here than in normal gaming:

1. **Overclock first.** A member who tried Switch emulation on a stock board found the GPU pinned at **1000 MHz inside the emulator** even though normal games clocked fine — the fix was setting the governor to its max clock manually before launching. ([src](https://t.me/c/2424231195/130879)) Run the **oberon-governor** at **2000 MHz** (and consider the CPU OC to 4 GHz), per [09-overclock-undervolt.md](09-overclock-undervolt.md) — emulation needs every megahertz the CPU can give.
2. **Cool first.** 2000 MHz needs the cooling mod or the board throttles/resets. Do [04-cooling.md](04-cooling.md) before chasing the overclock.

> **Why CPU-bound matters so much here.** A game engine is tuned for the hardware it ships on; an emulator instead *simulates* another console's CPU on yours, which is far heavier per frame. On the BC-250 the **6 Zen 2 cores at ~3.5 GHz** ([hardware spec](https://elektricm.github.io/amd-bc250-docs/hardware/specifications/)) are the limiter for Switch/PS3/PS4 — the PS5-class GPU usually has headroom to spare. One member chasing better Switch performance saw exactly this: in-game the **GPU sits heavily underused while the CPU is the wall**. ([src](https://t.me/c/2424231195/136712)) More cores don't help an emulator's hot thread; clock speed and IPC do. This is the same CPU bottleneck described in [11-gaming.md](11-gaming.md), just sharper.

---

## Getting started — three ways to install

This board has no emulation-specific quirks beyond the two prerequisites above — it's a normal Linux PC to the emulators. Pick one of:

- **EmuDeck** — the fastest way to get a full multi-system setup in one shot. It downloads and pre-configures the whole standalone stack (RetroArch, PCSX2, Dolphin, DuckStation, PPSSPP, melonDS, Ryujinx, …), wires up controllers, and was confirmed working on the board ("the Ryujinx that ships with EmuDeck is also good"). ([src](https://t.me/c/2424231195/99039)) It targets Steam Deck / Linux, which suits the BC-250's typical Bazzite/CachyOS/Arch install ([06-linux.md](06-linux.md)). **RetroDECK** (a Flatpak-contained equivalent) is the same idea if you prefer one sandboxed app.
- **RetroArch** — one front-end, many "cores" (emulators-as-plugins). Ideal for everything 8/16/32-bit through PS1/N64/DS — install once, add the cores below, point it at your ROMs. Available as Flatpak on every BC-250 distro.
- **Standalone emulators** — for the heavy systems (Switch, PS3, PS4, PS2, GameCube/Wii, Xbox) the dedicated standalone app beats the RetroArch core on features and compatibility. **Install the native Linux build** where you can — early BC-250 testing showed native builds (Ryujinx) behaving better than Windows builds run through Proton. ([src](https://t.me/c/2424231195/23577)) Most are on Flathub or in the Arch AUR (e.g. `paru -S cemu`). ([src](https://t.me/c/2424231195/74138))

Then **launch through Steam** ("add a non-Steam game") for controller support and an overlay — the same flow the chat uses for everything else (see [11-gaming.md](11-gaming.md)).

> **Want a dedicated emulation distro instead?** **Batocera** (a ready-made emulation distro + frontend) is **community-confirmed running on the BC-250** ([r/linux_gaming community thread](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)) — boot it instead of a desktop Linux and you get a console-style, plug-and-play emulation box rather than installing emulators one by one. It's listed as a confirmed-booting distro in [06-linux.md](06-linux.md). The same overclock + cooling prerequisites still apply.

> **Watch the governor.** If an emulator runs slow, check your clocks before blaming the emulator: it may be sitting at 1000 MHz. Set the oberon-governor to its max value (some run it pinned at ~2250 MHz) before launching, then verify with an overlay (`amdgpu_top` / MangoHud). ([src](https://t.me/c/2424231195/130879), [src](https://t.me/c/2424231195/130955))

> **No preconfigured emulation image.** Newcomers regularly ask for a ready-made image with emulators set up. The community treats a shared "configured BC-250 image" as taboo — set it up yourself from the guides; it's not hard once the board is overclocked. ([src](https://t.me/c/2424231195/130845), [src](https://t.me/c/2424231195/130877))

---

## What the community actually ran

The single most useful data point is one member's roundup after testing several emulators on the board ([src](https://t.me/c/2424231195/78988)):

- **Switch (Eden)** — "works well and fast."
- **PS3 (RPCS3)** — works, but "needs individual tuning from game to game."
- **PS4 (shadPS4 0.9.0)** — Bloodborne runs well with no drops; The Last Guardian started artifacting but kept a stable frame rate.
- **Xbox 360 (Xenia Canary)** — game menus launch, but gameplay drops to a black screen (it still responds to the gamepad); unresolved.

More first-hand confirmations:

- **Switch / Eden is the consensus pick.** When a newcomer asked which Switch emulator to grab, the answer was blunt: **"Eden is the most decent."** ([src](https://t.me/c/2424231195/130842)) Others echoed that **Eden installs and works fine** ([src](https://t.me/c/2424231195/98942)), and that **Eden works great, and the Ryujinx that ships with EmuDeck is also good.** ([src](https://t.me/c/2424231195/99039)) Heavy first-party titles still tax the CPU: a member playing **Tears of the Kingdom on Eden (with NX Optimizer) reported frame drops**. ([src](https://t.me/c/2424231195/124216))
- **PS4 / shadPS4** — one member **sold his physical PS4 and now replays Bloodborne on the BC-250 via shadPS4**, saying it "launches in 2 clicks." ([src](https://t.me/c/2424231195/38704), [src](https://t.me/c/2424231195/38706)) Another confirmed **Drive Club runs 100 %** on shadPS4. ([src](https://t.me/c/2424231195/82128))
- **PS3 / RPCS3** — beyond the roundup, members reported **Uncharted with a "stable framerate, playable"** ([src](https://t.me/c/2424231195/74644)) and a flat **"works great in RPCS3."** ([src](https://t.me/c/2424231195/53601))
- **PSP / PPSSPP** — repeatedly run first-hand and praised: one member ran **PPSSPP at 4× internal resolution** without thermal throttling on the board. ([src](https://t.me/c/2424231195/101579), [src](https://t.me/c/2424231195/103218), [src](https://t.me/c/2424231195/111096))

### A note on Switch emulator history (Yuzu → Eden / Ryubing)

Switch emulation on the board went through the same upheaval as everywhere else. An early state-of-things snapshot found **Yuzu and Suyu hanging on launch** while **Ryujinx worked** (native builds). ([src](https://t.me/c/2424231195/23577)) Yuzu was shut down by Nintendo in 2024 and its successors carry the torch: **Eden** (a Yuzu fork) is the BC-250 community pick that "works well and fast," and the **Ryujinx** line lives on as the community **Ryubing** fork, which remains actively developed in 2026. Note that Nintendo aggressively litigates Switch emulators and scrubs keys/download links — in Feb 2026 it DMCA'd Eden along with a dozen other forks, so expect to hunt for both binaries and keys. ([src](https://t.me/c/2424231195/136649))

---

## Full compatibility table — every platform

One row per platform. **Emulator** is the best current Linux choice; **Status on BC-250** is chat-cited where a member tested it, otherwise the general expectation for Zen 2 + RDNA2 hardware (tagged `general ⚠`, **not BC-250-measured**).

### Nintendo

| System | Best Linux emulator | Status on BC-250 | Notes |
|--------|--------------------|------------------|-------|
| **NES / Famicom** | Mesen (or FCEUmm) — RetroArch core | ✅ Trivial (general ⚠) | 8-bit; any potato runs it. No BC-250 report needed. |
| **SNES** | Snes9x (bsnes for accuracy) — RetroArch | ✅ Trivial (general ⚠) | Snes9x is fast & ~99 % compatible; bsnes if you want cycle-accuracy. |
| **Game Boy / GBC** | SameBoy / Gambatte — RetroArch | ✅ Trivial (general ⚠) | SameBoy is the accuracy pick. |
| **GBA** | mGBA (standalone or RetroArch) | ✅ Trivial (general ⚠) | mGBA is the gold standard. |
| **N64** | simple64 / RMG (mupen64plus); RetroArch core | ✅ Easy (general ⚠) | simple64 is archived; its dev moved to **gopher64** (Rust). Either RMG or gopher64 is fine. Comfortable on this CPU. |
| **DS** | melonDS (standalone or RetroArch) | ✅ Easy (general ⚠) | melonDS long since replaced DeSmuME. |
| **3DS** | **Azahar** (Citra/Lime3DS merge) | ✅ Should be easy (general ⚠) | Citra was DMCA'd; **Azahar** is the maintained successor. Comfortable for this hardware. |
| **GameCube** | **Dolphin** | ✅ Should run great (general ⚠) | Dolphin is mature & Vulkan-accelerated. Mentioned in chat (multi-window/CLI) but no first-hand FPS posted — treat as easy, not measured. ([src](https://t.me/c/2424231195/19715)) |
| **Wii** | **Dolphin** | ✅ Should run well (general ⚠) | Same Dolphin build. Comfortable era for the BC-250; not BC-250-benchmarked in chat. |
| **Wii U** | **Cemu** (native Linux, open-source) | ⚠ Asked, not confirmed | A member asked about running it (and `cemu` is in the AUR), but **no working BC-250 result was posted**. Cemu is heavier than Dolphin — verify yourself. ([src](https://t.me/c/2424231195/68253), [src](https://t.me/c/2424231195/74138)) |
| **Switch** | **Eden** (Yuzu successor) | ✅ Works well & fast (chat) | Community's #1 pick. Set governor to max before launching. Some titles ship 30 FPS-locked and need a 60 FPS patch (e.g. Zelda); heavy first-party titles (TOTK) still drop frames — CPU-bound. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/130842), [src](https://t.me/c/2424231195/124216), [src](https://t.me/c/2424231195/130887)) |
| **Switch** | **Ryujinx** (now the **Ryubing** fork) | ✅ Works (chat) | Native builds ran successfully; the EmuDeck-bundled Ryujinx is "also good." ([src](https://t.me/c/2424231195/51606), [src](https://t.me/c/2424231195/99039)) |
| **Switch** | Yuzu / Suyu | ❌ Broke on launch — legacy (chat) | Early reports: hung when starting a game. Yuzu is discontinued — use Eden. ([src](https://t.me/c/2424231195/23577)) |

### Sony

| System | Best Linux emulator | Status on BC-250 | Notes |
|--------|--------------------|------------------|-------|
| **PS1** | **DuckStation** (standalone or RetroArch) | ✅ Trivial (general ⚠) | DuckStation is the modern standard; enhancement features for free. |
| **PS2** | **PCSX2** (v2.x, Qt + Vulkan) | ✅ Should run well (general ⚠) | 98 %+ compatibility, the classic "easy emulation" target. Not first-hand benchmarked on BC-250 in chat — but well within this hardware's class. |
| **PSP** | **PPSSPP** | ✅ Runs great — 4× res (chat) | First-hand: ran at 4× internal resolution without throttling. One of the most comfortable systems on the board. ([src](https://t.me/c/2424231195/101579), [src](https://t.me/c/2424231195/103218), [src](https://t.me/c/2424231195/111096)) |
| **PS Vita** | **Vita3K** | ⚠ Experimental (general ⚠) | Vita3K is the only Vita emulator and still early everywhere; expect per-game breakage. No BC-250 report. (A chat "basically a maxed-out PS Vita" line was about the hardware, not the emulator. ([src](https://t.me/c/2424231195/86140))) |
| **PS3** | **RPCS3** | ⚠️ Works, per-game tuning (chat) | The most CPU-punishing of the realistic targets. Uncharted "stable, playable", "works great" reported; an early tester hit errors. Needs tweaking title-by-title. Community PS3 walkthrough video exists. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/74644), [src](https://t.me/c/2424231195/53601), [src](https://t.me/c/2424231195/13)) |
| **PS4** | **shadPS4** (0.9.0+; 0.16 in 2026) | ✅ Bloodborne / Drive Club playable (chat) | "Launches in 2 clicks." Bloodborne smooth & no drops; Drive Club 100 %; some titles artifact but hold FPS. Per-game. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/38706), [src](https://t.me/c/2424231195/82128)) |

### Microsoft

| System | Best Linux emulator | Status on BC-250 | Notes |
|--------|--------------------|------------------|-------|
| **Xbox (OG)** | **xemu** | ⚠ Should work (general ⚠) | xemu is LLE with ~80 % of games playable; native Linux AppImage. No BC-250 report — but a light target for this CPU. Verify per-game. |
| **Xbox 360** | **Xenia** (stock) | ⚠️ Boots, perf low (chat) | Plain Xenia runs but "performance at stock is on the floor" — overclock is mandatory. ([src](https://t.me/c/2424231195/23577)) |
| **Xbox 360** | **Xenia Canary** | ❌ Black screen in-game (chat) | Menus load and the gamepad responds, but gameplay is a black screen. On Linux the Vulkan backend is still incomplete. Unresolved. ([src](https://t.me/c/2424231195/78988)) |

### Sega

| System | Best Linux emulator | Status on BC-250 | Notes |
|--------|--------------------|------------------|-------|
| **Master System** | Genesis Plus GX — RetroArch | ✅ Trivial (general ⚠) | One core covers SMS/Genesis/Game Gear/SG-1000/Sega CD. |
| **Genesis / Mega Drive** | Genesis Plus GX (BlastEm for accuracy) | ✅ Trivial (general ⚠) | Trivial for this hardware. |
| **Game Gear** | Genesis Plus GX — RetroArch | ✅ Trivial (general ⚠) | Same Sega multi-core. |
| **Saturn** | **Mednafen/Beetle Saturn** (or Kronos) | ✅ Should be fine (general ⚠) | Saturn is famously CPU-heavy to emulate, but trivial for Zen 2. No BC-250 report. |
| **Dreamcast** | **Flycast** (standalone or RetroArch) | ✅ Should run well (general ⚠) | Flycast is mature and light; comfortable on this hardware. Not benchmarked in chat. |

### Other / arcade / computer

| System | Best Linux emulator | Status on BC-250 | Notes |
|--------|--------------------|------------------|-------|
| **Arcade / MAME** | **MAME** (or FinalBurn Neo) — RetroArch | ✅ Easy for most (general ⚠) | FBNeo for the common sets; full MAME for everything. Heavy late-90s/3D arcade boards can still be demanding. |
| **Neo Geo** | **FinalBurn Neo** — RetroArch | ✅ Trivial (general ⚠) | FBNeo is the Neo Geo / CPS pick. |
| **TurboGrafx-16 / PC Engine** | **Beetle PCE** — RetroArch | ✅ Trivial (general ⚠) | Beetle/Mednafen PCE core. |
| **Atari (2600/5200/7800/ST/…)** | Stella / RetroArch (Atari800, Hatari) | ✅ Trivial (general ⚠) | Stella for 2600; cores exist for the rest. |
| **DOS** | **DOSBox** (DOSBox-Staging / DOSBox-X) | ✅ Trivial (general ⚠) | Or the DOSBox-Pure RetroArch core. |
| **ScummVM** | **ScummVM** (native Linux) | ✅ Trivial (general ⚠) | Engine reimplementation, not emulation — runs anywhere. |

> ✅ works / trivial · ⚠️ works with caveats · ❌ broken · **(chat)** = first-hand BC-250 report (cited) · **(general ⚠)** = best Linux emulator + expectation for this hardware class, **not BC-250-tested**.

---

## Realistic expectations — what's easy vs hard

| Tier | Systems | Reality on a 2000 MHz, cooled BC-250 |
|------|---------|--------------------------------------|
| **Comfortable** | NES · SNES · GB/GBC/GBA · N64 · DS · 3DS · **PS1 · PS2 · PSP** · Genesis/SMS/Game Gear · Saturn · Dreamcast · Arcade/Neo Geo/PCE · Atari · DOS · ScummVM · **GameCube · Wii** | The board's sweet spot. Retro is trivial; PSP is chat-confirmed at 4× res; PS2/GC/Wii are well within this hardware's class (general expectation — benchmark your own demanding titles). Use EmuDeck or RetroArch and go. |
| **Demanding / hit-or-miss** | **Switch · PS3 · PS4** | Real, but CPU-bound and per-game. Switch (Eden) "well and fast" but heavy first-party drops frames; PS4 (shadPS4) great for the right titles (Bloodborne); PS3 (RPCS3) works but needs tuning per game. Set the governor to max first. |
| **Barely / not yet** | **Xbox 360** · Wii U · PS Vita | Xenia boots menus then black-screens in gameplay (chat). Wii U (Cemu) and Vita (Vita3K) are unconfirmed on the board and demanding/experimental generally — verify before relying on them. |
| **A no-fuss, no-OC experience** | (any demanding system) | No. Without the overclock the GPU underclocks inside emulators and even Switch chokes. Do the OC + cooling first. |

---

## Sources

- Emulator roundup (Switch/Eden, PS3/RPCS3, PS4/shadPS4, Xbox360/Xenia) — https://t.me/c/2424231195/78988
- "Eden is the most decent" — https://t.me/c/2424231195/130842 · Eden installs & works — https://t.me/c/2424231195/98942 · Eden + EmuDeck Ryujinx — https://t.me/c/2424231195/99039 · Ryujinx ran — https://t.me/c/2424231195/51606 · TOTK on Eden drops frames (NX Optimizer) — https://t.me/c/2424231195/124216 · CPU is the wall, GPU underused — https://t.me/c/2424231195/136712
- Early emulator state (Yuzu/Suyu hang, Ryujinx ok, Xenia low, RPCS3 errors) — https://t.me/c/2424231195/23577
- PS4/shadPS4 Bloodborne ("2 clicks") — https://t.me/c/2424231195/38704 · https://t.me/c/2424231195/38706 · Drive Club 100 % — https://t.me/c/2424231195/82128
- PS3/RPCS3 Uncharted stable & playable — https://t.me/c/2424231195/74644 · "works great in RPCS3" — https://t.me/c/2424231195/53601 · PS3 emulation walkthrough video — https://t.me/c/2424231195/13
- PSP/PPSSPP ran (4× resolution, no throttle) — https://t.me/c/2424231195/101579 · https://t.me/c/2424231195/103218 · https://t.me/c/2424231195/111096
- Wii U/Cemu asked on 6.15+ kernel — https://t.me/c/2424231195/68253 · cemu via AUR (paru) — https://t.me/c/2424231195/74138
- Dolphin from terminal — https://t.me/c/2424231195/19715 · "basically a maxed-out PS Vita" (hardware, not emulator) — https://t.me/c/2424231195/86140
- Governor stuck at 1000 MHz in emulator; set max manually — https://t.me/c/2424231195/130879 · https://t.me/c/2424231195/130955 · Zelda 30→60 patch — https://t.me/c/2424231195/130887
- No preconfigured image (community taboo) — https://t.me/c/2424231195/130845 · https://t.me/c/2424231195/130877
- Nintendo litigates Switch emulators / keys hard to find — https://t.me/c/2424231195/136649
- Batocera (emulation distro) confirmed running on the BC-250 — [r/linux_gaming thread](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- Hardware spec (6× Zen 2 @ ~3.5 GHz, RDNA2 24→40 CU, 16 GB GDDR6) — [elektricm/amd-bc250-docs](https://elektricm.github.io/amd-bc250-docs/hardware/specifications/)
- General emulation-capability framing (⚠ verify; this third-party guide miscounts cores as 8) — [koukan.co.uk BC-250 guide](https://www.koukan.co.uk/blog/amd-bc-250-guide)

> The overclock these results depend on lives in [09-overclock-undervolt.md](09-overclock-undervolt.md); do the [04-cooling.md](04-cooling.md) mod before running 2000 MHz. For the wider gaming picture and the CPU-bound explanation, see [11-gaming.md](11-gaming.md); for installing the OS the emulators run on, see [06-linux.md](06-linux.md).
