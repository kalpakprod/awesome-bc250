> 🌐 Traduction communautaire. La [version anglaise](../en/faq.md) fait foi et peut être plus à jour. Une erreur ? [Ouvrez une issue](https://github.com/lildebil0/awesome-bc250/issues).

# FAQ

> **En bref** — Les questions que posent les débutants la première semaine, avec des réponses courtes et correctes et un lien vers la section complète pour chacune. Si une réponse vous paraît trop courte, c'est volontaire — la profondeur se trouve dans la page du manuel liée.

Ceci est une référence rapide. Pour le parcours guidé « carte dans un carton → jeux qui tournent », commencez à [00-start-here.md](00-start-here.md).

---

## Matériel et ce que j'ai acheté

**Qu'est-ce que le BC-250, au juste ?**
Un APU dérivé de la PlayStation 5 (AMD **Cyan Skillfish** / Oberon) sur une carte de minage crypto/serveur : **CPU Zen 2 6 cœurs/12 threads + GPU RDNA 2 24 CU + 16 Go de GDDR6 soudée**. Ce n'est pas une carte graphique ni un PC normal — pas de slot PCIe, pas d'ATX 24 broches, pas de BIOS familier. Voir [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Est-ce prêt à l'emploi ? Aurais-je dû l'acheter ?**
Non. Il faut bidouiller les pilotes, un mod de refroidissement et une alimentation étrange — c'est une carte de bricoleur. La phrase d'un vétéran : ça « demande certaines compétences, des efforts et de la jugeote ». Si vous voulez zéro tracas, renvoyez-le ; si vous aimez les projets, c'est la machine Linux de jeu / IA locale la moins chère de cette catégorie. Voir [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Puis-je ajouter de la RAM ?**
Non. Les 16 Go de GDDR6 sont soudés et partagés entre le CPU et le GPU ; il n'y a pas de slots DIMM. Vous choisissez seulement quelle part du pool le GPU réserve (UMA), réglée dans un BIOS moddé. Voir [01-what-is-bc250.md](../en/01-what-is-bc250.md) et [08-bios.md](../en/08-bios.md).

**A-t-il un bouton d'alimentation ?**
Non. Il s'allume à l'instant où le 12 V arrive — l'interrupteur de l'alimentation est votre bouton de démarrage. Voir [03-power-supply.md](../en/03-power-supply.md).

**Ma carte ne POST pas / écran noir dès la sortie du carton — morte ?**
Souvent non. Beaucoup de cartes arrivent en nécessitant un **reset BIOS/CMOS** avant de POSTer, et certaines arrivent légèrement **voilées** à cause du montage du dissipateur — un propriétaire a réglé un non-démarrage en calant la carte à plat avec du papier. Essayez ça avant de la déclarer morte. Voir [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Peut-il enregistrer/streamer des jeux avec le GPU ?**
Pas en matériel. Le bloc d'encodage vidéo (VCN) est indisponible, donc OBS/le streaming se rabat sur un **encodeur logiciel (CPU)** — ça marche (les gens utilisent Sunshine/Moonlight) mais ça coûte du CPU et de la qualité. Voir [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Quelles épaisseurs de pads thermiques pour le mod de la plaque arrière ?**
Rapportées par la communauté : **mémoire 2 mm, chipset 1,5 mm** ([src](https://t.me/c/2424231195/22442)). La GDDR6 à l'arrière n'a pas de capteur de température, donc vous la refroidissez à l'aveugle. Voir [04-cooling.md](../en/04-cooling.md).

## Alimentation

**De quelle alimentation ai-je besoin ?**
Une source **12 V à rail unique** délivrant **≥300 W** dans un connecteur **PCIe 8 broches (6+2)**. Trois voies courantes : une alimentation ATX/SFX normale (branchez simplement son câble PCIe — le plus facile), une alimentation serveur HP Flex 500 W d'occasion bon marché, ou une brique industrielle Mean Well. Voir [03-power-supply.md](../en/03-power-supply.md).

**Puis-je utiliser le 8 broches CPU/EPS de mon alimentation ?**
**Non — ça peut griller la carte.** Les 8 broches PCIe et CPU/EPS se ressemblent presque mais ont une **polarité inversée**. La carte n'a aucune vérification ; utilisez le câble **PCIe**, et contrôlez au multimètre en cas de doute. Voir [03-power-supply.md](../en/03-power-supply.md).

**Ma vieille alimentation 750 W a largement assez de watts — pourquoi peine-t-elle ?**
Les anciennes unités **répartissent souvent le 12 V sur plusieurs rails faibles**, et aucun rail seul ne couvre les ~235 W que tire la carte. Préférez une alimentation moderne à rail unique / DC-DC, ou une avec une grosse marge. Voir [03-power-supply.md](../en/03-power-supply.md).

**Mon câble d'alimentation a chauffé / a fumé. Pourquoi ?**
Presque certainement du **faux cuivre** — du fil en acier cuivré ou en aluminium, qui a plusieurs fois la résistance du vrai cuivre et surchauffe sous charge (le splitter PCIe préfabriqué d'un membre a littéralement fumé) ([src](https://t.me/c/2424231195/97202)). Testez à l'aimant : il colle à l'acier, pas au cuivre. Utilisez du vrai cuivre, **16 AWG ou plus épais**. Voir [03-power-supply.md](../en/03-power-supply.md).

## Refroidissement

**Pourquoi surchauffe-t-il / throttle-t-il dès la sortie du carton ?**
Le dissipateur d'origine est **passif**, conçu pour le tunnel d'air forcé d'un rack de minage. Sur un bureau sans circulation d'air, il accumule la chaleur et throttle. Le throttling démarre vers **85 °C**, le reset brutal vers **90 °C**. Voir [04-cooling.md](../en/04-cooling.md).

**Quelle est la correction de refroidissement la moins chère qui marche vraiment ?**
**Affinez les ailettes d'origine très denses** (la ponceuse orbitale est la plus rapide) et boulonnez un **ventilateur 120 mm haute pression statique** qui souffle au travers via un carénage imprimé. Résultats de référence : Noctua NF-P12 → ~73 °C Furmark, 63–65 °C en jeu ([src](https://t.me/c/2424231195/42843)) ; l'Arctic P12 Max tient ~75 °C ([src](https://t.me/c/2424231195/58869)). Voir [04-cooling.md](../en/04-cooling.md).

**Pourquoi un ventilateur haute pression statique et pas un « ventilateur de boîtier » à haut débit d'air ?**
Les ailettes denses sont une charge à forte résistance — un ventilateur de boîtier à haut débit cale simplement contre elles, alors qu'un ventilateur haute pression statique (Noctua/Arctic P12) pousse vraiment l'air *au travers*. Pour des ailettes très denses, deux ventilateurs en **push–pull (série)**, pas côte à côte. Voir [04-cooling.md](../en/04-cooling.md).

**Comment savoir si mon refroidissement est suffisant ?**
Sollicitez le **GPU et le CPU ensemble** (ils partagent un seul dissipateur) — Furmark VK plus une charge CPU — **sous votre overclock** (2000 MHz, pas les fréquences d'origine), et gardez la charge sous ~85 °C. Il y a une procédure de test épinglée. Voir [04-cooling.md](../en/04-cooling.md).

## Linux

**Quelle distro installer ?**
Pour « juste jouer », flashez **Bazzite** et rebasez vers l'image **`bazzite-bc250`** — les correctifs GPU y sont intégrés. Pour apprendre la machine : **Fedora** (COPR + script d'installation) ou **CachyOS/EndeavourOS** (Arch). Voir [06-linux.md](../en/06-linux.md).

**J'ai installé Linux et tout est lent / FPS à un chiffre. Pourquoi ?**
Le GPU n'est pas accéléré — vous êtes en rendu logiciel (LLVMpipe). Il vous faut un **Mesa récent (25.1+)**, le **lien symbolique du firmware `cyan_skillfish`** (ou un paquet patché), et les bons paramètres noyau. Confirmez avec `vulkaninfo | grep deviceName` (il ne doit *pas* indiquer `llvmpipe`). Voir [06-linux.md](../en/06-linux.md).

**Écran noir après une mise à jour du noyau — comment corriger ?**
Sur la plupart des distros, la correction est le lien symbolique du firmware pour qu'amdgpu puisse se charger :
```bash
sudo ln -s /lib/firmware/amdgpu/navi10_gpu_info.bin.zst \
           /lib/firmware/amdgpu/cyan_skillfish_gpu_info.bin.zst
```
Cela survit aux mises à jour du noyau (mais **pas** sur Bazzite, et une mise à jour du firmware/amdgpu peut l'effacer) ([src](https://t.me/c/2424231195/98882)). Sinon, démarrez un noyau plus ancien/LTS et verrouillez la version du mauvais. Voir [06-linux.md](../en/06-linux.md).

**Dois-je installer les applis en Flatpak ?**
Évitez-les pour tout ce qui est graphique. Les Flatpaks embarquent leur **propre Mesa**, qui prend le pas sur celui patché de la carte, donc ils tournent **sans accélération matérielle**. PortProton, par exemple, doit être installé via le terminal, pas en Flatpak ([src](https://t.me/c/2424231195/17949), [src](https://t.me/c/2424231195/47092)). Voir [06-linux.md](../en/06-linux.md).

**Mon CPU semble faible — des gains rapides ?**
Deux ajustements noyau : **`mitigations=off`** (désactive les mitigations de vulnérabilités CPU) ([src](https://t.me/c/2424231195/23359)) et **`nosmt=force`** (désactive le SMT — +15–25 % de FPS dans les jeux peu multithreadés, mais nuit au multitâche lourd comme OBS à haut débit) ([src](https://t.me/c/2424231195/61332)). Les deux sont des compromis sécurité/débit. Voir [06-linux.md](../en/06-linux.md).

**GNOME/KDE sur Wayland a des glitchs — que faire ?**
Problème connu. Les membres rapportent que les sessions Wayland (typiquement GNOME/KDE) se comportent mal sur cette carte ; **utilisez la session X11** à la place ([src](https://t.me/c/2424231195/19623)). Voir [06-linux.md](../en/06-linux.md).

**Ma RAM se remplit vite — puis-je avoir plus de swap ?**
Oui, agrandissez le swap **zRAM** (swap en RAM compressée) — la recette de la communauté le pousse à 32 Go et le rend persistant dans `/etc/systemd/zram-generator.conf` ([src](https://t.me/c/2424231195/38703)). Ça n'ajoute pas de mémoire réelle mais absorbe les pics. Voir [06-linux.md](../en/06-linux.md).

**Une mise à jour du noyau a tout cassé — comment revenir en arrière ?**
Le système conserve les derniers noyaux. Sur Fedora, listez-les avec `grubby` et `grubby --set-default /boot/vmlinuz-…`, puis redémarrez ([src](https://t.me/c/2424231195/39393)). En cas de doute, utilisez un **noyau LTS**. Voir [06-linux.md](../en/06-linux.md).

## Windows

**Y a-t-il déjà un pilote Windows ?**
Non — début 2026, il n'y a **aucun pilote GPU Windows fonctionnel**. Windows démarre mais le GPU reste en **Code 43** sans 3D. Deux efforts de rétro-ingénierie partis de zéro existent (Keshas-dev, ZEROAESQUERDA) mais ils en sont au stade « le GPU peut-il s'initialiser du tout », pas au jeu. Voir [07-windows.md](../en/07-windows.md).

**Ne puis-je pas juste forcer l'installation d'un pilote RX 6700 / W5700 ?**
Non. Chaque `.inf` officiel (y compris le W5700 que Windows propose comme « compatible ») s'installe puis se fige sur le Code 43 — l'identifiant de périphérique `1002:13FE` est soudé à l'APU. C'est la première idée de chaque débutant et elle ne peut pas marcher. Voir [07-windows.md](../en/07-windows.md).

**Et une VM Windows avec passthrough GPU ?**
Ça ne marche pas — le passthrough IOMMU est cassé sur cette carte, c'est un APU (pas une carte dédiée propre à transmettre), et la puce est de toute façon mal détectée. Voir [07-windows.md](../en/07-windows.md).

**J'ai vu un « pilote NVIDIA pour BC-250 » / un `…bc250.exe` — réel ?**
Non. Le « pilote NVIDIA » était un **poisson d'avril**, et un installateur Adrenalin avec « bc250 » collé au nom de fichier reste juste un installateur Adrenalin normal. N'exécutez que des binaires des dépôts GitHub nommés, et lisez le code — de faux « pilotes » ont été des malwares. Voir [07-windows.md](../en/07-windows.md).

## BIOS et récupération

**Dois-je flasher un BIOS moddé ?**
Seulement si vous voulez débloquer overclock/timings/VRAM-iGPU **et** que vous avez du matériel de récupération prêt. Un mauvais réglage peut **bricker la carte définitivement**, et sur cette carte un **effacement CMOS ne la récupère pas toujours**. Utilisez le mod actuel basé sur 5.00, vérifiez le SHA-256, et ne désactivez jamais l'Integrated Graphics (c'est votre seul affichage). Voir [08-bios.md](../en/08-bios.md).

**Je l'ai brickée — puis-je la débricker ?**
Généralement oui, mais seulement avec du matériel : un **programmateur SPI de classe CH341A** câblé au **connecteur J4004** de la carte (le clip SOIC ne marche *pas* ici) pour reflasher la puce de 16 Mo. Attention au piège de la ligne de données 3,3 V du CH341A. Voir [08-bios.md](../en/08-bios.md).

**J'ai changé la répartition VRAM mais l'OS affiche toujours l'ancienne valeur.**
**Effacez le CMOS** après avoir flashé/changé l'UMA — retirez la CR2032 60+ s ou court-circuitez le cavalier CMOS. Certains réglages (notamment VRAM/UMA) ne s'appliquent pas tant que vous ne le faites pas ([src](https://t.me/c/2424231195/97290)). Voir [08-bios.md](../en/08-bios.md).

## Overclock et undervolt

**Comment overclocker ? Est-ce que ça vaut le coup ?**
Lancez un **governor** (la plupart des builds utilisent **oberon-governor**) et montez le GPU vers **2000 MHz** (~+30 % de FPS *quand on est GPU-bound*). Le plus récent `bc250_smu_oc` overclocke aussi le CPU (~4 GHz @ 1275 mV). **Refroidissez la carte d'abord** — un OC au-dessus de ~90 °C la reset. Voir [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**C'est quoi le déblocage des 40 CU ?**
La puce a physiquement **40 CU** mais le firmware n'en laisse que **24** actifs. Un amdgpu patché + `amdgpu.bc250_cc_write_mode=3` réactive les 40 — un gain GPU plus gros que les fréquences (un run Superposition est passé de 4647 à 6863). Il faut reconstruire le module noyau et c'est réservé à Linux. Voir [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**Quelle tension régler ?**
Chaque puce diffère (loterie du silicium). Points courants stables en jeu : **2000 MHz ≈ 955 mV** (~75 °C). Validez dans de **vrais jeux + alt-tab/menus**, pas seulement Furmark, qui masque l'instabilité. Limite CPU dure : **ne jamais dépasser 1,325 V de Vid**. Voir [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**Un undervolt trop agressif est-il dangereux ?**
Non — au pire la carte décroche ou désactive le slot M.2, et ça se rétablit en quelques secondes car l'OC n'est pas stocké dans le BIOS. C'est le *sur-voltage* du CPU qui est la direction dangereuse. Voir [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

## Affichage, WiFi et Bluetooth

**Pas d'image en HDMI ?**
La carte sort en **DisplayPort** ; pour HDMI/TV, utilisez un **adaptateur ou câble DP→HDMI** (un bon fonctionne aussi dans le BIOS et fait de la 4K) ([src](https://t.me/c/2424231195/24107)). Préférez un vrai **câble DP→HDMI** à un adaptateur passif bon marché — un mauvais adaptateur a causé des écrans noirs chez un membre ([src](https://t.me/c/2424231195/96416)).

**L'audio en DisplayPort est déformé.**
Problème connu sous Linux. La correction simple est de sortir via un adaptateur **DP→HDMI**, qui transporte un audio propre ([src](https://t.me/c/2424231195/17953)). Voir [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**A-t-il du WiFi/Bluetooth ?**
Pas de sans-fil intégré — il vous faut un **dongle USB**, choisi par **chipset, pas par marque**. Le mieux documenté est une clé **aic8800d80** ; les clés Realtek RTL8821/8822 bon marché fonctionnent avec `lwfinger/rtw88` mais décrochent sous charge. Pour la configuration, un adaptateur USB-Ethernet filaire contourne tout le problème. Voir [10-wifi-bt.md](../en/10-wifi-bt.md).

**Mon dongle WiFi se déconnecte sans cesse.**
Symptôme classique de Realtek-sur-BC-250 : installez le bon pilote hors-arbre (rtw88 / rtl8831), essayez un port USB à l'arrière, et réinitialisez avec `usbreset` plutôt qu'en débranchant. Si la fiabilité compte plus que le prix, passez à l'aic8800d80 ou à une clé Digma confirmée. Voir [10-wifi-bt.md](../en/10-wifi-bt.md).

## Jeu et IA

**Quels FPS puis-je espérer ?**
À un vrai OC **2000 MHz** : AAA moderne à **40–60 FPS**, jeux plus légers/anciens au-delà de 60. Le mieux en **1080p–1440p** avec FSR. La carte est généralement **CPU-bound**, donc la résolution est souvent « gratuite » mais les jeux à physique lourde/mal multithreadés saccadent quoi qu'il arrive. Voir [11-gaming.md](../en/11-gaming.md).

**Quels jeux tournent le mieux ?**
**Les portages PlayStation first-party** (God of War, Horizon, The Last of Us, Spider-Man, Ghost of Tsushima) — ils s'appuient sur le GPU et sont bien optimisés. Émulation : Switch (Eden) et PS4 (shadPS4) sont solides ; Xbox 360 (Xenia) ne l'est pas. Voir [11-gaming.md](../en/11-gaming.md).

**Pourquoi mon GPU est à ~40 % de charge mais le FPS est bas ?**
Vous êtes **CPU-bound** — le Zen 2 6 cœurs est le goulot d'étranglement, pas le GPU. L'upscaling ne fera pas beaucoup monter le FPS dans ce cas ; essayez `nosmt=force`/`mitigations=off` et acceptez que certains titres soient limités par le CPU. Voir [11-gaming.md](../en/11-gaming.md).

**Puis-je faire tourner des LLM / de l'IA en local dessus ?**
Oui — les 16 Go de GDDR6 logent des modèles de taille moyenne via `llama.cpp`/Jan sur le backend **Vulkan** ; réglez d'abord le BIOS pour allouer ~12 Go au GPU. Voir [12-ai-llm.md](../en/12-ai-llm.md).

## Achat

**Quel est un prix juste, et où acheter ?**
Les prix et les sources évoluent vite et sont spécifiques à la région (eBay, AliExpress, Ozon/Avito dans la CEI) — les rapports récents se regroupent autour de la centaine de dollars basse à ~13k₽. Voir [02-buying.md](../en/02-buying.md).

**Quels sont les risques à en acheter un ?**
C'est du matériel de minage/serveur d'occasion : les cartes peuvent arriver en nécessitant un reset BIOS, légèrement voilées, ou parfois défectueuses, et il n'y a pas de support vendeur — la communauté est votre support. Prévoyez du temps, pas seulement de l'argent. Voir [01-what-is-bc250.md](../en/01-what-is-bc250.md) et [02-buying.md](../en/02-buying.md).

**Puis-je faire tourner macOS dessus ?**
Non. Le CPU peut démarrer, mais le **GPU n'accélérera jamais** (pas de jumeau supporté à imiter, et aucun iGPU d'APU AMD n'a jamais fonctionné sous macOS). Utilisez Linux. Voir [13-macos.md](../en/13-macos.md).

---

## Sources

- Chat source : *communauté AMD BC-250* (Telegram). La plupart des réponses résument une section complète du manuel — suivez le lien de la section pour les citations sous-jacentes.
- Épaisseurs des pads thermiques — https://t.me/c/2424231195/22442
- Arctic P12 Max ~75 °C — https://t.me/c/2424231195/58869 · Noctua P12 ~73 °C — https://t.me/c/2424231195/42843
- Correctif du lien symbolique firmware écran-noir-après-noyau (pas Bazzite) — https://t.me/c/2424231195/98882
- Flatpak casse l'accélération matérielle — https://t.me/c/2424231195/17949 · PortProton via terminal — https://t.me/c/2424231195/47092
- `mitigations=off` pour CPU faible — https://t.me/c/2424231195/23359 · gain FPS `nosmt=force` — https://t.me/c/2424231195/61332
- Glitchs Wayland, utiliser X11 — https://t.me/c/2424231195/19623
- Augmentation du swap zRAM — https://t.me/c/2424231195/38703 · sélection/rollback du noyau — https://t.me/c/2424231195/39393
- Splitter d'alimentation surchauffé/fumant (faux cuivre) — https://t.me/c/2424231195/97202
- Effacement CMOS nécessaire après changement de VRAM — https://t.me/c/2424231195/97290
- Adaptateur DP→HDMI (4K/TV, marche dans le BIOS) — https://t.me/c/2424231195/24107 · mauvais adaptateur → écran noir — https://t.me/c/2424231195/96416 · correctif distorsion audio DP — https://t.me/c/2424231195/17953

> Cette FAQ est une carte, pas le territoire — chaque réponse pointe vers la section qui porte le détail et les sources primaires. Corrections bienvenues via PR (voir [CONTRIBUTING.md](../../CONTRIBUTING.md)).
