# Cooling

> **TL;DR** — The BC-250's stock heatsink was built for a server rack's forced air tunnel, not a desk. Out of the box it throttles. The community fix: **thin out the dense stock fins** (file/sand them) and bolt a **high-static-pressure 120 mm fan** (Noctua NF-P12 is the reference) blowing *through* them. That alone takes a modded board to **~73 °C in Furmark, 63–65 °C in games**. Liquid AIO and full custom cases are the next tiers.

Cooling is the **#1 thing a newcomer gets wrong**, so do this before chasing overclocks.

---

## Why the stock cooler isn't enough

The BC-250 is a mining/server board. Its heatsink is **passive** and designed to sit in a chassis where loud fans force air front-to-back through it. On a desk with no airflow it heat-soaks and the GPU throttles. Blowing a fan *at* the flat side does almost nothing — air has to travel **through the fin channels**, plus over the backplate (the GDDR6 on the back has **no temperature sensor**, so you cool it blind).

Community-observed limits: throttling starts around **85 °C**, hard crash/reset around **90 °C**. Keep load temps below ~80 °C with headroom.

---

## Path A — Air mod (most popular, cheapest)

This is what most of the chat runs.

### 1. Thin/clean the stock fins
The stock fins are too dense and often uneven. People open up the channels so air can pass:

- **Orbital (eccentric) sander** — fastest, done in minutes, best result. ([src](https://t.me/c/2424231195/31571))
- **Sandpaper by hand** — 60 grit then 240 grit, ~3–4 h + 2 h over two days. Works but slow. ([src](https://t.me/c/2424231195/50330))
- **Scissors / snips** — crude "чекрыжить" method, last resort; results are worst. ([src](https://t.me/c/2424231195/41252))
- Straighten bent fins with a **flat tweezers + pliers**. ([src](https://t.me/c/2424231195/30670))

> ⚠ **Take the heatsink off the board first** (or fully mask/protect the board and die) before sanding/filing, and **clean every bit of metal dust off before reassembly**. Conductive metal swarf that settles on the board can short it and **kill the board** — this has already happened in the chat.

### 2. Bolt on a real fan
Mount a **120 mm high-static-pressure fan** pushing air through the fins. Reference result: **Noctua NF-P12 redux → max 73 °C in Furmark, 63–65 °C in games.** ([src](https://t.me/c/2424231195/42843))

Use a **printed fan shroud/adapter** so the fan seals against the heatsink instead of leaking air around it. Community STLs:
- `Fan_Shroud_Single_120mm.stl`, `Fan_Shroud_Dual_120mm.stl`, `Fan_Shroud_Single_140mm.stl`, `Twin_120mm_Fan_Shroud.stl`
- `BC250_FanAdapter_120mm.step`, `bc250 cooler mount.stl`, `cooler adapter v3.0.stl`

> **Why static pressure, not airflow rating?** Dense fins are a high-resistance load. A high-airflow "case fan" stalls against them; a high-static-pressure fan (≥3 mm H₂O; Noctua P12, Arctic P12) actually pushes air *through*. For very dense fins, two fans in **push–pull (series)** doubles static pressure — that's the right move here, not two fans side-by-side.

## Path B — AIO liquid cooler

A 120 mm AIO mounted to the die via an adapter bracket. Quiet and cold, but more parts and cost. Popular builds use cheap AIOs (e.g. aigo). ([example src](https://t.me/c/2424231195/19336))

## Path C — Blower ("улитка") — not recommended

Salvaged GPU blower fans were an early experiment. Loud for the result; people moved to Path A. ([src](https://t.me/c/2424231195/100086))

---

## How to test your cooling (community method, pinned)

From the pinned procedure ([src](https://t.me/c/2424231195/108407)):

1. **GPU stress:** Furmark (Vulkan / "Furmark VK").
2. **CPU at the same time:** add a CPU bench (cpu-x) or `stress`/`pipx`-based load — the APU shares one heatsink, so test both together.
   - These tools (Furmark, OCCT, cpu-x, `stress`) **aren't preinstalled** on a fresh Linux box — install them via your package manager or Flatpak first.
3. **Test under your overclock**, not stock — 1500 MHz is weak; **2000 MHz is ~+30 % FPS** and what you'll actually run, so cool for that.
4. Watch temps; if you cross ~85 °C you're throttling — add fan/shroud/fin work.

There's also a short video walkthrough of the simplest method pinned in the topic. ([src](https://t.me/c/2424231195/100024))

---

## Recommended starter setup

| Tier | Do this | Expect |
|------|---------|--------|
| Minimum | Sand fins (orbital sander) + 1× Noctua/Arctic P12 + printed shroud | ~73 °C Furmark |
| Better | Push–pull (2× P12) through shroud | lower, quieter at same temp |
| Max | 120 mm AIO on adapter | coldest, more build effort |

---

## Sources

- Pinned test method — https://t.me/c/2424231195/108407 · video — https://t.me/c/2424231195/100024
- Fin tooling — https://t.me/c/2424231195/31571 · https://t.me/c/2424231195/30670 · https://t.me/c/2424231195/50330
- Noctua P12 result — https://t.me/c/2424231195/42843
- AIO example — https://t.me/c/2424231195/19336
- Hardware reference — [mothenjoyer69/bc250-documentation `hardware.md`](https://github.com/mothenjoyer69/bc250-documentation/blob/main/hardware.md)
- Cases/adapters with cooling — [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter)

> Fan-shroud and adapter STLs are cataloged in [05-case.md](05-case.md) and mirrored under `assets/stl/`.
