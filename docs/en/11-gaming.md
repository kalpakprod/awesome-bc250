# Gaming Results & Settings

> **TL;DR** — The BC-250 is a **PS5-class GPU bolted to a cut-down 6-core Zen2**. The GPU is genuinely capable: at a real-world **2000 MHz** overclock it runs modern AAA titles at **40–60 FPS**, and lighter/older games well past 60. The catch is the **CPU**. The Zen2 half of the APU is the bottleneck far more often than the GPU — community benchmarks repeatedly show the card sitting at **~36–47 % GPU load while pinned to ~38 FPS**, CPU-limited. So: **overclock first** (stock ~1500 MHz is ~30 % slower), lean on **FSR** and frame generation, target **1080p–1440p**, and accept that physics-heavy or badly-threaded games will stutter no matter the resolution. Console-style first-party ports (God of War, Horizon, Last of Us, Spider-Man) are the sweet spot.

This section sets expectations and collects the community's real, posted results — many of them benchmark screenshots. Numbers vary with clock, distro, driver and VRAM split, so every row is tied to its source.

---

## The one thing to understand first: it's CPU-bound

The BC-250's GPU is a PS5-derived RDNA2 part (RADV reports it as `GFX1013` / NAVI10-class). It is *not* the weak link in most games. The weak link is the **6-core Zen2 CPU** running at ~3.5 GHz with PS5-style cut-down cache and no SMT headroom to spare.

A community benchmark at **1080p, High, GPU @ 2000 MHz / mem @ 3600 MHz** makes this concrete: the run **"achieved 38 FPS"** with **GPU Limited Percentage just 36.5 %** — the CPU simulation thread was the gate (CPU sim ~70 / CPU render ~43 / GPU ~47 on the per-stage meter). The GPU was idling at a third of its capacity while the CPU held the frame rate down. ([src](https://t.me/c/2424231195/136242))

Practical consequences:

- **Resolution is often "free."** Because you're CPU-bound, going from 1080p to 1440p (or even 4K with FSR) frequently costs little FPS — the GPU had spare headroom anyway. Several 4K results below look almost as good as their 1080p counterparts for exactly this reason.
- **Upscaling helps less than on a normal PC.** FSR offloads the GPU, but if the CPU is the limiter, dropping render resolution won't lift your FPS much. Use FSR for image quality / thermals, not as a magic FPS button.
- **Badly-threaded or physics-heavy games punish you.** Stutter and frame-time spikes (Gothic Remake, Doom: The Dark Ages before fixes) come from the CPU, not the GPU.
- **Overclock the GPU anyway** — when a game *is* GPU-bound (4K, heavy ray tracing, well-threaded engines), 1500 → 2000 MHz is ~+30 % FPS. See [09-overclock-undervolt.md](09-overclock-undervolt.md) for how to get there, and [04-cooling.md](04-cooling.md) first, because 2000 MHz needs the cooling mod.

---

## Settings that actually move the needle

- **Clocks.** Stock GPU ~1500 MHz is the slow default; the community runs **GPU 2000 MHz, mem ~1900–2000 MHz** as the everyday target, with some pushing **2.65 GHz core on a dGPU-class build**. Stock vs. 2000 MHz is roughly **+30 % FPS** in GPU-bound scenes. ([overclock guide](09-overclock-undervolt.md))
- **40 CU unlock.** The board ships with CUs disabled. Unlocking all **40 CUs** gives a measurable, broad uplift — one user reported Doom: The Dark Ages going from broken to **60 FPS High**, a "007" title at **60 FPS High**, and steadier frame-times in Great Pragmata after the unlock. ([src](https://t.me/c/2424231195/141193)) See [09-overclock-undervolt.md](09-overclock-undervolt.md).
- **FSR / FSR 4.** Use Quality or Balanced at 1440p/4K to keep the GPU fed and temps down. The community is actively porting **FSR 4** (DLL packages shared in-thread). ([FSR4 INT8 discussion src](https://t.me/c/2424231195/136354)) elektricM's measured FSR gains: **Quality +20–30 %, Balanced +30–40 %, Performance +40–60 %** FPS; **Frame Generation can roughly double** frame rate (slight latency). **FSR 4 via Optiscaler** — community finds **Balanced beats native FSR 3.1.5 Quality**. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **VRAM split (UMA).** It's a unified 16 GB pool. In one careful sweep (1440p, 1850 MHz), the GDDR6 split (512 MB vs 8 GB reserved) **barely changed average FPS** — but a too-small or wrong UMA setting can drop you into software rendering (`llvmpipe`) or hang a benchmark. Auto / a sane reserve is fine; don't over-think it. ([src](https://t.me/c/2424231195/81203))
- **VSync off** for benchmarking; **frame generation on** where offered (it helped Wukong hit triple-digit averages, see below).
- **`mitigations=off`** (kernel boot flag) is a common tweak; in the VRAM sweep it had only minor, noisy effects on FPS. Treat it as small. ⚠ **verify (magnitude disputed)** — elektricM reports a much larger gain (**+18 FPS in Cyberpunk, "+10–15 %"** in their tips). It's clearly game-dependent: big in some CPU-bound titles, negligible in others. Try it and measure; don't assume either number. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

---

## Results people actually posted

These are community-reported figures with their settings and source. **Benchmark scores and FPS are as posted** — clocks/distro/driver differ between rows, so read the context column, don't compare blindly.

| Game | Settings (res / preset / upscaling) | Result | HW / clocks | Source |
|------|--------------------------------------|--------|-------------|--------|
| **Black Myth: Wukong** (bench) | 1080p, High, FSR + Frame Gen on | **avg 96** (min 78, max 113) | BC-250, Windows, RADV NAVI10 | ([src](https://t.me/c/2424231195/10069)) |
| **Black Myth: Wukong** (bench) | 1440p, Medium, no FSR | **avg ~48** (max 56) | BC-250, 1850 MHz, Linux | ([src](https://t.me/c/2424231195/81203)) |
| **Shadow of the Tomb Raider** (bench) | 1440p, Max | **avg ~70** | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Marvel's Guardians of the Galaxy** (bench) | 1440p, High | **avg ~70** (89 max, min dips to ~3) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Dying Light 2** (bench) | 1440p, High, no VSync | **avg ~48** (max 62) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Cyberpunk 2077** (bench) | 1440p, Ray Tracing **min** | **avg ~36** (min 30) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Indiana Jones and the Great Circle** | 1440p, low, no upscaler | **45** | BC-250, GPU ~1900 MHz, Vulkan | ([src](https://t.me/c/2424231195/36931)) |
| **Indiana Jones and the Great Circle** | 1440p, medium, upscaler on | **60** | BC-250 | ([src](https://t.me/c/2424231195/36931)) |
| **Forza Horizon 5** | **4K**, High preset, **no FSR** | playable (video) | BC-250 | ([src](https://t.me/c/2424231195/81891)) |
| **The Witcher 3** | 4K, Medium, FSR Balanced | **~50** | BC-250 | ([src](https://t.me/c/2424231195/81894)) |
| **Kingdom Come: Deliverance II** | 4K, Med/High, FSR Quality | **~30** ("PS5 experience") | BC-250 | ([src](https://t.me/c/2424231195/81893)) |
| **The Last of Us Part II** | 1080p, default preset | playable (video) | BC-250 | ([src](https://t.me/c/2424231195/94237)) |
| **Doom: The Dark Ages** | High | **60** (after 40 CU unlock + fix) | BC-250, 40 CU | ([src](https://t.me/c/2424231195/141193)) · [Reddit fix](https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/) |
| **Resident Evil Requiem** | (video) | playable | BC-250, CPU stock, **GPU 2000** | ([src](https://t.me/c/2424231195/121772)) |
| **Gothic Remake** | Medium | **stutters** — "no optimization" | BC-250 | ([src](https://t.me/c/2424231195/142708)) |
| **Hi-Fi Rush** | (video, OBS capture) | smooth | BC-250, `mitigations=off` | ([src](https://t.me/c/2424231195/91022)) |
| **Cyberpunk 2077** | 1080p, High, FSR Quality, **no RT** | **70–90** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Cyberpunk 2077** (bench) | 1080p (stock 2000 MHz / 1000 mV) | **57.66** → **60.82** OC (2230 MHz); `mitigations=off` **+18** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **The Last of Us Part I** | 1080p, Medium-High | **60** (stable) | BC-250 — 90–100 °C during shader compile; some audio clicking | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Devil May Cry 5** | 1080p, High | **100** (lowest latency, ~10 ms) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Detroit: Become Human** | 1080p, Medium | **60** (capped) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Control** | 1080p, full **RT** | **40** | BC-250 — good for entry-level RT | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Company of Heroes 3** | 1080p | playable — **needs 4 GB VRAM split** (512 MB artifacts/crashes) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Red Dead Redemption 2** (bench) | use `-useMaximumSettings` flag | **45+** min | BC-250 — can detect wrong GPU adapter, set it manually | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **CS2** / **Rocket League** / **Elden Ring** | 1080p | **100+** / **120+** / **60** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| _Reference: discrete GPU build_ | RE-engine bench, 1080p, High, no RT | **avg 67.99** (min 58, max 82) | **RX 6600** + Xeon E5-2667v4, Win10 | ([src](https://t.me/c/2424231195/116494)) |

> The RX 6600 row is **not a BC-250 result** — it's a member running a discrete card on the same chassis/CPU as a comparison point. Included to show what the *CPU* alone can sustain.

### First-party / console ports — the sweet spot

These ran well enough that one member simply listed them as "works" (PS-style ports lean on the GPU and are well-optimized, which suits this board):

> Days Gone · Death Stranding · DIRT 5 · Ghost of Tsushima: Director's Cut · God of War (2018) · God of War: Ragnarök · Horizon Forbidden West · Horizon Zero Dawn · The Last of Us Part I · The Last of Us Part II Remastered · Returnal · Uncharted: Legacy of Thieves

([src](https://t.me/c/2424231195/99563))

---

## Known problem games (don't work / need a workaround)

elektricM tracks titles ours didn't cover that **fail or fight the platform** — check before you buy:

| Game | Problem | Workaround |
|------|---------|-----------|
| **Fortnite** | Easy Anti-Cheat **does not support Linux** | **None — cannot run** on a Linux BC-250 |
| **Valorant** | Kernel-level anti-cheat | Technical issues on Linux; effectively a no |
| **Magic: The Gathering Arena** | Crashes/freezes specifically on **Fedora** | Works better on **Manjaro / Bazzite**; try other Proton |
| **Final Fantasy VII Rebirth** | "DX12 is not supported on your system" (GPU-compat check) | **No fix yet** |
| **Black Myth: Wukong** (cracked) | "CreateProcess() returned 2" (anti-tamper) | Use **unmodified game files** |

(Anti-cheat status changes over time — cross-check [areweanticheatyet.com](https://areweanticheatyet.com) and [protondb.com](https://www.protondb.com).) ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

### Hard-blocked by missing GPU features (not fixable)

This is **RDNA 2-class silicon** (GFX1013). A handful of newer titles **hard-require GPU features RDNA 2 doesn't have** — chiefly **mesh shaders** and **hardware variable-rate shading (VRS)** — and simply refuse to run. This is a **hardware limitation, not a driver bug**: no Mesa update, kernel param or Proton version will fix it. Confirmed examples ([r/linux_gaming community thread](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)):

| Game | Hard requirement the BC-250 lacks |
|------|------------------------------------|
| **Final Fantasy VII Rebirth** | **Mesh shaders** — won't run (this is also why it trips the DX12 GPU-compat check in the table above) |
| **Doom: The Dark Ages — Update 2** | **Vulkan fragment shading rate** (hardware VRS) — the earlier, pre-Update-2 build runs (60 FPS after the 40 CU unlock, above), but Update 2 made VRS mandatory and it no longer launches |

> Before buying a brand-new AAA title, check whether it lists mesh shaders or hardware VRS as a requirement — if it does, the BC-250 can't run it at any settings.

## Ray tracing — what's actually been tested

The BC-250 has **real RDNA2 hardware RT** (not software emulation, given Mesa 25.2+). Tested RT titles per elektricM:

| Game | Res | FPS | Notes |
|------|-----|-----|-------|
| Cyberpunk 2077 | 1080p | 50–60 | RT lighting only, FSR Quality |
| Control | 1080p | 40 | Full RT |
| Portal 2 RTX | 720p | 40 | Software RT path in Mesa 25.2+ |
| Half-Life 2 RTX | 720p | 20–30 | Very demanding |

RT is entry-level here — fine for *lighting-only* in well-optimized games, not for full path-traced loads. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

## Proton & launch options (Linux)

- **Proton version:** start with **Proton GE** (best compatibility) or **Proton Experimental**; fall back to stable **8.0 / 9.0** per game. Install GE via **ProtonUp-Qt** (`protonup-qt`). Some titles only work on a specific version — test if one fails. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Steam launch options** worth knowing:
  - `mangohud %command%` — FPS/temps overlay.
  - `RADV_DEBUG=nohiz %command%` — forces RADV / fixes some glitches.
  - `gamemoderun %command%` — CPU governor to performance for the session (helps this CPU-bound board).
  - Combined: `RADV_DEBUG=nohiz mangohud gamemoderun %command%`.
- **VRAM per game (UMA split):** esports/indie are fine on **512 MB**; **most games want 4 GB**; AAA/RT also want the extra-VRAM kernel params (`amdgpu.gttsize=...`, see [06-linux.md](06-linux.md) / [08-bios.md](08-bios.md)). A too-small split causes artifacts, crashes, or a drop into software rendering. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Stutter on first run** is usually **shader compilation** — let Steam finish pre-compiling before judging FPS; a bigger shader cache helps. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

---

## Emulation

Emulators are CPU-heavy, so results are mixed but several are solid ([src](https://t.me/c/2424231195/78988)):

- **Switch — Eden:** works well and fast. ✅
- **PS4 — shadPS4 (0.9.0+):** Bloodborne runs well with no drops; some titles (The Last Guardian) artifact but hold stable FPS. ✅
- **PS3 — RPCS3:** works, but needs per-game tweaking. ⚠️
- **Xbox 360 — Xenia Canary:** menus load, gameplay drops to a black screen (still investigating). ❌

---

## Where to see it running (video)

The community posts a lot of gameplay/benchmark video. A few in-thread captures and channels:

- BC-250 gameplay/benchmark clips: [youtu.be/CYDv1SfD2Pc](https://youtu.be/CYDv1SfD2Pc) · [youtu.be/g3uWOfqcexA](https://youtu.be/g3uWOfqcexA) · [youtu.be/9fozmRrAouc](https://youtu.be/9fozmRrAouc) · [youtu.be/q64M2XzADjA](https://youtu.be/q64M2XzADjA) · [youtu.be/0LEkOG1yqqw](https://youtu.be/0LEkOG1yqqw)
- Community tracking sheet of tested games (FPS/settings): [Google Sheet](https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing)

---

## Realistic expectations cheat-sheet

| You want… | Reality on a 2000 MHz, modded BC-250 |
|-----------|--------------------------------------|
| 1080p AAA, 60 FPS | Sometimes — depends on CPU load. FSR + Frame Gen helps. Older/lighter AAA: yes. |
| 1440p AAA | 40–60 FPS in most ports; the GPU has headroom here. Best value resolution. |
| 4K AAA | 30–50 FPS with FSR in well-optimized/console ports (Forza, Witcher 3, KCD2). |
| Ray tracing | Only at minimum, low FPS (Cyberpunk ~36 @ 1440p RT-min). Not the board's strength. |
| Locked 60 everywhere | No. CPU-bound and physics-heavy titles will dip/stutter regardless of settings. |
| First-party PS ports | The sweet spot — these are what the board does best. |

---

## Sources

- CPU-bound benchmark (38 FPS, 36.5 % GPU) — https://t.me/c/2424231195/136242
- Big VRAM/clock benchmark table (Wukong, Tomb Raider, Dying Light 2, Cyberpunk, Guardians) — https://t.me/c/2424231195/81203
- Wukong 1080p High FSR+FG, avg 96 — https://t.me/c/2424231195/10069
- Indiana Jones Great Circle, multi-res — https://t.me/c/2424231195/36931
- Forza Horizon 5 4K — https://t.me/c/2424231195/81891 · Witcher 3 4K — https://t.me/c/2424231195/81894 · KCD2 4K — https://t.me/c/2424231195/81893
- 40 CU unlock results (Doom Dark Ages 60 FPS) — https://t.me/c/2424231195/141193 · Doom fix — https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/
- TLOU II 1080p — https://t.me/c/2424231195/94237 · Resident Evil Requiem — https://t.me/c/2424231195/121772 · Gothic Remake stutter — https://t.me/c/2424231195/142708
- First-party ports list — https://t.me/c/2424231195/99563
- Emulation roundup — https://t.me/c/2424231195/78988
- RX 6600 dGPU comparison run — https://t.me/c/2424231195/116494
- elektricM game compatibility (per-game settings/FPS, problem games, RT table, Proton & launch options, FSR gains) — https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/
- Mesh-shader / hardware-VRS hard blocks (FF7 Rebirth, Doom: The Dark Ages Update 2) — [r/linux_gaming thread](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- Community game-test spreadsheet — https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing

> Clocks and the 40 CU unlock live in [09-overclock-undervolt.md](09-overclock-undervolt.md); do the [04-cooling.md](04-cooling.md) mod before running 2000 MHz.
