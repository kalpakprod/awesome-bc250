> 🌐 Community-Übersetzung. Die englische Version ist die maßgebliche Quelle und kann aktueller sein. Fehler gefunden? Öffne ein [Issue](https://github.com/lildebil0/awesome-bc250/issues). ([englisches Original](../en/12-ai-llm.md))

# KI / LLM auf der BC-250

> **TL;DR** — Der Reiz der BC-250 für KI sind ihre **16 GB GDDR6** zum Ramsch-Preis. Der realistische Weg, sie zu nutzen, ist **llama.cpp / Ollama auf dem Vulkan-(RADV-)Backend** — *nicht* ROCm. Die GPU ist **gfx1013 (Cyan Skillfish)**, die kein ROCm-Build offiziell anvisiert, also ist ROCm ein tiefes Kaninchenloch, das die meisten Leute auslassen. Auf Vulkan, mit einem MoE-Modell, das in den VRAM passt, sieht die Community grob **30–40 tok/s** (z. B. gpt-oss-20b, Qwen3.5-35B-A3B, Gemma-4-26B-A3B). Der Haken ist der **Speicher**: Die 16 GB sind zwischen CPU+GPU geteilt, also leben große Modelle direkt am Rand, und OOM ist das Versagen Nr. 1. Setz das BIOS-VRAM, heb das Kernel-TTM-Page-Limit an und fahr **MoE**-Modelle — das ist das ganze Spiel.

Die BC-250 ist eine gute *Budget-Inferenz-Kiste* und eine schlechte *Trainings-Kiste*. Behandle sie als „eine 16-GB-Karte, die quantisierte Modelle über Vulkan fährt", und du wirst eine gute Zeit haben.

---

## Warum Vulkan, nicht ROCm

Das GPU-Die ist **Cyan Skillfish = `gfx1013`** (ein Teil der RDNA-1.x-Klasse, Geschwister zu Navi 10/`gfx1010`). Diese einzelne Tatsache entscheidet alles:

- **ROCm liefert keine Unterstützung für `gfx1013`.** AMDs ROCm-Stack zielt auf eine bestimmte Allowlist von GPU-IDs, und Cyan Skillfish steht nicht darauf. Also sieht der offizielle `ROCm/ROCm`-Pfad die Karte schlicht nicht. Konkret: `gfx1013` *ist* in LLVM als `rocm-amdhsa`-fähig gelistet, aber **AMDs ROCm-Userspace (rocBLAS/Tensile) liefert keine `gfx1013`-Mathe-(Solution-)Bibliotheken** — also bekommst du in dem Moment, in dem ein GEMM auf rocBLAS trifft, `rocblas_abort()` („GFX1013 not in GPU list"). Es gibt keinen Mathe-Kernel zum Aufrufen ([akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)).
- **Selbst davon abgesehen hat ROCm keinen nutzbaren Shader-Cache auf diesen APUs — es rekompiliert bei jedem Start**, während das **Vulkan-Backend kompilierte Shader auf die Platte cacht**. Das allein macht Vulkan zum praktischen Compute-Pfad: akandrs Tests schließen, dass Vulkan der einzige auf diesem Board nutzbar gefundene GPU-Compute-Pfad war ([akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)). (Beachte, das ist eine *Treiber-/Bibliotheks*-Lücke, **nicht** eine fehlendes-Hardware-Feature-Lücke — RDNA2s `gfx103x`-ISA enthält INT8 dp4a, z. B. `v_dot4c_i32_i8`; das Problem ist rein, dass ROCm nichts für diese ID liefert.)
- Die bekannten „ROCm auf alten Karten freischalten"-Repos **decken sie auch nicht ab**:
  - [`woodrex83/ROCm-For-RX580`](https://github.com/woodrex83/ROCm-For-RX580) ist **nur `gfx803`** (Polaris: RX 580/570/480). Völlig falsche Architektur — hier nicht nutzbar.
  - [`ulyssesrr/docker-rocm-xtra`](https://github.com/ulyssesrr/docker-rocm-xtra) fügt zusätzliche Targets hinzu (`gfx803`, `gfx900/906/908`, `gfx1010/1011/1012`, `gfx1030…`) — aber **`gfx1013` ist nicht in der Liste**, und das Repo wurde am **2025-08-12 archiviert**. Du kannst *versuchen*, dich mit `HSA_OVERRIDE_GFX_VERSION=10.1.0` als `gfx1010` (Navi 10) auszugeben, auf dieselbe Weise, wie Leute Navi-10-Firmware symlinken, um den Display-Treiber hochzubringen (`navi10_gpu_info.bin → cyan_skillfish_gpu_info.bin`, [src](https://t.me/c/2424231195/7458/136321)), aber das ist für Compute auf der BC-250 unbestätigt, und niemand im Chat berichtet einen funktionierenden ROCm-LLM-Stack.  ⚠ Überprüfen
- Die anderen Repos, die Leute herumwerfen — [`xuhuisheng/rocm-build` (navi10)](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) und [`robertrosenbusch/gfx803_rocm`](https://github.com/robertrosenbusch/gfx803_rocm) — sind für Navi-10-dGPUs bzw. Polaris, nicht Cyan Skillfish. Sie sind nützlicher Hintergrund, kein Rezept für dieses Board.

**Fazit (Stand Mitte 2026):** ROCm auf der BC-250 ist ein ungelöster/unwirtschaftlicher Hack. Jedes funktionierende Setup, das die Community geteilt hat, läuft auf **Vulkan über Mesa RADV**, das der Treiber-Stack der BC-250 dir fürs Gaming ohnehin schon gibt. Wenn jemand ROCm zum Laufen bekommt, dann durch Vortäuschen von `gfx1010` in einem gepatchten Container — erwarte, ein Wochenende zu verlieren, ohne Garantie.

> **Update — jemand hat HIP/ROCm zum Laufen gebracht (Discord, Mitte 2026).** Nach dem obigen Urteil „niemand berichtet von einem funktionierenden Stack“ meldete ein Mitglied, dass **ROCm-, HIP- und PyTorch-Berechnungen** auf dem BC-250 laufen, nachdem **die MEC-Firmware modifiziert**, BIOS-Einstellungen geändert und der Stack neu kompiliert wurden ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1482848457478901851)). Auf diesem Weg erreichte das **gegen HIP kompilierte `llama.cpp`** bei Standardtakten **709 tok/s auf TinyLlama-1.1B (pp512)** und **115 tok/s auf Llama-3.1-8B (pp512)** ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1483073888551440384)), und das Prefill skalierte mit der CU-Freischaltung — **~230 tok/s bei 24 CU (94–95 W) vs. 371.6 tok/s bei 40 CU (125 W), beide bei 1500 MHz** ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1506023598048022588)). Dies ist ein tief in die Firmware eingreifender, experimenteller Weg — nicht die empfohlene Route —, aber er zeigt, dass das Urteil „ROCm ist unmöglich“ nicht mehr absolut ist. ⚠ fortgeschritten.

---

## Der 16-GB-VRAM-Vorteil (und sein Haken)

16 GB reichen, um ein 20–35B-Modell zu halten, wenn es **quantisiert** ist (Q3–Q4) — VRAM, der dich sonst eine 4060 Ti 16 GB oder eine gebrauchte 3090 kosten würde. Das ist der ganze Grund, warum das Board für LLMs interessant ist.

Der Haken: **Die 16 GB sind zwischen CPU und GPU geteilt.** Es gibt keinen separaten System-RAM-Pool zum Zurückfallen. Also:

- Das Modell + KV-Cache + das OS + jeder Hintergrundprozess passen alle in dieselben 16 GB.
- Mach das Modell zu groß, und du bekommst nicht „langsam" — du bekommst ein hartes **OOM**, und auf manchen Distros kippt KDE um und wirft dich auf eine Konsole ([src](https://t.me/c/2424231195/101077)).
- Das Urteil eines regelmäßigen Beitragenden nach Monaten des Testens: *„Die Performance reicht für viel; es ist der **Speicher**, der nicht reicht."* ([src](https://t.me/c/2424231195/101077))

Zwei Hebel verschaffen dir Spielraum:

1. **Setz VRAM im BIOS.** Mit `vram = 12` (GB) zu laufen ist eine bekanntermaßen gute Baseline, die RAM für das System lässt ([src](https://t.me/c/2424231195/101077)). Höhere VRAM-Splits lassen größere Modelle laden, hungern aber das OS aus.
2. **Heb das Kernel-TTM-Page-Limit an**, sodass der GPU-Speichermanager tatsächlich die großen Allokationen ausgibt, die ein 14B+-Modell braucht (siehe Einrichtung unten). Das ist die einzelne Änderung, die größere Modelle auf Vulkan freischaltet.

Ein Community-Trick, um sich 1–2 GB zurückzuholen: Fahr ein **Headless-Server-OS** und sprich übers Netzwerk damit (z. B. Open WebUI / eine API), sodass kein Desktop VRAM frisst ([src](https://t.me/c/2424231195/101077)).

---

## Fahr MoE-Modelle, nicht dichte

Das ist die wichtigste Modellierungsentscheidung auf einer 16-GB-Shared-Memory-Kiste, und der Chat ist explizit, warum ([src](https://t.me/c/2424231195/125233)):

- Bei einem **dichten** Modell kannst du es nur *sequenziell* Schicht für Schicht aufteilen; Tensor-Parallel-Tricks helfen nicht, also bist du durch das Begrenzt, was passt, und durch rohe Bandbreite.
- Bei einem **MoE**-Modell hältst du den dichten/Attention-Teil auf der Karte und aktivierst pro Token nur ein paar kleine Experten. Das Ergebnis: **ein viel größeres Modell passt bei anständiger Qualität, und du bekommst einen Durchsatz-Multiplikator**, weil pro Token nur ein Bruchteil der Gewichte berührt wird.

Genau deshalb sind die Modelle, die Leute tatsächlich auf der BC-250 fahren, MoE mit einer kleinen Anzahl aktiver Parameter: **gpt-oss-20b** (der Chat-Favorit), **Qwen3.5-35B-A3B** (35B gesamt / ~3B aktiv), **Gemma-4-26B-A3B**. Sie schlagen weit über das hinaus, was ein dichtes Modell desselben VRAM-Footprints könnte.

> Eine verwandte Erkenntnis für Multi-Karten-Setups: Bei MoE kannst du **Experten-Spalten** über Boards aufteilen und aggregierte Bandbreite gewinnen, während der Hidden State eines dichten Modells winzig ist (~1 MB selbst für 70B), sodass eine Gigabit-Verbindung zwischen Knoten *nicht* der Engpass ist ([src](https://t.me/c/2424231195/125233)). Für eine einzelne BC-250 ist das müßig, aber es erklärt, warum Leute sie verketten.

---

## Setup A — Ollama + Vulkan (empfohlen, reproduzierbar)

Das vollständigste, reproduzierbare BC-250-Rezept ist der Community-Guide [`akandr/bc250` → *Ollama + Vulkan setup*](https://github.com/akandr/bc250#3-ollama--vulkan-setup) (im Chat wiederholt referenziert). Er setzt einen funktionierenden BC-250-Grafik-Stack voraus (siehe [06-linux.md](06-linux.md)) — Fedora mit einem aktuellen Mesa/RADV — und legt dann Ollama darauf. Aus diesem Repo reproduziert:

**1. Ollama installieren:**
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

**2. Das Vulkan-Backend + speichersichere Optionen aktivieren** über ein systemd-Override (`/etc/systemd/system/ollama.service.d/override.conf`):
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
Dann:
```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```
`OLLAMA_FLASH_ATTENTION=1` und `OLLAMA_KV_CACHE_TYPE=q4_0` verkleinern den KV-Cache, sodass ein langer Kontext passt; `OOMScoreAdjust=-1000` hält den Kernel davon ab, Ollama unter Speicherdruck zuerst zu killen.

**3. Der zentrale Speicher-Fix — heb das TTM-Page-Limit an** (das ist es, was 14B+-/Large-Context-Modelle überhaupt laden lässt):
```bash
echo 4194304 | sudo tee /sys/module/ttm/parameters/pages_limit
echo 4194304 | sudo tee /sys/module/ttm/parameters/page_pool_size
```
Über Reboots hinweg persistent machen:
```bash
echo "options ttm pages_limit=4194304 page_pool_size=4194304" | \
  sudo tee /etc/modprobe.d/ttm-gpu-memory.conf
```

**4. Ein MoE-Modell ziehen und fahren**, z. B.:
```bash
ollama run gpt-oss:20b
```

> Der `akandr/bc250`-Guide wurde auf **Fedora 43 / Kernel 6.18.9 / Mesa 25.3.4 RADV / Ollama 0.20.0** validiert. Exakte Paketversionen werden driften — behalte die Env-Vars und den TTM-Fix; aktualisiere den Rest. ⚠ Versionen gegen das Repo überprüfen, bevor du kopierst.

**Stack den Oberon-Governor.** [`mothenjoyer69/oberon-governor`](https://gitlab.com/mothenjoyer69/oberon-governor) (denselben Governor, der fürs Gaming verwendet wird, siehe [09-overclock-undervolt.md](09-overclock-undervolt.md)) zu fahren wird berichtet, **+10–20 tok/s auf gpt-oss-20b** hinzuzufügen, indem höhere Takte gehalten werden ([src](https://t.me/c/2424231195/101077)). Es ist der billigste verfügbare Speedup.

---

## Setup B — llama.cpp (Vulkan), gebaut oder paketiert

Wenn du rohes `llama.cpp` willst (mehr Kontrolle, GGUF von überall, die OpenAI-kompatible API von `llama-server`):

**Arch / paru (der eine im Chat verifizierte Befehl):**
```bash
paru -S aur/llama.cpp-vulkan
```
([src](https://t.me/c/2424231195/101026) — der einzige Build-Befehl im Chat-Korpus dieses Abschnitts; gegen den Paketnamen gegengeprüft.)

**Aus Quelle bauen** (laut [`ggml-org/llama.cpp`-Build-Docs](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md)) — Debian/Ubuntu:
```bash
sudo apt-get install libvulkan-dev glslc spirv-headers
cmake -B build -DGGML_VULKAN=1
cmake --build build --config Release
```
(Auf Fedora heißt das SPIR-V-Headers-Paket `spirv-headers-devel`.) Dann mit allen Schichten auf der GPU fahren:
```bash
./build/bin/llama-cli -m PATH_TO_MODEL.gguf -ngl 99 -p "Hi, how are you?"
```
`-ngl 99` lagert jede Schicht auf das Vulkan-Gerät aus. Verwende `--list-devices`, um zu bestätigen, dass die BC-250 das von llama.cpp gewählte Gerät ist, und `--device`, um es zu erzwingen, falls du mehr als eines hast. Vorgefertigte Binaries gibt es auf der [llama.cpp-Releases-Seite](https://github.com/ggml-org/llama.cpp/releases).

> **Baue nicht das HIP/ROCm-Backend** (`-DGGML_HIP=ON -DGPU_TARGETS=gfx1013`). Es gibt keine ROCm-Runtime für `gfx1013`, also läuft es nicht, selbst wenn es kompiliert. Vulkan ist hier der unterstützte Pfad. ([Build-Doc](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md))

**Front-Ends, die Leute tatsächlich nutzen:**
- **[Jan AI](https://jan.ai/)** — der aktuelle Daily Driver des Chats: großer Modell-Picker, Kontext-/Tool-Einstellungen, kann dem Modell Web-Zugriff geben + Bilder/Dokumente lesen, MCP-Unterstützung. Fährt das Modell darunter über Vulkan ([src](https://t.me/c/2424231195/101077)).
- **[KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)** — Single-Binary-llama.cpp-Wrapper mit Vulkan, praktisch für Ein-Datei-Deployment.
- **Open WebUI** — paare es mit einer Headless-Kiste, um es von einer anderen Maschine aus zu steuern (spart Desktop-VRAM).

---

## Realistische Token/s-Erwartungen

Die Zahlen unten sind **community-berichtet auf Vulkan**, MoE-Modelle so dimensioniert, dass sie in 16 GB passen. Behandle sie als Größenordnung, nicht als Benchmark-Suite — sie stammen aus dem `akandr/bc250`-Guide und dem Chat, auf einem einzelnen Board mit dem TTM-Fix + Flash-Attention + `q4_0`-KV-Cache.

| Modell | Quant | Aktive / gesamte Parameter | Berichtete Gen-Geschwindigkeit |
|---|---|---|---|
| Qwen3.5-9B | Q4_K_M | dicht 9B | ~32 tok/s |
| Gemma-4-26B-A3B (MoE) | UD-Q3_K_M | ~3B / 26B | ~39 tok/s |
| Qwen3.5-35B-A3B (MoE) | UD-IQ2_M | ~3B / 35B | ~38 tok/s |
| gpt-oss-20b (MoE, MXFP4) | MXFP4 | ~3,6B / 20B | Community-Favorit; +10–20 tok/s mit Oberon-Governor |

Quellen: Geschwindigkeiten aus [`akandr/bc250`](https://github.com/akandr/bc250#3-ollama--vulkan-setup); gpt-oss-20b-Nutzung & Governor-Steigerung ([src](https://t.me/c/2424231195/101077)). Modell-GGUFs kommen von Hugging Face — z. B. [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF), [unsloth Qwen3.6-35B-A3B](https://huggingface.co/unsloth/Qwen3.6-35B-A3B-GGUF), [Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M).

**Ehrliche Einschätzung:** ~30–40 tok/s auf einem 20–35B-MoE ist wirklich nutzbar für Chat, Coding-Hilfe und Agent-/Tool-Loops. Es ist **keine** 4090. Die Qualität ist durch die aggressive Quantisierung gedeckelt, die die 16 GB erzwingen (IQ2/Q3 auf den 35B-Modellen) — und ein Nutzer merkte an, dass ein 30B in einem härteren Quant „wahrscheinlich viele Fehler machen wird" ([src](https://t.me/c/2424231195/101077)). Der Sweet Spot ist **gpt-oss-20b**, wiederholt beschrieben als „schlauer als alle kleinen", während es stabil bleibt ([src](https://t.me/c/2424231195/101077)).

### Beschleunigt der 40-CU-Unlock LLMs? Ja — live an einem dichten Modell gemessen

Der 40-CU-Unlock (siehe [09-overclock-undervolt.md](09-overclock-undervolt.md)) hilft der Inferenz mehr als den Spielen, weil die Token-Generierung die Compute-Units tatsächlich nutzt. Ein Video maß es **live** beim Umschalten der CUs an einem **dichten** Modell — Qwen3.5-9B (~10 GB GDDR6) auf **Ollama + Vulkan** — und der Durchsatz folgte der CU-Anzahl fast linear ([Old Lamer — RU-CU-Unlock-Video](https://youtu.be/M7PsojWr4KA), ~8:30–12:03): *(⚠ auto-captioned — behandle die Dezimalstellen als ≈.)*

| Aktive CUs | Gen-Geschwindigkeit | vs. 24 CU |
|---|---|---|
| 24 CU (Standard) | ≈25,7 tok/s | Baseline |
| Unlock-Schritt | ≈31,9 tok/s | **~+16–17 %** |
| 36 CU | ≈33,4 tok/s | **~+20 % gesamt** |

Dieses Board **lag bei 36 CU am Limit** — die letzten zwei CUs waren wirklich defekt und **llama crashte beim Laden**, wenn sie aktiviert wurden, ein konkretes Beispiel des „38/40 ist eine Lotterie"-Punkts aus dem OC-Kapitel. Die Ollama-Umgebung entsprach dem Rezept oben (`OLLAMA_VULKAN=1`, KV-Cache `q4_0`, Kontext 65536, `ttm.pages_limit=4194304`). Weil es ein *dichtes* Modell ist, ist der Gewinn reine CU-Skalierung — kein MoE-Experten-Routing-Multiplikator obendrauf ([Old Lamer — RU-CU-Unlock-Video](https://youtu.be/M7PsojWr4KA)).

Der `akandr/bc250`-Guide fuhr ein vollständigeres A/B auf **MoE**-Modellen über den 40-CU-Unlock (der Unlock-Patch selbst lebt in [`duggasco/bc250-40cu-unlock`](https://github.com/duggasco/bc250-40cu-unlock), nicht akandr; akandr fügt einen unabhängigen FP32-Sanity-Check + Durchsatz-Re-Run hinzu). Zwei Schlagzeilen-Generierungs-Deltas, beide **über llama.cpp** ([akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results)):

| Modell | Quant | Gen @ 24 CU | Gen @ 40 CU | Δ |
|---|---|---|---|---|
| gpt-oss-20b (MoE) | MXFP4 | 66,1 tok/s | 87,5 tok/s | **+32 %** |
| Qwen3.5-35B-A3B (MoE) | — | 59,5 tok/s | 78,7 tok/s | **+32 %** |

Über 11 Modelle lag der Median bei **+32 % Generierung / +50 % Prefill** aus dem Unlock. Zwei Dinge aus dieser Tabelle wert herauszuheben: **gpt-oss-20b läuft komfortabel (66 → 87 tok/s)**, was den Favoriten des Chats bestätigt, und akandr maß MoE-Modelle **deutlich schneller direkt durch `llama.cpp` als durch Ollama** (Ollamas Experten-Dispatch-Pfad ist für diese Architektur weniger effizient — z. B. war Qwen3.5-35B-A3B 25,1 tok/s auf Ollama vs. 59,5 tok/s auf llama.cpp bei Standard-Takten) ([akandr/bc250 §4](https://github.com/akandr/bc250#4-benchmarks)).

> 💬 **Unbestätigte MoE-Datenpunkte (Hackaday-Kommentare — als Hörensagen behandeln).** Aus Leserkommentaren statt einem reproduzierten Lauf: ein Qwen „27b" mit **MTP** (Multi-Token-Prediction) bei **≈14,5 tok/s**, und ein „35b" mit MTP bei **≈47 tok/s**. Die große Spanne ist genau das, was MTP + MoE-Aktive-Parameter-Unterschiede produzieren würden, aber keine der Zahlen ist hier unabhängig bestätigt — für den Kontext markiert, nicht als Benchmark. ⚠ Überprüfen

---

## Was schmerzhaft ist (sei ehrlich)

- **OOM ist der Standard-Versagensmodus.** Großes Modell in 16 GB Shared Memory = am Rand leben. Erwarte Abstürze; auf KDE kann der Desktop sterben und nur eine Konsole hinterlassen ([src](https://t.me/c/2424231195/101077)). Mildere mit BIOS-VRAM-Split, dem TTM-Fix, `q4_0`-KV-Cache, Flash-Attention und einem Headless-Setup.
- **Die Distro-Stabilität variiert.** Der Chat fand **Ubuntu stabiler als Fedora** dafür, unter Speicherdruck auf Vulkan nicht abzustürzen, obwohl Fedora die dokumentierte Baseline ist ([src](https://t.me/c/2424231195/101077)). Wenn eine Distro ständig OOM-crasht, probier die andere.
- **ROCm ist faktisch vom Tisch** (siehe oberer Abschnitt). Verbrenn keine Tage damit, PyTorch/vLLM-Training auf dieser Karte zu jagen — [vLLMs AMD-Pfad](https://docs.vllm.ai/en/latest/getting_started/installation/gpu/#amd-rocm) braucht ROCm, das eine unterstützte GPU-ID braucht, die dieses Board nicht hat.
- **Es ist eine Inferenz-Kiste, kein Trainer.** Fine-Tuning in echtem Maßstab will mehr VRAM und einen funktionierenden Compute-Stack. Nutze sie, um Modelle zu *fahren*, nicht um sie zu trainieren.
- **Der Durchsatz hängt von den Takten ab.** Ohne einen Governor, der hohe Takte hält, lässt du 10–20 tok/s liegen ([src](https://t.me/c/2424231195/101077)); Kühlung spielt hier auch eine Rolle (siehe [04-cooling.md](04-cooling.md)), da nachhaltige Inferenz eine nachhaltige Last ist.

---

## Empfohlenes Starter-Setup

| Stufe | Mach das | Erwarte |
|------|---------|--------|
| Minimum | Funktionierender RADV-Stack ([06-linux.md](06-linux.md)) → Ollama + `OLLAMA_VULKAN=1` → TTM-Fix → `ollama run gpt-oss:20b` | ~30+ tok/s, stabiler Chat |
| Besser | Oberon-Governor + Flash-Attn + `q4_0`-KV-Cache hinzufügen; Front-End über Jan AI | +10–20 tok/s, längerer Kontext, Tools/MCP |
| Größeres Modell | 35B-A3B-MoE bei IQ2/Q3 mit angehobenem TTM-`pages_limit`; Headless + Open WebUI, um VRAM freizugeben | ~38 tok/s, nahe der Speichergrenze |
| Lass es | ROCm / HIP / vLLM-Training auf `gfx1013` | Sackgasse, überspringen |

---

## Quellen

- BC-250-LLM-Rezept (Ollama+Vulkan, TTM-Fix, tok/s) — [akandr/bc250 §Ollama+Vulkan](https://github.com/akandr/bc250#3-ollama--vulkan-setup)
- Warum ROCm auf gfx1013 scheitert (keine rocBLAS/Tensile-Solution-Libs → `rocblas_abort()`; ROCm rekompiliert bei jedem Start vs. Vulkan cacht Shader) — [akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm) · RDNA2 `gfx103x`-ISA hat INT8 dp4a (`v_dot4c_i32_i8`), also ist das eine Bibliotheks-Lücke, keine Hardware-Lücke — [LLVM GFX1030 ISA](https://llvm.org/docs/AMDGPU/AMDGPUAsmGFX1030.html)
- 40-CU-Unlock auf MoE, gemessene Generierungs-Deltas (gpt-oss-20b 66,1→87,5, Qwen3.5-35B-A3B 59,5→78,7, Median +32 % Gen / +50 % Prefill über 11 Modelle; llama.cpp ≫ Ollama für MoE) — [akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results) · [§4 Benchmarks](https://github.com/akandr/bc250#4-benchmarks) · Unlock-Patch: [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock)
- Funktionierendes Setup, gpt-oss-20b, Oberon-Steigerung, OOM/Distro-Notizen — https://t.me/c/2424231195/101077
- MoE vs. dicht, Multi-Karten-Bandbreite — https://t.me/c/2424231195/125233
- 40-CU-Unlock-LLM-Skalierung, live gemessen (⚠ ASR — ungefähr) — Qwen3.5-9B dicht auf Ollama+Vulkan: 25,7 → 31,9 → 33,4 tok/s (24 → Unlock → 36 CU, ~+20 % gesamt); Board gedeckelt bei 36 CU (2 CUs defekt, llama crashte beim Laden) — [Old Lamer — RU-CU-Unlock-Video](https://youtu.be/M7PsojWr4KA)
- MoE-mit-MTP-Datenpunkte (⚠ unbestätigt, Hackaday-Kommentare) — Qwen „27b"+MTP ≈14,5 tk/s, „35b"+MTP ≈47 tk/s — Hackaday-BC-250-Artikel-Kommentar-Thread
- Verifizierter Paket-Befehl — https://t.me/c/2424231195/101026 · Navi10→Cyan-Skillfish-Firmware-Symlink — https://t.me/c/2424231195/7458/136321
- llama.cpp-Build (Vulkan / HIP) — [ggml-org/llama.cpp build.md](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md) · [Releases](https://github.com/ggml-org/llama.cpp/releases) · [Install](https://github.com/ggml-org/llama.cpp/blob/master/docs/install.md)
- ROCm-Realität auf gfx1013 — [ROCm/ROCm](https://github.com/ROCm/ROCm) · [woodrex83/ROCm-For-RX580 (nur gfx803)](https://github.com/woodrex83/ROCm-For-RX580) · [ulyssesrr/docker-rocm-xtra (archiviert; kein gfx1013)](https://github.com/ulyssesrr/docker-rocm-xtra) · [xuhuisheng/rocm-build navi10](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) · [robertrosenbusch/gfx803_rocm](https://github.com/robertrosenbusch/gfx803_rocm)
- Front-Ends — [Jan AI](https://jan.ai/) · [KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)
- Modelle (GGUF) — [Hugging Face](https://huggingface.co/) · [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF) · [Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M)
- Overclock/Governor — [09-overclock-undervolt.md](09-overclock-undervolt.md) · Linux-Basis — [06-linux.md](06-linux.md) · Kühlung — [04-cooling.md](04-cooling.md)
