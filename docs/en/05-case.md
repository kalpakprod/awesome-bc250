# Cases & 3D Printing

> **TL;DR** — The BC-250 ships as a bare board, so almost everyone prints an enclosure. There is no single "right" case — the community has produced **dozens** of designs, from a minimal **cooling sleeve** that just clips two halves around the board, to full **console-style boxes** with a carry handle, a front screen and RGB. Whatever you print, the case has to do one job the stock board can't: **seal a 120 mm fan against the heatsink fins** so air goes *through* them (see [Cooling](04-cooling.md)). This page is the catalog: name → STL → fans → where to download. **Mind the PSU**: most cases are designed around a specific power supply (LOP, Flex/SFX ATX, or an HP server brick) — pick the case that matches the [PSU](03-power-supply.md) you have.

A "case" here ranges from a 200 g print that takes 20 minutes of work to a multi-part console that took its author weeks. Start simple; you can always reprint.

> **New and unsure? Print the [onemorecap sleeve/shell](#tier-1--minimal-cooling-sleeve-start-here) case — minimal, nothing to cut, fits a single 120 mm fan — and stop there.** The catalog below is deep; you do not need to read it to get going.

---

## Community builds

A taste of what people have actually printed — from a bare open shell to fully-themed consoles. Same board, wildly different results.

<p align="center">
  <img src="../../assets/img/case-shell.jpg" alt="onemorecap Shell Case: open side-plate, carry handle, exposed copper fins, Arctic 120 mm fan" width="60%"><br>
  <sub>Build by Дима Ткач · <a href="https://t.me/c/2424231195/22771">source</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-frame.jpg" alt="White aluminium open frame with internals on show: twin heatsinks, central white Arctic fan, Flex PSU" width="60%"><br>
  <sub>Build by Сергей · <a href="https://t.me/c/2424231195/87420">source</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-orange.jpg" alt="Orange-and-white enclosed console with perforated mesh side panel and a moulded carry handle" width="60%"><br>
  <sub>Build by Alexander Susl · <a href="https://t.me/c/2424231195/122822">source</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-arasaka.jpg" alt="ARASAKA cyberpunk-themed console: white face, chrome fan grille, green accents and feet" width="60%"><br>
  <sub>Build by Maxim Perelygin · <a href="https://t.me/c/2424231195/98072">source</a></sub>
</p>

---

## How to choose

Three questions decide which case fits you:

1. **What PSU are you using?** ([Power Supply](03-power-supply.md)) — A Meanwell **LOP-300** is small and lives *inside* most cases. A **Flex/SFX ATX** PSU is bigger and needs a case with a dedicated bay. A salvaged **HP/server brick** needs the "v3/v4 server PSU" cases. This is the single biggest filter.
2. **What fan(s) will you run?** Nearly every case is built around **one 120 mm fan** over the heatsink. Bigger builds add a **second 120 mm** fan on the backplate (to cool the GDDR6 memory, which has [no temperature sensor](04-cooling.md)) or feed the PSU. A few use **140 mm** or **slim** fans where height is tight.
3. **Have you thinned the fins yet?** Most cases assume you've already **filed/sanded the stock heatsink fins** open (see [Cooling, Path A](04-cooling.md)). A case alone does not fix the stock cooler — it just holds the fan in the right place.

> **Jargon, once:** **STL** = the standard 3D-print mesh file you load into a slicer. **STEP / 3MF** = editable CAD formats (use these if you want to modify the design). **Shroud / sleeve / adapter** = a printed funnel that makes the fan seal against the fins instead of leaking air around them. **Flex / SFX ATX** = small form-factor PC power supplies. **LOP** = the Meanwell LOP-300 industrial PSU the community favours.

---

## Tier 1 — Minimal "cooling sleeve" (start here)

The smallest, fastest thing you can print. It is **not really a case** — it's a printed jacket that snaps onto the board in two halves on a tight friction fit, holds a 120 mm fan against the heatsink, and ducts the air. **Nothing to cut, no screws into the board.** Дима Ткач (one of the project's earliest builders) describes two variants — a compact one and a "more fun looking" one — both hitting **~70 °C at 150 W** of load, ~210 g / ~170 g of plastic each, with the PSU staying cold on turbulent airflow ([src](https://t.me/c/2424231195/10743)). His verdict: *"this is not really a case, more of a cooling sleeve, but nothing needs to be cut, it all holds on a very tight fit, the halves are dropped on from opposite sides."*

- **Files:** `BC-250-FanSleeves.3mf` ([src](https://t.me/c/2424231195/10766)), board CAD `bc-250-body.step` ([src](https://t.me/c/2424231195/18266))
- **Source repo:** [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) — the most-recommended "verified, printed, confirmed working" minimal design in the chat ([src](https://t.me/c/2424231195/18260))
- **Fan:** 1× 120 mm
- **PSU:** any — there's a hole/cut-out for the power lead so you can use a LOP *or* an external supply ([src](https://t.me/c/2424231195/22950))

---

## Tier 2 — Open frame / "shell" (board on display)

Half-cases that wrap the board on one side and leave the heatsink visible. Light on plastic, easy to assemble, good airflow.

### onemorecap "Shell Case" — the reference build

The single most value-reacted case post in the chat (❤33): a flat side-plate over the board embossed with **"BC-250"** and the CU-grid pattern, a **carry handle** moulded into the top, the **thinned heatsink fins exposed** in the middle, and a 120 mm **Arctic** fan in its own shroud bolted to the right-hand end. Marked *"BC-250 SHELL CASE BY ONEMORECAP / ASRock × CMG"* ([src](https://t.me/c/2424231195/22771)). The matching set of STLs was posted to the chat in one batch ([src](https://t.me/c/2424231195/81672)) and the author confirmed the models are free on Printables and MakerWorld ([src](https://t.me/c/2424231195/24505)).

- **Files (chat batch):** `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl`, plus the fan shrouds below ([src](https://t.me/c/2424231195/81680))
- **Source:** [GitHub onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case)
- **Fan:** 1× or 2× 120 mm (via shroud), or 1× 140 mm
- **PSU:** the `Shell_Back_FLEX_ATX` back panel is cut for a **Flex ATX** PSU

### Acrylic open frame (Владислав)

An open **aluminium-and-acrylic** frame: two metal end-plates with clear side panels, the board mounted vertically, a single **Arctic 120 mm** fan blowing straight through the thinned heatsink in the centre, and a Flex/SFX PSU sitting in the bottom bay ([src](https://t.me/c/2424231195/114651)). This is the design later cross-posted to [r/BC250Gaming as the "acrylic case"](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/). The printed brackets are the parts you reproduce; the frame itself is laser-cut/off-the-shelf.

- **Fan:** 1× 120 mm (center) — room to add a backplate fan
- **PSU:** Flex / SFX ATX in the lower bay

---

## Tier 3 — Console-style boxes (fully enclosed)

Closed enclosures that look like a game console or a small NAS. More plastic and more print time, but a finished product with handle, power button, vented panels and sometimes a screen.

### "Просто лучший корпус" (Jack Fisher × B1zon) — community favourite

Posted under the curated **#BC250body** tag as *"simply the best case"*, this is a fully-finished console with a published bill of materials: PSU, fans, connector, rubber feet, power button, screws + threaded inserts, a fan PWM splitter, a "Cyberpunk" sticker and a heatsink-straightening comb. Some parts are out of production and have substitutes ([src](https://t.me/c/2424231195/79990)). Design credit to B1zon, assembly by Jack Fisher.

- **Files:** `BC250 korpus исправленный.rar` ("BC250 case, corrected") ([src](https://t.me/c/2424231195/79989))
- **Fan:** 120 mm (front) + PWM splitter for a second fan
- **PSU:** internal (LOP-class)

### Triple-"GPU" front (Гослинг)

A console box whose front panel is a **fake graphics-card shroud** — three circular fan cut-outs in a row with RGB, so the machine looks like a discrete GPU. Shown running **Bazzite 42** on the BC-250 ([src](https://t.me/c/2424231195/66616)). The three openings are cosmetic over the single working fan plus intake.

### Maze-panel white console (Jhonatan)

A tall white box with a striking **maze/circuit-pattern vented side panel**, an illuminated (green) metal power button, and a full-height intake grille on the front face — one of the more polished aesthetics in the chat ([src](https://t.me/c/2424231195/121274)).

### Grid-mesh mini-tower (Joglik)

A grey vertical mini-tower with dense **square-grid mesh** on the side and top, a slot/handle notch in the top edge, and a round cable pass-through at the bottom rear. Clean industrial look ([src](https://t.me/c/2424231195/126525)).

### Oval-window hi-fi box (a m)

A white rectangular case styled like a hi-fi/microwave front: a large **stadium-shaped mesh window** with the fan visible behind a circular mesh, flanked by two vertical mesh slots ([src](https://t.me/c/2424231195/52955)). The author's later iteration moves toward "proper plastic" instead of foamed PVC and adds external XT-series power and RGB ([src](https://t.me/c/2424231195/128048)).

### Compact console (Volodymyr Spyrydonov, "v15")

A small silver-and-black console box with a mesh side intake and a dark front carrying a cyberpunk-style emblem and an RGB strip, shown sitting next to a TV as a living-room machine ([src](https://t.me/c/2424231195/135995)). Part of a long line of revisions (v15/v19/v20 source images were shared early on).

---

## Tier 4 — Big builds: ATX PSU, AIO liquid, screens

For people who want a full-size PSU, liquid cooling, or an integrated display.

### NexGen3D "DIY Steam Machine" family

The **most-pointed-to 3D project** in the community (reposted 7×). A family of console cases on Printables, including a **liquid-cooled "Pro"** variant and a **"Redux"** edition that fits an **internal 1080×480 Pi screen** in the front ([Reddit build](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)). There is a dedicated **AIO mount** model for putting a 120 mm all-in-one liquid cooler on the die.

- [Printables 1499974 — DIY Steam Machine (base)](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite)
- [Printables 1614131 — Pro Liquid-Cooled](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) · [Printables 1649679 — Redux](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) · [Printables 1554003 — AIO mount](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250)
- **Fan/cooling:** 120 mm air **or** 120 mm AIO depending on variant
- **PSU:** LOP version and ATX versions documented

### ATX-PSU cases (Victor L., V\ad, server-PSU v3/v4)

For a full **ATX** power supply: a case built around a complete ATX PSU ([src](https://t.me/c/2424231195/119293), heading to MakerWorld), an earlier first-timer Blender prototype ([src](https://t.me/c/2424231195/105570)), and a published **HP/server-PSU** line on Printables/MakerWorld with HDD and USB-hub provisions.

- [Printables 1580750 — Case v3, HP server PSU + HDD + USB hub](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) · [MakerWorld 2481620 — Case v4, FlexATX & HP-server PSU](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) · [Printables 1550729 — ATX-PSU Bazzite Box](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box)

### Twin-120 builds (memory + PSU cooling)

A redesigned mounting plate carrying **two 120 mm fans** — one ducted to the backplate (memory) as the board's designer intended, the second feeding the PSU. With Lian Li P28 fans front + a Thermalright C12015, the author holds **2200 MHz at 80 °C in games**, where a single front fan wasn't enough ([src](https://t.me/c/2424231195/120606)). A standalone **`Twin_120mm_Fan_Shroud.stl`** is shared for this ([src](https://t.me/c/2424231195/121684)).

---

## Adapters & mounts (not full cases)

Small printed parts that solve one problem — usually mounting a cooler or fan to the board.

- **Fan shrouds** (seal a fan to the fins): `Fan_Shroud_Single_120mm.stl`, `Fan_Shroud_Dual_120mm.stl`, `Fan_Shroud_Single_120mm_Restricted.stl`, `Fan_Shroud_Single_140mm.stl` ([src](https://t.me/c/2424231195/81673)), `Twin_120mm_Fan_Shroud.stl` ([src](https://t.me/c/2424231195/121684)). Also catalogued in [Cooling](04-cooling.md).
- **Backplate / memory fan mounts:** `Backplate.stl` + `backplane-top-fixed.stl` ([src](https://t.me/c/2424231195/133049)); `bottom_fan_mount.stl`, `top_fan_mount.stl`, `Front-Mount.stl`, `Back-Mount.stl` ([src](https://t.me/c/2424231195/131189))
- **AM4 cooler adapters** (bolt a standard CPU cooler to the die): `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` ([src](https://t.me/c/2424231195/9949)). See also [Printables 1042228 — BC250→AMD CPU-cooler mount](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount).
- **120 mm fan adapter:** `BC250_FanAdapter_120mm.step` ([src](https://t.me/c/2424231195/83135)), `cooler adapter v3.0 (1).stl` ([src](https://t.me/c/2424231195/111091))
- **Accurate board models** (design your own case against these): [Printables 1341336 — accurate BC-250 board](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) ([src](https://t.me/c/2424231195/55496)), [Printables 1103626 — AMD BC250 board](https://www.printables.com/model/1103626-amd-bc250-board)

---

## Catalog table

Files marked *(chat)* are mirrored under `assets/stl/`; everything else downloads from the linked Printables / MakerWorld / GitHub page.

| Case / part | Type | STL / source files | Fans | Download |
|---|---|---|---|---|
| **onemorecap cooling sleeve** | minimal sleeve | `BC-250-FanSleeves.3mf` *(chat)* | 1× 120 | [GitHub onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) |
| **onemorecap Shell Case** ⭐ | open shell | `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl` *(chat)* | 1–2× 120 / 1× 140 | [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [GitHub](https://github.com/onemorecap/bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case) |
| **Acrylic open frame** (Владислав) | open frame | printed brackets *(chat #114651)* | 1× 120 | [Reddit thread](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) |
| **"Просто лучший корпус"** (Jack Fisher × B1zon) | console | `BC250 korpus исправленный.rar` *(chat)* | 120 + PWM splitter | [chat #79989](https://t.me/c/2424231195/79989) |
| **Minimal case for Flex PSU** | small box | `minimal-case-...-model_files.zip` *(chat)* | 1× 120 | [Printables 1423572](https://www.printables.com/model/1423572-minimal-case-for-bc250-and-flex-psu) |
| **forgenam case** | console | `forgenam-case-bc250-model_files.zip` *(chat)* | 1× 120 | [Printables 1375929](https://www.printables.com/model/1375929-forgenam-case-bc250) |
| **Minimalist 240** | console + handle | `Minimalist 240 Front/Back/Handle.stl` *(chat)* | 120 | [chat #117404](https://t.me/c/2424231195/117404) |
| **M360** | console | `M360 Front.stl`, `M360 Back.stl` *(chat)* | 120 | [chat #126566](https://t.me/c/2424231195/126566) |
| **NexGen3D DIY Steam Machine** ⭐ | console | Printables files | 1× 120 | [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) |
| **NexGen3D Pro (liquid)** | console + AIO | Printables files | 120 AIO | [Printables 1614131](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) |
| **NexGen3D Redux (+screen)** | console + 1080×480 screen | Printables files | 1× 120 | [Printables 1649679](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) |
| **NexGen3D AIO mount** | adapter | Printables files | 120 AIO | [Printables 1554003](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250) |
| **Case v3 — HP server PSU** | console + HDD/USB | Printables files | 120 | [Printables 1580750](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) |
| **Case v4 — FlexATX / HP PSU** | console | MakerWorld files | 120 | [MakerWorld 2481620](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) |
| **ATX-PSU Bazzite Box** | full-ATX box | Printables files | 120 | [Printables 1550729](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box) |
| **ivanov-innokentii case** | console | GitHub sources | 120 | [GitHub ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) |
| **rLapchynski enclosure** | enclosure | GitHub sources | 120 | [GitHub rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure) |
| **BC-250 Scooper** | shroud/scoop | Printables files | 120 | [Printables 1282906](https://www.printables.com/model/1282906-bc-250-scooper) |
| **Pitman case** | console | Printables files | 120 | [Printables 1570248](https://www.printables.com/model/1570248-amd-bc-250-pitman-case) |
| **Industrial-style FlexATX** | console | `amd_bc_250_industrial_style_case...zip` *(chat)* | 120 (no stock cooler) | [chat #144265](https://t.me/c/2424231195/144265) |
| **Twin-120 mount plate** | adapter plate | `Twin_120mm_Fan_Shroud.stl` *(chat)* | 2× 120 | [chat #121684](https://t.me/c/2424231195/121684) |
| **Fan shrouds (120/140)** | shroud | `Fan_Shroud_Single_120mm.stl`, `_Dual_120mm`, `_Single_140mm`, `_120mm_Restricted` *(chat)* | 120 / 140 | [Printables 1339540](https://www.printables.com/model/1339540-yet-another-bc-250-fan-shroud) · see [Cooling](04-cooling.md) |
| **AM4 cooler adapter** | mount | `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` *(chat)* | tower/AIO | [Printables 1042228](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount) |
| **Accurate board model** | reference CAD | `bc-250-body.step` *(chat)* | — | [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) |

⭐ = most value-reacted / most-reposted in the community.

---

## No printer? Options people use

- **Buy a print.** Sellers exist on [Etsy](https://www.etsy.com/listing/1904632447/), eBay and OLX; people also offered to print/sell cases in-chat ([src](https://t.me/c/2424231195/55507)).
- **Print-on-demand:** upload an STL to a service. Builders in the chat run print farms (one shows a wall of Flsun/Creality/Bambu printers, [src](https://t.me/c/2424231195/73481)).
- **No case at all / repurpose.** Many run the board on an open bench while testing. Others gut existing hardware: an old all-in-one PC with the board implanted and a blower ([src](https://t.me/c/2424231195/30914)), a ventilation-duct box ([src](https://t.me/c/2424231195/64265)), or aluminium amplifier enclosures (needs filing/drilling, [src](https://t.me/c/2424231195/108907)). One member even hid the board inside an old VHS player as a joke ([src](https://t.me/c/2424231195/84106)).

> A naked, well-cooled board outperforms a sealed pretty box with poor airflow. Get [Cooling](04-cooling.md) right first; the case is the second step.

---

## Sources

- Curated **#BC250body** showcase (one good build per day) — pinned idea [src](https://t.me/c/2424231195/79685)
- Minimal sleeve, two variants — [src](https://t.me/c/2424231195/10743) · models on [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) [src](https://t.me/c/2424231195/18260)
- Shell Case (❤33) — [src](https://t.me/c/2424231195/22771) · free on Printables/MakerWorld [src](https://t.me/c/2424231195/24505) · STL batch [src](https://t.me/c/2424231195/81680)
- "Просто лучший корпус" + BOM — [src](https://t.me/c/2424231195/79990) · files [src](https://t.me/c/2424231195/79989)
- Acrylic open frame — [src](https://t.me/c/2424231195/114651) · [Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/)
- Twin-120 mounting plate, 2200 MHz @ 80 °C — [src](https://t.me/c/2424231195/120606) · shroud [src](https://t.me/c/2424231195/121684)
- Console designs (photos) — Гослинг/Bazzite [src](https://t.me/c/2424231195/66616) · Jhonatan maze panel [src](https://t.me/c/2424231195/121274) · Joglik grid mesh [src](https://t.me/c/2424231195/126525) · a m oval window [src](https://t.me/c/2424231195/52955) · Spyrydonov v15 [src](https://t.me/c/2424231195/135995)
- NexGen3D Steam Machine family — [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) · [Redux + Pi screen (Reddit)](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)
- Board reference model — [src](https://t.me/c/2424231195/55496) · [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)
- GitHub case repos — [onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) · [rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure)

> Fan-shroud STLs are shared with [Cooling](04-cooling.md). All chat-hosted STL/STEP/3MF files are mirrored under `assets/stl/`.
