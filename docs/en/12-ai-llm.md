# AI / LLM on BC-250

> **TL;DR** — The BC-250's draw for AI is its **16 GB of GDDR6** at a junk-bin price. The realistic way to use it is **llama.cpp / Ollama on the Vulkan (RADV) backend** — *not* ROCm. The GPU is **gfx1013 (Cyan Skillfish)**, which no ROCm build officially targets, so ROCm is a deep rabbit hole most people skip. On Vulkan, with a MoE model that fits in VRAM, the community sees roughly **30–40 tok/s** (e.g. gpt-oss-20b, Qwen3.5-35B-A3B, Gemma-4-26B-A3B). The catch is **memory**: the 16 GB is shared CPU+GPU, so big models live right at the edge and OOM is the #1 failure. Set BIOS VRAM, raise the kernel TTM page limit, and run **MoE** models — that's the whole game.

The BC-250 is a fine *budget inference box* and a poor *training box*. Treat it as "a 16 GB card that runs quantized models over Vulkan," and you'll have a good time.

---

## Why Vulkan, not ROCm

The GPU die is **Cyan Skillfish = `gfx1013`** (an RDNA-1.x-class part, sibling to Navi 10/`gfx1010`). This single fact decides everything:

- **ROCm does not ship support for `gfx1013`.** AMD's ROCm stack targets a specific allowlist of GPU IDs, and Cyan Skillfish is not on it. So the official `ROCm/ROCm` path simply doesn't see the card.
- The well-known "unlock ROCm on old cards" repos **don't cover it either**:
  - [`woodrex83/ROCm-For-RX580`](https://github.com/woodrex83/ROCm-For-RX580) is **`gfx803` only** (Polaris: RX 580/570/480). Wrong architecture entirely — not usable here.
  - [`ulyssesrr/docker-rocm-xtra`](https://github.com/ulyssesrr/docker-rocm-xtra) adds extra targets (`gfx803`, `gfx900/906/908`, `gfx1010/1011/1012`, `gfx1030…`) — but **`gfx1013` is not in the list**, and the repo was **archived 2025-08-12**. You can *try* to masquerade as `gfx1010` (Navi 10) with `HSA_OVERRIDE_GFX_VERSION=10.1.0`, the same way people symlink Navi 10 firmware to bring up the display driver (`navi10_gpu_info.bin → cyan_skillfish_gpu_info.bin`, [src](https://t.me/c/2424231195/7458/136321)), but this is unverified for compute on the BC-250 and nobody in the chat reports a working ROCm LLM stack.  ⚠ verify

The other repos people throw around — [`xuhuisheng/rocm-build` (navi10)](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) and [`robertrosenbusch/gfx803_rocm`](https://github.com/robertrosenbusch/gfx803_rocm) — are for Navi 10 dGPUs and Polaris respectively, not Cyan Skillfish. They're useful background, not a recipe for this board.

**Bottom line (as of mid-2026):** ROCm on the BC-250 is an unsolved/uneconomic hack. Every working setup the community has shared runs on **Vulkan via Mesa RADV**, which the BC-250's driver stack already gives you for gaming. If someone gets ROCm working, it'll be by impersonating `gfx1010` in a patched container — expect to lose a weekend, with no guarantee.

---

## The 16 GB VRAM advantage (and its catch)

16 GB is enough to hold a 20–35B model when it's **quantized** (Q3–Q4) — VRAM that would otherwise cost you a 4060 Ti 16 GB or a used 3090. That's the entire reason the board is interesting for LLMs.

The catch: **the 16 GB is shared between CPU and GPU.** There is no separate system RAM pool to fall back on. So:

- The model + KV-cache + the OS + every background process all fit in the *same* 16 GB.
- Push the model too large and you don't get "slow" — you get a hard **OOM**, and on some distros KDE falls over and drops you to a console ([src](https://t.me/c/2424231195/101077)).
- One regular contributor's verdict after months of testing: *"Performance is enough for a lot; it's the **memory** that isn't."* ([src](https://t.me/c/2424231195/101077))

Two levers buy you headroom:

1. **Set VRAM in BIOS.** Running with `vram = 12` (GB) is a known-good baseline that leaves RAM for the system ([src](https://t.me/c/2424231195/101077)). Higher VRAM splits let bigger models load but starve the OS.
2. **Raise the kernel TTM page limit** so the GPU memory manager will actually hand out the big allocations a 14B+ model needs (see setup below). This is the single change that unlocks larger models on Vulkan.

A community trick to claw back 1–2 GB: run a **headless server OS** and talk to it over the network (e.g. Open WebUI / an API), so there's no desktop eating VRAM ([src](https://t.me/c/2424231195/101077)).

---

## Run MoE models, not dense ones

This is the most important modeling choice on a 16 GB shared-memory box, and the chat is explicit about why ([src](https://t.me/c/2424231195/125233)):

- For a **dense** model you can only split it *sequentially* layer-by-layer; tensor-parallel tricks don't help, so you're bounded by what fits and by raw bandwidth.
- For an **MoE** model you keep the dense/attention part on the card and only activate a few small experts per token. The result: **a much bigger model fits at decent quality, and you get a throughput multiplier** because only a fraction of the weights are touched per token.

That's exactly why the models people actually run on the BC-250 are MoE with a small active-parameter count: **gpt-oss-20b** (the chat favorite), **Qwen3.5-35B-A3B** (35B total / ~3B active), **Gemma-4-26B-A3B**. They punch far above what a dense model of the same VRAM footprint could.

> A related insight for multi-card setups: for MoE you can split **expert columns** across boards and gain aggregate bandwidth, whereas a dense model's hidden state is tiny (~1 MB even for 70B) so a gigabit link between nodes is *not* the bottleneck ([src](https://t.me/c/2424231195/125233)). For a single BC-250 this is moot, but it explains why people chain them.

---

## Setup A — Ollama + Vulkan (recommended, reproducible)

The most complete, reproducible BC-250 recipe is the community guide [`akandr/bc250` → *Ollama + Vulkan setup*](https://github.com/akandr/bc250#3-ollama--vulkan-setup) (referenced repeatedly in the chat). It assumes a working BC-250 graphics stack (see [06-linux.md](06-linux.md)) — Fedora with a recent Mesa/RADV — and then layers Ollama on top. Reproduced from that repo:

**1. Install Ollama:**
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

**2. Enable the Vulkan backend + memory-safe options** via a systemd override (`/etc/systemd/system/ollama.service.d/override.conf`):
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
Then:
```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```
`OLLAMA_FLASH_ATTENTION=1` and `OLLAMA_KV_CACHE_TYPE=q4_0` shrink the KV-cache so a long context fits; `OOMScoreAdjust=-1000` keeps the kernel from killing Ollama first under memory pressure.

**3. The key memory fix — raise the TTM page limit** (this is what lets 14B+ / large-context models load at all):
```bash
echo 4194304 | sudo tee /sys/module/ttm/parameters/pages_limit
echo 4194304 | sudo tee /sys/module/ttm/parameters/page_pool_size
```
Make it persist across reboots:
```bash
echo "options ttm pages_limit=4194304 page_pool_size=4194304" | \
  sudo tee /etc/modprobe.d/ttm-gpu-memory.conf
```

**4. Pull and run an MoE model**, e.g.:
```bash
ollama run gpt-oss:20b
```

> The `akandr/bc250` guide was validated on **Fedora 43 / kernel 6.18.9 / Mesa 25.3.4 RADV / Ollama 0.20.0**. Exact package versions will drift — keep the env vars and the TTM fix; update the rest. ⚠ verify versions against the repo before copying.

**Stack the Oberon governor.** Running [`mothenjoyer69/oberon-governor`](https://gitlab.com/mothenjoyer69/oberon-governor) (the same governor used for gaming, see [09-overclock-undervolt.md](09-overclock-undervolt.md)) is reported to add **+10–20 tok/s on gpt-oss-20b** by holding higher clocks ([src](https://t.me/c/2424231195/101077)). It's the cheapest speedup available.

---

## Setup B — llama.cpp (Vulkan), built or packaged

If you want raw `llama.cpp` (more control, GGUF from anywhere, `llama-server`'s OpenAI-compatible API):

**Arch / paru (the one command verified in-chat):**
```bash
paru -S aur/llama.cpp-vulkan
```
([src](https://t.me/c/2424231195/101026) — the only build command in this section's chat corpus; cross-checked against the package name.)

**Build from source** (per [`ggml-org/llama.cpp` build docs](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md)) — Debian/Ubuntu:
```bash
sudo apt-get install libvulkan-dev glslc spirv-headers
cmake -B build -DGGML_VULKAN=1
cmake --build build --config Release
```
(On Fedora the SPIR-V headers package is `spirv-headers-devel`.) Then run with all layers on the GPU:
```bash
./build/bin/llama-cli -m PATH_TO_MODEL.gguf -ngl 99 -p "Hi, how are you?"
```
`-ngl 99` offloads every layer to the Vulkan device. Use `--list-devices` to confirm the BC-250 is the device llama.cpp picked, and `--device` to force it if you have more than one. Prebuilt binaries are on the [llama.cpp releases page](https://github.com/ggml-org/llama.cpp/releases).

> **Do not build the HIP/ROCm backend** (`-DGGML_HIP=ON -DGPU_TARGETS=gfx1013`). There's no ROCm runtime for `gfx1013`, so it won't run even if it compiles. Vulkan is the supported path here. ([build doc](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md))

**Front-ends people actually use:**
- **[Jan AI](https://jan.ai/)** — the chat's current daily driver: big model picker, context/tool settings, can give the model web access + read images/docs, MCP support. Runs the model over Vulkan underneath ([src](https://t.me/c/2424231195/101077)).
- **[KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)** — single-binary llama.cpp wrapper with Vulkan, handy for one-file deployment.
- **Open WebUI** — pair with a headless box to drive it from another machine (saves desktop VRAM).

---

## Realistic token/s expectations

Numbers below are **community-reported on Vulkan**, MoE models sized to fit 16 GB. Treat them as order-of-magnitude, not a benchmark suite — they come from the `akandr/bc250` guide and chat, on a single board with the TTM fix + flash-attention + `q4_0` KV-cache.

| Model | Quant | Active / total params | Reported gen speed |
|---|---|---|---|
| Qwen3.5-9B | Q4_K_M | dense 9B | ~32 tok/s |
| Gemma-4-26B-A3B (MoE) | UD-Q3_K_M | ~3B / 26B | ~39 tok/s |
| Qwen3.5-35B-A3B (MoE) | UD-IQ2_M | ~3B / 35B | ~38 tok/s |
| gpt-oss-20b (MoE, MXFP4) | MXFP4 | ~3.6B / 20B | community favorite; +10–20 tok/s with Oberon governor |

Sources: speeds from [`akandr/bc250`](https://github.com/akandr/bc250#3-ollama--vulkan-setup); gpt-oss-20b usage & governor uplift ([src](https://t.me/c/2424231195/101077)). Model GGUFs come from Hugging Face — e.g. [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF), [unsloth Qwen3.6-35B-A3B](https://huggingface.co/unsloth/Qwen3.6-35B-A3B-GGUF), [Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M).

**Honest read:** ~30–40 tok/s on a 20–35B MoE is genuinely usable for chat, coding help, and agent/tool loops. It is **not** a 4090. Quality is capped by the aggressive quantization the 16 GB forces (IQ2/Q3 on the 35B models) — and one user noted that pushing a 30B in a harsher quant "will probably make a lot of mistakes" ([src](https://t.me/c/2424231195/101077)). The sweet spot is **gpt-oss-20b**, repeatedly described as "smarter than all the small ones" while staying stable ([src](https://t.me/c/2424231195/101077)).

### Does the 40-CU unlock speed up LLMs? Yes — measured live on a dense model

The 40-CU unlock (see [09-overclock-undervolt.md](09-overclock-undervolt.md)) helps inference more than it helps games, because token generation actually uses the compute units. A video measured it **live** while toggling CUs on a **dense** model — Qwen3.5-9B (~10 GB of GDDR6) on **Ollama + Vulkan** — and the throughput tracked the CU count almost linearly ([Old Lamer — RU CU-unlock video](https://youtu.be/M7PsojWr4KA), ~8:30–12:03): *(⚠ auto-captioned — treat the decimals as ≈.)*

| Active CUs | Gen speed | vs 24 CU |
|---|---|---|
| 24 CU (stock) | ≈25.7 tok/s | baseline |
| unlock step | ≈31.9 tok/s | **~+16–17 %** |
| 36 CU | ≈33.4 tok/s | **~+20 % total** |

That board **topped out at 36 CU** — the last two CUs were genuinely defective and **llama crashed on load** when they were enabled, a concrete example of the "38/40 is a lottery" point from the OC chapter. The Ollama environment matched the recipe above (`OLLAMA_VULKAN=1`, KV-cache `q4_0`, context 65536, `ttm.pages_limit=4194304`). Because it's a *dense* model, the gain is pure CU scaling — no MoE expert-routing multiplier on top ([Old Lamer — RU CU-unlock video](https://youtu.be/M7PsojWr4KA)).

> 💬 **Unverified MoE datapoints (Hackaday comments — treat as hearsay).** From reader comments rather than a reproduced run: a Qwen "27b" with **MTP** (multi-token prediction) at **≈14.5 tok/s**, and a "35b" with MTP at **≈47 tok/s**. The wide spread is exactly what MTP + MoE active-parameter differences would produce, but neither figure is independently confirmed here — flagged for context, not as a benchmark. ⚠ verify

---

## What's painful (be honest)

- **OOM is the default failure mode.** Big model in 16 GB shared memory = living on the edge. Expect crashes; on KDE the desktop may die and leave only a console ([src](https://t.me/c/2424231195/101077)). Mitigate with BIOS VRAM split, the TTM fix, `q4_0` KV-cache, flash attention, and a headless setup.
- **Distro stability varies.** The chat found **Ubuntu more stable than Fedora** for not crashing under memory pressure on Vulkan, despite Fedora being the documented baseline ([src](https://t.me/c/2424231195/101077)). If one distro keeps OOM-crashing, try the other.
- **ROCm is effectively off the table** (see top section). Don't burn days chasing PyTorch/vLLM training on this card — [vLLM's AMD path](https://docs.vllm.ai/en/latest/getting_started/installation/gpu/#amd-rocm) needs ROCm, which needs a supported GPU ID this board doesn't have.
- **It's an inference box, not a trainer.** Fine-tuning at any real scale wants more VRAM and a working compute stack. Use it to *run* models, not to train them.
- **Throughput depends on clocks.** Without a governor holding high clocks you leave 10–20 tok/s on the table ([src](https://t.me/c/2424231195/101077)); cooling matters here too (see [04-cooling.md](04-cooling.md)) since sustained inference is a sustained load.

---

## Recommended starter setup

| Tier | Do this | Expect |
|------|---------|--------|
| Minimum | Working RADV stack ([06-linux.md](06-linux.md)) → Ollama + `OLLAMA_VULKAN=1` → TTM fix → `ollama run gpt-oss:20b` | ~30+ tok/s, stable chat |
| Better | Add Oberon governor + flash-attn + `q4_0` KV-cache; front-end via Jan AI | +10–20 tok/s, longer context, tools/MCP |
| Bigger model | 35B-A3B MoE at IQ2/Q3 with TTM `pages_limit` raised; headless + Open WebUI to free VRAM | ~38 tok/s, near the memory ceiling |
| Don't | ROCm / HIP / vLLM training on `gfx1013` | dead end, skip it |

---

## Sources

- BC-250 LLM recipe (Ollama+Vulkan, TTM fix, tok/s) — [akandr/bc250 §Ollama+Vulkan](https://github.com/akandr/bc250#3-ollama--vulkan-setup)
- Working setup, gpt-oss-20b, Oberon uplift, OOM/distro notes — https://t.me/c/2424231195/101077
- MoE vs dense, multi-card bandwidth — https://t.me/c/2424231195/125233
- 40-CU unlock LLM scaling, measured live (⚠ ASR — approximate) — Qwen3.5-9B dense on Ollama+Vulkan: 25.7 → 31.9 → 33.4 tok/s (24 → unlock → 36 CU, ~+20 % total); board capped at 36 CU (2 CUs defective, llama crashed on load) — [Old Lamer — RU CU-unlock video](https://youtu.be/M7PsojWr4KA)
- MoE w/ MTP datapoints (⚠ unverified, Hackaday comments) — Qwen "27b"+MTP ≈14.5 tk/s, "35b"+MTP ≈47 tk/s — Hackaday BC-250 article comment thread
- Verified package command — https://t.me/c/2424231195/101026 · Navi10→Cyan Skillfish firmware symlink — https://t.me/c/2424231195/7458/136321
- llama.cpp build (Vulkan / HIP) — [ggml-org/llama.cpp build.md](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md) · [releases](https://github.com/ggml-org/llama.cpp/releases) · [install](https://github.com/ggml-org/llama.cpp/blob/master/docs/install.md)
- ROCm reality on gfx1013 — [ROCm/ROCm](https://github.com/ROCm/ROCm) · [woodrex83/ROCm-For-RX580 (gfx803 only)](https://github.com/woodrex83/ROCm-For-RX580) · [ulyssesrr/docker-rocm-xtra (archived; no gfx1013)](https://github.com/ulyssesrr/docker-rocm-xtra) · [xuhuisheng/rocm-build navi10](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) · [robertrosenbusch/gfx803_rocm](https://github.com/robertrosenbusch/gfx803_rocm)
- Front-ends — [Jan AI](https://jan.ai/) · [KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)
- Models (GGUF) — [Hugging Face](https://huggingface.co/) · [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF) · [Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M)
- Overclock/governor — [09-overclock-undervolt.md](09-overclock-undervolt.md) · Linux base — [06-linux.md](06-linux.md) · Cooling — [04-cooling.md](04-cooling.md)
