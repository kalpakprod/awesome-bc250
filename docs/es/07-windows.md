> 🌐 Traducción de la comunidad. La versión en inglés es la fuente de verdad y puede estar más actualizada. ¿Encontraste un error? Abre un issue: [../en/07-windows.md](../en/07-windows.md) · https://github.com/lildebil0/awesome-bc250/issues

# Drivers y configuración en Windows

> **TL;DR** — A **principios de 2026 no hay ningún driver de GPU funcional para la BC-250 en Windows.** Windows se instala y arranca, pero la GPU se queda con el **Code 43** y cero aceleración 3D — cada driver de AMD de fábrica (Adrenalin, Pro, el truco del `.inf` de la W5700) es rechazado por el hardware. La comunidad está **haciendo ingeniería inversa de uno desde cero**, y el estado honesto es "la infraestructura básica temprana funciona, pero todavía no se renderiza ningún juego". Si quieres realmente *usar* esta placa hoy, **instala Linux** ([06-linux.md](06-linux.md)) — ahí es donde vive el driver que funciona. Trata todo lo de esta página con escepticismo y revisa las fechas de los commits del repo antes de fiarte.

El veredicto de la comunidad de toda la vida, fijado para los recién llegados desde 2025: *"Abandonad toda esperanza, los que entráis aquí. Los drivers de Windows no van a pasar con un 99.5% de probabilidad. Sin un driver esta placa es casi completamente inútil. El driver de Linux existe — si no estás listo para ese sistema operativo, no necesitas esta placa."* ([src](https://t.me/c/2424231195/28109))

Ese fue el consenso durante más de un año. **Por fin se está cuestionando** en 2026 — pero despacio, y la respuesta honesta sigue siendo: todavía no.

---

## Por qué Windows es difícil aquí (el muro del Code 43)

La APU de la BC-250 ("Cyan Skillfish" / Oberon, GFX10.1.3) se presenta al sistema operativo como un **dispositivo desconocido** — PCI ID `1002:13FE` — que ningún driver de AMD comercializado reconoce. La gente ha probado de todo:

- **Meterle a la fuerza un `.inf` oficial** al Administrador de dispositivos: el único driver que Windows ofrece como "compatible" es el de la **Radeon Pro W5700**. Se instala y luego se cuelga en el **Error 43**, exactamente como cualquier otro driver probado. ([src](https://t.me/c/2424231195/57123))
- **Editar el `.inf` / cambiar los device IDs** (gfx1013, 1014, Navi 21/22/23 "Dragonball", entradas legacy), deshabilitar la imposición de firma de drivers, incluso arrancar Windows 10 desde USB y probar un driver de Steam Deck — **todo callejones sin salida**. Las entradas legacy aparecen sin error solo por un bug de visualización, no porque funcionen. ([src](https://t.me/c/2424231195/94029))
- **Modear la BIOS** para cambiar el device ID tampoco ayudó — la iGPU sigue reportando `1002:13FE`. El Dev ID parece estar **soldado a la APU**, no solo a la BIOS, así que parchear un solo sitio no es suficiente. ([src](https://t.me/c/2424231195/57123))

¿Por qué Linux funciona y Windows no? En Linux la comunidad parcheó el stack open-source de **amdgpu/Mesa** (y en parte lo integró upstream) para reconocer exactamente este chip; en Windows no hay ningún driver abierto que parchear — AMD nunca lanzó un driver de Windows para esta pieza de minería/servidor, y el stack cerrado de Adrenalin/Pro rechaza el ID desconocido. ([src](https://t.me/c/2424231195/13210)) El propio hilo del foro de AMD sobre "BC-250 drivers" no llegó a ninguna parte. ([community.amd.com](https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692))

> **Tampoco hay una vía de escape por passthrough de GPU.** Ejecutar Windows en una máquina virtual con la BC-250 pasada por passthrough no funciona: la ruta de passthrough por IOMMU está rota en esta placa, y es una *APU* (no una tarjeta dedicada que el host pueda ceder limpiamente), y de entrada el chip se detecta mal como un dispositivo desconocido. ([src](https://t.me/c/2424231195/64772))

---

## Estado actual del driver — qué existe realmente (a principios de 2026)

A finales de 2025 la comunidad dejó de esperar a AMD y empezó a **construir un driver de Windows desde cero** haciendo ingeniería inversa del hardware. Importan dos esfuerzos; ambos son **experimentales, WIP, y todavía no renderizan juegos.**

### Keshas-dev — el driver WDDM desde cero (el más activo)

Un par de drivers en modo kernel complementarios, el esfuerzo de Windows más activamente desarrollado (el **driver del PSP por sí solo tiene ~56 commits** al momento de escribir esto):

- **[Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver)** — un driver de bajo nivel para el **PSP** (Platform Security Processor). **Qué funciona:** carga, arranca el **firmware SOS**, lee/escribe registros de hardware sobre BAR5 MMIO (bloques GC, MMHUB, HDP, NBIO, DF), hace el unlock de NBIO, y actúa como proxy de registros para el driver de la GPU. **Qué no funciona:** la creación del ring GPCOM (el firmware SOS no soporta el protocolo del ring TOS), la carga del firmware de la GPU vía ring buffer, y la init de la Trusted Memory Region. En otras palabras: puede hablar con el chip, pero **todavía no puede levantar el motor gráfico.** ([repo](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver/commits/main/))
- **[Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver)** — el driver de la GPU complementario. Comparte la misma infraestructura de certificado/firma de prueba (test-signing) que el driver del PSP y lo usa como puente de registros. Todavía está en una fase temprana; sin salida 3D utilizable. ([repo](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver/commits/main/))

La primera señal pública de vida fue un miembro reportando **"mi primer driver funcional (OpenGL 1.1)"** en octubre de 2025 ([src](https://t.me/c/2424231195/83320)) — celebrado precisamente porque incluso un driver apenas funcional *instalándose y ejecutándose* era un hito real tras un año de Code 43: *"si este driver de verdad se instaló y funciona (aunque sea mal) — eso es un paso enorme."* ([src](https://t.me/c/2424231195/83332)) Un dump de driver de esa oleada, `AMD Radeon BC-250 (Cyan Skillfish) driver 00.00.01.7z`, se compartió/fijó en el chat. ([src](https://t.me/c/2424231195/83322)) **Trata cualquier dump tan temprano como experimental — la versión `00.00.01` es exactamente tan cruda como suena.**

### ZEROAESQUERDA — la implementación de referencia WDDM 2.0

**[ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest)** — un esfuerzo aparte ("el tipo portugués empezó algo"), fijado en el chat en marzo de 2026 como señal de que el hielo se estaba rompiendo. ([src](https://t.me/c/2424231195/123644)) Se entiende mejor como una **implementación WDDM 2.0 de referencia/educativa**, no como un driver utilizable:

- Implementa solo el **DDI de Direct3D 9**; **D3D11, D3D12 y Vulkan no están implementados.**
- **La compilación de shaders para RDNA2 (ISA de GFX10.1) no es funcional** — acepta envíos de shaders pero no puede compilarlos para el hardware real, así que no se renderiza nada.
- **No** carga el microcódigo del Command Processor (depende del firmware cargado por la BIOS); **encode/decode de vídeo VCN no soportado**; solo una salida DisplayPort.
- Requiere el **modo de firma de prueba (test-signing)** (sin firma WHQL). Solo ~2 commits en main.

Mira la propia sección **[Known Limitations](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas)** del proyecto antes de gastar tiempo en él.

> ⚠ **Corrección del nombre del repo.** La lista principal de repos apunta a `ZEROAESQUERDA/PS5GPU-BC250` bajo "Drivers → Windows". Al inspeccionarlo, ese repo es un **governor de GPU para Linux** (un fork del Oberon-governor con GUI), **no** un driver de Windows. El código de Windows real de este autor es **`BC250-windowsDriverTest`**.

### Estado de un vistazo

| Proyecto | Tipo | Qué funciona | Qué no funciona | ¿Usarlo hoy? |
|---|---|---|---|---|
| Keshas-dev/AMD-BC-250-PSP-Driver | Driver kernel del PSP (WIP) | Arranca el firmware SOS, R/W de registros BAR5, unlock de NBIO, proxy de registros | Creación del ring de la GPU, carga del FW, init de TMR | No — solo infraestructura básica |
| Keshas-dev/AMD-BC-250-Windows-Driver | Driver de la GPU (WIP) | Carga junto al driver del PSP | Sin 3D utilizable | No |
| ZEROAESQUERDA/BC250-windowsDriverTest | Referencia WDDM 2.0 | Andamiaje del modelo de driver, DDI de D3D9 presente | Compilación de shaders, D3D11/12, Vulkan, VCN | No — educativo |
| Adrenalin / Pro / `.inf` de la W5700 | AMD oficial | — | **Code 43**, nada | No |

**En resumen:** nadie está jugando en Windows en una BC-250 hoy. El trabajo es real y se está acelerando, pero está en la fase de "¿podemos hacer que la GPU se inicialice siquiera?", no en la de "¿cuántos FPS me da el Cyberpunk?".

---

## Si aun así quieres probar los drivers WIP

Esto es para los trasteadores que quieren **ayudar a testear**, no para conseguir un escritorio funcional. Vas a necesitar:

- **Windows 10 (build 1607+) o Windows 11, x64.**
- **Firma de prueba (test-signing) habilitada** y **Secure Boot deshabilitado** (estos drivers van sin firmar / firmados de prueba):
  ```
  bcdedit /set testsigning on
  ```
  Reinicia. ⚠ verifica — los pasos exactos siguen el README de cada repo; los comandos de aquí son el flujo estándar de firma de prueba del WDK, no copiados de un script de algún proyecto.
- Instala con el **script de PowerShell** que provee el repo (p. ej. `Install-Driver.ps1`) o manualmente con `pnputil`. Sigue el **README del repo**, no esta página — estos proyectos cambian rápido y los pasos de instalación se mueven con ellos.

Espera: en el mejor de los casos, el dispositivo se enumera y aparecen logs de init temprana; en el peor, no cambia nada o te sale un código de error distinto. **Haz copia de seguridad de cualquier cosa que te importe y asume que no va a renderizar.**

### ⚠ Rumor sin verificar: "filtrar drivers brickea la placa"

Durante la fase de beta-test de principios de 2025, un miembro advirtió que **se estaban brickeando BC-250s de forma remota por filtrar drivers de prelanzamiento** — afirmando reportes en Reddit de brickeos, bloqueos remotos de dispositivos, y que ni siquiera un programador de hardware podía desbloquearlas. ([src](https://t.me/c/2424231195/26231)) **No pudimos verificarlo**, y todo el encuadre de "beta privada" alrededor de esto es dudoso (ver la siguiente sección). Se menciona para que conste; no lo tomes como un hecho establecido. Si brickeas una placa por razones no relacionadas, mira [08-bios.md](08-bios.md) para la recuperación.

---

## Bromas, engaños y callejones sin salida — no piques con estos

El hype de drivers de Windows en la BC-250 tiene una larga historia de **bromas y pensamiento ilusorio**. Conoce las famosas para no malgastar un fin de semana:

- **El "driver de NVIDIA para la AMD BC-250".** Una broma del **Día de los Inocentes de abril (April Fools, 1 de abril de 2026)** — un banner falso y bien hecho de "NVIDIA NEW DRIVER RELEASE … for AMD BC-250" que por un momento tuvo a la gente preguntando *"¿NVIDIA de verdad sacó un driver de Windows para la BC-250?!"* ([src](https://t.me/c/2424231195/130053)) No lo hizo. NVIDIA no hace drivers para una APU de AMD. La reacción en el chat fue *"ha llegado la broma tan esperada."* ([src](https://t.me/c/2424231195/130727)) Ten en cuenta también que circuló un `.exe` con un nombre tipo `whql-amd-software-adrenalin-edition-25.5.1-...-bc250.exe` — un instalador normal de Adrenalin con "bc250" pegado al nombre del archivo **no** lo convierte en un driver de BC-250. ([src](https://t.me/c/2424231195/73924))
- **"Simplemente fuerza la instalación del driver de una tarjeta parecida".** RX 6700 / W5700 / Radeon Pro V340 — la primera idea de todo recién llegado, y se le ha ocurrido a *"todo tonto que haya tenido alguna vez una BC-250 en la mano."* No puede funcionar, por un montón de razones que no vale la pena volver a derivar: **en la BC-250 no hay drivers de Windows, ni honor, ni cerveza.** ([src](https://t.me/c/2424231195/29710))
- **Malware en el canal.** La gente ha publicado "drivers" falsos que eran virus / zip-bombs / phishers. Los mods banean en cuanto los ven; una vez apareció un archivo literalmente llamado `Trojan.txt`. ([src](https://t.me/c/2424231195/49668)) **Ejecuta solo binarios de los repos de GitHub nombrados, y lee el código.**

---

## ¿Y qué hay del script de unlock de 40 CU que la gente menciona?

`git clone https://github.com/duggasco/bc250-40cu-unlock.git` aparece en la cháchara del tema de Windows, y la lista maestra de recursos incluso lo etiqueta bajo "Windows". **Es un parche/script del kernel de `amdgpu` para Linux** (`bc250-enable-40cu.sh`), no una herramienta de Windows — desbloquea las 40 CU completas en el driver de Linux. Se cubre como es debido en [09-overclock-undervolt.md](09-overclock-undervolt.md); no hace nada para Windows. ⚠ verifica (ningún historial de shell del corpus de Command confirma un uso en Windows; el único comando capturado es el `git clone` simple de arriba).

---

## Recomendación

| Quieres… | Haz esto |
|---|---|
| Jugar / usar realmente la placa ahora | **Instala Linux.** Mira [06-linux.md](06-linux.md). El driver de GPU que funciona solo existe ahí. |
| Seguir / contribuir al esfuerzo de Windows | Vigila **Keshas-dev** (driver del PSP + GPU) y **ZEROAESQUERDA/BC250-windowsDriverTest**; espera trabajo de kernel/WDK, no gaming. |
| Un `.inf` mágico o un driver de "tarjeta parecida" | No existe. Para aquí — solo te toparás con el Code 43. |

El soporte de Windows es un **objetivo en movimiento**: vuelve a comprobar las fechas de los commits del repo y la fecha de esta sección (esto refleja **principios de 2026**) antes de actuar. El veredicto de 2025 era "nunca"; 2026 lo rebajó a "todavía no" — progreso real, pero progreso en la capa de init del firmware, no en la del escritorio jugable.

---

## Fuentes

- Advertencia fijada para recién llegados ("abandonad toda esperanza") — https://t.me/c/2424231195/28109
- Code 43 / `.inf` de la W5700 / intentos de mod de BIOS — https://t.me/c/2424231195/57123 · https://t.me/c/2424231195/94029
- "No hay drivers de Windows, ni honor, ni cerveza" — https://t.me/c/2424231195/29710 · por qué Linux y no Windows — https://t.me/c/2424231195/13210
- El passthrough en VM no va a funcionar — https://t.me/c/2424231195/64772
- Primer driver "funcional" (OpenGL 1.1) y reacción — https://t.me/c/2424231195/83320 · https://t.me/c/2424231195/83332 · dump de driver `00.00.01` — https://t.me/c/2424231195/83322
- Proyecto de ZEROAESQUERDA fijado / "el hielo se rompe" — https://t.me/c/2424231195/123644
- "Driver de NVIDIA" del April Fools — https://t.me/c/2424231195/130053 · https://t.me/c/2424231195/130727 · `.exe` de Adrenalin mal etiquetado — https://t.me/c/2424231195/73924
- Política de baneo de malware — https://t.me/c/2424231195/49668 · rumor de brickeo-al-filtrar (sin verificar) — https://t.me/c/2424231195/26231
- Repos — [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) · [Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver) · [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) ([known limitations](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas))
- Hilo del foro de AMD (no llegó a nada) — https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692
- Unlock de 40 CU (Linux, mal etiquetado como Windows) — https://github.com/duggasco/bc250-40cu-unlock → mira [09-overclock-undervolt.md](09-overclock-undervolt.md)

> El unlock de 40 CU, el governor, y la configuración del driver de Linux viven en [06-linux.md](06-linux.md) y [09-overclock-undervolt.md](09-overclock-undervolt.md). Recuperación de placa brickeada: [08-bios.md](08-bios.md).
