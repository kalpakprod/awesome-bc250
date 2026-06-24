> 🌐 Traduction communautaire. La [version anglaise](../en/11-gaming.md) fait foi et peut être plus à jour. Une erreur ? [Ouvrez une issue](https://github.com/lildebil0/awesome-bc250/issues).

# Résultats et réglages de jeu

> **TL;DR** — Le BC-250, c'est un **GPU de classe PS5 boulonné à un Zen2 6 cœurs bridé**. Le GPU est réellement capable : à un overclock réaliste de **2000 MHz**, il fait tourner les titres AAA modernes à **40–60 FPS**, et les jeux plus légers/anciens bien au-delà de 60. Le hic, c'est le **CPU**. La moitié Zen2 de l'APU est le goulet d'étranglement bien plus souvent que le GPU — les benchmarks communautaires montrent à répétition la carte plafonnée à **~36–47 % de charge GPU alors qu'elle est clouée à ~38 FPS**, CPU-bound. Donc : **overclockez d'abord** (les ~1500 MHz d'origine sont ~30 % plus lents), appuyez-vous sur **FSR** et la génération de frames, visez le **1080p–1440p**, et acceptez que les jeux gourmands en physique ou mal threadés vont saccader quelle que soit la résolution. Les portages console first-party (God of War, Horizon, Last of Us, Spider-Man) sont le créneau idéal.

Cette section pose les attentes et rassemble les vrais résultats publiés par la communauté — beaucoup sont des captures de benchmark. Les chiffres varient selon la fréquence, la distribution, le pilote et le partage de VRAM, donc chaque ligne est rattachée à sa source.

---

## La chose à comprendre en premier : c'est CPU-bound

Le GPU du BC-250 est une puce RDNA2 dérivée de la PS5 (RADV le rapporte comme `GFX1013` / classe NAVI10). Ce n'est *pas* le maillon faible dans la plupart des jeux. Le maillon faible, c'est le **CPU Zen2 6 cœurs** tournant à ~3,5 GHz avec un cache bridé façon PS5 et aucune marge SMT en réserve.

Un benchmark communautaire en **1080p, High, GPU @ 2000 MHz / mem @ 3600 MHz** rend cela concret : le run **« a atteint 38 FPS »** avec un **GPU Limited Percentage de seulement 36,5 %** — c'est le thread de simulation CPU qui faisait barrage (CPU sim ~70 / CPU render ~43 / GPU ~47 sur la mesure par étage). Le GPU tournait au ralenti à un tiers de sa capacité pendant que le CPU bridait la fréquence d'images. ([src](https://t.me/c/2424231195/136242))

Conséquences pratiques :

- **La résolution est souvent « gratuite ».** Comme vous êtes CPU-bound, passer du 1080p au 1440p (voire au 4K avec FSR) coûte fréquemment peu de FPS — le GPU avait de toute façon de la marge. Plusieurs résultats 4K ci-dessous paraissent presque aussi bons que leurs équivalents 1080p exactement pour cette raison.
- **L'upscaling aide moins que sur un PC classique.** FSR décharge le GPU, mais si le CPU est le limiteur, baisser la résolution de rendu ne fera pas beaucoup monter vos FPS. Utilisez FSR pour la qualité d'image / les températures, pas comme un bouton magique à FPS.
- **Les jeux mal threadés ou gourmands en physique vous punissent.** Le saccadage et les pics de frame-time (Gothic Remake, Doom: The Dark Ages avant les correctifs) viennent du CPU, pas du GPU.
- **Overclockez le GPU malgré tout** — quand un jeu *est* GPU-bound (4K, ray tracing lourd, moteurs bien threadés), 1500 → 2000 MHz, c'est ~+30 % de FPS. Voir [09-overclock-undervolt.md](09-overclock-undervolt.md) pour y arriver, et [04-cooling.md](04-cooling.md) d'abord, car les 2000 MHz exigent le mod de refroidissement.

---

## Les réglages qui changent vraiment la donne

- **Fréquences.** Le GPU d'origine à ~1500 MHz est le défaut lent ; la communauté tourne à **GPU 2000 MHz, mem ~1900–2000 MHz** comme cible quotidienne, certains poussant le **cœur à 2,65 GHz sur un build de classe dGPU**. D'origine vs 2000 MHz, c'est environ **+30 % de FPS** dans les scènes GPU-bound. ([guide d'overclock](09-overclock-undervolt.md))
- **Déblocage des 40 CU.** La carte sort avec des CU désactivées. Débloquer les **40 CU** donne un gain mesurable et large — un utilisateur a rapporté Doom: The Dark Ages passant de cassé à **60 FPS High**, un titre « 007 » à **60 FPS High**, et des frame-times plus stables dans Great Pragmata après le déblocage. ([src](https://t.me/c/2424231195/141193)) Voir [09-overclock-undervolt.md](09-overclock-undervolt.md).
- **FSR / FSR 4.** Utilisez Quality ou Balanced en 1440p/4K pour garder le GPU alimenté et les températures basses. La communauté porte activement **FSR 4** (paquets DLL partagés dans le thread). ([src de la discussion FSR4 INT8](https://t.me/c/2424231195/136354)) Gains FSR mesurés par elektricM : **Quality +20–30 %, Balanced +30–40 %, Performance +40–60 %** de FPS ; la **génération de frames peut à peu près doubler** la fréquence d'images (légère latence). **FSR 4 via Optiscaler** — la communauté trouve que **Balanced bat le FSR 3.1.5 Quality natif**. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
  - **Quel upscaler utiliser concrètement :** **FSR 1–3 est le choix pratique** ici — mature, peu coûteux et bien supporté. **FSR 4 et XeSS *peuvent* techniquement tourner** sur ce silicium RDNA2 via le **chemin DP4a (INT8)** — RDNA2 a dp4a/Rapid Packed Math, donc le build FSR 4 INT8 d'OptiScaler et la variante XeSS-DP4a agnostique au GPU se chargent tous deux — mais sur un GPU aussi faible, ils sont **lents et expérimentaux** : le repli DP4a est ~10–20 % plus lourd que le chemin WMMA qu'utilisent les cartes plus récentes, et la qualité d'image sur XeSS-DP4a est inférieure à la version XMX. Considérez FSR 4 / XeSS comme quelque chose à expérimenter, pas comme votre usage quotidien. ([OptiScaler FSR4 INT8 sur RDNA2 — VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/)) **Le FSR 4 officiel d'AMD pour RDNA2 (classe RX 6000) arrive ~début 2027** ; d'ici là, c'est la voie OptiScaler/moddée. ([Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals))
- **Génération de frames au-delà de FSR — LSFG.** **Lossless Scaling Frame-Generation (LSFG)** tourne sous Linux via la couche Vulkan **`lsfg-vk`** ([github.com/PancakeTAS/lsfg-vk](https://github.com/PancakeTAS/lsfg-vk)) — une couche de frame-gen agnostique au jeu qui s'accroche à n'importe quel titre Vulkan. La communauté l'utilise pour **à peu près doubler les FPS** (p. ex. 30 → 60) dans les jeux sans génération de frames intégrée. Comme toute frame-gen, elle ajoute de la latence et demande une fréquence d'images réelle raisonnable pour interpoler, mais c'est une vraie option quand le FG propre de FSR n'est pas disponible.
- **Partage de VRAM (UMA).** C'est un pool unifié de 16 GB. Dans un balayage soigneux (1440p, 1850 MHz), le partage GDDR6 (512 MB vs 8 GB réservés) **n'a quasiment pas changé la moyenne de FPS** — mais un réglage UMA trop petit ou erroné peut vous faire basculer dans le rendu logiciel (`llvmpipe`) ou planter un benchmark. Auto / une réserve raisonnable, ça va ; ne vous prenez pas la tête. ([src](https://t.me/c/2424231195/81203))
- **VSync off** pour le benchmarking ; **génération de frames on** là où elle est proposée (elle a aidé Wukong à atteindre des moyennes à trois chiffres, voir ci-dessous).
- **`mitigations=off`** (flag de boot noyau) est un réglage courant ; dans le balayage VRAM, il n'a eu que des effets mineurs et bruités sur les FPS. Considérez-le comme faible. ⚠ **à vérifier (ampleur contestée)** — elektricM rapporte un gain bien plus important (**+18 FPS dans Cyberpunk, « +10–15 % »** dans ses conseils). C'est clairement dépendant du jeu : important dans certains titres CPU-bound, négligeable dans d'autres. Essayez et mesurez ; ne présumez ni l'un ni l'autre chiffre. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

---

## Résultats réellement publiés par les gens

Voici des chiffres rapportés par la communauté avec leurs réglages et leur source. **Les scores de benchmark et les FPS sont tels que publiés** — les fréquences/distribution/pilote diffèrent entre les lignes, donc lisez la colonne de contexte, ne comparez pas à l'aveugle.

| Jeu | Réglages (rés / preset / upscaling) | Résultat | Matériel / fréquences | Source |
|------|--------------------------------------|--------|-------------|--------|
| **Black Myth: Wukong** (bench) | 1080p, High, FSR + Frame Gen on | **moy 96** (min 78, max 113) | BC-250, Windows, RADV NAVI10 | ([src](https://t.me/c/2424231195/10069)) |
| **Black Myth: Wukong** (bench) | 1440p, Medium, sans FSR | **moy ~48** (max 56) | BC-250, 1850 MHz, Linux | ([src](https://t.me/c/2424231195/81203)) |
| **Shadow of the Tomb Raider** (bench) | 1440p, Max | **moy ~70** | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Marvel's Guardians of the Galaxy** (bench) | 1440p, High | **moy ~70** (89 max, min descend à ~3) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Dying Light 2** (bench) | 1440p, High, sans VSync | **moy ~48** (max 62) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Cyberpunk 2077** (bench) | 1440p, Ray Tracing **min** | **moy ~36** (min 30) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Indiana Jones and the Great Circle** | 1440p, low, sans upscaler | **45** | BC-250, GPU ~1900 MHz, Vulkan | ([src](https://t.me/c/2424231195/36931)) |
| **Indiana Jones and the Great Circle** | 1440p, medium, upscaler on | **60** | BC-250 | ([src](https://t.me/c/2424231195/36931)) |
| **Forza Horizon 5** | **4K**, preset High, **sans FSR** | jouable (vidéo) | BC-250 | ([src](https://t.me/c/2424231195/81891)) |
| **The Witcher 3** | 4K, Medium, FSR Balanced | **~50** | BC-250 | ([src](https://t.me/c/2424231195/81894)) |
| **Kingdom Come: Deliverance II** | 4K, Med/High, FSR Quality | **~30** (« expérience PS5 ») | BC-250 | ([src](https://t.me/c/2424231195/81893)) |
| **The Last of Us Part II** | 1080p, preset par défaut | jouable (vidéo) | BC-250 | ([src](https://t.me/c/2424231195/94237)) |
| **Doom: The Dark Ages** | High | **60** (après déblocage 40 CU + correctif) | BC-250, 40 CU | ([src](https://t.me/c/2424231195/141193)) · [Correctif Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/) · [Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS) |
| **Doom Eternal** | RT on (rapporté par la communauté) | **60 + RT** | BC-250 ; rapporté par la communauté (r/BC250Gaming) | ([synthèse Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Tekken 8** | (rapporté par la communauté) | **~60** | BC-250 ; rapporté par la communauté (r/BC250Gaming) | ([synthèse Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Street Fighter 6** | (rapporté par la communauté) | **~60** | BC-250 ; rapporté par la communauté (r/BC250Gaming) | ([synthèse Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Stellar Blade** | (rapporté par la communauté) | **~70–80** | BC-250 ; rapporté par la communauté (r/BC250Gaming) | ([synthèse Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | Frame Generation on (rapporté par la communauté) | **60 → 100** (FG) | BC-250 ; rapporté par la communauté (r/BC250Gaming) | ([synthèse Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | (vidéo) | jouable | BC-250, CPU d'origine, **GPU 2000** | ([src](https://t.me/c/2424231195/121772)) |
| **Gothic Remake** | Medium | **saccade** — « aucune optimisation » | BC-250 | ([src](https://t.me/c/2424231195/142708)) |
| **Hi-Fi Rush** | (vidéo, capture OBS) | fluide | BC-250, `mitigations=off` | ([src](https://t.me/c/2424231195/91022)) |
| **Cyberpunk 2077** | 1080p, High, FSR Quality, **sans RT** | **70–90** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Cyberpunk 2077** (bench) | 1080p (d'origine 2000 MHz / 1000 mV) | **57,66** → **60,82** OC (2230 MHz) ; `mitigations=off` **+18** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **The Last of Us Part I** | 1080p, Medium-High | **60** (stable) | BC-250 — 90–100 °C pendant la compilation des shaders ; quelques clics audio | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Devil May Cry 5** | 1080p, High | **100** (latence la plus basse, ~10 ms) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Detroit: Become Human** | 1080p, Medium | **60** (plafonné) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Control** | 1080p, **RT** complet | **40** | BC-250 — bon pour du RT d'entrée de gamme | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Company of Heroes 3** | 1080p | jouable — **nécessite un partage VRAM de 4 GB** (512 MB : artefacts/plantages) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Red Dead Redemption 2** (bench) | utiliser le flag `-useMaximumSettings` | **45+** min | BC-250 — peut détecter le mauvais adaptateur GPU, à régler manuellement | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **CS2** / **Rocket League** / **Elden Ring** | 1080p | **100+** / **120+** / **60** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Helldivers 2** | 1080p, low (rapporté) | **≈82** | BC-250, d'origine, un seul Noctua NF-P12 — GPU 73 °C / CPU 76 °C ; ⚠ ASR | ([« Temps Shocked Me »](https://youtu.be/d7Hwqxn9yg8) ~5:08) |
| **Stalker 2** | medium (rapporté) | **≈80** | BC-250 — l'auteur signale CPU-bound / 8 GB RAM ; ⚠ ASR | ([revue RU](https://youtu.be/19l03qneKJ4) ~0:23) |
| **Stalker 2** | QHD (2560×1600), FSR Quality + Frame Gen, patch 1.21 (rapporté) | **57–70** (1080p, sans FG **≈45**) | BC-250 ; ⚠ ASR | ([revue RU](https://youtu.be/19l03qneKJ4) ~18:52) |
| **Arc Raiders** | 1080p (rapporté) | **≈56–80** | BC-250, d'origine ; ⚠ ASR | ([Temps Shocked Me](https://youtu.be/d7Hwqxn9yg8) ~5:58) |
| **Spider-Man 2** | 1080p, High, FSR Frame Gen (rapporté) | **≈100** moy (sous-60 natif) | BC-250 ; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~11:04) |
| **Forza Horizon 5** | 1080p, Medium, sans FSR (rapporté) | **70–95** | BC-250 ; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~12:19) |
| **Metro Exodus** | QHD, High (rapporté) | **≈58** | BC-250 ; ⚠ ASR | ([revue RU](https://youtu.be/19l03qneKJ4) ~14:12) |
| **Palworld** | 1080p, med-high (rapporté) | **<60** (jouable) | BC-250 ; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:04) |
| **Red Dead Redemption 2** | 1080p, med-high, FSR Quality (rapporté) | **60 solide** | BC-250 ; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:19) |
| **Left 4 Dead 2** | 1080p, max (rapporté) | **>150** | BC-250 ; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~10:18) |
| _Référence : build GPU discret_ | bench RE-engine, 1080p, High, sans RT | **moy 67,99** (min 58, max 82) | **RX 6600** + Xeon E5-2667v4, Win10 | ([src](https://t.me/c/2424231195/116494)) |

> La ligne RX 6600 **n'est pas un résultat BC-250** — c'est un membre faisant tourner une carte discrète sur le même châssis/CPU à titre de comparaison. Incluse pour montrer ce que le *CPU* seul peut soutenir.

> ⚠️ **Elden Ring — les résultats varient.** Les ~60 FPS ci-dessus (elektricM, 1080p) ne sont pas universels : un build communautaire était **plafonné à 30 FPS verrouillés en High et ne pouvait pas atteindre 60 même en 720p low** (CPU-bound). Considérez 60 comme un meilleur cas, pas une garantie. ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:50)

### Portages first-party / console — le créneau idéal

Ceux-ci tournaient assez bien pour qu'un membre les liste simplement comme « fonctionne » (les portages façon PS s'appuient sur le GPU et sont bien optimisés, ce qui convient à cette carte) :

> Days Gone · Death Stranding · DIRT 5 · Ghost of Tsushima: Director's Cut · God of War (2018) · God of War: Ragnarök · Horizon Forbidden West · Horizon Zero Dawn · The Last of Us Part I · The Last of Us Part II Remastered · Returnal · Uncharted: Legacy of Thieves

([src](https://t.me/c/2424231195/99563))

---

## Jeux à problèmes connus (ne fonctionnent pas / nécessitent un contournement)

elektricM suit des titres que nous n'avions pas couverts qui **échouent ou se battent avec la plateforme** — à vérifier avant d'acheter :

| Jeu | Problème | Contournement |
|------|---------|-----------|
| **Fortnite** | Easy Anti-Cheat **ne supporte pas Linux** | **Aucun — impossible à faire tourner** sur un BC-250 sous Linux |
| **Valorant** | Anti-triche au niveau noyau | Problèmes techniques sous Linux ; concrètement non |
| **Magic: The Gathering Arena** | Plantages/gels spécifiquement sur **Fedora** | Fonctionne mieux sur **Manjaro / Bazzite** ; essayer un autre Proton |
| **Final Fantasy VII Rebirth** | « DX12 is not supported on your system » (vérification de compatibilité GPU) | **Pas encore de correctif** |
| **Black Myth: Wukong** (cracké) | « CreateProcess() returned 2 » (anti-falsification) | Utiliser des **fichiers de jeu non modifiés** |

(Le statut anti-triche change avec le temps — recoupez [areweanticheatyet.com](https://areweanticheatyet.com) et [protondb.com](https://www.protondb.com).) ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

### Bloqués durement par des fonctionnalités GPU manquantes (non corrigeable)

C'est du **silicium de classe RDNA 2** (GFX1013). Une poignée de titres plus récents **exigent en dur des fonctionnalités GPU que RDNA 2 n'a pas** — principalement les **mesh shaders** et le **variable-rate shading (VRS) matériel** — et refusent de tourner. Le silicium manquant est une **limitation matérielle, pas un bug de pilote** : aucune mise à jour Mesa, paramètre noyau ou version de Proton n'ajoute la fonctionnalité en elle-même. Les **mesh shaders** sont un vrai mur. Une exigence de **VRS** n'est parfois qu'une vérification au lancement qu'une couche Vulkan en espace utilisateur peut neutraliser (voir la note Doom ci-dessous) — donc ce n'est pas toujours fatal. Exemples confirmés ([thread communautaire r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)) :

| Jeu | Exigence en dur qui manque au BC-250 |
|------|------------------------------------|
| **Final Fantasy VII Rebirth** | **Mesh shaders** — ne tournera pas (c'est aussi pourquoi il déclenche la vérification de compatibilité GPU DX12 dans le tableau ci-dessus) |
| **Doom: The Dark Ages — Update 2** | **Vulkan fragment shading rate** (VRS matériel) — l'Update 2 a rendu le VRS obligatoire *au lancement* ; le GPU ne l'a pas, donc le jeu non modifié ne démarre plus (le build pré-Update-2 tournait à 60 FPS après le déblocage des 40 CU, ci-dessus). **Un contournement existe** — voir la note ci-dessous. |

> **Doom: The Dark Ages Update 2 — il y a désormais un contournement.** Le jeu ne fait que *vérifier* le VRS au lancement ; il n'en a jamais réellement besoin pour le gameplay. La couche Vulkan **`bangstk/Vulkan_NullVRS`** ([github.com/bangstk/Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS)) intercepte `vkCmdSetFragmentShadingRateKHR()` et la transforme en no-op, satisfaisant la vérification au lancement pour que le jeu tourne sans effet secondaire en jeu. Donc Doom: The Dark Ages n'est **pas** un blocage dur permanent. **Les mesh shaders, c'est différent** — il n'y a pas de shim équivalent pour l'exigence de mesh shaders de FF7 Rebirth, donc celui-là ne tournera vraiment pas.

> Avant d'acheter un tout nouveau titre AAA, vérifiez s'il liste les mesh shaders ou le VRS matériel comme exigence. Les **mesh shaders** sont un vrai mur matériel ici (aucun contournement). Une exigence de **VRS matériel** n'est souvent qu'une barrière au lancement — parfois neutralisable (comme avec Doom ci-dessus), parfois non — donc consultez la communauté avant de présumer quoi que ce soit.

## Ray tracing — ce qui a réellement été testé

Le BC-250 a un **vrai RT matériel RDNA2** (pas de l'émulation logicielle, à partir de Mesa 25.2+). Titres RT testés selon elektricM :

| Jeu | Rés | FPS | Notes |
|------|-----|-----|-------|
| Cyberpunk 2077 | 1080p | 50–60 | Éclairage RT seul, FSR Quality |
| Control | 1080p | 40 | RT complet |
| Portal 2 RTX | 720p | 40 | Chemin RT logiciel dans Mesa 25.2+ |
| Half-Life 2 RTX | 720p | 20–30 | Très exigeant |

Le RT est d'entrée de gamme ici — bien pour de l'*éclairage seul* dans des jeux bien optimisés, pas pour des charges full path-traced. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

## Proton et options de lancement (Linux)

- **Version de Proton :** commencez avec **Proton GE** (meilleure compatibilité) ou **Proton Experimental** ; repliez-vous sur les stables **8.0 / 9.0** selon le jeu. Installez GE via **ProtonUp-Qt** (`protonup-qt`). Certains titres ne fonctionnent que sur une version précise — testez si l'un échoue. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Options de lancement Steam** à connaître :
  - `mangohud %command%` — overlay FPS/températures.
  - `RADV_DEBUG=nohiz %command%` — force RADV / corrige certains glitchs.
  - `gamemoderun %command%` — bascule le governor CPU en performance pour la session (aide cette carte CPU-bound).
  - Combinés : `RADV_DEBUG=nohiz mangohud gamemoderun %command%`.
- **VRAM par jeu (partage UMA) :** esports/indé vont bien sur **512 MB** ; **la plupart des jeux veulent 4 GB** ; AAA/RT veulent aussi les paramètres noyau de VRAM supplémentaire (`amdgpu.gttsize=...`, voir [06-linux.md](06-linux.md) / [08-bios.md](08-bios.md)). Un partage trop petit cause des artefacts, des plantages, ou une bascule vers le rendu logiciel. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Le saccadage au premier lancement** est généralement la **compilation des shaders** — laissez Steam finir la pré-compilation avant de juger les FPS ; un cache de shaders plus grand aide. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Correctifs par jeu** (rapportés par la communauté, r/BC250Gaming — à essayer si vous rencontrez exactement ces bugs) :
  - **Resident Evil Requiem — cheveux cassés/glitchés :** ajoutez `RADV_DEBUG=nohiz %command%` aux options de lancement (le même flag RADV listé ci-dessus, appliqué ici spécifiquement). ([synthèse Reddit](https://www.reddit.com/r/BC250Gaming/))
  - **Spider-Man 2 / Assassin's Creed Shadows — gels :** activer **zswap** (swap compressé) arrête les gels selon les rapports. ([synthèse Reddit](https://www.reddit.com/r/BC250Gaming/))

---

## Émulation

Les émulateurs sont gourmands en CPU, donc les résultats sont mitigés mais plusieurs sont solides ([src](https://t.me/c/2424231195/78988)) :

- **Switch — Eden / Ryujinx :** fonctionne bien et vite. Rapporté par la communauté (r/BC250Gaming) : **Mario Kart ~60 FPS** ; **Tears of the Kingdom ~30–40 FPS**. ✅ ([synthèse Reddit](https://www.reddit.com/r/BC250Gaming/))
- **PS4 — shadPS4 (0.9.0+) :** Bloodborne tourne bien sans chutes ; certains titres (The Last Guardian) ont des artefacts mais tiennent des FPS stables. ✅
- **PS3 — RPCS3 :** fonctionne, mais nécessite un réglage par jeu. ⚠️ **Particularité connue** (rapportée par la communauté, r/BC250Gaming) : un bug de l'émulateur **verrouille le GPU à 1000 MHz** sous RPCS3, donc le GPU ne peut pas monter en fréquence — le contournement est d'**overclocker le CPU pour compenser** la marge GPU perdue. ([synthèse Reddit](https://www.reddit.com/r/BC250Gaming/))
- **Xbox 360 — Xenia Canary :** les menus se chargent, le gameplay tombe sur un écran noir (toujours à l'étude). ❌

---

## Où le voir tourner (vidéo)

La communauté publie beaucoup de vidéos de gameplay/benchmark. Quelques captures dans le thread et chaînes :

- Clips gameplay/benchmark BC-250 : [youtu.be/CYDv1SfD2Pc](https://youtu.be/CYDv1SfD2Pc) · [youtu.be/g3uWOfqcexA](https://youtu.be/g3uWOfqcexA) · [youtu.be/9fozmRrAouc](https://youtu.be/9fozmRrAouc) · [youtu.be/q64M2XzADjA](https://youtu.be/q64M2XzADjA) · [youtu.be/0LEkOG1yqqw](https://youtu.be/0LEkOG1yqqw)
- Feuille de suivi communautaire des jeux testés (FPS/réglages) : [Google Sheet](https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing)

---

## Aide-mémoire des attentes réalistes

| Vous voulez… | Réalité sur un BC-250 moddé à 2000 MHz |
|-----------|--------------------------------------|
| 1080p AAA, 60 FPS | Parfois — dépend de la charge CPU. FSR + Frame Gen aide. AAA plus ancien/léger : oui. |
| 1440p AAA | 40–60 FPS dans la plupart des portages ; le GPU a de la marge ici. Meilleure résolution rapport qualité-prix. |
| 4K AAA | 30–50 FPS avec FSR dans les portages console/bien optimisés (Forza, Witcher 3, KCD2). |
| Ray tracing | Seulement au minimum, FPS bas (Cyberpunk ~36 @ 1440p RT-min). Pas le point fort de la carte. |
| 60 verrouillés partout | Non. Les titres CPU-bound et gourmands en physique vont chuter/saccader quels que soient les réglages. |
| Portages PS first-party | Le créneau idéal — c'est ce que la carte fait de mieux. |

---

## Sources

- Benchmark CPU-bound (38 FPS, 36,5 % GPU) — https://t.me/c/2424231195/136242
- Grand tableau de benchmarks VRAM/fréquence (Wukong, Tomb Raider, Dying Light 2, Cyberpunk, Guardians) — https://t.me/c/2424231195/81203
- Wukong 1080p High FSR+FG, moy 96 — https://t.me/c/2424231195/10069
- Indiana Jones Great Circle, multi-résolution — https://t.me/c/2424231195/36931
- Forza Horizon 5 4K — https://t.me/c/2424231195/81891 · Witcher 3 4K — https://t.me/c/2424231195/81894 · KCD2 4K — https://t.me/c/2424231195/81893
- Résultats du déblocage des 40 CU (Doom Dark Ages 60 FPS) — https://t.me/c/2424231195/141193 · Correctif Doom — https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/
- TLOU II 1080p — https://t.me/c/2424231195/94237 · Resident Evil Requiem — https://t.me/c/2424231195/121772 · saccadage Gothic Remake — https://t.me/c/2424231195/142708
- Liste des portages first-party — https://t.me/c/2424231195/99563
- Tour d'horizon de l'émulation — https://t.me/c/2424231195/78988
- Run de comparaison dGPU RX 6600 — https://t.me/c/2424231195/116494
- Compatibilité de jeu elektricM (réglages/FPS par jeu, jeux à problèmes, tableau RT, Proton et options de lancement, gains FSR) — https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/
- Captures FPS YouTube (sous-titres auto / ASR — chiffres approximatifs) : ETA Prime (Spider-Man 2, Forza H5, Left 4 Dead 2) — https://youtu.be/q_CxcbS5HI8 · « Temps Shocked Me » (Helldivers 2, Arc Raiders) — https://youtu.be/d7Hwqxn9yg8 · revue RU (Stalker 2, Metro Exodus) — https://youtu.be/19l03qneKJ4 · Pixels & Power (Palworld, RDR2, Elden Ring 30 FPS) — https://youtu.be/4S0DvIpqm0E
- Blocages durs mesh-shader / VRS matériel (FF7 Rebirth, Doom: The Dark Ages Update 2) — [thread r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- **Contournement VRS Doom: The Dark Ages — `bangstk/Vulkan_NullVRS`** (couche Vulkan no-op pour `vkCmdSetFragmentShadingRateKHR`) — https://github.com/bangstk/Vulkan_NullVRS
- **Génération de frames LSFG sous Linux — `lsfg-vk`** (couche Vulkan) — https://github.com/PancakeTAS/lsfg-vk
- **FSR 4 / XeSS via DP4a (INT8) sur RDNA2** — build FSR4 INT8 OptiScaler : [VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/) · [Wiki de compatibilité FSR4 OptiScaler](https://github.com/optiscaler/OptiScaler/wiki/FSR4-Compatibility-List)
- **FSR 4 officiel d'AMD pour RDNA2 (~début 2027) / RDNA3 (juillet 2026)** — [Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals)
- **Résultats de jeu rapportés par la communauté (r/BC250Gaming)** — Tekken 8, Street Fighter 6, Stellar Blade, RE Requiem Frame-Gen, Doom Eternal RT, Switch (Mario Kart / TOTK), verrou GPU 1000 MHz RPCS3, correctifs cheveux RE Requiem / Spider-Man 2 / AC Shadows — https://www.reddit.com/r/BC250Gaming/
- Tableur communautaire de tests de jeu — https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing

> Les fréquences et le déblocage des 40 CU sont dans [09-overclock-undervolt.md](09-overclock-undervolt.md) ; faites le mod [04-cooling.md](04-cooling.md) avant de faire tourner les 2000 MHz.
