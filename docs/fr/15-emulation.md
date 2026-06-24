> 🌐 Traduction communautaire. La [version anglaise](../en/15-emulation.md) fait foi et peut être plus à jour. Une erreur ? [Ouvrez une issue](https://github.com/lildebil0/awesome-bc250/issues).

# Émulation

> **TL;DR** — Le BC-250 est une machine d'émulation étonnamment bonne car elle associe un GPU RDNA2 de classe PS5 à 16 Go de GDDR6 rapide — mais l'émulation est **fortement CPU-bound**, et le **Zen 2 6 cœurs** bridé à ~3,5 GHz est le plafond pour les systèmes exigeants. **Tout jusqu'à et y compris PS2 / GameCube / Wii / PSP / Dreamcast est la zone confortable** (le rétro est trivial ; la PSP est confirmée par le chat à 4× la résolution interne). **Switch / PS3 / PS4 sont exigeantes et inégales**, et **la Xbox 360 démarre à peine**. Prouvé par le chat sur la carte : **Switch via Eden** « fonctionne bien et vite », **PS3 via RPCS3** fonctionne avec un réglage par jeu, **PS4 via shadPS4** fait bien tourner Bloodborne, **PSP via PPSSPP** tourne très bien, et **Xbox 360 via Xenia** est cassée en jeu. **Overclockez et refroidissez la carte d'abord** — sans governor le GPU reste à ~1000 MHz dans un émulateur et s'étouffe. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/130879))

Cette page est l'analyse approfondie ; [11-gaming.md](11-gaming.md) en a la version courte dans son tableau de résultats. Les ROM/clés/BIOS sont à vous de les obtenir légalement — rien de tout cela n'est couvert ici.

> **Comment lire la colonne statut.** Cette carte a été discutée de façon inégale : une poignée de systèmes ont été testés de première main dans le chat, la plupart des systèmes rétro non. Donc chaque ligne est étiquetée :
> - **✅ / ⚠️ / ❌ (chat)** — un membre l'a fait tourner *sur un BC-250* et a rapporté le résultat, avec le message cité.
> - **(general ⚠)** — le **meilleur émulateur Linux connu et l'attente générale pour cette classe de matériel** (Zen 2 + RDNA2). **Non testé sur BC-250.** À traiter comme « devrait aller / devrait être difficile », jamais comme une promesse mesurée. Aucun chiffre de FPS spécifique au BC-250 n'est inventé où que ce soit sur cette page.

---

## Faites ces deux choses avant d'émuler quoi que ce soit

L'émulation amplifie les deux particularités de la carte, donc les prérequis comptent plus ici que dans le jeu normal :

1. **Overclockez d'abord.** Un membre qui a essayé l'émulation Switch sur une carte d'origine a trouvé le GPU bloqué à **1000 MHz dans l'émulateur** alors que les jeux normaux montaient en fréquence correctement — le correctif était de régler manuellement le governor à sa fréquence max avant le lancement. ([src](https://t.me/c/2424231195/130879)) Faites tourner le **oberon-governor** à **2000 MHz** (et envisagez l'OC CPU à 4 GHz), selon [09-overclock-undervolt.md](09-overclock-undervolt.md) — l'émulation a besoin de chaque mégahertz que le CPU peut donner.
2. **Refroidissez d'abord.** 2000 MHz nécessite le mod de refroidissement, sinon la carte throttle/redémarre. Faites [04-cooling.md](04-cooling.md) avant de chasser l'overclock.

> **Pourquoi le CPU-bound compte tant ici.** Un moteur de jeu est réglé pour le matériel sur lequel il est livré ; un émulateur *simule* à la place le CPU d'une autre console sur le vôtre, ce qui est bien plus lourd par image. Sur le BC-250 les **6 cœurs Zen 2 à ~3,5 GHz** ([spec matérielle](https://elektricm.github.io/amd-bc250-docs/hardware/specifications/)) sont le facteur limitant pour Switch/PS3/PS4 — le GPU de classe PS5 a généralement de la marge à revendre. Un membre cherchant de meilleures performances Switch a vu exactement cela : en jeu le **GPU reste largement sous-utilisé tandis que le CPU est le mur**. ([src](https://t.me/c/2424231195/136712)) Plus de cœurs n'aide pas le thread chaud d'un émulateur ; la fréquence et l'IPC, si. C'est le même goulot d'étranglement CPU décrit dans [11-gaming.md](11-gaming.md), juste plus marqué.

---

## Pour commencer — trois façons d'installer

Cette carte n'a aucune particularité spécifique à l'émulation au-delà des deux prérequis ci-dessus — c'est un PC Linux normal pour les émulateurs. Choisissez l'une des options :

- **EmuDeck** — la façon la plus rapide d'obtenir une configuration multi-systèmes complète d'un coup. Il télécharge et préconfigure toute la pile standalone (RetroArch, PCSX2, Dolphin, DuckStation, PPSSPP, melonDS, Ryujinx, …), câble les manettes, et a été confirmé fonctionnel sur la carte (« le Ryujinx livré avec EmuDeck est aussi bon »). ([src](https://t.me/c/2424231195/99039)) Il cible Steam Deck / Linux, ce qui convient à l'install Bazzite/CachyOS/Arch typique du BC-250 ([06-linux.md](06-linux.md)). **RetroDECK** (un équivalent contenu dans un Flatpak) est la même idée si vous préférez une seule appli en bac à sable.
- **RetroArch** — un front-end, de nombreux « cores » (émulateurs-en-plugins). Idéal pour tout le 8/16/32-bit jusqu'à PS1/N64/DS — installez une fois, ajoutez les cores ci-dessous, pointez-le sur vos ROM. Disponible en Flatpak sur toutes les distributions BC-250.
- **Émulateurs standalone** — pour les systèmes lourds (Switch, PS3, PS4, PS2, GameCube/Wii, Xbox) l'appli standalone dédiée bat le core RetroArch sur les fonctionnalités et la compatibilité. **Installez la build Linux native** quand vous le pouvez — les premiers tests BC-250 ont montré les builds natives (Ryujinx) se comportant mieux que les builds Windows lancées via Proton. ([src](https://t.me/c/2424231195/23577)) La plupart sont sur Flathub ou dans l'AUR d'Arch (p. ex. `paru -S cemu`). ([src](https://t.me/c/2424231195/74138))

Puis **lancez via Steam** (« ajouter un jeu non-Steam ») pour le support des manettes et un overlay — le même flux que le chat utilise pour tout le reste (voir [11-gaming.md](11-gaming.md)).

> **Vous voulez plutôt une distribution d'émulation dédiée ?** **Batocera** (une distribution d'émulation prête à l'emploi + frontend) est **confirmée par la communauté tournant sur le BC-250** ([fil communautaire r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)) — démarrez-la au lieu d'un Linux de bureau et vous obtenez une machine d'émulation de style console, plug-and-play, plutôt que d'installer les émulateurs un par un. Elle est listée comme distribution au démarrage confirmé dans [06-linux.md](06-linux.md). Les mêmes prérequis overclock + refroidissement s'appliquent toujours.

> **Surveillez le governor.** Si un émulateur tourne lentement, vérifiez vos fréquences avant de blâmer l'émulateur : il peut être bloqué à 1000 MHz. Réglez le oberon-governor à sa valeur max (certains le font tourner bloqué à ~2250 MHz) avant le lancement, puis vérifiez avec un overlay (`amdgpu_top` / MangoHud). ([src](https://t.me/c/2424231195/130879), [src](https://t.me/c/2424231195/130955))

> **Pas d'image d'émulation préconfigurée.** Les nouveaux venus demandent régulièrement une image prête à l'emploi avec les émulateurs configurés. La communauté traite une « image BC-250 configurée » partagée comme un tabou — configurez-la vous-même depuis les guides ; ce n'est pas difficile une fois la carte overclockée. ([src](https://t.me/c/2424231195/130845), [src](https://t.me/c/2424231195/130877))

---

## Ce que la communauté a réellement fait tourner

Le point de donnée le plus utile est le récapitulatif d'un membre après avoir testé plusieurs émulateurs sur la carte ([src](https://t.me/c/2424231195/78988)) :

- **Switch (Eden)** — « fonctionne bien et vite ».
- **PS3 (RPCS3)** — fonctionne, mais « nécessite un réglage individuel de jeu en jeu ».
- **PS4 (shadPS4 0.9.0)** — Bloodborne tourne bien sans chutes ; The Last Guardian a commencé à artefacter mais a gardé une fréquence d'images stable.
- **Xbox 360 (Xenia Canary)** — les menus des jeux se lancent, mais le gameplay tombe sur un écran noir (il répond encore à la manette) ; non résolu.

Plus de confirmations de première main :

- **Switch / Eden est le choix de consensus.** Quand un nouveau venu a demandé quel émulateur Switch prendre, la réponse a été sans détour : **« Eden est le plus correct ».** ([src](https://t.me/c/2424231195/130842)) D'autres ont confirmé qu'**Eden s'installe et fonctionne bien** ([src](https://t.me/c/2424231195/98942)), et qu'**Eden fonctionne très bien, et le Ryujinx livré avec EmuDeck est aussi bon.** ([src](https://t.me/c/2424231195/99039)) Les gros titres first-party taxent encore le CPU : un membre jouant à **Tears of the Kingdom sur Eden (avec NX Optimizer) a rapporté des chutes d'images**. ([src](https://t.me/c/2424231195/124216))
- **PS4 / shadPS4** — un membre a **vendu sa PS4 physique et rejoue maintenant Bloodborne sur le BC-250 via shadPS4**, disant qu'il « se lance en 2 clics ». ([src](https://t.me/c/2424231195/38704), [src](https://t.me/c/2424231195/38706)) Un autre a confirmé que **Drive Club tourne à 100 %** sur shadPS4. ([src](https://t.me/c/2424231195/82128))
- **PS3 / RPCS3** — au-delà du récapitulatif, des membres ont rapporté **Uncharted avec une « fréquence d'images stable, jouable »** ([src](https://t.me/c/2424231195/74644)) et un net **« fonctionne très bien dans RPCS3 ».** ([src](https://t.me/c/2424231195/53601))
- **PSP / PPSSPP** — fait tourner de première main à plusieurs reprises et salué : un membre a fait tourner **PPSSPP à 4× la résolution interne** sans throttling thermique sur la carte. ([src](https://t.me/c/2424231195/101579), [src](https://t.me/c/2424231195/103218), [src](https://t.me/c/2424231195/111096))

### Une note sur l'historique des émulateurs Switch (Yuzu → Eden / Ryubing)

L'émulation Switch sur la carte a traversé les mêmes bouleversements que partout ailleurs. Un instantané précoce de l'état des choses a trouvé **Yuzu et Suyu se bloquant au lancement** tandis que **Ryujinx fonctionnait** (builds natives). ([src](https://t.me/c/2424231195/23577)) Yuzu a été fermé par Nintendo en 2024 et ses successeurs reprennent le flambeau : **Eden** (un fork de Yuzu) est le choix de la communauté BC-250 qui « fonctionne bien et vite », et la lignée **Ryujinx** survit sous le fork communautaire **Ryubing**, qui reste activement développé en 2026. Notez que Nintendo poursuit agressivement en justice les émulateurs Switch et nettoie les clés/liens de téléchargement — en février 2026 il a DMCA Eden ainsi qu'une douzaine d'autres forks, alors attendez-vous à chercher à la fois les binaires et les clés. ([src](https://t.me/c/2424231195/136649))

---

## Tableau de compatibilité complet — chaque plateforme

Une ligne par plateforme. **Émulateur** est le meilleur choix Linux actuel ; **Statut sur BC-250** est cité du chat là où un membre l'a testé, sinon l'attente générale pour du matériel Zen 2 + RDNA2 (étiqueté `general ⚠`, **non mesuré sur BC-250**).

### Nintendo

| Système | Meilleur émulateur Linux | Statut sur BC-250 | Notes |
|--------|--------------------|------------------|-------|
| **NES / Famicom** | Mesen (ou FCEUmm) — core RetroArch | ✅ Trivial (general ⚠) | 8-bit ; n'importe quelle patate le fait tourner. Aucun rapport BC-250 nécessaire. |
| **SNES** | Snes9x (bsnes pour la précision) — RetroArch | ✅ Trivial (general ⚠) | Snes9x est rapide & ~99 % compatible ; bsnes si vous voulez la précision cycle-à-cycle. |
| **Game Boy / GBC** | SameBoy / Gambatte — RetroArch | ✅ Trivial (general ⚠) | SameBoy est le choix précision. |
| **GBA** | mGBA (standalone ou RetroArch) | ✅ Trivial (general ⚠) | mGBA est l'étalon-or. |
| **N64** | simple64 / RMG (mupen64plus) ; core RetroArch | ✅ Facile (general ⚠) | simple64 est archivé ; son dev est passé à **gopher64** (Rust). RMG ou gopher64 conviennent. Confortable sur ce CPU. |
| **DS** | melonDS (standalone ou RetroArch) | ✅ Facile (general ⚠) | melonDS a depuis longtemps remplacé DeSmuME. |
| **3DS** | **Azahar** (fusion Citra/Lime3DS) | ✅ Devrait être facile (general ⚠) | Citra a été DMCA ; **Azahar** est le successeur maintenu. Confortable pour ce matériel. |
| **GameCube** | **Dolphin** | ✅ Devrait très bien tourner (general ⚠) | Dolphin est mature & accéléré Vulkan. Mentionné dans le chat (multi-fenêtres/CLI) mais aucun FPS de première main posté — à traiter comme facile, pas mesuré. ([src](https://t.me/c/2424231195/19715)) |
| **Wii** | **Dolphin** | ✅ Devrait bien tourner (general ⚠) | Même build Dolphin. Époque confortable pour le BC-250 ; non benchmarké sur BC-250 dans le chat. |
| **Wii U** | **Cemu** (Linux natif, open-source) | ⚠ Demandé, non confirmé | Un membre a demandé à le faire tourner (et `cemu` est dans l'AUR), mais **aucun résultat BC-250 fonctionnel n'a été posté**. Cemu est plus lourd que Dolphin — vérifiez vous-même. ([src](https://t.me/c/2424231195/68253), [src](https://t.me/c/2424231195/74138)) |
| **Switch** | **Eden** (successeur de Yuzu) | ✅ Fonctionne bien & vite (chat) | Le choix nº 1 de la communauté. Réglez le governor au max avant le lancement. Certains titres sont livrés verrouillés à 30 FPS et nécessitent un patch 60 FPS (p. ex. Zelda) ; les gros titres first-party (TOTK) chutent encore — CPU-bound. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/130842), [src](https://t.me/c/2424231195/124216), [src](https://t.me/c/2424231195/130887)) |
| **Switch** | **Ryujinx** (maintenant le fork **Ryubing**) | ✅ Fonctionne (chat) | Les builds natives tournaient avec succès ; le Ryujinx fourni avec EmuDeck est « aussi bon ». ([src](https://t.me/c/2424231195/51606), [src](https://t.me/c/2424231195/99039)) |
| **Switch** | Yuzu / Suyu | ❌ Cassé au lancement — historique (chat) | Premiers rapports : bloqué au démarrage d'un jeu. Yuzu est abandonné — utilisez Eden. ([src](https://t.me/c/2424231195/23577)) |

### Sony

| Système | Meilleur émulateur Linux | Statut sur BC-250 | Notes |
|--------|--------------------|------------------|-------|
| **PS1** | **DuckStation** (standalone ou RetroArch) | ✅ Trivial (general ⚠) | DuckStation est le standard moderne ; fonctions d'amélioration gratuites. |
| **PS2** | **PCSX2** (v2.x, Qt + Vulkan) | ✅ Devrait bien tourner (general ⚠) | 98 %+ de compatibilité, la cible classique « émulation facile ». Non benchmarké de première main sur BC-250 dans le chat — mais bien dans la classe de ce matériel. |
| **PSP** | **PPSSPP** | ✅ Tourne très bien — 4× res (chat) | De première main : tournait à 4× la résolution interne sans throttling. L'un des systèmes les plus confortables sur la carte. ([src](https://t.me/c/2424231195/101579), [src](https://t.me/c/2424231195/103218), [src](https://t.me/c/2424231195/111096)) |
| **PS Vita** | **Vita3K** | ⚠ Expérimental (general ⚠) | Vita3K est le seul émulateur Vita et encore précoce partout ; attendez-vous à des casses par jeu. Aucun rapport BC-250. (Une phrase du chat « globalement une PS Vita poussée au max » concernait le matériel, pas l'émulateur. ([src](https://t.me/c/2424231195/86140))) |
| **PS3** | **RPCS3** | ⚠️ Fonctionne, réglage par jeu (chat) | La plus punitive pour le CPU des cibles réalistes. Uncharted « stable, jouable », « fonctionne très bien » rapportés ; un testeur précoce a rencontré des erreurs. Nécessite un réglage titre par titre. Une vidéo de tutoriel PS3 communautaire existe. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/74644), [src](https://t.me/c/2424231195/53601), [src](https://t.me/c/2424231195/13)) |
| **PS4** | **shadPS4** (0.9.0+ ; 0.16 en 2026) | ✅ Bloodborne / Drive Club jouables (chat) | « Se lance en 2 clics. » Bloodborne fluide & sans chutes ; Drive Club 100 % ; certains titres artefactent mais tiennent le FPS. Par jeu. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/38706), [src](https://t.me/c/2424231195/82128)) |

### Microsoft

| Système | Meilleur émulateur Linux | Statut sur BC-250 | Notes |
|--------|--------------------|------------------|-------|
| **Xbox (OG)** | **xemu** | ⚠ Devrait fonctionner (general ⚠) | xemu est LLE avec ~80 % des jeux jouables ; AppImage Linux native. Aucun rapport BC-250 — mais une cible légère pour ce CPU. Vérifiez par jeu. |
| **Xbox 360** | **Xenia** (stock) | ⚠️ Démarre, perf basse (chat) | Xenia simple tourne mais « les performances en stock sont au plancher » — l'overclock est obligatoire. ([src](https://t.me/c/2424231195/23577)) |
| **Xbox 360** | **Xenia Canary** | ❌ Écran noir en jeu (chat) | Les menus chargent et la manette répond, mais le gameplay est un écran noir. Sous Linux le backend Vulkan est encore incomplet. Non résolu. ([src](https://t.me/c/2424231195/78988)) |

### Sega

| Système | Meilleur émulateur Linux | Statut sur BC-250 | Notes |
|--------|--------------------|------------------|-------|
| **Master System** | Genesis Plus GX — RetroArch | ✅ Trivial (general ⚠) | Un core couvre SMS/Genesis/Game Gear/SG-1000/Sega CD. |
| **Genesis / Mega Drive** | Genesis Plus GX (BlastEm pour la précision) | ✅ Trivial (general ⚠) | Trivial pour ce matériel. |
| **Game Gear** | Genesis Plus GX — RetroArch | ✅ Trivial (general ⚠) | Même multi-core Sega. |
| **Saturn** | **Mednafen/Beetle Saturn** (ou Kronos) | ✅ Devrait aller (general ⚠) | La Saturn est célèbre pour être lourde à émuler côté CPU, mais triviale pour le Zen 2. Aucun rapport BC-250. |
| **Dreamcast** | **Flycast** (standalone ou RetroArch) | ✅ Devrait bien tourner (general ⚠) | Flycast est mature et léger ; confortable sur ce matériel. Non benchmarké dans le chat. |

### Autre / arcade / ordinateur

| Système | Meilleur émulateur Linux | Statut sur BC-250 | Notes |
|--------|--------------------|------------------|-------|
| **Arcade / MAME** | **MAME** (ou FinalBurn Neo) — RetroArch | ✅ Facile pour la plupart (general ⚠) | FBNeo pour les sets courants ; MAME complet pour tout. Les cartes d'arcade lourdes de la fin des années 90/3D peuvent rester exigeantes. |
| **Neo Geo** | **FinalBurn Neo** — RetroArch | ✅ Trivial (general ⚠) | FBNeo est le choix Neo Geo / CPS. |
| **TurboGrafx-16 / PC Engine** | **Beetle PCE** — RetroArch | ✅ Trivial (general ⚠) | Core Beetle/Mednafen PCE. |
| **Atari (2600/5200/7800/ST/…)** | Stella / RetroArch (Atari800, Hatari) | ✅ Trivial (general ⚠) | Stella pour la 2600 ; des cores existent pour le reste. |
| **DOS** | **DOSBox** (DOSBox-Staging / DOSBox-X) | ✅ Trivial (general ⚠) | Ou le core RetroArch DOSBox-Pure. |
| **ScummVM** | **ScummVM** (Linux natif) | ✅ Trivial (general ⚠) | Réimplémentation de moteur, pas de l'émulation — tourne partout. |

> ✅ fonctionne / trivial · ⚠️ fonctionne avec réserves · ❌ cassé · **(chat)** = rapport BC-250 de première main (cité) · **(general ⚠)** = meilleur émulateur Linux + attente pour cette classe de matériel, **non testé sur BC-250**.

---

## Attentes réalistes — ce qui est facile vs difficile

| Palier | Systèmes | Réalité sur un BC-250 à 2000 MHz, refroidi |
|------|---------|--------------------------------------|
| **Confortable** | NES · SNES · GB/GBC/GBA · N64 · DS · 3DS · **PS1 · PS2 · PSP** · Genesis/SMS/Game Gear · Saturn · Dreamcast · Arcade/Neo Geo/PCE · Atari · DOS · ScummVM · **GameCube · Wii** | Le point idéal de la carte. Le rétro est trivial ; la PSP est confirmée par le chat à 4× res ; PS2/GC/Wii sont bien dans la classe de ce matériel (attente générale — benchmarkez vos propres titres exigeants). Utilisez EmuDeck ou RetroArch et c'est parti. |
| **Exigeant / inégal** | **Switch · PS3 · PS4** | Réel, mais CPU-bound et par jeu. Switch (Eden) « bien et vite » mais les gros first-party chutent ; PS4 (shadPS4) super pour les bons titres (Bloodborne) ; PS3 (RPCS3) fonctionne mais nécessite un réglage par jeu. Réglez le governor au max d'abord. |
| **À peine / pas encore** | **Xbox 360** · Wii U · PS Vita | Xenia démarre les menus puis écran noir en gameplay (chat). Wii U (Cemu) et Vita (Vita3K) sont non confirmées sur la carte et exigeantes/expérimentales en général — vérifiez avant de compter dessus. |
| **Une expérience sans tracas, sans OC** | (tout système exigeant) | Non. Sans l'overclock le GPU se sous-cadence dans les émulateurs et même la Switch s'étouffe. Faites l'OC + refroidissement d'abord. |

---

## Sources

- Récapitulatif d'émulateurs (Switch/Eden, PS3/RPCS3, PS4/shadPS4, Xbox360/Xenia) — https://t.me/c/2424231195/78988
- « Eden est le plus correct » — https://t.me/c/2424231195/130842 · Eden s'installe & fonctionne — https://t.me/c/2424231195/98942 · Eden + Ryujinx EmuDeck — https://t.me/c/2424231195/99039 · Ryujinx tournait — https://t.me/c/2424231195/51606 · TOTK sur Eden chute des images (NX Optimizer) — https://t.me/c/2424231195/124216 · le CPU est le mur, GPU sous-utilisé — https://t.me/c/2424231195/136712
- État précoce des émulateurs (Yuzu/Suyu bloqués, Ryujinx ok, Xenia bas, RPCS3 erreurs) — https://t.me/c/2424231195/23577
- PS4/shadPS4 Bloodborne (« 2 clics ») — https://t.me/c/2424231195/38704 · https://t.me/c/2424231195/38706 · Drive Club 100 % — https://t.me/c/2424231195/82128
- PS3/RPCS3 Uncharted stable & jouable — https://t.me/c/2424231195/74644 · « fonctionne très bien dans RPCS3 » — https://t.me/c/2424231195/53601 · vidéo de tutoriel d'émulation PS3 — https://t.me/c/2424231195/13
- PSP/PPSSPP tournait (4× résolution, pas de throttle) — https://t.me/c/2424231195/101579 · https://t.me/c/2424231195/103218 · https://t.me/c/2424231195/111096
- Wii U/Cemu demandé sur noyau 6.15+ — https://t.me/c/2424231195/68253 · cemu via AUR (paru) — https://t.me/c/2424231195/74138
- Dolphin depuis le terminal — https://t.me/c/2424231195/19715 · « globalement une PS Vita poussée au max » (matériel, pas émulateur) — https://t.me/c/2424231195/86140
- Governor bloqué à 1000 MHz dans l'émulateur ; réglez le max manuellement — https://t.me/c/2424231195/130879 · https://t.me/c/2424231195/130955 · patch Zelda 30→60 — https://t.me/c/2424231195/130887
- Pas d'image préconfigurée (tabou communautaire) — https://t.me/c/2424231195/130845 · https://t.me/c/2424231195/130877
- Nintendo poursuit en justice les émulateurs Switch / clés difficiles à trouver — https://t.me/c/2424231195/136649
- Batocera (distribution d'émulation) confirmée tournant sur le BC-250 — [fil r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- Spec matérielle (6× Zen 2 @ ~3,5 GHz, RDNA2 24→40 CU, 16 Go GDDR6) — [elektricm/amd-bc250-docs](https://elektricm.github.io/amd-bc250-docs/hardware/specifications/)
- Cadrage général de la capacité d'émulation (⚠ à vérifier ; ce guide tiers compte mal les cœurs comme 8) — [guide BC-250 koukan.co.uk](https://www.koukan.co.uk/blog/amd-bc-250-guide)

> L'overclock dont dépendent ces résultats vit dans [09-overclock-undervolt.md](09-overclock-undervolt.md) ; faites le mod [04-cooling.md](04-cooling.md) avant de faire tourner 2000 MHz. Pour le panorama plus large du jeu et l'explication du CPU-bound, voir [11-gaming.md](11-gaming.md) ; pour installer l'OS sur lequel tournent les émulateurs, voir [06-linux.md](06-linux.md).
