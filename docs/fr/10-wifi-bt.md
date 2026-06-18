> 🌐 Traduction communautaire. La [version anglaise](../en/10-wifi-bt.md) fait foi et peut être plus à jour. Une erreur ? [Ouvrez une issue](https://github.com/lildebil0/awesome-bc250/issues).

# Dongles WiFi & Bluetooth

> **TL;DR** — Le BC-250 n'a **ni WiFi ni Bluetooth intégrés**, il vous faut donc un dongle USB. Le choix le plus fiable du chat est de loin une clé à base d'**aic8800d80** (par ex. l'*AX90BT / D80MU3*), pilotée par [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) — il existe une recette RPM Bazzite testée. Les clés **Realtek RTL88xx** (8821au/cu, 8822bu, 8851bu) sont bon marché et répandues mais constituent le casse-tête n°1 du chat : elles se connectent, puis **décrochent aléatoirement sous charge**. [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) (pilote rétroporté) corrige l'essentiel pour la famille RTL8821/8822 ; les clés RTL8851BU/8831BU « AX900 WiFi 6 » nécessitent [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831). Si vous voulez une clé qui « fonctionne tout simplement » dès la sortie du carton, les propriétaires rapportent que la série **Digma DWA-BT5** le fait. Le Bluetooth partage la radio 2,4 GHz, attendez-vous donc à ce que le débit WiFi baisse pendant que le BT est actif.

Si vous n'avez besoin d'internet que pour l'installation, un **adaptateur USB-Ethernet filaire ou le NIC intégré** contourne entièrement cette page. Tournez-vous vers un dongle WiFi/BT quand vous avez réellement besoin de sans-fil ou d'une manette Bluetooth.

> **À propos de l'ethernet Realtek RTL8111 intégré :** c'est la voie de moindre résistance, mais la famille RTL8111/8168 est **capricieuse à peu fiable sous Linux** — le pilote `r8169` d'origine est largement rapporté comme causant des montées/descentes de lien aléatoires, des coupures sous bande passante, et parfois une chute à 100 Mbit. Basculer vers le module hors-arbre `r8168` est l'atténuation habituelle. Si le port intégré se comporte mal, **préférez un NIC USB/PCIe Intel ou MediaTek** — leurs pilotes Linux sont bien plus fiables. ([Intel/MediaTek vs Realtek est un écart de fiabilité Linux de longue date](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)) ⚠ le caractère capricieux du RTL8111 est un schéma général à Linux, pas spécifique au BC-250 — vérifiez sur votre carte.

---

## La première chose à comprendre

Presque tous les rapports « mon dongle n'arrête pas de se déconnecter » sur le BC-250 remontent à **deux choses, pas à la marque sur la boîte** :

1. **Le chipset à l'intérieur.** L'étiquette (ASUS, TP-Link, D-Link…) ne veut rien dire — ce qui compte, c'est la puce Realtek/aic/MediaTek sous la coque. Trois clés de marques différentes peuvent porter exactement la même puce et échouer à l'identique. ([src](https://t.me/c/2424231195/16332))
2. **L'alimentation/stabilité USB sous charge.** Plusieurs utilisateurs voient une clé tourner correctement au repos/en navigation puis **décrocher dès que le trafic grimpe** (un gros téléchargement), « comme si l'USB ne pouvait pas suivre ». La clé ASUS d'un utilisateur a tenu tout juste 17 minutes avant de décrocher en téléchargement. ([src](https://t.me/c/2424231195/16331)) · ([src](https://t.me/c/2424231195/17319))

Donc : **choisissez par chipset**, associez-le à un pilote hors-arbre maintenu, et s'il décroche encore, traitez-le comme un problème d'alimentation/réinitialisation (voir [Décrochages](#corriger-les-décrochages-aléatoires) ci-dessous).

> **Comment trouve-t-on le chipset ?** Les boîtes l'impriment rarement. Avant d'acheter, recherchez en ligne l'**ID FCC** de la clé (imprimé sur l'appareil/l'annonce) — le dépôt révèle la vraie puce. Une fois branchée, lancez **`lsusb`** sous Linux pour voir les IDs vendeur/produit et le chipset.

---

## Dongles connus comme bons

Recoupés avec les dépôts de pilotes. Les « Notes » reflètent ce que les membres du chat ont réellement observé sur le BC-250.

| Chipset | Exemples de clés (issus du chat) | Dépôt du pilote | Notes |
|---|---|---|---|
| **aic8800d80** (aic8800) | AX90BT / D80MU3 (« AIC device wlan ») | [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) | **Le plus recommandé.** Recette RPM Bazzite testée ; WiFi+BT. Apparaît d'abord comme un USB-CDROM, puis bascule en `aic device wlan` après `install_setup.sh`. ([src](https://t.me/c/2424231195/120502)) |
| **RTL8821CU / 8821AU** | « свисток » Realtek générique | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Fonctionne, mais **sujet à des décrochages aléatoires** sur l'ancien pilote intégré au noyau. Le rétroportage lwfinger est stable pour la plupart ; le vrai correctif est arrivé dans le noyau 6.13–6.14. ([src](https://t.me/c/2424231195/17321)) |
| **RTL8822BU** | clé double bande sans nom | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Un propriétaire : se connecte, puis **décroche toutes les 5–10 min**. Pris en charge par la liste USB de rtw88 mais la fiabilité sur BC-250 est aléatoire. ([src](https://t.me/c/2424231195/138512)) |
| **RTL8851BU / 8831BU** | « AX900 WiFi 6 + BT 5.3 à 5 $ » | [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) | **N'a pas fonctionné dès le carton** — puce WiFi 6 trop récente pour rtw88. Nécessite le pilote dédié `8851bu`. ([src](https://t.me/c/2424231195/17320)) |
| **Digma DWA-BT5-AC600C / AC1300E** | Digma USB WiFi+BT | intégré au noyau (Realtek) | Rapportée comme **fonctionnant dès le carton** (« a démarré du premier coup ») ; un propriétaire de BC-250 l'a confirmé dans les avis produit. ([src](https://t.me/c/2424231195/138520)) |

> **Rapportés comme NE fonctionnant PAS / pénibles :** **RTL8851BU « AX900 »** générique dès le carton ([src](https://t.me/c/2424231195/17320)) ; les **RTL8821cu/8821au** nus sur les pilotes noyau d'origine décrochent aléatoirement ([src](https://t.me/c/2424231195/16330)) ; un **RTL8822BU** sans marque décroche toutes les quelques minutes ([src](https://t.me/c/2424231195/138512)). Un utilisateur a complètement abandonné et a commandé un **Edimax EW-7733UnD** à la place. ([src](https://t.me/c/2424231195/120503))

---

## Voie A — aic8800d80 (recommandée)

C'est la puce avec l'histoire BC-250 la plus propre. Il existe une recette RPM Bazzite complète et un mini-guide rédigé par la communauté.

### Bazzite (rpm-ostree) — build RPM

Le [`bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) du mainteneur construit un véritable RPM, afin que le pilote survive mieux aux mises à jour d'image qu'un simple `make`. Vérifié contre le dépôt :

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

Un membre du chat ([Nurmukhamed](https://github.com/Nurmukhamed/aic8800d80/tree/15a927286788af46529909bc2c14d16ea4241ec0/bazzite)) a rédigé un tutoriel de packaging RPM dont la communauté l'a remercié. ([src](https://t.me/c/2424231195/122580))

### Mini-guide communautaire (la voie rapide « make »)

Si vous voulez juste que ça marche *maintenant* et que ça ne vous dérange pas de le relancer après les redémarrages, le guide d'Aqtilek ([src](https://t.me/c/2424231195/120502)) :

```bash
# The stick first appears as a fake CD-ROM. Flip it to WiFi mode (ONE TIME):
sudo sh install_setup.sh         # now shows as "aic device wlan"

# Temporarily lift the read-only root (Bazzite/atomic):
sudo rpm-ostree usroverlay

# Clone and build the driver (use the repo's "method 2"):
git clone https://github.com/shenmintao/aic8800d80.git && cd aic8800d80
# …then follow the repo's second install method.
```

> ⚠ **Persistance au redémarrage :** avec la voie `make` brute, **le pilote est perdu à chaque redémarrage** et doit être réinstallé — l'auteur suggère un petit script d'autostart. ([src](https://t.me/c/2424231195/120502)) La voie RPM ci-dessus est le correctif durable.

L'archive firmware/pilote qu'un membre a utilisée (*AX90BT(D80MU3)*) a été partagée dans le chat. ([src](https://t.me/c/2424231195/119991)) Un dépôt amont alternatif, [`goecho/aic8800_linux_drvier`](https://github.com/goecho/aic8800_linux_drvier), existe mais un utilisateur de CachyOS a passé 6 h sans réussir à le compiler — préférez `shenmintao` sur le BC-250. ([src](https://t.me/c/2424231195/82100)) ⚠ vérifiez sur votre distro.

> **pièges de aic8800d80 (issus du suivi des anomalies du pilote) :**
> - Le micrologiciel `fmacfw_8800d80_u02.bin` doit se trouver dans `/lib/firmware/aic8800D80/` ; un échec du chargement du micrologiciel laisse l'interface bloquée sur `DOWN`. ([aic8800d80 #37](https://github.com/shenmintao/aic8800d80/issues/37) · [#10](https://github.com/shenmintao/aic8800d80/issues/10))
> - **Noyau 7.0 / 7.1 :** le pilote 1.0.0 ne parvient pas à se compiler sous DKMS — les signatures de `cfg80211_new_sta` / `cfg80211_del_sta` ont changé et une erreur `-Wimplicit-fallthrough` interrompt la compilation. Restez sur un noyau plus ancien ou patchez les sources jusqu'à ce que le projet amont se mette à jour. ([aic8800d80 #49](https://github.com/shenmintao/aic8800d80/issues/49))
> - **Debian 13 (noyau 6.12.90) :** l'interface Wi-Fi peut ne pas s'activer ou ne pas détecter les réseaux. ([aic8800d80 #58](https://github.com/shenmintao/aic8800d80/issues/58))

---

## Voie B — Realtek RTL8821 / RTL8822 (rtw88)

Bon marché et partout, mais le pilote intégré au noyau sur les noyaux plus anciens est **bogué et décroche aléatoirement**. Le correctif est le pilote hors-arbre rétroporté de `lwfinger/rtw88`. Les commandes exactes qu'un membre a utilisées et confirmées stables ([src](https://t.me/c/2424231195/16326)) :

```bash
git clone https://github.com/lwfinger/rtw88
cd rtw88
make
sudo make install
sudo make install_fw
```

Sur une configuration Secure-Boot / DKMS, le dépôt documente aussi un flux `sudo dkms install $PWD` + `mokutil` — voir le [README du dépôt](https://github.com/lwfinger/rtw88).

**Pourquoi ça aide :** les décrochages sont un bug de pilote connu ; le vrai correctif n'a atteint la branche principale qu'au **noyau 6.13–6.14**, et beaucoup d'images de distros livraient encore la version cassée. Le rétroportage lwfinger vous donne le pilote corrigé dès maintenant. ([src](https://t.me/c/2424231195/17321)) Les pièces USB prises en charge incluent RTL8811AU/CU, RTL8812AU/BU/CU, RTL8814AU, RTL8821AU/CU et RTL8822BU/CU (liste complète dans le dépôt).

> Mise en garde honnête : même avec rtw88, un utilisateur sur RTL8821cu voyait encore des décrochages occasionnels (« même galère »), et le débit baisse quelque peu par rapport au pilote d'origine cassé-mais-plus-rapide. ([src](https://t.me/c/2424231195/16333)) Si la fiabilité compte plus que le prix, prenez un aic8800d80 ou un Digma confirmé.

---

## Voie C — Realtek RTL8851BU / RTL8831BU (« AX900 WiFi 6 »)

Les clés « AX900 WiFi 6 + Bluetooth 5.3 » très bon marché utilisent un **RTL8851BU/8831BU**, que `rtw88` ne couvre **pas**, elles sont donc mortes dès le carton. ([src](https://t.me/c/2424231195/17320)) Utilisez le pilote dédié [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) :

```bash
git clone https://github.com/biglinux/rtl8831
cd rtl8831
sudo dkms install .        # or: make && sudo make install
sudo modprobe 8851bu
```

⚠ vérifiez — ce dépôt n'a pas été montré en train d'être construit dans le chat sur un BC-250 ; les commandes proviennent du README du dépôt.

> **Un exemple nommé de cette catégorie — TP-Link Archer TX10UB Nano (« AX900 WiFi 6 + BT 5.3 »).** C'est un produit réel et facile à trouver, et son **WiFi fonctionne sous Linux** — il porte une puce **RTL8851BU**, il relève donc de la Voie C (vous aurez besoin du pilote `8851bu`/`biglinux/rtl8831`, pas du rtw88 d'origine). **Mais son Bluetooth n'est *pas* pris en charge par le fabricant sous Linux :** la fiche technique de TP-Link elle-même liste l'adaptateur comme Windows 10/11 uniquement et indique explicitement que la **fonction Bluetooth n'est pas compatible avec Mac, Linux ou TV** ([page produit TP-Link](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)). Traitez-le donc comme **« le WiFi fonctionne sous Linux (via le pilote 8851bu) ; le BT n'est pas pris en charge par le fabricant sous Linux ».** La communauté pourra peut-être faire marcher son BT via des pilotes BT Realtek génériques, mais c'est non vérifié — **ne l'achetez pas en espérant un dongle WiFi+BT Linux propre et plug-and-play.** **UGreen** vend aussi une clé « AX900 » rapportée par la communauté comme alternative, mais c'est la même famille RTL8851BU — vérifiez le chipset et la même mise en garde BT s'applique. ⚠ vérifiez.

---

## Corriger les décrochages aléatoires

Si votre clé se connecte puis décroche (le symptôme classique Realtek-sur-BC-250) :

1. **Installez le bon pilote hors-arbre** (Voie B/C) — cela résout la majorité des cas.
2. **Re-emboîtez / rebranchez après le démarrage.** Certaines clés ne sont pas détectées à froid et nécessitent un débranchement-rebranchement. ([src](https://t.me/c/2424231195/16325))
3. **Réinitialisez l'appareil en logiciel plutôt que de débrancher** — utilisez `usbreset` (pas besoin de le retirer physiquement). ([src](https://t.me/c/2424231195/135895)) · [comment faire (Superuser)](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
4. **Essayez un autre port USB** (idéalement un port arrière/root-hub) — le symptôme semble lié à l'alimentation/bande passante sous charge. ([src](https://t.me/c/2424231195/17319))
5. **Gardez le dongle hors de l'USB 3.0.** Les ports USB 3.0 sont une source documentée d'**interférences RF à 2,4 GHz** — la signalisation haute vitesse ajoute ~20 dB de bruit large bande sur 2,4–2,5 GHz qu'aucun filtre ne peut supprimer, dégradant le WiFi *et* le Bluetooth juste là où ils vivent. Le livre blanc d'Intel est la référence canonique. Branchez les dongles WiFi/BT sur un **port USB 2.0**, ou utilisez un **court câble d'extension USB** pour éloigner le dongle de quelques centimètres des connecteurs USB 3.0 et de tout câblage DisplayPort/HDMI. ([Intel : USB 3.0 RF Interference Impact on 2.4 GHz Wireless Devices](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [PDF USB-IF](https://www.usb.org/sites/default/files/327216.pdf))

---

## Notes Bluetooth

- Les clés combo WiFi+BT partagent la radio **2,4 GHz**, donc **le débit WiFi baisse pendant que le Bluetooth est actif**. Un membre a mesuré **~150 Mbit avec le BT activé vs ~190 Mbit désactivé** — réel, mais « pas si dramatique ». ([src](https://t.me/c/2424231195/123366)) · ([src](https://t.me/c/2424231195/123367))
- Le pilote aic8800d80 a une **branche `bluetooth` séparée** pour la prise en charge BT. ([branche du dépôt](https://github.com/shenmintao/aic8800d80/tree/bluetooth?tab=readme-ov-file))

- **Si le Bluetooth n'apparaît jamais, le pilote générique `btusb` s'est approprié le périphérique en premier.** Le contrôleur BT aic8800 a besoin de son propre module `aic_btusb` — le `btusb` intégré au noyau ne peut pas l'initialiser. Échangez-les avec `sudo rmmod btusb && sudo modprobe aic_btusb`, ou rendez ce changement persistant en ajoutant `softdep btusb pre: aic_btusb` dans `/etc/modprobe.d/aic8800-bt.conf`. ([aic8800d80 #53](https://github.com/shenmintao/aic8800d80/issues/53) · [#44](https://github.com/shenmintao/aic8800d80/issues/44))

---

## Liste d'achat raccourcie

Si vous voulez la voie au risque le plus faible, dans l'ordre :

1. **Clé aic8800d80** (catégorie AX90BT / D80MU3) + la recette RPM Bazzite — la mieux documentée, WiFi+BT.
2. **Digma DWA-BT5-AC600C / AC1300E** — rapportée comme fonctionnant dès le carton. ([Annonce Ozon](https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/))
3. **Clé RTL8821CU + lwfinger/rtw88** — la moins chère, acceptez des décrochages occasionnels.
4. Évitez le **RTL8851BU « AX900 »** au rabais à moins d'être prêt à vous battre avec `biglinux/rtl8831`.

> Ne faites pas confiance au « ouais frérot, choix parfait » d'un chatbot IA pour un dongle — un membre a fait exactement ça, a obtenu un RTL8822BU qui décroche toutes les 5–10 min, et le même bot a ensuite dit qu'il ne fonctionnerait pas. Achetez par chipset, vérifié ici. ([src](https://t.me/c/2424231195/138512))

---

## Sources

- RPM Bazzite aic8800d80 — [`shenmintao/aic8800d80` `bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) · spec — https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec
- mini-guide aic8800d80 — https://t.me/c/2424231195/120502 · fork RPM — https://t.me/c/2424231195/122580 · zip firmware — https://t.me/c/2424231195/119991
- branche BT aic8800 — https://github.com/shenmintao/aic8800d80/tree/bluetooth · dépôt alt — https://github.com/goecho/aic8800_linux_drvier (https://t.me/c/2424231195/82100)
- étapes de build rtw88 — https://t.me/c/2424231195/16326 · justification du rétroportage — https://t.me/c/2424231195/17321 · pilote — [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88)
- RTL8851BU AX900 ne fonctionne pas — https://t.me/c/2424231195/17320 · pilote — [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831)
- Symptôme de décrochage / par-puce-pas-par-marque — https://t.me/c/2424231195/16330 · https://t.me/c/2424231195/16331 · https://t.me/c/2424231195/16332 · https://t.me/c/2424231195/17319
- Digma fonctionne dès le carton — https://t.me/c/2424231195/138520 · annonce — https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/
- RTL8822BU recommandé par IA décroche — https://t.me/c/2424231195/138512 · évasion Edimax — https://t.me/c/2424231195/120503
- Vitesse BT vs WiFi — https://t.me/c/2424231195/123366 · usbreset — https://t.me/c/2424231195/135895 · [comment faire Superuser](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
- RTL8111/8168 intégré capricieux sous Linux ; atténuation r8168, préférez Intel/MediaTek — [LinuxQuestions r8169 vs r8168](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)
- L'USB 3.0 interfère avec le WiFi/BT 2,4 GHz (utilisez USB 2.0 / extension) — [livre blanc Intel](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [PDF USB-IF](https://www.usb.org/sites/default/files/327216.pdf)
- TP-Link Archer TX10UB Nano — le WiFi fonctionne sous Linux (RTL8851BU), BT listé par le fabricant comme Windows uniquement / pas Linux — [page produit TP-Link](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)
