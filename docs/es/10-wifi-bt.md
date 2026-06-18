> 🌐 Traducción de la comunidad. La versión en inglés es la fuente de verdad y puede estar más actualizada. ¿Encontraste un error? Abre un issue: [../en/10-wifi-bt.md](../en/10-wifi-bt.md) · https://github.com/lildebil0/awesome-bc250/issues

# Dongles de WiFi y Bluetooth

> **TL;DR** — La BC-250 **no tiene WiFi ni Bluetooth integrados**, así que necesitas un dongle USB. La opción más fiable del chat es un stick basado en **aic8800d80** (p. ej. el *AX90BT / D80MU3*), gobernado por [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) — hay una receta de RPM para Bazzite probada. Los sticks **Realtek RTL88xx** (8821au/cu, 8822bu, 8851bu) son baratos y comunes pero son el dolor de cabeza nº 1 del chat: conectan, y luego **se caen aleatoriamente bajo carga**. [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) (driver retroportado) arregla la mayor parte de eso para la familia RTL8821/8822; los sticks RTL8851BU/8831BU "AX900 WiFi 6" necesitan [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831). Si quieres un stick que "simplemente funcione" recién sacado de la caja, los propietarios reportan que la serie **Digma DWA-BT5** lo hace. El Bluetooth comparte la radio de 2,4 GHz, así que espera que el throughput de WiFi baje mientras el BT esté activo.

Si solo necesitas internet para la instalación, un **adaptador USB-Ethernet con cable o la NIC integrada** se salta toda esta página. Recurre a un dongle de WiFi/BT cuando realmente necesites conexión inalámbrica o un mando Bluetooth.

> **Sobre el ethernet Realtek RTL8111 integrado:** es el camino de menor resistencia, pero la familia RTL8111/8168 es **inestable-a-poco-fiable en Linux** — se reporta ampliamente que el driver de fábrica `r8169` causa subidas/bajadas de enlace aleatorias, caídas bajo ancho de banda y, a veces, una caída a 100 Mbit. Cambiar al módulo `r8168` fuera del árbol es la mitigación habitual. Si el puerto integrado se porta mal, **prefiere una NIC USB/PCIe de Intel o MediaTek** — sus drivers de Linux son mucho más fiables. ([Intel/MediaTek frente a Realtek es una brecha de fiabilidad de Linux de larga data](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)) ⚠ la inestabilidad del RTL8111 es un patrón general de Linux, no específico de la BC-250 — verifícalo en tu placa.

---

## Lo primero que hay que entender

Casi todos los reportes de "mi dongle no para de desconectarse" en la BC-250 se remontan a **dos cosas, no a la marca de la caja**:

1. **El chipset de dentro.** La etiqueta (ASUS, TP-Link, D-Link…) no significa nada — lo que importa es el chip Realtek/aic/MediaTek bajo la carcasa. Tres sticks de marcas distintas pueden llevar exactamente el mismo chip y fallar de forma idéntica. ([src](https://t.me/c/2424231195/16332))
2. **Estabilidad/alimentación del USB bajo carga.** Múltiples usuarios ven un stick funcionar bien en reposo/navegando y luego **caerse en el momento en que el tráfico se dispara** (una descarga grande), "como si el USB no pudiera seguir el ritmo". El stick ASUS de un usuario aguantó solo 17 minutos antes de caerse durante una descarga. ([src](https://t.me/c/2424231195/16331)) · ([src](https://t.me/c/2424231195/17319))

Así que: **elige por chipset**, emparéjalo con un driver mantenido fuera del árbol y, si aun así se cae, trátalo como un problema de alimentación/reset (consulta [Caídas](#arreglar-caídas-aleatorias) más abajo).

> **¿Cómo encuentras el chipset?** Las cajas rara vez lo imprimen. Antes de comprar, busca en línea el **FCC ID** del stick (impreso en el dispositivo/anuncio) — el expediente revela el chip real. Una vez lo tengas enchufado, ejecuta **`lsusb`** en Linux para ver los IDs de vendedor/producto y el chipset.

---

## Dongles que se sabe que funcionan

Contrastados con los repos de drivers. Las "Notas" reflejan lo que los miembros del chat realmente observaron en la BC-250.

| Chipset | Sticks de ejemplo (del chat) | Repo del driver | Notas |
|---|---|---|---|
| **aic8800d80** (aic8800) | AX90BT / D80MU3 ("AIC device wlan") | [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) | **El más recomendado.** Receta de RPM para Bazzite probada; WiFi+BT. Aparece primero como USB-CDROM, luego pasa a `aic device wlan` tras `install_setup.sh`. ([src](https://t.me/c/2424231195/120502)) |
| **RTL8821CU / 8821AU** | "свисток" genérico de Realtek | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Funciona, pero **propenso a caídas aleatorias** con el driver antiguo del kernel. El retroporte de lwfinger es estable para la mayoría; el arreglo definitivo llegó en el kernel 6.13–6.14. ([src](https://t.me/c/2424231195/17321)) |
| **RTL8822BU** | stick de doble banda sin nombre | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Un propietario: conecta, luego **se cae cada 5–10 min**. Soportado por la lista USB de rtw88, pero la fiabilidad en la BC-250 es irregular. ([src](https://t.me/c/2424231195/138512)) |
| **RTL8851BU / 8831BU** | "AX900 WiFi 6 + BT 5.3 de 5 $" | [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) | **No funcionó recién sacado de la caja** — chip WiFi 6 demasiado nuevo para rtw88. Necesita el driver dedicado `8851bu`. ([src](https://t.me/c/2424231195/17320)) |
| **Digma DWA-BT5-AC600C / AC1300E** | Digma USB WiFi+BT | en el kernel (Realtek) | Reportado **funcionando recién sacado de la caja** ("arrancó al primer intento"); un propietario de BC-250 lo confirmó en las reseñas del producto. ([src](https://t.me/c/2424231195/138520)) |

> **Reportados como NO funcionales / dolorosos:** el genérico **RTL8851BU "AX900"** recién sacado de la caja ([src](https://t.me/c/2424231195/17320)); los **RTL8821cu/8821au** pelados con los drivers de fábrica del kernel se caen aleatoriamente ([src](https://t.me/c/2424231195/16330)); un **RTL8822BU** sin marca se cae cada pocos minutos ([src](https://t.me/c/2424231195/138512)). Un usuario se rindió por completo y pidió un **Edimax EW-7733UnD** en su lugar. ([src](https://t.me/c/2424231195/120503))

---

## Camino A — aic8800d80 (recomendado)

Este es el chip con la historia más limpia en la BC-250. Hay una receta completa de RPM para Bazzite y una miniguía escrita por la comunidad.

### Bazzite (rpm-ostree) — build de RPM

El [`bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) del mantenedor construye un RPM en condiciones para que el driver sobreviva mejor a las actualizaciones de imagen que un `make` crudo. Verificado contra el repo:

```bash
# 1. Dependencias de build (luego reinicia para que el overlay esté activo)
sudo rpm-ostree install rpm-build rpmdevtools dkms
sudo systemctl reboot

# 2. Prepara el árbol de rpmbuild y obtén el spec
cd "$HOME"
rpmdev-setuptree
cd "$HOME/rpmbuild/SPECS"
curl -LO -s https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec

# 3. Obtén las fuentes y compila
spectool -g -R "$HOME/rpmbuild/SPECS/aic8800d80.spec"
rpmbuild -bs "$HOME/rpmbuild/SPECS/aic8800d80.spec"
sudo rpm-ostree usroverlay
rpmbuild --define "uname $(uname -r)" -bb "$HOME/rpmbuild/SPECS/aic8800d80.spec"

# 4. Instala el RPM construido y reinicia (el nombre coincidirá con tu kernel/versión de fedora)
sudo rpm-ostree install "$HOME"/rpmbuild/RPMS/x86_64/aic8800d80-*.rpm
sudo systemctl reboot
```

Un miembro del chat ([Nurmukhamed](https://github.com/Nurmukhamed/aic8800d80/tree/15a927286788af46529909bc2c14d16ea4241ec0/bazzite)) escribió un tutorial de empaquetado de RPM que la comunidad le agradeció. ([src](https://t.me/c/2424231195/122580))

### Miniguía de la comunidad (el camino rápido con "make")

Si solo quieres tenerlo en marcha *ya* y no te importa volver a ejecutarlo tras los reinicios, la guía de Aqtilek ([src](https://t.me/c/2424231195/120502)):

```bash
# El stick aparece primero como un CD-ROM falso. Cámbialo a modo WiFi (UNA VEZ):
sudo sh install_setup.sh         # ahora aparece como "aic device wlan"

# Levanta temporalmente la raíz de solo lectura (Bazzite/atómico):
sudo rpm-ostree usroverlay

# Clona y compila el driver (usa el "método 2" del repo):
git clone https://github.com/shenmintao/aic8800d80.git && cd aic8800d80
# …luego sigue el segundo método de instalación del repo.
```

> ⚠ **Persistencia tras reinicio:** con el camino del `make` crudo, **el driver se pierde en cada reinicio** y hay que reinstalarlo — el autor sugiere un pequeño script de autoarranque. ([src](https://t.me/c/2424231195/120502)) El camino del RPM de arriba es el arreglo duradero.

El archivo de firmware/driver que usó un miembro (*AX90BT(D80MU3)*) se compartió en el chat. ([src](https://t.me/c/2424231195/119991)) Existe un upstream alternativo, [`goecho/aic8800_linux_drvier`](https://github.com/goecho/aic8800_linux_drvier), pero un usuario de CachyOS pasó 6 h y no consiguió compilarlo — prefiere `shenmintao` en la BC-250. ([src](https://t.me/c/2424231195/82100)) ⚠ verifícalo en tu distro.

> **aic8800d80 complicaciones (del rastreador de incidencias del controlador):**
> - El firmware `fmacfw_8800d80_u02.bin` debe residir en `/lib/firmware/aic8800D80/`; una carga de firmware fallida deja la interfaz atascada en `DOWN`. ([aic8800d80 #37](https://github.com/shenmintao/aic8800d80/issues/37) · [#10](https://github.com/shenmintao/aic8800d80/issues/10))
> - **Kernel 7.0 / 7.1:** el controlador 1.0.0 no se puede compilar bajo DKMS: las firmas de `cfg80211_new_sta` / `cfg80211_del_sta` cambiaron y un error `-Wimplicit-fallthrough` interrumpe la compilación. Permanezca en un kernel anterior o aplique un parche al código fuente hasta que upstream se ponga al día. ([aic8800d80 #49](https://github.com/shenmintao/aic8800d80/issues/49))
> - **Debian 13 (kernel 6.12.90):** la interfaz Wi-Fi puede fallar al levantarse o al detectar redes. ([aic8800d80 #58](https://github.com/shenmintao/aic8800d80/issues/58))

---

## Camino B — Realtek RTL8821 / RTL8822 (rtw88)

Baratos y por todas partes, pero el driver del kernel en kernels antiguos tiene **bugs y se cae aleatoriamente**. El arreglo es el driver retroportado fuera del árbol de `lwfinger/rtw88`. Los comandos exactos que un miembro usó y confirmó estables ([src](https://t.me/c/2424231195/16326)):

```bash
git clone https://github.com/lwfinger/rtw88
cd rtw88
make
sudo make install
sudo make install_fw
```

En una configuración con Secure Boot / DKMS, el repo también documenta un flujo `sudo dkms install $PWD` + `mokutil` — consulta el [README del repo](https://github.com/lwfinger/rtw88).

**Por qué ayuda esto:** las caídas son un bug conocido del driver; el arreglo definitivo solo llegó a la rama principal en el **kernel 6.13–6.14**, y muchas imágenes de distro aún traían la versión rota. El retroporte de lwfinger te da el driver arreglado ya. ([src](https://t.me/c/2424231195/17321)) Las piezas USB soportadas incluyen RTL8811AU/CU, RTL8812AU/BU/CU, RTL8814AU, RTL8821AU/CU y RTL8822BU/CU (lista completa en el repo).

> Advertencia honesta: incluso con rtw88, un usuario con RTL8821cu seguía viendo caídas ocasionales ("misma historia"), y el throughput baja algo frente al driver de fábrica roto-pero-más-rápido. ([src](https://t.me/c/2424231195/16333)) Si la fiabilidad importa más que el precio, ve a aic8800d80 o a un Digma confirmado.

---

## Camino C — Realtek RTL8851BU / RTL8831BU ("AX900 WiFi 6")

Los sticks muy baratos "AX900 WiFi 6 + Bluetooth 5.3" usan **RTL8851BU/8831BU**, que `rtw88` **no** cubre, así que están muertos recién sacados de la caja. ([src](https://t.me/c/2424231195/17320)) Usa el driver dedicado [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831):

```bash
git clone https://github.com/biglinux/rtl8831
cd rtl8831
sudo dkms install .        # o: make && sudo make install
sudo modprobe 8851bu
```

⚠ verifícalo — este repo no se mostró construyéndose en el chat sobre una BC-250; los comandos vienen del README del repo.

> **Un ejemplo con nombre de esta clase — TP-Link Archer TX10UB Nano ("AX900 WiFi 6 + BT 5.3").** Es un producto real y fácil de encontrar, y su **WiFi funciona en Linux** — lleva un chip **RTL8851BU**, así que entra en el Camino C (necesitarás el driver `8851bu`/`biglinux/rtl8831`, no el rtw88 de fábrica). **Pero su Bluetooth *no* está soportado por el fabricante en Linux:** la propia ficha de TP-Link lista el adaptador como solo Windows 10/11 y dice explícitamente que la **función Bluetooth no es compatible con Mac, Linux ni TV** ([página de producto de TP-Link](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)). Así que trátalo como **"el WiFi funciona en Linux (vía el driver 8851bu); el BT no está soportado por el fabricante en Linux".** La comunidad puede que consiga levantar su BT mediante drivers BT genéricos de Realtek, pero eso no está verificado — **no lo compres esperando un dongle WiFi+BT plug-and-play limpio en Linux.** **UGreen** también vende un stick "AX900" que la comunidad reporta como alternativa, pero es la misma familia RTL8851BU — verifica el chipset y aplica la misma advertencia de BT. ⚠ verifícalo.

---

## Arreglar caídas aleatorias

Si tu stick conecta y luego se cae (el síntoma clásico de Realtek-en-BC-250):

1. **Instala el driver correcto fuera del árbol** (Camino B/C) — esto resuelve la mayoría de los casos.
2. **Reasienta / reenchufa tras el arranque.** Algunos sticks no se detectan en arranque en frío y necesitan un desenchufar-reenchufar. ([src](https://t.me/c/2424231195/16325))
3. **Resetea el dispositivo por software en vez de desenchufarlo** — usa `usbreset` (sin necesidad de tirar físicamente de él). ([src](https://t.me/c/2424231195/135895)) · [cómo hacerlo (Superuser)](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
4. **Prueba otro puerto USB** (idealmente un puerto trasero/del hub raíz) — el síntoma parece relacionado con alimentación/ancho de banda bajo carga. ([src](https://t.me/c/2424231195/17319))
5. **Mantén el dongle fuera del USB 3.0.** Los puertos USB 3.0 son una fuente documentada de **interferencia de RF de 2,4 GHz** — la señalización de alta velocidad añade ~20 dB de ruido de banda ancha a lo largo de 2,4–2,5 GHz que ningún filtro puede eliminar, degradando el WiFi *y* el Bluetooth justo donde viven. El informe técnico de Intel es la referencia canónica. Enchufa los dongles de WiFi/BT en un **puerto USB 2.0**, o usa un **cable alargador USB corto** para alejar el dongle unos centímetros de los conectores USB 3.0 y de cualquier cableado DisplayPort/HDMI. ([Intel: Impacto de la interferencia de RF del USB 3.0 en dispositivos inalámbricos de 2,4 GHz](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [PDF de USB-IF](https://www.usb.org/sites/default/files/327216.pdf))

---

## Notas sobre Bluetooth

- Los sticks combo WiFi+BT comparten la radio de **2,4 GHz**, así que **el throughput de WiFi baja mientras el Bluetooth está activo**. Un miembro midió **~150 Mbit con BT activado frente a ~190 Mbit con él apagado** — real, pero "no tan dramático". ([src](https://t.me/c/2424231195/123366)) · ([src](https://t.me/c/2424231195/123367))
- El driver aic8800d80 tiene una **rama `bluetooth` separada** para el soporte de BT. ([rama del repo](https://github.com/shenmintao/aic8800d80/tree/bluetooth?tab=readme-ov-file))

- **Si el Bluetooth nunca aparece, el controlador genérico `btusb` se apoderó del dispositivo primero.** El controlador BT aic8800 necesita su propio módulo `aic_btusb` — el `btusb` integrado en el kernel no puede inicializarlo. Intercámbialos con `sudo rmmod btusb && sudo modprobe aic_btusb`, o hazlo persistente agregando `softdep btusb pre: aic_btusb` a `/etc/modprobe.d/aic8800-bt.conf`. ([aic8800d80 #53](https://github.com/shenmintao/aic8800d80/issues/53) · [#44](https://github.com/shenmintao/aic8800d80/issues/44))

---

## Lista corta de compra

Si quieres el camino de menor riesgo, en orden:

1. **Stick aic8800d80** (clase AX90BT / D80MU3) + la receta de RPM para Bazzite — el mejor documentado, WiFi+BT.
2. **Digma DWA-BT5-AC600C / AC1300E** — reportado funcionando recién sacado de la caja. ([anuncio en Ozon](https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/))
3. **Stick RTL8821CU + lwfinger/rtw88** — el más barato, acepta caídas ocasionales.
4. Evita el **RTL8851BU "AX900"** de saldo a menos que estés dispuesto a pelearte con `biglinux/rtl8831`.

> No te fíes del "claro tío, elección perfecta" de un chatbot de IA sobre un dongle — un miembro hizo exactamente eso, acabó con un RTL8822BU que se cae cada 5–10 min, y el mismo bot dijo después que no funcionaría. Compra por chipset, verificado aquí. ([src](https://t.me/c/2424231195/138512))

---

## Fuentes

- RPM de aic8800d80 para Bazzite — [`shenmintao/aic8800d80` `bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) · spec — https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec
- Miniguía de aic8800d80 — https://t.me/c/2424231195/120502 · fork de RPM — https://t.me/c/2424231195/122580 · zip de firmware — https://t.me/c/2424231195/119991
- Rama BT de aic8800 — https://github.com/shenmintao/aic8800d80/tree/bluetooth · repo alternativo — https://github.com/goecho/aic8800_linux_drvier (https://t.me/c/2424231195/82100)
- Pasos de build de rtw88 — https://t.me/c/2424231195/16326 · justificación del retroporte — https://t.me/c/2424231195/17321 · driver — [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88)
- RTL8851BU AX900 no funciona — https://t.me/c/2424231195/17320 · driver — [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831)
- Síntoma de caída / por-chip-no-por-marca — https://t.me/c/2424231195/16330 · https://t.me/c/2424231195/16331 · https://t.me/c/2424231195/16332 · https://t.me/c/2424231195/17319
- Digma funciona OOB — https://t.me/c/2424231195/138520 · anuncio — https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/
- RTL8822BU recomendado por IA se cae — https://t.me/c/2424231195/138512 · escape a Edimax — https://t.me/c/2424231195/120503
- Velocidad BT frente a WiFi — https://t.me/c/2424231195/123366 · usbreset — https://t.me/c/2424231195/135895 · [cómo hacerlo en Superuser](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
- RTL8111/8168 integrado inestable en Linux; mitigación con r8168, prefiere Intel/MediaTek — [LinuxQuestions r8169 vs r8168](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)
- El USB 3.0 interfiere con el WiFi/BT de 2,4 GHz (usa USB 2.0 / alargador) — [informe técnico de Intel](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [PDF de USB-IF](https://www.usb.org/sites/default/files/327216.pdf)
- TP-Link Archer TX10UB Nano — WiFi funciona en Linux (RTL8851BU), BT listado por el fabricante como solo Windows / no Linux — [página de producto de TP-Link](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)
