# Windows Drivers & Setup

> **TL;DR** — As of **early 2026 there is no working Windows GPU driver for the BC-250.** Windows installs and boots, but the GPU sits with **Code 43** and zero 3D acceleration — every off-the-shelf AMD driver (Adrenalin, Pro, the W5700 `.inf` trick) is rejected by the hardware. The community is **reverse-engineering one from scratch**, and the honest state is "early plumbing works, nothing renders games yet." If you want to actually *use* this board today, **install Linux** ([06-linux.md](06-linux.md)) — that's where the working driver lives. Treat everything on this page with skepticism and check the repo commit dates before trusting it.

The long-standing community verdict, pinned for newcomers since 2025: *"Abandon all hope, ye who enter here. Windows drivers will not happen with 99.5% probability. Without a driver this board is almost completely useless. The Linux driver exists — if you're not ready for that OS, you don't need this board."* ([src](https://t.me/c/2424231195/28109))

That was the consensus for over a year. It is **finally being challenged** in 2026 — but slowly, and the honest answer is still: not yet.

---

## Why Windows is hard here (the Code 43 wall)

The BC-250 APU ("Cyan Skillfish" / Oberon, GFX10.1.3) presents itself to the OS as an **unknown device** — PCI ID `1002:13FE` — that no shipping AMD driver recognizes. People have tried everything:

- **Force-feeding an official `.inf`** to Device Manager: the only driver Windows offers as "compatible" is the **Radeon Pro W5700**. It installs, then hangs on **Error 43**, exactly like every other driver tried. ([src](https://t.me/c/2424231195/57123))
- **Editing the `.inf` / swapping device IDs** (gfx1013, 1014, Navi 21/22/23 "Dragonball", legacy entries), disabling driver signature enforcement, even booting Windows 10 from USB and trying a Steam Deck driver — **all dead ends**. The legacy entries show up without an error only because of a display bug, not because they work. ([src](https://t.me/c/2424231195/94029))
- **Modding the BIOS** to change the device ID didn't help either — the iGPU still reports `1002:13FE`. The Dev ID appears to be **welded to the APU**, not just the BIOS, so patching one location isn't enough. ([src](https://t.me/c/2424231195/57123))

Why does Linux work and Windows doesn't? On Linux the open-source **amdgpu/Mesa** stack was patched by the community (and partly upstreamed) to recognize this exact chip; on Windows there is no open driver to patch — AMD never shipped a Windows driver for this mining/server part, and the closed Adrenalin/Pro stack refuses the unknown ID. ([src](https://t.me/c/2424231195/13210)) AMD's own forum thread on "BC-250 drivers" went nowhere. ([community.amd.com](https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692))

> **There is no GPU passthrough escape hatch either.** Running Windows in a VM with the BC-250 passed through doesn't work: the IOMMU passthrough path is broken on this board, and it's an *APU* (not a discrete card the host can cleanly hand off), and the chip is mis-detected as an unknown device to begin with. ([src](https://t.me/c/2424231195/64772))

---

## Current driver status — what actually exists (as of early 2026)

In late 2025 the community stopped waiting for AMD and started **building a Windows driver from scratch** by reverse-engineering the hardware. Two efforts matter; both are **experimental, WIP, and do not render games yet.**

### Keshas-dev — the from-scratch WDDM driver (most active)

A pair of companion kernel-mode drivers, the most actively developed Windows effort (the **PSP driver alone has ~56 commits** as of this writing):

- **[Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver)** — a low-level driver for the **PSP** (Platform Security Processor). **What works:** it loads, boots the **SOS firmware**, reads/writes hardware registers over BAR5 MMIO (GC, MMHUB, HDP, NBIO, DF blocks), does the NBIO unlock, and acts as a register proxy for the GPU driver. **What doesn't:** GPCOM ring creation (the SOS firmware doesn't support the TOS ring protocol), GPU-firmware loading via ring buffer, and Trusted Memory Region init. In other words: it can talk to the chip, but **can't yet bring the graphics engine up.** ([repo](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver/commits/main/))
- **[Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver)** — the companion GPU driver. Shares the same certificate/test-signing infrastructure as the PSP driver and uses it as a register bridge. Still early; no usable 3D output. ([repo](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver/commits/main/))

The first public sign of life was a member reporting **"my first working driver (OpenGL 1.1)"** in October 2025 ([src](https://t.me/c/2424231195/83320)) — celebrated precisely because even a barely-functional driver *installing and running* was a real milestone after a year of Code 43: *"if this driver really installed and works (even badly) — that's a huge step."* ([src](https://t.me/c/2424231195/83332)) A driver dump from that wave, `AMD Radeon BC-250 (Cyan Skillfish) driver 00.00.01.7z`, was shared/pinned in the chat. ([src](https://t.me/c/2424231195/83322)) **Treat any such early dump as experimental — version `00.00.01` is exactly as raw as it sounds.**

### ZEROAESQUERDA — the WDDM 2.0 reference implementation

**[ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest)** — a separate effort ("the Portuguese guy started something"), pinned in the chat in March 2026 as a sign the ice was breaking. ([src](https://t.me/c/2424231195/123644)) It's best understood as a **reference/educational WDDM 2.0 implementation**, not a usable driver:

- Implements only the **Direct3D 9 DDI**; **D3D11, D3D12, and Vulkan are not implemented.**
- **Shader compilation for RDNA2 (GFX10.1 ISA) is not functional** — it accepts shader submissions but can't compile them for the actual hardware, so nothing renders.
- Does **not** load the Command Processor microcode (relies on BIOS-loaded firmware); **VCN video encode/decode unsupported**; single DisplayPort output only.
- Requires **test-signing mode** (no WHQL signature). Only ~2 commits on main.

See the project's own **[Known Limitations](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas)** section before you spend time on it.

> ⚠ **Repo-naming correction.** The main repo list points to `ZEROAESQUERDA/PS5GPU-BC250` under "Drivers → Windows." On inspection that repo is a **Linux GPU governor** (an Oberon-governor fork with a GUI), **not** a Windows driver. The actual Windows code from this author is **`BC250-windowsDriverTest`**.

### Status at a glance

| Project | Type | What works | What doesn't | Use it today? |
|---|---|---|---|---|
| Keshas-dev/AMD-BC-250-PSP-Driver | PSP kernel driver (WIP) | Boots SOS firmware, BAR5 register R/W, NBIO unlock, register proxy | GPU ring creation, FW load, TMR init | No — plumbing only |
| Keshas-dev/AMD-BC-250-Windows-Driver | GPU driver (WIP) | Loads alongside PSP driver | No usable 3D | No |
| ZEROAESQUERDA/BC250-windowsDriverTest | WDDM 2.0 reference | Driver model scaffolding, D3D9 DDI present | Shader compile, D3D11/12, Vulkan, VCN | No — educational |
| Adrenalin / Pro / W5700 `.inf` | Official AMD | — | **Code 43**, nothing | No |

**Bottom line:** nobody is playing games on Windows on a BC-250 today. The work is real and accelerating, but it is at the "can we make the GPU initialize at all" stage, not the "what's my Cyberpunk FPS" stage.

---

## If you still want to try the WIP drivers

This is for tinkerers who want to **help test**, not for getting a working desktop. You will need:

- **Windows 10 (build 1607+) or Windows 11, x64.**
- **Test signing enabled** and **Secure Boot disabled** (these drivers are unsigned/test-signed):
  ```
  bcdedit /set testsigning on
  ```
  Reboot. ⚠ verify — exact steps follow each repo's README; commands here are the standard WDK test-sign flow, not copied from a project script.
- Install via the repo's provided **PowerShell script** (e.g. `Install-Driver.ps1`) or manually with `pnputil`. Follow the **repo README**, not this page — these projects change fast and the install steps move with them.

Expect: at best the device enumerates and early init logs appear; at worst, nothing changes or you get a different error code. **Back up anything you care about and assume it won't render.**

### ⚠ Unverified rumor: "leaking drivers bricks the board"

During the early 2025 beta-test phase, a member warned that **BC-250s were being remotely bricked for leaking pre-release drivers** — claiming Reddit reports of bricking, remote device blocks, and that even a hardware programmer couldn't unlock them. ([src](https://t.me/c/2424231195/26231)) **We could not verify this**, and the whole "private beta" framing around it is dubious (see the next section). Mentioned for completeness; do not treat it as established fact. If you brick a board for unrelated reasons, see [08-bios.md](08-bios.md) for recovery.

---

## Hoaxes, jokes & dead ends — don't fall for these

Windows-driver hype on the BC-250 has a long history of **pranks and wishful thinking**. Know the famous ones so you don't waste a weekend:

- **The "NVIDIA driver for AMD BC-250."** An **April Fools' Day (1 April 2026)** joke — a slick fake "NVIDIA NEW DRIVER RELEASE … for AMD BC-250" banner that briefly had people asking *"did NVIDIA really release a BC-250 Windows driver?!"* ([src](https://t.me/c/2424231195/130053)) It did not. NVIDIA does not make drivers for an AMD APU. The reaction in-chat was *"the long-awaited joke has arrived."* ([src](https://t.me/c/2424231195/130727)) Also note an `.exe` named like `whql-amd-software-adrenalin-edition-25.5.1-...-bc250.exe` floated around — a normal Adrenalin installer with "bc250" tacked onto the filename does **not** make it a BC-250 driver. ([src](https://t.me/c/2424231195/73924))
- **"Just force-install a similar card's driver."** RX 6700 / W5700 / Radeon Pro V340 — every newcomer's first idea, and it has occurred to *"every fool who's ever held a BC-250."* It can't work, for a stack of reasons not worth re-deriving: **there are no Windows drivers, no honor, and no beer on the BC-250.** ([src](https://t.me/c/2424231195/29710))
- **Malware in the channel.** People have posted fake "drivers" that were viruses/zip-bombs/phishers. Mods ban on sight; a file literally named `Trojan.txt` once appeared. ([src](https://t.me/c/2424231195/49668)) **Only run binaries from the named GitHub repos, and read the code.**

---

## What about the 40-CU unlock script people mention?

`git clone https://github.com/duggasco/bc250-40cu-unlock.git` shows up in Windows-topic chatter, and the master resource list even tags it under "Windows." **It is a Linux `amdgpu` kernel patch / script** (`bc250-enable-40cu.sh`), not a Windows tool — it unlocks all 40 CUs on the Linux driver. It's covered properly in [09-overclock-undervolt.md](09-overclock-undervolt.md); it does nothing for Windows. ⚠ verify (no Command-corpus shell history confirms a Windows use; the one command captured is the plain `git clone` above).

---

## Recommendation

| You want… | Do this |
|---|---|
| To play games / actually use the board now | **Install Linux.** See [06-linux.md](06-linux.md). The working GPU driver only exists there. |
| To follow / contribute to the Windows effort | Watch **Keshas-dev** (PSP + GPU driver) and **ZEROAESQUERDA/BC250-windowsDriverTest**; expect kernel/WDK work, not gaming. |
| A magic `.inf` or "similar card" driver | There isn't one. Stop here — you'll only hit Code 43. |

Windows support is a **moving target**: re-check the repo commit dates and this section's date (this reflects **early 2026**) before acting. The 2025 verdict was "never"; 2026 downgraded that to "not yet" — real progress, but progress at the firmware-init layer, not the playable-desktop layer.

---

## Sources

- Pinned newcomer warning ("abandon all hope") — https://t.me/c/2424231195/28109
- Code 43 / W5700 `.inf` / BIOS-mod attempts — https://t.me/c/2424231195/57123 · https://t.me/c/2424231195/94029
- "No Windows drivers, no honor, no beer" — https://t.me/c/2424231195/29710 · why Linux not Windows — https://t.me/c/2424231195/13210
- VM passthrough won't work — https://t.me/c/2424231195/64772
- First "working" driver (OpenGL 1.1) & reaction — https://t.me/c/2424231195/83320 · https://t.me/c/2424231195/83332 · driver dump `00.00.01` — https://t.me/c/2424231195/83322
- ZEROAESQUERDA project pinned / "ice breaking" — https://t.me/c/2424231195/123644
- April Fools "NVIDIA driver" — https://t.me/c/2424231195/130053 · https://t.me/c/2424231195/130727 · mislabeled Adrenalin `.exe` — https://t.me/c/2424231195/73924
- Malware-ban policy — https://t.me/c/2424231195/49668 · brick-on-leak rumor (unverified) — https://t.me/c/2424231195/26231
- Repos — [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) · [Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver) · [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) ([known limitations](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas))
- AMD forum thread (went nowhere) — https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692
- 40-CU unlock (Linux, mis-tagged Windows) — https://github.com/duggasco/bc250-40cu-unlock → see [09-overclock-undervolt.md](09-overclock-undervolt.md)

> The 40-CU unlock, governor, and Linux driver setup live in [06-linux.md](06-linux.md) and [09-overclock-undervolt.md](09-overclock-undervolt.md). Brick recovery: [08-bios.md](08-bios.md).
