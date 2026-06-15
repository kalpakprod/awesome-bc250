# Power Supply

> **TL;DR** — The BC-250 has **no power button and no standard PC power plug**. It eats **12 V** through a single **PCIe 8-pin (6+2)** connector — the same plug a desktop graphics card uses — and peaks around **~235 W** (more if you overclock). You need a 12 V source that can deliver **~250–300 W on one rail**. Three roads the community takes: a cheap **server "Flex" PSU** (HP 500 W, ~$12 on eBay), an **industrial brick** (Mean Well LOP-300/LOP-500), or a **normal ATX PSU** (just plug its PCIe cable in). The two killers to avoid: an **old PSU that splits 12 V across weak rails**, and **fake copper-clad-steel wires** that overheat and catch fire. Use real copper, **16 AWG or thicker**.

Powering the board is the **second thing a newcomer has to get right** (after [cooling](04-cooling.md)) — and the one most likely to start a fire if you cut corners on wiring.

---

## What the board actually needs

The BC-250 is a cut-down PlayStation 5 die on a crypto-mining/server board. It was meant to sit in a rack and be fed 12 V — so it has **none of the conveniences of a normal PC**:

- **No ATX 24-pin** motherboard connector.
- **No power button** — it powers on the instant 12 V arrives (the PSU's own switch is your power button).
- **One job for the PSU: deliver 12 V at enough current.**

**Power figures (confirmed):**

| Spec | Value | Source |
|------|-------|--------|
| Input voltage | 12 V DC | [hardware.md](https://github.com/mothenjoyer69/bc250-documentation/blob/main/hardware.md) |
| Typical peak draw | ~220–235 W | community-observed ([src](https://t.me/c/2424231195/31076)) |
| Connector | PCIe 8-pin (6+2) | [hardware.md](https://github.com/mothenjoyer69/bc250-documentation/blob/main/hardware.md) · ([src](https://t.me/c/2424231195/14450)) |
| Peak current on 12 V | ~18–20 A typical, design headroom to ~40 A | ([src](https://t.me/c/2424231195/31076)) |

> **"PCIe 8-pin (6+2)"** means a graphics-card power plug: six pins in a block, plus a detachable 2-pin clip, so the same cable works as either 6-pin or 8-pin. **6+2** = 6 fixed + 2 removable. This is *not* the CPU/EPS 8-pin from your motherboard — see the warning below.

A PCIe 8-pin is rated for **150 W** by the PCIe standard, and the board's three 12 V contacts (Molex Mini-Fit Jr, 9 A each) can safely pass **up to ~324 W** ([hardware.md](https://github.com/mothenjoyer69/bc250-documentation/blob/main/hardware.md)). So a single 8-pin is comfortably enough at stock; the headroom matters only when you push an aggressive overclock.

**How much PSU power to buy:** target **300 W or more on the 12 V rail**. A 300 W unit gives a healthy margin over the ~235 W peak and keeps the PSU fan calm; people report a 500 W Flex server PSU runs near-silent on this load ([src](https://t.me/c/2424231195/31076)). Don't buy below ~250 W "to save money" — you'll run it at the edge and it will get loud or shut down.

---

## ⚠️ The two mistakes that destroy boards

Read this section before you buy anything.

### 1. Don't confuse the PCIe 8-pin with the CPU/EPS 8-pin

Your ATX PSU has **two different 8-pin plugs**: one for graphics cards (**PCIe**) and one for the CPU (**EPS/CPU**, sometimes labelled "CPU" or "4+4"). **They look almost identical but their pin shapes and polarity are reversed.** Forcing a CPU plug into the BC-250 puts **+12 V where ground should be** — you can burn the whole board.

> *"It's been discussed a billion times — we have a PCIe power input. If the shape of the end pin is different, you've got a CPU plug… it literally has the opposite polarity, plus where minus should be. You can burn everything to hell."* ([src](https://t.me/c/2424231195/14450))

The board has **no sense-pin checking**, so nothing stops you from plugging in the wrong thing. The safe habit: **look at the connector clip shape, and if unsure, check + and − with a multimeter before powering on.**

### 2. Don't use fake "copper" wire — it's a fire hazard

This is the single most-repeated safety warning in the chat. Cheap pre-made adapter cables and bargain "PCIe" cables are often **copper-clad steel (CCS)** or **copper-clad aluminium (CCA)** — a thin copper skin over a steel/aluminium core. Steel has **~6× the resistance of copper**, so the wire overheats under load and can melt or ignite.

> *"The wire from the adapter overheated badly under load. It turned out it wasn't copper but iron (steel) with a thin copper coating… high resistance, heats up a lot, can cause a fire. For reliable and safe operation you MUST use full-copper wires of at least 2.5 mm²."* ([src](https://t.me/c/2424231195/108733))

> *"Checked it with a magnet 🤣 — steel threads. Resistance of these steel 'threads' is 6× higher than copper. What 450 W are they even talking about?"* ([src](https://t.me/c/2424231195/133546))

**Test before you trust:** a magnet sticks to steel, not to copper. If a connector or wire is magnetic, throw the cable out.

---

## Wire gauge & connector guidance

The board documentation and the chat agree on the same safe baseline:

| Use case | Wire | Source |
|----------|------|--------|
| Single 8-pin, stock / light OC | **16 AWG** copper (~1.3 mm²) | [hardware.md](https://github.com/mothenjoyer69/bc250-documentation/blob/main/hardware.md) |
| Hand-built cable, want margin | **2.5 mm²** (~13 AWG) full copper | ([src](https://t.me/c/2424231195/108733)) |
| Heavy overclock | thicker / **dual feed** (see J2000/J2001) | [hardware.md](https://github.com/mothenjoyer69/bc250-documentation/blob/main/hardware.md) |

The numbers don't conflict — **16 AWG is the documented minimum**; the 2.5 mm² figure is one builder choosing extra headroom after a CCS-wire scare. **The non-negotiable part is "real copper," not the exact gauge.** Lower AWG number = thicker wire = safer.

For connector contacts that carry the full current, target ones rated for the peak: builders aim for contacts/wire good for **~40 A** on a heavy build, and bolt or properly crimp them rather than relying on a flimsy push-fit ([src](https://t.me/c/2424231195/31076)).

---

## The 8-pin pinout (J1000)

Looking at the board's main power connector — the **top row is all ground, the bottom row is 12 V except one ground**. From [hardware.md](https://github.com/mothenjoyer69/bc250-documentation/blob/main/hardware.md):

```
J1000 (PCIe 8-pin), contacts facing you:

  [ GND  GND  GND  GND ]   ← top row: all ground (−)
  [ GND  12V  12V  12V ]   ← bottom row: one ground + three 12 V (+)
```

The chat states the same polarity in plain words — count the pins **1 to 3 = +12 V, pins 4 to 8 = ground**:

> *"Pins one through three should be +, the rest from four to eight are minus… The board has no sense check. Take a tester and see where + and − are."* ([src](https://t.me/c/2424231195/14450))

This matches a standard PCIe 8-pin exactly, which is *why* a normal ATX PSU's PCIe cable just works. **If you build your own cable, verify every pin with a multimeter before first power-on** — polarity mistakes are unforgiving here.

### Redundant connectors J2000 / J2001 (advanced)

Next to the main plug are two smaller connectors, **J2000** and **J2001**. These are **ALLTOP headers, directly interchangeable with Molex Micro-Fit (444280801) BMI headers** ([hardware.md](https://github.com/mothenjoyer69/bc250-documentation/blob/main/hardware.md#j2000-and-j2001)). Their pinout:

```
J2000 / J2001 (identical):
  [ 12V  12V  12V  PGD ]   ← three 12 V + a PGOOD signal pin
  [ GND  GND  GND  GND ]
```

In a rack these provide redundant feed from a second PSU; the **PGD (PGOOD)** pin carries 5 V when the second supply is present. For a desktop build you normally ignore them — but for a **heavy overclock**, the documentation suggests feeding 12 V through **J2000/J2001 in addition to J1000** to spread the current ([hardware.md](https://github.com/mothenjoyer69/bc250-documentation/blob/main/hardware.md)). Some builders go further and **solder a Micro-Fit/Mini-Fit connector straight onto the board's 12 V pads** with heavy copper, bypassing the stock plug entirely (see the soldered-connector example below). That's an experts-only mod — easy to overheat the pads, and it permanently alters the board.

---

## PSU options the community uses

There are three practical roads. All deliver 12 V; they differ in price, size, noise, and how much wiring work you do.

| Option | What it is | Price | Pros | Cons |
|--------|-----------|-------|------|------|
| **Server "Flex Slot" PSU** | HP/Dell/etc. 1U datacenter brick (e.g. HP 500 W Platinum) | ~$12–25 used | Cheap, near-indestructible, huge single 12 V rail, very compact | Needs a jumper/resistor to start; tiny 15 000 RPM fan is jet-loud unless replaced; you wire the 8-pin yourself |
| **Industrial brick (Mean Well)** | Enclosed AC→DC supply, single 12 V (LOP-300 = 300 W/25 A, LRS-350, LOP-500) | ~$25–45 new | New, clean single rail, quiet, datasheet-spec'd | You wire the 8-pin yourself; bare terminals need an enclosure |
| **Normal ATX / Flex-ATX / SFX PC PSU** | Any decent modern PC power supply | varies | **Zero modding** — its PCIe 8-pin cable plugs straight in; safest for newcomers | Bulky for a mini build; overkill wattage; mind the single-rail rule below |

### Option A — Server Flex PSU (most popular cheap route)

The community favourite is a used **HP Flex Slot 500 W** server supply — *"bought for a laughable $12 on eBay… these run almost forever, far more headroom than how often datacenters swap them, plus Platinum efficiency"* ([src](https://t.me/c/2424231195/31076)). These don't have a PCIe plug, so you adapt one:

1. **Start the PSU:** bridge the two short start pins (pins 1–2) with a jumper or latching switch.
2. **Enable the 12 V rail:** put a **~500 Ω resistor between pin 3 and GND** (the wide left pin).
3. **Tap 12 V:** either solder a PCIe 8-pin straight to the 12 V pins, or fit a connector into the housing — *"but the wires and connector must handle the peak 40 A"* ([src](https://t.me/c/2424231195/31076)).

Other proven server/console bricks people use: **PlayStation 3 FAT PSU** (32 A / 12 V — *"more than enough and very stable, I recommend it for the BC-250"* ([src](https://t.me/c/2424231195/62332)), [src](https://t.me/c/2424231195/102734)), Dell D550E, Juniper JPSU-350, and various ASIC-miner supplies. There's also a community board to automate Flex-PSU power-on: [ESP32-BC250-LOP_PSU-PowerON-Xbox](https://github.com/dexikdex/ESP32-BC250-LOP_PSU-PowerON-Xbox) ([src](https://t.me/c/2424231195/142498)).

> **Heads-up on the fan:** the stock 40 mm fan in these bricks can spin to ~15 000 RPM and *"sound like a jet taking off."* In practice, on the BC-250's modest load it stays calm, and several users confirm it's *"not noisy at all with our little board"* ([src](https://t.me/c/2424231195/33455)). If it bothers you, swap in a quieter 40 mm fan with adequate airflow.

### Option B — Mean Well industrial brick

A new **Mean Well LOP-300-12** (300 W, 12 V, 25 A) or **LRS-350** is the tidy, reliable choice: a single 12 V rail straight from the datasheet, no rail-splitting games, and quiet. Larger **LOP-500** exists if you want maximum overclock headroom. You still wire the PCIe 8-pin to its screw terminals yourself, and because the terminals are exposed you should box it in. Product pages circulated in the chat: [LOP-300-12 on ChipDip](https://www.chipdip.ru/product/lop-300-12-blok-pitaniya-12v-25a-300vt-mean-well-9001511866) · [LRS-350-12](https://www.chipdip.ru/product/lrs-350-12-blok-pitaniya-12v-29a-348vt-mean-well-9000334417).

### Option C — A normal PC PSU (easiest, safest for a newcomer)

If you already own a decent **ATX, Flex-ATX, SFX or TFX** power supply, you're done: **plug its PCIe 8-pin cable into the board.** No jumpers, no soldering, no resistor. This is the lowest-risk option for someone who unboxed the board yesterday. To power it on without a motherboard, jump the **green PS_ON wire to any black ground** on the 24-pin (the standard "paperclip" trick). Compact **Flex-ATX 400 W** units are popular for small cases.

---

## ⚠️ The one PSU spec that catches everyone: single vs. multi-rail 12 V

An old branded PSU can have a high total wattage and **still fail**, because it **splits 12 V into several weak rails** that each cap out below what the board needs:

> *"Important note for everyone tempted to buy an old branded FSP and the like. What matters here is 12 V current delivery. In old PSUs the 12 V is split across two rails, and each one alone can't supply enough power. Either buy with a big margin, or get a modern DC-DC PSU where the 12 V is a single rail that delivers the full wattage."* ([src](https://t.me/c/2424231195/7561))

**Rule:** prefer a **single-rail 12 V** PSU (any modern DC-DC design, server Flex, or Mean Well qualifies). If you must use an old multi-rail unit, make sure **one rail** alone covers ~250 W, or buy with large headroom.

---

## What a real build looks like

- **Plug-and-play in a case:** a board mounted in a small aluminium case fed by an ordinary **ATX PCIe 8-pin cable** (sleeve marked *PCI-E 16AWG*) — exactly the no-mod route ([src](https://t.me/c/2424231195/41666)).
- **The connector area:** close-up of the board showing the white **fan header** and the black **power connectors** (J2000/J2001 region) you'll be wiring to ([src](https://t.me/c/2424231195/39395)).
- **A working desk unit:** board standing on its I/O bracket, LEDs lit, running off an external 12 V brick ([src](https://t.me/c/2424231195/27556)).
- **Experts-only:** a **Molex Micro-Fit connector soldered directly to the board's 12 V pads** with thick copper and heavy solder — the "bypass the stock plug" overclock mod. Effective but unforgiving; only attempt if you know ГОСТ-grade soldering ([src](https://t.me/c/2424231195/135782), and [Jack Fisher's teardown notes](https://t.me/c/2424231195/92185)).

---

## Recommended starter setup

| Tier | Do this | Why |
|------|---------|-----|
| **Easiest / safest** | Any modern **single-rail ATX/SFX PSU**, plug its PCIe 8-pin in, paperclip PS_ON | Zero modding, correct polarity guaranteed |
| **Cheapest / compact** | Used **HP Flex 500 W**, jumper pins 1–2, 500 Ω on pin 3→GND, real-copper 16 AWG 8-pin | ~$12, tiny, huge 12 V rail |
| **Cleanest new build** | **Mean Well LOP-300-12** in an enclosure, crimped 16 AWG 8-pin | New, quiet, single rail, datasheet-spec'd |

Whatever you pick: **single 12 V rail, ≥300 W, real-copper wire ≥16 AWG, PCIe (not CPU) polarity, magnet-test your cables.**

---

## Sources

- Hardware reference (connector, pinout, AWG, J2000/J2001) — [mothenjoyer69/bc250-documentation `hardware.md`](https://github.com/mothenjoyer69/bc250-documentation/blob/main/hardware.md) · [J2000/J2001 section](https://github.com/mothenjoyer69/bc250-documentation/blob/main/hardware.md#j2000-and-j2001)
- PCIe-vs-CPU polarity & pinout warning — https://t.me/c/2424231195/14450
- Single-rail vs multi-rail 12 V — https://t.me/c/2424231195/7561
- Fake copper-clad-steel wire fire hazard — https://t.me/c/2424231195/108733 · https://t.me/c/2424231195/133546
- HP Flex 500 W full guide (start procedure, fan, 40 A wiring) — https://t.me/c/2424231195/31076 · fan noise follow-up — https://t.me/c/2424231195/33455
- PS3 FAT PSU as a 12 V source — https://t.me/c/2424231195/62332 · https://t.me/c/2424231195/102734
- Cutting/soldering your own 8-pin — https://t.me/c/2424231195/41646 · direct-solder connector teardown — https://t.me/c/2424231195/92185
- Build photos — 8-pin in case https://t.me/c/2424231195/41666 · connector area https://t.me/c/2424231195/39395 · working unit https://t.me/c/2424231195/27556 · soldered Micro-Fit https://t.me/c/2424231195/135782
- ESP32 auto power-on for Flex/LOP PSU — [dexikdex/ESP32-BC250-LOP_PSU-PowerON-Xbox](https://github.com/dexikdex/ESP32-BC250-LOP_PSU-PowerON-Xbox) ([src](https://t.me/c/2424231195/142498))
- Mean Well product pages — [LOP-300-12](https://www.chipdip.ru/product/lop-300-12-blok-pitaniya-12v-25a-300vt-mean-well-9001511866) · [LRS-350-12](https://www.chipdip.ru/product/lrs-350-12-blok-pitaniya-12v-29a-348vt-mean-well-9000334417)

> Cooling the PSU's airflow into the board's heatsink is covered in [04-cooling.md](04-cooling.md). Case builds that integrate the PSU are in [05-case.md](05-case.md).
