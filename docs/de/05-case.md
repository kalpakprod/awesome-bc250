> 🌐 Community-Übersetzung. Die englische Version ist die maßgebliche Quelle und kann aktueller sein. Fehler gefunden? Öffne ein [Issue](https://github.com/lildebil0/awesome-bc250/issues). ([englisches Original](../en/05-case.md))

# Gehäuse & 3D-Druck

> **TL;DR** — Das BC-250 wird als nacktes Board geliefert, also druckt fast jeder ein Gehäuse. Es gibt kein einziges "richtiges" Gehäuse — die Community hat **Dutzende** Designs hervorgebracht, von einem minimalen **Kühl-Sleeve**, der einfach zwei Hälften um das Board klemmt, bis zu vollen **konsolenartigen Boxen** mit Tragegriff, Frontbildschirm und RGB. Was immer du druckst, das Gehäuse muss eine Aufgabe erfüllen, die das Stock-Board nicht kann: **einen 120-mm-Lüfter gegen die Kühlkörperlamellen abdichten**, damit die Luft *durch* sie strömt (siehe [Kühlung](04-cooling.md)). Diese Seite ist der Katalog: Name → STL → Lüfter → wo herunterladen. **Achte auf das Netzteil**: die meisten Gehäuse sind um ein bestimmtes Netzteil herum konstruiert (LOP, Flex/SFX ATX oder ein HP-Server-Brick) — wähle das Gehäuse, das zu dem [Netzteil](03-power-supply.md) passt, das du hast.

Ein "Gehäuse" reicht hier von einem 200-g-Druck, der 20 Minuten Arbeit kostet, bis zu einer mehrteiligen Konsole, an der ihr Autor Wochen gesessen hat. Fang einfach an; du kannst jederzeit neu drucken.

> **Neu und unsicher? Druck das [onemorecap Sleeve/Shell](#tier-1--minimale-kühl-sleeve-hier-starten)-Gehäuse — minimal, nichts zu schneiden, passt zu einem einzelnen 120-mm-Lüfter — und hör da auf.** Der Katalog unten ist tief; du musst ihn nicht lesen, um loszulegen.

> **Willst du die vollständige Liste?** elektricM pflegt einen **durchsuchbaren, filterbaren Katalog von ~143 Designs** (filterbar nach Netzteil-Familie, Verfügbarkeit, Plattform) — weit mehr als das kuratierte Set unten, einschließlich vieler Discord-only- und WIP-Builds. Durchstöbere ihn unter **[elektricM — Cases & Enclosures](https://elektricm.github.io/amd-bc250-docs/community/cases/)**. Die Auswahl unten sind die benannten, öffentlich herunterladbaren, mit denen anzufangen sich lohnt.

---

## Community-Builds

Ein Vorgeschmack auf das, was Leute tatsächlich gedruckt haben — von einer nackten offenen Hülle bis zu voll thematisierten Konsolen. Gleiches Board, völlig unterschiedliche Ergebnisse.

<p align="center">
  <img src="../../assets/img/case-shell.jpg" alt="onemorecap Shell Case: offene Seitenplatte, Tragegriff, freiliegende Kupferlamellen, Arctic 120-mm-Lüfter" width="60%"><br>
  <sub>Build von Дима Ткач · <a href="https://t.me/c/2424231195/22771">Quelle</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-frame.jpg" alt="Weißer offener Aluminiumrahmen mit sichtbaren Innereien: zwei Kühlkörper, zentraler weißer Arctic-Lüfter, Flex-Netzteil" width="60%"><br>
  <sub>Build von Сергей · <a href="https://t.me/c/2424231195/87420">Quelle</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-orange.jpg" alt="Orange-weiße geschlossene Konsole mit perforiertem Mesh-Seitenpaneel und einem geformten Tragegriff" width="60%"><br>
  <sub>Build von Alexander Susl · <a href="https://t.me/c/2424231195/122822">Quelle</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-arasaka.jpg" alt="ARASAKA cyberpunk-thematisierte Konsole: weiße Front, verchromtes Lüftergitter, grüne Akzente und Füße" width="60%"><br>
  <sub>Build von Maxim Perelygin · <a href="https://t.me/c/2424231195/98072">Quelle</a></sub>
</p>

---

## Wie du wählst

Drei Fragen entscheiden, welches Gehäuse zu dir passt:

1. **Welches Netzteil nutzt du?** ([Netzteil](03-power-supply.md)) — Ein Meanwell **LOP-300** ist klein und sitzt *innerhalb* der meisten Gehäuse. Ein **Flex/SFX ATX**-Netzteil ist größer und braucht ein Gehäuse mit eigenem Schacht. Ein geretteter **HP-/Server-Brick** braucht die "v3/v4 Server-Netzteil"-Gehäuse. Das ist der mit Abstand größte Filter.
2. **Welche Lüfter wirst du betreiben?** Nahezu jedes Gehäuse ist um **einen 120-mm-Lüfter** über dem Kühlkörper herum aufgebaut. Größere Builds fügen einen **zweiten 120-mm**-Lüfter auf der Backplate hinzu (um den GDDR6-Speicher zu kühlen, der [keinen Temperatursensor](04-cooling.md) hat) oder versorgen das Netzteil. Ein paar nutzen **140-mm**- oder **schlanke** Lüfter, wo die Höhe knapp ist.
3. **Hast du die Lamellen schon ausgedünnt?** Die meisten Gehäuse setzen voraus, dass du die **Stock-Kühlkörperlamellen bereits aufgefeilt/-geschliffen** hast (siehe [Kühlung, Pfad A](04-cooling.md)). Ein Gehäuse allein behebt den Stock-Kühler nicht — es hält nur den Lüfter an der richtigen Stelle.

> **Fachjargon, einmalig:** **STL** = die standardmäßige 3D-Druck-Mesh-Datei, die du in einen Slicer lädst. **STEP / 3MF** = bearbeitbare CAD-Formate (nutze diese, wenn du das Design ändern willst). **Shroud / Sleeve / Adapter** = ein gedruckter Trichter, der den Lüfter gegen die Lamellen abdichten lässt, statt Luft drumherum entweichen zu lassen. **Flex / SFX ATX** = Kleinformat-PC-Netzteile. **LOP** = das Meanwell LOP-300-Industrienetzteil, das die Community bevorzugt.

> **💡 Druck ein Zugangsloch zum CMOS-Clear-Jumper.** Jedes Mal, wenn du den VRAM/UMA-Split änderst, musst du **CMOS löschen** (siehe [BIOS](08-bios.md)), also bedeutet ein versiegeltes Gehäuse, das den Jumper vergräbt, es wiederholt aufbrechen zu müssen. Lass ein **⌀10-mm-Zugangsloch** über dem Clear-CMOS-Jumper in jedem geschlossenen Design — oder, besser, verdrahte einen kleinen **3-Stellungs-Schalter** nach außen zum Paneel, damit du es ohne Werkzeug zurücksetzen kannst. ([4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980))

---

## Tier 1 — Minimale „Kühl-Sleeve" (hier starten)

Das kleinste, schnellste, das du drucken kannst. Es ist **nicht wirklich ein Gehäuse** — es ist eine gedruckte Hülle, die in zwei Hälften mit straffem Reibsitz auf das Board schnappt, einen 120-mm-Lüfter gegen den Kühlkörper hält und die Luft führt. **Nichts zu schneiden, keine Schrauben ins Board.** Дима Ткач (einer der frühesten Builder des Projekts) beschreibt zwei Varianten — eine kompakte und eine "lustiger aussehende" — beide erreichen **~70 °C bei 150 W** Last, ~210 g / ~170 g Kunststoff je, wobei das Netzteil bei turbulentem Luftstrom kalt bleibt ([src](https://t.me/c/2424231195/10743)). Sein Fazit: *"das ist nicht wirklich ein Gehäuse, eher eine Kühl-Sleeve, aber nichts muss geschnitten werden, alles hält auf sehr straffem Sitz, die Hälften werden von gegenüberliegenden Seiten aufgesetzt."*

- **Dateien:** `BC-250-FanSleeves.3mf` ([src](https://t.me/c/2424231195/10766)), Board-CAD `bc-250-body.step` ([src](https://t.me/c/2424231195/18266))
- **Quell-Repo:** [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) — das am meisten empfohlene "verifizierte, gedruckte, als funktionierend bestätigte" minimale Design im Chat ([src](https://t.me/c/2424231195/18260))
- **Lüfter:** 1× 120 mm
- **Netzteil:** beliebig — es gibt ein Loch/Ausschnitt für die Stromzuleitung, sodass du ein LOP *oder* ein externes Netzteil nutzen kannst ([src](https://t.me/c/2424231195/22950))

---

## Tier 2 — Offener Rahmen / "Shell" (Board zur Schau)

Halb-Gehäuse, die das Board auf einer Seite umschließen und den Kühlkörper sichtbar lassen. Wenig Kunststoff, leicht zu montieren, guter Luftstrom.

### onemorecap "Shell Case" — der Referenz-Build

Der einzelne Gehäuse-Post mit den meisten Wert-Reaktionen im Chat (❤33): eine flache Seitenplatte über dem Board, geprägt mit **"BC-250"** und dem CU-Gitter-Muster, ein **Tragegriff** in die Oberseite geformt, die **ausgedünnten Kühlkörperlamellen in der Mitte freiliegend** und ein 120-mm-**Arctic**-Lüfter in seinem eigenen Shroud, am rechten Ende verschraubt. Markiert *"BC-250 SHELL CASE BY ONEMORECAP / ASRock × CMG"* ([src](https://t.me/c/2424231195/22771)). Der passende Satz STLs wurde in einem Schwung in den Chat gepostet ([src](https://t.me/c/2424231195/81672)) und der Autor bestätigte, dass die Modelle kostenlos auf Printables und MakerWorld sind ([src](https://t.me/c/2424231195/24505)).

- **Dateien (Chat-Schwung):** `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl`, plus die Lüfter-Shrouds unten ([src](https://t.me/c/2424231195/81680))
- **Quelle:** [GitHub onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case)
- **Lüfter:** 1× oder 2× 120 mm (via Shroud), oder 1× 140 mm
- **Netzteil:** das `Shell_Back_FLEX_ATX`-Rückpaneel ist für ein **Flex ATX**-Netzteil ausgeschnitten

### Acryl-Offenrahmen (Владислав)

Ein offener **Aluminium-und-Acryl**-Rahmen: zwei Metall-Endplatten mit klaren Seitenpaneelen, das Board vertikal montiert, ein einzelner **Arctic 120-mm**-Lüfter, der gerade durch den ausgedünnten Kühlkörper in der Mitte bläst, und ein Flex/SFX-Netzteil im unteren Schacht ([src](https://t.me/c/2424231195/114651)). Das ist das Design, das später als ["acrylic case" zu r/BC250Gaming](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) cross-gepostet wurde. Die gedruckten Halterungen sind die Teile, die du reproduzierst; der Rahmen selbst ist lasergeschnitten/von der Stange.

- **Lüfter:** 1× 120 mm (Mitte) — Platz, um einen Backplate-Lüfter hinzuzufügen
- **Netzteil:** Flex / SFX ATX im unteren Schacht

---

## Tier 3 — Konsolenartige Boxen (vollständig geschlossen)

Geschlossene Gehäuse, die wie eine Spielkonsole oder ein kleines NAS aussehen. Mehr Kunststoff und mehr Druckzeit, aber ein fertiges Produkt mit Griff, Power-Knopf, belüfteten Paneelen und manchmal einem Bildschirm.

### "Просто лучший корпус" (Jack Fisher × B1zon) — Community-Favorit

Gepostet unter dem kuratierten **#BC250body**-Tag als *"einfach das beste Gehäuse"*, ist dies eine voll fertige Konsole mit einer veröffentlichten Stückliste: Netzteil, Lüfter, Stecker, Gummifüße, Power-Knopf, Schrauben + Gewindeeinsätze, ein Lüfter-PWM-Splitter, ein "Cyberpunk"-Sticker und ein Kamm zum Begradigen der Kühlkörperlamellen. Einige Teile sind nicht mehr in Produktion und haben Ersatz ([src](https://t.me/c/2424231195/79990)). Design-Credit an B1zon, Montage von Jack Fisher.

- **Dateien:** `BC250 korpus исправленный.rar` ("BC250-Gehäuse, korrigiert") ([src](https://t.me/c/2424231195/79989))
- **Lüfter:** 120 mm (Front) + PWM-Splitter für einen zweiten Lüfter
- **Netzteil:** intern (LOP-Klasse)

### Triple-"GPU"-Front (Гослинг)

Eine Konsolenbox, deren Frontpaneel ein **gefälschter Grafikkarten-Shroud** ist — drei runde Lüfterausschnitte in einer Reihe mit RGB, sodass die Maschine wie eine dedizierte GPU aussieht. Gezeigt mit laufendem **Bazzite 42** auf dem BC-250 ([src](https://t.me/c/2424231195/66616)). Die drei Öffnungen sind kosmetisch über dem einzelnen funktionierenden Lüfter plus Einlass.

### Labyrinth-Paneel-Weißkonsole (Jhonatan)

Eine hohe weiße Box mit einem markanten **labyrinth-/schaltungsmuster-belüfteten Seitenpaneel**, einem beleuchteten (grünen) Metall-Power-Knopf und einem Einlassgitter über die volle Höhe auf der Frontfläche — eine der ausgefeilteren Ästhetiken im Chat ([src](https://t.me/c/2424231195/121274)).

### Gitter-Mesh-Mini-Tower (Joglik)

Ein grauer vertikaler Mini-Tower mit dichtem **Quadratgitter-Mesh** an Seite und Oberseite, einer Schlitz-/Griffkerbe in der oberen Kante und einer runden Kabeldurchführung unten hinten. Sauberer industrieller Look ([src](https://t.me/c/2424231195/126525)).

### Oval-Fenster-Hi-Fi-Box (a m)

Ein weißes rechteckiges Gehäuse, gestylt wie eine Hi-Fi-/Mikrowellen-Front: ein großes **stadionförmiges Mesh-Fenster** mit dem Lüfter sichtbar hinter einem runden Mesh, flankiert von zwei vertikalen Mesh-Schlitzen ([src](https://t.me/c/2424231195/52955)). Die spätere Iteration des Autors geht in Richtung "richtiger Kunststoff" statt geschäumtem PVC und ergänzt externe XT-Serien-Power und RGB ([src](https://t.me/c/2424231195/128048)).

### Kompaktkonsole (Volodymyr Spyrydonov, "v15")

Eine kleine silber-schwarze Konsolenbox mit einem Mesh-Seiteneinlass und einer dunklen Front, die ein cyberpunk-artiges Emblem und einen RGB-Streifen trägt, gezeigt neben einem TV als Wohnzimmer-Maschine ([src](https://t.me/c/2424231195/135995)). Teil einer langen Reihe von Revisionen (v15/v19/v20 Quellbilder wurden früh geteilt).

### BC250 Vented Edition (MaelremremDotXYZ)

Eine minimalistische **FlexATX**-Konsole, **mit offenen Lamellen** betrieben, hält **~67 °C @ 2145 MHz / 1,1 V**, mit einem hinteren Netzteil-Kill-Switch. [MakerWorld 2899020](https://makerworld.com/en/models/2899020).

### Stellar 250 (isaacalvex)

Eine vollständige eigenständige Konsole mit einem kompletten **Build-Guide**: interner Speicher, **WiFi 6** und ein **ESP32-Temperaturdisplay**. [GitHub isaacalvex/AMD-BC-250-Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide).

### Simple Case for the ASRock AMD BC-250

Ein benanntes, öffentlich herunterladbares Konsolengehäuse, veröffentlicht vom Autor des [ukrainischen Build-Walkthroughs auf YouTube](https://youtu.be/p5Zd86vFe8w) — eine geradlinige geschlossene Box für alle, die einen fertigen Druck ohne die mehrteilige Komplexität wollen. [MakerWorld 2870270](https://makerworld.com/en/models/2870270).

---

## Tier 4 — Große Builds: ATX-Netzteil, AIO-Wasserkühlung, Bildschirme

Für Leute, die ein vollformatiges Netzteil, Wasserkühlung oder ein integriertes Display wollen.

### NexGen3D "DIY Steam Machine"-Familie

Das **am häufigsten verwiesene 3D-Projekt** in der Community (7× reposted). Eine Familie von Konsolengehäusen auf Printables, einschließlich einer **wassergekühlten "Pro"**-Variante und einer **"Redux"**-Edition, die einen **internen 1080×480 Pi-Bildschirm** in die Front einpasst ([Reddit build](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)). Es gibt ein eigenes **AIO-Mount**-Modell, um einen 120-mm-All-in-One-Wasserkühler auf den Die zu setzen.

- [Printables 1499974 — DIY Steam Machine (Basis)](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite)
- [Printables 1614131 — Pro Liquid-Cooled](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) · [Printables 1649679 — Redux](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) · [Printables 1554003 — AIO mount](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250)
- **Lüfter/Kühlung:** 120 mm Luft **oder** 120 mm AIO je nach Variante
- **Netzteil:** LOP-Version und ATX-Versionen dokumentiert

### "Steam Machine Pro" wassergekühlter Referenz-Build (Old Lamer)

Ein High-End-, vollständig wassergekühlter Build, durchgehend auf Video dokumentiert — nützlich als Teile-Einkaufsliste, wenn du voll auf eine AIO-Maschine gehst ([Old Lamer](https://youtu.be/afYhUQFa-AY)). Die veröffentlichte BOM:

- **AIO:** TEUCER AF 240 (240-mm-All-in-One) auf dem Die
- **Netzteil:** Mean Well **LOP-600-12** (oder **LOP-500-12** als kleinere Option) — siehe [Netzteil](03-power-supply.md)
- **Lüfter:** 2× Arctic **P12 Pro** + 1× Arctic **P8**
- **Fernsteuerung Power:** ein **ESP32-Relais-Board**, um die Maschine fern ein-/auszuschalten
- **Software:** **OpenLinkHub** / **Commander Duo** unter Linux, um AIO-Pumpe und Lüfter anzusteuern

---

### Steam Cube — parametrisches vertikales Gehäuse, wassergekühlt (in Entwicklung)

Ein **vollständig parametrisches** vertikales Gehäuse im **Xbox Series X**-Formfaktor, **wasserkühlungs-zuerst** konstruiert mit einer austauschbaren Kaltseite: ein Wasserblock, ein **Thermalright AXP90-X47 Full-Copper** oder ein einzelner **Arctic P12 Max** schrauben alle an dieselbe Halterung. Es ist aus **Sol Diegos "Xbox Serie X BC-250 Edition"**-Skizze ([Printables 1748271](https://www.printables.com/model/1748271)) und dem akkuraten **torassk-Board-Modell** ([Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)) entstanden, dann als Code (build123d) neu gezeichnet, sodass jede Abmessung eine Variable ist, die du nachpasst, statt eines festen Mesh.

**Hüllmaße und die Überlegung dahinter** (abgeleitet aus der verifizierten Board-Größe und den thermischen Zielen in [Kühlung](04-cooling.md)):

- **~180 × 212 × 380 mm** vertikaler Tower — hoch genug, um einen **240-mm-Radiator vertikal** neben dem Board aufzustellen (eine ~277-mm-Rad-Baugruppe passt in 380 mm Höhe).
- **Kamin-Luftstrom** — 120 mm Einlass unten, 120 mm Auslass oben, sodass die Wärme gerade nach oben heraussteigt.
- **Aktive Backplate ist Pflicht, nicht optional** — die GDDR6-/VRM-Seite hat [keinen Temperatursensor](04-cooling.md), also behandelt das Design die Rückseitenkühlung als erforderlichen Teil.
- **Kühlziele** (Designziele, **keine** gemessenen Ergebnisse): Wasser-Die < 60 °C dauerhaft bei 40 CU; AXP90 < 75 °C @ 2000 MHz; P12-Basis ~73–78 °C.

> ⚠️ **Status: Designkonzept, kein verifizierter Druck.** Das aktuelle CAD ist ein **parametrisches Raummodell** — Teile sind korrekt dimensioniert, ausgerichtet und platziert, und es exportiert 8 STL + ein STEP — aber es wurde **nicht** gedruckt, montiert oder thermisch getestet, und der Wasserblock ist aus dem Bounding-Box des Boards platziert statt aus einer gemessenen Die-Position. Behandle es als **Start-CAD zum Forken**, nicht als fertiges Gehäuse; echte Druck-/Pass-/Thermo-Validierung ist der offene nächste Schritt. Die Ziele oben sind Ziele, keine Benchmarks.

---

### ATX-Netzteil-Gehäuse (Victor L., V\ad, Server-Netzteil v3/v4)

Für ein vollständiges **ATX**-Netzteil: ein Gehäuse um ein komplettes ATX-Netzteil herum ([src](https://t.me/c/2424231195/119293), auf dem Weg zu MakerWorld), ein früherer Erstlings-Blender-Prototyp ([src](https://t.me/c/2424231195/105570)) und eine veröffentlichte **HP-/Server-Netzteil**-Linie auf Printables/MakerWorld mit HDD- und USB-Hub-Vorkehrungen.

- [Printables 1580750 — Case v3, HP server PSU + HDD + USB hub](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) · [MakerWorld 2481620 — Case v4, FlexATX & HP-server PSU](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) · [Printables 1550729 — ATX-PSU Bazzite Box](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box)

### Twin-120-Builds (Speicher- + Netzteilkühlung)

Eine neu konstruierte Montageplatte, die **zwei 120-mm-Lüfter** trägt — einer zur Backplate (Speicher) geführt, wie es der Designer des Boards vorgesehen hat, der zweite versorgt das Netzteil. Mit Lian Li P28-Lüftern vorne + einem Thermalright C12015 hält der Autor **2200 MHz bei 80 °C in Spielen**, wo ein einzelner Frontlüfter nicht genug war ([src](https://t.me/c/2424231195/120606)). Ein eigenständiges **`Twin_120mm_Fan_Shroud.stl`** wird dafür geteilt ([src](https://t.me/c/2424231195/121684)).

### Der Lanboy — tragbare Arcade / Lunchbox

Ein tragbarer Lunchbox-Arcade-Build: er treibt ein **16″-Laptop-eDP-Panel (1920×1200 @ 165 Hz)** über ein **eDisplayPort-Adapterboard** ([AliExpress](https://www.aliexpress.com/item/1005006351527252.html)), 2× 2″-Lautsprecher an einem USB-Verstärker, alles versorgt von einem einzelnen **12 V ATX-Breakout**. [Printables 1746364](https://www.printables.com/model/1746364). Der eDP-Adapter-Trick ist für **jeden** Laptop-Panel-Build wiederverwendbar.

### BC250-HUD (Bloodyly) — interner Statusbildschirm

Eine Qt5/C++-**Statusbildschirm-App für einen Raspberry Pi Zero 2** (verwendet in Builds wie dem NexGen3D Redux): **60 FPS über USB-Gadget-Modus**, liest FPS/Frametime von MangoHud, erfasst die Lüfterspannung, um den Bildschirm im Schlaf zu dimmen, und **enthält den vc4-Kernel-Patch**, der den Pi sonst einfriert. Bildschirm: **8,8″ 1920×480 IPS** (Hannstar HSD088IPW1-A). [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD).

---

## Adapter & Halterungen (keine vollständigen Gehäuse)

Kleine gedruckte Teile, die ein Problem lösen — meist das Montieren eines Kühlers oder Lüfters am Board.

- **Lüfter-Shrouds** (einen Lüfter an die Lamellen abdichten): `Fan_Shroud_Single_120mm.stl`, `Fan_Shroud_Dual_120mm.stl`, `Fan_Shroud_Single_120mm_Restricted.stl`, `Fan_Shroud_Single_140mm.stl` ([src](https://t.me/c/2424231195/81673)), `Twin_120mm_Fan_Shroud.stl` ([src](https://t.me/c/2424231195/121684)). Auch katalogisiert in [Kühlung](04-cooling.md).
- **Backplate- / Speicherlüfter-Halterungen:** `Backplate.stl` + `backplane-top-fixed.stl` ([src](https://t.me/c/2424231195/133049)); `bottom_fan_mount.stl`, `top_fan_mount.stl`, `Front-Mount.stl`, `Back-Mount.stl` ([src](https://t.me/c/2424231195/131189))
- **AM4-Kühler-Adapter** (einen Standard-CPU-Kühler an den Die schrauben): `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` ([src](https://t.me/c/2424231195/9949)). Siehe auch [Printables 1042228 — BC250→AMD CPU-cooler mount](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount).
- **Generischer ITX-Mount** (majzok): druckt in zwei Teilen, die in einen Rahmen einschnappen — schraube das BC-250 hinein, dann schraube den Rahmen in **jedes Gehäuse mit Standard-ITX-Mainboard-Löchern** (getestet in einem DeepCool CH170 PLUS). Löst das Problem "es existiert kein generischer ITX-Mount". Kein kanonischer Printables-Link erfasst — suche auf Printables/MakerWorld nach **"BC-250 ITX Mount"**.
- **Thermalright AXP90-X53 / AXP120-X67 Adapter** (Low-Profile-Kühler auf dem Die): ein gedruckter Mount, der M3-Gewinde braucht, mit Dickenvarianten je nach Kühler-/CPU-Druck — [Printables 1694793](https://www.printables.com/model/1694793). Auch in [Kühlung](04-cooling.md).
- **120-mm-Lüfteradapter:** `BC250_FanAdapter_120mm.step` ([src](https://t.me/c/2424231195/83135)), `cooler adapter v3.0 (1).stl` ([src](https://t.me/c/2424231195/111091))
- **Akkurate Board-Modelle** (entwirf dein eigenes Gehäuse gegen diese): [Printables 1341336 — accurate BC-250 board](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) ([src](https://t.me/c/2424231195/55496)), [Printables 1103626 — AMD BC250 board](https://www.printables.com/model/1103626-amd-bc250-board)

---

## Katalog-Tabelle

Mit *(chat)* markierte Dateien sind unter `assets/stl/` gespiegelt; alles andere lädt von der verlinkten Printables-/MakerWorld-/GitHub-Seite herunter.

| Gehäuse / Teil | Typ | STL- / Quelldateien | Lüfter | Download |
|---|---|---|---|---|
| **onemorecap cooling sleeve** | minimale Sleeve | `BC-250-FanSleeves.3mf` *(chat)* | 1× 120 | [GitHub onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) |
| **onemorecap Shell Case** ⭐ | offene Shell | `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl` *(chat)* | 1–2× 120 / 1× 140 | [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [GitHub](https://github.com/onemorecap/bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case) |
| **Acryl-Offenrahmen** (Владислав) | offener Rahmen | gedruckte Halterungen *(chat #114651)* | 1× 120 | [Reddit thread](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) |
| **"Просто лучший корпус"** (Jack Fisher × B1zon) | Konsole | `BC250 korpus исправленный.rar` *(chat)* | 120 + PWM-Splitter | [chat #79989](https://t.me/c/2424231195/79989) |
| **Minimal case for Flex PSU** | kleine Box | `minimal-case-...-model_files.zip` *(chat)* | 1× 120 | [Printables 1423572](https://www.printables.com/model/1423572-minimal-case-for-bc250-and-flex-psu) |
| **forgenam case** | Konsole | `forgenam-case-bc250-model_files.zip` *(chat)* | 1× 120 | [Printables 1375929](https://www.printables.com/model/1375929-forgenam-case-bc250) |
| **Minimalist 240** | Konsole + Griff | `Minimalist 240 Front/Back/Handle.stl` *(chat)* | 120 | [chat #117404](https://t.me/c/2424231195/117404) |
| **M360** | Konsole | `M360 Front.stl`, `M360 Back.stl` *(chat)* | 120 | [chat #126566](https://t.me/c/2424231195/126566) |
| **NexGen3D DIY Steam Machine** ⭐ | Konsole | Printables-Dateien | 1× 120 | [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) |
| **NexGen3D Pro (liquid)** | Konsole + AIO | Printables-Dateien | 120 AIO | [Printables 1614131](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) |
| **NexGen3D Redux (+screen)** | Konsole + 1080×480-Bildschirm | Printables-Dateien | 1× 120 | [Printables 1649679](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) |
| **NexGen3D AIO mount** | Adapter | Printables-Dateien | 120 AIO | [Printables 1554003](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250) |
| **Case v3 — HP server PSU** | Konsole + HDD/USB | Printables-Dateien | 120 | [Printables 1580750](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) |
| **Case v4 — FlexATX / HP PSU** | Konsole | MakerWorld-Dateien | 120 | [MakerWorld 2481620](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) |
| **ATX-PSU Bazzite Box** | Voll-ATX-Box | Printables-Dateien | 120 | [Printables 1550729](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box) |
| **ivanov-innokentii case** | Konsole | GitHub-Quellen | 120 | [GitHub ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) |
| **rLapchynski enclosure** | Gehäuse | GitHub-Quellen | 120 | [GitHub rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure) |
| **BC-250 Scooper** | Shroud/Scoop | Printables-Dateien | 120 | [Printables 1282906](https://www.printables.com/model/1282906-bc-250-scooper) |
| **Pitman case** | Konsole | Printables-Dateien | 120 | [Printables 1570248](https://www.printables.com/model/1570248-amd-bc-250-pitman-case) |
| **Industrial-style FlexATX** | Konsole | `amd_bc_250_industrial_style_case...zip` *(chat)* | 120 (kein Stock-Kühler) | [chat #144265](https://t.me/c/2424231195/144265) |
| **The Lanboy** | tragbare Arcade + 16″ eDP-Bildschirm | Printables-Dateien | 12 V ATX-Breakout | [Printables 1746364](https://www.printables.com/model/1746364) |
| **BC250 Vented Edition** (MaelremremDotXYZ) | FlexATX-Konsole, fins-open | MakerWorld-Dateien | 120 | [MakerWorld 2899020](https://makerworld.com/en/models/2899020) |
| **Stellar 250** (isaacalvex) | Konsole + Build-Guide (WiFi6, ESP32) | GitHub-Guide | 120 | [GitHub isaacalvex/...Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide) |
| **Simple Case for the ASRock AMD BC-250** | Konsole | MakerWorld-Dateien | 120 | [MakerWorld 2870270](https://makerworld.com/en/models/2870270) |
| **BC250-HUD** (Bloodyly) | interner Pi Zero 2-Statusbildschirm | GitHub-Quellen | — | [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD) |
| **Generic ITX mount** (majzok) | Adapter (jedes ITX-Gehäuse) | Printables/MakerWorld durchsuchen | — | "BC-250 ITX Mount" |
| **Thermalright AXP90/AXP120 mount** | Low-Profile-Kühler-Adapter | Printables-Dateien | Low-Profile-Tower | [Printables 1694793](https://www.printables.com/model/1694793) |
| **Twin-120 mount plate** | Adapterplatte | `Twin_120mm_Fan_Shroud.stl` *(chat)* | 2× 120 | [chat #121684](https://t.me/c/2424231195/121684) |
| **Fan shrouds (120/140)** | Shroud | `Fan_Shroud_Single_120mm.stl`, `_Dual_120mm`, `_Single_140mm`, `_120mm_Restricted` *(chat)* | 120 / 140 | [Printables 1339540](https://www.printables.com/model/1339540-yet-another-bc-250-fan-shroud) · siehe [Kühlung](04-cooling.md) |
| **AM4 cooler adapter** | Mount | `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` *(chat)* | Tower/AIO | [Printables 1042228](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount) |
| **Accurate board model** | Referenz-CAD | `bc-250-body.step` *(chat)* | — | [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) |

⭐ = die meisten Wert-Reaktionen / am häufigsten reposted in der Community.

### Weitere öffentliche Designs (aus elektricMs Katalog)

Benannte, herunterladbare Designs aus [elektricMs 143-Design-Katalog](https://elektricm.github.io/amd-bc250-docs/community/cases/), die oben nicht gelistet sind — gruppiert nach dem Netzteil, um das sie herum gebaut sind. Durchstöbere den vollständigen Katalog für Discord-only-/WIP-Builds und Thumbnails.

**MeanWell LOP (internes Netzteil):**

| Gehäuse / Teil | Bemerkenswert | Download |
|---|---|---|
| **Steamboat Case** (yannichaboyer) | LOP-300-Konsole | [MakerWorld 2431616](https://makerworld.com/en/models/2431616) |
| **Ultra-Thin Custom Case** (MrRoze) | schlanke LOP-300 | [Printables 1626501](https://www.printables.com/model/1626501) |
| **Internal PSU 2×140 mm** (Kacikor) | LOP-400, Twin 140 | [Printables 1599644](https://www.printables.com/model/1599644) · [MakerWorld 2400574](https://makerworld.com/en/models/2400574) |
| **Push-Pull Internal 12V PSU** (penzoiders) | Push-Pull | [MakerWorld 2505974](https://makerworld.com/en/models/2505974) |
| **Shell Case + 40 mm SSD fan** (Munkee915) | Shell-Remix, SSD-Kühlung | [Printables 1568074](https://www.printables.com/model/1568074) |
| **Noctua Push-Pull Mod** (Janjd) | Shell-Remix | [MakerWorld 2354123](https://makerworld.com/en/models/2354123) |

**MeanWell LRS/UHP (der andere verbreitete Server-Brick):**

| Gehäuse / Teil | Bemerkenswert | Download |
|---|---|---|
| **LRS-350-12 PSU Case** (TARGZ) | LRS-350-Box | [Printables 1543979](https://www.printables.com/model/1543979) |
| **BC250 slim case** (C4kew4lk) | UHP-350-12, schlank | [Printables 1504664](https://www.printables.com/model/1504664) |

**FlexATX — Arthrimus "Console Style"-Familie** (eine ganze Remix-Linie; die schlanke Konsole ist ein Community-Klassiker):

| Gehäuse / Teil | Bemerkenswert | Download |
|---|---|---|
| **Console Style Case v1** (Arthrimus) | das Original | [Thingiverse 7165679](https://www.thingiverse.com/thing:7165679) · [MakerWorld 2097988](https://makerworld.com/ko/models/2097988-bc250) |
| **Slim Console Style Case** (Arthrimus) | schlanke Variante | [Thingiverse 7172528](https://www.thingiverse.com/thing:7172528) |
| **Slim Console — double-fan mod** (TKXXTH) | Doppellüfter | [Thingiverse 7214884](https://www.thingiverse.com/thing:7214884) |
| **Slim Console — On/Off + Apevia** | Power-Schalter | [Thingiverse 7274042](https://www.thingiverse.com/thing:7274042) |

**FlexATX — sonstige:**

| Gehäuse / Teil | Bemerkenswert | Download |
|---|---|---|
| **Minimal Case (Toolless)** (chriszf) | keine Schrauben | [Printables 1423572](https://www.printables.com/model/1423572) |
| **Minimalist BC-250 Case** (SebastienGau/Gadget) | minimalistisch | [Printables 1581724](https://www.printables.com/model/1581724) |
| **ADT UT3G eGPU-Inspired** (R0mn) | eGPU-Look | [Printables 1539301](https://www.printables.com/model/1539301) |
| **"Steam Machine" by MrLarva** | Konsole | [Printables 1618501](https://www.printables.com/model/1618501) · [MakerWorld 2453965](https://makerworld.com/en/models/2453965) · [Thingiverse 7278235](https://www.thingiverse.com/thing:7278235) |
| **Steam Machine** (Pocket Adventures) | Konsole | [MakerWorld 2350219](https://makerworld.com/en/models/2350219) |
| **Steam Machine Slim Console** (MTSquar3D) | schlank + OC-vRAM-Lüfter-Kit | [MakerWorld 2232434](https://makerworld.com/en/models/2232434) · [Thingiverse 7271946](https://www.thingiverse.com/thing:7271946) |
| **ASRock Console Case** (songdawgdesigns) | Konsole | [Printables 1617023](https://www.printables.com/model/1617023) · [Cults3D](https://cults3d.com/en/3d-model/gadget/asrock-amd-bc-250-console-case-steamos-bazzite-diy-steam-machine-style-build) |
| **AMD BC250 Case** (vitamins) | Konsole | [MakerWorld 2219947](https://makerworld.com/en/models/2219947) |
| **E-waste Steam Machine** (Pesen333) | Salvage-Build | [Thingiverse 7245584](https://www.thingiverse.com/thing:7245584) |

**Full ATX:**

| Gehäuse / Teil | Bemerkenswert | Download |
|---|---|---|
| **Case for Standard ATX** (CatSiewDai) | ATX-Box | [Printables 1553599](https://www.printables.com/model/1553599) |
| **ATX + Fan Duct** (ZMASLO) | mit Luftkanal | [Printables 1616167](https://www.printables.com/model/1616167) |
| **Dual Fan ATX Case** (Mateo Fdez) | Doppellüfter | [Printables 1579658](https://www.printables.com/model/1579658) |
| **Simple Wooden Case** (suvalle55) | Holz + ATX | [Printables 1595794](https://www.printables.com/model/1595794) |
| **Open Frame + IKEA hack** (GreatApo) | offener Rahmen | [Thingiverse 7314188](https://www.thingiverse.com/thing:7314188) |
| **Case for ATX PSU** (matmiak) | ATX-Box | [Thingiverse 7303096](https://www.thingiverse.com/thing:7303096) |

**TFX / VESA / von der Stange:**

| Gehäuse / Teil | Bemerkenswert | Download |
|---|---|---|
| **Case Remix for TFX** (PlayNation) | TFX-400-Netzteil | [MakerWorld 2387157](https://makerworld.com/en/models/2387157) |
| **VESA 100/75 Basket** (Oleksii) | Montage hinter einem Monitor | [MakerWorld 1844470](https://makerworld.com/en/models/1844470) |
| **3.9L MKII FlexATX + PS5 fan** (FitFormSolutions) | fertiges Kit kaufen | [Etsy](https://www.etsy.com/listing/4405362103/) · [eBay](https://www.ebay.com/itm/127460591552) |
| **Shiny Snake S400** (10.8 L mesh ITX) | als-gut-bekannter Host von der Stange (BC-250→AM4-Mount + H60-AIO im Netzteilschacht + custom ATX-I/O-Blende) | [AliExpress](https://a.aliexpress.com/_EyQdoBU) |
| **SFX-PSU minimalist case** (Methsman) | volles SFX-Netzteil, Magnetpaneele, USB-Hub, AXP120 + Noctua 120 — *Dateien WIP / noch nicht veröffentlicht* | — |
| **Cults3D ATX/server line** (KABANCHYK, lumstudio, kapa3D) | bezahlte STLs | [Cults3D — bc-250](https://cults3d.com/en/3d-model/gadget/bc-250-atx-case) |

---

## Kein Drucker? Optionen, die Leute nutzen

- **Kauf einen Druck.** Verkäufer gibt es auf [Etsy](https://www.etsy.com/listing/1904632447/), eBay und OLX; Leute boten auch im Chat an, Gehäuse zu drucken/verkaufen ([src](https://t.me/c/2424231195/55507)).
- **Print-on-Demand:** lade eine STL zu einem Dienst hoch. Builder im Chat betreiben Druckfarmen (einer zeigt eine Wand aus Flsun/Creality/Bambu-Druckern, [src](https://t.me/c/2424231195/73481)).
- **Gar kein Gehäuse / Zweckentfremdung.** Viele betreiben das Board beim Testen auf einer offenen Werkbank. Andere weiden bestehende Hardware aus: ein alter All-in-One-PC mit eingepflanztem Board und einem Radialgebläse ([src](https://t.me/c/2424231195/30914)), eine Lüftungskanal-Box ([src](https://t.me/c/2424231195/64265)) oder Aluminium-Verstärkergehäuse (braucht Feilen/Bohren, [src](https://t.me/c/2424231195/108907)). Ein Mitglied versteckte das Board sogar als Scherz in einem alten VHS-Player ([src](https://t.me/c/2424231195/84106)). **Xbox One-Hülle** (JoeyDepDollas): weide eine kaputte Xbox One aus und baue einen kompletten BC-250-Build hinein — hält CPU & GPU unter **60 °C** unter Last; kaputte Spender-Konsolen kosten **~$15 versandt** auf eBay und liefern wiederverwendbare Teile.
- **Lasergeschnittenes Sperrholz** (ContributionRich3242): nicht 3D-gedruckt — kerbgebogenes Sperrholz um die Ecken mit einer großen hinteren Fläche für zusätzliche Kühlung, erreicht **75 °C bei 40 CU** (1800 MHz, CPU 3,9 GHz) und flüsterleise. (Laser-Dateien wurden nicht veröffentlicht.) Seine **Backplate-Kühltechnik** ist auf jedem Gehäuse wiederverwendbar: Wärmeleitknete Chip→Backplate, Paste Backplate→hintere Kühler und sichere die hinteren Kühler mit straffen R-Splinten in der VRM-Lücke + Kapton-Band (~20 °C kühler bei 40 CU).

> Ein nacktes, gut gekühltes Board übertrifft eine versiegelte hübsche Box mit schlechtem Luftstrom. Bring zuerst die [Kühlung](04-cooling.md) in Ordnung; das Gehäuse ist der zweite Schritt.

---

## Quellen

- Kuratierte **#BC250body**-Schau (ein guter Build pro Tag) — angepinnte Idee [src](https://t.me/c/2424231195/79685)
- Minimale Sleeve, zwei Varianten — [src](https://t.me/c/2424231195/10743) · Modelle auf [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) [src](https://t.me/c/2424231195/18260)
- Shell Case (❤33) — [src](https://t.me/c/2424231195/22771) · kostenlos auf Printables/MakerWorld [src](https://t.me/c/2424231195/24505) · STL-Schwung [src](https://t.me/c/2424231195/81680)
- "Просто лучший корпус" + BOM — [src](https://t.me/c/2424231195/79990) · Dateien [src](https://t.me/c/2424231195/79989)
- Acryl-Offenrahmen — [src](https://t.me/c/2424231195/114651) · [Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/)
- Twin-120-Montageplatte, 2200 MHz @ 80 °C — [src](https://t.me/c/2424231195/120606) · Shroud [src](https://t.me/c/2424231195/121684)
- Konsolen-Designs (Fotos) — Гослинг/Bazzite [src](https://t.me/c/2424231195/66616) · Jhonatan Labyrinth-Paneel [src](https://t.me/c/2424231195/121274) · Joglik Gitter-Mesh [src](https://t.me/c/2424231195/126525) · a m Oval-Fenster [src](https://t.me/c/2424231195/52955) · Spyrydonov v15 [src](https://t.me/c/2424231195/135995)
- NexGen3D Steam Machine-Familie — [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) · [Redux + Pi-Bildschirm (Reddit)](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)
- Board-Referenzmodell — [src](https://t.me/c/2424231195/55496) · [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)
- GitHub-Gehäuse-Repos — [onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) · [rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure)
- **elektricM voller Gehäuse-Katalog (~143 Designs, durchsuchbar/filterbar)** — [elektricm.github.io/amd-bc250-docs/community/cases](https://elektricm.github.io/amd-bc250-docs/community/cases/)
- Simple Case (MakerWorld 2870270) + ukrainischer Build-Walkthrough — [MakerWorld 2870270](https://makerworld.com/en/models/2870270) · [Old Lamer (YouTube)](https://youtu.be/p5Zd86vFe8w)
- CMOS-Clear-Zugangsloch-Lifehack — [4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980)
- "Steam Machine Pro" wassergekühlter Build-BOM (TEUCER AF 240, Mean Well LOP-600-12, Arctic P12 Pro/P8, ESP32-Relais, OpenLinkHub/Commander Duo) — [Old Lamer (YouTube)](https://youtu.be/afYhUQFa-AY)

> Lüfter-Shroud-STLs werden mit [Kühlung](04-cooling.md) geteilt. Alle chat-gehosteten STL/STEP/3MF-Dateien sind unter `assets/stl/` gespiegelt.
