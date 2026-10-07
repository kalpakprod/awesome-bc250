# BC250 applications, upscalers and tools

A practical path through installation, project relationships and rollback. Based on developer documentation observed on 7 October 2026. Download links point to projects and releases, not files buried in chat messages.

## Where to start

1. Set up power and cooling using [Start here](00-start-here.md). Establish stable stock operation before overclocking or unlocking.
2. Choose your workflow in [Linux setup](06-linux.md): Bazzite Deck for a console-style machine, CachyOS/Arch for a mutable tuning environment, Fedora for a workstation. This is not a universal FPS ranking.
3. Install **BC250 Control Center** for one setup interface. Other toolkits remain alternatives; do not run multiple governors or automatic tuners for the same setting simultaneously.
4. After testing an ordinary game, choose an upscaler. **FSR4 DLL**, **HelixSR** and **lsfg-vk** solve different problems; installing all of them is not required.
5. macOS now has **MetalCyan**, with explicit limitations. See [requirements and installation](13-macos.md).

## BC250 Control Center

**Project and authors:** [movacx/bc250-control-center](https://github.com/movacx/bc250-control-center) · [Releases](https://github.com/movacx/bc250-control-center/releases/latest).

A desktop interface for monitoring, GPU/CPU tuning, CU selection, fans, memory, BIOS preparation and compatibility fixes. It integrates community tools; it is not a replacement graphics driver.

### Installation

With an existing AUR setup on Arch/CachyOS:

```bash
yay -S bc250-control-center-git
```

Alternatively download the release package for your distribution:

```bash
# Arch / CachyOS / Manjaro
sudo pacman -U ./bc250-control-center-*-any.pkg.tar.zst
# Fedora / Nobara
sudo dnf install ./bc250-control-center-*.rpm
# Bazzite / Fedora Atomic: install into a new deployment
sudo rpm-ostree install ./bc250-control-center-*.rpm
# Ubuntu / Debian: apt installs dependencies too
sudo apt install ./bc250-control-center_*.deb
```

Reboot into the new deployment on Bazzite. SteamOS updates can remove the system installation: use **Reinstall BC250 Control Center** in Desktop Mode and prepare dependencies again. SteamOS is not the same installation workflow as layering an RPM on Bazzite.

### First launch, verification and rollback

1. Choose the language and dependency preparation for your distribution.
2. Inspect module status: installed tools, missing dependencies and proposed actions.
3. Check sensor readings and current settings before changing clocks, fans or CU masks.
4. Apply one group of changes at a time. An available unlock button does not mean every disabled CPU core or WGP is healthy.
5. **Decky Quick Access** is installed separately through Dashboard → Decky, not automatically by ordinary dependency preparation.

Verify that the application recognizes the board, only one governor is active and a normal game still runs. VRM I2C telemetry requires actual hardware wiring.

Restore changed settings **before** removing the application. Remove package `bc250-control-center` with the distribution package manager; this does not undo drivers, services or BIOS changes. The old `install-local.sh` installation has a separate `scripts/uninstall-local.sh` removal script.

### External tools and credits

| Task | Community projects | Important distinction |
|---|---|---|
| GPU clocks | [Cyan governor](https://github.com/filippor/cyan-skillfish-governor/tree/smu), [Oberon](https://gitlab.com/mothenjoyer69/oberon-governor) | Alternatives, not simultaneous services |
| CPU/SMU | [bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc), [core-unlock](https://github.com/rw-r-r-0644/bc250-core-unlock), [EFI unlock](https://github.com/Hexxeh/bc250-efi-core-unlock) | Clock tuning and unlocking are different operations |
| CU/WGP | [cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager), [40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) | Enabled count does not prove healthy units |
| Drivers | [GFX1013 fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix), [CachyOS kernel](https://github.com/MastaG/linux-cachyos-bc250), [Bazzite async compute](https://github.com/tri3gubki-ops/bc250-async-compute-bazzite) | Match distribution and kernel |
| Sensors/fans | [BC250-Telemetry](https://github.com/onlinermm/BC250-Telemetry), [memory temperature](https://github.com/pan-Rijovich/bc250-memory-temperature), [nct6687d](https://github.com/Fred78290/nct6687d) | Hardware modifications and driver installation differ |
| UMA/ACPI | [bc250_memcfg](https://github.com/fanoush/bc250_memcfg), [ACPI fix](https://github.com/e-tho/bc250-acpi-fix) | Record the original setting first |
| FSR4 | [Original](https://github.com/dmorazasanchez/bc250-fsr4), [DLL continuation](https://github.com/daniel-h-0/bc250-fsr4-fork) | Per-game installation, not mandatory Mesa replacement |

[Developer credits and integration licenses](https://github.com/movacx/bc250-control-center#external-tools-and-credits). Other developments are in the [unified catalog](../../catalog/en/README.md).

## FSR4: original driver work and portable DLL

**dmorazasanchez/bc250-fsr4** originated the INT8 fallback optimizations in Mesa/RADV for `gfx1013`. **daniel-h-0/bc250-fsr4-fork** continues the work in a portable FidelityFX DLL. The DLL route does not require replacing system Mesa; an alternative driver package has separate compatibility requirements.

**OptiScaler** adapts in-game upscaler calls. **OptiScaler Client** manages installations on disk. Neither is the FSR4 reconstruction model.

### Install through Client

1. Close the game and back up original DLLs, launch options and mod settings.
2. Get the BC250 Client build from the [continuation project](https://github.com/daniel-h-0/bc250-fsr4-fork).
3. Scan your library, choose **Install across your games** and start with one game.
4. Keep working Proton/launch settings and complete the reported first-run shader preparation.
5. Verify the selected backend in OptiScaler, moving-image quality, frame time and stability.

Compatible native FidelityFX games can use direct DLL replacement; others need OptiScaler. Do not inject mods into protected online clients without the game's permission.

Rollback with Client Update/Restore or your saved original DLLs and launch settings. Do not delete other mods' unknown files. [Client and restore documentation](https://github.com/daniel-h-0/bc250-fsr4-fork/blob/main/docs/optiscaler-client.md).

The author's RC9 Quality measurements are **3.93 / 5.92 / 12.08 ms per upscale** at 1080p / 1440p / 4K output, dated 11 September 2026. These are upscaler-pass costs, not complete game frames or guaranteed FPS. Lower internal rendering resolution saves work but reconstruction adds work. [Method](https://github.com/daniel-h-0/bc250-fsr4-fork/blob/main/docs/gpu-cost.md).

## HelixSR: DLSS Model E reconstruction on AMD

[Project](https://github.com/lonewolf0622/HelixSR) · [Releases](https://github.com/lonewolf0622/HelixSR/releases).

An unofficial FSR 3.1-facing upscaler using DLSS Model E reconstruction through ordinary D3D12 compute shaders. Linux uses Proton/vkd3d-proton. This is **not native NVIDIA DLSS support**, a new frame-generation model or a combination of FSR4 weights with DLSS. The upscaler source is unpublished; setup scripts have a separate license.

### Native FSR 3.1 DLL installation

1. Extract the release and run `./helixsr-setup.sh` on Linux or `helixsr-setup.bat` on Windows. With your consent setup downloads NVIDIA's DLL and builds `helixsr_weights.bin` and `helixsr_kernels.pak` locally. Do not redistribute these network files.
2. Find the game's `amd_fidelityfx_upscaler_dx12.dll` or `amd_fidelityfx_dx12.dll`. Save it with `.original` inserted before `.dll`.
3. Copy the HelixSR DLL under the game's original filename, alongside both generated network files. The original combined FidelityFX DLL is also needed to forward other effects, including FG.
4. Launch and select **AMD FSR**. Games without a separate FSR 3.1 DLL need OptiScaler and both HelixSR library paths:

```ini
[Upscalers]
Dx12Upscaler=fsr31
[Libraries]
FfxDx12Path=Z:\path\to\HelixSR\amd_fidelityfx_dx12.dll
FfxDx12SRPath=Z:\path\to\HelixSR\amd_fidelityfx_upscaler_dx12.dll
```

Replace the example path, put both DLL filenames and network files there. Under Proton `Z:` maps to the Linux root.

Verify the network in `helixsr.log` and **FSR HelixSR (3.1.5)** in OptiScaler. Missing network files cause simple scaling instead. D3D12 only: Vulkan games are unsupported by this route. Author testing targets BC250/RADV/Proton, not every OS/game.

Rollback by removing only your HelixSR files, restoring the saved DLL's original name and restoring OptiScaler configuration. [Requirements, settings and licenses](https://github.com/lonewolf0622/HelixSR#readme).

## Frame generation: Lossless Scaling and lsfg-vk

[Lossless Scaling](https://store.steampowered.com/app/993090/Lossless_Scaling/) is commercial software. [PancakeTAS/lsfg-vk](https://github.com/PancakeTAS/lsfg-vk) is a separate Linux Vulkan frame-generation integration. Neither is FSR4 or HelixSR.

Establish consistent **real** frame time first. Install lsfg-vk using its distribution instructions, configure one game and compare input latency, artifacts and frame pacing. Generated frames do not speed up game logic or the CPU. To roll back, disable the layer and restore launch options. Package/Decky recipes change; do not mix fork installers.

## Streaming and codecs

| Project | Purpose | Installation / limits |
|---|---|---|
| [Moonlight Qt BC250](https://github.com/grykom/moonlight-qt-bc250) | Streaming client with configurable software-decoder threads | Experimental Arch/CachyOS package; does not enable VCN |
| [Vulkan encode stopgap](https://github.com/Shalasere/bc250-vulkan-encode-stopgap) | VA-API encoder using GPU compute and CPU | Immutable systems need setup_bazzite/setup_steamos; shares GPU resources with games, HEVC paths have limitations |
| [simpmix encoding/decoding](https://github.com/simpmix/bc250-encoding-decoding-fix) | Another VA-API/compute project | Its name does not establish working VCN |
| [PyroWave](https://github.com/Themaister/pyrowave) | Vulkan-compute codec | Integration depends on the actual streaming client/server; not a universal VCN driver |

Before redirecting a system VA-API driver slot, save the current driver and server configuration. Encoder rollback must restore driver redirects and service settings, not merely remove a GUI. Hardware VCN, compute encoding and software decoding are three different paths.

## Other projects and authors

The [unified catalog](../../catalog/en/README.md) includes historical versions, forks, cases, investigations and unsuccessful approaches. Message sources remain evidence in the metadata; choosing a tool does not require knowing which chat first discussed it.
