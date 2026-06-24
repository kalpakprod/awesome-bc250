> 🌐 Traduction communautaire. La [version anglaise](../en/05-case.md) fait foi et peut être plus à jour. Une erreur ? [Ouvrez une issue](https://github.com/lildebil0/awesome-bc250/issues).

# Boîtiers et impression 3D

> **En bref** — La BC-250 est livrée sous forme de carte nue, donc presque tout le monde imprime un boîtier. Il n'existe pas un seul « bon » boîtier — la communauté a produit **des dizaines** de modèles, depuis un simple **manchon de refroidissement** qui se clipse en deux moitiés autour de la carte, jusqu'à des **boîtiers de style console** complets avec poignée de transport, écran frontal et RGB. Quoi que vous imprimiez, le boîtier doit accomplir une tâche que la carte d'origine ne peut pas : **plaquer hermétiquement un ventilateur de 120 mm contre les ailettes du dissipateur** pour que l'air les traverse *de part en part* (voir [Refroidissement](04-cooling.md)). Cette page est le catalogue : nom → STL → ventilateurs → où télécharger. **Attention à l'alimentation** : la plupart des boîtiers sont conçus autour d'une alimentation spécifique (LOP, Flex/SFX ATX, ou un bloc serveur HP) — choisissez le boîtier qui correspond à l'[alimentation](03-power-supply.md) que vous possédez.

Un « boîtier » peut ici aller d'une impression de 200 g qui demande 20 minutes de travail jusqu'à une console en plusieurs pièces qui a pris des semaines à son auteur. Commencez simple ; vous pourrez toujours réimprimer.

> **Débutant et pas sûr ? Imprimez le boîtier [manchon/coque onemorecap](#niveau-1--manchon-de-refroidissement-minimal-commencez-ici) — minimal, rien à découper, accueille un seul ventilateur de 120 mm — et arrêtez-vous là.** Le catalogue ci-dessous est dense ; vous n'avez pas besoin de le lire pour démarrer.

> **Vous voulez la liste complète ?** elektricM maintient un **catalogue d'environ 143 modèles, consultable et filtrable** (filtrez par famille d'alimentation, disponibilité, plateforme) — bien plus que l'ensemble sélectionné ci-dessous, y compris de nombreux builds Discord-only et en cours (WIP). Parcourez-le sur **[elektricM — Cases & Enclosures](https://elektricm.github.io/amd-bc250-docs/community/cases/)**. Les choix ci-dessous sont ceux qui sont nommés, téléchargeables publiquement et qui valent la peine de servir de point de départ.

---

## Réalisations de la communauté

Un aperçu de ce que les gens ont réellement imprimé — d'une coque ouverte nue à des consoles entièrement thématisées. Même carte, résultats radicalement différents.

<p align="center">
  <img src="../../assets/img/case-shell.jpg" alt="onemorecap Shell Case : plaque latérale ouverte, poignée de transport, ailettes en cuivre exposées, ventilateur Arctic de 120 mm" width="60%"><br>
  <sub>Réalisation par Дима Ткач · <a href="https://t.me/c/2424231195/22771">source</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-frame.jpg" alt="Châssis ouvert en aluminium blanc avec les composants exposés : deux dissipateurs, ventilateur Arctic blanc central, alimentation Flex" width="60%"><br>
  <sub>Réalisation par Сергей · <a href="https://t.me/c/2424231195/87420">source</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-orange.jpg" alt="Console fermée orange et blanche avec panneau latéral en grille perforée et poignée de transport moulée" width="60%"><br>
  <sub>Réalisation par Alexander Susl · <a href="https://t.me/c/2424231195/122822">source</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-arasaka.jpg" alt="Console au thème cyberpunk ARASAKA : façade blanche, grille de ventilateur chromée, accents et pieds verts" width="60%"><br>
  <sub>Réalisation par Maxim Perelygin · <a href="https://t.me/c/2424231195/98072">source</a></sub>
</p>

---

## Comment choisir

Trois questions déterminent quel boîtier vous convient :

1. **Quelle alimentation utilisez-vous ?** ([Alimentation](03-power-supply.md)) — Une Meanwell **LOP-300** est petite et se loge *à l'intérieur* de la plupart des boîtiers. Une alimentation **Flex/SFX ATX** est plus grande et nécessite un boîtier avec une baie dédiée. Un **bloc HP/serveur** récupéré nécessite les boîtiers « v3/v4 server PSU ». C'est le filtre le plus important.
2. **Quel(s) ventilateur(s) allez-vous utiliser ?** Presque chaque boîtier est conçu autour d'**un ventilateur de 120 mm** au-dessus du dissipateur. Les builds plus ambitieux ajoutent un **deuxième ventilateur de 120 mm** sur la plaque arrière (pour refroidir la mémoire GDDR6, qui n'a [aucune sonde de température](04-cooling.md)) ou pour alimenter l'alimentation. Quelques-uns utilisent des ventilateurs de **140 mm** ou **slim** là où la hauteur est limitée.
3. **Avez-vous déjà aminci les ailettes ?** La plupart des boîtiers supposent que vous avez déjà **limé/poncé les ailettes du dissipateur d'origine** pour les ouvrir (voir [Refroidissement, voie A](04-cooling.md)). Un boîtier seul ne corrige pas le refroidisseur d'origine — il maintient seulement le ventilateur au bon endroit.

> **Le jargon, une bonne fois :** **STL** = le fichier de maillage standard d'impression 3D que vous chargez dans un trancheur (slicer). **STEP / 3MF** = des formats CAO éditables (utilisez-les si vous voulez modifier le modèle). **Carénage / manchon / adaptateur** = un entonnoir imprimé qui fait plaquer le ventilateur contre les ailettes au lieu de laisser fuir l'air autour. **Flex / SFX ATX** = des alimentations PC à petit facteur de forme. **LOP** = l'alimentation industrielle Meanwell LOP-300 que la communauté privilégie.

> **💡 Imprimez un trou d'accès au cavalier de réinitialisation CMOS.** Chaque fois que vous modifiez la répartition VRAM/UMA, vous devez **réinitialiser le CMOS** (voir [BIOS](08-bios.md)), donc concevoir un boîtier scellé qui enterre le cavalier signifie devoir le rouvrir de force à répétition. Laissez un **trou d'accès de ⌀10 mm** au-dessus du cavalier de réinitialisation CMOS dans tout modèle fermé — ou, mieux, câblez un petit **interrupteur 3 positions** jusqu'au panneau pour pouvoir le réinitialiser sans outils. ([4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980))

---

## Niveau 1 — Manchon de refroidissement minimal (commencez ici)

La chose la plus petite et la plus rapide que vous puissiez imprimer. Ce **n'est pas vraiment un boîtier** — c'est une enveloppe imprimée qui s'emboîte sur la carte en deux moitiés avec un ajustement serré par friction, maintient un ventilateur de 120 mm contre le dissipateur et canalise l'air. **Rien à découper, aucune vis dans la carte.** Дима Ткач (l'un des tout premiers builders du projet) décrit deux variantes — une compacte et une « plus fun à regarder » — toutes deux atteignant **~70 °C à 150 W** de charge, ~210 g / ~170 g de plastique chacune, l'alimentation restant froide grâce à un flux d'air turbulent ([src](https://t.me/c/2424231195/10743)). Son verdict : *« ce n'est pas vraiment un boîtier, plutôt un manchon de refroidissement, mais il n'y a rien à découper, tout tient sur un ajustement très serré, les moitiés se posent par des côtés opposés. »*

- **Fichiers :** `BC-250-FanSleeves.3mf` ([src](https://t.me/c/2424231195/10766)), CAO de la carte `bc-250-body.step` ([src](https://t.me/c/2424231195/18266))
- **Dépôt source :** [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) — le modèle minimal le plus recommandé « vérifié, imprimé, confirmé fonctionnel » du chat ([src](https://t.me/c/2424231195/18260))
- **Ventilateur :** 1× 120 mm
- **Alimentation :** n'importe laquelle — il y a un trou/découpe pour le câble d'alimentation, vous pouvez donc utiliser une LOP *ou* une alimentation externe ([src](https://t.me/c/2424231195/22950))

---

## Niveau 2 — Châssis ouvert / « coque » (carte exposée)

Des demi-boîtiers qui enveloppent la carte d'un côté et laissent le dissipateur visible. Économes en plastique, faciles à assembler, bon flux d'air.

### onemorecap « Shell Case » — le build de référence

Le post de boîtier ayant suscité le plus de réactions positives dans le chat (❤33) : une plaque latérale plate sur la carte gravée du motif **« BC-250 »** et de la grille CU, une **poignée de transport** moulée sur le dessus, les **ailettes du dissipateur amincies exposées** au centre, et un ventilateur **Arctic** de 120 mm dans son propre carénage boulonné à l'extrémité droite. Marqué *« BC-250 SHELL CASE BY ONEMORECAP / ASRock × CMG »* ([src](https://t.me/c/2424231195/22771)). L'ensemble correspondant de STL a été publié sur le chat en un seul lot ([src](https://t.me/c/2424231195/81672)) et l'auteur a confirmé que les modèles sont gratuits sur Printables et MakerWorld ([src](https://t.me/c/2424231195/24505)).

- **Fichiers (lot du chat) :** `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl`, plus les carénages de ventilateur ci-dessous ([src](https://t.me/c/2424231195/81680))
- **Source :** [GitHub onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case)
- **Ventilateur :** 1× ou 2× 120 mm (via carénage), ou 1× 140 mm
- **Alimentation :** le panneau arrière `Shell_Back_FLEX_ATX` est découpé pour une alimentation **Flex ATX**

### Châssis ouvert en acrylique (Владислав)

Un châssis ouvert en **aluminium et acrylique** : deux plaques d'extrémité métalliques avec des panneaux latéraux transparents, la carte montée verticalement, un seul ventilateur **Arctic 120 mm** soufflant directement à travers le dissipateur aminci au centre, et une alimentation Flex/SFX logée dans la baie inférieure ([src](https://t.me/c/2424231195/114651)). C'est le modèle ensuite repartagé sur [r/BC250Gaming sous le nom « acrylic case »](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/). Les supports imprimés sont les pièces que vous reproduisez ; le châssis lui-même est découpé au laser ou disponible dans le commerce.

- **Ventilateur :** 1× 120 mm (centre) — de la place pour ajouter un ventilateur sur la plaque arrière
- **Alimentation :** Flex / SFX ATX dans la baie inférieure

---

## Niveau 3 — Boîtiers de style console (entièrement fermés)

Des boîtiers fermés qui ressemblent à une console de jeu ou à un petit NAS. Plus de plastique et plus de temps d'impression, mais un produit fini avec poignée, bouton d'alimentation, panneaux ventilés et parfois un écran.

### **"Просто лучший корпус"** (Jack Fisher × B1zon) — favori de la communauté

Publié sous le tag sélectionné **#BC250body** comme *« tout simplement le meilleur boîtier »*, c'est une console entièrement finie avec une nomenclature publiée : alimentation, ventilateurs, connecteur, pieds en caoutchouc, bouton d'alimentation, vis + inserts filetés, un répartiteur PWM de ventilateur, un autocollant « Cyberpunk » et un peigne de redressement des ailettes. Certaines pièces ne sont plus produites et ont des substituts ([src](https://t.me/c/2424231195/79990)). Conception créditée à B1zon, assemblage par Jack Fisher.

- **Fichiers :** `BC250 korpus исправленный.rar` (« boîtier BC250, corrigé ») ([src](https://t.me/c/2424231195/79989))
- **Ventilateur :** 120 mm (avant) + répartiteur PWM pour un second ventilateur
- **Alimentation :** interne (classe LOP)

### Façade triple-« GPU » (Гослинг)

Une console dont le panneau avant est un **faux carénage de carte graphique** — trois découpes circulaires de ventilateur alignées avec RGB, de sorte que la machine ressemble à un GPU dédié. Montrée tournant sous **Bazzite 42** sur la BC-250 ([src](https://t.me/c/2424231195/66616)). Les trois ouvertures sont purement esthétiques par-dessus l'unique ventilateur fonctionnel et l'admission.

### Console blanche à panneau-labyrinthe (Jhonatan)

Une grande boîte blanche avec un saisissant **panneau latéral ventilé à motif labyrinthe/circuit**, un bouton d'alimentation métallique éclairé (en vert), et une grille d'admission pleine hauteur sur la façade — l'une des esthétiques les plus soignées du chat ([src](https://t.me/c/2424231195/121274)).

### Mini-tour à grille quadrillée (Joglik)

Une mini-tour verticale grise avec une **grille à mailles carrées** dense sur le côté et le dessus, une encoche/poignée dans le bord supérieur, et un passe-câble rond à l'arrière en bas. Look industriel épuré ([src](https://t.me/c/2424231195/126525)).

### Boîtier hi-fi à fenêtre ovale (a m)

Un boîtier rectangulaire blanc stylisé comme une façade hi-fi/four à micro-ondes : une grande **fenêtre en grille en forme de stade** avec le ventilateur visible derrière une grille circulaire, flanquée de deux fentes verticales en grille ([src](https://t.me/c/2424231195/52955)). L'itération ultérieure de l'auteur s'oriente vers du « vrai plastique » au lieu de PVC expansé et ajoute une alimentation externe série XT et du RGB ([src](https://t.me/c/2424231195/128048)).

### Console compacte (Volodymyr Spyrydonov, « v15 »)

Une petite console argentée et noire avec une admission latérale en grille et une façade sombre portant un emblème de style cyberpunk et un bandeau RGB, montrée posée à côté d'une TV comme machine de salon ([src](https://t.me/c/2424231195/135995)). Fait partie d'une longue série de révisions (les images sources v15/v19/v20 ont été partagées tôt).

### BC250 Vented Edition (MaelremremDotXYZ)

Une console **FlexATX** minimaliste fonctionnant **ailettes ouvertes**, tenant **~67 °C @ 2145 MHz / 1.1 V**, avec un interrupteur de coupure de l'alimentation à l'arrière. [MakerWorld 2899020](https://makerworld.com/en/models/2899020).

### Stellar 250 (isaacalvex)

Une console autonome complète avec un **guide de montage** complet : stockage interne, **WiFi 6**, et un **affichage de température ESP32**. [GitHub isaacalvex/AMD-BC-250-Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide).

### Simple Case for the ASRock AMD BC-250

Un boîtier console nommé et téléchargeable publiquement, publié par l'auteur du [tutoriel de montage ukrainien sur YouTube](https://youtu.be/p5Zd86vFe8w) — une boîte fermée simple pour ceux qui veulent une impression finie sans la complexité d'un assemblage en plusieurs pièces. [MakerWorld 2870270](https://makerworld.com/en/models/2870270).

---

## Niveau 4 — Gros builds : alimentation ATX, refroidissement liquide AIO, écrans

Pour ceux qui veulent une alimentation pleine taille, un refroidissement liquide ou un écran intégré.

### Famille NexGen3D **"DIY Steam Machine"**

Le **projet 3D le plus cité** de la communauté (republié 7×). Une famille de boîtiers console sur Printables, comprenant une variante **« Pro » refroidie par liquide** et une édition **« Redux »** qui intègre un **écran Pi interne de 1080×480** à l'avant ([build Reddit](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)). Il existe un modèle de **support AIO** dédié pour poser un refroidisseur liquide tout-en-un de 120 mm sur le die.

- [Printables 1499974 — DIY Steam Machine (base)](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite)
- [Printables 1614131 — Pro refroidie par liquide](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) · [Printables 1649679 — Redux](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) · [Printables 1554003 — support AIO](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250)
- **Ventilateur/refroidissement :** 120 mm air **ou** 120 mm AIO selon la variante
- **Alimentation :** version LOP et versions ATX documentées

### Build de référence **"Steam Machine Pro"** refroidi par liquide (Old Lamer)

Un build haut de gamme, entièrement refroidi par liquide, documenté de bout en bout en vidéo — utile comme liste de courses de pièces si vous misez tout sur une machine AIO ([Old Lamer](https://youtu.be/afYhUQFa-AY)). La nomenclature publiée :

- **AIO :** TEUCER AF 240 (tout-en-un de 240 mm) sur le die
- **Alimentation :** Mean Well **LOP-600-12** (ou **LOP-500-12** comme option plus petite) — voir [Alimentation](03-power-supply.md)
- **Ventilateurs :** 2× Arctic **P12 Pro** + 1× Arctic **P8**
- **Allumage à distance :** une **carte relais ESP32** pour allumer/éteindre la machine à distance
- **Logiciel :** **OpenLinkHub** / **Commander Duo** sous Linux pour piloter la pompe AIO et les ventilateurs

---

### Steam Cube — boîtier vertical paramétrique, refroidi à l'eau (en développement)

Un boîtier vertical **entièrement paramétrique** au facteur de forme **Xbox Series X**, conçu **en priorité pour le refroidissement liquide** avec un côté froid interchangeable : un waterblock, un **Thermalright AXP90-X47 Full-Copper**, ou un seul **Arctic P12 Max** se boulonnent tous sur le même support. Il est né de l'esquisse **« Xbox Serie X BC-250 Edition » de Sol Diego** ([Printables 1748271](https://www.printables.com/model/1748271)) et du modèle de carte précis de **torassk** ([Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)), puis redessiné comme du code (build123d) afin que chaque dimension soit une variable que l'on réajuste, et non un maillage figé.

**L'enveloppe et le raisonnement derrière** (dérivés de la taille de carte vérifiée et des objectifs thermiques dans [Refroidissement](04-cooling.md)) :

- **~180 × 212 × 380 mm** en tour verticale — assez haute pour dresser un **radiateur de 240 mm verticalement** à côté de la carte (un ensemble radiateur d'environ 277 mm tient dans 380 mm de hauteur).
- **Flux d'air en cheminée** — admission de 120 mm en bas, extraction de 120 mm en haut, pour que la chaleur monte directement vers la sortie.
- **Une plaque arrière active est obligatoire, pas optionnelle** — le côté GDDR6 / VRM n'a [aucune sonde de température](04-cooling.md), donc le modèle traite le refroidissement arrière comme une pièce requise.
- **Objectifs de refroidissement** (objectifs de conception, **pas** des résultats mesurés) : die à l'eau < 60 °C en continu à 40 CU ; AXP90 < 75 °C @ 2000 MHz ; base P12 ~73–78 °C.

> ⚠️ **Statut : concept de conception, pas une impression vérifiée.** La CAO actuelle est un **modèle spatial paramétrique** — les pièces sont correctement dimensionnées, orientées et placées, et il exporte 8 STL + un STEP — mais il n'a **pas** été imprimé, assemblé ni testé thermiquement, et le waterblock est placé d'après la boîte englobante de la carte plutôt que d'après une position de die mesurée. Considérez-le comme une **CAO de départ à forker**, pas un boîtier fini ; la validation réelle d'impression / d'ajustement / thermique est la prochaine étape ouverte. Les objectifs ci-dessus sont des buts, pas des benchmarks.

---

### Boîtiers à alimentation ATX (Victor L., V\ad, server-PSU v3/v4)

Pour une alimentation **ATX** complète : un boîtier conçu autour d'une alimentation ATX complète ([src](https://t.me/c/2424231195/119293), en route vers MakerWorld), un prototype Blender antérieur d'un débutant ([src](https://t.me/c/2424231195/105570)), et une gamme **HP/server-PSU** publiée sur Printables/MakerWorld avec emplacements pour disque dur et hub USB.

- [Printables 1580750 — Case v3, alimentation serveur HP + HDD + hub USB](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) · [MakerWorld 2481620 — Case v4, alimentation FlexATX et serveur HP](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) · [Printables 1550729 — ATX-PSU Bazzite Box](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box)

### Builds Twin-120 (refroidissement mémoire + alimentation)

Une plaque de montage redessinée portant **deux ventilateurs de 120 mm** — l'un canalisé vers la plaque arrière (mémoire) comme le concepteur de la carte le prévoyait, le second alimentant l'alimentation. Avec des ventilateurs Lian Li P28 à l'avant + un Thermalright C12015, l'auteur tient **2200 MHz à 80 °C en jeu**, là où un seul ventilateur avant ne suffisait pas ([src](https://t.me/c/2424231195/120606)). Un **`Twin_120mm_Fan_Shroud.stl`** autonome est partagé à cet effet ([src](https://t.me/c/2424231195/121684)).

### The Lanboy — arcade portable / lunchbox

Un build arcade-lunchbox portable : il pilote une **dalle eDP de portable de 16″ (1920×1200 @ 165 Hz)** via une **carte adaptateur eDisplayPort** ([AliExpress](https://www.aliexpress.com/item/1005006351527252.html)), 2× haut-parleurs de 2″ sur un ampli USB, le tout alimenté par un seul **breakout ATX 12 V**. [Printables 1746364](https://www.printables.com/model/1746364). L'astuce de l'adaptateur eDP est réutilisable pour **n'importe quel** build à dalle de portable.

### BC250-HUD (Bloodyly) — écran de statut interne

Une appli d'**écran de statut Qt5/C++ pour un Raspberry Pi Zero 2** (utilisée dans des builds comme la NexGen3D Redux) : **60 FPS en mode USB gadget**, lit les FPS/frametime depuis MangoHud, détecte la tension du ventilateur pour atténuer l'écran en veille, et **inclut le patch noyau vc4** qui sinon fige le Pi. Écran : **8.8″ 1920×480 IPS** (Hannstar HSD088IPW1-A). [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD).

---

## Adaptateurs et supports (pas des boîtiers complets)

De petites pièces imprimées qui résolvent un seul problème — généralement fixer un refroidisseur ou un ventilateur à la carte.

- **Carénages de ventilateur** (plaquent un ventilateur contre les ailettes) : `Fan_Shroud_Single_120mm.stl`, `Fan_Shroud_Dual_120mm.stl`, `Fan_Shroud_Single_120mm_Restricted.stl`, `Fan_Shroud_Single_140mm.stl` ([src](https://t.me/c/2424231195/81673)), `Twin_120mm_Fan_Shroud.stl` ([src](https://t.me/c/2424231195/121684)). Également répertoriés dans [Refroidissement](04-cooling.md).
- **Supports de ventilateur pour plaque arrière / mémoire :** `Backplate.stl` + `backplane-top-fixed.stl` ([src](https://t.me/c/2424231195/133049)) ; `bottom_fan_mount.stl`, `top_fan_mount.stl`, `Front-Mount.stl`, `Back-Mount.stl` ([src](https://t.me/c/2424231195/131189))
- **Adaptateurs de refroidisseur AM4** (boulonner un refroidisseur CPU standard sur le die) : `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` ([src](https://t.me/c/2424231195/9949)). Voir aussi [Printables 1042228 — support refroidisseur CPU BC250→AMD](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount).
- **Support ITX générique** (majzok) : s'imprime en deux parties qui s'emboîtent dans un cadre — vissez la BC-250 dedans, puis vissez le cadre dans **n'importe quel boîtier doté des trous de carte mère ITX standard** (testé dans un DeepCool CH170 PLUS). Résout le problème du « aucun support ITX générique n'existe ». Aucun lien Printables canonique recensé — cherchez **« BC-250 ITX Mount »** sur Printables/MakerWorld.
- **Adaptateur Thermalright AXP90-X53 / AXP120-X67** (refroidisseur bas profil sur le die) : un support imprimé nécessitant des filetages M3, avec des variantes d'épaisseur selon la pression du refroidisseur/CPU — [Printables 1694793](https://www.printables.com/model/1694793). Également dans [Refroidissement](04-cooling.md).
- **Adaptateur de ventilateur 120 mm :** `BC250_FanAdapter_120mm.step` ([src](https://t.me/c/2424231195/83135)), `cooler adapter v3.0 (1).stl` ([src](https://t.me/c/2424231195/111091))
- **Modèles de carte précis** (concevez votre propre boîtier autour de ceux-ci) : [Printables 1341336 — carte BC-250 précise](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) ([src](https://t.me/c/2424231195/55496)), [Printables 1103626 — carte AMD BC250](https://www.printables.com/model/1103626-amd-bc250-board)

---

## Tableau du catalogue

Les fichiers marqués *(chat)* sont mis en miroir sous `assets/stl/` ; tout le reste se télécharge depuis la page Printables / MakerWorld / GitHub liée.

| Boîtier / pièce | Type | STL / fichiers source | Ventilateurs | Téléchargement |
|---|---|---|---|---|
| **onemorecap cooling sleeve** | manchon minimal | `BC-250-FanSleeves.3mf` *(chat)* | 1× 120 | [GitHub onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) |
| **onemorecap Shell Case** ⭐ | coque ouverte | `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl` *(chat)* | 1–2× 120 / 1× 140 | [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [GitHub](https://github.com/onemorecap/bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case) |
| **Acrylic open frame** (Владислав) | châssis ouvert | supports imprimés *(chat #114651)* | 1× 120 | [fil Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) |
| **"Просто лучший корпус"** (Jack Fisher × B1zon) | console | `BC250 korpus исправленный.rar` *(chat)* | 120 + répartiteur PWM | [chat #79989](https://t.me/c/2424231195/79989) |
| **Minimal case for Flex PSU** | petite boîte | `minimal-case-...-model_files.zip` *(chat)* | 1× 120 | [Printables 1423572](https://www.printables.com/model/1423572-minimal-case-for-bc250-and-flex-psu) |
| **forgenam case** | console | `forgenam-case-bc250-model_files.zip` *(chat)* | 1× 120 | [Printables 1375929](https://www.printables.com/model/1375929-forgenam-case-bc250) |
| **Minimalist 240** | console + poignée | `Minimalist 240 Front/Back/Handle.stl` *(chat)* | 120 | [chat #117404](https://t.me/c/2424231195/117404) |
| **M360** | console | `M360 Front.stl`, `M360 Back.stl` *(chat)* | 120 | [chat #126566](https://t.me/c/2424231195/126566) |
| **NexGen3D DIY Steam Machine** ⭐ | console | fichiers Printables | 1× 120 | [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) |
| **NexGen3D Pro (liquide)** | console + AIO | fichiers Printables | 120 AIO | [Printables 1614131](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) |
| **NexGen3D Redux (+écran)** | console + écran 1080×480 | fichiers Printables | 1× 120 | [Printables 1649679](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) |
| **NexGen3D AIO mount** | adaptateur | fichiers Printables | 120 AIO | [Printables 1554003](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250) |
| **Case v3 — HP server PSU** | console + HDD/USB | fichiers Printables | 120 | [Printables 1580750](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) |
| **Case v4 — FlexATX / HP PSU** | console | fichiers MakerWorld | 120 | [MakerWorld 2481620](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) |
| **ATX-PSU Bazzite Box** | boîte full-ATX | fichiers Printables | 120 | [Printables 1550729](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box) |
| **ivanov-innokentii case** | console | sources GitHub | 120 | [GitHub ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) |
| **rLapchynski enclosure** | boîtier | sources GitHub | 120 | [GitHub rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure) |
| **BC-250 Scooper** | carénage/scoop | fichiers Printables | 120 | [Printables 1282906](https://www.printables.com/model/1282906-bc-250-scooper) |
| **Pitman case** | console | fichiers Printables | 120 | [Printables 1570248](https://www.printables.com/model/1570248-amd-bc-250-pitman-case) |
| **Industrial-style FlexATX** | console | `amd_bc_250_industrial_style_case...zip` *(chat)* | 120 (sans refroidisseur d'origine) | [chat #144265](https://t.me/c/2424231195/144265) |
| **The Lanboy** | arcade portable + écran eDP 16″ | fichiers Printables | breakout ATX 12 V | [Printables 1746364](https://www.printables.com/model/1746364) |
| **BC250 Vented Edition** (MaelremremDotXYZ) | console FlexATX, ailettes ouvertes | fichiers MakerWorld | 120 | [MakerWorld 2899020](https://makerworld.com/en/models/2899020) |
| **Stellar 250** (isaacalvex) | console + guide de montage (WiFi6, ESP32) | guide GitHub | 120 | [GitHub isaacalvex/...Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide) |
| **Simple Case for the ASRock AMD BC-250** | console | fichiers MakerWorld | 120 | [MakerWorld 2870270](https://makerworld.com/en/models/2870270) |
| **BC250-HUD** (Bloodyly) | écran de statut interne Pi Zero 2 | sources GitHub | — | [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD) |
| **Generic ITX mount** (majzok) | adaptateur (tout boîtier ITX) | cherchez Printables/MakerWorld | — | "BC-250 ITX Mount" |
| **Thermalright AXP90/AXP120 mount** | adaptateur refroidisseur bas profil | fichiers Printables | tour bas profil | [Printables 1694793](https://www.printables.com/model/1694793) |
| **Twin-120 mount plate** | plaque adaptatrice | `Twin_120mm_Fan_Shroud.stl` *(chat)* | 2× 120 | [chat #121684](https://t.me/c/2424231195/121684) |
| **Fan shrouds (120/140)** | carénage | `Fan_Shroud_Single_120mm.stl`, `_Dual_120mm`, `_Single_140mm`, `_120mm_Restricted` *(chat)* | 120 / 140 | [Printables 1339540](https://www.printables.com/model/1339540-yet-another-bc-250-fan-shroud) · voir [Refroidissement](04-cooling.md) |
| **AM4 cooler adapter** | support | `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` *(chat)* | tour/AIO | [Printables 1042228](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount) |
| **Accurate board model** | CAO de référence | `bc-250-body.step` *(chat)* | — | [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) |

⭐ = le plus de réactions positives / le plus republié dans la communauté.

### Plus de modèles publics (issus du catalogue d'elektricM)

Des modèles nommés et téléchargeables issus du [catalogue de 143 modèles d'elektricM](https://elektricm.github.io/amd-bc250-docs/community/cases/) qui ne sont pas listés ci-dessus — regroupés selon l'alimentation autour de laquelle ils sont conçus. Parcourez le catalogue complet pour les builds Discord-only/WIP et les vignettes.

**MeanWell LOP (alimentation interne) :**

| Boîtier / pièce | À noter | Téléchargement |
|---|---|---|
| **Steamboat Case** (yannichaboyer) | console LOP-300 | [MakerWorld 2431616](https://makerworld.com/en/models/2431616) |
| **Ultra-Thin Custom Case** (MrRoze) | LOP-300 slim | [Printables 1626501](https://www.printables.com/model/1626501) |
| **Internal PSU 2×140 mm** (Kacikor) | LOP-400, deux 140 | [Printables 1599644](https://www.printables.com/model/1599644) · [MakerWorld 2400574](https://makerworld.com/en/models/2400574) |
| **Push-Pull Internal 12V PSU** (penzoiders) | push-pull | [MakerWorld 2505974](https://makerworld.com/en/models/2505974) |
| **Shell Case + 40 mm SSD fan** (Munkee915) | remix Shell, refroidissement SSD | [Printables 1568074](https://www.printables.com/model/1568074) |
| **Noctua Push-Pull Mod** (Janjd) | remix Shell | [MakerWorld 2354123](https://makerworld.com/en/models/2354123) |

**MeanWell LRS/UHP (l'autre bloc serveur courant) :**

| Boîtier / pièce | À noter | Téléchargement |
|---|---|---|
| **LRS-350-12 PSU Case** (TARGZ) | boîte LRS-350 | [Printables 1543979](https://www.printables.com/model/1543979) |
| **BC250 slim case** (C4kew4lk) | UHP-350-12, slim | [Printables 1504664](https://www.printables.com/model/1504664) |

**FlexATX — famille Arthrimus « Console Style »** (toute une lignée de remix ; la console slim est un incontournable de la communauté) :

| Boîtier / pièce | À noter | Téléchargement |
|---|---|---|
| **Console Style Case v1** (Arthrimus) | l'original | [Thingiverse 7165679](https://www.thingiverse.com/thing:7165679) · [MakerWorld 2097988](https://makerworld.com/ko/models/2097988-bc250) |
| **Slim Console Style Case** (Arthrimus) | variante slim | [Thingiverse 7172528](https://www.thingiverse.com/thing:7172528) |
| **Slim Console — double-fan mod** (TKXXTH) | double ventilateur | [Thingiverse 7214884](https://www.thingiverse.com/thing:7214884) |
| **Slim Console — On/Off + Apevia** | interrupteur d'alimentation | [Thingiverse 7274042](https://www.thingiverse.com/thing:7274042) |

**FlexATX — autres :**

| Boîtier / pièce | À noter | Téléchargement |
|---|---|---|
| **Minimal Case (Toolless)** (chriszf) | sans vis | [Printables 1423572](https://www.printables.com/model/1423572) |
| **Minimalist BC-250 Case** (SebastienGau/Gadget) | minimaliste | [Printables 1581724](https://www.printables.com/model/1581724) |
| **ADT UT3G eGPU-Inspired** (R0mn) | look eGPU | [Printables 1539301](https://www.printables.com/model/1539301) |
| **"Steam Machine" by MrLarva** | console | [Printables 1618501](https://www.printables.com/model/1618501) · [MakerWorld 2453965](https://makerworld.com/en/models/2453965) · [Thingiverse 7278235](https://www.thingiverse.com/thing:7278235) |
| **Steam Machine** (Pocket Adventures) | console | [MakerWorld 2350219](https://makerworld.com/en/models/2350219) |
| **Steam Machine Slim Console** (MTSquar3D) | slim + kit ventilateur vRAM OC | [MakerWorld 2232434](https://makerworld.com/en/models/2232434) · [Thingiverse 7271946](https://www.thingiverse.com/thing:7271946) |
| **ASRock Console Case** (songdawgdesigns) | console | [Printables 1617023](https://www.printables.com/model/1617023) · [Cults3D](https://cults3d.com/en/3d-model/gadget/asrock-amd-bc-250-console-case-steamos-bazzite-diy-steam-machine-style-build) |
| **AMD BC250 Case** (vitamins) | console | [MakerWorld 2219947](https://makerworld.com/en/models/2219947) |
| **E-waste Steam Machine** (Pesen333) | build de récupération | [Thingiverse 7245584](https://www.thingiverse.com/thing:7245584) |

**Full ATX :**

| Boîtier / pièce | À noter | Téléchargement |
|---|---|---|
| **Case for Standard ATX** (CatSiewDai) | boîte ATX | [Printables 1553599](https://www.printables.com/model/1553599) |
| **ATX + Fan Duct** (ZMASLO) | avec conduit | [Printables 1616167](https://www.printables.com/model/1616167) |
| **Dual Fan ATX Case** (Mateo Fdez) | double ventilateur | [Printables 1579658](https://www.printables.com/model/1579658) |
| **Simple Wooden Case** (suvalle55) | bois + ATX | [Printables 1595794](https://www.printables.com/model/1595794) |
| **Open Frame + IKEA hack** (GreatApo) | châssis ouvert | [Thingiverse 7314188](https://www.thingiverse.com/thing:7314188) |
| **Case for ATX PSU** (matmiak) | boîte ATX | [Thingiverse 7303096](https://www.thingiverse.com/thing:7303096) |

**TFX / VESA / prêt à l'emploi :**

| Boîtier / pièce | À noter | Téléchargement |
|---|---|---|
| **Case Remix for TFX** (PlayNation) | alimentation TFX-400 | [MakerWorld 2387157](https://makerworld.com/en/models/2387157) |
| **VESA 100/75 Basket** (Oleksii) | fixation derrière un moniteur | [MakerWorld 1844470](https://makerworld.com/en/models/1844470) |
| **3.9L MKII FlexATX + PS5 fan** (FitFormSolutions) | acheter un kit fini | [Etsy](https://www.etsy.com/listing/4405362103/) · [eBay](https://www.ebay.com/itm/127460591552) |
| **Shiny Snake S400** (ITX en grille de 10.8 L) | hôte prêt à l'emploi éprouvé (support BC-250→AM4 + AIO H60 dans la baie d'alimentation + cache I/O ATX personnalisé) | [AliExpress](https://a.aliexpress.com/_EyQdoBU) |
| **SFX-PSU minimalist case** (Methsman) | alimentation SFX complète, panneaux aimantés, hub USB, AXP120 + Noctua 120 — *fichiers WIP / pas encore publiés* | — |
| **Cults3D ATX/server line** (KABANCHYK, lumstudio, kapa3D) | STL payants | [Cults3D — bc-250](https://cults3d.com/en/3d-model/gadget/bc-250-atx-case) |

---

## Pas d'imprimante ? Les options que les gens utilisent

- **Acheter une impression.** Des vendeurs existent sur [Etsy](https://www.etsy.com/listing/1904632447/), eBay et OLX ; des gens ont aussi proposé d'imprimer/vendre des boîtiers dans le chat ([src](https://t.me/c/2424231195/55507)).
- **Impression à la demande :** téléversez un STL vers un service. Des builders du chat font tourner des fermes d'impression (l'un montre un mur d'imprimantes Flsun/Creality/Bambu, [src](https://t.me/c/2424231195/73481)).
- **Pas de boîtier du tout / détournement.** Beaucoup font tourner la carte sur un banc ouvert pendant les tests. D'autres vident du matériel existant : un vieux PC tout-en-un avec la carte implantée et un ventilateur centrifuge ([src](https://t.me/c/2424231195/30914)), une boîte de conduit de ventilation ([src](https://t.me/c/2424231195/64265)), ou des boîtiers d'amplificateur en aluminium (nécessite limage/perçage, [src](https://t.me/c/2424231195/108907)). Un membre a même caché la carte dans un vieux magnétoscope VHS pour la blague ([src](https://t.me/c/2424231195/84106)). **Coque Xbox One** (JoeyDepDollas) : videz une Xbox One cassée et installez-y un build BC-250 complet — garde le CPU et le GPU sous **60 °C** en charge ; les consoles donneuses cassées coûtent **~15 $ port compris** sur eBay et fournissent des pièces réutilisables.
- **Contreplaqué découpé au laser** (ContributionRich3242) : non imprimé en 3D — contreplaqué cintré par kerf autour des coins avec une grande zone arrière pour un refroidissement supplémentaire, atteignant **75 °C à 40 CU** (1800 MHz, CPU 3.9 GHz) et silencieux comme un murmure. (Les fichiers laser n'ont pas été publiés.) Sa **technique de refroidissement par la plaque arrière** est réutilisable sur n'importe quel boîtier : pâte thermique sur la puce→plaque arrière, pâte plaque arrière→refroidisseurs arrière, et fixez les refroidisseurs arrière avec des goupilles fendues type R serrées dans l'espace VRM + ruban Kapton (~20 °C plus frais à 40 CU).

> Une carte nue bien refroidie surpasse une jolie boîte scellée au flux d'air médiocre. Réglez d'abord le [Refroidissement](04-cooling.md) ; le boîtier est la seconde étape.

---

## Sources

- Vitrine sélectionnée **#BC250body** (un bon build par jour) — idée épinglée [src](https://t.me/c/2424231195/79685)
- Manchon minimal, deux variantes — [src](https://t.me/c/2424231195/10743) · modèles sur [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) [src](https://t.me/c/2424231195/18260)
- Shell Case (❤33) — [src](https://t.me/c/2424231195/22771) · gratuit sur Printables/MakerWorld [src](https://t.me/c/2424231195/24505) · lot STL [src](https://t.me/c/2424231195/81680)
- "Просто лучший корпус" + nomenclature — [src](https://t.me/c/2424231195/79990) · fichiers [src](https://t.me/c/2424231195/79989)
- Châssis ouvert en acrylique — [src](https://t.me/c/2424231195/114651) · [Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/)
- Plaque de montage Twin-120, 2200 MHz @ 80 °C — [src](https://t.me/c/2424231195/120606) · carénage [src](https://t.me/c/2424231195/121684)
- Modèles de console (photos) — Гослинг/Bazzite [src](https://t.me/c/2424231195/66616) · Jhonatan panneau labyrinthe [src](https://t.me/c/2424231195/121274) · Joglik grille quadrillée [src](https://t.me/c/2424231195/126525) · a m fenêtre ovale [src](https://t.me/c/2424231195/52955) · Spyrydonov v15 [src](https://t.me/c/2424231195/135995)
- Famille NexGen3D Steam Machine — [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) · [Redux + écran Pi (Reddit)](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)
- Modèle de carte de référence — [src](https://t.me/c/2424231195/55496) · [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)
- Dépôts GitHub de boîtiers — [onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) · [rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure)
- **Catalogue complet de boîtiers d'elektricM (~143 modèles, consultable/filtrable)** — [elektricm.github.io/amd-bc250-docs/community/cases](https://elektricm.github.io/amd-bc250-docs/community/cases/)
- Simple Case (MakerWorld 2870270) + tutoriel de montage ukrainien — [MakerWorld 2870270](https://makerworld.com/en/models/2870270) · [Old Lamer (YouTube)](https://youtu.be/p5Zd86vFe8w)
- Astuce du trou d'accès à la réinitialisation CMOS — [4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980)
- Nomenclature du build "Steam Machine Pro" refroidi par liquide (TEUCER AF 240, Mean Well LOP-600-12, Arctic P12 Pro/P8, relais ESP32, OpenLinkHub/Commander Duo) — [Old Lamer (YouTube)](https://youtu.be/afYhUQFa-AY)

> Les STL de carénage de ventilateur sont partagés avec [Refroidissement](04-cooling.md). Tous les fichiers STL/STEP/3MF hébergés sur le chat sont mis en miroir sous `assets/stl/`.
