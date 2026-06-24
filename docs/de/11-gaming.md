> 🌐 Community-Übersetzung. Die englische Version ist die maßgebliche Quelle und kann aktueller sein. Fehler gefunden? Öffne ein [Issue](https://github.com/lildebil0/awesome-bc250/issues). ([englisches Original](../en/11-gaming.md))

# Gaming-Ergebnisse & Einstellungen

> **TL;DR** — Die BC-250 ist eine **GPU der PS5-Klasse, angeschraubt an einen abgespeckten 6-Kern-Zen2**. Die GPU ist wirklich leistungsfähig: Mit einem realen **2000-MHz**-Overclock läuft sie moderne AAA-Titel mit **40–60 FPS**, und leichtere/ältere Spiele weit über 60. Der Haken ist die **CPU**. Die Zen2-Hälfte der APU ist weit häufiger der Engpass als die GPU — Community-Benchmarks zeigen die Karte wiederholt bei **~36–47 % GPU-Last, während sie auf ~38 FPS festgenagelt ist**, CPU-limitiert. Also: **erst übertakten** (Standard ~1500 MHz ist ~30 % langsamer), auf **FSR** und Frame-Generation setzen, **1080p–1440p** anvisieren und akzeptieren, dass physik-lastige oder schlecht gethreadete Spiele unabhängig von der Auflösung ruckeln. Konsolen-First-Party-Ports im Konsolenstil (God of War, Horizon, Last of Us, Spider-Man) sind der Sweet Spot.

Dieser Abschnitt setzt Erwartungen und sammelt die echten, geposteten Ergebnisse der Community — viele davon Benchmark-Screenshots. Zahlen variieren mit Takt, Distro, Treiber und VRAM-Split, also ist jede Zeile an ihre Quelle gebunden.

---

## Das Eine, das du zuerst verstehen musst: Es ist CPU-bound

Die GPU der BC-250 ist ein PS5-abgeleitetes RDNA2-Teil (RADV meldet sie als `GFX1013` / NAVI10-Klasse). Sie ist in den meisten Spielen *nicht* das schwache Glied. Das schwache Glied ist die **6-Kern-Zen2-CPU**, die mit ~3,5 GHz läuft, mit PS5-typisch abgespecktem Cache und ohne SMT-Spielraum.

Ein Community-Benchmark bei **1080p, High, GPU @ 2000 MHz / Speicher @ 3600 MHz** macht das konkret: Der Lauf **„erreichte 38 FPS"** mit **GPU-Limited-Percentage von nur 36,5 %** — der CPU-Simulations-Thread war das Tor (CPU-Sim ~70 / CPU-Render ~43 / GPU ~47 auf dem Pro-Stufe-Meter). Die GPU lief im Leerlauf bei einem Drittel ihrer Kapazität, während die CPU die Bildrate niederhielt. ([src](https://t.me/c/2424231195/136242))

Praktische Konsequenzen:

- **Auflösung ist oft „gratis".** Weil du CPU-bound bist, kostet der Schritt von 1080p auf 1440p (oder sogar 4K mit FSR) häufig wenig FPS — die GPU hatte ohnehin Spielraum übrig. Mehrere 4K-Ergebnisse unten sehen aus genau diesem Grund fast so gut aus wie ihre 1080p-Pendants.
- **Upscaling hilft weniger als auf einem normalen PC.** FSR entlastet die GPU, aber wenn die CPU der Limiter ist, hebt eine niedrigere Render-Auflösung deine FPS kaum. Nutze FSR für Bildqualität / Thermik, nicht als magischen FPS-Knopf.
- **Schlecht gethreadete oder physik-lastige Spiele bestrafen dich.** Ruckler und Frame-Time-Spikes (Gothic Remake, Doom: The Dark Ages vor Fixes) kommen von der CPU, nicht von der GPU.
- **Übertakte die GPU trotzdem** — wenn ein Spiel *doch* GPU-bound ist (4K, schweres Raytracing, gut gethreadete Engines), sind 1500 → 2000 MHz ~+30 % FPS. Siehe [09-overclock-undervolt.md](09-overclock-undervolt.md), wie du dorthin kommst, und [04-cooling.md](04-cooling.md) zuerst, denn 2000 MHz brauchen die Kühlungs-Mod.

---

## Einstellungen, die wirklich etwas bewegen

- **Takte.** Standard-GPU ~1500 MHz ist der langsame Default; die Community fährt **GPU 2000 MHz, Speicher ~1900–2000 MHz** als Alltagsziel, manche pushen **2,65 GHz Core auf einem dGPU-Klasse-Build**. Standard vs. 2000 MHz sind grob **+30 % FPS** in GPU-bound-Szenen. ([Overclock-Guide](09-overclock-undervolt.md))
- **40-CU-Unlock.** Das Board wird mit deaktivierten CUs ausgeliefert. Alle **40 CUs** freizuschalten gibt eine messbare, breite Steigerung — ein Nutzer berichtete, dass Doom: The Dark Ages von kaputt auf **60 FPS High** ging, ein „007"-Titel auf **60 FPS High**, und ruhigere Frame-Times in Great Pragmata nach dem Unlock. ([src](https://t.me/c/2424231195/141193)) Siehe [09-overclock-undervolt.md](09-overclock-undervolt.md).
- **FSR / FSR 4.** Verwende Quality oder Balanced bei 1440p/4K, um die GPU gefüttert und die Temps niedrig zu halten. Die Community portiert aktiv **FSR 4** (DLL-Pakete im Thread geteilt). ([FSR4-INT8-Diskussion src](https://t.me/c/2424231195/136354)) elektricMs gemessene FSR-Gewinne: **Quality +20–30 %, Balanced +30–40 %, Performance +40–60 %** FPS; **Frame Generation kann die Bildrate grob verdoppeln** (leichte Latenz). **FSR 4 über Optiscaler** — die Community findet, dass **Balanced natives FSR 3.1.5 Quality schlägt**. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
  - **Welcher Upscaler tatsächlich zu verwenden ist:** **FSR 1–3 ist hier die praktische Wahl** — reif, günstig und gut unterstützt. **FSR 4 und XeSS *können* technisch laufen** auf diesem RDNA2-Silizium über den **DP4a-(INT8-)Pfad** — RDNA2 hat dp4a/Rapid Packed Math, also laden sowohl OptiScalers FSR-4-INT8-Build als auch die GPU-agnostische XeSS-DP4a-Variante — aber auf einer GPU dieser Schwäche sind sie **langsam und experimentell**: Der DP4a-Fallback ist ~10–20 % schwerer als der WMMA-Pfad, den neuere Karten nutzen, und die Bildqualität bei XeSS-DP4a liegt unter der XMX-Version. Behandle FSR 4 / XeSS als etwas zum Experimentieren, nicht als deinen Daily Driver. ([OptiScaler FSR4 INT8 on RDNA2 — VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/)) **Offizielles AMD FSR 4 für RDNA2 (RX-6000-Klasse) landet ~Anfang 2027**; bis dahin ist es der OptiScaler-/Mod-Weg. ([Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals))
- **Frame-Generation über FSR hinaus — LSFG.** **Lossless Scaling Frame-Generation (LSFG)** läuft unter Linux über den **`lsfg-vk`**-Vulkan-Layer ([github.com/PancakeTAS/lsfg-vk](https://github.com/PancakeTAS/lsfg-vk)) — ein spiel-agnostischer Frame-Gen-Layer, der jeden Vulkan-Titel hookt. Die Community nutzt ihn, um **FPS grob zu verdoppeln** (z. B. 30 → 60) in Spielen ohne eingebaute Frame-Generation. Wie alle Frame-Gen fügt er Latenz hinzu und will eine vernünftige reale Bildrate zum Interpolieren, aber es ist eine echte Option, wenn FSRs eigenes FG nicht verfügbar ist.
- **VRAM-Split (UMA).** Es ist ein einheitlicher 16-GB-Pool. In einem sorgfältigen Durchlauf (1440p, 1850 MHz) **änderte der GDDR6-Split (512 MB vs. 8 GB reserviert) die durchschnittlichen FPS kaum** — aber eine zu kleine oder falsche UMA-Einstellung kann dich in Software-Rendering (`llvmpipe`) abrutschen lassen oder einen Benchmark aufhängen. Auto / eine vernünftige Reserve ist in Ordnung; überdenk es nicht. ([src](https://t.me/c/2424231195/81203))
- **VSync aus** zum Benchmarking; **Frame-Generation an**, wo angeboten (es half Wukong, dreistellige Durchschnitte zu erreichen, siehe unten).
- **`mitigations=off`** (Kernel-Boot-Flag) ist eine verbreitete Optimierung; im VRAM-Durchlauf hatte es nur geringe, verrauschte Effekte auf FPS. Behandle es als klein. ⚠ **Überprüfe (Größenordnung umstritten)** — elektricM berichtet einen viel größeren Gewinn (**+18 FPS in Cyberpunk, „+10–15 %"** in ihren Tipps). Es ist klar spielabhängig: groß in manchen CPU-bound-Titeln, vernachlässigbar in anderen. Probier es und miss; nimm keine der beiden Zahlen als gegeben an. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

---

## Ergebnisse, die Leute tatsächlich gepostet haben

Das sind community-berichtete Zahlen mit ihren Einstellungen und ihrer Quelle. **Benchmark-Scores und FPS sind wie gepostet** — Takte/Distro/Treiber unterscheiden sich zwischen den Zeilen, also lies die Kontext-Spalte, vergleiche nicht blind.

| Spiel | Einstellungen (Auflösung / Preset / Upscaling) | Ergebnis | HW / Takte | Quelle |
|------|--------------------------------------|--------|-------------|--------|
| **Black Myth: Wukong** (Bench) | 1080p, High, FSR + Frame Gen an | **Ø 96** (min 78, max 113) | BC-250, Windows, RADV NAVI10 | ([src](https://t.me/c/2424231195/10069)) |
| **Black Myth: Wukong** (Bench) | 1440p, Medium, kein FSR | **Ø ~48** (max 56) | BC-250, 1850 MHz, Linux | ([src](https://t.me/c/2424231195/81203)) |
| **Shadow of the Tomb Raider** (Bench) | 1440p, Max | **Ø ~70** | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Marvel's Guardians of the Galaxy** (Bench) | 1440p, High | **Ø ~70** (89 max, min sackt auf ~3) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Dying Light 2** (Bench) | 1440p, High, kein VSync | **Ø ~48** (max 62) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Cyberpunk 2077** (Bench) | 1440p, Raytracing **min** | **Ø ~36** (min 30) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Indiana Jones and the Great Circle** | 1440p, low, kein Upscaler | **45** | BC-250, GPU ~1900 MHz, Vulkan | ([src](https://t.me/c/2424231195/36931)) |
| **Indiana Jones and the Great Circle** | 1440p, medium, Upscaler an | **60** | BC-250 | ([src](https://t.me/c/2424231195/36931)) |
| **Forza Horizon 5** | **4K**, High-Preset, **kein FSR** | spielbar (Video) | BC-250 | ([src](https://t.me/c/2424231195/81891)) |
| **The Witcher 3** | 4K, Medium, FSR Balanced | **~50** | BC-250 | ([src](https://t.me/c/2424231195/81894)) |
| **Kingdom Come: Deliverance II** | 4K, Med/High, FSR Quality | **~30** („PS5-Erlebnis") | BC-250 | ([src](https://t.me/c/2424231195/81893)) |
| **The Last of Us Part II** | 1080p, Standard-Preset | spielbar (Video) | BC-250 | ([src](https://t.me/c/2424231195/94237)) |
| **Doom: The Dark Ages** | High | **60** (nach 40-CU-Unlock + Fix) | BC-250, 40 CU | ([src](https://t.me/c/2424231195/141193)) · [Reddit-Fix](https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/) · [Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS) |
| **Doom Eternal** | RT an (community-berichtet) | **60 + RT** | BC-250; community-berichtet (r/BC250Gaming) | ([Reddit-Synthese](https://www.reddit.com/r/BC250Gaming/)) |
| **Tekken 8** | (community-berichtet) | **~60** | BC-250; community-berichtet (r/BC250Gaming) | ([Reddit-Synthese](https://www.reddit.com/r/BC250Gaming/)) |
| **Street Fighter 6** | (community-berichtet) | **~60** | BC-250; community-berichtet (r/BC250Gaming) | ([Reddit-Synthese](https://www.reddit.com/r/BC250Gaming/)) |
| **Stellar Blade** | (community-berichtet) | **~70–80** | BC-250; community-berichtet (r/BC250Gaming) | ([Reddit-Synthese](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | Frame Generation an (community-berichtet) | **60 → 100** (FG) | BC-250; community-berichtet (r/BC250Gaming) | ([Reddit-Synthese](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | (Video) | spielbar | BC-250, CPU Standard, **GPU 2000** | ([src](https://t.me/c/2424231195/121772)) |
| **Gothic Remake** | Medium | **ruckelt** — „keine Optimierung" | BC-250 | ([src](https://t.me/c/2424231195/142708)) |
| **Hi-Fi Rush** | (Video, OBS-Capture) | flüssig | BC-250, `mitigations=off` | ([src](https://t.me/c/2424231195/91022)) |
| **Cyberpunk 2077** | 1080p, High, FSR Quality, **kein RT** | **70–90** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Cyberpunk 2077** (Bench) | 1080p (Standard 2000 MHz / 1000 mV) | **57,66** → **60,82** OC (2230 MHz); `mitigations=off` **+18** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **The Last of Us Part I** | 1080p, Medium-High | **60** (stabil) | BC-250 — 90–100 °C während Shader-Compile; etwas Audio-Knacken | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Devil May Cry 5** | 1080p, High | **100** (niedrigste Latenz, ~10 ms) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Detroit: Become Human** | 1080p, Medium | **60** (gedeckelt) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Control** | 1080p, volles **RT** | **40** | BC-250 — gut für Einsteiger-RT | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Company of Heroes 3** | 1080p | spielbar — **braucht 4-GB-VRAM-Split** (512 MB Artefakte/Abstürze) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Red Dead Redemption 2** (Bench) | `-useMaximumSettings`-Flag verwenden | **45+** min | BC-250 — kann falschen GPU-Adapter erkennen, manuell setzen | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **CS2** / **Rocket League** / **Elden Ring** | 1080p | **100+** / **120+** / **60** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Helldivers 2** | 1080p, low (berichtet) | **≈82** | BC-250, Standard, einzelner Noctua NF-P12 — GPU 73 °C / CPU 76 °C; ⚠ ASR | ([„Temps Shocked Me"](https://youtu.be/d7Hwqxn9yg8) ~5:08) |
| **Stalker 2** | medium (berichtet) | **≈80** | BC-250 — Autor markiert CPU-bound / 8 GB RAM; ⚠ ASR | ([RU-Review](https://youtu.be/19l03qneKJ4) ~0:23) |
| **Stalker 2** | QHD (2560×1600), FSR Quality + Frame Gen, Patch 1.21 (berichtet) | **57–70** (1080p, kein FG **≈45**) | BC-250; ⚠ ASR | ([RU-Review](https://youtu.be/19l03qneKJ4) ~18:52) |
| **Arc Raiders** | 1080p (berichtet) | **≈56–80** | BC-250, Standard; ⚠ ASR | ([Temps Shocked Me](https://youtu.be/d7Hwqxn9yg8) ~5:58) |
| **Spider-Man 2** | 1080p, High, FSR Frame Gen (berichtet) | **≈100** Ø (sub-60 nativ) | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~11:04) |
| **Forza Horizon 5** | 1080p, Medium, kein FSR (berichtet) | **70–95** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~12:19) |
| **Metro Exodus** | QHD, High (berichtet) | **≈58** | BC-250; ⚠ ASR | ([RU-Review](https://youtu.be/19l03qneKJ4) ~14:12) |
| **Palworld** | 1080p, med-high (berichtet) | **<60** (spielbar) | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:04) |
| **Red Dead Redemption 2** | 1080p, med-high, FSR Quality (berichtet) | **solide 60** | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:19) |
| **Left 4 Dead 2** | 1080p, max (berichtet) | **>150** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~10:18) |
| _Referenz: dedizierter GPU-Build_ | RE-Engine-Bench, 1080p, High, kein RT | **Ø 67,99** (min 58, max 82) | **RX 6600** + Xeon E5-2667v4, Win10 | ([src](https://t.me/c/2424231195/116494)) |

> Die RX-6600-Zeile ist **kein BC-250-Ergebnis** — es ist ein Mitglied, das eine dedizierte Karte auf demselben Chassis/derselben CPU als Vergleichspunkt fährt. Eingefügt, um zu zeigen, was die *CPU* allein halten kann.

> ⚠️ **Elden Ring — Ergebnisse variieren.** Die ~60 FPS oben (elektricM, 1080p) sind nicht universell: Ein Community-Build war **auf gesperrte 30 FPS bei High gedeckelt und konnte selbst bei 720p low keine 60 erreichen** (CPU-bound). Behandle 60 als Best Case, nicht als Garantie. ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:50)

### First-Party / Konsolen-Ports — der Sweet Spot

Diese liefen gut genug, dass ein Mitglied sie schlicht als „funktioniert" auflistete (PS-typische Ports setzen auf die GPU und sind gut optimiert, was diesem Board passt):

> Days Gone · Death Stranding · DIRT 5 · Ghost of Tsushima: Director's Cut · God of War (2018) · God of War: Ragnarök · Horizon Forbidden West · Horizon Zero Dawn · The Last of Us Part I · The Last of Us Part II Remastered · Returnal · Uncharted: Legacy of Thieves

([src](https://t.me/c/2424231195/99563))

---

## Bekannte Problemspiele (funktionieren nicht / brauchen einen Workaround)

elektricM verfolgt Titel, die wir nicht abgedeckt haben und die **scheitern oder gegen die Plattform kämpfen** — prüf vor dem Kauf:

| Spiel | Problem | Workaround |
|------|---------|-----------|
| **Fortnite** | Easy Anti-Cheat **unterstützt Linux nicht** | **Keiner — kann nicht laufen** auf einer Linux-BC-250 |
| **Valorant** | Kernel-Level-Anti-Cheat | Technische Probleme unter Linux; faktisch ein Nein |
| **Magic: The Gathering Arena** | Stürzt ab/friert ein speziell auf **Fedora** | Funktioniert besser auf **Manjaro / Bazzite**; anderes Proton probieren |
| **Final Fantasy VII Rebirth** | „DX12 is not supported on your system" (GPU-Kompatibilitätsprüfung) | **Noch kein Fix** |
| **Black Myth: Wukong** (gecrackt) | „CreateProcess() returned 2" (Anti-Tamper) | **Unveränderte Spieldateien** verwenden |

(Der Anti-Cheat-Status ändert sich mit der Zeit — gegenprüfen bei [areweanticheatyet.com](https://areweanticheatyet.com) und [protondb.com](https://www.protondb.com).) ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

### Hart blockiert durch fehlende GPU-Features (nicht behebbar)

Das ist **RDNA-2-Klasse-Silizium** (GFX1013). Eine Handvoll neuerer Titel **erfordern zwingend GPU-Features, die RDNA 2 nicht hat** — vor allem **Mesh-Shader** und **Hardware-Variable-Rate-Shading (VRS)** — und verweigern den Start. Das fehlende Silizium ist eine **Hardware-Begrenzung, kein Treiber-Bug**: Kein Mesa-Update, Kernel-Parameter oder Proton-Version fügt das Feature selbst hinzu. **Mesh-Shader** sind eine echte Mauer. Eine **VRS**-Anforderung ist manchmal nur eine Launch-Zeit-Prüfung, die ein Userspace-Vulkan-Layer stubben kann (siehe die Doom-Notiz unten) — sie ist also nicht immer fatal. Bestätigte Beispiele ([r/linux_gaming-Community-Thread](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)):

| Spiel | Harte Anforderung, die der BC-250 fehlt |
|------|------------------------------------|
| **Final Fantasy VII Rebirth** | **Mesh-Shader** — läuft nicht (deshalb scheitert es auch an der DX12-GPU-Kompatibilitätsprüfung in der Tabelle oben) |
| **Doom: The Dark Ages — Update 2** | **Vulkan Fragment Shading Rate** (Hardware-VRS) — Update 2 machte VRS *beim Start* zwingend; der GPU fehlt es, also startet das unveränderte Spiel nicht mehr (der Pre-Update-2-Build lief mit 60 FPS nach dem 40-CU-Unlock, oben). **Workaround existiert** — siehe Notiz unten. |

> **Doom: The Dark Ages Update 2 — es gibt jetzt einen Workaround.** Das Spiel *prüft* VRS nur beim Start; es braucht es für das Gameplay nie wirklich. Der **`bangstk/Vulkan_NullVRS`**-Vulkan-Layer ([github.com/bangstk/Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS)) fängt `vkCmdSetFragmentShadingRateKHR()` ab und macht es zum No-op, erfüllt die Launch-Prüfung, sodass das Spiel ohne In-Game-Nebenwirkungen läuft. Doom: The Dark Ages ist also **kein** dauerhafter harter Block. **Mesh-Shader sind anders** — es gibt keinen äquivalenten Shim für FF7 Rebirths Mesh-Shader-Anforderung, also läuft das wirklich nicht.

> Bevor du einen brandneuen AAA-Titel kaufst, prüfe, ob er Mesh-Shader oder Hardware-VRS als Anforderung listet. **Mesh-Shader** sind hier eine echte Hardware-Mauer (kein Workaround). Eine **Hardware-VRS**-Anforderung ist oft nur ein Launch-Zeit-Gate — manchmal shimmbar (wie bei Doom oben), manchmal nicht — also prüf bei der Community, bevor du in die eine oder andere Richtung etwas annimmst.

## Raytracing — was tatsächlich getestet wurde

Die BC-250 hat **echtes RDNA2-Hardware-RT** (keine Software-Emulation, ab Mesa 25.2+). Getestete RT-Titel laut elektricM:

| Spiel | Auflösung | FPS | Anmerkungen |
|------|-----|-----|-------|
| Cyberpunk 2077 | 1080p | 50–60 | Nur RT-Beleuchtung, FSR Quality |
| Control | 1080p | 40 | Volles RT |
| Portal 2 RTX | 720p | 40 | Software-RT-Pfad in Mesa 25.2+ |
| Half-Life 2 RTX | 720p | 20–30 | Sehr anspruchsvoll |

RT ist hier Einsteiger-Niveau — gut für *nur-Beleuchtung* in gut optimierten Spielen, nicht für volle Path-Traced-Lasten. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

## Proton & Startoptionen (Linux)

- **Proton-Version:** Beginn mit **Proton GE** (beste Kompatibilität) oder **Proton Experimental**; pro Spiel auf stabiles **8.0 / 9.0** zurückfallen. GE über **ProtonUp-Qt** (`protonup-qt`) installieren. Manche Titel funktionieren nur mit einer bestimmten Version — teste, wenn eine scheitert. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Steam-Startoptionen**, die man kennen sollte:
  - `mangohud %command%` — FPS-/Temp-Overlay.
  - `RADV_DEBUG=nohiz %command%` — erzwingt RADV / behebt manche Glitches.
  - `gamemoderun %command%` — CPU-Governor für die Session auf Performance (hilft diesem CPU-bound-Board).
  - Kombiniert: `RADV_DEBUG=nohiz mangohud gamemoderun %command%`.
- **VRAM pro Spiel (UMA-Split):** Esports/Indie sind mit **512 MB** in Ordnung; **die meisten Spiele wollen 4 GB**; AAA/RT wollen außerdem die Extra-VRAM-Kernel-Parameter (`amdgpu.gttsize=...`, siehe [06-linux.md](06-linux.md) / [08-bios.md](08-bios.md)). Ein zu kleiner Split verursacht Artefakte, Abstürze oder einen Abfall in Software-Rendering. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Ruckler beim ersten Lauf** sind meist **Shader-Kompilierung** — lass Steam das Vorkompilieren beenden, bevor du FPS beurteilst; ein größerer Shader-Cache hilft. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Pro-Spiel-Fixes** (community-berichtet, r/BC250Gaming — probier es, wenn du auf genau diese Bugs stößt):
  - **Resident Evil Requiem — kaputtes/glitchendes Haar:** füge `RADV_DEBUG=nohiz %command%` zu den Startoptionen hinzu (dasselbe RADV-Flag wie oben, hier speziell angewandt). ([Reddit-Synthese](https://www.reddit.com/r/BC250Gaming/))
  - **Spider-Man 2 / Assassin's Creed Shadows — Einfrieren:** das Aktivieren von **zswap** (komprimiertem Swap) stoppt die Einfrierer berichtet. ([Reddit-Synthese](https://www.reddit.com/r/BC250Gaming/))

---

## Emulation

Emulatoren sind CPU-lastig, also sind die Ergebnisse gemischt, aber mehrere sind solide ([src](https://t.me/c/2424231195/78988)):

- **Switch — Eden / Ryujinx:** funktioniert gut und schnell. Community-berichtet (r/BC250Gaming): **Mario Kart ~60 FPS**; **Tears of the Kingdom ~30–40 FPS**. ✅ ([Reddit-Synthese](https://www.reddit.com/r/BC250Gaming/))
- **PS4 — shadPS4 (0.9.0+):** Bloodborne läuft gut ohne Drops; manche Titel (The Last Guardian) artefakten, halten aber stabile FPS. ✅
- **PS3 — RPCS3:** funktioniert, braucht aber Pro-Spiel-Tuning. ⚠️ **Bekannte Eigenheit** (community-berichtet, r/BC250Gaming): Ein Emulator-Bug **sperrt die GPU auf 1000 MHz** unter RPCS3, sodass die GPU nicht hochtakten kann — der Workaround ist, die **CPU zu übertakten, um den verlorenen GPU-Spielraum zu kompensieren**. ([Reddit-Synthese](https://www.reddit.com/r/BC250Gaming/))
- **Xbox 360 — Xenia Canary:** Menüs laden, das Gameplay fällt auf einen schwarzen Bildschirm (wird noch untersucht). ❌

---

## Wo man es laufen sieht (Video)

Die Community postet viel Gameplay-/Benchmark-Video. Ein paar In-Thread-Captures und Kanäle:

- BC-250-Gameplay-/Benchmark-Clips: [youtu.be/CYDv1SfD2Pc](https://youtu.be/CYDv1SfD2Pc) · [youtu.be/g3uWOfqcexA](https://youtu.be/g3uWOfqcexA) · [youtu.be/9fozmRrAouc](https://youtu.be/9fozmRrAouc) · [youtu.be/q64M2XzADjA](https://youtu.be/q64M2XzADjA) · [youtu.be/0LEkOG1yqqw](https://youtu.be/0LEkOG1yqqw)
- Community-Tracking-Sheet getesteter Spiele (FPS/Einstellungen): [Google Sheet](https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing)

---

## Realistische-Erwartungen-Spickzettel

| Du willst … | Realität auf einer 2000-MHz-, modifizierten BC-250 |
|-----------|--------------------------------------|
| 1080p AAA, 60 FPS | Manchmal — hängt von der CPU-Last ab. FSR + Frame Gen hilft. Ältere/leichtere AAA: ja. |
| 1440p AAA | 40–60 FPS in den meisten Ports; die GPU hat hier Spielraum. Beste Preis-Leistungs-Auflösung. |
| 4K AAA | 30–50 FPS mit FSR in gut optimierten/Konsolen-Ports (Forza, Witcher 3, KCD2). |
| Raytracing | Nur bei Minimum, niedrige FPS (Cyberpunk ~36 @ 1440p RT-min). Nicht die Stärke des Boards. |
| Überall gesperrte 60 | Nein. CPU-bound und physik-lastige Titel sacken/ruckeln unabhängig von den Einstellungen. |
| First-Party-PS-Ports | Der Sweet Spot — das macht das Board am besten. |

---

## Quellen

- CPU-bound-Benchmark (38 FPS, 36,5 % GPU) — https://t.me/c/2424231195/136242
- Große VRAM-/Takt-Benchmark-Tabelle (Wukong, Tomb Raider, Dying Light 2, Cyberpunk, Guardians) — https://t.me/c/2424231195/81203
- Wukong 1080p High FSR+FG, Ø 96 — https://t.me/c/2424231195/10069
- Indiana Jones Great Circle, Multi-Auflösung — https://t.me/c/2424231195/36931
- Forza Horizon 5 4K — https://t.me/c/2424231195/81891 · Witcher 3 4K — https://t.me/c/2424231195/81894 · KCD2 4K — https://t.me/c/2424231195/81893
- 40-CU-Unlock-Ergebnisse (Doom Dark Ages 60 FPS) — https://t.me/c/2424231195/141193 · Doom-Fix — https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/
- TLOU II 1080p — https://t.me/c/2424231195/94237 · Resident Evil Requiem — https://t.me/c/2424231195/121772 · Gothic Remake Ruckler — https://t.me/c/2424231195/142708
- First-Party-Ports-Liste — https://t.me/c/2424231195/99563
- Emulations-Überblick — https://t.me/c/2424231195/78988
- RX-6600-dGPU-Vergleichslauf — https://t.me/c/2424231195/116494
- elektricM-Spiel-Kompatibilität (Pro-Spiel-Einstellungen/FPS, Problemspiele, RT-Tabelle, Proton & Startoptionen, FSR-Gewinne) — https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/
- YouTube-FPS-Captures (Auto-Caption / ASR — Zahlen ungefähr): ETA Prime (Spider-Man 2, Forza H5, Left 4 Dead 2) — https://youtu.be/q_CxcbS5HI8 · „Temps Shocked Me" (Helldivers 2, Arc Raiders) — https://youtu.be/d7Hwqxn9yg8 · RU-Review (Stalker 2, Metro Exodus) — https://youtu.be/19l03qneKJ4 · Pixels & Power (Palworld, RDR2, Elden Ring 30 FPS) — https://youtu.be/4S0DvIpqm0E
- Mesh-Shader-/Hardware-VRS-Hartblöcke (FF7 Rebirth, Doom: The Dark Ages Update 2) — [r/linux_gaming-Thread](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- **Doom: The Dark Ages VRS-Workaround — `bangstk/Vulkan_NullVRS`** (No-op-Vulkan-Layer für `vkCmdSetFragmentShadingRateKHR`) — https://github.com/bangstk/Vulkan_NullVRS
- **LSFG-Frame-Generation unter Linux — `lsfg-vk`** (Vulkan-Layer) — https://github.com/PancakeTAS/lsfg-vk
- **FSR 4 / XeSS über DP4a (INT8) auf RDNA2** — OptiScaler-FSR4-INT8-Build: [VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/) · [OptiScaler-FSR4-Kompat-Wiki](https://github.com/optiscaler/OptiScaler/wiki/FSR4-Compatibility-List)
- **Offizielles AMD FSR 4 für RDNA2 (~Anfang 2027) / RDNA3 (Juli 2026)** — [Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals)
- **Community-berichtete Spielergebnisse (r/BC250Gaming)** — Tekken 8, Street Fighter 6, Stellar Blade, RE Requiem Frame-Gen, Doom Eternal RT, Switch (Mario Kart / TOTK), RPCS3-1000-MHz-GPU-Sperre, RE-Requiem-Haar / Spider-Man 2 / AC-Shadows-Fixes — https://www.reddit.com/r/BC250Gaming/
- Community-Spieltest-Tabelle — https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing

> Takte und der 40-CU-Unlock leben in [09-overclock-undervolt.md](09-overclock-undervolt.md); mach die [04-cooling.md](04-cooling.md)-Mod, bevor du 2000 MHz fährst.
