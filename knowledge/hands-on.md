---
type: Reference
title: BC-250 — Hands-on findings
description: First-party findings measured on a working BC-250 build, with the exact evidence each claim rests on. Not sourced from chat.
tags: [bc250, hands-on, wifi-bt, usb, linux, gaming]
timestamp: 2026-08-18T00:00:00Z
---

# Hands-on findings

_Measured on one BC-250 build (CachyOS, kernel 7.1.8, gamescope session, AIC8800D80 USB dongle). Every entry states the observation it rests on. Unlike the chat-derived files, these have no message to cite — the evidence is the command output quoted under each item. Single-board results: treat as reproducible method, not as a population statistic._

## Bluetooth is invisible to Steam when the adapter appears after Steam starts

- `bluetooth.service` is skipped entirely at boot when no adapter exists yet — systemd reports `Bluetooth service skipped, unmet condition check ConditionPathIsDirectory=/sys/class/bluetooth`, and does not retry on its own.
  - evidence: three consecutive skips at 22:34:29–22:34:30, service finally started at 22:36:00 once the dongle finished initialising.
- Steam in Gamepad UI (`-gamepadui -steamdeck`) enumerates Bluetooth at startup and does not pick up an adapter that appears later: its Bluetooth panel stays empty for the whole session even though `bluetoothctl scan on` finds devices normally from a shell.
  - evidence: Steam started 22:34:25, `bluetoothd` started 22:35:59 — 94 s later; panel empty, while a CLI scan returned 16 devices including headphones, a projector and a TV.
- Symptom that identifies this exact fault: devices appear in the Steam panel only while an external `bluetoothctl scan on` is running, then vanish about 30 s after it ends (BlueZ drops uncached devices).
- Fix: guarantee the dongle is enumerated before the session starts. With the USB hub already powered at boot, the order becomes correct — dongle at 1.6 s, firmware loaded at 10.7 s, `bluetooth.service` at 13.8 s, Steam 2 s later.
- Root cause in this build was **hub power timing, not the dongle**: an externally-powered USB hub carrying both the dongle and the gamepad receiver enumerated only at 102 s on one boot (hub at 1.5 s on the next), pushing Bluetooth past Steam's startup.
  - evidence: `usb 6-1: Product: USB2.1 Hub` at monotonic 102.4 s on one boot vs 1.49 s on another.

## AIC8800D80 dongle (a69c:8d80 / 368b:8d81)

- The chip enumerates first as USB Mass Storage (`a69c:5721`, "Aic MSC", a small fake flash holding the Windows installer) and switches to `a69c:8d80` "AIC Wlan" only after the storage device is ejected; `aic_load_fw` then uploads firmware and `aic8800_fdrv` creates `wlan0`.
- The mode switch is driven by a packaged udev rule, not by hand: `/usr/lib/udev/rules.d/aic.rules` matches `idVendor=a69c` with the storage product IDs and runs `/usr/bin/eject`.
- Switch time measured 3–9 s from enumeration to `AIC Wlan` when the rule fires normally.
- Firmware loads from `/lib/firmware/aic8800D80/` (`fw_patch_table_8800d80_u02.bin`, `fmacfw_8800d80_u02.bin` and companions); the build string reported by the driver was `la Dec 05 2025 - g586bc1e8`.
- Bluetooth on this dongle needs **no vendor driver**: it is a separate USB function (`368b:8d81`) served by the in-tree `btusb`. Installing a "wifi-bt" driver variant is unnecessary.
- Wi-Fi and Bluetooth share one USB path; both were functional simultaneously.

## Wi-Fi association fails on WPA2/WPA3-mixed 5 GHz networks

- Connecting to a WPA2/WPA3-mixed 5 GHz AP fails **before** any password check, with `CTRL-EVENT-ASSOC-REJECT bssid=00:00:00:00:00:00 status_code=53`, followed by `CTRL-EVENT-SSID-TEMP-DISABLED ... reason=CONN_FAILED`.
- NetworkManager surfaces this as a misleading "secrets were required, but not provided" error, which sends you hunting a password problem that does not exist.
- Fix: disable protected management frames for that profile — `nmcli connection modify <name> wifi-sec.pmf 1` — after which association succeeds immediately. The setting is stored in the profile and survives reconnects, but is lost if the profile is deleted and recreated from the desktop applet.
  - evidence: same credentials, same AP; the interface got a DHCP lease immediately after the change.
- A 2.4 GHz WPA2-only SSID on the same router associated without the workaround.

## Gaming

- GTA IV (and the Vice City Nextgen Edition mod built on patch 1.0.7.0) caps at 52–55 FPS with in-game VSync enabled regardless of headroom — a known engine defect, not a BC-250 limit. Disabling in-game VSync removes the cap.
  - evidence: reported 54 FPS lock with both CPU and GPU far from saturated; cap disappeared when VSync was turned off. The compositor itself was outputting 60.0 FPS.
- With VSync off, GTA IV's frame rate is unbounded on loading screens, and the engine ties physics to frame rate (bikes misbehave above ~80 FPS). A limiter is advisable even though the cap itself is a bug.
- Measured during the same session: the game's main thread ran at ~152 % CPU while the GPU sat near 40 % at 2000 MHz — this title is draw-call bound on this hardware, so CPU-side settings (view distance, vehicle density, night shadows) move the frame rate more than texture settings do.

# Citations

_None: every item above is a first-party observation. The evidence lines quote the command output or log entry it came from._
