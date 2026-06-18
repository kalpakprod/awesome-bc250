> 🌐 Traduction communautaire. La [version anglaise](../en/12-ai-llm.md) fait foi et peut être plus à jour. Une erreur ? [Ouvrez une issue](https://github.com/lildebil0/awesome-bc250/issues).

# IA / LLM sur BC-250

> **TL;DR** — L'attrait de la BC-250 pour l'IA, ce sont ses **16 Go de GDDR6** à prix cassé. La façon réaliste de l'exploiter, c'est **llama.cpp / Ollama sur le backend Vulkan (RADV)** — *et non* ROCm. Le GPU est **gfx1013 (Cyan Skillfish)**, qu'aucun build ROCm ne cible officiellement, si bien que ROCm est un trou de lapin profond que la plupart des gens évitent. Sous Vulkan, avec un modèle MoE qui tient en VRAM, la communauté observe environ **30–40 tok/s** (p. ex. gpt-oss-20b, Qwen3.5-35B-A3B, Gemma-4-26B-A3B). Le hic, c'est la **mémoire** : les 16 Go sont partagés CPU+GPU, donc les gros modèles vivent juste à la limite et l'OOM est l'échec n°1. Réglez la VRAM dans le BIOS, relevez la limite de pages TTM du noyau, et faites tourner des modèles **MoE** — c'est tout le jeu.

La BC-250 est une bonne *machine d'inférence à petit budget* et une mauvaise *machine d'entraînement*. Considérez-la comme « une carte de 16 Go qui fait tourner des modèles quantifiés sur Vulkan », et tout se passera bien.

---

## Pourquoi Vulkan, pas ROCm

La puce GPU est **Cyan Skillfish = `gfx1013`** (un composant de classe RDNA-1.x, frère du Navi 10/`gfx1010`). Ce seul fait décide de tout :

- **ROCm ne fournit pas de support pour `gfx1013`.** La pile ROCm d'AMD cible une liste blanche spécifique d'identifiants GPU, et Cyan Skillfish n'y figure pas. Le chemin officiel `ROCm/ROCm` ne voit donc tout simplement pas la carte. Concrètement : `gfx1013` *est* listé dans LLVM comme compatible `rocm-amdhsa`, mais **l'espace utilisateur ROCm d'AMD (rocBLAS/Tensile) ne fournit aucune bibliothèque mathématique (de solutions) pour `gfx1013`** — donc dès qu'un GEMM atteint rocBLAS, vous obtenez `rocblas_abort()` (« GFX1013 not in GPU list »). Il n'y a aucun noyau mathématique à appeler ([akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)).
- **Et même en mettant cela de côté, ROCm n'a aucun cache de shaders utilisable sur ces APU — il recompile à chaque lancement**, alors que le **backend Vulkan met en cache sur disque les shaders compilés**. Cela seul fait de Vulkan le chemin de calcul pratique : les tests d'akandr concluent que Vulkan était le seul chemin de calcul GPU jugé utilisable sur cette carte ([akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)). (Notez qu'il s'agit d'un manque *pilote/bibliothèque*, **et non** d'une fonctionnalité matérielle absente — l'ISA `gfx103x` de RDNA2 inclut bien le dp4a INT8, p. ex. `v_dot4c_i32_i8` ; le problème, c'est purement que ROCm ne fournit rien pour cet identifiant.)
- Les dépôts bien connus pour « débloquer ROCm sur les vieilles cartes » **ne le couvrent pas non plus** :
  - [`woodrex83/ROCm-For-RX580`](https://github.com/woodrex83/ROCm-For-RX580) est **`gfx803` uniquement** (Polaris : RX 580/570/480). Architecture entièrement différente — inutilisable ici.
  - [`ulyssesrr/docker-rocm-xtra`](https://github.com/ulyssesrr/docker-rocm-xtra) ajoute des cibles supplémentaires (`gfx803`, `gfx900/906/908`, `gfx1010/1011/1012`, `gfx1030…`) — mais **`gfx1013` n'est pas dans la liste**, et le dépôt a été **archivé le 2025-08-12**. Vous pouvez *essayer* de vous faire passer pour `gfx1010` (Navi 10) avec `HSA_OVERRIDE_GFX_VERSION=10.1.0`, de la même manière que les gens créent un lien symbolique du firmware Navi 10 pour faire fonctionner le pilote d'affichage (`navi10_gpu_info.bin → cyan_skillfish_gpu_info.bin`, [src](https://t.me/c/2424231195/7458/136321)), mais c'est non vérifié pour le calcul sur la BC-250 et personne dans le chat ne rapporte une pile LLM ROCm fonctionnelle.  ⚠ à vérifier

Les autres dépôts que les gens citent — [`xuhuisheng/rocm-build` (navi10)](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) et [`robertrosenbusch/gfx803_rocm`](https://github.com/robertrosenbusch/gfx803_rocm) — sont respectivement pour les dGPU Navi 10 et Polaris, pas pour Cyan Skillfish. Ils sont utiles comme contexte, pas comme recette pour cette carte.

**En résumé (à la mi-2026) :** ROCm sur la BC-250 est un bricolage non résolu/non rentable. Chaque configuration fonctionnelle partagée par la communauté tourne sur **Vulkan via Mesa RADV**, que la pile de pilotes de la BC-250 vous donne déjà pour le jeu. Si quelqu'un parvient à faire fonctionner ROCm, ce sera en se faisant passer pour `gfx1010` dans un conteneur modifié — attendez-vous à perdre un week-end, sans garantie.

> **Mise à jour — quelqu'un a réussi à faire fonctionner HIP/ROCm (Discord, mi-2026).** Postérieur au verdict « personne ne signale de pile fonctionnelle » ci-dessus, un membre a signalé **le fonctionnement des calculs ROCm, HIP et PyTorch** sur la BC-250 après avoir **modifié le micrologiciel MEC**, changé les paramètres du BIOS et recompilé la pile ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1482848457478901851)). Sur cette voie, **`llama.cpp` compilé avec HIP** a mesuré **709 tok/s sur TinyLlama-1.1B (pp512)** et **115 tok/s sur Llama-3.1-8B (pp512)** aux fréquences d'origine ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1483073888551440384)), et le prefill a progressé avec le déverrouillage des CU — **~230 tok/s à 24 CU (94–95 W) contre 371.6 tok/s à 40 CU (125 W), les deux à 1500 MHz** ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1506023598048022588)). Il s'agit d'une méthode expérimentale, touchant au cœur du micrologiciel — ce n'est pas la voie recommandée — mais cela montre que le verdict « ROCm est impossible » n'est plus absolu. ⚠ avancé.

---

## L'avantage des 16 Go de VRAM (et son hic)

16 Go suffisent à loger un modèle de 20–35B lorsqu'il est **quantifié** (Q3–Q4) — de la VRAM qui vous coûterait sinon une 4060 Ti 16 Go ou une 3090 d'occasion. C'est toute la raison pour laquelle la carte est intéressante pour les LLM.

Le hic : **les 16 Go sont partagés entre le CPU et le GPU.** Il n'y a pas de réserve de RAM système séparée pour se rabattre. Donc :

- Le modèle + le KV-cache + l'OS + chaque processus en arrière-plan tiennent tous dans les *mêmes* 16 Go.
- Poussez le modèle trop gros et vous n'obtenez pas du « lent » — vous obtenez un **OOM** brutal, et sur certaines distributions KDE s'effondre et vous renvoie à une console ([src](https://t.me/c/2424231195/101077)).
- Le verdict d'un contributeur régulier après des mois de tests : *« La performance suffit pour beaucoup de choses ; c'est la **mémoire** qui ne suffit pas. »* ([src](https://t.me/c/2424231195/101077))

Deux leviers vous donnent de la marge :

1. **Réglez la VRAM dans le BIOS.** Tourner avec `vram = 12` (Go) est une base de référence connue comme correcte qui laisse de la RAM au système ([src](https://t.me/c/2424231195/101077)). Des répartitions de VRAM plus élevées permettent de charger des modèles plus gros mais affament l'OS.
2. **Relevez la limite de pages TTM du noyau** pour que le gestionnaire de mémoire GPU distribue effectivement les grosses allocations dont un modèle 14B+ a besoin (voir la configuration ci-dessous). C'est le seul changement qui débloque les modèles plus gros sous Vulkan.

Une astuce communautaire pour récupérer 1–2 Go : faire tourner un **OS serveur sans interface graphique (headless)** et lui parler par le réseau (p. ex. Open WebUI / une API), pour qu'aucun bureau ne mange la VRAM ([src](https://t.me/c/2424231195/101077)).

---

## Faites tourner des modèles MoE, pas des modèles denses

C'est le choix de modélisation le plus important sur une machine de 16 Go à mémoire partagée, et le chat est explicite sur le pourquoi ([src](https://t.me/c/2424231195/125233)) :

- Pour un modèle **dense**, vous ne pouvez le répartir que *séquentiellement* couche par couche ; les astuces de parallélisme tensoriel n'aident pas, donc vous êtes limité par ce qui tient et par la bande passante brute.
- Pour un modèle **MoE**, vous gardez la partie dense/attention sur la carte et n'activez que quelques petits experts par token. Le résultat : **un modèle bien plus gros tient à une qualité correcte, et vous gagnez un multiplicateur de débit** parce que seule une fraction des poids est touchée par token.

C'est exactement pourquoi les modèles que les gens font réellement tourner sur la BC-250 sont des MoE avec un faible nombre de paramètres actifs : **gpt-oss-20b** (le favori du chat), **Qwen3.5-35B-A3B** (35B au total / ~3B actifs), **Gemma-4-26B-A3B**. Ils tapent bien plus fort que ce qu'un modèle dense de même empreinte VRAM pourrait faire.

> Une remarque connexe pour les configurations multi-cartes : pour le MoE, vous pouvez répartir des **colonnes d'experts** entre les cartes et gagner de la bande passante agrégée, alors que l'état caché d'un modèle dense est minuscule (~1 Mo même pour un 70B), de sorte qu'un lien gigabit entre nœuds n'est *pas* le goulot d'étranglement ([src](https://t.me/c/2424231195/125233)). Pour une seule BC-250 c'est sans objet, mais cela explique pourquoi les gens les enchaînent.

---

## Configuration A — Ollama + Vulkan (recommandée, reproductible)

La recette BC-250 la plus complète et reproductible est le guide communautaire [`akandr/bc250` → *Ollama + Vulkan setup*](https://github.com/akandr/bc250#3-ollama--vulkan-setup) (référencé à plusieurs reprises dans le chat). Il suppose une pile graphique BC-250 fonctionnelle (voir [06-linux.md](06-linux.md)) — Fedora avec un Mesa/RADV récent — puis superpose Ollama par-dessus. Reproduit depuis ce dépôt :

**1. Installer Ollama :**
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

**2. Activer le backend Vulkan + les options sûres pour la mémoire** via une surcharge systemd (`/etc/systemd/system/ollama.service.d/override.conf`) :
```ini
[Service]
Environment=OLLAMA_VULKAN=1
Environment=OLLAMA_FLASH_ATTENTION=1
Environment=OLLAMA_KV_CACHE_TYPE=q4_0
Environment=OLLAMA_MAX_LOADED_MODELS=1
Environment=OLLAMA_KEEP_ALIVE=30m
Environment=OLLAMA_CONTEXT_LENGTH=65536
Environment=OLLAMA_GPU_OVERHEAD=0
Environment=OLLAMA_MAX_QUEUE=4
OOMScoreAdjust=-1000
```
Puis :
```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```
`OLLAMA_FLASH_ATTENTION=1` et `OLLAMA_KV_CACHE_TYPE=q4_0` réduisent le KV-cache pour qu'un long contexte tienne ; `OOMScoreAdjust=-1000` empêche le noyau de tuer Ollama en premier sous pression mémoire.

**3. Le correctif mémoire clé — relever la limite de pages TTM** (c'est ce qui permet aux modèles 14B+ / à grand contexte de se charger du tout) :
```bash
echo 4194304 | sudo tee /sys/module/ttm/parameters/pages_limit
echo 4194304 | sudo tee /sys/module/ttm/parameters/page_pool_size
```
Le rendre persistant entre les redémarrages :
```bash
echo "options ttm pages_limit=4194304 page_pool_size=4194304" | \
  sudo tee /etc/modprobe.d/ttm-gpu-memory.conf
```

**4. Télécharger et lancer un modèle MoE**, p. ex. :
```bash
ollama run gpt-oss:20b
```

> Le guide `akandr/bc250` a été validé sur **Fedora 43 / noyau 6.18.9 / Mesa 25.3.4 RADV / Ollama 0.20.0**. Les versions exactes des paquets dériveront — conservez les variables d'environnement et le correctif TTM ; mettez à jour le reste. ⚠ vérifiez les versions par rapport au dépôt avant de copier.

**Empilez le governor Oberon.** Faire tourner [`mothenjoyer69/oberon-governor`](https://gitlab.com/mothenjoyer69/oberon-governor) (le même governor utilisé pour le jeu, voir [09-overclock-undervolt.md](09-overclock-undervolt.md)) est rapporté comme ajoutant **+10–20 tok/s sur gpt-oss-20b** en maintenant des fréquences plus élevées ([src](https://t.me/c/2424231195/101077)). C'est l'accélération la moins chère disponible.

---

## Configuration B — llama.cpp (Vulkan), compilé ou packagé

Si vous voulez `llama.cpp` brut (plus de contrôle, des GGUF de n'importe où, l'API compatible OpenAI de `llama-server`) :

**Arch / paru (la seule commande vérifiée dans le chat) :**
```bash
paru -S aur/llama.cpp-vulkan
```
([src](https://t.me/c/2424231195/101026) — la seule commande de build dans le corpus de chat de cette section ; recoupée avec le nom du paquet.)

**Compiler depuis les sources** (selon la [doc de build de `ggml-org/llama.cpp`](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md)) — Debian/Ubuntu :
```bash
sudo apt-get install libvulkan-dev glslc spirv-headers
cmake -B build -DGGML_VULKAN=1
cmake --build build --config Release
```
(Sur Fedora, le paquet des en-têtes SPIR-V est `spirv-headers-devel`.) Puis lancez avec toutes les couches sur le GPU :
```bash
./build/bin/llama-cli -m PATH_TO_MODEL.gguf -ngl 99 -p "Hi, how are you?"
```
`-ngl 99` décharge chaque couche vers le périphérique Vulkan. Utilisez `--list-devices` pour confirmer que la BC-250 est bien le périphérique choisi par llama.cpp, et `--device` pour le forcer si vous en avez plusieurs. Des binaires précompilés sont sur la [page des releases de llama.cpp](https://github.com/ggml-org/llama.cpp/releases).

> **Ne compilez pas le backend HIP/ROCm** (`-DGGML_HIP=ON -DGPU_TARGETS=gfx1013`). Il n'y a pas de runtime ROCm pour `gfx1013`, donc ça ne tournera pas même si ça compile. Vulkan est le chemin supporté ici. ([doc de build](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md))

**Front-ends que les gens utilisent vraiment :**
- **[Jan AI](https://jan.ai/)** — le pilote quotidien actuel du chat : grand sélecteur de modèles, réglages de contexte/outils, peut donner au modèle un accès web + lire des images/documents, support MCP. Fait tourner le modèle sur Vulkan en dessous ([src](https://t.me/c/2424231195/101077)).
- **[KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)** — wrapper llama.cpp à binaire unique avec Vulkan, pratique pour un déploiement en un fichier.
- **Open WebUI** — à associer à une machine headless pour la piloter depuis une autre machine (économise la VRAM du bureau).

---

## Attentes réalistes en token/s

Les chiffres ci-dessous sont **rapportés par la communauté sur Vulkan**, des modèles MoE dimensionnés pour tenir dans 16 Go. Traitez-les comme des ordres de grandeur, pas comme une suite de benchmarks — ils proviennent du guide `akandr/bc250` et du chat, sur une seule carte avec le correctif TTM + flash-attention + KV-cache `q4_0`.

| Modèle | Quant | Params actifs / total | Vitesse de génération rapportée |
|---|---|---|---|
| Qwen3.5-9B | Q4_K_M | dense 9B | ~32 tok/s |
| Gemma-4-26B-A3B (MoE) | UD-Q3_K_M | ~3B / 26B | ~39 tok/s |
| Qwen3.5-35B-A3B (MoE) | UD-IQ2_M | ~3B / 35B | ~38 tok/s |
| gpt-oss-20b (MoE, MXFP4) | MXFP4 | ~3.6B / 20B | favori de la communauté ; +10–20 tok/s avec le governor Oberon |

Sources : vitesses depuis [`akandr/bc250`](https://github.com/akandr/bc250#3-ollama--vulkan-setup) ; usage de gpt-oss-20b & gain du governor ([src](https://t.me/c/2424231195/101077)). Les GGUF des modèles viennent de Hugging Face — p. ex. [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF), [unsloth Qwen3.6-35B-A3B](https://huggingface.co/unsloth/Qwen3.6-35B-A3B-GGUF), [Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M).

**Lecture honnête :** ~30–40 tok/s sur un MoE de 20–35B est réellement utilisable pour le chat, l'aide au codage et les boucles d'agent/outils. Ce n'est **pas** une 4090. La qualité est plafonnée par la quantification agressive qu'imposent les 16 Go (IQ2/Q3 sur les modèles 35B) — et un utilisateur a noté que pousser un 30B dans un quant plus dur « fera probablement beaucoup d'erreurs » ([src](https://t.me/c/2424231195/101077)). Le point idéal, c'est **gpt-oss-20b**, décrit à plusieurs reprises comme « plus intelligent que tous les petits » tout en restant stable ([src](https://t.me/c/2424231195/101077)).

### Le déblocage des 40 CU accélère-t-il les LLM ? Oui — mesuré en direct sur un modèle dense

Le déblocage des 40 CU (voir [09-overclock-undervolt.md](09-overclock-undervolt.md)) aide l'inférence plus qu'il n'aide les jeux, parce que la génération de tokens utilise réellement les unités de calcul. Une vidéo l'a mesuré **en direct** en basculant les CU sur un modèle **dense** — Qwen3.5-9B (~10 Go de GDDR6) sur **Ollama + Vulkan** — et le débit suivait le nombre de CU presque linéairement ([Old Lamer — vidéo RU sur le déblocage des CU](https://youtu.be/M7PsojWr4KA), ~8:30–12:03) : *(⚠ sous-titres automatiques — traitez les décimales comme des ≈.)*

| CU actifs | Vitesse de génération | vs 24 CU |
|---|---|---|
| 24 CU (d'origine) | ≈25.7 tok/s | référence |
| palier de déblocage | ≈31.9 tok/s | **~+16–17 %** |
| 36 CU | ≈33.4 tok/s | **~+20 % au total** |

Cette carte **a plafonné à 36 CU** — les deux derniers CU étaient réellement défectueux et **llama plantait au chargement** quand ils étaient activés, un exemple concret du point « 38/40 est une loterie » du chapitre OC. L'environnement Ollama correspondait à la recette ci-dessus (`OLLAMA_VULKAN=1`, KV-cache `q4_0`, contexte 65536, `ttm.pages_limit=4194304`). Comme c'est un modèle *dense*, le gain est du pur scaling de CU — aucun multiplicateur de routage d'experts MoE par-dessus ([Old Lamer — vidéo RU sur le déblocage des CU](https://youtu.be/M7PsojWr4KA)).

Le guide `akandr/bc250` a réalisé un A/B plus complet sur des modèles **MoE** à travers le déblocage des 40 CU (le patch de déblocage lui-même vit dans [`duggasco/bc250-40cu-unlock`](https://github.com/duggasco/bc250-40cu-unlock), pas akandr ; akandr ajoute un contrôle de cohérence FP32 indépendant + une nouvelle mesure de débit). Deux écarts de génération majeurs, tous deux **via llama.cpp** ([akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results)) :

| Modèle | Quant | Gén @ 24 CU | Gén @ 40 CU | Δ |
|---|---|---|---|---|
| gpt-oss-20b (MoE) | MXFP4 | 66.1 tok/s | 87.5 tok/s | **+32 %** |
| Qwen3.5-35B-A3B (MoE) | — | 59.5 tok/s | 78.7 tok/s | **+32 %** |

Sur 11 modèles, la médiane était de **+32 % en génération / +50 % en prefill** grâce au déblocage. Deux choses à retenir de ce tableau : **gpt-oss-20b tourne confortablement (66 → 87 tok/s)**, ce qui confirme le favori du chat, et akandr a mesuré les modèles MoE **nettement plus rapides directement via `llama.cpp` qu'à travers Ollama** (le chemin de répartition d'experts d'Ollama est moins efficace pour cette architecture — p. ex. Qwen3.5-35B-A3B était à 25.1 tok/s sur Ollama contre 59.5 tok/s sur llama.cpp aux fréquences d'origine) ([akandr/bc250 §4](https://github.com/akandr/bc250#4-benchmarks)).

> 💬 **Points de données MoE non vérifiés (commentaires Hackaday — à traiter comme du ouï-dire).** Issus de commentaires de lecteurs plutôt que d'un essai reproduit : un Qwen « 27b » avec **MTP** (prédiction multi-token) à **≈14.5 tok/s**, et un « 35b » avec MTP à **≈47 tok/s**. L'écart important est exactement ce que produiraient le MTP + les différences de paramètres actifs MoE, mais aucun des deux chiffres n'est confirmé indépendamment ici — signalé pour le contexte, pas comme un benchmark. ⚠ à vérifier

---

## Ce qui est pénible (soyons honnêtes)

- **L'OOM est le mode d'échec par défaut.** Un gros modèle dans 16 Go de mémoire partagée = on vit à la limite. Attendez-vous à des plantages ; sur KDE le bureau peut mourir et ne laisser qu'une console ([src](https://t.me/c/2424231195/101077)). Atténuez avec la répartition VRAM dans le BIOS, le correctif TTM, le KV-cache `q4_0`, flash attention, et une configuration headless.
- **La stabilité des distributions varie.** Le chat a trouvé **Ubuntu plus stable que Fedora** pour ne pas planter sous pression mémoire sur Vulkan, bien que Fedora soit la base documentée ([src](https://t.me/c/2424231195/101077)). Si une distribution continue de planter en OOM, essayez l'autre.
- **ROCm est effectivement hors de question** (voir la section du haut). Ne brûlez pas des journées à courir après l'entraînement PyTorch/vLLM sur cette carte — [le chemin AMD de vLLM](https://docs.vllm.ai/en/latest/getting_started/installation/gpu/#amd-rocm) nécessite ROCm, qui nécessite un identifiant GPU supporté que cette carte n'a pas.
- **C'est une machine d'inférence, pas un entraîneur.** Le fine-tuning à une échelle réelle veut plus de VRAM et une pile de calcul fonctionnelle. Utilisez-la pour *faire tourner* des modèles, pas pour les entraîner.
- **Le débit dépend des fréquences.** Sans un governor maintenant des fréquences élevées, vous laissez 10–20 tok/s sur la table ([src](https://t.me/c/2424231195/101077)) ; le refroidissement compte aussi ici (voir [04-cooling.md](04-cooling.md)) puisque l'inférence soutenue est une charge soutenue.

---

## Configuration de départ recommandée

| Niveau | Faites ceci | Attendez-vous à |
|------|---------|--------|
| Minimum | Pile RADV fonctionnelle ([06-linux.md](06-linux.md)) → Ollama + `OLLAMA_VULKAN=1` → correctif TTM → `ollama run gpt-oss:20b` | ~30+ tok/s, chat stable |
| Mieux | Ajoutez le governor Oberon + flash-attn + KV-cache `q4_0` ; front-end via Jan AI | +10–20 tok/s, contexte plus long, outils/MCP |
| Modèle plus gros | 35B-A3B MoE en IQ2/Q3 avec `pages_limit` TTM relevé ; headless + Open WebUI pour libérer la VRAM | ~38 tok/s, près du plafond mémoire |
| À éviter | Entraînement ROCm / HIP / vLLM sur `gfx1013` | impasse, laissez tomber |

---

## Sources

- Recette LLM BC-250 (Ollama+Vulkan, correctif TTM, tok/s) — [akandr/bc250 §Ollama+Vulkan](https://github.com/akandr/bc250#3-ollama--vulkan-setup)
- Pourquoi ROCm échoue sur gfx1013 (pas de bibliothèques de solutions rocBLAS/Tensile → `rocblas_abort()` ; ROCm recompile à chaque lancement vs Vulkan met en cache les shaders) — [akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm) · l'ISA `gfx103x` de RDNA2 a le dp4a INT8 (`v_dot4c_i32_i8`), donc c'est un manque de bibliothèque, pas de matériel — [LLVM GFX1030 ISA](https://llvm.org/docs/AMDGPU/AMDGPUAsmGFX1030.html)
- Déblocage des 40 CU sur MoE, écarts de génération mesurés (gpt-oss-20b 66.1→87.5, Qwen3.5-35B-A3B 59.5→78.7, médiane +32 % gén / +50 % prefill sur 11 modèles ; llama.cpp ≫ Ollama pour le MoE) — [akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results) · [§4 benchmarks](https://github.com/akandr/bc250#4-benchmarks) · patch de déblocage : [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock)
- Configuration fonctionnelle, gpt-oss-20b, gain Oberon, notes OOM/distribution — https://t.me/c/2424231195/101077
- MoE vs dense, bande passante multi-cartes — https://t.me/c/2424231195/125233
- Scaling LLM du déblocage des 40 CU, mesuré en direct (⚠ ASR — approximatif) — Qwen3.5-9B dense sur Ollama+Vulkan : 25.7 → 31.9 → 33.4 tok/s (24 → déblocage → 36 CU, ~+20 % au total) ; carte plafonnée à 36 CU (2 CU défectueux, llama plantait au chargement) — [Old Lamer — vidéo RU sur le déblocage des CU](https://youtu.be/M7PsojWr4KA)
- Points de données MoE avec MTP (⚠ non vérifiés, commentaires Hackaday) — Qwen « 27b »+MTP ≈14.5 tk/s, « 35b »+MTP ≈47 tk/s — fil de commentaires de l'article Hackaday sur la BC-250
- Commande de paquet vérifiée — https://t.me/c/2424231195/101026 · lien symbolique firmware Navi10→Cyan Skillfish — https://t.me/c/2424231195/7458/136321
- Build llama.cpp (Vulkan / HIP) — [ggml-org/llama.cpp build.md](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md) · [releases](https://github.com/ggml-org/llama.cpp/releases) · [install](https://github.com/ggml-org/llama.cpp/blob/master/docs/install.md)
- Réalité de ROCm sur gfx1013 — [ROCm/ROCm](https://github.com/ROCm/ROCm) · [woodrex83/ROCm-For-RX580 (gfx803 uniquement)](https://github.com/woodrex83/ROCm-For-RX580) · [ulyssesrr/docker-rocm-xtra (archivé ; pas de gfx1013)](https://github.com/ulyssesrr/docker-rocm-xtra) · [xuhuisheng/rocm-build navi10](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) · [robertrosenbusch/gfx803_rocm](https://github.com/robertrosenbusch/gfx803_rocm)
- Front-ends — [Jan AI](https://jan.ai/) · [KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)
- Modèles (GGUF) — [Hugging Face](https://huggingface.co/) · [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF) · [Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M)
- Overclock/governor — [09-overclock-undervolt.md](09-overclock-undervolt.md) · Base Linux — [06-linux.md](06-linux.md) · Refroidissement — [04-cooling.md](04-cooling.md)
