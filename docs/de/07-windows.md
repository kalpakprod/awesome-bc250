> 🌐 Community-Übersetzung. Die englische Version ist die maßgebliche Quelle und kann aktueller sein. Fehler gefunden? Öffne ein [Issue](https://github.com/lildebil0/awesome-bc250/issues). ([englisches Original](../en/07-windows.md))

# Windows-Treiber & Einrichtung

> **TL;DR** — Stand **Anfang 2026 gibt es keinen funktionierenden Windows-GPU-Treiber für die BC-250.** Windows installiert und bootet, aber die GPU bleibt mit **Code 43** und null 3D-Beschleunigung stehen — jeder Standard-AMD-Treiber (Adrenalin, Pro, der W5700-`.inf`-Trick) wird von der Hardware abgelehnt. Die Community **entwickelt einen von Grund auf neu durch Reverse-Engineering**, und der ehrliche Stand ist: „frühe Grundverdrahtung funktioniert, nichts rendert bisher Spiele." Wenn du dieses Board heute tatsächlich *benutzen* willst, **installiere Linux** ([06-linux.md](06-linux.md)) — dort lebt der funktionierende Treiber. Behandle alles auf dieser Seite mit Skepsis und prüfe die Commit-Daten des Repos, bevor du dich darauf verlässt.

Das langjährige Urteil der Community, seit 2025 für Neueinsteiger angepinnt: *„Lasst alle Hoffnung fahren, die ihr hier eintretet. Windows-Treiber wird es mit 99,5 % Wahrscheinlichkeit nicht geben. Ohne Treiber ist dieses Board fast völlig nutzlos. Der Linux-Treiber existiert — wenn du für dieses Betriebssystem nicht bereit bist, brauchst du dieses Board nicht."* ([src](https://t.me/c/2424231195/28109))

Das war über ein Jahr lang der Konsens. Er wird 2026 **endlich infrage gestellt** — aber langsam, und die ehrliche Antwort lautet immer noch: noch nicht.

---

## Warum Windows hier schwierig ist (die Code-43-Mauer)

Die BC-250-APU („Cyan Skillfish" / Oberon, GFX10.1.3) meldet sich beim Betriebssystem als **unbekanntes Gerät** — PCI-ID `1002:13FE` —, das kein ausgelieferter AMD-Treiber erkennt. Man hat alles versucht:

- **Eine offizielle `.inf` dem Geräte-Manager aufzwingen**: Der einzige Treiber, den Windows als „kompatibel" anbietet, ist die **Radeon Pro W5700**. Sie installiert sich, hängt sich dann bei **Error 43** auf, genau wie jeder andere ausprobierte Treiber. ([src](https://t.me/c/2424231195/57123))
- **Die `.inf` bearbeiten / Geräte-IDs tauschen** (gfx1013, 1014, Navi 21/22/23 „Dragonball", Legacy-Einträge), die Treibersignatur-Erzwingung deaktivieren, sogar Windows 10 vom USB-Stick booten und einen Steam-Deck-Treiber ausprobieren — **alles Sackgassen**. Die Legacy-Einträge erscheinen nur wegen eines Anzeigefehlers ohne Fehlermeldung, nicht weil sie funktionieren. ([src](https://t.me/c/2424231195/94029))
- **Das BIOS modden**, um die Geräte-ID zu ändern, half auch nicht — die iGPU meldet weiterhin `1002:13FE`. Die Dev-ID scheint **fest mit der APU verschweißt** zu sein, nicht nur mit dem BIOS, daher reicht das Patchen einer einzigen Stelle nicht aus. ([src](https://t.me/c/2424231195/57123))

Warum funktioniert Linux und Windows nicht? Unter Linux wurde der quelloffene **amdgpu/Mesa**-Stack von der Community gepatcht (und teilweise upstream übernommen), um genau diesen Chip zu erkennen; unter Windows gibt es keinen offenen Treiber zum Patchen — AMD hat nie einen Windows-Treiber für dieses Mining-/Server-Teil ausgeliefert, und der geschlossene Adrenalin-/Pro-Stack verweigert die unbekannte ID. ([src](https://t.me/c/2424231195/13210)) AMDs eigener Forum-Thread zu „BC-250-Treibern" führte zu nichts. ([community.amd.com](https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692))

> **Es gibt auch keinen Notausgang über GPU-Passthrough.** Windows in einer VM mit durchgereichter BC-250 zu betreiben funktioniert nicht: Der IOMMU-Passthrough-Pfad ist auf diesem Board kaputt, und es ist eine *APU* (keine dedizierte Karte, die der Host sauber übergeben kann), und der Chip wird ohnehin von vornherein als unbekanntes Gerät fehlerkannt. ([src](https://t.me/c/2424231195/64772))

---

## Aktueller Treiberstatus — was tatsächlich existiert (Stand Anfang 2026)

Ende 2025 hörte die Community auf, auf AMD zu warten, und begann, einen **Windows-Treiber von Grund auf neu zu bauen**, indem sie die Hardware per Reverse-Engineering erforschte. Zwei Bemühungen sind relevant; beide sind **experimentell, WIP und rendern noch keine Spiele.**

### Keshas-dev — der von Grund auf neue WDDM-Treiber (am aktivsten)

Ein Paar zusammengehöriger Kernelmodus-Treiber, die aktivste Windows-Bemühung (der **PSP-Treiber allein hat zum Zeitpunkt dieses Schreibens ~56 Commits**):

- **[Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver)** — ein Low-Level-Treiber für den **PSP** (Platform Security Processor). **Was funktioniert:** Er lädt, bootet die **SOS-Firmware**, liest/schreibt Hardware-Register über BAR5-MMIO (GC-, MMHUB-, HDP-, NBIO-, DF-Blöcke), führt das NBIO-Unlock durch und fungiert als Register-Proxy für den GPU-Treiber. **Was nicht funktioniert:** GPCOM-Ring-Erstellung (die SOS-Firmware unterstützt das TOS-Ring-Protokoll nicht), GPU-Firmware-Laden über Ringpuffer und Trusted-Memory-Region-Init. Mit anderen Worten: Er kann mit dem Chip reden, aber **kann die Grafik-Engine noch nicht hochfahren.** ([repo](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver/commits/main/))
- **[Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver)** — der zugehörige GPU-Treiber. Teilt sich dieselbe Zertifikats-/Test-Signing-Infrastruktur mit dem PSP-Treiber und nutzt ihn als Register-Brücke. Noch früh; keine nutzbare 3D-Ausgabe. ([repo](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver/commits/main/))

Das erste öffentliche Lebenszeichen war ein Mitglied, das im Oktober 2025 **„mein erster funktionierender Treiber (OpenGL 1.1)"** meldete ([src](https://t.me/c/2424231195/83320)) — gefeiert gerade deshalb, weil schon ein kaum funktionsfähiger Treiber, der sich *installiert und läuft*, nach einem Jahr Code 43 ein echter Meilenstein war: *„wenn dieser Treiber wirklich installiert ist und funktioniert (auch wenn schlecht) — das ist ein riesiger Schritt."* ([src](https://t.me/c/2424231195/83332)) Ein Treiber-Dump aus dieser Welle, `AMD Radeon BC-250 (Cyan Skillfish) driver 00.00.01.7z`, wurde im Chat geteilt/angepinnt. ([src](https://t.me/c/2424231195/83322)) **Behandle jeden solchen frühen Dump als experimentell — Version `00.00.01` ist genau so roh, wie es klingt.**

### ZEROAESQUERDA — die WDDM-2.0-Referenzimplementierung

**[ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest)** — eine separate Bemühung („der Portugiese hat etwas angefangen"), im März 2026 im Chat angepinnt als Zeichen, dass das Eis bricht. ([src](https://t.me/c/2424231195/123644)) Sie versteht sich am besten als **Referenz-/Lern-WDDM-2.0-Implementierung**, nicht als nutzbarer Treiber:

- Implementiert nur das **Direct3D-9-DDI**; **D3D11, D3D12 und Vulkan sind nicht implementiert.**
- **Shader-Kompilierung für RDNA2 (GFX10.1-ISA) ist nicht funktionsfähig** — sie nimmt Shader-Übermittlungen an, kann sie aber nicht für die tatsächliche Hardware kompilieren, sodass nichts rendert.
- Lädt den Command-Processor-Microcode **nicht** (verlässt sich auf BIOS-geladene Firmware); **VCN-Video-Encode/-Decode nicht unterstützt**; nur ein einzelner DisplayPort-Ausgang.
- Erfordert **Test-Signing-Modus** (keine WHQL-Signatur). Nur ~2 Commits auf main.

Sieh dir den eigenen Abschnitt **[Known Limitations](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas)** des Projekts an, bevor du Zeit darauf verwendest.

> ⚠ **Korrektur zur Repo-Benennung.** Die Haupt-Repo-Liste verweist unter „Drivers → Windows" auf `ZEROAESQUERDA/PS5GPU-BC250`. Bei näherer Betrachtung ist dieses Repo ein **Linux-GPU-Governor** (ein Oberon-Governor-Fork mit GUI), **kein** Windows-Treiber. Der eigentliche Windows-Code dieses Autors ist **`BC250-windowsDriverTest`**.

### Status auf einen Blick

| Projekt | Typ | Was funktioniert | Was nicht | Heute nutzbar? |
|---|---|---|---|---|
| Keshas-dev/AMD-BC-250-PSP-Driver | PSP-Kerneltreiber (WIP) | Bootet SOS-Firmware, BAR5-Register-R/W, NBIO-Unlock, Register-Proxy | GPU-Ring-Erstellung, FW-Laden, TMR-Init | Nein — nur Grundverdrahtung |
| Keshas-dev/AMD-BC-250-Windows-Driver | GPU-Treiber (WIP) | Lädt neben dem PSP-Treiber | Kein nutzbares 3D | Nein |
| ZEROAESQUERDA/BC250-windowsDriverTest | WDDM-2.0-Referenz | Treibermodell-Gerüst, D3D9-DDI vorhanden | Shader-Kompilierung, D3D11/12, Vulkan, VCN | Nein — lehrreich |
| Adrenalin / Pro / W5700-`.inf` | Offiziell AMD | — | **Code 43**, nichts | Nein |

**Fazit:** Niemand spielt heute Spiele unter Windows auf einer BC-250. Die Arbeit ist real und beschleunigt sich, aber sie ist im Stadium „können wir die GPU überhaupt initialisieren", nicht im Stadium „wie hoch sind meine Cyberpunk-FPS".

---

## Wenn du die WIP-Treiber trotzdem ausprobieren willst

Das ist für Bastler, die beim **Testen helfen** wollen, nicht um einen funktionierenden Desktop zu bekommen. Du brauchst:

- **Windows 10 (Build 1607+) oder Windows 11, x64.**
- **Test-Signing aktiviert** und **Secure Boot deaktiviert** (diese Treiber sind unsigniert/test-signiert):
  ```
  bcdedit /set testsigning on
  ```
  Neu starten. ⚠ prüfen — die genauen Schritte folgen dem README jedes Repos; die Befehle hier sind der Standard-WDK-Test-Sign-Ablauf, nicht aus einem Projektskript kopiert.
- Installation über das vom Repo bereitgestellte **PowerShell-Skript** (z. B. `Install-Driver.ps1`) oder manuell mit `pnputil`. Folge dem **Repo-README**, nicht dieser Seite — diese Projekte ändern sich schnell, und die Installationsschritte ändern sich mit ihnen.

Erwarte: bestenfalls wird das Gerät aufgezählt und frühe Init-Logs erscheinen; schlimmstenfalls ändert sich nichts oder du bekommst einen anderen Fehlercode. **Sichere alles, was dir wichtig ist, und geh davon aus, dass es nicht rendert.**

### ⚠ Unbestätigtes Gerücht: „durch das Leaken von Treibern wird das Board gebrickt"

Während der frühen Beta-Test-Phase Anfang 2025 warnte ein Mitglied, dass **BC-250s aus der Ferne gebrickt würden, weil Vorab-Treiber geleakt wurden** — mit der Behauptung von Reddit-Berichten über Bricking, Remote-Gerätesperren und dass selbst ein Hardware-Programmer sie nicht entsperren könne. ([src](https://t.me/c/2424231195/26231)) **Wir konnten das nicht verifizieren**, und die ganze „Private-Beta"-Einrahmung darum ist zweifelhaft (siehe nächster Abschnitt). Der Vollständigkeit halber erwähnt; behandle es nicht als feststehende Tatsache. Wenn du ein Board aus anderen Gründen brickst, siehe [08-bios.md](08-bios.md) für die Wiederherstellung.

---

## Hoaxes, Scherze & Sackgassen — fall nicht darauf herein

Der Windows-Treiber-Hype um die BC-250 hat eine lange Geschichte von **Streichen und Wunschdenken**. Kenne die berühmten, damit du kein Wochenende verschwendest:

- **Der „NVIDIA-Treiber für AMD BC-250".** Ein **Aprilscherz (1. April 2026)** — ein schicker gefälschter „NVIDIA NEW DRIVER RELEASE … for AMD BC-250"-Banner, der kurzzeitig Leute fragen ließ: *„hat NVIDIA wirklich einen BC-250-Windows-Treiber veröffentlicht?!"* ([src](https://t.me/c/2424231195/130053)) Hat es nicht. NVIDIA macht keine Treiber für eine AMD-APU. Die Reaktion im Chat war: *„der lang erwartete Scherz ist da."* ([src](https://t.me/c/2424231195/130727)) Beachte auch, dass eine `.exe` mit einem Namen wie `whql-amd-software-adrenalin-edition-25.5.1-...-bc250.exe` herumschwirrte — ein normaler Adrenalin-Installer mit angehängtem „bc250" im Dateinamen macht ihn **nicht** zu einem BC-250-Treiber. ([src](https://t.me/c/2424231195/73924))
- **„Erzwing einfach den Treiber einer ähnlichen Karte."** RX 6700 / W5700 / Radeon Pro V340 — die erste Idee jedes Neulings, und sie ist *„jedem Narren gekommen, der je eine BC-250 in der Hand hatte."* Es kann aus einem Haufen Gründen nicht funktionieren, die sich nicht erneut herzuleiten lohnen: **es gibt keine Windows-Treiber, keine Ehre und kein Bier auf der BC-250.** ([src](https://t.me/c/2424231195/29710))
- **Malware im Kanal.** Leute haben gefälschte „Treiber" gepostet, die Viren/Zip-Bomben/Phisher waren. Mods bannen sofort; einmal tauchte eine Datei mit dem buchstäblichen Namen `Trojan.txt` auf. ([src](https://t.me/c/2424231195/49668)) **Führe nur Binärdateien aus den genannten GitHub-Repos aus und lies den Code.**

---

## Was ist mit dem 40-CU-Unlock-Skript, das Leute erwähnen?

`git clone https://github.com/duggasco/bc250-40cu-unlock.git` taucht im Windows-Themen-Geplauder auf, und die Master-Ressourcenliste verschlagwortet es sogar unter „Windows". **Es ist ein Linux-`amdgpu`-Kernel-Patch / -Skript** (`bc250-enable-40cu.sh`), kein Windows-Tool — es schaltet alle 40 CUs auf dem Linux-Treiber frei. Es wird ordnungsgemäß in [09-overclock-undervolt.md](09-overclock-undervolt.md) behandelt; für Windows tut es nichts. ⚠ prüfen (keine Shell-Historie im Command-Korpus bestätigt eine Windows-Nutzung; der eine erfasste Befehl ist das schlichte `git clone` oben).

---

## Empfehlung

| Du willst… | Tu das |
|---|---|
| Spiele spielen / das Board jetzt tatsächlich nutzen | **Installiere Linux.** Siehe [06-linux.md](06-linux.md). Der funktionierende GPU-Treiber existiert nur dort. |
| Der Windows-Bemühung folgen / dazu beitragen | Beobachte **Keshas-dev** (PSP- + GPU-Treiber) und **ZEROAESQUERDA/BC250-windowsDriverTest**; erwarte Kernel-/WDK-Arbeit, kein Gaming. |
| Eine magische `.inf` oder einen „ähnliche Karte"-Treiber | Den gibt es nicht. Hör hier auf — du wirst nur auf Code 43 stoßen. |

Windows-Unterstützung ist ein **bewegliches Ziel**: Prüfe die Commit-Daten des Repos und das Datum dieses Abschnitts erneut (dieser spiegelt **Anfang 2026** wider), bevor du handelst. Das Urteil von 2025 war „niemals"; 2026 stufte das auf „noch nicht" herab — echter Fortschritt, aber Fortschritt auf der Firmware-Init-Ebene, nicht auf der spielbaren-Desktop-Ebene.

---

## Quellen

- Angepinnte Neulings-Warnung („lasst alle Hoffnung fahren") — https://t.me/c/2424231195/28109
- Code 43 / W5700-`.inf` / BIOS-Mod-Versuche — https://t.me/c/2424231195/57123 · https://t.me/c/2424231195/94029
- „Keine Windows-Treiber, keine Ehre, kein Bier" — https://t.me/c/2424231195/29710 · warum Linux, nicht Windows — https://t.me/c/2424231195/13210
- VM-Passthrough funktioniert nicht — https://t.me/c/2424231195/64772
- Erster „funktionierender" Treiber (OpenGL 1.1) & Reaktion — https://t.me/c/2424231195/83320 · https://t.me/c/2424231195/83332 · Treiber-Dump `00.00.01` — https://t.me/c/2424231195/83322
- ZEROAESQUERDA-Projekt angepinnt / „Eis bricht" — https://t.me/c/2424231195/123644
- Aprilscherz „NVIDIA-Treiber" — https://t.me/c/2424231195/130053 · https://t.me/c/2424231195/130727 · falsch beschriftete Adrenalin-`.exe` — https://t.me/c/2424231195/73924
- Malware-Bann-Politik — https://t.me/c/2424231195/49668 · Brick-beim-Leaken-Gerücht (unbestätigt) — https://t.me/c/2424231195/26231
- Repos — [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) · [Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver) · [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) ([bekannte Einschränkungen](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas))
- AMD-Forum-Thread (führte zu nichts) — https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692
- 40-CU-Unlock (Linux, fälschlich als Windows verschlagwortet) — https://github.com/duggasco/bc250-40cu-unlock → siehe [09-overclock-undervolt.md](09-overclock-undervolt.md)

> Das 40-CU-Unlock, der Governor und die Linux-Treiber-Einrichtung leben in [06-linux.md](06-linux.md) und [09-overclock-undervolt.md](09-overclock-undervolt.md). Brick-Wiederherstellung: [08-bios.md](08-bios.md).
