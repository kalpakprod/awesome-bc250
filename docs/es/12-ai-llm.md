> 🌐 Traducción de la comunidad. La versión en inglés es la fuente de verdad y puede estar más actualizada. ¿Encontraste un error? Abre un issue: [../en/12-ai-llm.md](../en/12-ai-llm.md) · https://github.com/lildebil0/awesome-bc250/issues

# IA / LLM en la BC-250

> **TL;DR** — El atractivo de la BC-250 para la IA son sus **16 GB de GDDR6** a precio de saldo. La forma realista de usarla es **llama.cpp / Ollama sobre el backend Vulkan (RADV)** — *no* ROCm. La GPU es **gfx1013 (Cyan Skillfish)**, a la que ningún build de ROCm apunta oficialmente, así que ROCm es un agujero profundo que la mayoría se salta. En Vulkan, con un modelo MoE que quepa en VRAM, la comunidad ve aproximadamente **30–40 tok/s** (p. ej. gpt-oss-20b, Qwen3.5-35B-A3B, Gemma-4-26B-A3B). La pega es la **memoria**: los 16 GB son compartidos CPU+GPU, así que los modelos grandes viven justo al límite y el OOM es el fallo nº 1. Configura la VRAM en la BIOS, sube el límite de páginas TTM del kernel y corre modelos **MoE** — ese es todo el juego.

La BC-250 es una buena *caja de inferencia económica* y una mala *caja de entrenamiento*. Trátala como "una tarjeta de 16 GB que corre modelos cuantizados sobre Vulkan" y lo pasarás bien.

---

## Por qué Vulkan, no ROCm

El die de la GPU es **Cyan Skillfish = `gfx1013`** (una pieza de clase RDNA-1.x, hermana de Navi 10/`gfx1010`). Este único hecho lo decide todo:

- **ROCm no incluye soporte para `gfx1013`.** El stack ROCm de AMD apunta a una lista blanca específica de IDs de GPU, y Cyan Skillfish no está en ella. Así que el camino oficial `ROCm/ROCm` simplemente no ve la tarjeta. En concreto: `gfx1013` *sí* aparece en LLVM como capaz de `rocm-amdhsa`, pero **el espacio de usuario de ROCm de AMD (rocBLAS/Tensile) no incluye librerías de matemáticas (de solución) para `gfx1013`** — así que en el momento en que un GEMM llega a rocBLAS obtienes `rocblas_abort()` ("GFX1013 not in GPU list"). No hay kernel de matemáticas que llamar ([akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)).
- **Incluso dejando eso de lado, ROCm no tiene una caché de shaders utilizable en estas APU — recompila en cada lanzamiento**, mientras que el **backend Vulkan cachea los shaders compilados a disco**. Eso por sí solo hace de Vulkan el camino práctico de cómputo: las pruebas de akandr concluyen que Vulkan fue el único camino de cómputo en GPU encontrado utilizable en esta placa ([akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)). (Ten en cuenta que esto es una carencia de *driver/librería*, **no** de una función-de-hardware ausente — la ISA `gfx103x` de RDNA2 sí incluye INT8 dp4a, p. ej. `v_dot4c_i32_i8`; el problema es puramente que ROCm no incluye nada para este ID.)
- Los conocidos repos de "desbloquear ROCm en tarjetas viejas" **tampoco lo cubren**:
  - [`woodrex83/ROCm-For-RX580`](https://github.com/woodrex83/ROCm-For-RX580) es **solo `gfx803`** (Polaris: RX 580/570/480). Arquitectura completamente equivocada — inutilizable aquí.
  - [`ulyssesrr/docker-rocm-xtra`](https://github.com/ulyssesrr/docker-rocm-xtra) añade objetivos extra (`gfx803`, `gfx900/906/908`, `gfx1010/1011/1012`, `gfx1030…`) — pero **`gfx1013` no está en la lista**, y el repo fue **archivado el 2025-08-12**. Puedes *intentar* enmascararte como `gfx1010` (Navi 10) con `HSA_OVERRIDE_GFX_VERSION=10.1.0`, igual que la gente enlaza simbólicamente el firmware de Navi 10 para levantar el driver de pantalla (`navi10_gpu_info.bin → cyan_skillfish_gpu_info.bin`, [src](https://t.me/c/2424231195/7458/136321)), pero esto no está verificado para cómputo en la BC-250 y nadie en el chat reporta un stack de LLM con ROCm funcionando. ⚠ verifícalo

Los otros repos que la gente menciona — [`xuhuisheng/rocm-build` (navi10)](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) y [`robertrosenbusch/gfx803_rocm`](https://github.com/robertrosenbusch/gfx803_rocm) — son para dGPUs Navi 10 y Polaris respectivamente, no Cyan Skillfish. Son contexto útil, no una receta para esta placa.

**En resumen (a mediados de 2026):** ROCm en la BC-250 es un apaño no resuelto/no rentable. Todas las configuraciones funcionales que la comunidad ha compartido corren sobre **Vulkan vía Mesa RADV**, que el stack de drivers de la BC-250 ya te da para jugar. Si alguien consigue ROCm funcionando, será haciéndose pasar por `gfx1010` en un contenedor parcheado — espera perder un fin de semana, sin garantía.

> **Actualización — alguien logró hacer funcionar HIP/ROCm (Discord, mediados de 2026).** Posterior al veredicto de arriba de que "nadie reporta un stack funcional", un miembro reportó **el cómputo de ROCm, HIP y PyTorch funcionando** en la BC-250 después de **modificar el firmware MEC**, cambiar la configuración de la BIOS y recompilar el stack ([fuente](https://discord.com/channels/1315924807128449065/1315933088668454942/1482848457478901851)). En esa vía, **`llama.cpp` compilado contra HIP** midió **709 tok/s en TinyLlama-1.1B (pp512)** y **115 tok/s en Llama-3.1-8B (pp512)** a frecuencias de fábrica ([fuente](https://discord.com/channels/1315924807128449065/1315933088668454942/1483073888551440384)), y el prefill escaló con el desbloqueo de CU — **~230 tok/s con 24 CU (94–95 W) vs 371.6 tok/s con 40 CU (125 W), ambos a 1500 MHz** ([fuente](https://discord.com/channels/1315924807128449065/1315933088668454942/1506023598048022588)). Este es un camino experimental a nivel profundo de firmware — no es la ruta recomendada — pero demuestra que el veredicto de "ROCm es imposible" ya no es absoluto. ⚠ avanzado.

---

## La ventaja de los 16 GB de VRAM (y su pega)

16 GB son suficientes para alojar un modelo de 20–35B cuando está **cuantizado** (Q3–Q4) — VRAM que de otro modo te costaría una 4060 Ti 16 GB o una 3090 usada. Esa es toda la razón por la que la placa es interesante para LLM.

La pega: **los 16 GB se comparten entre CPU y GPU.** No hay un pool de RAM del sistema separado al que recurrir. Así que:

- El modelo + la caché KV + el SO + cada proceso en segundo plano caben todos en los *mismos* 16 GB.
- Empuja el modelo demasiado grande y no obtienes "lento" — obtienes un **OOM** duro, y en algunas distros KDE se cae y te suelta en una consola ([src](https://t.me/c/2424231195/101077)).
- El veredicto de un colaborador habitual tras meses de pruebas: *"El rendimiento es suficiente para mucho; es la **memoria** lo que no lo es."* ([src](https://t.me/c/2424231195/101077))

Dos palancas te dan margen:

1. **Configura la VRAM en la BIOS.** Correr con `vram = 12` (GB) es una base que se sabe que funciona y deja RAM para el sistema ([src](https://t.me/c/2424231195/101077)). Repartos de VRAM más altos dejan cargar modelos más grandes pero matan de hambre al SO.
2. **Sube el límite de páginas TTM del kernel** para que el gestor de memoria de la GPU realmente entregue las grandes asignaciones que un modelo de 14B+ necesita (ver la configuración más abajo). Este es el único cambio que desbloquea modelos más grandes en Vulkan.

Un truco de la comunidad para recuperar 1–2 GB: corre un **SO de servidor sin pantalla (headless)** y háblale por la red (p. ej. Open WebUI / una API), para que no haya un escritorio comiéndose la VRAM ([src](https://t.me/c/2424231195/101077)).

---

## Corre modelos MoE, no densos

Esta es la decisión de modelado más importante en una caja de 16 GB de memoria compartida, y el chat es explícito sobre por qué ([src](https://t.me/c/2424231195/125233)):

- Para un modelo **denso** solo puedes dividirlo *secuencialmente* capa a capa; los trucos de paralelismo de tensores no ayudan, así que estás acotado por lo que cabe y por el ancho de banda bruto.
- Para un modelo **MoE** mantienes la parte densa/de atención en la tarjeta y solo activas unos pocos expertos pequeños por token. El resultado: **cabe un modelo mucho más grande con calidad decente, y obtienes un multiplicador de throughput** porque solo se toca una fracción de los pesos por token.

Por eso exactamente los modelos que la gente realmente corre en la BC-250 son MoE con un recuento bajo de parámetros activos: **gpt-oss-20b** (el favorito del chat), **Qwen3.5-35B-A3B** (35B total / ~3B activos), **Gemma-4-26B-A3B**. Pegan muy por encima de lo que podría un modelo denso de la misma huella de VRAM.

> Una idea relacionada para configuraciones multi-tarjeta: para MoE puedes dividir **columnas de expertos** entre placas y ganar ancho de banda agregado, mientras que el estado oculto de un modelo denso es minúsculo (~1 MB incluso para 70B), así que un enlace gigabit entre nodos *no* es el cuello de botella ([src](https://t.me/c/2424231195/125233)). Para una sola BC-250 esto es irrelevante, pero explica por qué la gente las encadena.

---

## Configuración A — Ollama + Vulkan (recomendada, reproducible)

La receta de BC-250 más completa y reproducible es la guía de la comunidad [`akandr/bc250` → *Ollama + Vulkan setup*](https://github.com/akandr/bc250#3-ollama--vulkan-setup) (referenciada repetidamente en el chat). Asume un stack gráfico de BC-250 funcional (consulta [06-linux.md](06-linux.md)) — Fedora con un Mesa/RADV reciente — y luego pone Ollama encima. Reproducido de ese repo:

**1. Instala Ollama:**
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

**2. Activa el backend Vulkan + opciones seguras para la memoria** mediante un override de systemd (`/etc/systemd/system/ollama.service.d/override.conf`):
```ini
[Service]
Environment=OLLAMA_VULKAN=1
Environment=OLLAMA_FLASH_ATTENTION=1
Environment=OLLAMA_KV_CACHE_TYPE=q4_0
Environment=OLLAMA_MAX_LOADED_MODELS=1
Environment=OLLAMA_KEEP_ALIVE=30m
Environment=OLLAMA_CONTEXT_LENGTH=65536
Environment=OLLAMA_GPU_OVERHEAD=0
Environment=OLLAMA_MAX_QUEUE=4
OOMScoreAdjust=-1000
```
Luego:
```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```
`OLLAMA_FLASH_ATTENTION=1` y `OLLAMA_KV_CACHE_TYPE=q4_0` encogen la caché KV para que quepa un contexto largo; `OOMScoreAdjust=-1000` evita que el kernel mate a Ollama primero bajo presión de memoria.

**3. El arreglo clave de memoria — sube el límite de páginas TTM** (esto es lo que permite que los modelos de 14B+ / contexto grande carguen siquiera):
```bash
echo 4194304 | sudo tee /sys/module/ttm/parameters/pages_limit
echo 4194304 | sudo tee /sys/module/ttm/parameters/page_pool_size
```
Haz que persista entre reinicios:
```bash
echo "options ttm pages_limit=4194304 page_pool_size=4194304" | \
  sudo tee /etc/modprobe.d/ttm-gpu-memory.conf
```

**4. Descarga y corre un modelo MoE**, p. ej.:
```bash
ollama run gpt-oss:20b
```

> La guía `akandr/bc250` se validó en **Fedora 43 / kernel 6.18.9 / Mesa 25.3.4 RADV / Ollama 0.20.0**. Las versiones exactas de los paquetes irán cambiando — conserva las variables de entorno y el arreglo TTM; actualiza el resto. ⚠ verifica las versiones contra el repo antes de copiar.

**Apila el governor Oberon.** Correr [`mothenjoyer69/oberon-governor`](https://gitlab.com/mothenjoyer69/oberon-governor) (el mismo governor usado para juegos, consulta [09-overclock-undervolt.md](09-overclock-undervolt.md)) reportadamente añade **+10–20 tok/s en gpt-oss-20b** al mantener frecuencias más altas ([src](https://t.me/c/2424231195/101077)). Es la aceleración más barata disponible.

---

## Configuración B — llama.cpp (Vulkan), compilado o empaquetado

Si quieres `llama.cpp` crudo (más control, GGUF de cualquier sitio, la API compatible con OpenAI de `llama-server`):

**Arch / paru (el único comando verificado en el chat):**
```bash
paru -S aur/llama.cpp-vulkan
```
([src](https://t.me/c/2424231195/101026) — el único comando de build en el corpus de chat de esta sección; contrastado con el nombre del paquete.)

**Compilar desde fuente** (según los [docs de build de `ggml-org/llama.cpp`](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md)) — Debian/Ubuntu:
```bash
sudo apt-get install libvulkan-dev glslc spirv-headers
cmake -B build -DGGML_VULKAN=1
cmake --build build --config Release
```
(En Fedora el paquete de cabeceras SPIR-V es `spirv-headers-devel`.) Luego corre con todas las capas en la GPU:
```bash
./build/bin/llama-cli -m PATH_TO_MODEL.gguf -ngl 99 -p "Hi, how are you?"
```
`-ngl 99` descarga cada capa al dispositivo Vulkan. Usa `--list-devices` para confirmar que la BC-250 es el dispositivo que eligió llama.cpp, y `--device` para forzarlo si tienes más de uno. Hay binarios precompilados en la [página de releases de llama.cpp](https://github.com/ggml-org/llama.cpp/releases).

> **No compiles el backend HIP/ROCm** (`-DGGML_HIP=ON -DGPU_TARGETS=gfx1013`). No hay runtime de ROCm para `gfx1013`, así que no correrá ni aunque compile. Vulkan es el camino soportado aquí. ([documento de build](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md))

**Front-ends que la gente realmente usa:**
- **[Jan AI](https://jan.ai/)** — la opción diaria actual del chat: gran selector de modelos, ajustes de contexto/herramientas, puede dar al modelo acceso web + leer imágenes/documentos, soporte de MCP. Corre el modelo sobre Vulkan por debajo ([src](https://t.me/c/2424231195/101077)).
- **[KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)** — wrapper de llama.cpp de un solo binario con Vulkan, cómodo para un despliegue de un archivo.
- **Open WebUI** — emparéjalo con una caja headless para gobernarlo desde otra máquina (ahorra VRAM del escritorio).

---

## Expectativas realistas de tokens/s

Los números de abajo son **reportados por la comunidad sobre Vulkan**, con modelos MoE dimensionados para caber en 16 GB. Trátalos como orden de magnitud, no como una suite de benchmarks — vienen de la guía `akandr/bc250` y del chat, en una sola placa con el arreglo TTM + flash-attention + caché KV `q4_0`.

| Modelo | Cuant | Params activos / totales | Velocidad de generación reportada |
|---|---|---|---|
| Qwen3.5-9B | Q4_K_M | denso 9B | ~32 tok/s |
| Gemma-4-26B-A3B (MoE) | UD-Q3_K_M | ~3B / 26B | ~39 tok/s |
| Qwen3.5-35B-A3B (MoE) | UD-IQ2_M | ~3B / 35B | ~38 tok/s |
| gpt-oss-20b (MoE, MXFP4) | MXFP4 | ~3,6B / 20B | favorito de la comunidad; +10–20 tok/s con el governor Oberon |

Fuentes: velocidades de [`akandr/bc250`](https://github.com/akandr/bc250#3-ollama--vulkan-setup); uso de gpt-oss-20b y mejora del governor ([src](https://t.me/c/2424231195/101077)). Los GGUF de los modelos vienen de Hugging Face — p. ej. [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF), [unsloth Qwen3.6-35B-A3B](https://huggingface.co/unsloth/Qwen3.6-35B-A3B-GGUF), [Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M).

**Lectura honesta:** ~30–40 tok/s en un MoE de 20–35B es genuinamente utilizable para chat, ayuda con código y bucles de agente/herramientas. **No** es una 4090. La calidad está limitada por la cuantización agresiva que fuerzan los 16 GB (IQ2/Q3 en los modelos de 35B) — y un usuario señaló que empujar un 30B en una cuantización más dura "probablemente cometerá muchos errores" ([src](https://t.me/c/2424231195/101077)). El punto dulce es **gpt-oss-20b**, descrito repetidamente como "más listo que todos los pequeños" sin dejar de ser estable ([src](https://t.me/c/2424231195/101077)).

### ¿El desbloqueo de 40 CU acelera los LLM? Sí — medido en vivo en un modelo denso

El desbloqueo de 40 CU (consulta [09-overclock-undervolt.md](09-overclock-undervolt.md)) ayuda a la inferencia más que a los juegos, porque la generación de tokens sí usa las unidades de cómputo. Un vídeo lo midió **en vivo** mientras alternaba CU en un modelo **denso** — Qwen3.5-9B (~10 GB de GDDR6) sobre **Ollama + Vulkan** — y el throughput siguió el recuento de CU casi linealmente ([Old Lamer — vídeo RU de desbloqueo de CU](https://youtu.be/M7PsojWr4KA), ~8:30–12:03): *(⚠ auto-subtitulado — trata los decimales como ≈.)*

| CU activas | Velocidad de generación | vs 24 CU |
|---|---|---|
| 24 CU (de fábrica) | ≈25,7 tok/s | base |
| paso de desbloqueo | ≈31,9 tok/s | **~+16–17 %** |
| 36 CU | ≈33,4 tok/s | **~+20 % total** |

Esa placa **se quedó en 36 CU como tope** — las últimas dos CU estaban genuinamente defectuosas y **llama se colgaba al cargar** cuando se activaban, un ejemplo concreto del punto "38/40 es una lotería" del capítulo de OC. El entorno de Ollama coincidía con la receta de arriba (`OLLAMA_VULKAN=1`, caché KV `q4_0`, contexto 65536, `ttm.pages_limit=4194304`). Como es un modelo *denso*, la ganancia es puro escalado de CU — sin multiplicador de enrutamiento de expertos MoE encima ([Old Lamer — vídeo RU de desbloqueo de CU](https://youtu.be/M7PsojWr4KA)).

La guía `akandr/bc250` corrió un A/B más completo en modelos **MoE** a lo largo del desbloqueo de 40 CU (el parche de desbloqueo en sí vive en [`duggasco/bc250-40cu-unlock`](https://github.com/duggasco/bc250-40cu-unlock), no en akandr; akandr añade un chequeo de cordura FP32 independiente + una nueva pasada de throughput). Dos deltas de generación destacados, ambos **vía llama.cpp** ([akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results)):

| Modelo | Cuant | Gen @ 24 CU | Gen @ 40 CU | Δ |
|---|---|---|---|---|
| gpt-oss-20b (MoE) | MXFP4 | 66,1 tok/s | 87,5 tok/s | **+32 %** |
| Qwen3.5-35B-A3B (MoE) | — | 59,5 tok/s | 78,7 tok/s | **+32 %** |

A lo largo de 11 modelos la mediana fue **+32 % de generación / +50 % de prefill** del desbloqueo. Dos cosas que vale la pena sacar de esa tabla: **gpt-oss-20b corre cómodamente (66 → 87 tok/s)**, confirmando el favorito del chat, y akandr midió los modelos MoE **sustancialmente más rápidos a través de `llama.cpp` directamente que a través de Ollama** (el camino de despacho de expertos de Ollama es menos eficiente para esta arquitectura — p. ej. Qwen3.5-35B-A3B fue 25,1 tok/s en Ollama frente a 59,5 tok/s en llama.cpp a frecuencias de fábrica) ([akandr/bc250 §4](https://github.com/akandr/bc250#4-benchmarks)).

> 💬 **Datos MoE sin verificar (comentarios de Hackaday — trátalos como rumores).** De comentarios de lectores en vez de una prueba reproducida: un Qwen "27b" con **MTP** (predicción multi-token) a **≈14,5 tok/s**, y un "35b" con MTP a **≈47 tok/s**. La amplia dispersión es exactamente lo que producirían las diferencias de MTP + parámetros activos de MoE, pero ninguna de las dos cifras está confirmada de forma independiente aquí — señalada por contexto, no como un benchmark. ⚠ verifícalo

---

## Lo que es doloroso (seamos honestos)

- **El OOM es el modo de fallo por defecto.** Modelo grande en 16 GB de memoria compartida = viviendo al límite. Espera cuelgues; en KDE el escritorio puede morir y dejar solo una consola ([src](https://t.me/c/2424231195/101077)). Mitígalo con el reparto de VRAM en la BIOS, el arreglo TTM, la caché KV `q4_0`, flash attention y una configuración headless.
- **La estabilidad de la distro varía.** El chat encontró **Ubuntu más estable que Fedora** para no colgarse bajo presión de memoria en Vulkan, a pesar de ser Fedora la base documentada ([src](https://t.me/c/2424231195/101077)). Si una distro sigue colgándose por OOM, prueba la otra.
- **ROCm está efectivamente descartado** (ver la sección de arriba). No quemes días persiguiendo entrenamiento con PyTorch/vLLM en esta tarjeta — [el camino AMD de vLLM](https://docs.vllm.ai/en/latest/getting_started/installation/gpu/#amd-rocm) necesita ROCm, que necesita un ID de GPU soportado que esta placa no tiene.
- **Es una caja de inferencia, no de entrenamiento.** El fine-tuning a cualquier escala real quiere más VRAM y un stack de cómputo funcional. Úsala para *correr* modelos, no para entrenarlos.
- **El throughput depende de las frecuencias.** Sin un governor manteniendo frecuencias altas dejas 10–20 tok/s sobre la mesa ([src](https://t.me/c/2424231195/101077)); la refrigeración también importa aquí (consulta [04-cooling.md](04-cooling.md)) ya que la inferencia sostenida es una carga sostenida.

---

## Configuración inicial recomendada

| Nivel | Haz esto | Espera |
|------|---------|--------|
| Mínimo | Stack RADV funcional ([06-linux.md](06-linux.md)) → Ollama + `OLLAMA_VULKAN=1` → arreglo TTM → `ollama run gpt-oss:20b` | ~30+ tok/s, chat estable |
| Mejor | Añade el governor Oberon + flash-attn + caché KV `q4_0`; front-end vía Jan AI | +10–20 tok/s, contexto más largo, herramientas/MCP |
| Modelo más grande | MoE 35B-A3B a IQ2/Q3 con `pages_limit` de TTM subido; headless + Open WebUI para liberar VRAM | ~38 tok/s, cerca del techo de memoria |
| No hagas | Entrenamiento ROCm / HIP / vLLM en `gfx1013` | callejón sin salida, sáltalo |

---

## Fuentes

- Receta de LLM para BC-250 (Ollama+Vulkan, arreglo TTM, tok/s) — [akandr/bc250 §Ollama+Vulkan](https://github.com/akandr/bc250#3-ollama--vulkan-setup)
- Por qué ROCm falla en gfx1013 (sin librerías de solución rocBLAS/Tensile → `rocblas_abort()`; ROCm recompila en cada lanzamiento frente a Vulkan que cachea shaders) — [akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm) · la ISA `gfx103x` de RDNA2 tiene INT8 dp4a (`v_dot4c_i32_i8`), así que esto es una carencia de librería, no de hardware — [LLVM GFX1030 ISA](https://llvm.org/docs/AMDGPU/AMDGPUAsmGFX1030.html)
- Desbloqueo de 40 CU en MoE, deltas de generación medidos (gpt-oss-20b 66,1→87,5, Qwen3.5-35B-A3B 59,5→78,7, mediana +32 % gen / +50 % prefill a lo largo de 11 modelos; llama.cpp ≫ Ollama para MoE) — [akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results) · [§4 benchmarks](https://github.com/akandr/bc250#4-benchmarks) · parche de desbloqueo: [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock)
- Configuración funcional, gpt-oss-20b, mejora de Oberon, notas de OOM/distro — https://t.me/c/2424231195/101077
- MoE frente a denso, ancho de banda multi-tarjeta — https://t.me/c/2424231195/125233
- Escalado de LLM con desbloqueo de 40 CU, medido en vivo (⚠ ASR — aproximado) — Qwen3.5-9B denso sobre Ollama+Vulkan: 25,7 → 31,9 → 33,4 tok/s (24 → desbloqueo → 36 CU, ~+20 % total); placa limitada a 36 CU (2 CU defectuosas, llama se colgaba al cargar) — [Old Lamer — vídeo RU de desbloqueo de CU](https://youtu.be/M7PsojWr4KA)
- Datos MoE con MTP (⚠ sin verificar, comentarios de Hackaday) — Qwen "27b"+MTP ≈14,5 tk/s, "35b"+MTP ≈47 tk/s — hilo de comentarios del artículo de la BC-250 en Hackaday
- Comando de paquete verificado — https://t.me/c/2424231195/101026 · enlace simbólico de firmware Navi10→Cyan Skillfish — https://t.me/c/2424231195/7458/136321
- Build de llama.cpp (Vulkan / HIP) — [ggml-org/llama.cpp build.md](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md) · [releases](https://github.com/ggml-org/llama.cpp/releases) · [install](https://github.com/ggml-org/llama.cpp/blob/master/docs/install.md)
- Realidad de ROCm en gfx1013 — [ROCm/ROCm](https://github.com/ROCm/ROCm) · [woodrex83/ROCm-For-RX580 (solo gfx803)](https://github.com/woodrex83/ROCm-For-RX580) · [ulyssesrr/docker-rocm-xtra (archivado; sin gfx1013)](https://github.com/ulyssesrr/docker-rocm-xtra) · [xuhuisheng/rocm-build navi10](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) · [robertrosenbusch/gfx803_rocm](https://github.com/robertrosenbusch/gfx803_rocm)
- Front-ends — [Jan AI](https://jan.ai/) · [KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)
- Modelos (GGUF) — [Hugging Face](https://huggingface.co/) · [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF) · [Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M)
- Overclock/governor — [09-overclock-undervolt.md](09-overclock-undervolt.md) · Base de Linux — [06-linux.md](06-linux.md) · Refrigeración — [04-cooling.md](04-cooling.md)
