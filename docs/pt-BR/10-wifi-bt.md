> 🌐 Tradução da comunidade. A versão em inglês é a fonte da verdade e pode estar mais atualizada. Achou um erro? Abra uma issue: [../en/10-wifi-bt.md](../en/10-wifi-bt.md) · https://github.com/lildebil0/awesome-bc250/issues

# Dongles de WiFi e Bluetooth

> **TL;DR** — A BC-250 **não tem WiFi nem Bluetooth integrados**, então você precisa de um dongle USB. A escolha mais confiável citada no chat é um pendrive baseado em **aic8800d80** (por exemplo, o *AX90BT / D80MU3*), controlado por [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) — há uma receita de RPM testada para Bazzite. Os pendrives **Realtek RTL88xx** (8821au/cu, 8822bu, 8851bu) são baratos e comuns, mas são a dor de cabeça nº 1 do chat: eles conectam e depois **caem aleatoriamente sob carga**. O [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) (driver com backport) resolve a maior parte disso para a família RTL8821/8822; os pendrives RTL8851BU/8831BU "AX900 WiFi 6" precisam do [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831). Se você quer um pendrive que "simplesmente funciona" já de cara, donos relatam que a série **Digma DWA-BT5** funciona. O Bluetooth compartilha o rádio de 2,4 GHz, então espere a vazão do WiFi cair enquanto o BT estiver ativo.

Se você só precisa de internet para a configuração inicial, um **adaptador USB-Ethernet com fio ou a NIC integrada** dispensa esta página inteira. Recorra a um dongle de WiFi/BT quando você realmente precisar de conexão sem fio ou de um controle Bluetooth.

> **Sobre a ethernet Realtek RTL8111 integrada:** é o caminho de menor resistência, mas a família RTL8111/8168 é **instável-a-não-confiável no Linux** — o driver de fábrica `r8169` é amplamente relatado como causa de link subindo/caindo aleatoriamente, quedas sob banda e, às vezes, uma queda para 100 Mbit. Trocar para o módulo out-of-tree `r8168` é a mitigação usual. Se a porta integrada se comportar mal, **prefira uma NIC USB/PCIe Intel ou MediaTek** — os drivers Linux delas são muito mais confiáveis. ([Intel/MediaTek vs Realtek é uma lacuna de confiabilidade antiga no Linux](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)) ⚠ a instabilidade do RTL8111 é um padrão geral do Linux, não específico da BC-250 — verifique na sua placa.

---

## A primeira coisa a entender

Quase todo relato de "meu dongle fica desconectando" na BC-250 remete a **duas coisas, não à marca na caixa**:

1. **O chipset por dentro.** O rótulo (ASUS, TP-Link, D-Link…) não significa nada — o que importa é o chip Realtek/aic/MediaTek sob a carcaça. Três pendrives de marcas diferentes podem carregar exatamente o mesmo chip e falhar de forma idêntica. ([src](https://t.me/c/2424231195/16332))
2. **Energia/estabilidade do USB sob carga.** Vários usuários veem um pendrive funcionar bem ocioso/navegando e então **cair no momento em que o tráfego dispara** (um download grande), "como se o USB não desse conta". O pendrive ASUS de um usuário durou só 17 minutos antes de cair durante um download. ([src](https://t.me/c/2424231195/16331)) · ([src](https://t.me/c/2424231195/17319))

Então: **escolha pelo chipset**, combine-o com um driver out-of-tree mantido e, se ainda assim cair, trate como um problema de energia/reset (veja [Quedas](#corrigindo-quedas-aleatórias) abaixo).

> **Como descobrir o chipset?** As caixas raramente imprimem isso. Antes de comprar, procure o **FCC ID** do pendrive (impresso no dispositivo/anúncio) online — o registro revela o chip real. Depois de plugá-lo, rode **`lsusb`** no Linux para ver os IDs de fabricante/produto e o chipset.

---

## Dongles comprovadamente bons

Verificados cruzando com os repositórios de driver. As "Notas" refletem o que membros do chat realmente observaram na BC-250.

| Chipset | Pendrives de exemplo (do chat) | Repositório do driver | Notas |
|---|---|---|---|
| **aic8800d80** (aic8800) | AX90BT / D80MU3 ("AIC device wlan") | [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) | **O mais recomendado.** Receita de RPM testada para Bazzite; WiFi+BT. Aparece primeiro como um USB-CDROM e depois vira `aic device wlan` após o `install_setup.sh`. ([src](https://t.me/c/2424231195/120502)) |
| **RTL8821CU / 8821AU** | "свисток" Realtek genérico | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Funciona, mas **propenso a quedas aleatórias** no driver antigo do kernel. O backport do lwfinger é estável para a maioria; a correção definitiva chegou no kernel 6.13–6.14. ([src](https://t.me/c/2424231195/17321)) |
| **RTL8822BU** | pendrive dual-band sem nome | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Um dono: conecta e depois **cai a cada 5–10 min**. Suportado pela lista USB do rtw88, mas a confiabilidade na BC-250 é incerta. ([src](https://t.me/c/2424231195/138512)) |
| **RTL8851BU / 8831BU** | "AX900 WiFi 6 + BT 5.3 de US$ 5" | [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) | **Não funcionou de fábrica** — o chip WiFi 6 é novo demais para o rtw88. Precisa do driver dedicado `8851bu`. ([src](https://t.me/c/2424231195/17320)) |
| **Digma DWA-BT5-AC600C / AC1300E** | Digma USB WiFi+BT | no kernel (Realtek) | Relatado como **funcionando de fábrica** ("funcionou na primeira tentativa"); um dono de BC-250 confirmou nas avaliações do produto. ([src](https://t.me/c/2424231195/138520)) |

> **Relatados como NÃO funcionando / problemáticos:** **RTL8851BU "AX900"** genérico de fábrica ([src](https://t.me/c/2424231195/17320)); **RTL8821cu/8821au** puros nos drivers de fábrica do kernel caem aleatoriamente ([src](https://t.me/c/2424231195/16330)); um **RTL8822BU** sem marca cai a cada poucos minutos ([src](https://t.me/c/2424231195/138512)). Um usuário desistiu de vez e encomendou um **Edimax EW-7733UnD** no lugar. ([src](https://t.me/c/2424231195/120503))

---

## Caminho A — aic8800d80 (recomendado)

Este é o chip com o histórico mais limpo na BC-250. Há uma receita completa de RPM para Bazzite e um mini-guia escrito pela comunidade.

### Bazzite (rpm-ostree) — build de RPM

O [`bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) do mantenedor compila um RPM adequado, de modo que o driver sobrevive melhor às atualizações de imagem do que um `make` cru. Verificado contra o repositório:

```bash
# 1. Build deps (then reboot so the overlay is active)
sudo rpm-ostree install rpm-build rpmdevtools dkms
sudo systemctl reboot

# 2. Set up the rpmbuild tree and grab the spec
cd "$HOME"
rpmdev-setuptree
cd "$HOME/rpmbuild/SPECS"
curl -LO -s https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec

# 3. Fetch sources and build
spectool -g -R "$HOME/rpmbuild/SPECS/aic8800d80.spec"
rpmbuild -bs "$HOME/rpmbuild/SPECS/aic8800d80.spec"
sudo rpm-ostree usroverlay
rpmbuild --define "uname $(uname -r)" -bb "$HOME/rpmbuild/SPECS/aic8800d80.spec"

# 4. Install the built RPM and reboot (filename will match your kernel/fedora ver)
sudo rpm-ostree install "$HOME"/rpmbuild/RPMS/x86_64/aic8800d80-*.rpm
sudo systemctl reboot
```

Um membro do chat ([Nurmukhamed](https://github.com/Nurmukhamed/aic8800d80/tree/15a927286788af46529909bc2c14d16ea4241ec0/bazzite)) escreveu um passo a passo de empacotamento em RPM pelo qual a comunidade o agradeceu. ([src](https://t.me/c/2424231195/122580))

### Mini-guia da comunidade (o caminho rápido do "make")

Se você só quer colocar pra funcionar *agora* e não se importa de rodar de novo após reinicializações, o guia do Aqtilek ([src](https://t.me/c/2424231195/120502)):

```bash
# The stick first appears as a fake CD-ROM. Flip it to WiFi mode (ONE TIME):
sudo sh install_setup.sh         # now shows as "aic device wlan"

# Temporarily lift the read-only root (Bazzite/atomic):
sudo rpm-ostree usroverlay

# Clone and build the driver (use the repo's "method 2"):
git clone https://github.com/shenmintao/aic8800d80.git && cd aic8800d80
# …then follow the repo's second install method.
```

> ⚠ **Persistência entre reinicializações:** com o caminho do `make` cru, **o driver é perdido a cada reinicialização** e precisa ser reinstalado — o autor sugere um pequeno script de autostart. ([src](https://t.me/c/2424231195/120502)) O caminho do RPM acima é a correção durável.

O arquivo de firmware/driver que um membro usou (*AX90BT(D80MU3)*) foi compartilhado no chat. ([src](https://t.me/c/2424231195/119991)) Existe um upstream alternativo, [`goecho/aic8800_linux_drvier`](https://github.com/goecho/aic8800_linux_drvier), mas um usuário de CachyOS passou 6 h e não conseguiu compilá-lo — prefira o `shenmintao` na BC-250. ([src](https://t.me/c/2424231195/82100)) ⚠ verifique na sua distro.

> **particularidades do aic8800d80 (do rastreador de problemas do driver):**
> - O firmware `fmacfw_8800d80_u02.bin` deve residir em `/lib/firmware/aic8800D80/`; uma falha no upload do firmware deixa a interface travada em `DOWN`. ([aic8800d80 #37](https://github.com/shenmintao/aic8800d80/issues/37) · [#10](https://github.com/shenmintao/aic8800d80/issues/10))
> - **Kernel 7.0 / 7.1:** o driver 1.0.0 falha ao compilar sob o DKMS — as assinaturas de `cfg80211_new_sta` / `cfg80211_del_sta` mudaram e um erro `-Wimplicit-fallthrough` impede a compilação. Permaneça em um kernel mais antigo ou aplique um patch no código-fonte até que o upstream se atualize. ([aic8800d80 #49](https://github.com/shenmintao/aic8800d80/issues/49))
> - **Debian 13 (kernel 6.12.90):** a interface Wi-Fi pode falhar ao iniciar ou detectar redes. ([aic8800d80 #58](https://github.com/shenmintao/aic8800d80/issues/58))

---

## Caminho B — Realtek RTL8821 / RTL8822 (rtw88)

Baratos e onipresentes, mas o driver do kernel em kernels mais antigos é **bugado e cai aleatoriamente**. A correção é o driver out-of-tree com backport do `lwfinger/rtw88`. Os comandos exatos que um membro usou e confirmou estáveis ([src](https://t.me/c/2424231195/16326)):

```bash
git clone https://github.com/lwfinger/rtw88
cd rtw88
make
sudo make install
sudo make install_fw
```

Em uma configuração com Secure-Boot / DKMS, o repositório também documenta um fluxo `sudo dkms install $PWD` + `mokutil` — veja o [README do repositório](https://github.com/lwfinger/rtw88).

**Por que isso ajuda:** as quedas são um bug conhecido do driver; a correção definitiva só chegou à mainline no **kernel 6.13–6.14**, e muitas imagens de distro ainda traziam a versão quebrada. O backport do lwfinger te dá o driver corrigido agora. ([src](https://t.me/c/2424231195/17321)) As peças USB suportadas incluem RTL8811AU/CU, RTL8812AU/BU/CU, RTL8814AU, RTL8821AU/CU e RTL8822BU/CU (lista completa no repositório).

> Ressalva honesta: mesmo com o rtw88, um usuário com RTL8821cu ainda via quedas ocasionais ("mesma situação"), e a vazão cai um pouco em relação ao driver de fábrica quebrado-porém-mais-rápido. ([src](https://t.me/c/2424231195/16333)) Se confiabilidade importa mais que preço, vá de aic8800d80 ou de um Digma confirmado.

---

## Caminho C — Realtek RTL8851BU / RTL8831BU ("AX900 WiFi 6")

Os pendrives "AX900 WiFi 6 + Bluetooth 5.3" muito baratos usam **RTL8851BU/8831BU**, que o `rtw88` **não** cobre, então estão mortos de fábrica. ([src](https://t.me/c/2424231195/17320)) Use o driver dedicado [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831):

```bash
git clone https://github.com/biglinux/rtl8831
cd rtl8831
sudo dkms install .        # or: make && sudo make install
sudo modprobe 8851bu
```

⚠ verifique — este repositório não foi mostrado sendo compilado no chat em uma BC-250; os comandos são do README do repositório.

> **Um exemplo nomeado dessa classe — TP-Link Archer TX10UB Nano ("AX900 WiFi 6 + BT 5.3").** Este é um produto real, fácil de achar, e seu **WiFi funciona no Linux** — ele carrega um chip **RTL8851BU**, então cai no Caminho C (você vai precisar do driver `8851bu`/`biglinux/rtl8831`, não do rtw88 de fábrica). **Mas seu Bluetooth *não* é suportado pelo fabricante no Linux:** a própria spec da TP-Link lista o adaptador como apenas Windows 10/11 e diz explicitamente que a **função Bluetooth não é compatível com Mac, Linux ou TV** ([página do produto TP-Link](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)). Então trate-o como **"WiFi funciona no Linux (via driver 8851bu); BT não é suportado pelo fabricante no Linux."** A comunidade talvez consiga colocar o BT pra funcionar através de drivers BT Realtek genéricos, mas isso não está verificado — **não compre esperando um dongle WiFi+BT Linux plug-and-play limpo.** A **UGreen** também vende um pendrive "AX900" relatado pela comunidade como alternativa, mas é da mesma família RTL8851BU — verifique o chipset e a mesma ressalva de BT se aplica. ⚠ verifique.

---

## Corrigindo quedas aleatórias

Se o seu pendrive conecta e depois cai (o clássico sintoma Realtek-na-BC-250):

1. **Instale o driver out-of-tree certo** (Caminho B/C) — isso resolve a maioria dos casos.
2. **Reencaixe / replugue após o boot.** Alguns pendrives não são detectados em boot a frio e precisam de um desplugar-replugar. ([src](https://t.me/c/2424231195/16325))
3. **Resete o dispositivo por software em vez de desplugar** — use o `usbreset` (sem necessidade de puxá-lo fisicamente). ([src](https://t.me/c/2424231195/135895)) · [como fazer (Superuser)](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
4. **Tente uma porta USB diferente** (idealmente uma porta traseira/root-hub) — o sintoma parece relacionado a energia/banda sob carga. ([src](https://t.me/c/2424231195/17319))
5. **Mantenha o dongle fora do USB 3.0.** As portas USB 3.0 são uma fonte documentada de **interferência de RF em 2,4 GHz** — a sinalização de alta velocidade adiciona ~20 dB de ruído de banda larga em 2,4–2,5 GHz que nenhum filtro consegue remover, degradando WiFi *e* Bluetooth bem onde eles vivem. O white paper da Intel é a referência canônica. Plugue os dongles de WiFi/BT em uma **porta USB 2.0**, ou use um **cabo extensor USB curto** para afastar o dongle alguns centímetros dos conectores USB 3.0 e de qualquer cabeamento DisplayPort/HDMI. ([Intel: USB 3.0 RF Interference Impact on 2.4 GHz Wireless Devices](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf))

---

## Notas sobre Bluetooth

- Pendrives combo WiFi+BT compartilham o rádio de **2,4 GHz**, então a **vazão do WiFi cai enquanto o Bluetooth está ativo**. Um membro mediu **~150 Mbit com BT ligado vs ~190 Mbit com ele desligado** — real, mas "não tão dramático". ([src](https://t.me/c/2424231195/123366)) · ([src](https://t.me/c/2424231195/123367))
- O driver aic8800d80 tem uma **branch `bluetooth` separada** para suporte a BT. ([branch do repositório](https://github.com/shenmintao/aic8800d80/tree/bluetooth?tab=readme-ov-file))

- **Se o Bluetooth nunca aparecer, o driver genérico `btusb` capturou o dispositivo primeiro.** O controlador BT aic8800 precisa de seu próprio módulo `aic_btusb` — o `btusb` integrado ao kernel não consegue inicializá-lo. Troque-os com `sudo rmmod btusb && sudo modprobe aic_btusb` ou torne isso persistente adicionando `softdep btusb pre: aic_btusb` a `/etc/modprobe.d/aic8800-bt.conf`. ([aic8800d80 #53](https://github.com/shenmintao/aic8800d80/issues/53) · [#44](https://github.com/shenmintao/aic8800d80/issues/44))

---

## Lista curta de compra

Se você quer o caminho de menor risco, em ordem:

1. **Pendrive aic8800d80** (classe AX90BT / D80MU3) + a receita de RPM para Bazzite — o mais bem documentado, WiFi+BT.
2. **Digma DWA-BT5-AC600C / AC1300E** — relatado como funcionando de fábrica. ([anúncio na Ozon](https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/))
3. **Pendrive RTL8821CU + lwfinger/rtw88** — o mais barato, aceite quedas ocasionais.
4. Evite o **RTL8851BU "AX900"** mais barato a menos que esteja disposto a brigar com o `biglinux/rtl8831`.

> Não confie no "isso aí, escolha perfeita" de um chatbot de IA sobre um dongle — um membro fez exatamente isso, comprou um RTL8822BU que cai a cada 5–10 min, e o mesmo bot então disse que não funcionaria. Compre pelo chipset, verificado aqui. ([src](https://t.me/c/2424231195/138512))

---

## Fontes

- aic8800d80 RPM para Bazzite — [`shenmintao/aic8800d80` `bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) · spec — https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec
- mini-guia aic8800d80 — https://t.me/c/2424231195/120502 · fork do RPM — https://t.me/c/2424231195/122580 · zip de firmware — https://t.me/c/2424231195/119991
- branch BT do aic8800 — https://github.com/shenmintao/aic8800d80/tree/bluetooth · repo alternativo — https://github.com/goecho/aic8800_linux_drvier (https://t.me/c/2424231195/82100)
- passos de build do rtw88 — https://t.me/c/2424231195/16326 · justificativa do backport — https://t.me/c/2424231195/17321 · driver — [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88)
- RTL8851BU AX900 não funciona — https://t.me/c/2424231195/17320 · driver — [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831)
- Sintoma de queda / pelo-chip-não-pela-marca — https://t.me/c/2424231195/16330 · https://t.me/c/2424231195/16331 · https://t.me/c/2424231195/16332 · https://t.me/c/2424231195/17319
- Digma funciona de fábrica — https://t.me/c/2424231195/138520 · anúncio — https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/
- RTL8822BU recomendado por IA cai — https://t.me/c/2424231195/138512 · saída via Edimax — https://t.me/c/2424231195/120503
- Velocidade BT vs WiFi — https://t.me/c/2424231195/123366 · usbreset — https://t.me/c/2424231195/135895 · [como fazer no Superuser](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
- RTL8111/8168 integrada instável no Linux; mitigação r8168, prefira Intel/MediaTek — [LinuxQuestions r8169 vs r8168](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)
- USB 3.0 interfere no WiFi/BT de 2,4 GHz (use USB 2.0 / extensão) — [white paper da Intel](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf)
- TP-Link Archer TX10UB Nano — WiFi funciona no Linux (RTL8851BU), BT listado pelo fabricante como apenas Windows / não Linux — [página do produto TP-Link](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)
