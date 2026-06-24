> 🌐 Community-Übersetzung. Die englische Version ist die maßgebliche Quelle und kann aktueller sein. Fehler gefunden? Öffne ein [Issue](https://github.com/lildebil0/awesome-bc250/issues). ([englisches Original](../en/13-macos.md))

# macOS / Hackintosh

> **TL;DR** — **Lass es.** Du kannst macOS wahrscheinlich auf der CPU der BC-250 booten (es ist ein Zen-2-AMD-Chip, und generische AMD-OSX-Hackintosh-Tricks greifen), aber die **GPU wird nicht beschleunigen** und es gibt keinen realistischen Weg, das zu ändern. macOS unterstützt GPUs über fest codierte Geräte-IDs; die GPU der BC-250 (Cyan Skillfish / Oberon, ein beschnittenes PS5-Teil) hat **keinen nativ unterstützten Desktop-Zwilling, den man vortäuschen könnte**, und Apples Stack wurde *nie* dazu gebracht, die integrierte Grafik irgendeiner AMD-APU zu treiben. Du bekämst also einen langsamen, software-gerenderten Mac ohne Metal. Stand 2026 hat niemand in der Community ein funktionierendes beschleunigtes Ergebnis berichtet. Nimm stattdessen Linux — siehe [06-linux.md](06-linux.md).

Das ist eine **Nischenkuriosität**, kein echter Anwendungsfall. Die ehrliche Antwort ist der ganze Abschnitt.

---

## Warum die GPU-Beschleunigung die Wand ist

Die beiden meistbeachteten technischen Beiträge zum Thema kommen beide zum selben Schluss, und sie erklären den Mechanismus klar.

macOS hat kein offenes Treibermodell wie Linux. Es liefert geschlossene Treiber aus, die sich **über die Geräte-ID** an bestimmte GPUs binden, und die einzige Stelle, an der du eingreifen kannst, ist der **OpenCore**-Bootloader *bevor* das OS lädt — OpenCore reicht macOS vorgekochte Daten, es kann das geschlossene System nicht von innen patchen ([src](https://t.me/c/2424231195/103173)).

OpenCore *kann* die Geräte-ID einer GPU vortäuschen, aber nur **innerhalb einer Architekturfamilie** — z. B. eine nicht unterstützte RX 6950 XT als unterstützte RX 6900 XT ausgeben, weil sie dasselbe Silizium sind. Dieser Trick kostete die OpenCore-Entwickler **über ein Jahr** und funktionierte nur, weil jene Navi-Karten architektonisch identisch mit solchen sind, die Apple bereits unterstützte ([src](https://t.me/c/2424231195/53321)).

Die BC-250 bricht das auf zwei Arten:

1. **Kein Zwilling zum Vortäuschen.** Ihre GPU ist ein beschnittenes, PS5-abgeleitetes Teil (`gfx1013`). Es gibt **keine Desktop-AMD-Karte mit derselben Architektur, die macOS nativ unterstützt**, also gibt es nichts, als das man sich ausgeben könnte. Damit die BC-250 funktioniert, müsste Apples Stack diese Geräte-ID von Grund auf lernen — was nur passiert, wenn OpenCore-Entwickler sich des Chips annehmen, und dafür gibt es keinen kommerziellen Grund ([src](https://t.me/c/2424231195/53321)).
2. **Es ist eine APU, und APUs haben nie funktioniert.** Selbst die integrierte Grafik von Desktop-Architektur-Ryzen (Vega-/Navi-iGPUs) wurde in macOS **nie** zum Laufen gebracht, obwohl sie sich eine Mikroarchitektur mit unterstützten dedizierten Karten teilt. Der Autor hat „nicht einen einzigen funktionierenden Fall" einer Ryzen-iGPU in macOS gesehen ([src](https://t.me/c/2424231195/103173)). Die BC-250 fällt in genau diesen APU-Topf.

Die unverblümte Zusammenfassung desselben Beitragenden: *wenn nicht einmal die Windows-Treiber für diesen Chip geklärt sind, ist macOS keine Träumerei wert* ([src](https://t.me/c/2424231195/53321)). (Zur Windows-Treiber-Lage siehe [07-windows.md](07-windows.md).)

---

## Was die Leute tatsächlich versucht haben

- Jemand bereitete früh ein **macOS-Monterey-Recovery + OpenCore**-Paket vor und teilte es (`Monterey recovery + OpenCore.zip`, plus ein älteres `Архив.zip`), sodass sich zumindest eine Person daranmachte, es zu installieren ([src](https://t.me/c/2424231195/53590)). Ein Erfolg mit beschleunigter GPU wurde nie zurückgemeldet.
- Das relevante Werkzeug, auf das die Leute verwiesen, ist das Standard-AMD-Hackintosh-Kit: Geräte-ID-Fälschung via [RehabMan/OS-X-Fake-PCI-ID](https://github.com/RehabMan/OS-X-Fake-PCI-ID), der [Dortania AMD GPU Buyers Guide](https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series) dafür, was tatsächlich unterstützt wird, und — das Nächste an APU-Grafikunterstützung — **[ChefKissInc/NootedRed](https://github.com/ChefKissInc/NootedRed)**, ein Kext für AMD-APU-iGPUs. NootedRed zielt auf APUs der Vega-/Renoir-Klasse und deckt den Die der BC-250 **nicht** ab, rettet dieses Board also nicht.
- Ein späterer Forum-Link über das [Ausführen von macOS auf AMD Ryzen via VMware/OpenCore](https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/) ([src](https://t.me/c/2424231195/107779)) ist **generisches AMD-Hackintosh**, nicht BC-250-spezifisch — und eine VM bedeutet ohnehin kein GPU-Passthrough/Metal.

> ⚠ **Verwechsle Witze nicht mit Ergebnissen.** Das Thema enthält lockere Sprüche wie „super, der mächtige Hackintosh herrscht hier" ([src](https://t.me/c/2424231195/85166)) und Lob-Reaktionen, die *keine* Berichte über einen funktionierenden macOS-Build sind. Nichts in den Belegen zeigt beschleunigtes macOS auf einer BC-250.

---

## Lohnt es sich also?

**Nein, für jeden praktischen Zweck.** Das beste realistische Ergebnis ist ein reines CPU-macOS, das die Oberfläche software-rendert — kein Metal, kein GPU-Compute, unbrauchbar für die Gaming-/KI-Lasten, für die man dieses Board kauft. Der Community-Konsens, datiert und unverändert von **2025-06** bis **2026-03**, lautet, dass GPU-Unterstützung praktisch unmöglich ist, ohne dass OpenCore-Entwickler diesen Chip gezielt adoptieren, was nicht geschehen ist und nicht erwartet wird.

Wenn du willst, dass dieses Board *etwas* tut, installiere Linux ([06-linux.md](06-linux.md)), wo die GPU echt via Mesa/RADV unterstützt wird. Windows ist ein ferner Zweiter ([07-windows.md](07-windows.md)). macOS ist Letzter und in der Praxis eine Sackgasse.

---

## Quellen

- GPU-über-Geräte-ID + die einjährige Navi-Vortäusch-Geschichte — https://t.me/c/2424231195/53321
- Grenzen von OpenCore & „keine Ryzen-iGPU hat je funktioniert" — https://t.me/c/2424231195/103173
- Von jemandem vorbereitetes Monterey-+-OpenCore-Paket — https://t.me/c/2424231195/53590
- Generischer AMD-Ryzen-Hackintosh-Forenthread (nicht BC-250-spezifisch) — https://t.me/c/2424231195/107779 · [amd-osx.com-Thread](https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/)
- Referenziertes Werkzeug — [RehabMan/OS-X-Fake-PCI-ID](https://github.com/RehabMan/OS-X-Fake-PCI-ID) · [ChefKissInc/NootedRed](https://github.com/ChefKissInc/NootedRed) (AMD-APU-iGPU-Kext; deckt diesen Die nicht ab) · [Dortania AMD GPU Guide](https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series)
- Chip-Identität (Cyan Skillfish / Oberon, `gfx1013`) — siehe [01-what-is-bc250.md](01-what-is-bc250.md)

> **Fazit:** macOS auf der BC-250 ist eine Tech-Trivia-Fußnote, kein Build-Ziel. Geh zu [06-linux.md](06-linux.md).
