> 🌐 Traduction communautaire. La [version anglaise](../en/07-windows.md) fait foi et peut être plus à jour. Une erreur ? [Ouvrez une issue](https://github.com/lildebil0/awesome-bc250/issues).

# Pilotes & configuration Windows

> **En bref** — En **ce début 2026, il n'existe aucun pilote GPU Windows fonctionnel pour le BC-250.** Windows s'installe et démarre, mais le GPU reste en **Code 43** avec zéro accélération 3D — chaque pilote AMD du commerce (Adrenalin, Pro, l'astuce du `.inf` W5700) est rejeté par le matériel. La communauté est en train d'en **rétro-concevoir un de zéro**, et l'état honnête est « la plomberie de base fonctionne, rien ne rend encore les jeux ». Si vous voulez réellement *utiliser* cette carte aujourd'hui, **installez Linux** ([06-linux.md](06-linux.md)) — c'est là que vit le pilote fonctionnel. Traitez tout ce qui se trouve sur cette page avec scepticisme et vérifiez les dates des commits des dépôts avant de leur faire confiance.

Le verdict de longue date de la communauté, épinglé pour les débutants depuis 2025 : *« Abandonnez tout espoir, vous qui entrez ici. Les pilotes Windows n'arriveront pas avec 99,5 % de probabilité. Sans pilote, cette carte est presque complètement inutile. Le pilote Linux existe — si vous n'êtes pas prêt pour cet OS, vous n'avez pas besoin de cette carte. »* ([src](https://t.me/c/2424231195/28109))

C'était le consensus pendant plus d'un an. Il est **enfin remis en question** en 2026 — mais lentement, et la réponse honnête reste : pas encore.

---

## Pourquoi Windows est difficile ici (le mur du Code 43)

L'APU du BC-250 (« Cyan Skillfish » / Oberon, GFX10.1.3) se présente à l'OS comme un **périphérique inconnu** — PCI ID `1002:13FE` — qu'aucun pilote AMD commercialisé ne reconnaît. Les gens ont tout essayé :

- **Forcer un `.inf` officiel** dans le Gestionnaire de périphériques : le seul pilote que Windows propose comme « compatible » est le **Radeon Pro W5700**. Il s'installe, puis se fige sur l'**erreur 43**, exactement comme tous les autres pilotes essayés. ([src](https://t.me/c/2424231195/57123))
- **Éditer le `.inf` / échanger les ID de périphérique** (gfx1013, 1014, Navi 21/22/23 « Dragonball », entrées legacy), désactiver l'application de la signature des pilotes, voire démarrer Windows 10 depuis une clé USB et essayer un pilote de Steam Deck — **toutes des impasses**. Les entrées legacy apparaissent sans erreur seulement à cause d'un bug d'affichage, pas parce qu'elles fonctionnent. ([src](https://t.me/c/2424231195/94029))
- **Modder le BIOS** pour changer l'ID de périphérique n'a pas aidé non plus — l'iGPU rapporte toujours `1002:13FE`. Le Dev ID semble **soudé à l'APU**, pas seulement au BIOS, donc patcher un seul endroit ne suffit pas. ([src](https://t.me/c/2424231195/57123))

Pourquoi Linux fonctionne et pas Windows ? Sous Linux, la pile open-source **amdgpu/Mesa** a été patchée par la communauté (et partiellement intégrée en amont) pour reconnaître exactement cette puce ; sous Windows, il n'y a aucun pilote ouvert à patcher — AMD n'a jamais livré de pilote Windows pour cette pièce de minage/serveur, et la pile fermée Adrenalin/Pro refuse l'ID inconnu. ([src](https://t.me/c/2424231195/13210)) Le propre fil du forum d'AMD sur les « pilotes BC-250 » n'a mené nulle part. ([community.amd.com](https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692))

> **Il n'y a pas non plus d'échappatoire par passthrough GPU.** Faire tourner Windows dans une VM avec le BC-250 passé en passthrough ne fonctionne pas : le chemin de passthrough IOMMU est cassé sur cette carte, c'est un *APU* (pas une carte dédiée que l'hôte peut transmettre proprement), et la puce est mal détectée comme périphérique inconnu d'entrée de jeu. ([src](https://t.me/c/2424231195/64772))

---

## État actuel des pilotes — ce qui existe réellement (en ce début 2026)

Fin 2025, la communauté a cessé d'attendre AMD et a commencé à **construire un pilote Windows de zéro** en rétro-concevant le matériel. Deux efforts comptent ; les deux sont **expérimentaux, en cours (WIP), et ne rendent pas encore les jeux.**

### Keshas-dev — le pilote WDDM from scratch (le plus actif)

Une paire de pilotes en mode noyau complémentaires, l'effort Windows le plus activement développé (le **pilote PSP à lui seul compte ~56 commits** à l'heure où ces lignes sont écrites) :

- **[Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver)** — un pilote bas niveau pour le **PSP** (Platform Security Processor). **Ce qui fonctionne :** il se charge, démarre le **firmware SOS**, lit/écrit les registres matériels via BAR5 MMIO (blocs GC, MMHUB, HDP, NBIO, DF), effectue le déblocage NBIO, et agit comme proxy de registres pour le pilote GPU. **Ce qui ne fonctionne pas :** la création de l'anneau GPCOM (le firmware SOS ne supporte pas le protocole d'anneau TOS), le chargement du firmware GPU via ring buffer, et l'init de la Trusted Memory Region. Autrement dit : il peut dialoguer avec la puce, mais **ne peut pas encore faire démarrer le moteur graphique.** ([dépôt](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver/commits/main/))
- **[Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver)** — le pilote GPU compagnon. Il partage la même infrastructure de certificat/signature de test que le pilote PSP et l'utilise comme pont de registres. Encore précoce ; aucune sortie 3D utilisable. ([dépôt](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver/commits/main/))

Le premier signe de vie public a été un membre rapportant **« mon premier pilote fonctionnel (OpenGL 1.1) »** en octobre 2025 ([src](https://t.me/c/2424231195/83320)) — célébré précisément parce que même un pilote à peine fonctionnel *qui s'installe et tourne* était un vrai jalon après un an de Code 43 : *« si ce pilote s'est vraiment installé et fonctionne (même mal) — c'est un pas énorme. »* ([src](https://t.me/c/2424231195/83332)) Un dump de pilote de cette vague, `AMD Radeon BC-250 (Cyan Skillfish) driver 00.00.01.7z`, a été partagé/épinglé dans le chat. ([src](https://t.me/c/2424231195/83322)) **Traitez tout dump précoce de ce type comme expérimental — la version `00.00.01` est exactement aussi brute qu'elle en a l'air.**

### ZEROAESQUERDA — l'implémentation de référence WDDM 2.0

**[ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest)** — un effort séparé (« le gars portugais a lancé quelque chose »), épinglé dans le chat en mars 2026 comme signe que la glace se brisait. ([src](https://t.me/c/2424231195/123644)) Il vaut mieux le comprendre comme une **implémentation de référence/éducative WDDM 2.0**, pas un pilote utilisable :

- Implémente uniquement le **DDI Direct3D 9** ; **D3D11, D3D12 et Vulkan ne sont pas implémentés.**
- **La compilation de shaders pour RDNA2 (ISA GFX10.1) n'est pas fonctionnelle** — il accepte les soumissions de shaders mais ne peut pas les compiler pour le matériel réel, donc rien ne se rend.
- Ne charge **pas** le microcode du Command Processor (s'appuie sur le firmware chargé par le BIOS) ; **encodage/décodage vidéo VCN non supporté** ; sortie DisplayPort unique seulement.
- Nécessite le **mode test-signing** (aucune signature WHQL). Seulement ~2 commits sur main.

Consultez la propre section **[Limitations connues](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas)** du projet avant d'y passer du temps.

> ⚠ **Correction de nommage de dépôt.** La liste principale des dépôts pointe vers `ZEROAESQUERDA/PS5GPU-BC250` sous « Drivers → Windows ». À l'inspection, ce dépôt est un **governor GPU Linux** (un fork d'Oberon-governor avec une GUI), **pas** un pilote Windows. Le vrai code Windows de cet auteur est **`BC250-windowsDriverTest`**.

### État en un coup d'œil

| Projet | Type | Ce qui fonctionne | Ce qui ne fonctionne pas | L'utiliser aujourd'hui ? |
|---|---|---|---|---|
| Keshas-dev/AMD-BC-250-PSP-Driver | Pilote noyau PSP (WIP) | Démarre le firmware SOS, R/W registres BAR5, déblocage NBIO, proxy de registres | Création d'anneau GPU, chargement FW, init TMR | Non — plomberie seulement |
| Keshas-dev/AMD-BC-250-Windows-Driver | Pilote GPU (WIP) | Se charge aux côtés du pilote PSP | Pas de 3D utilisable | Non |
| ZEROAESQUERDA/BC250-windowsDriverTest | Référence WDDM 2.0 | Échafaudage du modèle de pilote, DDI D3D9 présent | Compilation de shaders, D3D11/12, Vulkan, VCN | Non — éducatif |
| Adrenalin / Pro / `.inf` W5700 | AMD officiel | — | **Code 43**, rien | Non |

**Conclusion :** personne ne joue à des jeux sous Windows sur un BC-250 aujourd'hui. Le travail est réel et s'accélère, mais il en est au stade « peut-on faire initialiser le GPU tout court », pas au stade « quel est mon FPS dans Cyberpunk ».

---

## Si vous voulez quand même essayer les pilotes WIP

C'est pour les bricoleurs qui veulent **aider à tester**, pas pour obtenir un bureau fonctionnel. Il vous faudra :

- **Windows 10 (build 1607+) ou Windows 11, x64.**
- **Test signing activé** et **Secure Boot désactivé** (ces pilotes sont non signés / signés en test) :
  ```
  bcdedit /set testsigning on
  ```
  Redémarrez. ⚠ verify — les étapes exactes suivent le README de chaque dépôt ; les commandes ici sont le flux standard de signature de test WDK, pas copiées d'un script de projet.
- Installez via le **script PowerShell** fourni par le dépôt (p. ex. `Install-Driver.ps1`) ou manuellement avec `pnputil`. Suivez le **README du dépôt**, pas cette page — ces projets évoluent vite et les étapes d'installation changent avec eux.

À attendre : au mieux le périphérique s'énumère et des logs d'init précoce apparaissent ; au pire, rien ne change ou vous obtenez un code d'erreur différent. **Sauvegardez tout ce qui vous tient à cœur et supposez que ça ne rendra rien.**

### ⚠ Rumeur non vérifiée : « la fuite de pilotes bricke la carte »

Pendant la phase de bêta-test du début 2025, un membre a averti que des **BC-250 étaient brickés à distance pour avoir fait fuiter des pilotes préliminaires** — en évoquant des rapports Reddit de brick, de blocages de périphérique à distance, et qu'un programmateur matériel lui-même ne pouvait pas les débloquer. ([src](https://t.me/c/2424231195/26231)) **Nous n'avons pas pu vérifier cela**, et tout le cadrage « bêta privée » qui l'entoure est douteux (voir la section suivante). Mentionné par souci d'exhaustivité ; ne le traitez pas comme un fait établi. Si vous brickez une carte pour des raisons sans rapport, voir [08-bios.md](08-bios.md) pour la récupération.

---

## Canulars, blagues & impasses — ne tombez pas dans le panneau

La hype des pilotes Windows sur le BC-250 a une longue histoire de **farces et de vœux pieux**. Connaissez les plus célèbres pour ne pas gâcher un week-end :

- **Le « pilote NVIDIA pour AMD BC-250 ».** Une blague du **poisson d'avril (1er avril 2026)** — une fausse bannière soignée « NVIDIA NEW DRIVER RELEASE … for AMD BC-250 » qui a brièvement fait demander aux gens *« est-ce que NVIDIA a vraiment sorti un pilote Windows BC-250 ?! »* ([src](https://t.me/c/2424231195/130053)) Non. NVIDIA ne fait pas de pilotes pour un APU AMD. La réaction dans le chat fut *« la blague tant attendue est arrivée. »* ([src](https://t.me/c/2424231195/130727)) Notez aussi qu'un `.exe` nommé comme `whql-amd-software-adrenalin-edition-25.5.1-...-bc250.exe` a circulé — un installateur Adrenalin normal avec « bc250 » collé au nom de fichier n'en fait **pas** un pilote BC-250. ([src](https://t.me/c/2424231195/73924))
- **« Force juste l'installation du pilote d'une carte similaire. »** RX 6700 / W5700 / Radeon Pro V340 — la première idée de chaque débutant, et elle est venue à *« chaque idiot qui a un jour tenu un BC-250 ».* Ça ne peut pas marcher, pour une pile de raisons qu'il n'est pas utile de re-dériver : **il n'y a pas de pilotes Windows, pas d'honneur, et pas de bière sur le BC-250.** ([src](https://t.me/c/2424231195/29710))
- **Des malwares dans le canal.** Des gens ont posté de faux « pilotes » qui étaient des virus / zip-bombs / phishers. Les modos bannissent à vue ; un fichier littéralement nommé `Trojan.txt` est déjà apparu. ([src](https://t.me/c/2424231195/49668)) **N'exécutez que des binaires des dépôts GitHub nommés, et lisez le code.**

---

## Et ce script de déblocage des 40 CU dont les gens parlent ?

`git clone https://github.com/duggasco/bc250-40cu-unlock.git` apparaît dans les discussions du topic Windows, et la liste de ressources principale le marque même sous « Windows ». **C'est un patch/script noyau `amdgpu` Linux** (`bc250-enable-40cu.sh`), pas un outil Windows — il débloque les 40 CU sur le pilote Linux. Il est traité correctement dans [09-overclock-undervolt.md](09-overclock-undervolt.md) ; il ne fait rien pour Windows. ⚠ verify (aucun historique shell du corpus de commandes ne confirme un usage Windows ; la seule commande capturée est le simple `git clone` ci-dessus).

---

## Recommandation

| Vous voulez… | Faites ceci |
|---|---|
| Jouer / utiliser réellement la carte maintenant | **Installez Linux.** Voir [06-linux.md](06-linux.md). Le pilote GPU fonctionnel n'existe que là. |
| Suivre / contribuer à l'effort Windows | Surveillez **Keshas-dev** (pilote PSP + GPU) et **ZEROAESQUERDA/BC250-windowsDriverTest** ; attendez-vous à du travail noyau/WDK, pas à du jeu. |
| Un `.inf` magique ou un pilote de « carte similaire » | Il n'y en a pas. Arrêtez-vous là — vous ne ferez que tomber sur le Code 43. |

Le support Windows est une **cible mouvante** : revérifiez les dates des commits des dépôts et la date de cette section (elle reflète **le début 2026**) avant d'agir. Le verdict de 2025 était « jamais » ; 2026 l'a rétrogradé à « pas encore » — un vrai progrès, mais un progrès à la couche d'init du firmware, pas à celle du bureau jouable.

---

## Sources

- Mise en garde épinglée pour débutants (« abandonnez tout espoir ») — https://t.me/c/2424231195/28109
- Code 43 / `.inf` W5700 / tentatives de mod BIOS — https://t.me/c/2424231195/57123 · https://t.me/c/2424231195/94029
- « Pas de pilotes Windows, pas d'honneur, pas de bière » — https://t.me/c/2424231195/29710 · pourquoi Linux et pas Windows — https://t.me/c/2424231195/13210
- Le passthrough VM ne marchera pas — https://t.me/c/2424231195/64772
- Premier pilote « fonctionnel » (OpenGL 1.1) & réaction — https://t.me/c/2424231195/83320 · https://t.me/c/2424231195/83332 · dump de pilote `00.00.01` — https://t.me/c/2424231195/83322
- Projet ZEROAESQUERDA épinglé / « la glace se brise » — https://t.me/c/2424231195/123644
- Poisson d'avril « pilote NVIDIA » — https://t.me/c/2424231195/130053 · https://t.me/c/2424231195/130727 · `.exe` Adrenalin mal étiqueté — https://t.me/c/2424231195/73924
- Politique de ban des malwares — https://t.me/c/2424231195/49668 · rumeur brick-à-la-fuite (non vérifiée) — https://t.me/c/2424231195/26231
- Dépôts — [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) · [Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver) · [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) ([limitations connues](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas))
- Fil du forum AMD (qui n'a mené nulle part) — https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692
- Déblocage 40 CU (Linux, mal étiqueté Windows) — https://github.com/duggasco/bc250-40cu-unlock → voir [09-overclock-undervolt.md](09-overclock-undervolt.md)

> Le déblocage des 40 CU, le governor et la configuration du pilote Linux vivent dans [06-linux.md](06-linux.md) et [09-overclock-undervolt.md](09-overclock-undervolt.md). Récupération de brick : [08-bios.md](08-bios.md).
