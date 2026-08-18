<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — la biblia del recién llegado para la AMD BC-250" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> La biblia del recién llegado para la **ASRock AMD BC-250** — una placa APU derivada de la PlayStation 5 (Cyan Skillfish / Oberon, Zen 2 de 6 núcleos + RDNA 2, 16 GB GDDR6) reconvertida en una **mini PC barata de Linux para juegos e IA** — una Steam Machine económica de bricolaje.

Todo lo que necesitas para pasar **de una placa en una caja a ejecutar juegos** — recopilado a partir de 130k+ mensajes de la comunidad BC-250, clasificado según lo que la gente realmente votó y fijó, y contrastado con los repositorios canónicos del proyecto.

🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · **Español** · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<sub>_Mantenido · última actualización **agosto de 2026** · [llms.txt](llms.txt) para agentes de IA_</sub>

---

## ❓ Respuestas rápidas

- **¿Qué es la ASRock AMD BC-250?** Una placa APU derivada de la PlayStation 5 — Zen 2 de 6 núcleos + 24/40 CU de RDNA 2 ("Cyan Skillfish"), 16 GB GDDR6 — vendida barata como tarjeta ex-minería y reconvertida en una mini PC de Linux para juegos e IA, una Steam Machine económica de bricolaje.
- **¿Cuánto cuesta?** Alrededor de **$60–130** por la placa desnuda; una build completa (fuente, disipador, SSD) ronda los **$150–250**. Consulta [Guía de compra](docs/es/02-buying.md).
- **¿Cómo va en juegos?** Aproximadamente **1080p 60 FPS** en la mayoría de títulos (clase RX 6600) con FSR / Frame-Gen y overclock de GPU+CPU. Consulta [Resultados de juego](docs/es/11-gaming.md).
- **¿Qué sistema operativo?** **Solo Linux** para aceleración de GPU — Bazzite, Fedora, CachyOS o Arch con Mesa 25.1+. No hay driver de GPU para Windows. Consulta [Configuración de Linux](docs/es/06-linux.md).
- **¿Puede ejecutar LLMs?** Sí — llama.cpp / Ollama sobre Vulkan usan los 16 GB de GDDR6 como VRAM (~30–47 tok/s en modelos pequeños). Consulta [IA / LLM](docs/es/12-ai-llm.md).
- **¿Cómo lo refrigerio?** El disipador de servidor de serie hace throttling en un escritorio; afina las aletas y añade un ventilador de 120 mm, o pasa a refrigeración líquida. Consulta [Refrigeración](docs/es/04-cooling.md).

---

## ⚡ Empieza aquí

¿Placa nueva y no sabes nada? Sigue el camino dorado en orden:

**[docs/es/00-start-here.md](docs/es/00-start-here.md)** — Comprar → Alimentar → Refrigerar → Instalar el SO → Drivers → Overclock → Jugar.

---

## 📈 Qué te aporta realmente el ajuste

Cada ajuste de esta placa tiene un coste. Estos son los cuatro que importan, extraídos de lo que midió la comunidad — léelos antes de flashear nada.

<p align="center">
  <img src="assets/diagrams/gpu-clock-tradeoff.svg" width="100%" alt="Frecuencia del núcleo de la GPU: la ganancia de FPS sube hasta aproximadamente el 95% a 2000 MHz y luego se aplana porque la CPU la limita, mientras que la potencia y el calor siguen subiendo al 95%. Punto óptimo alrededor de 2000 MHz, aproximadamente +30% FPS.">
</p>

<p align="center">
  <img src="assets/diagrams/undervolt-tradeoff.svg" width="100%" alt="Undervolt: la eficiencia sube del 20% al 95% a medida que el voltaje baja de 1129 mV a 700 mV, mientras que el riesgo de inestabilidad sube del 15% al 100%. El rango estable en juegos es de aproximadamente 905 a 955 mV; por debajo de 700 mV la GPU se bloquea a 1500 MHz.">
</p>

<p align="center">
  <img src="assets/diagrams/cu40-tradeoff.svg" width="100%" alt="Desbloqueo de 40 CU: el cómputo sube del 40% al 90% mientras que los FPS en juegos solo pasan del 40% al 47%, y la potencia y la inestabilidad suben del 25% al 100%. 38 CU es el máximo estable típico; 40 CU es una lotería que necesita más de 300 W y un AIO.">
</p>

<p align="center">
  <img src="assets/diagrams/memory-tradeoff.svg" width="100%" alt="Ajuste de memoria GDDR6: el ancho de banda y la ganancia de FPS solo se mueven del 30% al 52% mientras que el riesgo de brick sube del 20% al 100%. 1950 MHz es el punto en el que las placas volvieron bricked.">
</p>

<p align="center">
  <img src="assets/diagrams/power-by-config.svg" width="100%" alt="Consumo medido en la pared por configuración: 200 W a 38 CU y 1200 MHz con 850 mV, 260 W a 40 CU y 1800 MHz con 860 mV, 310 W a 38 CU y 1500 MHz, y 350 W a 40 CU y 2000 MHz con 960 mV, con 1025 mV añadiendo solo 2 W más. El mejor punto de vatios por fotograma reportado es 40 CU a 1800 MHz.">
</p>

Esos cinco puntos son mediciones, no un modelo: pasar de 1800 a 2000 MHz cuesta unos 90 W — aproximadamente lo que costaron los 600 MHz anteriores — y subir de 960 mV a 1025 mV no compra nada salvo 2 W de calor. A 350 W, una fuente de 300 W se dispara en 30 segundos y el raíl de +12V lleva 26 A.

<details>
<summary>Consumo en reposo — por qué el medidor de pared apenas se mueve</summary>

<p align="center">
  <img src="assets/diagrams/idle-power-tradeoff.svg" width="100%" alt="Consumo en reposo: el consumo de la GPU baja de 80 W a 5 W con el governor, el undervolt y la suspensión automática, pero el consumo total en la pared solo baja de 125 W a 110 W hasta que la suspensión lo deja en 10 W.">
</p>

El governor y el undervolt recortan la GPU, pero la CPU y la GDDR6 siguen consumiendo igualmente. Hasta que entra la suspensión automática, el medidor de pared apenas se entera. Los lotes de alta fuga no bajan de unos 70–80 W.

</details>

<sub>Datos de origen: [`assets/diagrams/data.json`](assets/diagrams/data.json) · reconstruye con `node assets/diagrams/build.mjs`</sub>

---

## 📚 Manual

| # | Sección | Para |
|---|---------|-----|
| 01 | [Qué es la BC-250](docs/es/01-what-is-bc250.md) | especificaciones, tamaños, pinout, expectativas |
| 02 | [Guía de compra](docs/es/02-buying.md) | dónde, precio, riesgos, compras grupales |
| 03 | [Fuente de alimentación](docs/es/03-power-supply.md) | LOP / Flex ATX, pinout de 8 pines, cableado |
| 04 | [Refrigeración](docs/es/04-cooling.md) | disipador, carcasas de ventilador, método de prueba |
| 05 | [Carcasas e impresión 3D](docs/es/05-case.md) | catálogo de carcasas imprimibles (STL) |
| 06 | [Drivers y configuración de Linux](docs/es/06-linux.md) | elección de distro, amdgpu, instalación |
| 07 | [Drivers y configuración de Windows](docs/es/07-windows.md) | estado de los drivers, cómo hacerlo |
| 08 | [BIOS y recuperación de brick](docs/es/08-bios.md) | BIOS modificada, flasheo, des-brickear |
| 09 | [Overclocking y undervolting](docs/es/09-overclock-undervolt.md) | governor, SMU, desbloqueo de 40 CU |
| 10 | [Dongles WiFi y Bluetooth](docs/es/10-wifi-bt.md) | dongles que realmente funcionan |
| 11 | [Resultados de juego y ajustes](docs/es/11-gaming.md) | benchmarks, ajustes por juego |
| 12 | [IA / LLM en la BC-250](docs/es/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/es/13-macos.md) | estado |
| 14 | [Pantalla y salida de vídeo](docs/es/14-display.md) | DisplayPort, adaptadores DP→HDMI, pantalla dual |
| 15 | [Emulación](docs/es/15-emulation.md) | cada consola/plataforma, estado realista |
| 16 | [USB, hubs y almacenamiento](docs/es/16-usb-peripherals.md) | hubs, mod de 5 V, adaptadores M.2 / SATA |
| ❓ | [FAQ](docs/es/faq.md) · [Solución de problemas](docs/es/troubleshooting.md) | problemas comunes |

---

## 🔗 Recursos Awesome

Proyectos canónicos de la comunidad, clasificados según la frecuencia con la que la comunidad los señaló.

### Documentación
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) — la referencia de hardware principal (ingeniería inversa)
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [sitio](https://elektricm.github.io/amd-bc250-docs/) — documentación comunitaria completa (pinouts, por distro, solución de problemas)
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — documentación de la organización
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — builds y scripts

### Overclock / Undervolt / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — el governor que ejecuta la mayoría de los builds (fija frecuencias/voltaje)
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — fork de oberon-governor con interfaz gráfica (Linux)
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [fork de bc250-collective](https://github.com/bc250-collective/cyan-skillfish-governor)
- [rw-r-r-0644/bc250-core-unlock](https://github.com/rw-r-r-0644/bc250-core-unlock) — desbloquea los 2 núcleos de CPU deshabilitados (máscara de fábrica 0x77; una máscara 0xB7 significa núcleos físicamente defectuosos — forzarlo da artefactos y bloqueos)
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — desbloquea las 40 CU
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Toolkits e imágenes listas para usar
- [redbeard1083/bc250-toolkit](https://github.com/redbeard1083/bc250-toolkit) — configuración guiada por menús para CachyOS: kernel, governors de CPU/GPU, swap, ZRAM→ZSWAP, ajustes de ACPI y arranque
- [62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images](https://github.com/62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images) — imágenes precompiladas de Bazzite Deck/GNOME/KDE con los parches de la BC-250 aplicados

### Drivers
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — driver de GPU para Windows (experimental, sin aceleración completa a principios de 2026)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — trabajo en driver PSP/GPU
- [DryhoppedIPA/bc250-gfx1013-fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix) — parches de kernel + Mesa/RADV para la cola de cómputo rota de la GPU (async compute); también arregla la ruta INT8 de FSR 4 / XeSS 3
- [MastaG/linux-cachyos-bc250](https://github.com/MastaG/linux-cachyos-bc250) — kernel de CachyOS con cherry-picks de la BC-250
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — kernel de Linux

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — las imágenes y mods de BIOS más referenciados
- [TheRetroWeb — base de datos de BIOS de la BC-250](https://theretroweb.com/bios?itemsPerPage=24&chipsetIds%5B%5D=1990) — volcados de BIOS de fábrica, explora/descarga por versión
- [Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script](https://github.com/Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script) — copia de seguridad del firmware y flasheo de firmware personalizado guiados por menús
- Consulta [docs/es/08-bios.md](docs/es/08-bios.md) para flasheo y recuperación de brick

### Dongles WiFi / BT
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### IA / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Carcasas / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables y MakerWorld — consulta [docs/es/05-case.md](docs/es/05-case.md)

---

## 🤝 Contribuir

Este es un repositorio **vivo**. El conocimiento se extrae del chat de la comunidad mediante una canalización reproducible (consulta [CONTRIBUTING.md](CONTRIBUTING.md)) y se vuelve a ejecutar sobre nuevas exportaciones. Se agradecen los PR con correcciones, nuevos dongles, nuevas carcasas y comandos verificados.

## 📄 Licencia

Documentación: [CC-BY-SA-4.0](LICENSE). Scripts en `assets/scripts/`: MIT. El firmware/drivers de terceros replicados conservan sus derechos originales — consulta [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md).

## 🙏 Créditos

Toda la comunidad BC-250 — consulta **[CREDITS](CREDITS.md)** para ver los principales colaboradores que hicieron posible este manual. Fuente: *chat de la comunidad AMD BC-250*. Los autores del proyecto están acreditados por el nombre de su repositorio más arriba.
