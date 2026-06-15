# WiFi & Bluetooth Dongles

> **TL;DR** — The BC-250 has **no onboard WiFi or Bluetooth**, so you need a USB dongle. The single most reliable choice in the chat is an **aic8800d80**-based stick (e.g. the *AX90BT / D80MU3*), driven by [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) — there's a tested Bazzite RPM recipe. **Realtek RTL88xx** sticks (8821au/cu, 8822bu, 8851bu) are cheap and common but are the chat's #1 headache: they connect, then **randomly drop under load**. [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) (backported driver) fixes most of that for the RTL8821/8822 family; RTL8851BU/8831BU "AX900 WiFi 6" sticks need [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831). If you want a stick that "just works" off the shelf, owners report the **Digma DWA-BT5** series does. Bluetooth shares the 2.4 GHz radio, so expect WiFi throughput to dip while BT is active.

If you only need internet for setup, a **wired USB-Ethernet adapter or the onboard NIC** sidesteps this entire page. Reach for a WiFi/BT dongle when you actually need wireless or a Bluetooth controller.

---

## The one thing to understand first

Almost every "my dongle keeps disconnecting" report on the BC-250 traces to **two things, not the brand on the box**:

1. **The chipset inside.** The label (ASUS, TP-Link, D-Link…) is meaningless — what matters is the Realtek/aic/MediaTek chip under the shell. Three different-brand sticks can carry the exact same chip and fail identically. ([src](https://t.me/c/2424231195/16332))
2. **USB power/stability under load.** Multiple users see a stick run fine while idle/surfing and then **drop the moment traffic spikes** (a big download), "as if the USB can't keep up." One user's ASUS stick lasted all of 17 minutes before dropping on download. ([src](https://t.me/c/2424231195/16331)) · ([src](https://t.me/c/2424231195/17319))

So: **pick by chipset**, match it to a maintained out-of-tree driver, and if it still drops, treat it as a power/reset problem (see [Dropouts](#fixing-random-dropouts) below).

> **How do you find the chipset?** Boxes rarely print it. Before buying, look up the stick's **FCC ID** (printed on the device/listing) online — the filing reveals the real chip. After you have it plugged in, run **`lsusb`** on Linux to see the vendor/product IDs and chipset.

---

## Known-good dongles

Cross-checked against the driver repos. "Notes" reflect what chat members actually observed on the BC-250.

| Chipset | Example sticks (from chat) | Driver repo | Notes |
|---|---|---|---|
| **aic8800d80** (aic8800) | AX90BT / D80MU3 ("AIC device wlan") | [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) | **Most recommended.** Tested Bazzite RPM recipe; WiFi+BT. Shows up as a USB-CDROM first, then flips to `aic device wlan` after `install_setup.sh`. ([src](https://t.me/c/2424231195/120502)) |
| **RTL8821CU / 8821AU** | generic Realtek "свисток" | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Works, but **prone to random drops** on old in-kernel driver. lwfinger backport is stable for most; proper fix landed in kernel 6.13–6.14. ([src](https://t.me/c/2424231195/17321)) |
| **RTL8822BU** | unnamed dual-band stick | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | One owner: connects, then **drops every 5–10 min**. Supported by rtw88 USB list but reliability on BC-250 is hit-or-miss. ([src](https://t.me/c/2424231195/138512)) |
| **RTL8851BU / 8831BU** | "$5 AX900 WiFi 6 + BT 5.3" | [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) | **Did not work out of the box** — WiFi 6 chip too new for rtw88. Needs the dedicated `8851bu` driver. ([src](https://t.me/c/2424231195/17320)) |
| **Digma DWA-BT5-AC600C / AC1300E** | Digma USB WiFi+BT | in-kernel (Realtek) | Reported **working out of the box** ("started on the first try"); a BC-250 owner confirmed in the product reviews. ([src](https://t.me/c/2424231195/138520)) |

> **Reported NOT working / painful:** generic **RTL8851BU "AX900"** out of the box ([src](https://t.me/c/2424231195/17320)); bare **RTL8821cu/8821au** on stock kernel drivers drop randomly ([src](https://t.me/c/2424231195/16330)); a no-name **RTL8822BU** drops every few minutes ([src](https://t.me/c/2424231195/138512)). One user gave up entirely and ordered an **Edimax EW-7733UnD** instead. ([src](https://t.me/c/2424231195/120503))

---

## Path A — aic8800d80 (recommended)

This is the chip with the cleanest BC-250 story. There's a full Bazzite RPM recipe and a community-written mini-guide.

### Bazzite (rpm-ostree) — RPM build

The maintainer's [`bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) builds a proper RPM so the driver survives image updates better than a raw `make`. Verified against the repo:

```bash
# 1. Build deps (then reboot so the overlay is active)
sudo rpm-ostree install rpm-build rpmdevtools dkms
sudo systemctl reboot

# 2. Set up the rpmbuild tree and grab the spec
cd "$HOME"
rpmdev-setuptree
cd "$HOME/rpmbuild/SPECS"
curl -LO -s https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec

# 3. Fetch sources and build
spectool -g -R "$HOME/rpmbuild/SPECS/aic8800d80.spec"
rpmbuild -bs "$HOME/rpmbuild/SPECS/aic8800d80.spec"
sudo rpm-ostree usroverlay
rpmbuild --define "uname $(uname -r)" -bb "$HOME/rpmbuild/SPECS/aic8800d80.spec"

# 4. Install the built RPM and reboot (filename will match your kernel/fedora ver)
sudo rpm-ostree install "$HOME"/rpmbuild/RPMS/x86_64/aic8800d80-*.rpm
sudo systemctl reboot
```

A chat member ([Nurmukhamed](https://github.com/Nurmukhamed/aic8800d80/tree/15a927286788af46529909bc2c14d16ea4241ec0/bazzite)) wrote an RPM-packaging walkthrough that the community thanked him for. ([src](https://t.me/c/2424231195/122580))

### Community mini-guide (the quick "make" path)

If you just want it up *now* and don't mind re-running it after reboots, Aqtilek's guide ([src](https://t.me/c/2424231195/120502)):

```bash
# The stick first appears as a fake CD-ROM. Flip it to WiFi mode (ONE TIME):
sudo sh install_setup.sh         # now shows as "aic device wlan"

# Temporarily lift the read-only root (Bazzite/atomic):
sudo rpm-ostree usroverlay

# Clone and build the driver (use the repo's "method 2"):
git clone https://github.com/shenmintao/aic8800d80.git && cd aic8800d80
# …then follow the repo's second install method.
```

> ⚠ **Reboot persistence:** with the raw `make` path, **the driver is lost on every reboot** and must be reinstalled — the author suggests a small autostart script. ([src](https://t.me/c/2424231195/120502)) The RPM path above is the durable fix.

The firmware/driver archive a member used (*AX90BT(D80MU3)*) was shared in-chat. ([src](https://t.me/c/2424231195/119991)) An alternate upstream, [`goecho/aic8800_linux_drvier`](https://github.com/goecho/aic8800_linux_drvier), exists but one CachyOS user spent 6 h and couldn't get it to compile — prefer `shenmintao` on the BC-250. ([src](https://t.me/c/2424231195/82100)) ⚠ verify on your distro.

---

## Path B — Realtek RTL8821 / RTL8822 (rtw88)

Cheap and everywhere, but the in-kernel driver on older kernels is **buggy and drops randomly**. The fix is the backported out-of-tree driver from `lwfinger/rtw88`. The exact commands a member used and confirmed stable ([src](https://t.me/c/2424231195/16326)):

```bash
git clone https://github.com/lwfinger/rtw88
cd rtw88
make
sudo make install
sudo make install_fw
```

On a Secure-Boot / DKMS setup the repo also documents a `sudo dkms install $PWD` + `mokutil` flow — see the [repo README](https://github.com/lwfinger/rtw88).

**Why this helps:** the dropouts are a known driver bug; the proper fix only reached mainline in **kernel 6.13–6.14**, and many distro images still shipped the broken version. The lwfinger backport gives you the fixed driver now. ([src](https://t.me/c/2424231195/17321)) Supported USB parts include RTL8811AU/CU, RTL8812AU/BU/CU, RTL8814AU, RTL8821AU/CU and RTL8822BU/CU (full list in the repo).

> Honest caveat: even with rtw88, one user on RTL8821cu still saw occasional drops ("same hat"), and throughput drops somewhat vs the broken-but-faster stock driver. ([src](https://t.me/c/2424231195/16333)) If reliability matters more than price, go aic8800d80 or a confirmed Digma.

---

## Path C — Realtek RTL8851BU / RTL8831BU ("AX900 WiFi 6")

The very cheap "AX900 WiFi 6 + Bluetooth 5.3" sticks use **RTL8851BU/8831BU**, which `rtw88` does **not** cover, so they're dead out of the box. ([src](https://t.me/c/2424231195/17320)) Use the dedicated driver [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831):

```bash
git clone https://github.com/biglinux/rtl8831
cd rtl8831
sudo dkms install .        # or: make && sudo make install
sudo modprobe 8851bu
```

⚠ verify — this repo wasn't shown being built in-chat on a BC-250; commands are from the repo README.

---

## Fixing random dropouts

If your stick connects and then drops (the classic Realtek-on-BC-250 symptom):

1. **Install the right out-of-tree driver** (Path B/C) — this resolves the majority of cases.
2. **Re-seat / re-plug after boot.** Some sticks aren't detected on cold boot and need one unplug-replug. ([src](https://t.me/c/2424231195/16325))
3. **Reset the device in software instead of unplugging** — use `usbreset` (no need to physically pull it). ([src](https://t.me/c/2424231195/135895)) · [how-to (Superuser)](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
4. **Try a different USB port** (ideally a rear/root-hub port) — the symptom looks power/bandwidth-related under load. ([src](https://t.me/c/2424231195/17319))

---

## Bluetooth notes

- WiFi+BT combo sticks share the **2.4 GHz** radio, so **WiFi throughput drops while Bluetooth is active**. One member measured **~150 Mbit with BT on vs ~190 Mbit with it off** — real, but "not that dramatic." ([src](https://t.me/c/2424231195/123366)) · ([src](https://t.me/c/2424231195/123367))
- The aic8800d80 driver has a **separate `bluetooth` branch** for BT support. ([repo branch](https://github.com/shenmintao/aic8800d80/tree/bluetooth?tab=readme-ov-file))

---

## Buying shortlist

If you want the lowest-risk path, in order:

1. **aic8800d80 stick** (AX90BT / D80MU3 class) + the Bazzite RPM recipe — best-documented, WiFi+BT.
2. **Digma DWA-BT5-AC600C / AC1300E** — reported to work out of the box. ([Ozon listing](https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/))
3. **RTL8821CU stick + lwfinger/rtw88** — cheapest, accept occasional drops.
4. Avoid bottom-dollar **RTL8851BU "AX900"** unless you're willing to fight `biglinux/rtl8831`.

> Don't trust an AI chatbot's "yeah bro, perfect choice" on a dongle — a member did exactly that, got an RTL8822BU that drops every 5–10 min, and the same bot then said it wouldn't work. Buy by chipset, verified here. ([src](https://t.me/c/2424231195/138512))

---

## Sources

- aic8800d80 Bazzite RPM — [`shenmintao/aic8800d80` `bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) · spec — https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec
- aic8800d80 mini-guide — https://t.me/c/2424231195/120502 · RPM fork — https://t.me/c/2424231195/122580 · firmware zip — https://t.me/c/2424231195/119991
- aic8800 BT branch — https://github.com/shenmintao/aic8800d80/tree/bluetooth · alt repo — https://github.com/goecho/aic8800_linux_drvier (https://t.me/c/2424231195/82100)
- rtw88 build steps — https://t.me/c/2424231195/16326 · backport rationale — https://t.me/c/2424231195/17321 · driver — [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88)
- RTL8851BU AX900 not working — https://t.me/c/2424231195/17320 · driver — [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831)
- Dropout symptom / by-chip-not-brand — https://t.me/c/2424231195/16330 · https://t.me/c/2424231195/16331 · https://t.me/c/2424231195/16332 · https://t.me/c/2424231195/17319
- Digma works OOB — https://t.me/c/2424231195/138520 · listing — https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/
- AI-recommended RTL8822BU drops — https://t.me/c/2424231195/138512 · Edimax escape — https://t.me/c/2424231195/120503
- BT vs WiFi speed — https://t.me/c/2424231195/123366 · usbreset — https://t.me/c/2424231195/135895 · [Superuser how-to](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
