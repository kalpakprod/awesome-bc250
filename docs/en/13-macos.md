# macOS / Hackintosh

**Status on 7 October 2026:** **MetalCyan** is a BC250-specific project reporting Metal acceleration. This handbook's former claim that acceleration has no realistic path is obsolete. [Linux](06-linux.md) remains the primary gaming-console path; macOS is a separate experimental setup tied to a particular OS version.

## Projects and responsibilities

- [amethyst8118/MetalCyan](https://github.com/amethyst8118/MetalCyan): a Lilu plugin adapting Apple AMDRadeonX6000 drivers to Cyan Skillfish. Not simply PCI-ID spoofing; it started as a NootedRed fork.
- [amethyst8118/BC-250-Hackintosh-OpenCore](https://github.com/amethyst8118/BC-250-Hackintosh-OpenCore): the separate complete EFI configuration project.
- [Lilu](https://github.com/acidanthera/Lilu): required dependency, loaded before MetalCyan.

## Requirements

According to the MetalCyan README observed on 7 October 2026:

| Setting | Requirement |
|---|---|
| macOS | **Tahoe 26.7.1**; other releases are unsupported |
| SMBIOS | **MacPro7,1** |
| OpenCore | **1.0.8** in the described configuration |
| UMA framebuffer | **4 GB** in BIOS; the author reports GPU-memory exhaustion/hangs at 512 MB |
| Lilu | **1.7 or newer**, before MetalCyan |
| Other GPU kexts | Do not combine with WhateverGreen, NootedRed or NootRX |

These are driver-specific requirements, not a universal recommendation to use the same memory split on Linux.

## Installation

1. Back up the complete working EFI and original BIOS settings, especially UMA. Keep a separate bootable recovery device.
2. Prepare the OpenCore/AMD configuration for the specified macOS version using the EFI project above. MetalCyan does not replace the loader or required AMD CPU patches.
3. Set BIOS UMA to **4 GB**; other values are outside the author's described configuration.
4. Download `MetalCyan-1.0.1-RELEASE.zip` from the [MetalCyan release](https://github.com/amethyst8118/MetalCyan/releases/tag/v1.0.1), and copy `MetalCyan.kext` into `EFI/OC/Kexts`.
5. Add it to `Kernel > Add` after Lilu and disable other GPU kexts. The developer also specifies `npci=0x3000` in this EFI's boot-args.
6. Boot without experimental clocks/unlocking, check the desktop and a Metal application, then change one setting at a time.

## Verification and remaining limitations

The developer reports Metal 3, accelerated WindowServer/Safari/Firefox, 4K60, usable 4 GB VRAM and GPU telemetry. This documents the project's configuration, not our own physical-board test.

- **VCN decode/encode is unavailable in this driver**; decoding is software-based.
- **DP/HDMI audio is not configured.** Safari/TV can refuse video without an output device; use separate audio or a virtual output.
- **GPU-hang recovery is absent**; reboot is required.
- **Shutdown/restart:** the README documents a WindowServer panic during shutdown, distinct from the next boot.
- **Sleep is untested.**

Changing macOS, SMBIOS or kext version requires checking compatibility again. A version-check bypass flag does not establish support.

## Rollback

`-MCOff` disables MetalCyan and uses the unaccelerated firmware framebuffer. For full rollback restore your EFI and original BIOS settings. If the desktop is inaccessible, use the recovery boot device. Removing a kext does not undo BIOS or SMU changes.

## Research history

Earlier Monterey/OpenCore and PCI-ID discussions did not establish a BC250 Metal path. They remain historical sources, not current prohibitions. NootedRed support for other AMD APUs also contradicts the former blanket claim that AMD APUs never worked in macOS; that support alone is not BC250 support.

[Driver and OS project catalog](../../catalog/en/README.md#drivers) · [Practical tools and integrations](17-projects-and-tools.md).

## Sources

- https://t.me/c/2424231195/103173
- https://t.me/c/2424231195/53321
- https://t.me/c/2424231195/53590
- https://github.com/RehabMan/OS-X-Fake-PCI-ID
- https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series
- https://github.com/ChefKissInc/NootedRed
- https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/
- https://t.me/c/2424231195/107779
- https://t.me/c/2424231195/85166

- [MetalCyan README](https://github.com/amethyst8118/MetalCyan#readme).
