> 🌐 Traduction communautaire. La [version anglaise](README.md) fait foi et peut être plus à jour. Une erreur ? [Ouvrez une issue](https://github.com/lildebil0/awesome-bc250/issues).

<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — la bible du débutant pour l'AMD BC-250" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> La bible du débutant pour l'**AMD BC-250** — une carte APU dérivée de la PlayStation 5 (Cyan Skillfish / Oberon, 16 Go GDDR6) reconvertie en machine Linux bon marché pour le jeu et l'IA.

Tout ce qu'il faut pour passer **d'une carte dans un carton à des jeux qui tournent** — sélectionné à partir de plus de 125 000 messages de la communauté BC-250, classé selon ce que les gens ont vraiment plébiscité et épinglé, et recoupé avec les dépôts canoniques du projet.

🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · **Français** · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

---

## ⚡ Commencez ici

Carte neuve, vous ne connaissez rien ? Suivez le chemin doré dans l'ordre :

**[docs/fr/00-start-here.md](docs/fr/00-start-here.md)** — Acheter → Alimenter → Refroidir → Installer l'OS → Pilotes → Overclock → Jouer.

---

## 📚 Manuel

| # | Section | Pour |
|---|---------|-----|
| 01 | [Qu'est-ce que le BC-250](docs/en/01-what-is-bc250.md) | specs, dimensions, brochage, attentes |
| 02 | [Guide d'achat](docs/en/02-buying.md) | où, prix, risques, achats groupés |
| 03 | [Alimentation](docs/en/03-power-supply.md) | LOP / Flex ATX, brochage 8 broches, câblage |
| 04 | [Refroidissement](docs/en/04-cooling.md) | dissipateur, carénages de ventilateur, méthode de test |
| 05 | [Boîtiers et impression 3D](docs/en/05-case.md) | catalogue de boîtiers imprimables (STL) |
| 06 | [Pilotes et configuration Linux](docs/en/06-linux.md) | choix de la distro, amdgpu, installation |
| 07 | [Pilotes et configuration Windows](docs/en/07-windows.md) | état des pilotes, mode d'emploi |
| 08 | [BIOS et récupération de brick](docs/en/08-bios.md) | BIOS moddé, flashage, débrickage |
| 09 | [Overclocking et undervolting](docs/en/09-overclock-undervolt.md) | governor, SMU, déblocage 40CU |
| 10 | [Dongles WiFi et Bluetooth](docs/en/10-wifi-bt.md) | dongles qui fonctionnent vraiment |
| 11 | [Résultats et réglages de jeu](docs/en/11-gaming.md) | benchmarks, réglages par jeu |
| 12 | [IA / LLM sur BC-250](docs/en/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/en/13-macos.md) | état |
| 14 | [Affichage et sortie vidéo](docs/en/14-display.md) | DisplayPort, adaptateurs DP→HDMI, double écran |
| 15 | [Émulation](docs/en/15-emulation.md) | chaque console/plateforme, état réaliste |
| 16 | [USB, hubs et stockage](docs/en/16-usb-peripherals.md) | hubs, mod 5V, adaptateurs M.2 / SATA |
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
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — débloquer les 40 CU
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Pilotes
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — pilote GPU Windows (expérimental, pas d'accélération complète début 2026)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — travaux sur le pilote PSP/GPU
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — noyau Linux

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — images et mods de BIOS les plus référencés
- Voir [docs/fr/08-bios.md](docs/en/08-bios.md) pour le flashage et la récupération de brick

### Dongles WiFi / BT
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### IA / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Boîtiers / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables et MakerWorld — voir [docs/fr/05-case.md](docs/en/05-case.md)

---

## 🤝 Contribuer

Ce dépôt est **vivant**. Les connaissances sont extraites du chat communautaire par un pipeline reproductible (voir [CONTRIBUTING.md](CONTRIBUTING.md)) et regénérées à chaque nouvel export. Les PR avec des corrections, de nouveaux dongles, de nouveaux boîtiers, des commandes vérifiées sont les bienvenues.

## 📄 Licence

Docs : [CC-BY-SA-4.0](LICENSE). Scripts sous `assets/scripts/` : MIT. Les firmwares/pilotes tiers en miroir conservent leurs droits d'origine — voir [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md).

## 🙏 Remerciements

Toute la communauté BC-250 — voir **[CREDITS](CREDITS.md)** pour les principaux contributeurs qui ont rendu ce manuel possible. Source : *chat de la communauté AMD BC-250*. Les auteurs des projets sont crédités par le nom de leur dépôt ci-dessus.
