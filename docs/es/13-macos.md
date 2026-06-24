> 🌐 Traducción de la comunidad. La versión en inglés es la fuente de verdad y puede estar más actualizada. ¿Encontraste un error? Abre un issue: [../en/13-macos.md](../en/13-macos.md) · https://github.com/lildebil0/awesome-bc250/issues

# macOS / Hackintosh

> **TL;DR** — **No lo hagas.** Probablemente puedas arrancar macOS en la CPU de la BC-250 (es un chip AMD Zen 2, y los trucos genéricos de hackintosh AMD-OSX aplican), pero la **GPU no acelerará** y no hay un camino realista para conseguirlo. macOS soporta GPUs por device ID codificado a mano; la GPU de la BC-250 (Cyan Skillfish / Oberon, una pieza recortada de PS5) **no tiene un gemelo de escritorio soportado nativamente contra el que hacer spoofing**, y el stack de Apple *nunca* se ha hecho funcionar con los gráficos integrados de ninguna APU de AMD. Así que tendrías un Mac lento, renderizado por software y sin Metal. A fecha de 2026, nadie en la comunidad ha reportado un resultado acelerado funcionando. Usa Linux en su lugar — consulta [06-linux.md](06-linux.md).

Esto es una **curiosidad de nicho**, no un caso de uso real. La respuesta honesta es toda la sección.

---

## Por qué la aceleración de la GPU es el muro

Las dos publicaciones técnicas con más reacciones sobre el tema llegan a la misma conclusión, y explican el mecanismo con claridad.

macOS no tiene un modelo de drivers abierto como Linux. Distribuye drivers cerrados que se enlazan a GPUs específicas **por device ID**, y el único punto donde puedes intervenir es el gestor de arranque **OpenCore** *antes* de que el SO cargue — OpenCore entrega a macOS datos precocinados, no puede parchear el sistema cerrado desde dentro ([src](https://t.me/c/2424231195/103173)).

OpenCore *puede* hacer spoofing del device ID de una GPU, pero solo **dentro de una misma familia arquitectónica** — p. ej. presentar una RX 6950 XT no soportada como una RX 6900 XT soportada, porque son el *mismo* silicio. Ese truco les costó a los desarrolladores de OpenCore **más de un año** y funcionó solo porque esas tarjetas Navi son arquitectónicamente idénticas a unas que Apple ya soportaba ([src](https://t.me/c/2424231195/53321)).

La BC-250 rompe eso de dos maneras:

1. **No hay gemelo al que hacer spoofing.** Su GPU es una pieza recortada derivada de PS5 (`gfx1013`). **No existe ninguna tarjeta de escritorio AMD con la misma arquitectura que macOS soporte nativamente**, así que no hay nada a lo que hacerse pasar. Para que la BC-250 funcionara, el stack de Apple tendría que aprender este device ID desde cero — lo cual solo ocurre si los desarrolladores de OpenCore adoptan el chip, y no hay razón comercial para ello ([src](https://t.me/c/2424231195/53321)).
2. **Es una APU, y las APU nunca han funcionado.** Incluso los gráficos integrados Ryzen de arquitectura de escritorio (iGPUs Vega / Navi) **nunca** se han puesto en marcha en macOS, a pesar de compartir microarquitectura con tarjetas discretas soportadas. El autor "no ha visto un solo caso funcional" de una iGPU Ryzen en macOS ([src](https://t.me/c/2424231195/103173)). La BC-250 está en ese mismo cajón de APUs.

El resumen contundente del mismo colaborador: *si ni siquiera los drivers de Windows para este chip están resueltos, macOS no merece soñarse* ([src](https://t.me/c/2424231195/53321)). (Para la situación de los drivers de Windows, consulta [07-windows.md](07-windows.md).)

---

## Lo que la gente realmente intentó

- Alguien preparó y compartió pronto un paquete de **recovery de macOS Monterey + OpenCore** (`Monterey recovery + OpenCore.zip`, más un `Архив.zip` anterior), así que al menos una persona se propuso instalarlo ([src](https://t.me/c/2424231195/53590)). Nunca se reportó ningún éxito de GPU acelerada.
- El conjunto de herramientas al que la gente apuntó es el kit estándar de hackintosh AMD: falsificación de device ID vía [RehabMan/OS-X-Fake-PCI-ID](https://github.com/RehabMan/OS-X-Fake-PCI-ID), la [guía de compra de GPU AMD de Dortania](https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series) para saber qué está realmente soportado, y — lo más cercano a soporte de gráficos de APU — **[ChefKissInc/NootedRed](https://github.com/ChefKissInc/NootedRed)**, un kext para iGPUs de APU AMD. NootedRed está dirigido a APUs de clase Vega/Renoir y **no** cubre el die de la BC-250, así que no rescata esta placa.
- Un enlace de foro posterior sobre [ejecutar macOS en AMD Ryzen vía VMware/OpenCore](https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/) ([src](https://t.me/c/2424231195/107779)) es **hackintosh AMD genérico**, no específico de la BC-250 — y una VM significa de todas formas sin passthrough de GPU/Metal.

> ⚠ **No confundas bromas con resultados.** El tema tiene chanzas ligeras tipo "genial, aquí manda el poderoso hackintosh" ([src](https://t.me/c/2424231195/85166)) y reacciones de elogio que *no* son reportes de un macOS funcionando. Nada en la evidencia muestra macOS acelerado en una BC-250.

---

## Entonces, ¿merece la pena?

**No, para ningún propósito práctico.** El mejor resultado realista es un macOS solo-CPU que renderiza la interfaz por software — sin Metal, sin cómputo de GPU, inservible para las cargas de juegos/IA por las que se compra esta placa. El consenso de la comunidad, datado y sin cambios desde **2025-06** hasta **2026-03**, es que el soporte de GPU es efectivamente imposible sin que los desarrolladores de OpenCore adopten específicamente este chip, lo cual no ha ocurrido y no se espera.

Si quieres que esta placa *haga* algo, instala Linux ([06-linux.md](06-linux.md)) donde la GPU está genuinamente soportada vía Mesa/RADV. Windows es un segundo distante ([07-windows.md](07-windows.md)). macOS queda en último lugar y, en la práctica, es un callejón sin salida.

---

## Fuentes

- GPU-por-device-ID + la historia de un año del spoof de Navi — https://t.me/c/2424231195/53321
- Los límites de OpenCore y "ninguna iGPU Ryzen ha funcionado nunca" — https://t.me/c/2424231195/103173
- Paquete Monterey + OpenCore que alguien preparó — https://t.me/c/2424231195/53590
- Hilo genérico de foro de hackintosh AMD-Ryzen (no específico de la BC-250) — https://t.me/c/2424231195/107779 · [hilo de amd-osx.com](https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/)
- Herramientas referenciadas — [RehabMan/OS-X-Fake-PCI-ID](https://github.com/RehabMan/OS-X-Fake-PCI-ID) · [ChefKissInc/NootedRed](https://github.com/ChefKissInc/NootedRed) (kext de iGPU de APU AMD; no cubre este die) · [guía de GPU AMD de Dortania](https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series)
- Identidad del chip (Cyan Skillfish / Oberon, `gfx1013`) — consulta [01-what-is-bc250.md](01-what-is-bc250.md)

> **En resumen:** macOS en la BC-250 es una nota al pie de trivia tecnológica, no un objetivo de build. Ve a [06-linux.md](06-linux.md).
