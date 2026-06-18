> 🌐 Community-Übersetzung. Die englische Version ist die maßgebliche Quelle und kann aktueller sein. Fehler gefunden? Öffne ein [Issue](https://github.com/lildebil0/awesome-bc250/issues). ([englisches Original](../en/10-wifi-bt.md))

# WiFi- & Bluetooth-Dongles

> **TL;DR** — Die BC-250 hat **kein WiFi und kein Bluetooth onboard**, du brauchst also einen USB-Dongle. Die mit Abstand zuverlässigste Wahl im Chat ist ein Stick auf **aic8800d80**-Basis (z. B. der *AX90BT / D80MU3*), angesteuert von [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) — es gibt ein getestetes Bazzite-RPM-Rezept. **Realtek-RTL88xx**-Sticks (8821au/cu, 8822bu, 8851bu) sind billig und verbreitet, aber das Sorgenkind Nr. 1 im Chat: Sie verbinden sich, dann **brechen sie unter Last zufällig weg**. [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) (rückportierter Treiber) behebt das Meiste davon für die RTL8821/8822-Familie; RTL8851BU/8831BU-„AX900 WiFi 6"-Sticks brauchen [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831). Wenn du einen Stick willst, der „einfach funktioniert", berichten Besitzer, dass die **Digma-DWA-BT5**-Serie das tut. Bluetooth teilt sich das 2,4-GHz-Funkmodul, erwarte also, dass der WiFi-Durchsatz einbricht, während BT aktiv ist.

Wenn du nur für die Einrichtung Internet brauchst, umgeht ein **kabelgebundener USB-Ethernet-Adapter oder der Onboard-NIC** diese ganze Seite. Greif zum WiFi/BT-Dongle, wenn du tatsächlich Funk oder einen Bluetooth-Controller brauchst.

> **Zum Onboard-Realtek-RTL8111-Ethernet:** Es ist der Weg des geringsten Widerstands, aber die RTL8111/8168-Familie ist **wackelig bis unzuverlässig unter Linux** — vom Standard-`r8169`-Treiber wird breit berichtet, dass er zufällige Link-up/down-Wechsel, Aussetzer unter Bandbreite und manchmal einen Abfall auf 100 Mbit verursacht. Der Wechsel zum out-of-tree-`r8168`-Modul ist die übliche Abhilfe. Wenn der Onboard-Port Ärger macht, **bevorzuge einen Intel- oder MediaTek-USB/PCIe-NIC** — deren Linux-Treiber sind weit verlässlicher. ([Intel/MediaTek vs. Realtek ist eine altbekannte Linux-Zuverlässigkeitslücke](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)) ⚠ Die RTL8111-Wackeligkeit ist ein allgemeines Linux-Muster, nicht BC-250-spezifisch — überprüfe es an deinem Board.

---

## Das Eine, das du zuerst verstehen musst

Fast jeder „mein Dongle trennt sich ständig"-Bericht auf der BC-250 lässt sich auf **zwei Dinge** zurückführen, nicht auf die Marke auf der Schachtel:

1. **Der Chipsatz im Inneren.** Das Label (ASUS, TP-Link, D-Link …) ist bedeutungslos — was zählt, ist der Realtek/aic/MediaTek-Chip unter der Hülle. Drei Sticks verschiedener Marken können exakt denselben Chip tragen und identisch versagen. ([src](https://t.me/c/2424231195/16332))
2. **USB-Stromversorgung/Stabilität unter Last.** Mehrere Nutzer sehen einen Stick im Leerlauf/beim Surfen problemlos laufen und dann **in dem Moment abbrechen, in dem der Datenverkehr hochschnellt** (ein großer Download), „als ob der USB nicht mithalten kann". Der ASUS-Stick eines Nutzers hielt gerade mal 17 Minuten durch, bevor er beim Download abbrach. ([src](https://t.me/c/2424231195/16331)) · ([src](https://t.me/c/2424231195/17319))

Also: **nach Chipsatz auswählen**, ihn mit einem gepflegten out-of-tree-Treiber kombinieren, und wenn er immer noch abbricht, als Strom-/Reset-Problem behandeln (siehe [Aussetzer](#zufällige-aussetzer-beheben) unten).

> **Wie findest du den Chipsatz?** Schachteln drucken ihn selten auf. Schlag vor dem Kauf die **FCC-ID** des Sticks (auf dem Gerät/in der Anzeige aufgedruckt) online nach — die Eingabe verrät den echten Chip. Nachdem du ihn eingesteckt hast, führe unter Linux **`lsusb`** aus, um die Vendor-/Produkt-IDs und den Chipsatz zu sehen.

---

## Bekanntermaßen funktionierende Dongles

Gegen die Treiber-Repos abgeglichen. „Anmerkungen" spiegeln wider, was Chat-Mitglieder tatsächlich auf der BC-250 beobachtet haben.

| Chipsatz | Beispiel-Sticks (aus dem Chat) | Treiber-Repo | Anmerkungen |
|---|---|---|---|
| **aic8800d80** (aic8800) | AX90BT / D80MU3 („AIC device wlan") | [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) | **Am meisten empfohlen.** Getestetes Bazzite-RPM-Rezept; WiFi+BT. Erscheint zuerst als USB-CDROM, wechselt dann nach `aic device wlan` nach `install_setup.sh`. ([src](https://t.me/c/2424231195/120502)) |
| **RTL8821CU / 8821AU** | generischer Realtek-„свисток" | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Funktioniert, aber **anfällig für zufällige Abbrüche** mit dem alten In-Kernel-Treiber. Der lwfinger-Backport ist für die meisten stabil; der eigentliche Fix kam in Kernel 6.13–6.14. ([src](https://t.me/c/2424231195/17321)) |
| **RTL8822BU** | unbenannter Dual-Band-Stick | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Ein Besitzer: verbindet sich, dann **bricht alle 5–10 min ab**. Von der rtw88-USB-Liste unterstützt, aber die Zuverlässigkeit auf der BC-250 ist Glückssache. ([src](https://t.me/c/2424231195/138512)) |
| **RTL8851BU / 8831BU** | „5-$-AX900 WiFi 6 + BT 5.3" | [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) | **Funktionierte nicht out of the box** — WiFi-6-Chip zu neu für rtw88. Braucht den dedizierten `8851bu`-Treiber. ([src](https://t.me/c/2424231195/17320)) |
| **Digma DWA-BT5-AC600C / AC1300E** | Digma USB WiFi+BT | In-Kernel (Realtek) | Berichtet als **funktioniert out of the box** („lief beim ersten Versuch"); ein BC-250-Besitzer bestätigte es in den Produktrezensionen. ([src](https://t.me/c/2424231195/138520)) |

> **Berichtet als NICHT funktionierend / schmerzhaft:** generischer **RTL8851BU „AX900"** out of the box ([src](https://t.me/c/2424231195/17320)); blanker **RTL8821cu/8821au** mit Standard-Kernel-Treibern bricht zufällig ab ([src](https://t.me/c/2424231195/16330)); ein No-Name-**RTL8822BU** bricht alle paar Minuten ab ([src](https://t.me/c/2424231195/138512)). Ein Nutzer gab ganz auf und bestellte stattdessen einen **Edimax EW-7733UnD**. ([src](https://t.me/c/2424231195/120503))

---

## Pfad A — aic8800d80 (empfohlen)

Das ist der Chip mit der saubersten BC-250-Geschichte. Es gibt ein vollständiges Bazzite-RPM-Rezept und einen community-geschriebenen Mini-Guide.

### Bazzite (rpm-ostree) — RPM-Build

Das [`bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) des Maintainers baut ein ordentliches RPM, sodass der Treiber Image-Updates besser übersteht als ein rohes `make`. Gegen das Repo verifiziert:

```bash
# 1. Build-Abhängigkeiten (dann neu starten, damit das Overlay aktiv ist)
sudo rpm-ostree install rpm-build rpmdevtools dkms
sudo systemctl reboot

# 2. Den rpmbuild-Baum einrichten und die Spec holen
cd "$HOME"
rpmdev-setuptree
cd "$HOME/rpmbuild/SPECS"
curl -LO -s https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec

# 3. Quellen holen und bauen
spectool -g -R "$HOME/rpmbuild/SPECS/aic8800d80.spec"
rpmbuild -bs "$HOME/rpmbuild/SPECS/aic8800d80.spec"
sudo rpm-ostree usroverlay
rpmbuild --define "uname $(uname -r)" -bb "$HOME/rpmbuild/SPECS/aic8800d80.spec"

# 4. Das gebaute RPM installieren und neu starten (Dateiname passt zu deiner Kernel-/Fedora-Version)
sudo rpm-ostree install "$HOME"/rpmbuild/RPMS/x86_64/aic8800d80-*.rpm
sudo systemctl reboot
```

Ein Chat-Mitglied ([Nurmukhamed](https://github.com/Nurmukhamed/aic8800d80/tree/15a927286788af46529909bc2c14d16ea4241ec0/bazzite)) schrieb eine RPM-Packaging-Anleitung, für die ihm die Community dankte. ([src](https://t.me/c/2424231195/122580))

### Community-Mini-Guide (der schnelle „make"-Pfad)

Wenn du es einfach *jetzt* zum Laufen bringen willst und nichts dagegen hast, es nach Reboots erneut auszuführen, Aqtileks Guide ([src](https://t.me/c/2424231195/120502)):

```bash
# Der Stick erscheint zuerst als gefälschtes CD-ROM. Schalte ihn in den WiFi-Modus (EINMALIG):
sudo sh install_setup.sh         # erscheint jetzt als "aic device wlan"

# Vorübergehend den read-only-Root anheben (Bazzite/atomic):
sudo rpm-ostree usroverlay

# Den Treiber klonen und bauen (die "Methode 2" des Repos verwenden):
git clone https://github.com/shenmintao/aic8800d80.git && cd aic8800d80
# …dann der zweiten Installationsmethode des Repos folgen.
```

> ⚠ **Reboot-Persistenz:** Mit dem rohen `make`-Pfad geht **der Treiber bei jedem Reboot verloren** und muss neu installiert werden — der Autor schlägt ein kleines Autostart-Skript vor. ([src](https://t.me/c/2424231195/120502)) Der RPM-Pfad oben ist der dauerhafte Fix.

Das Firmware-/Treiber-Archiv, das ein Mitglied verwendete (*AX90BT(D80MU3)*), wurde im Chat geteilt. ([src](https://t.me/c/2424231195/119991)) Eine alternative Upstream-Quelle, [`goecho/aic8800_linux_drvier`](https://github.com/goecho/aic8800_linux_drvier), existiert, aber ein CachyOS-Nutzer verbrachte 6 h und bekam sie nicht zum Kompilieren — bevorzuge `shenmintao` auf der BC-250. ([src](https://t.me/c/2424231195/82100)) ⚠ Überprüfe es auf deiner Distro.

> **aic8800d80 Fallstricke (aus dem Issue-Tracker des Treibers):**
> - Die Firmware `fmacfw_8800d80_u02.bin` muss sich in `/lib/firmware/aic8800D80/` befinden; ein fehlgeschlagener Firmware-Upload führt dazu, dass die Schnittstelle im Zustand `DOWN` verharrt. ([aic8800d80 #37](https://github.com/shenmintao/aic8800d80/issues/37) · [#10](https://github.com/shenmintao/aic8800d80/issues/10))
> - **Kernel 7.0 / 7.1:** Der 1.0.0-Treiber lässt sich unter DKMS nicht kompilieren – die Signaturen von `cfg80211_new_sta` / `cfg80211_del_sta` haben sich geändert und ein `-Wimplicit-fallthrough`-Fehler bricht den Build ab. Bleiben Sie bei einem älteren Kernel oder patchen Sie den Quellcode, bis Upstream nachzieht. ([aic8800d80 #49](https://github.com/shenmintao/aic8800d80/issues/49))
> - **Debian 13 (kernel 6.12.90):** Die WLAN-Schnittstelle startet möglicherweise nicht oder erkennt keine Netzwerke. ([aic8800d80 #58](https://github.com/shenmintao/aic8800d80/issues/58))

---

## Pfad B — Realtek RTL8821 / RTL8822 (rtw88)

Billig und überall, aber der In-Kernel-Treiber auf älteren Kerneln ist **fehlerhaft und bricht zufällig ab**. Der Fix ist der rückportierte out-of-tree-Treiber von `lwfinger/rtw88`. Die exakten Befehle, die ein Mitglied verwendete und als stabil bestätigte ([src](https://t.me/c/2424231195/16326)):

```bash
git clone https://github.com/lwfinger/rtw88
cd rtw88
make
sudo make install
sudo make install_fw
```

Bei einem Secure-Boot-/DKMS-Setup dokumentiert das Repo auch einen `sudo dkms install $PWD` + `mokutil`-Ablauf — siehe das [Repo-README](https://github.com/lwfinger/rtw88).

**Warum das hilft:** Die Aussetzer sind ein bekannter Treiber-Bug; der eigentliche Fix erreichte den Mainline erst in **Kernel 6.13–6.14**, und viele Distro-Images lieferten noch die kaputte Version aus. Der lwfinger-Backport gibt dir den gefixten Treiber jetzt. ([src](https://t.me/c/2424231195/17321)) Zu den unterstützten USB-Teilen zählen RTL8811AU/CU, RTL8812AU/BU/CU, RTL8814AU, RTL8821AU/CU und RTL8822BU/CU (vollständige Liste im Repo).

> Ehrliche Einschränkung: Selbst mit rtw88 sah ein Nutzer auf RTL8821cu noch gelegentliche Abbrüche („gleicher Hut"), und der Durchsatz fällt gegenüber dem kaputt-aber-schnelleren Standardtreiber etwas ab. ([src](https://t.me/c/2424231195/16333)) Wenn dir Zuverlässigkeit wichtiger ist als der Preis, nimm aic8800d80 oder ein bestätigtes Digma.

---

## Pfad C — Realtek RTL8851BU / RTL8831BU („AX900 WiFi 6")

Die sehr billigen „AX900 WiFi 6 + Bluetooth 5.3"-Sticks verwenden **RTL8851BU/8831BU**, die `rtw88` **nicht** abdeckt, also sind sie out of the box tot. ([src](https://t.me/c/2424231195/17320)) Verwende den dedizierten Treiber [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831):

```bash
git clone https://github.com/biglinux/rtl8831
cd rtl8831
sudo dkms install .        # oder: make && sudo make install
sudo modprobe 8851bu
```

⚠ Überprüfe — dieses Repo wurde nicht im Chat auf einer BC-250 beim Bauen gezeigt; die Befehle stammen aus dem Repo-README.

> **Ein benanntes Beispiel dieser Klasse — TP-Link Archer TX10UB Nano („AX900 WiFi 6 + BT 5.3").** Das ist ein echtes, leicht zu findendes Produkt, und sein **WiFi funktioniert unter Linux** — es trägt einen **RTL8851BU**-Chip, fällt also unter Pfad C (du brauchst den `8851bu`/`biglinux/rtl8831`-Treiber, nicht Standard-rtw88). **Aber sein Bluetooth ist unter Linux *nicht* herstellerseitig unterstützt:** TP-Links eigene Spezifikation listet den Adapter als nur Windows 10/11 und sagt ausdrücklich, dass die **Bluetooth-Funktion nicht mit Mac, Linux oder TV kompatibel ist** ([TP-Link-Produktseite](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)). Behandle ihn also als **„WiFi funktioniert unter Linux (über den 8851bu-Treiber); BT ist unter Linux nicht herstellerseitig unterstützt."** Die Community bekommt sein BT möglicherweise über generische Realtek-BT-Treiber zum Laufen, aber das ist unbestätigt — **kauf ihn nicht in der Erwartung eines sauberen Plug-and-Play-WiFi+BT-Linux-Dongles.** **UGreen** verkauft ebenfalls einen „AX900"-Stick, der community-seitig als Alternative gemeldet wird, aber es ist dieselbe RTL8851BU-Familie — überprüfe den Chipsatz, und dieselbe BT-Einschränkung gilt. ⚠ Überprüfen.

---

## Zufällige Aussetzer beheben

Wenn sich dein Stick verbindet und dann abbricht (das klassische Realtek-auf-BC-250-Symptom):

1. **Installiere den richtigen out-of-tree-Treiber** (Pfad B/C) — das löst die Mehrheit der Fälle.
2. **Nach dem Boot neu einstecken / abziehen und wieder anstecken.** Manche Sticks werden beim Kaltstart nicht erkannt und brauchen ein Aus-/Wieder-Einstecken. ([src](https://t.me/c/2424231195/16325))
3. **Das Gerät per Software zurücksetzen statt es abzuziehen** — verwende `usbreset` (kein physisches Abziehen nötig). ([src](https://t.me/c/2424231195/135895)) · [Anleitung (Superuser)](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
4. **Probiere einen anderen USB-Port** (idealerweise einen hinteren/Root-Hub-Port) — das Symptom wirkt strom-/bandbreitenbedingt unter Last. ([src](https://t.me/c/2424231195/17319))
5. **Halte den Dongle von USB 3.0 fern.** USB-3.0-Ports sind eine dokumentierte Quelle von **2,4-GHz-HF-Interferenz** — die Hochgeschwindigkeits-Signalisierung fügt über 2,4–2,5 GHz hinweg ~20 dB Breitbandrauschen hinzu, das kein Filter entfernen kann, und degradiert WiFi *und* Bluetooth genau dort, wo sie leben. Intels Whitepaper ist die kanonische Referenz. Steck WiFi/BT-Dongles in einen **USB-2.0-Port**, oder nutze ein **kurzes USB-Verlängerungskabel**, um den Dongle ein paar Zentimeter von den USB-3.0-Anschlüssen und jeglicher DisplayPort/HDMI-Verkabelung wegzubewegen. ([Intel: USB 3.0 RF Interference Impact on 2.4 GHz Wireless Devices](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf))

---

## Bluetooth-Hinweise

- WiFi+BT-Kombi-Sticks teilen sich das **2,4-GHz**-Funkmodul, also **fällt der WiFi-Durchsatz, während Bluetooth aktiv ist**. Ein Mitglied maß **~150 Mbit mit BT an vs. ~190 Mbit mit BT aus** — real, aber „nicht so dramatisch". ([src](https://t.me/c/2424231195/123366)) · ([src](https://t.me/c/2424231195/123367))
- Der aic8800d80-Treiber hat einen **separaten `bluetooth`-Branch** für BT-Unterstützung. ([Repo-Branch](https://github.com/shenmintao/aic8800d80/tree/bluetooth?tab=readme-ov-file))

- **Wenn Bluetooth nie angezeigt wird, hat der generische `btusb`-Treiber das Gerät zuerst beansprucht.** Der aic8800-BT-Controller benötigt sein eigenes `aic_btusb`-Modul – der im Kernel integrierte `btusb`-Treiber kann ihn nicht initialisieren. Tauschen Sie sie mit `sudo rmmod btusb && sudo modprobe aic_btusb` aus oder machen Sie die Änderung dauerhaft, indem Sie `softdep btusb pre: aic_btusb` zu `/etc/modprobe.d/aic8800-bt.conf` hinzufügen. ([aic8800d80 #53](https://github.com/shenmintao/aic8800d80/issues/53) · [#44](https://github.com/shenmintao/aic8800d80/issues/44))

---

## Einkaufs-Shortlist

Wenn du den risikoärmsten Pfad willst, in dieser Reihenfolge:

1. **aic8800d80-Stick** (Klasse AX90BT / D80MU3) + das Bazzite-RPM-Rezept — am besten dokumentiert, WiFi+BT.
2. **Digma DWA-BT5-AC600C / AC1300E** — berichtet als out-of-the-box funktionierend. ([Ozon-Anzeige](https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/))
3. **RTL8821CU-Stick + lwfinger/rtw88** — am billigsten, gelegentliche Abbrüche in Kauf nehmen.
4. Meide den billigsten **RTL8851BU „AX900"**, es sei denn, du bist bereit, dich mit `biglinux/rtl8831` herumzuschlagen.

> Vertrau nicht dem „ja Bruder, perfekte Wahl" eines KI-Chatbots bei einem Dongle — ein Mitglied tat genau das, bekam einen RTL8822BU, der alle 5–10 min abbricht, und derselbe Bot sagte dann, er würde nicht funktionieren. Kauf nach Chipsatz, hier verifiziert. ([src](https://t.me/c/2424231195/138512))

---

## Quellen

- aic8800d80 Bazzite-RPM — [`shenmintao/aic8800d80` `bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) · spec — https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec
- aic8800d80-Mini-Guide — https://t.me/c/2424231195/120502 · RPM-Fork — https://t.me/c/2424231195/122580 · Firmware-Zip — https://t.me/c/2424231195/119991
- aic8800-BT-Branch — https://github.com/shenmintao/aic8800d80/tree/bluetooth · Alt-Repo — https://github.com/goecho/aic8800_linux_drvier (https://t.me/c/2424231195/82100)
- rtw88-Build-Schritte — https://t.me/c/2424231195/16326 · Backport-Begründung — https://t.me/c/2424231195/17321 · Treiber — [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88)
- RTL8851BU AX900 funktioniert nicht — https://t.me/c/2424231195/17320 · Treiber — [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831)
- Aussetzer-Symptom / nach-Chip-nicht-Marke — https://t.me/c/2424231195/16330 · https://t.me/c/2424231195/16331 · https://t.me/c/2424231195/16332 · https://t.me/c/2424231195/17319
- Digma funktioniert OOB — https://t.me/c/2424231195/138520 · Anzeige — https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/
- KI-empfohlener RTL8822BU bricht ab — https://t.me/c/2424231195/138512 · Edimax-Ausweg — https://t.me/c/2424231195/120503
- BT vs. WiFi-Geschwindigkeit — https://t.me/c/2424231195/123366 · usbreset — https://t.me/c/2424231195/135895 · [Superuser-Anleitung](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
- Onboard-RTL8111/8168 wackelig unter Linux; r8168-Abhilfe, Intel/MediaTek bevorzugen — [LinuxQuestions r8169 vs r8168](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)
- USB 3.0 stört 2,4-GHz-WiFi/BT (USB 2.0 / Verlängerung nutzen) — [Intel-Whitepaper](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf)
- TP-Link Archer TX10UB Nano — WiFi funktioniert unter Linux (RTL8851BU), BT herstellerseitig nur Windows / nicht Linux — [TP-Link-Produktseite](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)
