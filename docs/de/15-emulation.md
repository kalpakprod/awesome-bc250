> 🌐 Community-Übersetzung. Die englische Version ist die maßgebliche Quelle und kann aktueller sein. Fehler gefunden? Öffne ein [Issue](https://github.com/lildebil0/awesome-bc250/issues). ([englisches Original](../en/15-emulation.md))

# Emulation

> **TL;DR** — Die BC-250 ist eine überraschend gute Emulations-Kiste, weil sie eine GPU der PS5-Klasse (RDNA2) mit 16 GB schnellem GDDR6 paart — aber Emulation ist **stark CPU-bound**, und der abgespeckte **6-Kern-Zen 2** bei ~3,5 GHz ist die Decke für die anspruchsvollen Systeme. **Alles bis einschließlich PS2 / GameCube / Wii / PSP / Dreamcast ist die komfortable Zone** (Retro ist trivial; PSP ist chat-bestätigt mit 4× interner Auflösung). **Switch / PS3 / PS4 sind anspruchsvoll und Glückssache**, und **Xbox 360 bootet kaum**. Auf dem Board chat-erprobt: **Switch über Eden** „funktioniert gut und schnell", **PS3 über RPCS3** funktioniert mit Pro-Spiel-Tuning, **PS4 über shadPS4** läuft Bloodborne gut, **PSP über PPSSPP** läuft super, und **Xbox 360 über Xenia** ist im Spiel kaputt. **Übertakte und kühle das Board zuerst** — ohne Governor sitzt die GPU bei ~1000 MHz innerhalb eines Emulators und erstickt. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/130879))

Diese Seite ist die tiefe Auseinandersetzung; [11-gaming.md](11-gaming.md) hat die Kurzfassung innerhalb seiner Ergebnistabelle. ROMs/Keys/BIOS sind dein Problem zur legalen Beschaffung — nichts davon wird hier abgedeckt.

> **Wie die Status-Spalte zu lesen ist.** Dieses Board wurde uneinheitlich diskutiert: Eine Handvoll Systeme wurde zuerst im Chat aus erster Hand getestet, die meisten Retro-Systeme nicht. Also ist jede Zeile getaggt:
> - **✅ / ⚠️ / ❌ (Chat)** — ein Mitglied fuhr es *auf einer BC-250* und berichtete das Ergebnis, mit zitierter Nachricht.
> - **(allgemein ⚠)** — der **bekannteste Linux-Emulator und die allgemeine Erwartung für diese Hardware-Klasse** (Zen 2 + RDNA2). **Nicht BC-250-getestet.** Behandle es als „sollte in Ordnung sein / sollte schwer sein", niemals als gemessenes Versprechen. Nirgendwo auf dieser Seite werden BC-250-spezifische FPS-Zahlen erfunden.

---

## Mach diese zwei Dinge, bevor du irgendetwas emulierst

Emulation verstärkt beide Eigenheiten des Boards, also sind die Voraussetzungen hier wichtiger als im normalen Gaming:

1. **Erst übertakten.** Ein Mitglied, das Switch-Emulation auf einem Standard-Board versuchte, fand die GPU bei **1000 MHz innerhalb des Emulators** festgenagelt, obwohl normale Spiele anständig takteten — der Fix war, den Governor manuell vor dem Start auf seinen Maximaltakt zu setzen. ([src](https://t.me/c/2424231195/130879)) Fahr den **oberon-governor** bei **2000 MHz** (und erwäge den CPU-OC auf 4 GHz), gemäß [09-overclock-undervolt.md](09-overclock-undervolt.md) — Emulation braucht jedes Megahertz, das die CPU geben kann.
2. **Erst kühlen.** 2000 MHz brauchen die Kühlungs-Mod, sonst drosselt/resettet das Board. Mach [04-cooling.md](04-cooling.md), bevor du den Overclock jagst.

> **Warum CPU-bound hier so sehr zählt.** Eine Spiel-Engine ist auf die Hardware abgestimmt, auf der sie ausgeliefert wird; ein Emulator hingegen *simuliert* die CPU einer anderen Konsole auf deiner, was pro Frame weit schwerer ist. Auf der BC-250 sind die **6 Zen-2-Kerne bei ~3,5 GHz** ([Hardware-Spezifikation](https://elektricm.github.io/amd-bc250-docs/hardware/specifications/)) der Limiter für Switch/PS3/PS4 — die GPU der PS5-Klasse hat meist Spielraum übrig. Ein Mitglied, das bessere Switch-Performance jagte, sah genau das: Im Spiel **sitzt die GPU stark unausgelastet, während die CPU die Mauer ist**. ([src](https://t.me/c/2424231195/136712)) Mehr Kerne helfen dem heißen Thread eines Emulators nicht; Taktrate und IPC tun es. Das ist derselbe CPU-Engpass, der in [11-gaming.md](11-gaming.md) beschrieben wird, nur schärfer.

---

## Erste Schritte — drei Wege zur Installation

Dieses Board hat keine emulationsspezifischen Eigenheiten über die zwei Voraussetzungen oben hinaus — es ist für die Emulatoren ein normaler Linux-PC. Wähl eines von:

- **EmuDeck** — der schnellste Weg, ein vollständiges Multi-System-Setup in einem Rutsch zu bekommen. Es lädt den gesamten Standalone-Stack herunter und konfiguriert ihn vor (RetroArch, PCSX2, Dolphin, DuckStation, PPSSPP, melonDS, Ryujinx, …), richtet Controller ein und wurde auf dem Board als funktionierend bestätigt („das Ryujinx, das mit EmuDeck kommt, ist auch gut"). ([src](https://t.me/c/2424231195/99039)) Es zielt auf Steam Deck / Linux, was zur typischen Bazzite/CachyOS/Arch-Installation der BC-250 passt ([06-linux.md](06-linux.md)). **RetroDECK** (ein Flatpak-eingeschlossenes Äquivalent) ist dieselbe Idee, falls du eine sandboxed App bevorzugst.
- **RetroArch** — ein Front-End, viele „Cores" (Emulatoren-als-Plugins). Ideal für alles 8/16/32-Bit bis PS1/N64/DS — einmal installieren, die Cores unten hinzufügen, auf deine ROMs zeigen. Als Flatpak auf jeder BC-250-Distro verfügbar.
- **Standalone-Emulatoren** — für die schweren Systeme (Switch, PS3, PS4, PS2, GameCube/Wii, Xbox) schlägt die dedizierte Standalone-App den RetroArch-Core bei Features und Kompatibilität. **Installiere den nativen Linux-Build**, wo du kannst — frühe BC-250-Tests zeigten, dass native Builds (Ryujinx) sich besser verhielten als durch Proton gefahrene Windows-Builds. ([src](https://t.me/c/2424231195/23577)) Die meisten sind auf Flathub oder im Arch AUR (z. B. `paru -S cemu`). ([src](https://t.me/c/2424231195/74138))

Dann **über Steam starten** („ein Nicht-Steam-Spiel hinzufügen") für Controller-Unterstützung und ein Overlay — derselbe Ablauf, den der Chat für alles andere nutzt (siehe [11-gaming.md](11-gaming.md)).

> **Lieber eine dedizierte Emulations-Distro?** **Batocera** (eine fertige Emulations-Distro + Frontend) ist **community-bestätigt auf der BC-250 laufend** ([r/linux_gaming-Community-Thread](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)) — boote sie statt eines Desktop-Linux, und du bekommst eine konsolenartige, Plug-and-Play-Emulations-Kiste, statt Emulatoren einen nach dem anderen zu installieren. Sie ist als bestätigt-bootende Distro in [06-linux.md](06-linux.md) gelistet. Dieselben Overclock-+-Kühlungs-Voraussetzungen gelten weiterhin.

> **Achte auf den Governor.** Wenn ein Emulator langsam läuft, prüf deine Takte, bevor du den Emulator beschuldigst: Er sitzt vielleicht bei 1000 MHz. Setz den oberon-governor auf seinen Maximalwert (manche fahren ihn festgenagelt bei ~2250 MHz), bevor du startest, dann verifiziere mit einem Overlay (`amdgpu_top` / MangoHud). ([src](https://t.me/c/2424231195/130879), [src](https://t.me/c/2424231195/130955))

> **Kein vorkonfiguriertes Emulations-Image.** Einsteiger fragen regelmäßig nach einem fertigen Image mit eingerichteten Emulatoren. Die Community behandelt ein geteiltes „konfiguriertes BC-250-Image" als Tabu — richte es selbst aus den Guides ein; es ist nicht schwer, sobald das Board übertaktet ist. ([src](https://t.me/c/2424231195/130845), [src](https://t.me/c/2424231195/130877))

---

## Was die Community tatsächlich fuhr

Der einzelne nützlichste Datenpunkt ist der Rundumschlag eines Mitglieds nach dem Testen mehrerer Emulatoren auf dem Board ([src](https://t.me/c/2424231195/78988)):

- **Switch (Eden)** — „funktioniert gut und schnell".
- **PS3 (RPCS3)** — funktioniert, aber „braucht individuelles Tuning von Spiel zu Spiel".
- **PS4 (shadPS4 0.9.0)** — Bloodborne läuft gut ohne Drops; The Last Guardian fing an zu artefakten, hielt aber eine stabile Bildrate.
- **Xbox 360 (Xenia Canary)** — Spielmenüs starten, aber das Gameplay fällt auf einen schwarzen Bildschirm (es reagiert noch auf das Gamepad); ungelöst.

Mehr Bestätigungen aus erster Hand:

- **Switch / Eden ist der Konsens-Pick.** Als ein Einsteiger fragte, welchen Switch-Emulator er nehmen soll, war die Antwort schroff: **„Eden ist der anständigste."** ([src](https://t.me/c/2424231195/130842)) Andere bestätigten, dass **Eden sich installiert und einwandfrei funktioniert** ([src](https://t.me/c/2424231195/98942)), und dass **Eden super funktioniert und das Ryujinx, das mit EmuDeck kommt, auch gut ist.** ([src](https://t.me/c/2424231195/99039)) Schwere First-Party-Titel belasten die CPU weiterhin: Ein Mitglied, das **Tears of the Kingdom auf Eden (mit NX Optimizer) spielte, berichtete Frame-Drops**. ([src](https://t.me/c/2424231195/124216))
- **PS4 / shadPS4** — ein Mitglied **verkaufte seine physische PS4 und spielt Bloodborne jetzt auf der BC-250 über shadPS4 erneut durch** und sagt, es „startet in 2 Klicks". ([src](https://t.me/c/2424231195/38704), [src](https://t.me/c/2424231195/38706)) Ein anderer bestätigte, dass **Drive Club zu 100 % läuft** auf shadPS4. ([src](https://t.me/c/2424231195/82128))
- **PS3 / RPCS3** — über den Rundumschlag hinaus berichteten Mitglieder **Uncharted mit „stabiler Bildrate, spielbar"** ([src](https://t.me/c/2424231195/74644)) und ein schlichtes **„funktioniert super in RPCS3."** ([src](https://t.me/c/2424231195/53601))
- **PSP / PPSSPP** — wiederholt aus erster Hand gefahren und gelobt: Ein Mitglied fuhr **PPSSPP mit 4× interner Auflösung** ohne thermisches Throttling auf dem Board. ([src](https://t.me/c/2424231195/101579), [src](https://t.me/c/2424231195/103218), [src](https://t.me/c/2424231195/111096))

### Eine Notiz zur Switch-Emulator-Historie (Yuzu → Eden / Ryubing)

Die Switch-Emulation auf dem Board durchlief denselben Umbruch wie überall sonst. Eine frühe Momentaufnahme fand **Yuzu und Suyu beim Start hängend**, während **Ryujinx funktionierte** (native Builds). ([src](https://t.me/c/2424231195/23577)) Yuzu wurde 2024 von Nintendo eingestellt und seine Nachfolger tragen die Fackel: **Eden** (ein Yuzu-Fork) ist der BC-250-Community-Pick, der „gut und schnell funktioniert", und die **Ryujinx**-Linie lebt als Community-**Ryubing**-Fork weiter, der 2026 aktiv weiterentwickelt wird. Beachte, dass Nintendo Switch-Emulatoren aggressiv beklagt und Keys/Download-Links entfernt — im Feb 2026 DMCA'te es Eden zusammen mit einem Dutzend anderer Forks, also erwarte, sowohl nach Binaries als auch nach Keys suchen zu müssen. ([src](https://t.me/c/2424231195/136649))

---

## Vollständige Kompatibilitätstabelle — jede Plattform

Eine Zeile pro Plattform. **Emulator** ist die beste aktuelle Linux-Wahl; **Status auf BC-250** ist chat-zitiert, wo ein Mitglied es getestet hat, sonst die allgemeine Erwartung für Zen-2-+-RDNA2-Hardware (getaggt `allgemein ⚠`, **nicht BC-250-gemessen**).

### Nintendo

| System | Bester Linux-Emulator | Status auf BC-250 | Anmerkungen |
|--------|--------------------|------------------|-------|
| **NES / Famicom** | Mesen (oder FCEUmm) — RetroArch-Core | ✅ Trivial (allgemein ⚠) | 8-Bit; jede Kartoffel fährt es. Kein BC-250-Bericht nötig. |
| **SNES** | Snes9x (bsnes für Genauigkeit) — RetroArch | ✅ Trivial (allgemein ⚠) | Snes9x ist schnell & ~99 % kompatibel; bsnes, wenn du Zyklus-Genauigkeit willst. |
| **Game Boy / GBC** | SameBoy / Gambatte — RetroArch | ✅ Trivial (allgemein ⚠) | SameBoy ist der Genauigkeits-Pick. |
| **GBA** | mGBA (Standalone oder RetroArch) | ✅ Trivial (allgemein ⚠) | mGBA ist der Goldstandard. |
| **N64** | simple64 / RMG (mupen64plus); RetroArch-Core | ✅ Easy (allgemein ⚠) | simple64 ist archiviert; sein Entwickler wechselte zu **gopher64** (Rust). Entweder RMG oder gopher64 ist in Ordnung. Komfortabel auf dieser CPU. |
| **DS** | melonDS (Standalone oder RetroArch) | ✅ Easy (allgemein ⚠) | melonDS löste DeSmuME längst ab. |
| **3DS** | **Azahar** (Citra/Lime3DS-Merge) | ✅ Sollte easy sein (allgemein ⚠) | Citra wurde DMCA'd; **Azahar** ist der gepflegte Nachfolger. Komfortabel für diese Hardware. |
| **GameCube** | **Dolphin** | ✅ Sollte super laufen (allgemein ⚠) | Dolphin ist reif & Vulkan-beschleunigt. Im Chat erwähnt (Multi-Window/CLI), aber keine FPS aus erster Hand gepostet — als easy behandeln, nicht gemessen. ([src](https://t.me/c/2424231195/19715)) |
| **Wii** | **Dolphin** | ✅ Sollte gut laufen (allgemein ⚠) | Derselbe Dolphin-Build. Komfortable Ära für die BC-250; im Chat nicht BC-250-benchmarkt. |
| **Wii U** | **Cemu** (nativ Linux, Open Source) | ⚠ Gefragt, nicht bestätigt | Ein Mitglied fragte nach dem Betrieb (und `cemu` ist im AUR), aber **kein funktionierendes BC-250-Ergebnis wurde gepostet**. Cemu ist schwerer als Dolphin — überprüf es selbst. ([src](https://t.me/c/2424231195/68253), [src](https://t.me/c/2424231195/74138)) |
| **Switch** | **Eden** (Yuzu-Nachfolger) | ✅ Funktioniert gut & schnell (Chat) | Pick Nr. 1 der Community. Governor vor dem Start auf max setzen. Manche Titel werden 30-FPS-gesperrt ausgeliefert und brauchen einen 60-FPS-Patch (z. B. Zelda); schwere First-Party-Titel (TOTK) droppen weiterhin Frames — CPU-bound. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/130842), [src](https://t.me/c/2424231195/124216), [src](https://t.me/c/2424231195/130887)) |
| **Switch** | **Ryujinx** (jetzt der **Ryubing**-Fork) | ✅ Funktioniert (Chat) | Native Builds liefen erfolgreich; das EmuDeck-gebündelte Ryujinx ist „auch gut". ([src](https://t.me/c/2424231195/51606), [src](https://t.me/c/2424231195/99039)) |
| **Switch** | Yuzu / Suyu | ❌ Brach beim Start ab — Legacy (Chat) | Frühe Berichte: hing beim Starten eines Spiels. Yuzu ist eingestellt — verwende Eden. ([src](https://t.me/c/2424231195/23577)) |

### Sony

| System | Bester Linux-Emulator | Status auf BC-250 | Anmerkungen |
|--------|--------------------|------------------|-------|
| **PS1** | **DuckStation** (Standalone oder RetroArch) | ✅ Trivial (allgemein ⚠) | DuckStation ist der moderne Standard; Verbesserungs-Features gratis. |
| **PS2** | **PCSX2** (v2.x, Qt + Vulkan) | ✅ Sollte gut laufen (allgemein ⚠) | 98 %+ Kompatibilität, das klassische „easy Emulation"-Ziel. Im Chat nicht aus erster Hand auf BC-250 benchmarkt — aber gut innerhalb der Klasse dieser Hardware. |
| **PSP** | **PPSSPP** | ✅ Läuft super — 4× Auflösung (Chat) | Aus erster Hand: lief mit 4× interner Auflösung ohne Throttling. Eines der komfortabelsten Systeme auf dem Board. ([src](https://t.me/c/2424231195/101579), [src](https://t.me/c/2424231195/103218), [src](https://t.me/c/2424231195/111096)) |
| **PS Vita** | **Vita3K** | ⚠ Experimentell (allgemein ⚠) | Vita3K ist der einzige Vita-Emulator und überall noch früh; erwarte Pro-Spiel-Bruch. Kein BC-250-Bericht. (Eine Chat-Zeile „im Grunde eine voll aufgedrehte PS Vita" bezog sich auf die Hardware, nicht den Emulator. ([src](https://t.me/c/2424231195/86140))) |
| **PS3** | **RPCS3** | ⚠️ Funktioniert, Pro-Spiel-Tuning (Chat) | Das am meisten CPU-strapazierende der realistischen Ziele. Uncharted „stabil, spielbar", „funktioniert super" berichtet; ein früher Tester traf auf Fehler. Braucht Tuning Titel für Titel. Community-PS3-Walkthrough-Video existiert. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/74644), [src](https://t.me/c/2424231195/53601), [src](https://t.me/c/2424231195/13)) |
| **PS4** | **shadPS4** (0.9.0+; 0.16 in 2026) | ✅ Bloodborne / Drive Club spielbar (Chat) | „Startet in 2 Klicks." Bloodborne flüssig & keine Drops; Drive Club 100 %; manche Titel artefakten, halten aber FPS. Pro-Spiel. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/38706), [src](https://t.me/c/2424231195/82128)) |

### Microsoft

| System | Bester Linux-Emulator | Status auf BC-250 | Anmerkungen |
|--------|--------------------|------------------|-------|
| **Xbox (OG)** | **xemu** | ⚠ Sollte funktionieren (allgemein ⚠) | xemu ist LLE mit ~80 % der Spiele spielbar; natives Linux-AppImage. Kein BC-250-Bericht — aber ein leichtes Ziel für diese CPU. Pro-Spiel überprüfen. |
| **Xbox 360** | **Xenia** (stock) | ⚠️ Bootet, Performance niedrig (Chat) | Schlichtes Xenia läuft, aber „Performance bei Standard ist am Boden" — Overclock ist Pflicht. ([src](https://t.me/c/2424231195/23577)) |
| **Xbox 360** | **Xenia Canary** | ❌ Schwarzer Bildschirm im Spiel (Chat) | Menüs laden und das Gamepad reagiert, aber das Gameplay ist ein schwarzer Bildschirm. Unter Linux ist das Vulkan-Backend noch unvollständig. Ungelöst. ([src](https://t.me/c/2424231195/78988)) |

### Sega

| System | Bester Linux-Emulator | Status auf BC-250 | Anmerkungen |
|--------|--------------------|------------------|-------|
| **Master System** | Genesis Plus GX — RetroArch | ✅ Trivial (allgemein ⚠) | Ein Core deckt SMS/Genesis/Game Gear/SG-1000/Sega CD ab. |
| **Genesis / Mega Drive** | Genesis Plus GX (BlastEm für Genauigkeit) | ✅ Trivial (allgemein ⚠) | Trivial für diese Hardware. |
| **Game Gear** | Genesis Plus GX — RetroArch | ✅ Trivial (allgemein ⚠) | Derselbe Sega-Multi-Core. |
| **Saturn** | **Mednafen/Beetle Saturn** (oder Kronos) | ✅ Sollte in Ordnung sein (allgemein ⚠) | Saturn ist bekanntermaßen CPU-schwer zu emulieren, aber trivial für Zen 2. Kein BC-250-Bericht. |
| **Dreamcast** | **Flycast** (Standalone oder RetroArch) | ✅ Sollte gut laufen (allgemein ⚠) | Flycast ist reif und leicht; komfortabel auf dieser Hardware. Im Chat nicht benchmarkt. |

### Andere / Arcade / Computer

| System | Bester Linux-Emulator | Status auf BC-250 | Anmerkungen |
|--------|--------------------|------------------|-------|
| **Arcade / MAME** | **MAME** (oder FinalBurn Neo) — RetroArch | ✅ Easy für die meisten (allgemein ⚠) | FBNeo für die gängigen Sets; volles MAME für alles. Schwere Late-90s-/3D-Arcade-Boards können noch anspruchsvoll sein. |
| **Neo Geo** | **FinalBurn Neo** — RetroArch | ✅ Trivial (allgemein ⚠) | FBNeo ist der Neo-Geo-/CPS-Pick. |
| **TurboGrafx-16 / PC Engine** | **Beetle PCE** — RetroArch | ✅ Trivial (allgemein ⚠) | Beetle/Mednafen-PCE-Core. |
| **Atari (2600/5200/7800/ST/…)** | Stella / RetroArch (Atari800, Hatari) | ✅ Trivial (allgemein ⚠) | Stella für 2600; Cores existieren für den Rest. |
| **DOS** | **DOSBox** (DOSBox-Staging / DOSBox-X) | ✅ Trivial (allgemein ⚠) | Oder der DOSBox-Pure-RetroArch-Core. |
| **ScummVM** | **ScummVM** (nativ Linux) | ✅ Trivial (allgemein ⚠) | Engine-Neuimplementierung, keine Emulation — läuft überall. |

> ✅ funktioniert / trivial · ⚠️ funktioniert mit Vorbehalten · ❌ kaputt · **(Chat)** = BC-250-Bericht aus erster Hand (zitiert) · **(allgemein ⚠)** = bester Linux-Emulator + Erwartung für diese Hardware-Klasse, **nicht BC-250-getestet**.

---

## Realistische Erwartungen — was easy ist vs. schwer

| Stufe | Systeme | Realität auf einer 2000-MHz-, gekühlten BC-250 |
|------|---------|--------------------------------------|
| **Komfortabel** | NES · SNES · GB/GBC/GBA · N64 · DS · 3DS · **PS1 · PS2 · PSP** · Genesis/SMS/Game Gear · Saturn · Dreamcast · Arcade/Neo Geo/PCE · Atari · DOS · ScummVM · **GameCube · Wii** | Der Sweet Spot des Boards. Retro ist trivial; PSP ist chat-bestätigt bei 4× Auflösung; PS2/GC/Wii sind gut innerhalb der Klasse dieser Hardware (allgemeine Erwartung — benchmarke deine eigenen anspruchsvollen Titel). Verwende EmuDeck oder RetroArch und los. |
| **Anspruchsvoll / Glückssache** | **Switch · PS3 · PS4** | Real, aber CPU-bound und Pro-Spiel. Switch (Eden) „gut und schnell", aber schwere First-Party droppt Frames; PS4 (shadPS4) super für die richtigen Titel (Bloodborne); PS3 (RPCS3) funktioniert, braucht aber Tuning pro Spiel. Setz den Governor zuerst auf max. |
| **Kaum / noch nicht** | **Xbox 360** · Wii U · PS Vita | Xenia bootet Menüs, dann schwarzer Bildschirm im Gameplay (Chat). Wii U (Cemu) und Vita (Vita3K) sind auf dem Board unbestätigt und allgemein anspruchsvoll/experimentell — überprüf es, bevor du dich darauf verlässt. |
| **Ein sorgenfreies, OC-freies Erlebnis** | (jedes anspruchsvolle System) | Nein. Ohne den Overclock untertaktet die GPU innerhalb der Emulatoren, und selbst Switch erstickt. Mach erst den OC + die Kühlung. |

---

## Quellen

- Emulator-Rundumschlag (Switch/Eden, PS3/RPCS3, PS4/shadPS4, Xbox360/Xenia) — https://t.me/c/2424231195/78988
- „Eden ist der anständigste" — https://t.me/c/2424231195/130842 · Eden installiert sich & funktioniert — https://t.me/c/2424231195/98942 · Eden + EmuDeck-Ryujinx — https://t.me/c/2424231195/99039 · Ryujinx lief — https://t.me/c/2424231195/51606 · TOTK auf Eden droppt Frames (NX Optimizer) — https://t.me/c/2424231195/124216 · CPU ist die Mauer, GPU unausgelastet — https://t.me/c/2424231195/136712
- Früher Emulator-Stand (Yuzu/Suyu hängen, Ryujinx ok, Xenia niedrig, RPCS3-Fehler) — https://t.me/c/2424231195/23577
- PS4/shadPS4 Bloodborne („2 Klicks") — https://t.me/c/2424231195/38704 · https://t.me/c/2424231195/38706 · Drive Club 100 % — https://t.me/c/2424231195/82128
- PS3/RPCS3 Uncharted stabil & spielbar — https://t.me/c/2424231195/74644 · „funktioniert super in RPCS3" — https://t.me/c/2424231195/53601 · PS3-Emulations-Walkthrough-Video — https://t.me/c/2424231195/13
- PSP/PPSSPP lief (4× Auflösung, kein Throttle) — https://t.me/c/2424231195/101579 · https://t.me/c/2424231195/103218 · https://t.me/c/2424231195/111096
- Wii U/Cemu gefragt auf 6.15+-Kernel — https://t.me/c/2424231195/68253 · cemu über AUR (paru) — https://t.me/c/2424231195/74138
- Dolphin vom Terminal — https://t.me/c/2424231195/19715 · „im Grunde eine voll aufgedrehte PS Vita" (Hardware, nicht Emulator) — https://t.me/c/2424231195/86140
- Governor bei 1000 MHz im Emulator hängend; manuell auf max setzen — https://t.me/c/2424231195/130879 · https://t.me/c/2424231195/130955 · Zelda 30→60-Patch — https://t.me/c/2424231195/130887
- Kein vorkonfiguriertes Image (Community-Tabu) — https://t.me/c/2424231195/130845 · https://t.me/c/2424231195/130877
- Nintendo beklagt Switch-Emulatoren / Keys schwer zu finden — https://t.me/c/2424231195/136649
- Batocera (Emulations-Distro) bestätigt auf der BC-250 laufend — [r/linux_gaming-Thread](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- Hardware-Spezifikation (6× Zen 2 @ ~3,5 GHz, RDNA2 24→40 CU, 16 GB GDDR6) — [elektricm/amd-bc250-docs](https://elektricm.github.io/amd-bc250-docs/hardware/specifications/)
- Allgemeine Emulations-Fähigkeits-Einordnung (⚠ überprüfen; dieser Drittanbieter-Guide zählt Kerne fälschlich als 8) — [koukan.co.uk BC-250-Guide](https://www.koukan.co.uk/blog/amd-bc-250-guide)

> Der Overclock, von dem diese Ergebnisse abhängen, lebt in [09-overclock-undervolt.md](09-overclock-undervolt.md); mach die [04-cooling.md](04-cooling.md)-Mod, bevor du 2000 MHz fährst. Für das weitere Gaming-Bild und die CPU-bound-Erklärung siehe [11-gaming.md](11-gaming.md); zum Installieren des OS, auf dem die Emulatoren laufen, siehe [06-linux.md](06-linux.md).
