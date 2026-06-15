# BIOS & Brick Recovery

> **TL;DR** — A wrong BIOS setting can **brick the BC-250 dead**, and on this board a CMOS clear does *not* always recover it ([src](https://t.me/c/2424231195/54971)). Before you flash *anything*, understand this: you need a **hardware recovery kit** (a **CH341A-class SPI programmer + female-to-female DuPont wires**) on hand, because the only reliable un-brick is re-flashing the chip externally through the board's **J4004 header**. The popular community mod ("death's" BIOS, latest based on stock **5.00**) unlocks overclocking, GDDR6 timings and iGPU memory allocation — useful, but **not all settings are safe, and some brick the board instantly** ([src](https://t.me/c/2424231195/78922)). Verify the **SHA-256** of every image first, and read [`assets/firmware/DISCLAIMER.md`](../../assets/firmware/DISCLAIMER.md). **Do not flash casually.**

⚠️ **This is the most dangerous chapter in the handbook.** Flashing is destructive and irreversible without recovery hardware. If you are not prepared to solder/clip onto a SPI chip to revive a brick, **stop here and run the stock BIOS.**

---

## What the BIOS is on the BC-250

The BC-250 is an AsRock-built mining/server board carrying a cut-down PS5 "Oberon" APU. Its UEFI firmware lives on a **16 MB SPI flash chip** (a Winbond **W25Q128** / Macronix MX25L128 in an 8-pin SOIC package). Stock firmware is heavily locked: almost nothing useful is exposed in Setup. Known stock versions seen in the chat are **3.00** and **5.00**; the modded BIOSes are rebuilt from these (the version number is your anchor — always note which base a mod is built on).

Two reasons people reflash:

1. **To install a modded BIOS** that unlocks hidden menus (overclock, undervolt, memory, iGPU VRAM).
2. **To recover a brick** — restore a known-good image after a bad setting or a failed flash.

---

## The modded BIOS ("death" mod) — what it changes and why

The reference community mod is maintained by **death** in the chat. It is *not* a from-scratch firmware — it re-enables (unhides) AMD/AMI Setup options that the stock BIOS ships hidden. Track the versions, because the advice changed over time:

| Mod version | Base | Released | What it exposed / changed | Status |
|---|---|---|---|---|
| **1.0** (first release) | stock **3.00** | 2025-06-28 | GDDR6 frequency, GDDR6 timings, iGPU UMA memory size, core frequency, voltages | ⚠️ Bad values brick the board, **CMOS clear did not help** ([src](https://t.me/c/2424231195/54971)) |
| 3.0 variants | 3.00 | 2025-07 → 10 | Same unlocks; one build added a **custom Steam boot logo** | Cosmetic logo build mirrored as `bc250-Steam.rom` ([src](https://t.me/c/2424231195/86420)) |
| **5.00 mod** (current) | stock **5.00** | 2025-10-05 | Tabs regrouped; **more settings opened**; **RAM/GDDR6 timing settings now actually apply** on this board | Newest; "not all settings are useful, but better than nothing" ([src](https://t.me/c/2424231195/78922)) |

What you can actually tune with it (from the first-release notes, [src](https://t.me/c/2424231195/54971)):

- **GDDR6 frequency** — reported working at **1800** for one user (`@Haswellb`), but the *same kind of change bricked another board* — values are board-specific, not universal.
- **GDDR6 timings** — they apply, but **too-low/tight timings brick** the board.
- **iGPU memory (UMA) size** — works and gives a real uplift. If your change doesn't take effect, set **IGC: Forces** and **UMA Mode: UMA_SPECIFIED** ([src](https://t.me/c/2424231195/54971); same combo confirmed by the community docs).
- **Core frequency / voltages** — exposed but **"not tested"** by the author.

> ❗ **Two author warnings, still current:** (1) **Do not disable Integrated Graphics** — it is the only display output. (2) On the 1.0/3.00 generation, **a wrong setting bricks the board and CMOS reset will not recover it** — that is exactly why you need a programmer. The 5.00 mod is the better starting point today.

There is also a separate **chipset-menu mod** (`BC250_3.00_CHIPSETMENU.ROM`) from the most-referenced BIOS repo, **[TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios/)**, which exposes the **chipset menu / NBIO Common Options** on top of stock 3.00. That repo's own README says plainly: *"Nothing in this repository is supported or has any kind of warranty — TAKE BACKUPS."*

---

## Before you flash — the safety checklist

1. **Back up your current BIOS first** (read it out with the same tool you'll flash with — see Path B/recovery). A backup is your free undo.
2. **Verify SHA-256** of the image against `assets/PROVENANCE.md` / the source post. The community flashing guide publishes the hash for the chipset-menu ROM as
   `48fbe5d366e6a56e2fdffdca848426216ba1f083610dab63db89d2f4e6c940b5` ([elektricm docs](https://elektricm.github.io/amd-bc250-docs/bios/flashing/)).
3. **Confirm the chip size**, not just the marking. The 16 MB BIOS chip is the target; **do not** flash the small SuperIO chip (see the recovery section). Different board revisions can carry slightly different chip part numbers — the **capacity (16 MB)** is what matters, last letters of the marking can differ ([src](https://t.me/c/2424231195/67880)).
4. **Have recovery hardware ready** *before* the first flash, not after you brick.
5. After flashing, **clear CMOS** so new settings (especially VRAM allocation) take effect (see "After every flash").

### Verify the checksum before flashing

Step 2 above says to verify the SHA-256 — here is how. Compute the hash of the file you are about to flash and compare it, character for character, against the value listed for that file in [`assets/PROVENANCE.md`](../../assets/PROVENANCE.md).

```bash
# Linux:
sha256sum BC250_3.00_CHIPSETMENU.ROM
```

```powershell
# Windows (PowerShell):
Get-FileHash BC250_3.00_CHIPSETMENU.ROM -Algorithm SHA256
```

`PROVENANCE.md` may list only the **first 16 hex characters** as a short fingerprint. If so, check that your computed hash **starts with** those 16 characters — a full match of that prefix is already a strong check (the maintainer can publish full hashes on request).

> 🔴 **If the checksum does not match, DO NOT flash.** A mismatch means a corrupted or wrong file — flashing it is exactly how you brick the board. Re-download the image and verify again.

---

## Path A — Software flash (from the board, no programmer)

This is the normal way to install/upgrade a BIOS while the board still boots. Use a **FAT32 USB stick** and the AMI firmware update utility.

**EFI / AFU method** ([src](https://t.me/c/2424231195/54979)):

1. Format a USB stick to **FAT32**.
2. Copy the contents of the AFU archive (e.g. `AfuEfi64_5.16.zip`) **and the BIOS file** onto it.
3. Reboot the BC-250 and **boot from the USB stick** into the EFI shell.
4. Run:
   ```
   afuefix64.efi <filename>.<ext> /P /N
   ```
   - `/P` = program the main BIOS.
   - `/N` = also program **NVRAM**. This avoids errors when moving *between* versions (e.g. onto 3.00 from another version) — **but it wipes your saved settings.** You may drop `/N`, but then expect possible errors. ([src](https://t.me/c/2424231195/54979))
5. If the tool can't see the file, try `fs0:`, `fs1:`, … to find which one is the stick ([src](https://t.me/c/2424231195/54979)).

Some community builds ship a ready-made `Flash.nsh` script and a renamed ROM (e.g. rename the modded ROM to match the script) so you only boot to the EFI shell and run the script ([elektricm docs](https://elektricm.github.io/amd-bc250-docs/bios/flashing/)). On Linux there is also an **`afulnx`** build (`afulnx-5.05.04Z.tar.gz`) for flashing from a running system ([src](https://t.me/c/2424231195/54507)).

**flashrom fallback** (if AFU errors out) ([src](https://t.me/c/2424231195/54979), suggested & tested by `@mrartemsid`):

```bash
# Read (back up):
sudo flashrom -p internal:boardmismatch=force -r <name>.bin
# Write:
sudo flashrom -p internal:boardmismatch=force -w <name>.bin
```

> ⚠️ Software flashing only helps **while the board still POSTs**. The moment a bad setting bricks it, Path A is gone and you are on the hardware path below.

---

## Path B — Hardware flash / un-brick (CH341A SPI programmer)

This is the **recovery** path, and the pinned "most convenient way to flash a brick" ([src](https://t.me/c/2424231195/67880)). You re-write the 16 MB SPI chip directly, from another PC, using a USB SPI programmer. Software used: **NeoProgrammer** (Windows) or **flashrom** (Linux).

> 🔴 **The SOIC-8 clip does NOT work on this board.** death is blunt about it: *"the clip on our board works… basically not at all."* ([src](https://t.me/c/2424231195/67880)). Note: `assets/firmware/DISCLAIMER.md` mentions a "SOIC clip" generically — in practice you must **wire to the on-board J4004 header instead.** This is the single most important recovery fact in this chapter.

### J4004 header pinout (wire here)

The board exposes a **2.54 mm pitch J4004 header** specifically for reflashing the SPI/BIOS chip. Pinout (from the pinned wiring screenshot, [src](https://t.me/c/2424231195/67880)):

```
J4004
[ GND  SCLK  MOSI  UNK ]
[ VCC  CS    MISO      ]
   ^  (pin-1 marker)
```

| J4004 pin | Signal | CH341A pad |
|---|---|---|
| VCC | 3.3 V power | VDD / 3.3V |
| GND | ground | GND |
| CS | chip select | CS / SS |
| SCLK | clock | CLK / SCK |
| MOSI | data in (to chip) | MOSI |
| MISO | data out (from chip) | MISO |

The corresponding **W25Q128 SOIC-8 / CH341A color map** is in the same pinned screenshot — match `/CS, DO(MISO), CLK, DI(MOSI), VCC, GND` to the CH341A's `CS, MISO, CLK, MOSI, VDD, GND` pads. **Triple-check VCC and GND** before powering on; reversing them kills the chip ([src](https://t.me/c/2424231195/67880)).

### NeoProgrammer procedure (pinned) ([src](https://t.me/c/2424231195/67880))

1. Connect the programmer to **J4004** with female-to-female wires per the pinout. **Check the wiring ~10×, especially VCC and GND.** (PSU unplugged.)
2. Open **NeoProgrammer**.
3. Run **auto-detect** of the chip, and also read the marking on the chip itself.
4. **Compare markings.** If the last letters differ from the list but the **capacity matches (16 MB)**, that's fine.
5. **Erase** the chip.
6. **Open the BIOS file** in the software (drag-and-drop works).
7. **Write** the chip.
8. **Disconnect the wires from J4004.**
9. Power the board on.

### flashrom equivalent (Linux), cross-checked with community docs

The community flashing guide uses a **CH347** programmer and warns against cheap black-PCB CH341A boards (next section). Identify the right chip — target the **16 MB BIOS chip** (`BIOS_A1`), **never** the 512 KB SuperIO (`SIO1_R`), which bricks the SuperIO if flashed ([elektricm docs](https://elektricm.github.io/amd-bc250-docs/bios/flashing/)):

```bash
# Detect / identify the chip:
sudo flashrom -p ch347_spi

# Back up the stock BIOS (twice, then diff to be sure the read is stable):
sudo flashrom -p ch347_spi -r backup_stock.bin
sudo flashrom -p ch347_spi -r backup_verify.bin

# Write the new image:
sudo flashrom -p ch347_spi -w BC250_3.00_CHIPSETMENU.ROM
```

(Use `-p ch341a_spi` for a CH341A, or `serprog` for a Raspberry Pi Pico, in place of `ch347_spi`.) ⚠ `ch347_spi` / `serprog` mapping for *this* board's exact wiring is from the community guide — `⚠ verify` against your own programmer model.

### The CH341A 3.3 V trap (read this or you'll cook the chip)

Many cheap **black-PCB CH341A** programmers drive their **data lines at 5 V even though VCC is 3.3 V** — the BC-250's BIOS chip is a **3.3 V** part, so 5 V on the data lines can damage it. This is a known, measured fault on some boards (Fabian's board, and an identical one in the chat, were confirmed by voltage measurement) ([src](https://t.me/c/2424231195/100285)). Fixes:

- Prefer a programmer that is genuinely 3.3 V on its data lines (e.g. **CH347**), **or**
- Apply the **solderless CH341A 5V→3.3V data-line fix**: cut the USB 5 V power line to the chip and feed it 3.3 V instead — see [sawyershepherd.org write-up](https://sawyershepherd.org/post/solderless-ch341ab-fix-5v-to-33v-data-lines/) and [wej.k.vu CH341A fix](https://wej.k.vu/electronics/ch341a-mini-programmer-fix/) ([src](https://t.me/c/2424231195/100285)).

---

## The "srep" auto-reset idea (experimental — not a finished feature)

Because a bad setting can brick the board and **CMOS clear doesn't fix it**, death experimented with baking an **`srep`** routine into the BIOS to **auto-reset settings on a brick** — idea originally from `@Jacky_Fish` ([src](https://t.me/c/2424231195/60552)). The concept: have the BIOS patch its NVRAM/`amdsetup` variables back to defaults, optionally only when trigger files are present on a USB stick (so it doesn't wipe your settings every boot). As of the chat, **this did not work yet** — *"the board stubbornly pretends to be a complete brick and nothing resets"* ([src](https://t.me/c/2424231195/60883)). Treat any "self-healing BIOS" claim as **unproven**; your real safety net remains the external programmer. `⚠ verify` before relying on any srep build.

---

## After every flash — clear CMOS (don't skip this)

Flashing the BIOS does **not** reset stored settings, and several settings (notably **VRAM/UMA allocation**) won't actually apply until you clear CMOS. A user hit exactly this: the BIOS showed the new VRAM size and "saved" it, but the OS (Bazzite) still reported the old 4 GB RAM / 12 GB VRAM split until CMOS was cleared ([src](https://t.me/c/2424231195/97290)). How to clear:

- **Remove the CR2032 coin battery for 60+ seconds** (recommended), **or**
- **Short the CMOS jumper for ~20 seconds.** ([elektricm docs](https://elektricm.github.io/amd-bc250-docs/bios/flashing/))

> Note the limit: CMOS clear fixes "settings didn't apply" and *mild* bad configs — but on the 1.0/3.00 mod generation it was reported **not** to recover a true brick ([src](https://t.me/c/2424231195/54971)). For that, see Path B.

---

## Mirrored firmware

BIOS images discussed in the chat are mirrored under `assets/firmware/` for **recovery/preservation** (see [`DISCLAIMER.md`](../../assets/firmware/DISCLAIMER.md) and verify each file's SHA-256 in `PROVENANCE.md` before flashing):

| File | Size | What it is | Source |
|---|---|---|---|
| `BC250_3.00.ROM` | 16 MB | Stock 3.00 dump | ([src](https://t.me/c/2424231195/5215)) |
| `BC250_3.00_CHIPSETMENU.ROM` | 16 MB | Chipset-menu mod (TuxThePenguin0) | ([src](https://t.me/c/2424231195/86395)) |
| `dump_5.00.bin` | 16 MB | Stock 5.00 dump | ([src](https://t.me/c/2424231195/24661)) |
| `BC250_5.00_clv.zip` | 16 MB | **death's 5.00 mod (current)** | ([src](https://t.me/c/2424231195/78922)) |
| `bc250_3.00_clv1.zip` | 16 MB | death's first 3.00 mod (1.0) | ([src](https://t.me/c/2424231195/54971)) |
| `bc250-Steam.rom` | 16 MB | 3.0 mod w/ Steam boot logo | ([src](https://t.me/c/2424231195/86420)) |
| `bc250 modded bios.ROM` | 16 MB | Early modded image | ([src](https://t.me/c/2424231195/30100)) |
| `my_4.0_MODED.bin` | 16 MB | Interim 4.0 mod | ([src](https://t.me/c/2424231195/45580)) |
| `W25Q128BV@WSON8_…BIN` | 16 MB | Raw chip read (W25Q128) | ([src](https://t.me/c/2424231195/5217)) |
| `AfuEfi64_5.16.zip` | — | AMI AFU EFI flasher | ([src](https://t.me/c/2424231195/54979)) |
| `afulnx-5.05.04Z.tar.gz` | — | AMI AFU Linux flasher | ([src](https://t.me/c/2424231195/54507)) |

> Don't flash a PS5 BIOS (`PS5 Disk Edition … BIOS.bin`, 2 MB) or the 512 KB chips onto the BC-250's 16 MB BIOS chip — wrong target, see recovery warnings.

---

## Sources

- death's mod — first release (3.00) — https://t.me/c/2424231195/54971 · current (5.00) — https://t.me/c/2424231195/78922 · Steam-logo build — https://t.me/c/2424231195/86420
- Software flash (AFU `/P /N`, flashrom) — https://t.me/c/2424231195/54979 · afulnx — https://t.me/c/2424231195/54507
- Hardware un-brick (pinned, NeoProgrammer + J4004 wiring screenshots) — https://t.me/c/2424231195/67880
- srep auto-reset idea — https://t.me/c/2424231195/60552 · result (didn't work) — https://t.me/c/2424231195/60883
- CMOS-clear-after-flash needed — https://t.me/c/2424231195/97290
- CH341A 5V→3.3V data-line trap — https://t.me/c/2424231195/100285 · fix write-up — https://sawyershepherd.org/post/solderless-ch341ab-fix-5v-to-33v-data-lines/
- Most-referenced BIOS repo — [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios/) (`BC250_3.00_CHIPSETMENU.ROM`, `CHIPSETMENU.md`)
- Community flashing/recovery guide (SHA-256, J4004 pinout, CH347, CMOS, chip-target warning) — [elektricm amd-bc250-docs](https://elektricm.github.io/amd-bc250-docs/bios/flashing/)
- Memory-timing utility — `Mem_Timing_Utility.zip` https://t.me/c/2424231195/55351
- Firmware mirror policy — [`assets/firmware/DISCLAIMER.md`](../../assets/firmware/DISCLAIMER.md)

> Overclock/undervolt *using* these unlocked settings is covered in [09-overclock-undervolt.md](09-overclock-undervolt.md). Mirrored BIOS images live under `assets/firmware/` with per-file SHA-256 in `PROVENANCE.md`.
