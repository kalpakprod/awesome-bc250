🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · **Español** · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — la biblia del recién llegado para la AMD BC-250" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> La biblia del recién llegado para la **AMD BC-250** — una placa APU derivada de la PlayStation 5 (Cyan Skillfish / Oberon, 16 GB GDDR6) reconvertida en una caja barata de Linux para juegos e IA.

Todo lo que necesitas para pasar **de una placa en una caja a ejecutar juegos** — recopilado a partir de más de 125 000 mensajes de la comunidad BC-250, clasificado según lo que la gente realmente votó y fijó, y contrastado con los repositorios canónicos del proyecto.

🌍 Idiomas: [English](README.md) · [Русский](README.ru.md) · **Español**

---

## ⚡ Empieza aquí

¿Placa nueva y no sabes nada? Sigue el camino dorado en orden:

**[docs/es/00-start-here.md](docs/es/00-start-here.md)** — Comprar → Alimentar → Refrigerar → Instalar el SO → Drivers → Overclock → Jugar.

---

## 📚 Manual

| # | Sección | Para |
|---|---------|-----|
| 01 | [Qué es la BC-250](docs/en/01-what-is-bc250.md) | especificaciones, tamaños, pinout, expectativas |
| 02 | [Guía de compra](docs/en/02-buying.md) | dónde, precio, riesgos, compras grupales |
| 03 | [Fuente de alimentación](docs/en/03-power-supply.md) | LOP / Flex ATX, pinout de 8 pines, cableado |
| 04 | [Refrigeración](docs/en/04-cooling.md) | disipador, carcasas de ventilador, método de prueba |
| 05 | [Carcasas e impresión 3D](docs/en/05-case.md) | catálogo de carcasas imprimibles (STL) |
| 06 | [Drivers y configuración de Linux](docs/en/06-linux.md) | elección de distro, amdgpu, instalación |
| 07 | [Drivers y configuración de Windows](docs/en/07-windows.md) | estado de los drivers, cómo hacerlo |
| 08 | [BIOS y recuperación de brick](docs/en/08-bios.md) | BIOS modificada, flasheo, des-brickear |
| 09 | [Overclocking y undervolting](docs/en/09-overclock-undervolt.md) | governor, SMU, desbloqueo de 40 CU |
| 10 | [Dongles WiFi y Bluetooth](docs/en/10-wifi-bt.md) | dongles que realmente funcionan |
| 11 | [Resultados de juego y ajustes](docs/en/11-gaming.md) | benchmarks, ajustes por juego |
| 12 | [IA / LLM en la BC-250](docs/en/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/en/13-macos.md) | estado |
| 14 | [Pantalla y salida de vídeo](docs/en/14-display.md) | DisplayPort, adaptadores DP→HDMI, pantalla dual |
| 15 | [Emulación](docs/en/15-emulation.md) | cada consola/plataforma, estado realista |
| 16 | [USB, hubs y almacenamiento](docs/en/16-usb-peripherals.md) | hubs, mod de 5 V, adaptadores M.2 / SATA |
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
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — desbloquea las 40 CU
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Drivers
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — driver de GPU para Windows (experimental, sin aceleración completa a principios de 2026)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — trabajo en driver PSP/GPU
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — kernel de Linux

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — las imágenes y mods de BIOS más referenciados
- Consulta [docs/en/08-bios.md](docs/en/08-bios.md) para flasheo y recuperación de brick

### Dongles WiFi / BT
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### IA / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Carcasas / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables y MakerWorld — consulta [docs/en/05-case.md](docs/en/05-case.md)

---

## 🤝 Contribuir

Este es un repositorio **vivo**. El conocimiento se extrae del chat de la comunidad mediante una canalización reproducible (consulta [CONTRIBUTING.md](CONTRIBUTING.md)) y se vuelve a ejecutar sobre nuevas exportaciones. Se agradecen los PR con correcciones, nuevos dongles, nuevas carcasas y comandos verificados.

## 📄 Licencia

Documentación: [CC-BY-SA-4.0](LICENSE). Scripts en `assets/scripts/`: MIT. El firmware/drivers de terceros replicados conservan sus derechos originales — consulta [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md).

## 🙏 Créditos

Toda la comunidad BC-250 — consulta **[CREDITS](CREDITS.md)** para ver los principales colaboradores que hicieron posible este manual. Fuente: *chat de la comunidad AMD BC-250*. Los autores del proyecto están acreditados por el nombre de su repositorio más arriba.
