> 🌐 Traducción de la comunidad. La versión en inglés es la fuente de verdad y puede estar más actualizada. ¿Encontraste un error? Abre un issue: [../en/11-gaming.md](../en/11-gaming.md) · https://github.com/lildebil0/awesome-bc250/issues

# Resultados y ajustes de juegos

> **TL;DR** — La BC-250 es una **GPU de clase PS5 atornillada a una Zen2 de 6 núcleos recortada**. La GPU es genuinamente capaz: a un overclock realista de **2000 MHz** ejecuta títulos AAA modernos a **40–60 FPS**, y juegos más ligeros/antiguos bastante por encima de 60. La pega es la **CPU**. La mitad Zen2 de la APU es el cuello de botella mucho más a menudo que la GPU — los benchmarks de la comunidad muestran repetidamente la tarjeta sentada en **~36–47 % de carga de GPU mientras está clavada a ~38 FPS**, limitada por CPU. Así que: **haz overclock primero** (de fábrica ~1500 MHz es ~30 % más lento), apóyate en **FSR** y la generación de fotogramas, apunta a **1080p–1440p**, y acepta que los juegos con mucha física o mal hilados darán tirones sin importar la resolución. Los ports de primera parte estilo consola (God of War, Horizon, Last of Us, Spider-Man) son el punto dulce.

Esta sección fija las expectativas y reúne los resultados reales y publicados de la comunidad — muchos de ellos capturas de benchmarks. Los números varían con la frecuencia, la distro, el driver y el reparto de VRAM, así que cada fila está atada a su fuente.

---

## Lo primero que hay que entender: está limitada por CPU

La GPU de la BC-250 es una pieza RDNA2 derivada de PS5 (RADV la reporta como `GFX1013` / clase NAVI10). *No* es el eslabón débil en la mayoría de los juegos. El eslabón débil es la **CPU Zen2 de 6 núcleos** corriendo a ~3,5 GHz con caché recortada estilo PS5 y sin margen de SMT que dar.

Un benchmark de la comunidad a **1080p, Alto, GPU @ 2000 MHz / mem @ 3600 MHz** lo concreta: la prueba **"alcanzó 38 FPS"** con un **Porcentaje Limitado por GPU de solo 36,5 %** — el hilo de simulación de la CPU era la barrera (sim de CPU ~70 / render de CPU ~43 / GPU ~47 en el medidor por etapas). La GPU estaba en ralentí a un tercio de su capacidad mientras la CPU mantenía la tasa de fotogramas baja. ([src](https://t.me/c/2424231195/136242))

Consecuencias prácticas:

- **La resolución suele ser "gratis".** Como estás limitado por CPU, ir de 1080p a 1440p (o incluso 4K con FSR) frecuentemente cuesta pocos FPS — la GPU tenía margen de sobra de todas formas. Varios resultados de 4K más abajo se ven casi tan bien como sus equivalentes de 1080p precisamente por esto.
- **El escalado ayuda menos que en un PC normal.** FSR descarga la GPU, pero si la CPU es el límite, bajar la resolución de render no subirá mucho tus FPS. Usa FSR para calidad de imagen / térmicas, no como un botón mágico de FPS.
- **Los juegos mal hilados o con mucha física te castigan.** Los tirones y picos de frame-time (Gothic Remake, Doom: The Dark Ages antes de los arreglos) vienen de la CPU, no de la GPU.
- **Haz overclock a la GPU de todas formas** — cuando un juego *sí* está limitado por GPU (4K, ray tracing pesado, motores bien hilados), 1500 → 2000 MHz es ~+30 % de FPS. Consulta [09-overclock-undervolt.md](09-overclock-undervolt.md) para saber cómo llegar ahí, y [04-cooling.md](04-cooling.md) primero, porque 2000 MHz necesita el mod de refrigeración.

---

## Ajustes que de verdad mueven la aguja

- **Frecuencias.** La GPU de fábrica a ~1500 MHz es el valor lento por defecto; la comunidad corre **GPU a 2000 MHz, mem ~1900–2000 MHz** como objetivo diario, con algunos empujando **2,65 GHz de núcleo en un build de clase dGPU**. De fábrica frente a 2000 MHz es aproximadamente **+30 % de FPS** en escenas limitadas por GPU. ([guía de overclock](09-overclock-undervolt.md))
- **Desbloqueo de 40 CU.** La placa viene con CU deshabilitadas. Desbloquear las **40 CU** da una mejora medible y amplia — un usuario reportó que Doom: The Dark Ages pasó de roto a **60 FPS en Alto**, un título "007" a **60 FPS en Alto**, y frame-times más estables en Great Pragmata tras el desbloqueo. ([src](https://t.me/c/2424231195/141193)) Consulta [09-overclock-undervolt.md](09-overclock-undervolt.md).
- **FSR / FSR 4.** Usa Calidad o Equilibrado a 1440p/4K para mantener la GPU alimentada y las temperaturas bajas. La comunidad está portando activamente **FSR 4** (paquetes DLL compartidos en el hilo). ([discusión de FSR4 INT8 src](https://t.me/c/2424231195/136354)) Ganancias de FSR medidas por elektricM: **Calidad +20–30 %, Equilibrado +30–40 %, Rendimiento +40–60 %** de FPS; la **generación de fotogramas puede aproximadamente duplicar** la tasa de fotogramas (ligera latencia). **FSR 4 vía Optiscaler** — la comunidad encuentra que **Equilibrado supera a Calidad de FSR 3.1.5 nativo**. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
  - **Qué escalador usar de verdad:** **FSR 1–3 es la opción práctica** aquí — es maduro, barato y bien soportado. **FSR 4 y XeSS *pueden* técnicamente correr** sobre este silicio RDNA2 vía el **camino DP4a (INT8)** — RDNA2 tiene dp4a/Rapid Packed Math, así que tanto el build FSR 4 INT8 de OptiScaler como la variante XeSS-DP4a agnóstica de GPU cargan — pero en una GPU tan débil son **lentos y experimentales**: el fallback DP4a es ~10–20 % más pesado que el camino WMMA que usan las tarjetas más nuevas, y la calidad de imagen en XeSS-DP4a está por debajo de la versión XMX. Trata FSR 4 / XeSS como algo con lo que experimentar, no como tu opción diaria. ([OptiScaler FSR4 INT8 en RDNA2 — VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/)) **El FSR 4 oficial de AMD para RDNA2 (clase RX 6000) llega ~principios de 2027**; hasta entonces es la ruta OptiScaler/modificada. ([Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals))
- **Generación de fotogramas más allá de FSR — LSFG.** La **Lossless Scaling Frame-Generation (LSFG)** corre en Linux a través de la capa Vulkan **`lsfg-vk`** ([github.com/PancakeTAS/lsfg-vk](https://github.com/PancakeTAS/lsfg-vk)) — una capa de generación de fotogramas agnóstica del juego que se engancha a cualquier título Vulkan. La comunidad la usa para **aproximadamente duplicar los FPS** (p. ej. 30 → 60) en juegos sin generación de fotogramas integrada. Como toda generación de fotogramas, añade latencia y quiere una tasa real razonable de la que interpolar, pero es una opción genuina cuando la FG propia de FSR no está disponible.
- **Reparto de VRAM (UMA).** Es un pool unificado de 16 GB. En un barrido cuidadoso (1440p, 1850 MHz), el reparto de GDDR6 (512 MB frente a 8 GB reservados) **apenas cambió los FPS medios** — pero un ajuste de UMA demasiado pequeño o incorrecto puede dejarte caer en renderizado por software (`llvmpipe`) o colgar un benchmark. Auto / una reserva sensata está bien; no le des demasiadas vueltas. ([src](https://t.me/c/2424231195/81203))
- **VSync desactivado** para benchmarking; **generación de fotogramas activada** donde se ofrezca (ayudó a Wukong a alcanzar medias de tres cifras, ver más abajo).
- **`mitigations=off`** (flag de arranque del kernel) es un ajuste común; en el barrido de VRAM tuvo solo efectos menores y ruidosos en los FPS. Trátalo como pequeño. ⚠ **verifícalo (magnitud en disputa)** — elektricM reporta una ganancia mucho mayor (**+18 FPS en Cyberpunk, "+10–15 %"** en sus consejos). Es claramente dependiente del juego: grande en algunos títulos limitados por CPU, despreciable en otros. Pruébalo y mide; no asumas ninguno de los dos números. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

---

## Resultados que la gente realmente publicó

Estas son cifras reportadas por la comunidad con sus ajustes y fuente. **Las puntuaciones de benchmark y los FPS son tal como se publicaron** — las frecuencias/distro/driver difieren entre filas, así que lee la columna de contexto, no compares a ciegas.

| Juego | Ajustes (res / preset / escalado) | Resultado | HW / frecuencias | Fuente |
|------|--------------------------------------|--------|-------------|--------|
| **Black Myth: Wukong** (bench) | 1080p, Alto, FSR + Frame Gen activado | **media 96** (mín 78, máx 113) | BC-250, Windows, RADV NAVI10 | ([src](https://t.me/c/2424231195/10069)) |
| **Black Myth: Wukong** (bench) | 1440p, Medio, sin FSR | **media ~48** (máx 56) | BC-250, 1850 MHz, Linux | ([src](https://t.me/c/2424231195/81203)) |
| **Shadow of the Tomb Raider** (bench) | 1440p, Máx | **media ~70** | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Marvel's Guardians of the Galaxy** (bench) | 1440p, Alto | **media ~70** (89 máx, mín cae a ~3) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Dying Light 2** (bench) | 1440p, Alto, sin VSync | **media ~48** (máx 62) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Cyberpunk 2077** (bench) | 1440p, Ray Tracing **mín** | **media ~36** (mín 30) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Indiana Jones and the Great Circle** | 1440p, bajo, sin escalador | **45** | BC-250, GPU ~1900 MHz, Vulkan | ([src](https://t.me/c/2424231195/36931)) |
| **Indiana Jones and the Great Circle** | 1440p, medio, escalador activado | **60** | BC-250 | ([src](https://t.me/c/2424231195/36931)) |
| **Forza Horizon 5** | **4K**, preset Alto, **sin FSR** | jugable (vídeo) | BC-250 | ([src](https://t.me/c/2424231195/81891)) |
| **The Witcher 3** | 4K, Medio, FSR Equilibrado | **~50** | BC-250 | ([src](https://t.me/c/2424231195/81894)) |
| **Kingdom Come: Deliverance II** | 4K, Med/Alto, FSR Calidad | **~30** ("experiencia PS5") | BC-250 | ([src](https://t.me/c/2424231195/81893)) |
| **The Last of Us Part II** | 1080p, preset por defecto | jugable (vídeo) | BC-250 | ([src](https://t.me/c/2424231195/94237)) |
| **Doom: The Dark Ages** | Alto | **60** (tras desbloqueo de 40 CU + arreglo) | BC-250, 40 CU | ([src](https://t.me/c/2424231195/141193)) · [arreglo de Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/) · [Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS) |
| **Doom Eternal** | RT activado (reportado por la comunidad) | **60 + RT** | BC-250; reportado por la comunidad (r/BC250Gaming) | ([síntesis de Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Tekken 8** | (reportado por la comunidad) | **~60** | BC-250; reportado por la comunidad (r/BC250Gaming) | ([síntesis de Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Street Fighter 6** | (reportado por la comunidad) | **~60** | BC-250; reportado por la comunidad (r/BC250Gaming) | ([síntesis de Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Stellar Blade** | (reportado por la comunidad) | **~70–80** | BC-250; reportado por la comunidad (r/BC250Gaming) | ([síntesis de Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | Generación de fotogramas activada (reportado por la comunidad) | **60 → 100** (FG) | BC-250; reportado por la comunidad (r/BC250Gaming) | ([síntesis de Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | (vídeo) | jugable | BC-250, CPU de fábrica, **GPU 2000** | ([src](https://t.me/c/2424231195/121772)) |
| **Gothic Remake** | Medio | **da tirones** — "sin optimización" | BC-250 | ([src](https://t.me/c/2424231195/142708)) |
| **Hi-Fi Rush** | (vídeo, captura OBS) | fluido | BC-250, `mitigations=off` | ([src](https://t.me/c/2424231195/91022)) |
| **Cyberpunk 2077** | 1080p, Alto, FSR Calidad, **sin RT** | **70–90** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Cyberpunk 2077** (bench) | 1080p (de fábrica 2000 MHz / 1000 mV) | **57,66** → **60,82** con OC (2230 MHz); `mitigations=off` **+18** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **The Last of Us Part I** | 1080p, Medio-Alto | **60** (estable) | BC-250 — 90–100 °C durante la compilación de shaders; algún clic de audio | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Devil May Cry 5** | 1080p, Alto | **100** (latencia más baja, ~10 ms) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Detroit: Become Human** | 1080p, Medio | **60** (limitado) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Control** | 1080p, **RT** completo | **40** | BC-250 — bueno para RT de nivel de entrada | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Company of Heroes 3** | 1080p | jugable — **necesita reparto de 4 GB de VRAM** (512 MB da artefactos/cuelgues) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Red Dead Redemption 2** (bench) | usa el flag `-useMaximumSettings` | **45+** mín | BC-250 — puede detectar el adaptador de GPU equivocado, ponlo manualmente | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **CS2** / **Rocket League** / **Elden Ring** | 1080p | **100+** / **120+** / **60** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Helldivers 2** | 1080p, bajo (reportado) | **≈82** | BC-250, de fábrica, un solo Noctua NF-P12 — GPU 73 °C / CPU 76 °C; ⚠ ASR | ([“Temps Shocked Me”](https://youtu.be/d7Hwqxn9yg8) ~5:08) |
| **Stalker 2** | medio (reportado) | **≈80** | BC-250 — el autor avisa de límite por CPU / 8 GB de RAM; ⚠ ASR | ([reseña RU](https://youtu.be/19l03qneKJ4) ~0:23) |
| **Stalker 2** | QHD (2560×1600), FSR Calidad + Frame Gen, parche 1.21 (reportado) | **57–70** (1080p, sin FG **≈45**) | BC-250; ⚠ ASR | ([reseña RU](https://youtu.be/19l03qneKJ4) ~18:52) |
| **Arc Raiders** | 1080p (reportado) | **≈56–80** | BC-250, de fábrica; ⚠ ASR | ([Temps Shocked Me](https://youtu.be/d7Hwqxn9yg8) ~5:58) |
| **Spider-Man 2** | 1080p, Alto, FSR Frame Gen (reportado) | **≈100** de media (sub-60 nativo) | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~11:04) |
| **Forza Horizon 5** | 1080p, Medio, sin FSR (reportado) | **70–95** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~12:19) |
| **Metro Exodus** | QHD, Alto (reportado) | **≈58** | BC-250; ⚠ ASR | ([reseña RU](https://youtu.be/19l03qneKJ4) ~14:12) |
| **Palworld** | 1080p, medio-alto (reportado) | **<60** (jugable) | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:04) |
| **Red Dead Redemption 2** | 1080p, medio-alto, FSR Calidad (reportado) | **60 sólidos** | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:19) |
| **Left 4 Dead 2** | 1080p, máx (reportado) | **>150** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~10:18) |
| _Referencia: build con GPU discreta_ | bench de motor RE, 1080p, Alto, sin RT | **media 67,99** (mín 58, máx 82) | **RX 6600** + Xeon E5-2667v4, Win10 | ([src](https://t.me/c/2424231195/116494)) |

> La fila de la RX 6600 **no es un resultado de la BC-250** — es un miembro corriendo una tarjeta discreta en el mismo chasis/CPU como punto de comparación. Incluida para mostrar lo que la *CPU* por sí sola puede sostener.

> ⚠️ **Elden Ring — los resultados varían.** Los ~60 FPS de arriba (elektricM, 1080p) no son universales: un build de la comunidad estaba **limitado a 30 FPS bloqueados en Alto y no podía llegar a 60 ni siquiera a 720p en bajo** (limitado por CPU). Trata 60 como el mejor caso, no como una garantía. ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:50)

### Ports de primera parte / consola — el punto dulce

Estos corrieron lo bastante bien como para que un miembro simplemente los listara como "funcionan" (los ports estilo PS se apoyan en la GPU y están bien optimizados, lo que le sienta bien a esta placa):

> Days Gone · Death Stranding · DIRT 5 · Ghost of Tsushima: Director's Cut · God of War (2018) · God of War: Ragnarök · Horizon Forbidden West · Horizon Zero Dawn · The Last of Us Part I · The Last of Us Part II Remastered · Returnal · Uncharted: Legacy of Thieves

([src](https://t.me/c/2424231195/99563))

---

## Juegos con problemas conocidos (no funcionan / necesitan un apaño)

elektricM rastrea títulos que nosotros no cubrimos y que **fallan o pelean con la plataforma** — compruébalo antes de comprar:

| Juego | Problema | Apaño |
|------|---------|-----------|
| **Fortnite** | Easy Anti-Cheat **no soporta Linux** | **Ninguno — no puede correr** en una BC-250 con Linux |
| **Valorant** | Anti-cheat a nivel de kernel | Problemas técnicos en Linux; en la práctica un no |
| **Magic: The Gathering Arena** | Cuelgues/congelaciones específicamente en **Fedora** | Funciona mejor en **Manjaro / Bazzite**; prueba otro Proton |
| **Final Fantasy VII Rebirth** | "DX12 is not supported on your system" (chequeo de compatibilidad de GPU) | **Aún sin arreglo** |
| **Black Myth: Wukong** (crackeado) | "CreateProcess() returned 2" (anti-manipulación) | Usa **archivos de juego sin modificar** |

(El estado del anti-cheat cambia con el tiempo — contrasta con [areweanticheatyet.com](https://areweanticheatyet.com) y [protondb.com](https://www.protondb.com).) ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

### Bloqueados por hardware por funciones de GPU ausentes (no arreglable)

Esto es **silicio de clase RDNA 2** (GFX1013). Un puñado de títulos más nuevos **requieren por hardware funciones de GPU que RDNA 2 no tiene** — principalmente **mesh shaders** y **sombreado de tasa variable (VRS) por hardware** — y se niegan a correr. El silicio ausente es una **limitación de hardware, no un bug de driver**: ninguna actualización de Mesa, parámetro del kernel o versión de Proton añade la función en sí. Los **mesh shaders** son un muro real. Un requisito de **VRS** a veces es solo un chequeo al lanzar que una capa Vulkan en espacio de usuario puede falsear (consulta la nota de Doom más abajo) — así que no siempre es fatal. Ejemplos confirmados ([hilo de la comunidad de r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)):

| Juego | Requisito por hardware que le falta a la BC-250 |
|------|------------------------------------|
| **Final Fantasy VII Rebirth** | **Mesh shaders** — no corre (esto es también por lo que dispara el chequeo de compatibilidad de GPU de DX12 de la tabla de arriba) |
| **Doom: The Dark Ages — Update 2** | **Vulkan fragment shading rate** (VRS por hardware) — el Update 2 hizo VRS obligatorio *al lanzar*; la GPU no lo tiene, así que el juego sin modificar ya no arranca (el build pre-Update-2 corría a 60 FPS tras el desbloqueo de 40 CU, arriba). **Existe un apaño** — consulta la nota más abajo. |

> **Doom: The Dark Ages Update 2 — ahora hay un apaño.** El juego solo *comprueba* el VRS al lanzar; nunca lo necesita realmente para el gameplay. La capa Vulkan **`bangstk/Vulkan_NullVRS`** ([github.com/bangstk/Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS)) intercepta `vkCmdSetFragmentShadingRateKHR()` y lo anula, satisfaciendo el chequeo de lanzamiento para que el juego corra sin efectos secundarios dentro del juego. Así que Doom: The Dark Ages **no** es un bloqueo permanente por hardware. **Los mesh shaders son distintos** — no hay un shim equivalente para el requisito de mesh shaders de FF7 Rebirth, así que ese realmente no correrá.

> Antes de comprar un título AAA recién salido, comprueba si lista mesh shaders o VRS por hardware como requisito. Los **mesh shaders** son un muro de hardware real aquí (sin apaño). Un requisito de **VRS por hardware** suele ser solo una barrera al lanzar — a veces falseable (como con Doom arriba), a veces no — así que consulta a la comunidad antes de asumir cualquiera de las dos cosas.

## Ray tracing — qué se ha probado de verdad

La BC-250 tiene **RT por hardware RDNA2 real** (no emulación por software, dado Mesa 25.2+). Títulos RT probados según elektricM:

| Juego | Res | FPS | Notas |
|------|-----|-----|-------|
| Cyberpunk 2077 | 1080p | 50–60 | Solo iluminación RT, FSR Calidad |
| Control | 1080p | 40 | RT completo |
| Portal 2 RTX | 720p | 40 | Camino de RT por software en Mesa 25.2+ |
| Half-Life 2 RTX | 720p | 20–30 | Muy exigente |

El RT aquí es de nivel de entrada — bien para *solo iluminación* en juegos bien optimizados, no para cargas con path tracing completo. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

## Proton y opciones de lanzamiento (Linux)

- **Versión de Proton:** empieza con **Proton GE** (mejor compatibilidad) o **Proton Experimental**; recurre al estable **8.0 / 9.0** según el juego. Instala GE vía **ProtonUp-Qt** (`protonup-qt`). Algunos títulos solo funcionan con una versión específica — prueba si uno falla. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Opciones de lanzamiento de Steam** que conviene conocer:
  - `mangohud %command%` — overlay de FPS/temperaturas.
  - `RADV_DEBUG=nohiz %command%` — fuerza RADV / arregla algunos fallos gráficos.
  - `gamemoderun %command%` — pone el governor de CPU en rendimiento durante la sesión (ayuda a esta placa limitada por CPU).
  - Combinado: `RADV_DEBUG=nohiz mangohud gamemoderun %command%`.
- **VRAM por juego (reparto UMA):** los esports/indies van bien con **512 MB**; **la mayoría de los juegos quieren 4 GB**; los AAA/RT también quieren los parámetros del kernel de VRAM extra (`amdgpu.gttsize=...`, consulta [06-linux.md](06-linux.md) / [08-bios.md](08-bios.md)). Un reparto demasiado pequeño causa artefactos, cuelgues o una caída a renderizado por software. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Los tirones en la primera ejecución** suelen ser **compilación de shaders** — deja que Steam termine de precompilar antes de juzgar los FPS; una caché de shaders más grande ayuda. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Arreglos por juego** (reportados por la comunidad, r/BC250Gaming — pruébalos si te topas con estos bugs exactos):
  - **Resident Evil Requiem — pelo roto/con fallos gráficos:** añade `RADV_DEBUG=nohiz %command%` a las opciones de lanzamiento (el mismo flag de RADV listado arriba, aplicado aquí en concreto). ([síntesis de Reddit](https://www.reddit.com/r/BC250Gaming/))
  - **Spider-Man 2 / Assassin's Creed Shadows — congelaciones:** activar **zswap** (swap comprimido) reportadamente detiene las congelaciones. ([síntesis de Reddit](https://www.reddit.com/r/BC250Gaming/))

---

## Emulación

Los emuladores son pesados para la CPU, así que los resultados son mixtos pero varios son sólidos ([src](https://t.me/c/2424231195/78988)):

- **Switch — Eden / Ryujinx:** funciona bien y rápido. Reportado por la comunidad (r/BC250Gaming): **Mario Kart ~60 FPS**; **Tears of the Kingdom ~30–40 FPS**. ✅ ([síntesis de Reddit](https://www.reddit.com/r/BC250Gaming/))
- **PS4 — shadPS4 (0.9.0+):** Bloodborne corre bien sin caídas; algunos títulos (The Last Guardian) dan artefactos pero mantienen FPS estables. ✅
- **PS3 — RPCS3:** funciona, pero necesita ajuste por juego. ⚠️ **Peculiaridad conocida** (reportada por la comunidad, r/BC250Gaming): un bug del emulador **bloquea la GPU a 1000 MHz** bajo RPCS3, así que la GPU no puede subir de frecuencia — el apaño es **hacer overclock a la CPU para compensar** el margen de GPU perdido. ([síntesis de Reddit](https://www.reddit.com/r/BC250Gaming/))
- **Xbox 360 — Xenia Canary:** los menús cargan, el gameplay cae a una pantalla en negro (aún en investigación). ❌

---

## Dónde verlo funcionando (vídeo)

La comunidad publica mucho vídeo de gameplay/benchmark. Algunas capturas y canales del hilo:

- Clips de gameplay/benchmark de la BC-250: [youtu.be/CYDv1SfD2Pc](https://youtu.be/CYDv1SfD2Pc) · [youtu.be/g3uWOfqcexA](https://youtu.be/g3uWOfqcexA) · [youtu.be/9fozmRrAouc](https://youtu.be/9fozmRrAouc) · [youtu.be/q64M2XzADjA](https://youtu.be/q64M2XzADjA) · [youtu.be/0LEkOG1yqqw](https://youtu.be/0LEkOG1yqqw)
- Hoja de seguimiento de la comunidad de juegos probados (FPS/ajustes): [Hoja de Google](https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing)

---

## Chuleta de expectativas realistas

| Quieres… | Realidad en una BC-250 modificada a 2000 MHz |
|-----------|--------------------------------------|
| AAA a 1080p, 60 FPS | A veces — depende de la carga de CPU. FSR + Frame Gen ayuda. AAA más antiguos/ligeros: sí. |
| AAA a 1440p | 40–60 FPS en la mayoría de los ports; la GPU tiene margen aquí. La mejor resolución en relación calidad-precio. |
| AAA a 4K | 30–50 FPS con FSR en ports bien optimizados/de consola (Forza, Witcher 3, KCD2). |
| Ray tracing | Solo en mínimo, FPS bajos (Cyberpunk ~36 @ 1440p RT-mín). No es el fuerte de la placa. |
| 60 bloqueados en todo | No. Los títulos limitados por CPU y con mucha física darán bajones/tirones sin importar los ajustes. |
| Ports de primera parte de PS | El punto dulce — es lo que la placa hace mejor. |

---

## Fuentes

- Benchmark limitado por CPU (38 FPS, 36,5 % GPU) — https://t.me/c/2424231195/136242
- Tabla grande de benchmarks de VRAM/frecuencia (Wukong, Tomb Raider, Dying Light 2, Cyberpunk, Guardians) — https://t.me/c/2424231195/81203
- Wukong 1080p Alto FSR+FG, media 96 — https://t.me/c/2424231195/10069
- Indiana Jones Great Circle, multi-resolución — https://t.me/c/2424231195/36931
- Forza Horizon 5 4K — https://t.me/c/2424231195/81891 · Witcher 3 4K — https://t.me/c/2424231195/81894 · KCD2 4K — https://t.me/c/2424231195/81893
- Resultados de desbloqueo de 40 CU (Doom Dark Ages 60 FPS) — https://t.me/c/2424231195/141193 · arreglo de Doom — https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/
- TLOU II 1080p — https://t.me/c/2424231195/94237 · Resident Evil Requiem — https://t.me/c/2424231195/121772 · tirones de Gothic Remake — https://t.me/c/2424231195/142708
- Lista de ports de primera parte — https://t.me/c/2424231195/99563
- Resumen de emulación — https://t.me/c/2424231195/78988
- Comparación con dGPU RX 6600 — https://t.me/c/2424231195/116494
- Compatibilidad de juegos de elektricM (ajustes/FPS por juego, juegos con problemas, tabla de RT, Proton y opciones de lanzamiento, ganancias de FSR) — https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/
- Capturas de FPS de YouTube (auto-subtitulado / ASR — cifras aproximadas): ETA Prime (Spider-Man 2, Forza H5, Left 4 Dead 2) — https://youtu.be/q_CxcbS5HI8 · "Temps Shocked Me" (Helldivers 2, Arc Raiders) — https://youtu.be/d7Hwqxn9yg8 · reseña RU (Stalker 2, Metro Exodus) — https://youtu.be/19l03qneKJ4 · Pixels & Power (Palworld, RDR2, Elden Ring 30 FPS) — https://youtu.be/4S0DvIpqm0E
- Bloqueos por hardware de mesh-shader / VRS-por-hardware (FF7 Rebirth, Doom: The Dark Ages Update 2) — [hilo de r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- **Apaño de VRS para Doom: The Dark Ages — `bangstk/Vulkan_NullVRS`** (capa Vulkan que anula `vkCmdSetFragmentShadingRateKHR`) — https://github.com/bangstk/Vulkan_NullVRS
- **Generación de fotogramas LSFG en Linux — `lsfg-vk`** (capa Vulkan) — https://github.com/PancakeTAS/lsfg-vk
- **FSR 4 / XeSS vía DP4a (INT8) en RDNA2** — build FSR4 INT8 de OptiScaler: [VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/) · [wiki de compatibilidad de FSR4 de OptiScaler](https://github.com/optiscaler/OptiScaler/wiki/FSR4-Compatibility-List)
- **FSR 4 oficial de AMD para RDNA2 (~principios de 2027) / RDNA3 (julio de 2026)** — [Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals)
- **Resultados de juegos reportados por la comunidad (r/BC250Gaming)** — Tekken 8, Street Fighter 6, Stellar Blade, RE Requiem Frame-Gen, Doom Eternal RT, Switch (Mario Kart / TOTK), bloqueo de GPU a 1000 MHz en RPCS3, arreglos de pelo de RE Requiem / Spider-Man 2 / AC Shadows — https://www.reddit.com/r/BC250Gaming/
- Hoja de cálculo de pruebas de juegos de la comunidad — https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing

> Las frecuencias y el desbloqueo de 40 CU viven en [09-overclock-undervolt.md](09-overclock-undervolt.md); haz el mod de [04-cooling.md](04-cooling.md) antes de correr a 2000 MHz.
