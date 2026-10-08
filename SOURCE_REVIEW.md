# BC250 source review — 2026-10-08

This is a bounded **editorial/source comparison**, not a hardware acceptance report. Practical steps remain in the numbered [handbook](README.md#quick-start); projects remain in the [thematic catalog](catalog/README.md).

## Fixed upstream delta

Reviewed the complete returned patches for [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs/compare/0524002c3be78e9926a3fc6fb9b40415b7b43b1f...954b706f0f2a426385229507c1acba00cc812f66): **55 commits, 32 changed files**. Patch addition/deletion counts agree with the API counts for every file. “Reviewed” below means a decision about those changes, not every paragraph of the upstream repository, local reproduction or adoption of every recommendation.

All links in this table refer to paths under the pinned upstream revision above.

| Changed upstream path | Decision / handbook consequence |
|---|---|
| `CONTRIBUTING.md` | Example replaces `RADV_DEBUG=nocompute` with GameMode. No equivalent command in our contribution workflow; no new generic launch-option mandate. |
| `docs/bios/flashing.md` | `Forced` already corrected. Add ambiguous flash-chip selection and programmer-overcurrent diagnosis to chapter 08. Do not copy one-board internal-flash region bounds or assume USB crisis recovery works. |
| `docs/bios/overclocking.md` | Preserve SMU contention/dependency/apply warnings in 09. The old fixed-12 stress claim is superseded by the inspected affinity-aware helper; tool limits are not AMD safety ratings. |
| `docs/bios/recovery.md` | Same chip-definition/overcurrent additions belong to 08; no removal of protection or generic current-limit prescription. |
| `docs/bios/vram.md` | Preserve workload-dependent UMA. Add scanout-carve/-ENOMEM distinction to 09: increasing dynamic TTM limits does not enlarge the real framebuffer carve; reported 6 GB remedy remains one-board evidence. |
| `docs/community/cases-data.json` | Dataset has 146 rows. Uno and MKUU were already cataloged; add the distinct morph91 Duo. Counts do not prove fit, cooling or license suitability. |
| `docs/community/cases.md` | Upstream headline count is not our curated count; retain the canonical catalog's own count rather than importing 146 as tested models. |
| `docs/contribute.md` | Same example-command change as CONTRIBUTING; no matching local production procedure to change. |
| `docs/getting-started/introduction.md` | Core/CU unlock is board-specific, not a guaranteed capability. Keep native video codecs separate from software/compute encoding; avoid repeating firmware-block/eFuse theories as proof. |
| `docs/getting-started/prerequisites.md` | Native DP/active-adapter audio depends on kernel; TV/projector BIOS-mode caveat included in 14. |
| `docs/getting-started/quick-start.md` | TT needs the frequency patch; current stock Bazzite does not carry it. Already incorporated in 06/09; no compulsory manual patch in 00. |
| `docs/hardware/cooling.md` | Pad height can lift the heatsink off the die. Preserve the original measured gap, not a universal pad thickness; add post-heatsink-work diagnosis to 04. |
| `docs/hardware/display.md` | Update 14: kernel/audio diagnosis, model-dependent modes, one-unit 4K120/CEC reports, `/dev/cec0` insufficient evidence and ostree group/name caveats. No automatic CEC configuration applied. |
| `docs/hardware/pinouts.md` | Adopt measured LED levels and buffered-controller reference in 03. Green state is inferred from a working circuit, not independently metered here. I2C orientation/topology conflict stays explicit in 08. |
| `docs/hardware/specifications.md` | Do not treat reduced FPU throughput as missing AVX2 instructions or a reported two-slice L3 layout as our measurement. Rewording “admirably” to “reasonably” adds no benchmark evidence. |
| `docs/linux/alpine.md` | Upstream link repairs do not map to a separate local Alpine chapter. Do not turn optional `mitigations=off` into a GPU requirement; the generic start route keeps distro-specific steps in 06. |
| `docs/linux/arch.md` | Audio-clock/kernel correction included in 14; no automatic adapter-purchase diagnosis. |
| `docs/linux/bazzite.md` | Stable normal 62fixolab images, stock OGC limits, SMU/TT distinction, deployment preservation and migration already incorporated. ACPI uses the ostree-specific method; suspend failure is diagnosed in 14. |
| `docs/linux/debian.md` | `.deb` assets verified for inspected releases v0.4.10–v0.4.14; old “no .deb” statement is retired. Audio uses the dated kernel matrix, not a universal active-adapter failure. |
| `docs/linux/distributions.md` | Current Bazzite is not assumed frequency-patched. Preserve optional/security cost of mitigations changes; no new preference based only on a distro name. |
| `docs/linux/kernel.md` | Frequency-patch correction already in 06/09; 14 distinguishes audio backports from general GPU stability. Dated upstream kernel recommendations are not universal current versions. |
| `docs/reference/quick-reference.md` | Active-adapter warning superseded in 14; 00 no longer freezes old kernel/UMA/tuning settings into a mandatory checklist. |
| `docs/system/40cu-unlock.md` | Keep archive/harvest-map limits. Bazzite cannot use the mutable-system module-install recipe as-is; runtime/prebuilt variants remain experimental with rollback. |
| `docs/system/8core-unlock.md` | Board-specific mask/report and old-curve/ACPI revalidation are in 09. Keep old/new AML sets separate and manually preserve config; do not copy a truncating `sed -i` recipe. |
| `docs/system/governor.md` | Example now matches the pinned packaged profile, including 1850 MHz initial cap and curve through 2000 MHz. Source installer uses a different file/backend. Explain restart/readback, package startup and separate SMU-plus/Robin compatibility. |
| `docs/system/power.md` | CPU undervolting is not the GPU curve; keep the shared-SMU warning and limits in 09. No single voltage becomes a factory safety rating. |
| `docs/system/sensors.md` | Upstream anchor-only repair; existing chapter 06 already distinguishes monitoring from PWM driver control. No sensor or bus behavior tested here. |
| `docs/troubleshooting/audio.md` | Full kernel-clock correction/retraction, remaining drift, historical watcher and codec separation in 14. Preserve author credits: Andy Nguyen, Travis K. Bangs/@bangstk, @Fleischfrau, @Weijtmans and cited contributors. |
| `docs/troubleshooting/boot.md` | Immediate shutdown after heatsink work points to thermal contact before disabling protection; chapter 04 diagnosis complements the non-destructive boot route. |
| `docs/troubleshooting/display.md` | `s2idle` failure and diagnostic journal path in 14. Suspend masks have an explicit reverse; do not silently turn Sleep into Shutdown. |
| `docs/troubleshooting/performance.md` | Governor package/patch status incorporated; media stutter can follow DP audio-clock errors instead of network failure. No GPU/network benchmark inferred. |
| `docs/troubleshooting/stability.md` | Cooling/contact and suspend diagnosis incorporated. Do not adopt a universal pad dimension or replace suspend with poweroff as the default. |

## Pinned primary governor evidence

[filippor governor at `7b08fdc`](https://github.com/filippor/cyan-skillfish-governor/tree/7b08fdcf542d1edd82f3a9077c902038019c9842): README, `default-config.toml`, source `config.toml`, RPM recipe, Cargo/debian packaging, installer and D-Bus source inspected. The packaged profile uses SMU and an initial 1000–1850 MHz range; source-checkout config uses a kernel backend and a different curve. Debian packaging enables the unit; source installer does not. RPM presets are environment-dependent. These are static recipe observations, not daemon or hardware tests.

The [collective SMU-plus at `e920106`](https://github.com/bc250-collective/cyan-skillfish-governor/tree/e9201068ff620743ca514264e6ca357eb40aed3e) is not the same configuration: it has CPU-load/performance-profile fields, another config path and a README warning about Robin 3.00 versus 5.00. Do not apply its claims to every filippor package.

## Project leads and significant continuations

The accessible recent snapshots contain **62,986 Discord** and **15,925 Telegram** records since 2026-08-18. A metadata/link scan found **136 raw GitHub identities**; **64 leads** outside the catalog URL set received direct repository metadata readback. Redirects/punctuation can map leads back to an existing project, so neither number means 64 new BC250 projects. The refreshed Discord review queue has **2,694 candidates**; the unchanged Telegram selection has **1,067**. **Queue selection is not semantic reading or acceptance of all claims.**

Eleven purpose-backed entries were added to the common catalog, including failed Somnacin core-mod work, the distinct Duo case, project-ariel and the D-Ogi Windows development stack. Generic applications, unrelated NVIDIA/keyboard projects and unsupported compatibility claims are not promoted to BC250 procedures merely because a link appeared in chat.

| Family / inspected revisions | What the source comparison establishes |
|---|---|
| F5GO CU manager `c4e9118` versus WinnieLV `a929085` | Diverged, 7 ahead / 6 behind; README and manager script differ. SteamOS UMR persistence is distinct. Do not assume identical guards or successful CU health. |
| raygan ESP32 `d8a0e76` versus Thunkar `7aba713` | 6 commits ahead, 14 changed paths; optional WiFi/MQTT/HA integration. OFF is hard PSU rail cut, not an orderly OS request. Wiring is not endorsed by this comparison. |
| Jakdaw ESP32 `a248986` versus Thunkar `7aba713` | 2 ahead, 16 changed paths; always-on dashboard, MQTT, multiple controllers and different sensing notes. Not the same interface/config as raygan. |
| hexdumb Turing fork `dbe7d24` versus upstream `2b33ab4` | Diverged, 3 ahead / 66 behind; BC250 sensor/config files present. This does not establish sensor accuracy or safe installation of all bundled dependencies. |
| infinitevalence docs / CU forks | Inspected heads equal the corresponding parent heads `954b706` / `ae7c30c`; preserve as mirrors/aliases, not independent confirmation. |
| MTSistemi VA-API `71cfb94` and simpmix `ed32f41` | 156 identical common blobs, 40 divergent common blobs, 8/2 unique paths. Encoder/shader/backend/tests diverge; shared audio/packaging/license files do not make independent VCN evidence. No codec test executed. |
| Somnacin CPUCoreMod `cb01b8f` | README reports one BC250 BIOS 5.0 unit failing at x86 initialization. Keep unsuccessful work and original Somnacin attribution; no working unlock inferred. |
| D-Ogi WDDM `450ac53` | Author reports one-unit GPU desktop/Vulkan/D3D11/D3D12 trials; test-signed, open TDR/stability/conformance. Static status-map percentages and component forks are not independent passing hardware tests. See chapter 07. |

## What remains genuinely open

Fresh authenticated readback of known Discord channels `1472030775640854564` and `1506756326045384824` returned **50001 — missing access**. The available tools do not list unknown archived threads comprehensively. Attached-media contents and uncorroborated chat-only claims remain outside this pass; archived-thread search indices are not a full guild export.

The old 971-repository index remains a dated discovery set, not proof that every fork's entire code was reviewed. No firmware, source from another project, model, driver, GPIO circuit, display mode or performance result is certified here. This pass closes the stated 32-file **patch review** and integrates selected purpose-backed project evidence; it does not label the full chat queues, all forks or the internet “complete”.
