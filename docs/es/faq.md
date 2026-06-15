> 🌐 Traducción de la comunidad. La versión en inglés es la fuente de verdad y puede estar más actualizada. ¿Encontraste un error? Abre un issue: [../en/faq.md](../en/faq.md) · https://github.com/lildebil0/awesome-bc250/issues

# FAQ

> **TL;DR** — Las preguntas que hacen los recién llegados en la primera semana, con respuestas breves y correctas y un enlace a la sección completa de cada una. Si una respuesta te parece demasiado corta, es a propósito — la profundidad está en la página enlazada del manual.

Esto es una referencia rápida. Para el camino guiado de "placa en una caja → juegos funcionando", empieza en [00-start-here.md](00-start-here.md).

---

## Hardware y qué compré

**¿Qué es realmente la BC-250?**
Una APU derivada de la PlayStation 5 (AMD **Cyan Skillfish** / Oberon) sobre una placa de minería de criptomonedas/servidor: **CPU Zen 2 de 6 núcleos/12 hilos + GPU RDNA 2 de 24 CU + 16 GB de GDDR6 soldada**. No es una tarjeta gráfica ni un PC normal — sin ranura PCIe, sin ATX de 24 pines, sin una BIOS familiar. Consulta [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**¿Es plug-and-play? ¿Debería haberla comprado?**
No. Necesita trabajo de drivers, un mod de refrigeración y una alimentación rara — es una placa para trasteadores. La frase de un veterano: "requiere ciertas habilidades, esfuerzo y cerebro". Si quieres cero complicaciones, devuélvela; si te gustan los proyectos, es la caja de Linux para juegos / IA local más barata de su categoría. Consulta [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**¿Puedo añadir más RAM?**
No. Los 16 GB de GDDR6 están soldados y se comparten entre CPU y GPU; no hay ranuras DIMM. Solo eliges cuánta parte del pool reserva la GPU (UMA), configurado en una BIOS modificada. Consulta [01-what-is-bc250.md](../en/01-what-is-bc250.md) y [08-bios.md](../en/08-bios.md).

**¿Tiene botón de encendido?**
No. Se enciende en el instante en que llegan los 12 V — el propio interruptor de la PSU es tu botón de encendido. Consulta [03-power-supply.md](../en/03-power-supply.md).

**Mi placa no hace POST / pantalla en negro nada más sacarla — ¿está muerta?**
A menudo no. Muchas placas llegan necesitando un **reset de BIOS/CMOS** antes de hacer POST, y algunas vienen ligeramente **dobladas** por el montaje del disipador — un propietario arregló un no-arranque calzando la placa plana con papel. Prueba eso antes de declararla muerta. Consulta [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**¿Puede grabar/hacer streaming de juegos con la GPU?**
No por hardware. El bloque de codificación de vídeo (VCN) no está disponible, así que OBS/streaming recurre a un **codificador por software (CPU)** — funciona (la gente usa Sunshine/Moonlight) pero cuesta CPU y calidad. Consulta [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**¿Cuáles son los grosores de las almohadillas térmicas para el mod del backplate?**
Reportado por la comunidad: **memoria 2 mm, chipset 1,5 mm** ([fuente](https://t.me/c/2424231195/22442)). La GDDR6 trasera no tiene sensor de temperatura, así que la refrigeras a ciegas. Consulta [04-cooling.md](../en/04-cooling.md).

## Alimentación

**¿Qué fuente de alimentación necesito?**
Una fuente de **12 V de un solo raíl** que entregue **≥300 W** a un conector **PCIe de 8 pines (6+2)**. Tres caminos comunes: una PSU ATX/SFX normal (simplemente conecta su cable PCIe — lo más fácil), una PSU de servidor HP Flex de 500 W usada y barata, o un brick industrial Mean Well. Consulta [03-power-supply.md](../en/03-power-supply.md).

**¿Puedo usar el 8 pines de CPU/EPS de mi PSU?**
**No — puede quemar la placa.** Los 8 pines PCIe y CPU/EPS se ven casi idénticos pero tienen **polaridad invertida**. La placa no tiene comprobación de seguridad; usa el cable **PCIe**, y verifica con un multímetro si no estás seguro. Consulta [03-power-supply.md](../en/03-power-supply.md).

**Mi vieja PSU de 750 W tiene vatios de sobra — ¿por qué le cuesta?**
Las unidades antiguas a menudo **reparten los 12 V entre varios raíles débiles**, y ningún raíl individual cubre los ~235 W que consume la placa. Prefiere una PSU moderna de un solo raíl / DC-DC, o una con buen margen. Consulta [03-power-supply.md](../en/03-power-supply.md).

**Mi cable de alimentación se calentó / echó humo. ¿Por qué?**
Casi con seguridad **cobre falso** — cable de acero o aluminio con baño de cobre, que tiene muchas veces la resistencia del cobre real y se sobrecalienta bajo carga (el splitter PCIe prefabricado de un miembro literalmente echó humo) ([fuente](https://t.me/c/2424231195/97202)). Pruébalo con un imán: se pega al acero, no al cobre. Usa cobre real, **16 AWG o más grueso**. Consulta [03-power-supply.md](../en/03-power-supply.md).

## Refrigeración

**¿Por qué se sobrecalienta / hace throttling nada más sacarla?**
El disipador de fábrica es **pasivo**, pensado para el túnel de aire forzado de un rack de minería. En un escritorio sin flujo de aire se satura de calor y hace throttling. El throttling empieza ~**85 °C**, reset forzado ~**90 °C**. Consulta [04-cooling.md](../en/04-cooling.md).

**¿Cuál es el arreglo de refrigeración más barato que realmente funciona?**
**Afina las densas aletas de fábrica** (una lijadora orbital es lo más rápido) y atornilla un **ventilador de 120 mm de alta presión estática** que sople a través de ellas mediante una carcasa impresa. Resultados de referencia: Noctua NF-P12 → ~73 °C en Furmark, 63–65 °C en juegos ([fuente](https://t.me/c/2424231195/42843)); el Arctic P12 Max se mantiene en ~75 °C ([fuente](https://t.me/c/2424231195/58869)). Consulta [04-cooling.md](../en/04-cooling.md).

**¿Por qué un ventilador de alta presión estática y no un "ventilador de caja" de alto flujo de aire?**
Las aletas densas son una carga de alta resistencia — un ventilador de caja de alto flujo simplemente se estanca contra ellas, mientras que uno de alta presión estática (Noctua/Arctic P12) realmente empuja el aire *a través*. Para aletas muy densas, dos ventiladores en **push–pull (en serie)**, no lado a lado. Consulta [04-cooling.md](../en/04-cooling.md).

**¿Cómo sé si mi refrigeración es suficiente?**
Exige la **GPU y la CPU juntas** (comparten un disipador) — Furmark VK más una carga de CPU — **con tu overclock** (2000 MHz, no stock), y mantén la carga por debajo de ~85 °C. Hay un procedimiento de prueba fijado. Consulta [04-cooling.md](../en/04-cooling.md).

## Linux

**¿Qué distro debería instalar?**
Para "solo jugar", flashea **Bazzite** y rebase a la imagen **`bazzite-bc250`** — los fixes de GPU vienen integrados. Para aprender la máquina: **Fedora** (COPR + script de configuración) o **CachyOS/EndeavourOS** (Arch). Consulta [06-linux.md](../en/06-linux.md).

**Instalé Linux y todo va lento / FPS de un solo dígito. ¿Por qué?**
La GPU no se está acelerando — estás en renderizado por software (LLVMpipe). Necesitas una **Mesa reciente (25.1+)**, el **symlink de firmware `cyan_skillfish`** (o un paquete parcheado) y los parámetros de kernel correctos. Confírmalo con `vulkaninfo | grep deviceName` (*no* debería decir `llvmpipe`). Consulta [06-linux.md](../en/06-linux.md).

**Pantalla en negro tras una actualización de kernel — ¿cómo lo arreglo?**
En la mayoría de las distros el arreglo es el symlink de firmware para que amdgpu pueda cargar:
```bash
sudo ln -s /lib/firmware/amdgpu/navi10_gpu_info.bin.zst \
           /lib/firmware/amdgpu/cyan_skillfish_gpu_info.bin.zst
```
Esto sobrevive a las actualizaciones de kernel (pero **no** en Bazzite, y una actualización de firmware/amdgpu puede borrarlo) ([fuente](https://t.me/c/2424231195/98882)). Si no, arranca un kernel más antiguo/LTS y bloquea la versión del defectuoso. Consulta [06-linux.md](../en/06-linux.md).

**¿Debería instalar apps como Flatpaks?**
Evítalos para cualquier cosa gráfica. Los Flatpaks empaquetan su **propia Mesa**, anulando la parcheada de la placa, así que se ejecutan **sin aceleración por hardware**. PortProton, por ejemplo, debe instalarse vía terminal, no como Flatpak ([fuente](https://t.me/c/2424231195/17949), [fuente](https://t.me/c/2424231195/47092)). Consulta [06-linux.md](../en/06-linux.md).

**Mi CPU se siente débil — ¿alguna mejora rápida?**
Dos ajustes de kernel: **`mitigations=off`** (desactiva las mitigaciones de vulnerabilidades de CPU) ([fuente](https://t.me/c/2424231195/23359)) y **`nosmt=force`** (desactiva SMT — +15–25 % FPS en juegos poco multihilo, pero perjudica la multitarea pesada como OBS a alto bitrate) ([fuente](https://t.me/c/2424231195/61332)). Ambos son compromisos de seguridad/rendimiento. Consulta [06-linux.md](../en/06-linux.md).

**GNOME/KDE en Wayland va con fallos — ¿qué hago?**
Problema conocido. Los miembros reportan que las sesiones Wayland (normalmente GNOME/KDE) se comportan mal en esta placa; **usa la sesión X11** en su lugar ([fuente](https://t.me/c/2424231195/19623)). Consulta [06-linux.md](../en/06-linux.md).

**Mi RAM se llena rápido — ¿puedo conseguir más swap?**
Sí, amplía el swap **zRAM** (swap de RAM comprimida) — la receta de la comunidad lo sube a 32 GB y lo hace persistente en `/etc/systemd/zram-generator.conf` ([fuente](https://t.me/c/2424231195/38703)). No añade memoria real pero absorbe los picos. Consulta [06-linux.md](../en/06-linux.md).

**Una actualización de kernel rompió cosas — ¿cómo hago rollback?**
El sistema conserva los últimos kernels. En Fedora, lístalos con `grubby` y `grubby --set-default /boot/vmlinuz-…`, luego reinicia ([fuente](https://t.me/c/2424231195/39393)). En caso de duda, ejecuta un **kernel LTS**. Consulta [06-linux.md](../en/06-linux.md).

## Windows

**¿Ya hay un driver para Windows?**
No — a principios de 2026 **no hay driver de GPU funcional para Windows**. Windows arranca pero la GPU se queda en **Code 43** sin 3D. Existen dos esfuerzos de ingeniería inversa desde cero (Keshas-dev, ZEROAESQUERDA) pero están en la fase de "¿puede la GPU inicializarse siquiera?", no de juegos. Consulta [07-windows.md](../en/07-windows.md).

**¿No puedo simplemente forzar la instalación de un driver de RX 6700 / W5700?**
No. Todo `.inf` oficial (incluido el W5700 que Windows ofrece como "compatible") se instala y luego se cuelga en Code 43 — el ID de dispositivo `1002:13FE` está soldado a la APU. Es la primera idea de cada recién llegado y no puede funcionar. Consulta [07-windows.md](../en/07-windows.md).

**¿Y una VM de Windows con passthrough de GPU?**
No funciona — el passthrough de IOMMU está roto en esta placa, es una APU (no una tarjeta dedicada limpia que ceder) y, de todos modos, el chip se detecta mal. Consulta [07-windows.md](../en/07-windows.md).

**Vi un "driver NVIDIA para BC-250" / un `…bc250.exe` — ¿es real?**
No. El "driver NVIDIA" fue una **broma del Día de los Inocentes** (April Fools'), y un instalador de Adrenalin con "bc250" pegado al nombre del archivo sigue siendo solo un instalador normal de Adrenalin. Ejecuta binarios solo de los repositorios de GitHub nombrados, y lee el código — los "drivers" falsos han sido malware. Consulta [07-windows.md](../en/07-windows.md).

## BIOS y recuperación

**¿Debería flashear una BIOS modificada?**
Solo si quieres desbloquear overclock/timings/VRAM de la iGPU **y** tienes el hardware de recuperación listo. Un ajuste incorrecto puede **dejar la placa muerta en estado de brick**, y en esta placa un **borrado de CMOS no siempre la recupera**. Usa el mod actual basado en 5.00, verifica el SHA-256, y nunca desactives Integrated Graphics (es tu única pantalla). Consulta [08-bios.md](../en/08-bios.md).

**La brickeé — ¿puedo des-brickearla?**
Normalmente sí, pero solo con hardware: un **programador SPI tipo CH341A** conectado al **header J4004** de la placa (el clip SOIC *no* funciona aquí) para reflashear el chip de 16 MB. Cuidado con la trampa de la línea de datos de 3,3 V del CH341A. Consulta [08-bios.md](../en/08-bios.md).

**Cambié el reparto de VRAM pero el SO sigue mostrando la cantidad antigua.**
**Borra la CMOS** tras flashear/cambiar la UMA — retira la CR2032 durante 60+ s o cortocircuita el jumper de CMOS. Algunos ajustes (sobre todo VRAM/UMA) no se aplican hasta que lo haces ([fuente](https://t.me/c/2424231195/97290)). Consulta [08-bios.md](../en/08-bios.md).

## Overclock y undervolt

**¿Cómo hago overclock? ¿Vale la pena?**
Ejecuta un **governor** (la mayoría de los builds usan **oberon-governor**) y sube la GPU hacia **2000 MHz** (~+30 % FPS *cuando estás limitado por GPU*). El más reciente `bc250_smu_oc` también hace overclock a la CPU (~4 GHz @ 1275 mV). **Refrigera la placa primero** — un OC por encima de ~90 °C la reinicia. Consulta [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**¿Qué es el desbloqueo de 40 CU?**
El die tiene físicamente **40 CU** pero el firmware deja solo **24** activas. Un amdgpu parcheado + `amdgpu.bc250_cc_write_mode=3` reactiva las 40 — una mejora de GPU mayor que las frecuencias (una ejecución de Superposition pasó de 4647 → 6863). Requiere recompilar el módulo del kernel y es solo para Linux. Consulta [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**¿Qué voltaje debería fijar?**
Cada chip es distinto (lotería del silicio). Puntos comunes estables en juego: **2000 MHz ≈ 955 mV** (~75 °C). Valídalo en **juegos reales + alt-tab/menús**, no solo en Furmark, que oculta la inestabilidad. Límite duro de CPU: **nunca superes 1,325 V de Vid**. Consulta [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**¿Es peligroso un undervolt demasiado agresivo?**
No — en el peor caso la placa se cae o desactiva la ranura M.2, y se resuelve en unos segundos porque el OC no se guarda en la BIOS. Hacer over-*volt* a la CPU es la dirección peligrosa. Consulta [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

## Pantalla, WiFi y Bluetooth

**¿Sin imagen por HDMI?**
La placa emite por **DisplayPort**; para HDMI/TV usa un **adaptador o cable DP→HDMI** (uno bueno también funciona en la BIOS y hace 4K) ([fuente](https://t.me/c/2424231195/24107)). Prefiere un **cable DP→HDMI** de verdad antes que un adaptador pasivo barato — un mal adaptador causó pantallas en negro a un miembro ([fuente](https://t.me/c/2424231195/96416)).

**El audio por DisplayPort está distorsionado.**
Problema conocido en Linux. El arreglo simple es sacar la señal por un adaptador **DP→HDMI**, que transporta audio limpio ([fuente](https://t.me/c/2424231195/17953)). Consulta [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**¿Tiene WiFi/Bluetooth?**
Sin inalámbrico integrado — necesitas un **dongle USB**, elegido por **chipset, no por marca**. El mejor documentado es un stick **aic8800d80**; los sticks Realtek RTL8821/8822 baratos funcionan con `lwfinger/rtw88` pero se caen bajo carga. Para la configuración, un adaptador USB-Ethernet cableado evita todo el problema. Consulta [10-wifi-bt.md](../en/10-wifi-bt.md).

**Mi dongle WiFi se desconecta sin parar.**
Síntoma clásico de Realtek-en-BC-250: instala el driver out-of-tree correcto (rtw88 / rtl8831), prueba un puerto USB trasero y reinícialo con `usbreset` en vez de desenchufar. Si la fiabilidad importa más que el precio, cámbiate a aic8800d80 o a un stick Digma confirmado. Consulta [10-wifi-bt.md](../en/10-wifi-bt.md).

## Juegos e IA

**¿Qué FPS puedo esperar?**
Con un OC real de **2000 MHz**: AAA modernos a **40–60 FPS**, juegos más ligeros/antiguos por encima de 60. Mejor a **1080p–1440p** con FSR. La placa suele estar **limitada por CPU**, así que la resolución a menudo es "gratis" pero los juegos con mucha física/mal multihilo tartamudean sin importar nada. Consulta [11-gaming.md](../en/11-gaming.md).

**¿Qué juegos funcionan mejor?**
**Los ports first-party de PlayStation** (God of War, Horizon, The Last of Us, Spider-Man, Ghost of Tsushima) — se apoyan en la GPU y están bien optimizados. Emulación: Switch (Eden) y PS4 (shadPS4) van sólidos; Xbox 360 (Xenia) no. Consulta [11-gaming.md](../en/11-gaming.md).

**¿Por qué mi GPU está al ~40 % de carga pero los FPS son bajos?**
Estás **limitado por CPU** — la Zen 2 de 6 núcleos es el cuello de botella, no la GPU. El upscaling no subirá mucho los FPS en ese caso; prueba `nosmt=force`/`mitigations=off` y acepta que algunos títulos están limitados por CPU. Consulta [11-gaming.md](../en/11-gaming.md).

**¿Puedo ejecutar LLM / IA locales en ella?**
Sí — los 16 GB de GDDR6 alojan modelos de tamaño medio vía `llama.cpp`/Jan en el backend **Vulkan**; configura la BIOS para asignar ~12 GB a la GPU primero. Consulta [12-ai-llm.md](../en/12-ai-llm.md).

## Compra

**¿Cuál es un precio justo y dónde compro?**
Los precios y las fuentes cambian rápido y son específicos de cada región (eBay, AliExpress, Ozon/Avito en la CEI) — los reportes recientes se agrupan en torno a los 100 y pico dólares hasta ~13k₽. Consulta [02-buying.md](../en/02-buying.md).

**¿Cuáles son los riesgos de comprar una?**
Es hardware usado de minería/servidor: las placas pueden llegar necesitando un reset de BIOS, ligeramente dobladas, o de vez en cuando defectuosas, y no hay soporte del fabricante — la comunidad es tu soporte. Presupuesta tiempo, no solo dinero. Consulta [01-what-is-bc250.md](../en/01-what-is-bc250.md) y [02-buying.md](../en/02-buying.md).

**¿Puedo ejecutar macOS en ella?**
No lo hagas. La CPU puede arrancar, pero la **GPU nunca se acelerará** (no hay gemela soportada que falsear, y ninguna iGPU de APU de AMD ha funcionado jamás en macOS). Usa Linux. Consulta [13-macos.md](../en/13-macos.md).

---

## Fuentes

- Chat fuente: *comunidad AMD BC-250* (Telegram). La mayoría de las respuestas resumen una sección completa del manual — sigue el enlace de la sección para las citas subyacentes.
- Grosores de almohadillas térmicas — https://t.me/c/2424231195/22442
- Arctic P12 Max ~75 °C — https://t.me/c/2424231195/58869 · Noctua P12 ~73 °C — https://t.me/c/2424231195/42843
- Arreglo del symlink de firmware para pantalla en negro tras kernel (no Bazzite) — https://t.me/c/2424231195/98882
- Flatpak rompe la aceleración por hardware — https://t.me/c/2424231195/17949 · PortProton vía terminal — https://t.me/c/2424231195/47092
- `mitigations=off` para CPU débil — https://t.me/c/2424231195/23359 · ganancia de FPS con `nosmt=force` — https://t.me/c/2424231195/61332
- Fallos de Wayland, usa X11 — https://t.me/c/2424231195/19623
- Aumento de swap zRAM — https://t.me/c/2424231195/38703 · selección/rollback de kernel — https://t.me/c/2424231195/39393
- Splitter de alimentación sobrecalentado/con humo (cobre falso) — https://t.me/c/2424231195/97202
- Borrado de CMOS necesario tras cambiar la VRAM — https://t.me/c/2424231195/97290
- Adaptador DP→HDMI (4K/TV, funciona en BIOS) — https://t.me/c/2424231195/24107 · mal adaptador → pantalla en negro — https://t.me/c/2424231195/96416 · arreglo de distorsión de audio DP — https://t.me/c/2424231195/17953

> Esta FAQ es un mapa, no el territorio — cada respuesta apunta a la sección que lleva el detalle y las fuentes primarias. Se agradecen las correcciones vía PR (consulta [CONTRIBUTING.md](../../CONTRIBUTING.md)).
