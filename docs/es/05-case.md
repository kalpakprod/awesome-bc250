> 🌐 Traducción de la comunidad. La versión en inglés es la fuente de verdad y puede estar más actualizada. ¿Encontraste un error? Abre un issue: [../en/05-case.md](../en/05-case.md) · https://github.com/lildebil0/awesome-bc250/issues

# Carcasas e impresión 3D

> **TL;DR** — La BC-250 se vende como placa desnuda, así que casi todo el mundo imprime una caja. No existe una única carcasa "correcta": la comunidad ha producido **docenas** de diseños, desde una **funda de refrigeración** mínima que simplemente engancha dos mitades alrededor de la placa, hasta **cajas estilo consola** completas con asa de transporte, pantalla frontal y RGB. Imprimas lo que imprimas, la carcasa tiene que hacer una cosa que la placa de fábrica no puede: **sellar un ventilador de 120 mm contra las aletas del disipador** para que el aire pase *a través* de ellas (ver [Refrigeración](04-cooling.md)). Esta página es el catálogo: nombre → STL → ventiladores → dónde descargar. **Cuidado con la PSU**: la mayoría de las carcasas están diseñadas en torno a una fuente de alimentación concreta (LOP, Flex/SFX ATX o un ladrillo de servidor HP) — elige la carcasa que coincida con la [PSU](03-power-supply.md) que tengas.

Una "carcasa" aquí va desde una impresión de 200 g que requiere 20 minutos de trabajo hasta una consola de múltiples piezas que le llevó semanas a su autor. Empieza simple; siempre puedes reimprimir.

> **¿Nuevo e inseguro? Imprime la carcasa [funda/shell de onemorecap](#nivel-1--funda-de-refrigeración-mínima-empieza-aquí) — mínima, nada que cortar, encaja un único ventilador de 120 mm — y quédate ahí.** El catálogo de abajo es profundo; no necesitas leerlo para empezar.

> **¿Quieres la lista completa?** elektricM mantiene un **catálogo buscable y filtrable de ~143 diseños** (filtra por familia de PSU, disponibilidad, plataforma) — muchos más que el conjunto curado de abajo, incluyendo muchos builds solo de Discord y en desarrollo (WIP). Explóralo en **[elektricM — Cases & Enclosures](https://elektricm.github.io/amd-bc250-docs/community/cases/)**. Las selecciones de abajo son las nombradas, descargables públicamente, por las que merece la pena empezar.

---

## Builds de la comunidad

Una muestra de lo que la gente ha impreso realmente — desde una carcasa abierta desnuda hasta consolas totalmente tematizadas. La misma placa, resultados radicalmente distintos.

<p align="center">
  <img src="../../assets/img/case-shell.jpg" alt="Shell Case de onemorecap: placa lateral abierta, asa de transporte, aletas de cobre expuestas, ventilador Arctic de 120 mm" width="60%"><br>
  <sub>Build de Дима Ткач · <a href="https://t.me/c/2424231195/22771">fuente</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-frame.jpg" alt="Frame abierto de aluminio blanco con los componentes a la vista: dos disipadores, ventilador Arctic blanco central, PSU Flex" width="60%"><br>
  <sub>Build de Сергей · <a href="https://t.me/c/2424231195/87420">fuente</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-orange.jpg" alt="Consola cerrada naranja y blanca con panel lateral de malla perforada y un asa de transporte moldeada" width="60%"><br>
  <sub>Build de Alexander Susl · <a href="https://t.me/c/2424231195/122822">fuente</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-arasaka.jpg" alt="Consola con temática cyberpunk ARASAKA: cara blanca, rejilla de ventilador cromada, acentos y pies verdes" width="60%"><br>
  <sub>Build de Maxim Perelygin · <a href="https://t.me/c/2424231195/98072">fuente</a></sub>
</p>

---

## Cómo elegir

Tres preguntas deciden qué carcasa te conviene:

1. **¿Qué PSU vas a usar?** ([Fuente de alimentación](03-power-supply.md)) — Una Meanwell **LOP-300** es pequeña y vive *dentro* de la mayoría de las carcasas. Una PSU **Flex/SFX ATX** es más grande y necesita una carcasa con un compartimento dedicado. Un **ladrillo HP/de servidor** reciclado necesita las carcasas "PSU de servidor v3/v4". Este es el filtro más importante de todos.
2. **¿Qué ventilador(es) vas a usar?** Casi todas las carcasas se construyen en torno a **un ventilador de 120 mm** sobre el disipador. Los builds más grandes añaden un **segundo ventilador de 120 mm** en el backplate (para refrigerar la memoria GDDR6, que [no tiene sensor de temperatura](04-cooling.md)) o para alimentar la PSU. Unos pocos usan ventiladores de **140 mm** o **slim** donde la altura es ajustada.
3. **¿Ya has afinado las aletas?** La mayoría de las carcasas asumen que ya has **limado/lijado abiertas las aletas del disipador de fábrica** (ver [Refrigeración, Ruta A](04-cooling.md)). Una carcasa por sí sola no arregla el cooler de fábrica — simplemente sujeta el ventilador en el lugar correcto.

> **Jerga, una vez:** **STL** = el archivo de malla estándar de impresión 3D que cargas en un slicer. **STEP / 3MF** = formatos CAD editables (úsalos si quieres modificar el diseño). **Shroud / funda / adaptador** = un embudo impreso que hace que el ventilador selle contra las aletas en lugar de fugar aire alrededor de ellas. **Flex / SFX ATX** = fuentes de alimentación de PC de factor de forma pequeño. **LOP** = la PSU industrial Meanwell LOP-300 que la comunidad prefiere.

> **💡 Imprime un agujero de acceso al puente de borrado de CMOS.** Cada vez que cambias la división VRAM/UMA tienes que **borrar la CMOS** (ver [BIOS](08-bios.md)), así que diseñar una carcasa sellada que entierra el puente significa abrirla repetidamente. Deja un **agujero de acceso de ⌀10 mm** sobre el puente de borrado de CMOS en cualquier diseño cerrado — o, mejor, cablea un pequeño **interruptor de 3 posiciones** hacia el panel para poder resetearlo sin herramientas. ([4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980))

---

## Nivel 1 — "Funda de refrigeración" mínima (empieza aquí)

Lo más pequeño y rápido que puedes imprimir. **No es realmente una carcasa** — es una chaqueta impresa que se acopla a la placa en dos mitades con un ajuste a presión apretado, sujeta un ventilador de 120 mm contra el disipador y conduce el aire. **Nada que cortar, sin tornillos en la placa.** Дима Ткач (uno de los primeros builders del proyecto) describe dos variantes — una compacta y otra "de aspecto más divertido" — ambas alcanzando **~70 °C a 150 W** de carga, ~210 g / ~170 g de plástico cada una, con la PSU manteniéndose fría gracias al flujo de aire turbulento ([src](https://t.me/c/2424231195/10743)). Su veredicto: *"esto no es realmente una carcasa, más bien una funda de refrigeración, pero no hay nada que cortar, todo se sujeta con un ajuste muy apretado, las mitades se colocan desde lados opuestos."*

- **Archivos:** `BC-250-FanSleeves.3mf` ([src](https://t.me/c/2424231195/10766)), CAD de la placa `bc-250-body.step` ([src](https://t.me/c/2424231195/18266))
- **Repo fuente:** [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) — el diseño mínimo "verificado, impreso, confirmado funcionando" más recomendado en el chat ([src](https://t.me/c/2424231195/18260))
- **Ventilador:** 1× 120 mm
- **PSU:** cualquiera — hay un agujero/recorte para el cable de alimentación, así que puedes usar una LOP *o* una fuente externa ([src](https://t.me/c/2424231195/22950))

---

## Nivel 2 — Frame abierto / "shell" (placa a la vista)

Medias carcasas que envuelven la placa por un lado y dejan el disipador visible. Ligeras en plástico, fáciles de montar, buen flujo de aire.

### "Shell Case" de onemorecap — el build de referencia

El post de carcasa con más reacciones de valor del chat (❤33): una placa lateral plana sobre la placa, grabada con **"BC-250"** y el patrón de cuadrícula CU, un **asa de transporte** moldeada en la parte superior, las **aletas afinadas del disipador expuestas** en el centro, y un ventilador **Arctic** de 120 mm en su propio shroud atornillado al extremo derecho. Marcada *"BC-250 SHELL CASE BY ONEMORECAP / ASRock × CMG"* ([src](https://t.me/c/2424231195/22771)). El conjunto correspondiente de STLs se publicó en el chat en un solo lote ([src](https://t.me/c/2424231195/81672)) y el autor confirmó que los modelos son gratuitos en Printables y MakerWorld ([src](https://t.me/c/2424231195/24505)).

- **Archivos (lote del chat):** `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl`, más los shrouds de ventilador de abajo ([src](https://t.me/c/2424231195/81680))
- **Fuente:** [GitHub onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case)
- **Ventilador:** 1× o 2× 120 mm (vía shroud), o 1× 140 mm
- **PSU:** el panel trasero `Shell_Back_FLEX_ATX` está recortado para una PSU **Flex ATX**

### Frame abierto de acrílico (Владислав)

Un frame abierto de **aluminio y acrílico**: dos placas metálicas en los extremos con paneles laterales transparentes, la placa montada verticalmente, un único ventilador **Arctic de 120 mm** soplando directamente a través del disipador afinado en el centro, y una PSU Flex/SFX en el compartimento inferior ([src](https://t.me/c/2424231195/114651)). Este es el diseño que más tarde se publicó en [r/BC250Gaming como la "carcasa de acrílico"](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/). Los soportes impresos son las piezas que reproduces; el frame en sí es de corte láser/comercial.

- **Ventilador:** 1× 120 mm (centro) — espacio para añadir un ventilador en el backplate
- **PSU:** Flex / SFX ATX en el compartimento inferior

---

## Nivel 3 — Cajas estilo consola (totalmente cerradas)

Cajas cerradas que parecen una consola de videojuegos o un NAS pequeño. Más plástico y más tiempo de impresión, pero un producto terminado con asa, botón de encendido, paneles ventilados y a veces una pantalla.

### "Просто лучший корпус" (Jack Fisher × B1zon) — favorita de la comunidad

Publicada bajo la etiqueta curada **#BC250body** como *"simplemente la mejor carcasa"*, esta es una consola totalmente terminada con una lista de materiales publicada: PSU, ventiladores, conector, pies de goma, botón de encendido, tornillos + insertos roscados, un splitter PWM de ventiladores, una pegatina "Cyberpunk" y un peine para enderezar el disipador. Algunas piezas están descatalogadas y tienen sustitutos ([src](https://t.me/c/2424231195/79990)). Diseño a cargo de B1zon, montaje por Jack Fisher.

- **Archivos:** `BC250 korpus исправленный.rar` ("BC250 case, corregida") ([src](https://t.me/c/2424231195/79989))
- **Ventilador:** 120 mm (frontal) + splitter PWM para un segundo ventilador
- **PSU:** interna (clase LOP)

### Frente con triple "GPU" (Гослинг)

Una caja-consola cuyo panel frontal es un **shroud de tarjeta gráfica falsa** — tres recortes circulares de ventilador en fila con RGB, para que la máquina parezca una GPU discreta. Mostrada ejecutando **Bazzite 42** en la BC-250 ([src](https://t.me/c/2424231195/66616)). Las tres aberturas son cosméticas sobre el único ventilador funcional más la admisión.

### Consola blanca con panel laberinto (Jhonatan)

Una caja blanca alta con un llamativo **panel lateral ventilado con patrón de laberinto/circuito**, un botón de encendido metálico iluminado (verde), y una rejilla de admisión de altura completa en la cara frontal — una de las estéticas más pulidas del chat ([src](https://t.me/c/2424231195/121274)).

### Mini-torre con malla de cuadrícula (Joglik)

Una mini-torre vertical gris con **malla de cuadrícula cuadrada** densa en el lateral y la parte superior, una muesca de ranura/asa en el borde superior, y un pasacables redondo en la parte trasera inferior. Aspecto industrial limpio ([src](https://t.me/c/2424231195/126525)).

### Caja hi-fi con ventana ovalada (a m)

Una carcasa rectangular blanca con estilo de frente hi-fi/microondas: una gran **ventana de malla con forma de estadio** con el ventilador visible detrás de una malla circular, flanqueada por dos ranuras de malla verticales ([src](https://t.me/c/2424231195/52955)). La iteración posterior del autor avanza hacia "plástico de verdad" en lugar de PVC espumado y añade alimentación externa serie XT y RGB ([src](https://t.me/c/2424231195/128048)).

### Consola compacta (Volodymyr Spyrydonov, "v15")

Una pequeña caja-consola plateada y negra con una admisión lateral de malla y un frente oscuro con un emblema estilo cyberpunk y una tira RGB, mostrada junto a un televisor como máquina de salón ([src](https://t.me/c/2424231195/135995)). Parte de una larga serie de revisiones (las imágenes fuente v15/v19/v20 se compartieron al principio).

### BC250 Vented Edition (MaelremremDotXYZ)

Una consola **FlexATX** minimalista ejecutada con **aletas abiertas**, manteniendo **~67 °C @ 2145 MHz / 1.1 V**, con un interruptor de corte de la PSU en la parte trasera. [MakerWorld 2899020](https://makerworld.com/en/models/2899020).

### Stellar 250 (isaacalvex)

Una consola completa y autónoma con una **guía de build** completa: almacenamiento interno, **WiFi 6** y una **pantalla de temperatura ESP32**. [GitHub isaacalvex/AMD-BC-250-Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide).

### Simple Case for the ASRock AMD BC-250

Una caja-consola nombrada y descargable públicamente publicada por el autor del [tutorial de build ucraniano en YouTube](https://youtu.be/p5Zd86vFe8w) — una caja cerrada sencilla para quienes quieren una impresión terminada sin la complejidad de múltiples piezas. [MakerWorld 2870270](https://makerworld.com/en/models/2870270).

---

## Nivel 4 — Builds grandes: PSU ATX, líquida AIO, pantallas

Para quienes quieren una PSU de tamaño completo, refrigeración líquida o una pantalla integrada.

### Familia "DIY Steam Machine" de NexGen3D

El **proyecto 3D más señalado** de la comunidad (reposteado 7×). Una familia de carcasas-consola en Printables, incluyendo una variante **"Pro" refrigerada por líquido** y una edición **"Redux"** que encaja una **pantalla Pi interna de 1080×480** en el frontal ([build de Reddit](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)). Hay un modelo dedicado de **montura AIO** para colocar un cooler líquido todo-en-uno de 120 mm sobre el die.

- [Printables 1499974 — DIY Steam Machine (base)](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite)
- [Printables 1614131 — Pro refrigerada por líquido](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) · [Printables 1649679 — Redux](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) · [Printables 1554003 — montura AIO](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250)
- **Ventilador/refrigeración:** aire 120 mm **o** AIO 120 mm según la variante
- **PSU:** versión LOP y versiones ATX documentadas

### Build de referencia "Steam Machine Pro" refrigerada por líquido (Old Lamer)

Un build de gama alta, totalmente refrigerado por líquido, documentado de principio a fin en vídeo — útil como lista de compra de piezas si vas a por todas con una máquina AIO ([Old Lamer](https://youtu.be/afYhUQFa-AY)). La BOM publicada:

- **AIO:** TEUCER AF 240 (todo-en-uno de 240 mm) sobre el die
- **PSU:** Mean Well **LOP-600-12** (o **LOP-500-12** como opción más pequeña) — ver [Fuente de alimentación](03-power-supply.md)
- **Ventiladores:** 2× Arctic **P12 Pro** + 1× Arctic **P8**
- **Encendido remoto:** una **placa de relé ESP32** para encender/apagar la máquina remotamente
- **Software:** **OpenLinkHub** / **Commander Duo** bajo Linux para controlar la bomba AIO y los ventiladores

---

### Steam Cube — carcasa vertical paramétrica, refrigerada por agua (en desarrollo)

Una carcasa vertical **totalmente paramétrica** en el factor de forma de la **Xbox Series X**, diseñada con **prioridad a la refrigeración por agua** con un lado frío intercambiable: un water block, un **Thermalright AXP90-X47 Full-Copper**, o un único **Arctic P12 Max** se atornillan todos a la misma montura. Surgió del boceto **"Xbox Serie X BC-250 Edition" de Sol Diego** ([Printables 1748271](https://www.printables.com/model/1748271)) y del preciso **modelo de placa de torassk** ([Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)), luego redibujada como código (build123d) para que cada dimensión sea una variable que reajustas, no una malla fija.

**Envolvente y el razonamiento detrás** (derivado del tamaño de placa verificado y los objetivos térmicos en [Refrigeración](04-cooling.md)):

- Torre vertical de **~180 × 212 × 380 mm** — lo bastante alta para colocar un **radiador de 240 mm verticalmente** junto a la placa (un conjunto de radiador de ~277 mm encaja dentro de 380 mm de altura).
- **Flujo de aire en chimenea** — admisión de 120 mm abajo, escape de 120 mm arriba, para que el calor suba directamente hacia fuera.
- **El backplate activo es obligatorio, no opcional** — el lado GDDR6 / VRM [no tiene sensor de temperatura](04-cooling.md), así que el diseño trata la refrigeración trasera como una parte requerida.
- **Objetivos de refrigeración** (metas de diseño, **no** resultados medidos): die por agua < 60 °C sostenidos a 40 CU; AXP90 < 75 °C @ 2000 MHz; base P12 ~73–78 °C.

> ⚠️ **Estado: concepto de diseño, no una impresión verificada.** El CAD actual es un **modelo espacial paramétrico** — las piezas tienen el tamaño, la orientación y la colocación correctos, y exporta 8 STL + un STEP — pero **no** se ha impreso, montado ni probado térmicamente, y el water block se coloca a partir del bounding box de la placa en lugar de una posición del die medida. Trátalo como un **CAD de partida para hacer fork**, no como una carcasa terminada; la validación real de impresión / encaje / térmica es el siguiente paso abierto. Los objetivos de arriba son metas, no benchmarks.

---

### Carcasas con PSU ATX (Victor L., V\ad, PSU de servidor v3/v4)

Para una fuente de alimentación **ATX** completa: una carcasa construida en torno a una PSU ATX completa ([src](https://t.me/c/2424231195/119293), rumbo a MakerWorld), un prototipo Blender anterior de un principiante ([src](https://t.me/c/2424231195/105570)), y una línea publicada de **PSU HP/de servidor** en Printables/MakerWorld con provisiones para HDD y hub USB.

- [Printables 1580750 — Case v3, PSU de servidor HP + HDD + hub USB](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) · [MakerWorld 2481620 — Case v4, PSU FlexATX y HP-server](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) · [Printables 1550729 — ATX-PSU Bazzite Box](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box)

### Builds Twin-120 (refrigeración de memoria + PSU)

Una placa de montaje rediseñada que lleva **dos ventiladores de 120 mm** — uno conducido al backplate (memoria) como pretendía el diseñador de la placa, el segundo alimentando la PSU. Con ventiladores Lian Li P28 al frente + un Thermalright C12015, el autor mantiene **2200 MHz a 80 °C en juegos**, donde un único ventilador frontal no era suficiente ([src](https://t.me/c/2424231195/120606)). Se comparte un **`Twin_120mm_Fan_Shroud.stl`** independiente para esto ([src](https://t.me/c/2424231195/121684)).

### The Lanboy — arcade portátil / lonchera

Un build de arcade-lonchera portátil: controla un **panel eDP de portátil de 16″ (1920×1200 @ 165 Hz)** a través de una **placa adaptadora eDisplayPort** ([AliExpress](https://www.aliexpress.com/item/1005006351527252.html)), 2× altavoces de 2″ en un amplificador USB, todo alimentado desde una única **derivación ATX de 12 V**. [Printables 1746364](https://www.printables.com/model/1746364). El truco del adaptador eDP es reutilizable para **cualquier** build con panel de portátil.

### BC250-HUD (Bloodyly) — pantalla de estado interna

Una app de **pantalla de estado en Qt5/C++ para una Raspberry Pi Zero 2** (usada en builds como la NexGen3D Redux): **60 FPS por modo gadget USB**, lee FPS/frametime de MangoHud, detecta el voltaje del ventilador para atenuar la pantalla en suspensión, e **incluye el parche del kernel vc4** que de otro modo congela la Pi. Pantalla: **IPS de 8.8″ 1920×480** (Hannstar HSD088IPW1-A). [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD).

---

## Adaptadores y monturas (no son carcasas completas)

Pequeñas piezas impresas que resuelven un problema — normalmente montar un cooler o ventilador en la placa.

- **Shrouds de ventilador** (sellan un ventilador a las aletas): `Fan_Shroud_Single_120mm.stl`, `Fan_Shroud_Dual_120mm.stl`, `Fan_Shroud_Single_120mm_Restricted.stl`, `Fan_Shroud_Single_140mm.stl` ([src](https://t.me/c/2424231195/81673)), `Twin_120mm_Fan_Shroud.stl` ([src](https://t.me/c/2424231195/121684)). También catalogados en [Refrigeración](04-cooling.md).
- **Monturas de ventilador para backplate / memoria:** `Backplate.stl` + `backplane-top-fixed.stl` ([src](https://t.me/c/2424231195/133049)); `bottom_fan_mount.stl`, `top_fan_mount.stl`, `Front-Mount.stl`, `Back-Mount.stl` ([src](https://t.me/c/2424231195/131189))
- **Adaptadores de cooler AM4** (atornilla un cooler de CPU estándar al die): `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` ([src](https://t.me/c/2424231195/9949)). Ver también [Printables 1042228 — montura BC250→cooler de CPU AMD](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount).
- **Montura ITX genérica** (majzok): se imprime en dos partes que encajan en un frame — atornillas la BC-250 dentro, luego atornillas el frame en **cualquier carcasa con agujeros estándar de placa base ITX** (probada en una DeepCool CH170 PLUS). Resuelve el problema de "no existe una montura ITX genérica". No se capturó un enlace canónico de Printables — busca en Printables/MakerWorld **"BC-250 ITX Mount"**.
- **Adaptador Thermalright AXP90-X53 / AXP120-X67** (cooler de bajo perfil sobre el die): una montura impresa que necesita roscas M3, con variantes de grosor según el cooler/presión de la CPU — [Printables 1694793](https://www.printables.com/model/1694793). También en [Refrigeración](04-cooling.md).
- **Adaptador de ventilador de 120 mm:** `BC250_FanAdapter_120mm.step` ([src](https://t.me/c/2424231195/83135)), `cooler adapter v3.0 (1).stl` ([src](https://t.me/c/2424231195/111091))
- **Modelos precisos de placa** (diseña tu propia carcasa contra estos): [Printables 1341336 — placa BC-250 precisa](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) ([src](https://t.me/c/2424231195/55496)), [Printables 1103626 — placa AMD BC250](https://www.printables.com/model/1103626-amd-bc250-board)

---

## Tabla de catálogo

Los archivos marcados *(chat)* están replicados en `assets/stl/`; todo lo demás se descarga desde la página de Printables / MakerWorld / GitHub enlazada.

| Carcasa / pieza | Tipo | Archivos STL / fuente | Ventiladores | Descarga |
|---|---|---|---|---|
| **funda de refrigeración onemorecap** | funda mínima | `BC-250-FanSleeves.3mf` *(chat)* | 1× 120 | [GitHub onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) |
| **Shell Case de onemorecap** ⭐ | shell abierta | `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl` *(chat)* | 1–2× 120 / 1× 140 | [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [GitHub](https://github.com/onemorecap/bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case) |
| **Frame abierto de acrílico** (Владислав) | frame abierto | soportes impresos *(chat #114651)* | 1× 120 | [hilo de Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) |
| **"Просто лучший корпус"** (Jack Fisher × B1zon) | consola | `BC250 korpus исправленный.rar` *(chat)* | 120 + splitter PWM | [chat #79989](https://t.me/c/2424231195/79989) |
| **Carcasa mínima para PSU Flex** | caja pequeña | `minimal-case-...-model_files.zip` *(chat)* | 1× 120 | [Printables 1423572](https://www.printables.com/model/1423572-minimal-case-for-bc250-and-flex-psu) |
| **carcasa forgenam** | consola | `forgenam-case-bc250-model_files.zip` *(chat)* | 1× 120 | [Printables 1375929](https://www.printables.com/model/1375929-forgenam-case-bc250) |
| **Minimalist 240** | consola + asa | `Minimalist 240 Front/Back/Handle.stl` *(chat)* | 120 | [chat #117404](https://t.me/c/2424231195/117404) |
| **M360** | consola | `M360 Front.stl`, `M360 Back.stl` *(chat)* | 120 | [chat #126566](https://t.me/c/2424231195/126566) |
| **NexGen3D DIY Steam Machine** ⭐ | consola | archivos de Printables | 1× 120 | [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) |
| **NexGen3D Pro (líquida)** | consola + AIO | archivos de Printables | 120 AIO | [Printables 1614131](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) |
| **NexGen3D Redux (+pantalla)** | consola + pantalla 1080×480 | archivos de Printables | 1× 120 | [Printables 1649679](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) |
| **NexGen3D AIO mount** | adaptador | archivos de Printables | 120 AIO | [Printables 1554003](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250) |
| **Case v3 — PSU de servidor HP** | consola + HDD/USB | archivos de Printables | 120 | [Printables 1580750](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) |
| **Case v4 — FlexATX / PSU HP** | consola | archivos de MakerWorld | 120 | [MakerWorld 2481620](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) |
| **ATX-PSU Bazzite Box** | caja ATX completa | archivos de Printables | 120 | [Printables 1550729](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box) |
| **carcasa ivanov-innokentii** | consola | fuentes de GitHub | 120 | [GitHub ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) |
| **enclosure rLapchynski** | enclosure | fuentes de GitHub | 120 | [GitHub rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure) |
| **BC-250 Scooper** | shroud/scoop | archivos de Printables | 120 | [Printables 1282906](https://www.printables.com/model/1282906-bc-250-scooper) |
| **Pitman case** | consola | archivos de Printables | 120 | [Printables 1570248](https://www.printables.com/model/1570248-amd-bc-250-pitman-case) |
| **FlexATX estilo industrial** | consola | `amd_bc_250_industrial_style_case...zip` *(chat)* | 120 (sin cooler de fábrica) | [chat #144265](https://t.me/c/2424231195/144265) |
| **The Lanboy** | arcade portátil + pantalla eDP de 16″ | archivos de Printables | derivación ATX 12 V | [Printables 1746364](https://www.printables.com/model/1746364) |
| **BC250 Vented Edition** (MaelremremDotXYZ) | consola FlexATX, aletas abiertas | archivos de MakerWorld | 120 | [MakerWorld 2899020](https://makerworld.com/en/models/2899020) |
| **Stellar 250** (isaacalvex) | consola + guía de build (WiFi6, ESP32) | guía de GitHub | 120 | [GitHub isaacalvex/...Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide) |
| **Simple Case for the ASRock AMD BC-250** | consola | archivos de MakerWorld | 120 | [MakerWorld 2870270](https://makerworld.com/en/models/2870270) |
| **BC250-HUD** (Bloodyly) | pantalla de estado interna Pi Zero 2 | fuentes de GitHub | — | [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD) |
| **Montura ITX genérica** (majzok) | adaptador (cualquier carcasa ITX) | busca en Printables/MakerWorld | — | "BC-250 ITX Mount" |
| **Montura Thermalright AXP90/AXP120** | adaptador de cooler de bajo perfil | archivos de Printables | torre de bajo perfil | [Printables 1694793](https://www.printables.com/model/1694793) |
| **Placa de montura Twin-120** | placa adaptadora | `Twin_120mm_Fan_Shroud.stl` *(chat)* | 2× 120 | [chat #121684](https://t.me/c/2424231195/121684) |
| **Shrouds de ventilador (120/140)** | shroud | `Fan_Shroud_Single_120mm.stl`, `_Dual_120mm`, `_Single_140mm`, `_120mm_Restricted` *(chat)* | 120 / 140 | [Printables 1339540](https://www.printables.com/model/1339540-yet-another-bc-250-fan-shroud) · ver [Refrigeración](04-cooling.md) |
| **Adaptador de cooler AM4** | montura | `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` *(chat)* | torre/AIO | [Printables 1042228](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount) |
| **Modelo preciso de placa** | CAD de referencia | `bc-250-body.step` *(chat)* | — | [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) |

⭐ = la de más reacciones de valor / más reposteada en la comunidad.

### Más diseños públicos (del catálogo de elektricM)

Diseños nombrados y descargables del [catálogo de 143 diseños de elektricM](https://elektricm.github.io/amd-bc250-docs/community/cases/) que no están listados arriba — agrupados por la PSU en torno a la que se construyen. Explora el catálogo completo para builds solo de Discord/WIP y miniaturas.

**MeanWell LOP (PSU interna):**

| Carcasa / pieza | Notable | Descarga |
|---|---|---|
| **Steamboat Case** (yannichaboyer) | consola LOP-300 | [MakerWorld 2431616](https://makerworld.com/en/models/2431616) |
| **Ultra-Thin Custom Case** (MrRoze) | LOP-300 slim | [Printables 1626501](https://www.printables.com/model/1626501) |
| **Internal PSU 2×140 mm** (Kacikor) | LOP-400, doble 140 | [Printables 1599644](https://www.printables.com/model/1599644) · [MakerWorld 2400574](https://makerworld.com/en/models/2400574) |
| **Push-Pull Internal 12V PSU** (penzoiders) | push-pull | [MakerWorld 2505974](https://makerworld.com/en/models/2505974) |
| **Shell Case + 40 mm SSD fan** (Munkee915) | remix de Shell, refrigeración de SSD | [Printables 1568074](https://www.printables.com/model/1568074) |
| **Noctua Push-Pull Mod** (Janjd) | remix de Shell | [MakerWorld 2354123](https://makerworld.com/en/models/2354123) |

**MeanWell LRS/UHP (el otro ladrillo de servidor común):**

| Carcasa / pieza | Notable | Descarga |
|---|---|---|
| **LRS-350-12 PSU Case** (TARGZ) | caja LRS-350 | [Printables 1543979](https://www.printables.com/model/1543979) |
| **BC250 slim case** (C4kew4lk) | UHP-350-12, slim | [Printables 1504664](https://www.printables.com/model/1504664) |

**FlexATX — familia "Console Style" de Arthrimus** (todo un linaje de remixes; la consola slim es un básico de la comunidad):

| Carcasa / pieza | Notable | Descarga |
|---|---|---|
| **Console Style Case v1** (Arthrimus) | la original | [Thingiverse 7165679](https://www.thingiverse.com/thing:7165679) · [MakerWorld 2097988](https://makerworld.com/ko/models/2097988-bc250) |
| **Slim Console Style Case** (Arthrimus) | variante slim | [Thingiverse 7172528](https://www.thingiverse.com/thing:7172528) |
| **Slim Console — double-fan mod** (TKXXTH) | doble ventilador | [Thingiverse 7214884](https://www.thingiverse.com/thing:7214884) |
| **Slim Console — On/Off + Apevia** | interruptor de encendido | [Thingiverse 7274042](https://www.thingiverse.com/thing:7274042) |

**FlexATX — otras:**

| Carcasa / pieza | Notable | Descarga |
|---|---|---|
| **Minimal Case (Toolless)** (chriszf) | sin tornillos | [Printables 1423572](https://www.printables.com/model/1423572) |
| **Minimalist BC-250 Case** (SebastienGau/Gadget) | minimalista | [Printables 1581724](https://www.printables.com/model/1581724) |
| **ADT UT3G eGPU-Inspired** (R0mn) | aspecto eGPU | [Printables 1539301](https://www.printables.com/model/1539301) |
| **"Steam Machine" by MrLarva** | consola | [Printables 1618501](https://www.printables.com/model/1618501) · [MakerWorld 2453965](https://makerworld.com/en/models/2453965) · [Thingiverse 7278235](https://www.thingiverse.com/thing:7278235) |
| **Steam Machine** (Pocket Adventures) | consola | [MakerWorld 2350219](https://makerworld.com/en/models/2350219) |
| **Steam Machine Slim Console** (MTSquar3D) | slim + kit de ventilador para vRAM con OC | [MakerWorld 2232434](https://makerworld.com/en/models/2232434) · [Thingiverse 7271946](https://www.thingiverse.com/thing:7271946) |
| **ASRock Console Case** (songdawgdesigns) | consola | [Printables 1617023](https://www.printables.com/model/1617023) · [Cults3D](https://cults3d.com/en/3d-model/gadget/asrock-amd-bc-250-console-case-steamos-bazzite-diy-steam-machine-style-build) |
| **AMD BC250 Case** (vitamins) | consola | [MakerWorld 2219947](https://makerworld.com/en/models/2219947) |
| **E-waste Steam Machine** (Pesen333) | build de reciclaje | [Thingiverse 7245584](https://www.thingiverse.com/thing:7245584) |

**ATX completa:**

| Carcasa / pieza | Notable | Descarga |
|---|---|---|
| **Case for Standard ATX** (CatSiewDai) | caja ATX | [Printables 1553599](https://www.printables.com/model/1553599) |
| **ATX + Fan Duct** (ZMASLO) | con conducto | [Printables 1616167](https://www.printables.com/model/1616167) |
| **Dual Fan ATX Case** (Mateo Fdez) | doble ventilador | [Printables 1579658](https://www.printables.com/model/1579658) |
| **Simple Wooden Case** (suvalle55) | madera + ATX | [Printables 1595794](https://www.printables.com/model/1595794) |
| **Open Frame + IKEA hack** (GreatApo) | frame abierto | [Thingiverse 7314188](https://www.thingiverse.com/thing:7314188) |
| **Case for ATX PSU** (matmiak) | caja ATX | [Thingiverse 7303096](https://www.thingiverse.com/thing:7303096) |

**TFX / VESA / comercial:**

| Carcasa / pieza | Notable | Descarga |
|---|---|---|
| **Case Remix for TFX** (PlayNation) | PSU TFX-400 | [MakerWorld 2387157](https://makerworld.com/en/models/2387157) |
| **VESA 100/75 Basket** (Oleksii) | montar detrás de un monitor | [MakerWorld 1844470](https://makerworld.com/en/models/1844470) |
| **3.9L MKII FlexATX + ventilador PS5** (FitFormSolutions) | compra un kit terminado | [Etsy](https://www.etsy.com/listing/4405362103/) · [eBay](https://www.ebay.com/itm/127460591552) |
| **Shiny Snake S400** (ITX de malla de 10.8 L) | host comercial probado y bueno (montura BC-250→AM4 + AIO H60 en el compartimento de PSU + escudo de I/O ATX personalizado) | [AliExpress](https://a.aliexpress.com/_EyQdoBU) |
| **carcasa minimalista SFX-PSU** (Methsman) | PSU SFX completa, paneles magnéticos, hub USB, AXP120 + Noctua 120 — *archivos WIP / aún no publicados* | — |
| **línea Cults3D ATX/servidor** (KABANCHYK, lumstudio, kapa3D) | STLs de pago | [Cults3D — bc-250](https://cults3d.com/en/3d-model/gadget/bc-250-atx-case) |

---

## ¿Sin impresora? Opciones que la gente usa

- **Compra una impresión.** Hay vendedores en [Etsy](https://www.etsy.com/listing/1904632447/), eBay y OLX; también hubo gente que se ofreció a imprimir/vender carcasas en el chat ([src](https://t.me/c/2424231195/55507)).
- **Impresión bajo demanda:** sube un STL a un servicio. Builders del chat tienen granjas de impresión (uno muestra una pared de impresoras Flsun/Creality/Bambu, [src](https://t.me/c/2424231195/73481)).
- **Sin carcasa / reutilizar.** Muchos ejecutan la placa en un banco abierto mientras prueban. Otros vacían hardware existente: un viejo PC todo-en-uno con la placa implantada y un soplador ([src](https://t.me/c/2424231195/30914)), una caja de conducto de ventilación ([src](https://t.me/c/2424231195/64265)), o cajas de amplificador de aluminio (requiere limar/taladrar, [src](https://t.me/c/2424231195/108907)). Un miembro incluso escondió la placa dentro de un viejo reproductor VHS como broma ([src](https://t.me/c/2424231195/84106)). **Carcasa de Xbox One** (JoeyDepDollas): vacía una Xbox One rota y mete dentro un build completo de BC-250 — mantiene CPU y GPU por debajo de **60 °C** bajo carga; las consolas donantes rotas cuestan **~$15 con envío** en eBay y dan piezas reutilizables.
- **Contrachapado cortado con láser** (ContributionRich3242): no impreso en 3D — contrachapado doblado por kerf alrededor de las esquinas con una gran área trasera para refrigeración extra, alcanzando **75 °C a 40 CU** (1800 MHz, CPU 3.9 GHz) y silencioso como un susurro. (Los archivos de láser no se publicaron.) Su **técnica de refrigeración del backplate** es reutilizable en cualquier carcasa: masilla térmica chip→backplate, pasta backplate→coolers traseros, y asegura los coolers traseros con pasadores de chaveta tipo R apretados en el hueco del VRM + cinta Kapton (~20 °C más fresco a 40 CU).

> Una placa desnuda y bien refrigerada supera a una caja bonita y sellada con mal flujo de aire. Acierta primero con la [Refrigeración](04-cooling.md); la carcasa es el segundo paso.

---

## Fuentes

- Vitrina curada **#BC250body** (un buen build al día) — idea fijada [src](https://t.me/c/2424231195/79685)
- Funda mínima, dos variantes — [src](https://t.me/c/2424231195/10743) · modelos en [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) [src](https://t.me/c/2424231195/18260)
- Shell Case (❤33) — [src](https://t.me/c/2424231195/22771) · gratis en Printables/MakerWorld [src](https://t.me/c/2424231195/24505) · lote de STL [src](https://t.me/c/2424231195/81680)
- "Просто лучший корпус" + BOM — [src](https://t.me/c/2424231195/79990) · archivos [src](https://t.me/c/2424231195/79989)
- Frame abierto de acrílico — [src](https://t.me/c/2424231195/114651) · [Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/)
- Placa de montura Twin-120, 2200 MHz @ 80 °C — [src](https://t.me/c/2424231195/120606) · shroud [src](https://t.me/c/2424231195/121684)
- Diseños de consola (fotos) — Гослинг/Bazzite [src](https://t.me/c/2424231195/66616) · panel laberinto de Jhonatan [src](https://t.me/c/2424231195/121274) · malla de cuadrícula de Joglik [src](https://t.me/c/2424231195/126525) · ventana ovalada de a m [src](https://t.me/c/2424231195/52955) · Spyrydonov v15 [src](https://t.me/c/2424231195/135995)
- Familia NexGen3D Steam Machine — [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) · [Redux + pantalla Pi (Reddit)](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)
- Modelo de referencia de placa — [src](https://t.me/c/2424231195/55496) · [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)
- Repos de carcasa en GitHub — [onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) · [rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure)
- **Catálogo completo de carcasas de elektricM (~143 diseños, buscable/filtrable)** — [elektricm.github.io/amd-bc250-docs/community/cases](https://elektricm.github.io/amd-bc250-docs/community/cases/)
- Simple Case (MakerWorld 2870270) + tutorial de build ucraniano — [MakerWorld 2870270](https://makerworld.com/en/models/2870270) · [Old Lamer (YouTube)](https://youtu.be/p5Zd86vFe8w)
- Lifehack del agujero de acceso de borrado de CMOS — [4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980)
- BOM del build "Steam Machine Pro" refrigerado por líquido (TEUCER AF 240, Mean Well LOP-600-12, Arctic P12 Pro/P8, relé ESP32, OpenLinkHub/Commander Duo) — [Old Lamer (YouTube)](https://youtu.be/afYhUQFa-AY)

> Los STLs de shroud de ventilador se comparten con [Refrigeración](04-cooling.md). Todos los archivos STL/STEP/3MF alojados en el chat están replicados en `assets/stl/`.
