> 🌐 Community-Übersetzung. Die englische Version ist die maßgebliche Quelle und kann aktueller sein. Fehler gefunden? Öffne ein [Issue](https://github.com/lildebil0/awesome-bc250/issues). ([englisches Original](../en/faq.md))

# FAQ

> **TL;DR** — Die Fragen, die Einsteiger in der ersten Woche stellen, mit kurzen, korrekten Antworten und einem Link zum vollständigen Abschnitt für jede. Wenn sich eine Antwort zu kurz anfühlt, ist das Absicht — die Tiefe steckt auf der verlinkten Handbuchseite.

Dies ist eine Schnellreferenz. Für den geführten Pfad „Board im Karton → laufende Spiele" beginne bei [00-start-here.md](00-start-here.md).

---

## Hardware & was ich gekauft habe

**Was ist die BC-250 eigentlich?**
Eine von der PlayStation 5 abgeleitete APU (AMD **Cyan Skillfish** / Oberon) auf einem Krypto-Mining-/Server-Board: **6-Kern-/12-Thread-Zen-2-CPU + 24-CU-RDNA-2-GPU + 16 GB verlöteter GDDR6**. Es ist keine Grafikkarte und kein normaler PC — kein PCIe-Slot, kein 24-Pin-ATX, kein vertrautes BIOS. Siehe [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Ist es Plug-and-Play? Hätte ich es kaufen sollen?**
Nein. Es braucht Treiberarbeit, eine Kühlungs-Mod und exotischen Strom — es ist ein Bastler-Board. Der Satz eines Veteranen: Es „erfordert gewisse Fähigkeiten, Mühe und Köpfchen." Wenn du null Aufwand willst, schick es zurück; wenn du Projekte magst, ist es die günstigste Linux-Gaming-/Lokal-KI-Kiste in dieser Klasse. Siehe [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Kann ich mehr RAM nachrüsten?**
Nein. Die 16 GB GDDR6 sind verlötet und werden zwischen CPU und GPU geteilt; es gibt keine DIMM-Slots. Du wählst nur, wie viel des Pools die GPU reserviert (UMA), eingestellt im modifizierten BIOS. Siehe [01-what-is-bc250.md](../en/01-what-is-bc250.md) und [08-bios.md](../en/08-bios.md).

**Hat es einen Einschaltknopf?**
Nein. Es schaltet sich in dem Moment ein, in dem 12 V anliegen — der Schalter des Netzteils ist dein Einschaltknopf. Siehe [03-power-supply.md](../en/03-power-supply.md).

**Mein Board POSTet nicht / schwarzer Bildschirm ab Werk — kaputt?**
Oft nicht. Viele Boards werden so ausgeliefert, dass sie vor dem POST einen **BIOS-/CMOS-Reset** brauchen, und einige kommen leicht **verbogen** von der Kühlkörper-Montage an — ein Besitzer behob einen No-Boot, indem er das Board mit Papier flach unterlegte. Probiere das, bevor du es für tot erklärst. Siehe [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Kann es Spiele mit der GPU aufnehmen/streamen?**
Nicht in Hardware. Der Video-Encode-Block (VCN) ist nicht verfügbar, also fällt OBS/Streaming auf einen **Software-Encoder (CPU)** zurück — es funktioniert (Leute nutzen Sunshine/Moonlight), kostet aber CPU und Qualität. Siehe [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Welche Wärmeleitpad-Dicken brauche ich für die Backplate-Mod?**
Von der Community berichtet: **Speicher 2 mm, Chipsatz 1,5 mm** ([src](https://t.me/c/2424231195/22442)). Der rückseitige GDDR6 hat keinen Temperatursensor, du kühlst ihn also blind. Siehe [04-cooling.md](../en/04-cooling.md).

## Strom

**Welches Netzteil brauche ich?**
Eine **Single-Rail-12-V**-Quelle, die **≥300 W** in einen **PCIe-8-Pin (6+2)**-Stecker liefert. Drei gängige Wege: ein normales ATX-/SFX-Netzteil (einfach das PCIe-Kabel einstecken — am einfachsten), ein günstiges gebrauchtes HP-Flex-500-W-Server-Netzteil oder ein industrielles Mean-Well-Brick. Siehe [03-power-supply.md](../en/03-power-supply.md).

**Kann ich den CPU/EPS-8-Pin meines Netzteils nehmen?**
**Nein — das kann das Board verbrennen.** Der PCIe- und der CPU/EPS-8-Pin sehen fast identisch aus, haben aber **vertauschte Polarität**. Das Board hat keine Plausibilitätsprüfung; nimm das **PCIe**-Kabel und prüfe im Zweifel mit einem Multimeter. Siehe [03-power-supply.md](../en/03-power-supply.md).

**Mein altes 750-W-Netzteil hat reichlich Watt — warum schwächelt es?**
Alte Geräte **verteilen 12 V oft auf mehrere schwache Rails**, und keine einzelne Rail deckt die ~235 W, die das Board zieht. Bevorzuge ein modernes Single-Rail-/DC-DC-Netzteil oder eines mit großer Reserve. Siehe [03-power-supply.md](../en/03-power-supply.md).

**Mein Stromkabel wurde heiß / hat geraucht. Warum?**
Mit ziemlicher Sicherheit **Fake-Kupfer** — kupferkaschierter Stahl oder Aluminiumdraht, der ein Vielfaches des Widerstands von echtem Kupfer hat und unter Last überhitzt (der vorgefertigte PCIe-Splitter eines Mitglieds rauchte buchstäblich) ([src](https://t.me/c/2424231195/97202)). Teste mit einem Magneten: Er haftet an Stahl, nicht an Kupfer. Nimm echtes Kupfer, **16 AWG oder dicker**. Siehe [03-power-supply.md](../en/03-power-supply.md).

## Kühlung

**Warum überhitzt / drosselt es ab Werk?**
Der Serienkühlkörper ist **passiv**, gebaut für den Zwangsluft-Tunnel eines Mining-Racks. Auf dem Schreibtisch ohne Luftstrom heizt er sich auf und drosselt. Die Drosselung beginnt bei ~**85 °C**, harter Reset bei ~**90 °C**. Siehe [04-cooling.md](../en/04-cooling.md).

**Was ist der günstigste Kühlungs-Fix, der wirklich funktioniert?**
**Dünne die dichten Serienlamellen aus** (ein Exzenterschleifer ist am schnellsten) und schraube einen **120-mm-Lüfter mit hohem statischem Druck** davor, der über eine gedruckte Shroud durch sie hindurchbläst. Referenzergebnisse: Noctua NF-P12 → ~73 °C Furmark, 63–65 °C in Spielen ([src](https://t.me/c/2424231195/42843)); ein Arctic P12 Max hält ~75 °C ([src](https://t.me/c/2424231195/58869)). Siehe [04-cooling.md](../en/04-cooling.md).

**Warum ein Lüfter mit hohem statischen Druck und kein „Gehäuselüfter" mit hohem Luftdurchsatz?**
Dichte Lamellen sind eine hochohmige Last — ein Gehäuselüfter mit hohem Luftdurchsatz steht einfach davor still, während ein Lüfter mit hohem statischen Druck (Noctua/Arctic P12) die Luft tatsächlich *hindurch* drückt. Bei sehr dichten Lamellen zwei Lüfter im **Push-Pull (in Reihe)**, nicht nebeneinander. Siehe [04-cooling.md](../en/04-cooling.md).

**Woran erkenne ich, dass meine Kühlung ausreicht?**
Belaste **GPU und CPU gemeinsam** (sie teilen sich einen Kühlkörper) — Furmark VK plus eine CPU-Last — **unter deinem Übertaktungs-Takt** (2000 MHz, nicht Serie) und halte die Last unter ~85 °C. Es gibt eine angepinnte Testprozedur. Siehe [04-cooling.md](../en/04-cooling.md).

## Linux

**Welche Distro sollte ich installieren?**
Zum „einfach Spielen" flashe **Bazzite** und rebase auf das **`bazzite-bc250`**-Image — die GPU-Fixes sind eingebacken. Um die Maschine zu lernen: **Fedora** (COPR + Setup-Skript) oder **CachyOS/EndeavourOS** (Arch). Siehe [06-linux.md](../en/06-linux.md).

**Ich habe Linux installiert und alles ist langsam / einstellige FPS. Warum?**
Die GPU wird nicht beschleunigt — du bist auf Software-Rendering (LLVMpipe). Du brauchst ein **frisches Mesa (25.1+)**, den **`cyan_skillfish`-Firmware-Symlink** (oder ein gepatchtes Paket) und die richtigen Kernel-Parameter. Bestätige mit `vulkaninfo | grep deviceName` (es sollte *nicht* `llvmpipe` sagen). Siehe [06-linux.md](../en/06-linux.md).

**Schwarzer Bildschirm nach einem Kernel-Update — wie behebe ich das?**
Auf den meisten Distros ist der Fix der Firmware-Symlink, damit amdgpu laden kann:
```bash
sudo ln -s /lib/firmware/amdgpu/navi10_gpu_info.bin.zst \
           /lib/firmware/amdgpu/cyan_skillfish_gpu_info.bin.zst
```
Das übersteht Kernel-Updates (aber **nicht** auf Bazzite, und ein Firmware-/amdgpu-Update kann ihn löschen) ([src](https://t.me/c/2424231195/98882)). Andernfalls boote einen älteren/LTS-Kernel und versionssperre den fehlerhaften. Siehe [06-linux.md](../en/06-linux.md).

**Sollte ich Apps als Flatpaks installieren?**
Vermeide sie für alles Grafische. Flatpaks bringen ihr **eigenes Mesa** mit, das das gepatchte des Boards überschreibt, sodass sie **ohne Hardwarebeschleunigung** laufen. PortProton zum Beispiel muss über das Terminal installiert werden, nicht als Flatpak ([src](https://t.me/c/2424231195/17949), [src](https://t.me/c/2424231195/47092)). Siehe [06-linux.md](../en/06-linux.md).

**Meine CPU fühlt sich schwach an — gibt es schnelle Gewinne?**
Zwei Kernel-Tweaks: **`mitigations=off`** (deaktiviert die CPU-Sicherheitsmaßnahmen) ([src](https://t.me/c/2424231195/23359)) und **`nosmt=force`** (deaktiviert SMT — +15–25 % FPS in gering-threaded Spielen, schadet aber schwerem Multitasking wie OBS bei hoher Bitrate) ([src](https://t.me/c/2424231195/61332)). Beides sind Sicherheits-/Durchsatz-Kompromisse. Siehe [06-linux.md](../en/06-linux.md).

**GNOME/KDE auf Wayland ist fehlerhaft — was mache ich?**
Bekanntes Problem. Mitglieder berichten, dass Wayland-Sitzungen (typischerweise GNOME/KDE) sich auf diesem Board fehlverhalten; **nutze stattdessen die X11-Sitzung** ([src](https://t.me/c/2424231195/19623)). Siehe [06-linux.md](../en/06-linux.md).

**Mein RAM füllt sich schnell — kann ich mehr Swap bekommen?**
Ja, vergrößere den **zRAM**-Swap (komprimierter RAM-Swap) — das Community-Rezept erhöht ihn auf 32 GB und macht ihn persistent in `/etc/systemd/zram-generator.conf` ([src](https://t.me/c/2424231195/38703)). Es fügt keinen echten Speicher hinzu, fängt aber Spitzen ab. Siehe [06-linux.md](../en/06-linux.md).

**Ein Kernel-Update hat Dinge zerschossen — wie mache ich einen Rollback?**
Das System behält die letzten paar Kernel. Auf Fedora liste sie mit `grubby` auf und `grubby --set-default /boot/vmlinuz-…`, dann reboote ([src](https://t.me/c/2424231195/39393)). Im Zweifel fahre einen **LTS-Kernel**. Siehe [06-linux.md](../en/06-linux.md).

## Windows

**Gibt es schon einen Windows-Treiber?**
Nein — Stand Anfang 2026 gibt es **keinen funktionierenden Windows-GPU-Treiber**. Windows bootet, aber die GPU sitzt auf **Code 43** ohne 3D. Es existieren zwei Reverse-Engineering-Bemühungen von Grund auf (Keshas-dev, ZEROAESQUERDA), aber sie sind im Stadium „kann die GPU überhaupt initialisieren", nicht beim Gaming. Siehe [07-windows.md](../en/07-windows.md).

**Kann ich nicht einfach einen RX-6700-/W5700-Treiber erzwingen?**
Nein. Jede offizielle `.inf` (einschließlich der W5700, die Windows als „kompatibel" anbietet) installiert sich und hängt dann bei Code 43 — die Geräte-ID `1002:13FE` ist fest an die APU geschweißt. Das ist die erste Idee jedes Einsteigers, und sie kann nicht funktionieren. Siehe [07-windows.md](../en/07-windows.md).

**Was ist mit einer Windows-VM mit GPU-Passthrough?**
Funktioniert nicht — IOMMU-Passthrough ist auf diesem Board kaputt, es ist eine APU (keine saubere dedizierte Karte zum Durchreichen), und der Chip wird ohnehin falsch erkannt. Siehe [07-windows.md](../en/07-windows.md).

**Ich habe einen „NVIDIA-Treiber für BC-250" / eine `…bc250.exe` gesehen — echt?**
Nein. Der „NVIDIA-Treiber" war ein **Aprilscherz**, und ein Adrenalin-Installer mit „bc250" im Dateinamen ist immer noch nur ein normaler Adrenalin-Installer. Führe nur Binaries aus den genannten GitHub-Repos aus und lies den Code — gefälschte „Treiber" waren schon Malware. Siehe [07-windows.md](../en/07-windows.md).

## BIOS & Wiederherstellung

**Sollte ich ein modifiziertes BIOS flashen?**
Nur wenn du Übertaktung/Timings/iGPU-VRAM freischalten willst **und** Recovery-Hardware bereithast. Eine falsche Einstellung kann das Board **komplett bricken**, und auf diesem Board **stellt ein CMOS-Clear es nicht immer wieder her**. Verwende die aktuelle 5.00-basierte Mod, prüfe den SHA-256 und deaktiviere niemals Integrated Graphics (es ist dein einziges Display). Siehe [08-bios.md](../en/08-bios.md).

**Ich habe es gebrickt — kann ich es entbricken?**
Meist ja, aber nur mit Hardware: ein **SPI-Programmer der CH341A-Klasse**, verdrahtet mit dem **J4004-Header** des Boards (der SOIC-Clip funktioniert hier *nicht*), um den 16-MB-Chip neu zu flashen. Achte auf die 3,3-V-Datenleitungs-Falle des CH341A. Siehe [08-bios.md](../en/08-bios.md).

**Ich habe den VRAM-Split geändert, aber das OS zeigt noch die alte Menge.**
**Lösche CMOS** nach dem Flashen/Ändern von UMA — entferne die CR2032 für 60+ s oder überbrücke den CMOS-Jumper. Manche Einstellungen (insbesondere VRAM/UMA) greifen erst, wenn du das tust ([src](https://t.me/c/2424231195/97290)). Siehe [08-bios.md](../en/08-bios.md).

## Übertakten & Undervolting

**Wie übertakte ich? Lohnt es sich?**
Lass einen **Governor** laufen (die meisten Builds nutzen **oberon-governor**) und hebe die GPU Richtung **2000 MHz** an (~+30 % FPS *wenn GPU-limitiert*). Der neuere `bc250_smu_oc` übertaktet auch die CPU (~4 GHz @ 1275 mV). **Kühle das Board zuerst** — OC oberhalb von ~90 °C setzt es zurück. Siehe [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**Was ist die 40-CU-Freischaltung?**
Der Die hat physisch **40 CUs**, aber die Firmware lässt nur **24** aktiv. Ein gepatchtes amdgpu + `amdgpu.bc250_cc_write_mode=3` reaktiviert alle 40 — ein größerer GPU-Gewinn als Takt (ein Superposition-Lauf ging von 4647 → 6863). Es erfordert das Neukompilieren des Kernel-Moduls und ist Linux-only. Siehe [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**Welche Spannung sollte ich setzen?**
Jeder Chip ist anders (Silizium-Lotterie). Verbreitete spielstabile Punkte: **2000 MHz ≈ 955 mV** (~75 °C). Validiere in **echten Spielen + Alt-Tab/Menüs**, nicht nur in Furmark, das Instabilität kaschiert. Harte CPU-Grenze: **niemals 1,325 V Vid überschreiten**. Siehe [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**Ist ein zu aggressives Undervolting gefährlich?**
Nein — im schlimmsten Fall fällt das Board aus oder deaktiviert den M.2-Slot, und es klärt sich in ein paar Sekunden, weil der OC nicht im BIOS gespeichert ist. Die CPU zu *über*volten ist die gefährliche Richtung. Siehe [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

## Display, WLAN & Bluetooth

**Kein Bild über HDMI?**
Das Board gibt über **DisplayPort** aus; für HDMI/TV nimm einen **DP→HDMI-Adapter oder -Kabel** (ein gutes funktioniert auch im BIOS und macht 4K) ([src](https://t.me/c/2424231195/24107)). Bevorzuge ein echtes **DP→HDMI-Kabel** gegenüber einem billigen passiven Adapter — ein schlechter Adapter verursachte bei einem Mitglied schwarze Bildschirme ([src](https://t.me/c/2424231195/96416)).

**Audio über DisplayPort ist verzerrt.**
Bekanntes Problem unter Linux. Der einfache Fix ist, über einen **DP→HDMI**-Adapter auszugeben, der sauberes Audio überträgt ([src](https://t.me/c/2424231195/17953)). Siehe [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Hat es WLAN/Bluetooth?**
Kein Funk onboard — du brauchst einen **USB-Dongle**, gewählt nach **Chipsatz, nicht Marke**. Am besten dokumentiert ist ein **aic8800d80**-Stick; günstige Realtek-RTL8821/8822-Sticks funktionieren mit `lwfinger/rtw88`, brechen aber unter Last ab. Zur Einrichtung umgeht ein kabelgebundener USB-Ethernet-Adapter das ganze Thema. Siehe [10-wifi-bt.md](../en/10-wifi-bt.md).

**Mein WLAN-Dongle trennt sich ständig.**
Klassisches Realtek-auf-BC-250-Symptom: Installiere den richtigen Out-of-Tree-Treiber (rtw88 / rtl8831), probiere einen hinteren USB-Port und setze mit `usbreset` zurück statt auszustöpseln. Wenn Zuverlässigkeit wichtiger ist als der Preis, wechsle zu aic8800d80 oder einem bestätigten Digma-Stick. Siehe [10-wifi-bt.md](../en/10-wifi-bt.md).

## Gaming & KI

**Welche FPS kann ich erwarten?**
Bei einem echten **2000-MHz**-OC: moderne AAA-Titel bei **40–60 FPS**, leichtere/ältere Spiele über 60. Am besten bei **1080p–1440p** mit FSR. Das Board ist meist **CPU-limitiert**, sodass Auflösung oft „gratis" ist, aber physiklastige/schlecht-gethreadete Spiele ruckeln unabhängig davon. Siehe [11-gaming.md](../en/11-gaming.md).

**Welche Spiele laufen am besten?**
**First-Party-PlayStation-Ports** (God of War, Horizon, The Last of Us, Spider-Man, Ghost of Tsushima) — sie setzen auf die GPU und sind gut optimiert. Emulation: Switch (Eden) und PS4 (shadPS4) laufen solide; Xbox 360 (Xenia) nicht. Siehe [11-gaming.md](../en/11-gaming.md).

**Warum ist meine GPU bei ~40 % Last, aber die FPS sind niedrig?**
Du bist **CPU-limitiert** — die 6-Kern-Zen-2 ist der Flaschenhals, nicht die GPU. Upscaling hebt die FPS in dem Fall kaum; probiere `nosmt=force`/`mitigations=off` und akzeptiere, dass manche Titel CPU-limitiert sind. Siehe [11-gaming.md](../en/11-gaming.md).

**Kann ich lokale LLMs / KI darauf laufen lassen?**
Ja — die 16 GB GDDR6 fassen mittelgroße Modelle via `llama.cpp`/Jan auf dem **Vulkan**-Backend; stelle das BIOS zuerst so ein, dass es der GPU ~12 GB zuweist. Siehe [12-ai-llm.md](../en/12-ai-llm.md).

## Kaufen

**Was ist ein fairer Preis, und wo kaufe ich?**
Preise und Quellen ändern sich schnell und sind regionsspezifisch (eBay, AliExpress, Ozon/Avito in der GUS) — jüngste Berichte liegen im niedrigen 100-Dollar-Bereich bis ~13.000 ₽. Siehe [02-buying.md](../en/02-buying.md).

**Welche Risiken hat der Kauf?**
Es ist gebrauchte Mining-/Server-Hardware: Boards können einen BIOS-Reset brauchen, leicht verbogen oder gelegentlich defekt ankommen, und es gibt keinen Herstellersupport — die Community ist dein Support. Plane Zeit ein, nicht nur Geld. Siehe [01-what-is-bc250.md](../en/01-what-is-bc250.md) und [02-buying.md](../en/02-buying.md).

**Kann ich macOS darauf laufen lassen?**
Lass es. Die CPU bootet vielleicht, aber die **GPU wird niemals beschleunigen** (kein unterstützter Zwilling zum Vortäuschen, und keine AMD-APU-iGPU hat je in macOS funktioniert). Nimm Linux. Siehe [13-macos.md](../en/13-macos.md).

---

## Quellen

- Quell-Chat: *AMD BC-250 Community* (Telegram). Die meisten Antworten fassen einen vollständigen Handbuchabschnitt zusammen — folge dem Abschnittslink für die zugrunde liegenden Belege.
- Wärmeleitpad-Dicken — https://t.me/c/2424231195/22442
- Arctic P12 Max ~75 °C — https://t.me/c/2424231195/58869 · Noctua P12 ~73 °C — https://t.me/c/2424231195/42843
- Schwarzbild-nach-Kernel-Firmware-Symlink-Fix (nicht Bazzite) — https://t.me/c/2424231195/98882
- Flatpak zerschießt Hardwarebeschleunigung — https://t.me/c/2424231195/17949 · PortProton via Terminal — https://t.me/c/2424231195/47092
- `mitigations=off` für schwache CPU — https://t.me/c/2424231195/23359 · `nosmt=force` FPS-Gewinn — https://t.me/c/2424231195/61332
- Wayland-Fehler, X11 verwenden — https://t.me/c/2424231195/19623
- zRAM-Swap-Erhöhung — https://t.me/c/2424231195/38703 · Kernel-Auswahl/-Rollback — https://t.me/c/2424231195/39393
- Strom-Splitter überhitzt/geraucht (Fake-Kupfer) — https://t.me/c/2424231195/97202
- CMOS-Clear nach VRAM-Änderung nötig — https://t.me/c/2424231195/97290
- DP→HDMI-Adapter (4K/TV, funktioniert im BIOS) — https://t.me/c/2424231195/24107 · schlechter Adapter → schwarzer Bildschirm — https://t.me/c/2424231195/96416 · Fix für DP-Audio-Verzerrung — https://t.me/c/2424231195/17953

> Diese FAQ ist eine Karte, nicht das Gelände — jede Antwort verweist auf den Abschnitt, der das Detail und die Primärquellen trägt. Korrekturen sind per PR willkommen (siehe [CONTRIBUTING.md](../../CONTRIBUTING.md)).
