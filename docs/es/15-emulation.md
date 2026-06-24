> 🌐 Traducción de la comunidad. La versión en inglés es la fuente de verdad y puede estar más actualizada. ¿Encontraste un error? Abre un issue: [../en/15-emulation.md](../en/15-emulation.md) · https://github.com/lildebil0/awesome-bc250/issues

# Emulación

> **TL;DR** — La BC-250 es una caja de emulación sorprendentemente buena porque combina una GPU RDNA2 de clase PS5 con 16 GB de GDDR6 rápida — pero la emulación está **fuertemente limitada por CPU**, y el recortado **Zen 2 de 6 núcleos** a ~3,5 GHz es el techo para los sistemas exigentes. **Todo hasta PS2 / GameCube / Wii / PSP / Dreamcast incluidos es la zona cómoda** (lo retro es trivial; la PSP está confirmada por el chat corriendo a 4× de resolución interna). **Switch / PS3 / PS4 son exigentes y van a suerte**, y **la Xbox 360 apenas arranca**. Probado en el chat de la placa: **Switch vía Eden** "funciona bien y rápido", **PS3 vía RPCS3** funciona con ajustes por juego, **PS4 vía shadPS4** corre Bloodborne bien, **PSP vía PPSSPP** corre genial, y **Xbox 360 vía Xenia** está roto dentro del juego. **Haz overclock y refrigera la placa primero** — sin un governor la GPU se queda a ~1000 MHz dentro de un emulador y se ahoga. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/130879))

Esta página es el análisis a fondo; [11-gaming.md](11-gaming.md) tiene la versión corta dentro de su tabla de resultados. Las ROMs/keys/BIOS son tu problema a conseguir legalmente — nada de eso se cubre aquí.

> **Cómo leer la columna de estado.** Esta placa se discutió de forma desigual: un puñado de sistemas se probaron de primera mano en el chat, la mayoría de los sistemas retro no. Así que cada fila está etiquetada:
> - **✅ / ⚠️ / ❌ (chat)** — un miembro lo corrió *en una BC-250* y reportó el resultado, con el mensaje citado.
> - **(general ⚠)** — el **mejor emulador conocido para Linux y la expectativa general para esta clase de hardware** (Zen 2 + RDNA2). **No probado en BC-250.** Trátalo como "debería ir fino / debería costar", nunca como una promesa medida. No se inventan números de FPS específicos de la BC-250 en ningún lugar de esta página.

---

## Haz estas dos cosas antes de emular cualquier cosa

La emulación amplifica ambas peculiaridades de la placa, así que los requisitos previos importan más aquí que en el gaming normal:

1. **Haz overclock primero.** Un miembro que probó la emulación de Switch en una placa de stock encontró la GPU clavada a **1000 MHz dentro del emulador** aunque los juegos normales reloseaban bien — la solución fue fijar el governor a su reloj máximo manualmente antes de lanzar. ([src](https://t.me/c/2424231195/130879)) Corre el **oberon-governor** a **2000 MHz** (y considera el OC de CPU a 4 GHz), según [09-overclock-undervolt.md](09-overclock-undervolt.md) — la emulación necesita cada megahercio que la CPU pueda dar.
2. **Refrigera primero.** 2000 MHz necesita el mod de refrigeración o la placa hace throttling/se resetea. Haz [04-cooling.md](04-cooling.md) antes de perseguir el overclock.

> **Por qué estar limitado por CPU importa tanto aquí.** Un motor de juego está afinado para el hardware en el que se lanza; un emulador en cambio *simula* la CPU de otra consola en la tuya, lo cual es mucho más pesado por frame. En la BC-250 los **6 núcleos Zen 2 a ~3,5 GHz** ([especificación de hardware](https://elektricm.github.io/amd-bc250-docs/hardware/specifications/)) son el limitante para Switch/PS3/PS4 — la GPU de clase PS5 normalmente tiene margen de sobra. Un miembro persiguiendo mejor rendimiento en Switch vio exactamente esto: dentro del juego la **GPU se queda muy infrautilizada mientras la CPU es el muro**. ([src](https://t.me/c/2424231195/136712)) Más núcleos no ayudan al hilo caliente de un emulador; la velocidad de reloj y el IPC sí. Este es el mismo cuello de botella de CPU descrito en [11-gaming.md](11-gaming.md), solo que más agudo.

---

## Para empezar — tres formas de instalar

Esta placa no tiene peculiaridades específicas de emulación más allá de los dos requisitos previos de arriba — es un PC Linux normal para los emuladores. Elige una de:

- **EmuDeck** — la forma más rápida de tener un setup completo multisistema de una sola vez. Descarga y preconfigura toda la pila standalone (RetroArch, PCSX2, Dolphin, DuckStation, PPSSPP, melonDS, Ryujinx, …), cablea los mandos, y se confirmó funcionando en la placa ("el Ryujinx que viene con EmuDeck también es bueno"). ([src](https://t.me/c/2424231195/99039)) Apunta a Steam Deck / Linux, lo cual encaja con la típica instalación Bazzite/CachyOS/Arch de la BC-250 ([06-linux.md](06-linux.md)). **RetroDECK** (un equivalente contenido en Flatpak) es la misma idea si prefieres una sola app aislada.
- **RetroArch** — un front-end, muchos "cores" (emuladores-como-plugins). Ideal para todo lo de 8/16/32-bit hasta PS1/N64/DS — instala una vez, añade los cores de abajo, apúntalo a tus ROMs. Disponible como Flatpak en todas las distros de la BC-250.
- **Emuladores standalone** — para los sistemas pesados (Switch, PS3, PS4, PS2, GameCube/Wii, Xbox) la app standalone dedicada supera al core de RetroArch en características y compatibilidad. **Instala la build nativa de Linux** donde puedas — las primeras pruebas de la BC-250 mostraron que las builds nativas (Ryujinx) se comportaban mejor que las builds de Windows corridas a través de Proton. ([src](https://t.me/c/2424231195/23577)) La mayoría están en Flathub o en el AUR de Arch (p. ej. `paru -S cemu`). ([src](https://t.me/c/2424231195/74138))

Luego **lanza a través de Steam** ("añadir un juego que no es de Steam") para soporte de mando y un overlay — el mismo flujo que el chat usa para todo lo demás (ver [11-gaming.md](11-gaming.md)).

> **¿Quieres una distro de emulación dedicada en su lugar?** **Batocera** (una distro de emulación lista para usar + frontend) está **confirmada por la comunidad corriendo en la BC-250** ([hilo de la comunidad r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)) — arráncala en lugar de un Linux de escritorio y obtienes una caja de emulación estilo consola, plug-and-play, en vez de instalar emuladores uno por uno. Está listada como distro de arranque confirmado en [06-linux.md](06-linux.md). Los mismos requisitos previos de overclock + refrigeración siguen aplicando.

> **Vigila el governor.** Si un emulador corre lento, revisa tus relojes antes de culpar al emulador: puede estar a 1000 MHz. Fija el oberon-governor a su valor máximo (algunos lo corren clavado a ~2250 MHz) antes de lanzar, luego verifica con un overlay (`amdgpu_top` / MangoHud). ([src](https://t.me/c/2424231195/130879), [src](https://t.me/c/2424231195/130955))

> **No hay imagen de emulación preconfigurada.** Los recién llegados piden regularmente una imagen lista para usar con emuladores configurados. La comunidad trata una "imagen de BC-250 configurada" compartida como tabú — configúrala tú mismo desde las guías; no es difícil una vez que la placa tiene overclock. ([src](https://t.me/c/2424231195/130845), [src](https://t.me/c/2424231195/130877))

---

## Lo que la comunidad realmente corrió

El dato más útil de todos es el resumen de un miembro tras probar varios emuladores en la placa ([src](https://t.me/c/2424231195/78988)):

- **Switch (Eden)** — "funciona bien y rápido."
- **PS3 (RPCS3)** — funciona, pero "necesita ajuste individual juego por juego."
- **PS4 (shadPS4 0.9.0)** — Bloodborne corre bien sin caídas; The Last Guardian empezó a hacer artifacting pero mantuvo una tasa de frames estable.
- **Xbox 360 (Xenia Canary)** — los menús del juego se lanzan, pero el gameplay cae a pantalla negra (todavía responde al gamepad); sin resolver.

Más confirmaciones de primera mano:

- **Switch / Eden es la elección de consenso.** Cuando un recién llegado preguntó qué emulador de Switch coger, la respuesta fue tajante: **"Eden es el más decente."** ([src](https://t.me/c/2424231195/130842)) Otros repitieron que **Eden se instala y funciona bien** ([src](https://t.me/c/2424231195/98942)), y que **Eden funciona genial, y el Ryujinx que viene con EmuDeck también es bueno.** ([src](https://t.me/c/2424231195/99039)) Los títulos first-party pesados todavía cargan la CPU: un miembro jugando **Tears of the Kingdom en Eden (con NX Optimizer) reportó caídas de frames**. ([src](https://t.me/c/2424231195/124216))
- **PS4 / shadPS4** — un miembro **vendió su PS4 física y ahora rejuega Bloodborne en la BC-250 vía shadPS4**, diciendo que "se lanza en 2 clics." ([src](https://t.me/c/2424231195/38704), [src](https://t.me/c/2424231195/38706)) Otro confirmó que **Drive Club corre al 100 %** en shadPS4. ([src](https://t.me/c/2424231195/82128))
- **PS3 / RPCS3** — más allá del resumen, los miembros reportaron **Uncharted con un "framerate estable, jugable"** ([src](https://t.me/c/2424231195/74644)) y un escueto **"funciona genial en RPCS3."** ([src](https://t.me/c/2424231195/53601))
- **PSP / PPSSPP** — corrido de primera mano y elogiado repetidamente: un miembro corrió **PPSSPP a 4× de resolución interna** sin throttling térmico en la placa. ([src](https://t.me/c/2424231195/101579), [src](https://t.me/c/2424231195/103218), [src](https://t.me/c/2424231195/111096))

### Una nota sobre la historia de los emuladores de Switch (Yuzu → Eden / Ryubing)

La emulación de Switch en la placa pasó por el mismo vuelco que en todas partes. Una instantánea temprana del estado de las cosas encontró **Yuzu y Suyu colgándose al lanzar** mientras que **Ryujinx funcionaba** (builds nativas). ([src](https://t.me/c/2424231195/23577)) Yuzu fue cerrado por Nintendo en 2024 y sus sucesores llevan la antorcha: **Eden** (un fork de Yuzu) es la elección de la comunidad BC-250 que "funciona bien y rápido," y la línea de **Ryujinx** vive como el fork comunitario **Ryubing**, que sigue en desarrollo activo en 2026. Ten en cuenta que Nintendo litiga agresivamente contra los emuladores de Switch y borra las keys/enlaces de descarga — en febrero de 2026 le metió un DMCA a Eden junto con una docena de otros forks, así que espera tener que cazar tanto los binarios como las keys. ([src](https://t.me/c/2424231195/136649))

---

## Tabla de compatibilidad completa — cada plataforma

Una fila por plataforma. **Emulador** es la mejor elección actual para Linux; **Estado en BC-250** está citado del chat donde un miembro lo probó, de lo contrario la expectativa general para hardware Zen 2 + RDNA2 (etiquetado `general ⚠`, **no medido en BC-250**).

### Nintendo

| Sistema | Mejor emulador de Linux | Estado en BC-250 | Notas |
|--------|--------------------|------------------|-------|
| **NES / Famicom** | Mesen (o FCEUmm) — core de RetroArch | ✅ Trivial (general ⚠) | 8-bit; cualquier patata lo corre. No hace falta reporte de BC-250. |
| **SNES** | Snes9x (bsnes para precisión) — RetroArch | ✅ Trivial (general ⚠) | Snes9x es rápido y ~99 % compatible; bsnes si quieres precisión de ciclo. |
| **Game Boy / GBC** | SameBoy / Gambatte — RetroArch | ✅ Trivial (general ⚠) | SameBoy es la elección de precisión. |
| **GBA** | mGBA (standalone o RetroArch) | ✅ Trivial (general ⚠) | mGBA es el estándar de oro. |
| **N64** | simple64 / RMG (mupen64plus); core de RetroArch | ✅ Fácil (general ⚠) | simple64 está archivado; su dev se mudó a **gopher64** (Rust). Tanto RMG como gopher64 valen. Cómodo en esta CPU. |
| **DS** | melonDS (standalone o RetroArch) | ✅ Fácil (general ⚠) | melonDS reemplazó a DeSmuME hace mucho. |
| **3DS** | **Azahar** (fusión de Citra/Lime3DS) | ✅ Debería ser fácil (general ⚠) | Citra recibió un DMCA; **Azahar** es el sucesor mantenido. Cómodo para este hardware. |
| **GameCube** | **Dolphin** | ✅ Debería correr genial (general ⚠) | Dolphin es maduro y acelerado por Vulkan. Mencionado en el chat (multiventana/CLI) pero sin FPS de primera mano publicados — trátalo como fácil, no medido. ([src](https://t.me/c/2424231195/19715)) |
| **Wii** | **Dolphin** | ✅ Debería correr bien (general ⚠) | La misma build de Dolphin. Era cómoda para la BC-250; no benchmarkeado en BC-250 en el chat. |
| **Wii U** | **Cemu** (Linux nativo, código abierto) | ⚠ Preguntado, no confirmado | Un miembro preguntó por correrlo (y `cemu` está en el AUR), pero **no se publicó ningún resultado funcional de BC-250**. Cemu es más pesado que Dolphin — verifícalo tú mismo. ([src](https://t.me/c/2424231195/68253), [src](https://t.me/c/2424231195/74138)) |
| **Switch** | **Eden** (sucesor de Yuzu) | ✅ Funciona bien y rápido (chat) | La elección #1 de la comunidad. Fija el governor al máximo antes de lanzar. Algunos títulos vienen bloqueados a 30 FPS y necesitan un parche de 60 FPS (p. ej. Zelda); los títulos first-party pesados (TOTK) todavía caen frames — limitado por CPU. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/130842), [src](https://t.me/c/2424231195/124216), [src](https://t.me/c/2424231195/130887)) |
| **Switch** | **Ryujinx** (ahora el fork **Ryubing**) | ✅ Funciona (chat) | Las builds nativas corrieron con éxito; el Ryujinx empaquetado con EmuDeck "también es bueno." ([src](https://t.me/c/2424231195/51606), [src](https://t.me/c/2424231195/99039)) |
| **Switch** | Yuzu / Suyu | ❌ Se rompió al lanzar — legacy (chat) | Reportes tempranos: se colgaba al iniciar un juego. Yuzu está descontinuado — usa Eden. ([src](https://t.me/c/2424231195/23577)) |

### Sony

| Sistema | Mejor emulador de Linux | Estado en BC-250 | Notas |
|--------|--------------------|------------------|-------|
| **PS1** | **DuckStation** (standalone o RetroArch) | ✅ Trivial (general ⚠) | DuckStation es el estándar moderno; características de mejora gratis. |
| **PS2** | **PCSX2** (v2.x, Qt + Vulkan) | ✅ Debería correr bien (general ⚠) | 98 %+ de compatibilidad, el clásico objetivo de "emulación fácil". No benchmarkeado de primera mano en BC-250 en el chat — pero bien dentro de la clase de este hardware. |
| **PSP** | **PPSSPP** | ✅ Corre genial — 4× res (chat) | De primera mano: corrió a 4× de resolución interna sin throttling. Uno de los sistemas más cómodos en la placa. ([src](https://t.me/c/2424231195/101579), [src](https://t.me/c/2424231195/103218), [src](https://t.me/c/2424231195/111096)) |
| **PS Vita** | **Vita3K** | ⚠ Experimental (general ⚠) | Vita3K es el único emulador de Vita y sigue temprano en todas partes; espera rupturas por juego. Sin reporte de BC-250. (Una frase del chat de "básicamente una PS Vita al máximo" iba sobre el hardware, no el emulador. ([src](https://t.me/c/2424231195/86140))) |
| **PS3** | **RPCS3** | ⚠️ Funciona, ajuste por juego (chat) | El más castigador de CPU de los objetivos realistas. Reportados Uncharted "estable, jugable", "funciona genial"; un tester temprano se topó con errores. Necesita retoques título por título. Existe un vídeo guía de PS3 de la comunidad. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/74644), [src](https://t.me/c/2424231195/53601), [src](https://t.me/c/2424231195/13)) |
| **PS4** | **shadPS4** (0.9.0+; 0.16 en 2026) | ✅ Bloodborne / Drive Club jugables (chat) | "Se lanza en 2 clics." Bloodborne suave y sin caídas; Drive Club 100 %; algunos títulos hacen artifacting pero mantienen los FPS. Por juego. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/38706), [src](https://t.me/c/2424231195/82128)) |

### Microsoft

| Sistema | Mejor emulador de Linux | Estado en BC-250 | Notas |
|--------|--------------------|------------------|-------|
| **Xbox (OG)** | **xemu** | ⚠ Debería funcionar (general ⚠) | xemu es LLE con ~80 % de los juegos jugables; AppImage nativo de Linux. Sin reporte de BC-250 — pero un objetivo ligero para esta CPU. Verifica por juego. |
| **Xbox 360** | **Xenia** (stock) | ⚠️ Arranca, rendimiento bajo (chat) | Xenia a secas corre pero "el rendimiento en stock está por los suelos" — el overclock es obligatorio. ([src](https://t.me/c/2424231195/23577)) |
| **Xbox 360** | **Xenia Canary** | ❌ Pantalla negra en el juego (chat) | Los menús cargan y el gamepad responde, pero el gameplay es una pantalla negra. En Linux el backend de Vulkan sigue incompleto. Sin resolver. ([src](https://t.me/c/2424231195/78988)) |

### Sega

| Sistema | Mejor emulador de Linux | Estado en BC-250 | Notas |
|--------|--------------------|------------------|-------|
| **Master System** | Genesis Plus GX — RetroArch | ✅ Trivial (general ⚠) | Un core cubre SMS/Genesis/Game Gear/SG-1000/Sega CD. |
| **Genesis / Mega Drive** | Genesis Plus GX (BlastEm para precisión) | ✅ Trivial (general ⚠) | Trivial para este hardware. |
| **Game Gear** | Genesis Plus GX — RetroArch | ✅ Trivial (general ⚠) | El mismo multi-core de Sega. |
| **Saturn** | **Mednafen/Beetle Saturn** (o Kronos) | ✅ Debería ir fino (general ⚠) | Saturn es famosamente pesado de CPU para emular, pero trivial para Zen 2. Sin reporte de BC-250. |
| **Dreamcast** | **Flycast** (standalone o RetroArch) | ✅ Debería correr bien (general ⚠) | Flycast es maduro y ligero; cómodo en este hardware. No benchmarkeado en el chat. |

### Otros / arcade / ordenador

| Sistema | Mejor emulador de Linux | Estado en BC-250 | Notas |
|--------|--------------------|------------------|-------|
| **Arcade / MAME** | **MAME** (o FinalBurn Neo) — RetroArch | ✅ Fácil para la mayoría (general ⚠) | FBNeo para los sets comunes; MAME completo para todo. Las placas arcade pesadas de finales de los 90/3D todavía pueden ser exigentes. |
| **Neo Geo** | **FinalBurn Neo** — RetroArch | ✅ Trivial (general ⚠) | FBNeo es la elección para Neo Geo / CPS. |
| **TurboGrafx-16 / PC Engine** | **Beetle PCE** — RetroArch | ✅ Trivial (general ⚠) | Core Beetle/Mednafen PCE. |
| **Atari (2600/5200/7800/ST/…)** | Stella / RetroArch (Atari800, Hatari) | ✅ Trivial (general ⚠) | Stella para 2600; existen cores para el resto. |
| **DOS** | **DOSBox** (DOSBox-Staging / DOSBox-X) | ✅ Trivial (general ⚠) | O el core DOSBox-Pure de RetroArch. |
| **ScummVM** | **ScummVM** (Linux nativo) | ✅ Trivial (general ⚠) | Reimplementación de motor, no emulación — corre en cualquier lado. |

> ✅ funciona / trivial · ⚠️ funciona con salvedades · ❌ roto · **(chat)** = reporte de primera mano en BC-250 (citado) · **(general ⚠)** = mejor emulador de Linux + expectativa para esta clase de hardware, **no probado en BC-250**.

---

## Expectativas realistas — qué es fácil vs difícil

| Nivel | Sistemas | Realidad en una BC-250 a 2000 MHz, refrigerada |
|------|---------|--------------------------------------|
| **Cómodo** | NES · SNES · GB/GBC/GBA · N64 · DS · 3DS · **PS1 · PS2 · PSP** · Genesis/SMS/Game Gear · Saturn · Dreamcast · Arcade/Neo Geo/PCE · Atari · DOS · ScummVM · **GameCube · Wii** | El punto dulce de la placa. Lo retro es trivial; la PSP está confirmada por el chat a 4× res; PS2/GC/Wii están bien dentro de la clase de este hardware (expectativa general — benchmarkea tus propios títulos exigentes). Usa EmuDeck o RetroArch y a correr. |
| **Exigente / a suerte** | **Switch · PS3 · PS4** | Real, pero limitado por CPU y por juego. Switch (Eden) "bien y rápido" pero los first-party pesados caen frames; PS4 (shadPS4) genial para los títulos adecuados (Bloodborne); PS3 (RPCS3) funciona pero necesita ajuste por juego. Fija el governor al máximo primero. |
| **Apenas / todavía no** | **Xbox 360** · Wii U · PS Vita | Xenia arranca los menús y luego hace pantalla negra en el gameplay (chat). Wii U (Cemu) y Vita (Vita3K) están sin confirmar en la placa y son exigentes/experimentales en general — verifica antes de confiar en ellos. |
| **Una experiencia sin líos, sin OC** | (cualquier sistema exigente) | No. Sin el overclock la GPU se subclockea dentro de los emuladores e incluso Switch se ahoga. Haz el OC + la refrigeración primero. |

---

## Fuentes

- Resumen de emuladores (Switch/Eden, PS3/RPCS3, PS4/shadPS4, Xbox360/Xenia) — https://t.me/c/2424231195/78988
- "Eden es el más decente" — https://t.me/c/2424231195/130842 · Eden se instala y funciona — https://t.me/c/2424231195/98942 · Eden + EmuDeck Ryujinx — https://t.me/c/2424231195/99039 · Ryujinx corrió — https://t.me/c/2424231195/51606 · TOTK en Eden cae frames (NX Optimizer) — https://t.me/c/2424231195/124216 · La CPU es el muro, GPU infrautilizada — https://t.me/c/2424231195/136712
- Estado temprano de los emuladores (Yuzu/Suyu cuelgan, Ryujinx ok, Xenia bajo, RPCS3 errores) — https://t.me/c/2424231195/23577
- PS4/shadPS4 Bloodborne ("2 clics") — https://t.me/c/2424231195/38704 · https://t.me/c/2424231195/38706 · Drive Club 100 % — https://t.me/c/2424231195/82128
- PS3/RPCS3 Uncharted estable y jugable — https://t.me/c/2424231195/74644 · "funciona genial en RPCS3" — https://t.me/c/2424231195/53601 · vídeo guía de emulación de PS3 — https://t.me/c/2424231195/13
- PSP/PPSSPP corrió (4× resolución, sin throttle) — https://t.me/c/2424231195/101579 · https://t.me/c/2424231195/103218 · https://t.me/c/2424231195/111096
- Wii U/Cemu preguntado en kernel 6.15+ — https://t.me/c/2424231195/68253 · cemu vía AUR (paru) — https://t.me/c/2424231195/74138
- Dolphin desde terminal — https://t.me/c/2424231195/19715 · "básicamente una PS Vita al máximo" (hardware, no emulador) — https://t.me/c/2424231195/86140
- Governor atascado a 1000 MHz en el emulador; fijar máximo manualmente — https://t.me/c/2424231195/130879 · https://t.me/c/2424231195/130955 · parche Zelda 30→60 — https://t.me/c/2424231195/130887
- Sin imagen preconfigurada (tabú de la comunidad) — https://t.me/c/2424231195/130845 · https://t.me/c/2424231195/130877
- Nintendo litiga contra los emuladores de Switch / las keys son difíciles de encontrar — https://t.me/c/2424231195/136649
- Batocera (distro de emulación) confirmada corriendo en la BC-250 — [hilo de r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- Especificación de hardware (6× Zen 2 @ ~3,5 GHz, RDNA2 24→40 CU, 16 GB GDDR6) — [elektricm/amd-bc250-docs](https://elektricm.github.io/amd-bc250-docs/hardware/specifications/)
- Marco general de capacidad de emulación (⚠ verifica; esta guía de terceros cuenta mal los núcleos como 8) — [guía koukan.co.uk BC-250](https://www.koukan.co.uk/blog/amd-bc-250-guide)

> El overclock del que dependen estos resultados vive en [09-overclock-undervolt.md](09-overclock-undervolt.md); haz el mod de [04-cooling.md](04-cooling.md) antes de correr 2000 MHz. Para el panorama más amplio del gaming y la explicación del límite por CPU, ver [11-gaming.md](11-gaming.md); para instalar el SO en el que corren los emuladores, ver [06-linux.md](06-linux.md).
