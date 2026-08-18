<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — la bible du débutant pour l'AMD BC-250" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> La bible du débutant pour l'**ASRock AMD BC-250** — une carte APU dérivée de la PlayStation 5 (Cyan Skillfish / Oberon, 6 cœurs Zen 2 + RDNA 2, 16 GB GDDR6) reconvertie en un **mini PC Linux de jeu et d'IA** bon marché — une Steam Machine DIY économique.

Tout ce qu'il faut pour passer **d'une carte dans un carton à des jeux qui tournent** — sélectionné à partir de 130k+ messages de la communauté BC-250, classé selon ce que les gens ont vraiment plébiscité et épinglé, et recoupé avec les dépôts canoniques du projet.

🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · **Français** · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<sub>_Maintenu · dernière mise à jour **août 2026** · [llms.txt](llms.txt) pour les agents IA_</sub>

---

## ❓ Réponses rapides

- **Qu'est-ce que l'ASRock AMD BC-250 ?** Une carte APU dérivée de la PlayStation 5 — 6 cœurs Zen 2 + 24/40 CU RDNA 2 (« Cyan Skillfish »), 16 GB GDDR6 — vendue à bas prix en tant que carte d'ex-minage et reconvertie en un mini PC Linux de jeu et d'IA, une Steam Machine DIY économique.
- **Combien ça coûte ?** Environ **$60–130** pour la carte nue ; un build complet (alimentation, refroidisseur, SSD) revient à environ **$150–250**. Voir [Guide d'achat](docs/fr/02-buying.md).
- **Quelles performances en jeu ?** Environ **1080p 60 FPS** dans la plupart des titres (classe RX 6600) avec FSR / Frame-Gen et un overclock GPU+CPU. Voir [Résultats de jeu](docs/fr/11-gaming.md).
- **Quel OS ?** **Linux uniquement** pour l'accélération GPU — Bazzite, Fedora, CachyOS ou Arch avec Mesa 25.1+. Il n'y a pas de pilote GPU Windows. Voir [Configuration Linux](docs/fr/06-linux.md).
- **Peut-il faire tourner des LLM ?** Oui — llama.cpp / Ollama via Vulkan utilisent les 16 GB GDDR6 comme VRAM (~30–47 tok/s sur les petits modèles). Voir [IA / LLM](docs/fr/12-ai-llm.md).
- **Comment le refroidir ?** Le dissipateur serveur d'origine bride sur un bureau ; affinez les ailettes et ajoutez un ventilateur 120 mm, ou passez au watercooling. Voir [Refroidissement](docs/fr/04-cooling.md).

---

## ⚡ Commencez ici

Carte neuve, vous ne connaissez rien ? Suivez le chemin doré dans l'ordre :

**[docs/fr/00-start-here.md](docs/fr/00-start-here.md)** — Acheter → Alimenter → Refroidir → Installer l'OS → Pilotes → Overclock → Jouer.

---

## 📈 Ce que le réglage vous apporte vraiment

Chaque réglage de cette carte se fait au prix d'un compromis. Voici les quatre qui comptent, tirés de ce que la communauté a mesuré — lisez-les avant de flasher quoi que ce soit.

<p align="center">
  <img src="assets/diagrams/gpu-clock-tradeoff.svg" width="100%" alt="Fréquence du cœur GPU : le gain de FPS monte jusqu'à environ 95% à 2000 MHz puis plafonne car le CPU limite, tandis que la puissance et la chaleur continuent de grimper jusqu'à 95%. Point idéal vers 2000 MHz, environ +30% FPS.">
</p>

<p align="center">
  <img src="assets/diagrams/undervolt-tradeoff.svg" width="100%" alt="Undervolt : l'efficacité monte de 20% à 95% à mesure que la tension descend de 1129 mV à 700 mV, tandis que le risque d'instabilité monte de 15% à 100%. La plage stable en jeu se situe entre environ 905 et 955 mV ; sous 700 mV, le GPU se verrouille à 1500 MHz.">
</p>

<p align="center">
  <img src="assets/diagrams/cu40-tradeoff.svg" width="100%" alt="Déblocage 40 CU : la puissance de calcul monte de 40% à 90% alors que le FPS en jeu ne passe que de 40% à 47%, et la puissance, avec l'instabilité, monte de 25% à 100%. 38 CU est le maximum stable typique ; 40 CU est une loterie qui nécessite plus de 300 W et un AIO.">
</p>

<p align="center">
  <img src="assets/diagrams/memory-tradeoff.svg" width="100%" alt="Réglage de la mémoire GDDR6 : la bande passante et le gain de FPS ne passent que de 30% à 52% tandis que le risque de brick monte de 20% à 100%. C'est à 1950 MHz que les cartes sont revenues brickées.">
</p>

<p align="center">
  <img src="assets/diagrams/power-by-config.svg" width="100%" alt="Consommation secteur mesurée par configuration : 200 W à 38 CU et 1200 MHz sous 850 mV, 260 W à 40 CU et 1800 MHz sous 860 mV, 310 W à 38 CU et 1500 MHz, et 350 W à 40 CU et 2000 MHz sous 960 mV, 1025 mV n'ajoutant que 2 W de plus. Le meilleur point en watts par image signalé est 40 CU à 1800 MHz.">
</p>

Ces cinq points sont des mesures, pas un modèle : passer de 1800 à 2000 MHz coûte environ 90 W — à peu près ce que coûtaient les 600 MHz précédents — et pousser de 960 mV à 1025 mV n'apporte rien d'autre que 2 W de chaleur. À 350 W, une alimentation de 300 W disjoncte en 30 secondes et le rail +12V transporte 26 A.

<details>
<summary>Puissance au repos — pourquoi le wattmètre bouge à peine</summary>

<p align="center">
  <img src="assets/diagrams/idle-power-tradeoff.svg" width="100%" alt="Puissance au repos : la consommation GPU descend de 80 W à 5 W grâce au governor, à l'undervolt et à l'auto-suspend, mais la consommation secteur totale ne descend que de 125 W à 110 W jusqu'à ce que la suspension la fasse tomber à 10 W.">
</p>

Le governor et l'undervolt coupent le GPU, mais le CPU et la GDDR6 continuent de consommer quoi qu'il arrive. Tant que l'auto-suspend ne s'est pas déclenché, le wattmètre ne remarque presque rien. Les lots à forte fuite ont un plancher autour de 70–80 W.

</details>

<sub>Données source : [`assets/diagrams/data.json`](assets/diagrams/data.json) · régénérer avec `node assets/diagrams/build.mjs`</sub>

---

## 📚 Manuel

| # | Section | Pour |
|---|---------|-----|
| 01 | [Qu'est-ce que le BC-250](docs/fr/01-what-is-bc250.md) | specs, dimensions, brochage, attentes |
| 02 | [Guide d'achat](docs/fr/02-buying.md) | où, prix, risques, achats groupés |
| 03 | [Alimentation](docs/fr/03-power-supply.md) | LOP / Flex ATX, brochage 8 broches, câblage |
| 04 | [Refroidissement](docs/fr/04-cooling.md) | dissipateur, carénages de ventilateur, méthode de test |
| 05 | [Boîtiers et impression 3D](docs/fr/05-case.md) | catalogue de boîtiers imprimables (STL) |
| 06 | [Pilotes et configuration Linux](docs/fr/06-linux.md) | choix de la distro, amdgpu, installation |
| 07 | [Pilotes et configuration Windows](docs/fr/07-windows.md) | état des pilotes, mode d'emploi |
| 08 | [BIOS et récupération de brick](docs/fr/08-bios.md) | BIOS moddé, flashage, débrickage |
| 09 | [Overclocking et undervolting](docs/fr/09-overclock-undervolt.md) | governor, SMU, déblocage 40CU |
| 10 | [Dongles WiFi et Bluetooth](docs/fr/10-wifi-bt.md) | dongles qui fonctionnent vraiment |
| 11 | [Résultats et réglages de jeu](docs/fr/11-gaming.md) | benchmarks, réglages par jeu |
| 12 | [IA / LLM sur BC-250](docs/fr/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/fr/13-macos.md) | état |
| 14 | [Affichage et sortie vidéo](docs/fr/14-display.md) | DisplayPort, adaptateurs DP→HDMI, double écran |
| 15 | [Émulation](docs/fr/15-emulation.md) | chaque console/plateforme, état réaliste |
| 16 | [USB, hubs et stockage](docs/fr/16-usb-peripherals.md) | hubs, mod 5V, adaptateurs M.2 / SATA |
| ❓ | [FAQ](docs/fr/faq.md) · [Dépannage](docs/fr/troubleshooting.md) | problèmes courants |

---

## 🔗 Ressources Awesome

Projets communautaires canoniques, classés selon la fréquence à laquelle la communauté les a recommandés.

### Documentation
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) — la référence matérielle principale (rétro-ingénierie)
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [site](https://elektricm.github.io/amd-bc250-docs/) — documentation communautaire complète (brochages, par distro, dépannage)
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — docs de l'organisation
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — builds et scripts

### Overclock / Undervolt / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — le governor que la plupart des builds utilisent (règle fréquences/tension)
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — fork d'oberon-governor avec une interface graphique (Linux)
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [fork bc250-collective](https://github.com/bc250-collective/cyan-skillfish-governor)
- [rw-r-r-0644/bc250-core-unlock](https://github.com/rw-r-r-0644/bc250-core-unlock) — débloque les 2 cœurs CPU désactivés (masque d'origine 0x77 ; un masque 0xB7 signifie des cœurs physiquement défectueux — forcer le déblocage provoque des artefacts et des plantages)
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — débloquer les 40 CU
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Toolkits et images prêtes à l'emploi
- [redbeard1083/bc250-toolkit](https://github.com/redbeard1083/bc250-toolkit) — installation guidée par menu pour CachyOS : noyau, governors CPU/GPU, swap, ZRAM→ZSWAP, réglages ACPI et démarrage
- [62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images](https://github.com/62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images) — images Bazzite Deck/GNOME/KDE préconstruites avec les patchs BC-250 appliqués

### Pilotes
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — pilote GPU Windows (expérimental, pas d'accélération complète début 2026)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — travaux sur le pilote PSP/GPU
- [DryhoppedIPA/bc250-gfx1013-fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix) — patchs noyau + Mesa/RADV pour la file de calcul GPU cassée (async compute) ; corrige aussi le chemin FSR 4 / XeSS 3 INT8
- [MastaG/linux-cachyos-bc250](https://github.com/MastaG/linux-cachyos-bc250) — noyau CachyOS avec les cherry-picks BC-250
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — noyau Linux

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — images et mods de BIOS les plus référencés
- [TheRetroWeb — base de BIOS BC-250](https://theretroweb.com/bios?itemsPerPage=24&chipsetIds%5B%5D=1990) — dumps de BIOS d'origine, parcourir/télécharger par version
- [Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script](https://github.com/Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script) — sauvegarde de firmware et flashage de firmware personnalisé pilotés par menu
- Voir [docs/fr/08-bios.md](docs/fr/08-bios.md) pour le flashage et la récupération de brick

### Dongles WiFi / BT
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### IA / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Boîtiers / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables et MakerWorld — voir [docs/fr/05-case.md](docs/fr/05-case.md)

---

## 🤝 Contribuer

Ce dépôt est **vivant**. Les connaissances sont extraites du chat communautaire par un pipeline reproductible (voir [CONTRIBUTING.md](CONTRIBUTING.md)) et regénérées à chaque nouvel export. Les PR avec des corrections, de nouveaux dongles, de nouveaux boîtiers, des commandes vérifiées sont les bienvenues.

## 📄 Licence

Docs : [CC-BY-SA-4.0](LICENSE). Scripts sous `assets/scripts/` : MIT. Les firmwares/pilotes tiers en miroir conservent leurs droits d'origine — voir [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md).

## 🙏 Remerciements

Toute la communauté BC-250 — voir **[CREDITS](CREDITS.md)** pour les principaux contributeurs qui ont rendu ce manuel possible. Source : *chat de la communauté AMD BC-250*. Les auteurs des projets sont crédités par le nom de leur dépôt ci-dessus.
