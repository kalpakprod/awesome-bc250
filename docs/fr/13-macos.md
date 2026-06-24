> 🌐 Traduction communautaire. La [version anglaise](../en/13-macos.md) fait foi et peut être plus à jour. Une erreur ? [Ouvrez une issue](https://github.com/lildebil0/awesome-bc250/issues).

# macOS / Hackintosh

> **TL;DR** — **N'y pensez pas.** Vous pouvez probablement démarrer macOS sur le CPU du BC-250 (c'est une puce AMD Zen 2, et les astuces génériques de hackintosh AMD-OSX s'appliquent), mais le **GPU ne sera pas accéléré** et il n'existe aucune voie réaliste pour y parvenir. macOS prend en charge les GPU par ID de périphérique codé en dur ; le GPU du BC-250 (Cyan Skillfish / Oberon, une pièce de PS5 bridée) n'a **aucun jumeau de bureau nativement pris en charge contre lequel se faire passer**, et la pile d'Apple n'a *jamais* été conçue pour piloter les graphiques intégrés d'un quelconque APU AMD. Vous obtiendriez donc un Mac lent, rendu en logiciel, sans Metal. En 2026, personne dans la communauté n'a rapporté de résultat accéléré fonctionnel. Utilisez Linux à la place — voir [06-linux.md](06-linux.md).

C'est une **curiosité de niche**, pas un véritable cas d'usage. La réponse honnête, c'est toute la section.

---

## Pourquoi l'accélération GPU est le mur

Les deux publications techniques les plus commentées du sujet aboutissent à la même conclusion, et elles expliquent clairement le mécanisme.

macOS n'a pas de modèle de pilote ouvert comme Linux. Il livre des pilotes fermés qui se lient à des GPU spécifiques **par ID de périphérique**, et le seul endroit où vous pouvez intervenir est le bootloader **OpenCore** *avant* le chargement de l'OS — OpenCore fournit à macOS des données pré-cuisinées, il ne peut pas patcher le système fermé de l'intérieur ([src](https://t.me/c/2424231195/103173)).

OpenCore *peut* usurper l'ID de périphérique d'un GPU, mais uniquement **au sein d'une même famille architecturale** — par ex. présenter une RX 6950 XT non prise en charge comme une RX 6900 XT prise en charge, parce qu'elles sont le *même* silicium. Cette astuce a pris **plus d'un an** aux développeurs d'OpenCore et n'a fonctionné que parce que ces cartes Navi sont architecturalement identiques à celles qu'Apple prenait déjà en charge ([src](https://t.me/c/2424231195/53321)).

Le BC-250 casse cela de deux façons :

1. **Aucun jumeau à usurper.** Son GPU est une pièce bridée dérivée de la PS5 (`gfx1013`). Il n'existe **aucune carte AMD de bureau de même architecture que macOS prend en charge nativement**, il n'y a donc rien dont se faire passer. Pour que le BC-250 fonctionne, la pile d'Apple devrait apprendre cet ID de périphérique de zéro — ce qui n'arrive que si les développeurs d'OpenCore prennent la puce en charge, et il n'y a aucune raison commerciale pour cela ([src](https://t.me/c/2424231195/53321)).
2. **C'est un APU, et les APU n'ont jamais fonctionné.** Même les graphiques intégrés Ryzen d'architecture de bureau (iGPU Vega / Navi) n'ont **jamais** été mis en route sous macOS, malgré le partage d'une micro-architecture avec des cartes discrètes prises en charge. L'auteur n'a « pas vu un seul cas fonctionnel » d'iGPU Ryzen sous macOS ([src](https://t.me/c/2424231195/103173)). Le BC-250 est dans le même panier APU.

Le résumé sans détour du même contributeur : *si même les pilotes Windows de cette puce ne sont pas réglés, il ne faut pas rêver de macOS* ([src](https://t.me/c/2424231195/53321)). (Pour la situation des pilotes Windows, voir [07-windows.md](07-windows.md).)

---

## Ce que les gens ont réellement essayé

- Quelqu'un a préparé et partagé tôt un paquet **macOS Monterey recovery + OpenCore** (`Monterey recovery + OpenCore.zip`, plus un `Архив.zip` antérieur), donc au moins une personne s'est lancée dans son installation ([src](https://t.me/c/2424231195/53590)). Aucun succès d'accélération GPU n'a jamais été rapporté en retour.
- L'outillage pertinent vers lequel les gens ont pointé est le kit standard de hackintosh AMD : la falsification d'ID de périphérique via [RehabMan/OS-X-Fake-PCI-ID](https://github.com/RehabMan/OS-X-Fake-PCI-ID), le [guide d'achat GPU AMD de Dortania](https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series) pour ce qui est réellement pris en charge, et — la chose la plus proche d'une prise en charge des graphiques d'APU — **[ChefKissInc/NootedRed](https://github.com/ChefKissInc/NootedRed)**, un kext pour iGPU d'APU AMD. NootedRed cible les APU de classe Vega/Renoir et ne couvre **pas** le die du BC-250, il ne sauve donc pas cette carte.
- Un lien de forum ultérieur sur l'[exécution de macOS sur AMD Ryzen via VMware/OpenCore](https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/) ([src](https://t.me/c/2424231195/107779)) est du **hackintosh AMD générique**, pas spécifique au BC-250 — et une VM signifie de toute façon aucun passthrough GPU/Metal.

> ⚠ **Ne confondez pas les blagues avec des résultats.** Le sujet contient des plaisanteries légères « génial, le puissant hackintosh règne ici » ([src](https://t.me/c/2424231195/85166)) et des réactions élogieuses qui ne sont *pas* des rapports d'un build macOS fonctionnel. Rien dans les preuves ne montre un macOS accéléré sur un BC-250.

---

## Alors, est-ce que ça en vaut la peine ?

**Non, pour quelque usage pratique que ce soit.** Le meilleur résultat réaliste est un macOS uniquement-CPU qui rend l'interface en logiciel — pas de Metal, pas de calcul GPU, inutilisable pour les charges de travail jeu/IA pour lesquelles cette carte est achetée. Le consensus de la communauté, daté et inchangé de **2025-06** à **2026-03**, est que la prise en charge GPU est effectivement impossible sans que les développeurs d'OpenCore adoptent spécifiquement cette puce, ce qui n'est pas arrivé et n'est pas attendu.

Si vous voulez que cette carte *fasse* quelque chose, installez Linux ([06-linux.md](06-linux.md)) où le GPU est véritablement pris en charge via Mesa/RADV. Windows est un lointain second ([07-windows.md](07-windows.md)). macOS est dernier et, en pratique, une impasse.

---

## Sources

- GPU-par-ID-de-périphérique + l'histoire de l'usurpation Navi en un an — https://t.me/c/2424231195/53321
- Limites d'OpenCore & « aucun iGPU Ryzen n'a jamais fonctionné » — https://t.me/c/2424231195/103173
- Paquet Monterey + OpenCore que quelqu'un a préparé — https://t.me/c/2424231195/53590
- Fil de forum hackintosh AMD-Ryzen générique (pas spécifique au BC-250) — https://t.me/c/2424231195/107779 · [fil amd-osx.com](https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/)
- Outillage référencé — [RehabMan/OS-X-Fake-PCI-ID](https://github.com/RehabMan/OS-X-Fake-PCI-ID) · [ChefKissInc/NootedRed](https://github.com/ChefKissInc/NootedRed) (kext iGPU d'APU AMD ; ne couvre pas ce die) · [guide GPU AMD de Dortania](https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series)
- Identité de la puce (Cyan Skillfish / Oberon, `gfx1013`) — voir [01-what-is-bc250.md](01-what-is-bc250.md)

> **En résumé :** macOS sur le BC-250 est une note de bas de page de tech-trivia, pas une cible de build. Allez à [06-linux.md](06-linux.md).
