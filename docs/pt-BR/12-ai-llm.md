> 🌐 Tradução da comunidade. A versão em inglês é a fonte da verdade e pode estar mais atualizada. Achou um erro? Abra uma issue: [../en/12-ai-llm.md](../en/12-ai-llm.md) · https://github.com/lildebil0/awesome-bc250/issues

# IA / LLM na BC-250

> **TL;DR** — O atrativo da BC-250 para IA são seus **16 GB de GDDR6** a preço de banca de liquidação. A forma realista de usá-la é **llama.cpp / Ollama no backend Vulkan (RADV)** — *não* ROCm. A GPU é **gfx1013 (Cyan Skillfish)**, que nenhum build do ROCm tem como alvo oficialmente, então o ROCm é um buraco de coelho profundo que a maioria das pessoas evita. No Vulkan, com um modelo MoE que cabe na VRAM, a comunidade vê algo em torno de **30–40 tok/s** (ex.: gpt-oss-20b, Qwen3.5-35B-A3B, Gemma-4-26B-A3B). O pega é a **memória**: os 16 GB são compartilhados entre CPU+GPU, então modelos grandes vivem bem na borda e o OOM é a falha nº 1. Defina a VRAM na BIOS, eleve o limite de páginas TTM do kernel e rode modelos **MoE** — esse é o jogo inteiro.

A BC-250 é uma boa *caixa de inferência de baixo custo* e uma *caixa de treinamento* ruim. Trate-a como "uma placa de 16 GB que roda modelos quantizados sobre Vulkan" e você vai se dar bem.

---

## Por que Vulkan, não ROCm

O die da GPU é **Cyan Skillfish = `gfx1013`** (uma peça da classe RDNA-1.x, irmã da Navi 10/`gfx1010`). Esse único fato decide tudo:

- **O ROCm não inclui suporte para `gfx1013`.** A stack ROCm da AMD tem como alvo uma allowlist específica de IDs de GPU, e a Cyan Skillfish não está nela. Então o caminho oficial `ROCm/ROCm` simplesmente não enxerga a placa. Concretamente: `gfx1013` *está* listado no LLVM como capaz de `rocm-amdhsa`, mas **o userspace ROCm da AMD (rocBLAS/Tensile) não inclui bibliotecas de matemática (solução) para `gfx1013`** — então no momento em que um GEMM atinge o rocBLAS você recebe `rocblas_abort()` ("GFX1013 not in GPU list"). Não há kernel de matemática para chamar ([akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)).
- **Mesmo deixando isso de lado, o ROCm não tem cache de shader utilizável nessas APUs — ele recompila a cada launch**, ao passo que o **backend Vulkan armazena em disco os shaders compilados**. Isso por si só torna o Vulkan o caminho prático de compute: os testes do akandr concluem que o Vulkan foi o único caminho de GPU-compute considerado utilizável nesta placa ([akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)). (Note que isso é uma lacuna de *driver/biblioteca*, **não** de recurso-de-hardware faltante — a ISA `gfx103x` do RDNA2 inclui sim INT8 dp4a, ex.: `v_dot4c_i32_i8`; o problema é puramente que o ROCm não inclui nada para esse ID.)
- Os conhecidos repositórios "destrave o ROCm em placas antigas" **também não o cobrem**:
  - [`woodrex83/ROCm-For-RX580`](https://github.com/woodrex83/ROCm-For-RX580) é **somente `gfx803`** (Polaris: RX 580/570/480). Arquitetura completamente errada — inutilizável aqui.
  - [`ulyssesrr/docker-rocm-xtra`](https://github.com/ulyssesrr/docker-rocm-xtra) adiciona alvos extras (`gfx803`, `gfx900/906/908`, `gfx1010/1011/1012`, `gfx1030…`) — mas **`gfx1013` não está na lista**, e o repositório foi **arquivado em 2025-08-12**. Você *pode* tentar se passar por `gfx1010` (Navi 10) com `HSA_OVERRIDE_GFX_VERSION=10.1.0`, do mesmo jeito que as pessoas fazem symlink do firmware da Navi 10 para subir o driver de vídeo (`navi10_gpu_info.bin → cyan_skillfish_gpu_info.bin`, [src](https://t.me/c/2424231195/7458/136321)), mas isso é não verificado para compute na BC-250 e ninguém no chat relata uma stack ROCm de LLM funcionando.  ⚠ verificar

Os outros repositórios que as pessoas citam por aí — [`xuhuisheng/rocm-build` (navi10)](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) e [`robertrosenbusch/gfx803_rocm`](https://github.com/robertrosenbusch/gfx803_rocm) — são para dGPUs Navi 10 e Polaris respectivamente, não Cyan Skillfish. São contexto útil, não uma receita para esta placa.

**Conclusão (em meados de 2026):** o ROCm na BC-250 é um hack não resolvido/antieconômico. Toda configuração funcional que a comunidade compartilhou roda sobre **Vulkan via Mesa RADV**, que a stack de driver da BC-250 já te entrega para jogos. Se alguém conseguir fazer o ROCm funcionar, será se passando por `gfx1010` em um contêiner com patch — espere perder um fim de semana, sem garantia.

> **Atualização — alguém fez o HIP/ROCm funcionar (Discord, meados de 2026).** Posterior ao veredito de "ninguém relata uma stack funcional" acima, um membro relatou **a computação com ROCm, HIP e PyTorch rodando** no BC-250 após **modificar o firmware MEC**, alterar as configurações da BIOS e recompilar a stack ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1482848457478901851)). Nesse caminho, o **`llama.cpp` compilado contra HIP** obteve **709 tok/s no TinyLlama-1.1B (pp512)** e **115 tok/s no Llama-3.1-8B (pp512)** com clocks padrão ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1483073888551440384)), e o prefill escalou com o desbloqueio de CU — **~230 tok/s a 24 CU (94–95 W) vs 371.6 tok/s a 40 CU (125 W), ambos a 1500 MHz** ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1506023598048022588)). Este é um caminho experimental e profundo no firmware — não é a rota recomendada — mas mostra que o veredito "ROCm é impossível" não é mais absoluto. ⚠ avançado.

---

## A vantagem dos 16 GB de VRAM (e seu pega)

16 GB são suficientes para abrigar um modelo de 20–35B quando ele está **quantizado** (Q3–Q4) — VRAM que de outra forma te custaria uma 4060 Ti 16 GB ou uma 3090 usada. Essa é a razão inteira de a placa ser interessante para LLMs.

O pega: **os 16 GB são compartilhados entre CPU e GPU.** Não há um pool separado de RAM de sistema para recorrer. Então:

- O modelo + KV-cache + o SO + cada processo em segundo plano cabem todos nos *mesmos* 16 GB.
- Empurre o modelo grande demais e você não fica "lento" — você toma um **OOM** duro, e em algumas distros o KDE cai e te joga para um console ([src](https://t.me/c/2424231195/101077)).
- O veredito de um colaborador regular após meses de testes: *"O desempenho é suficiente para muita coisa; é a **memória** que não é."* ([src](https://t.me/c/2424231195/101077))

Duas alavancas te compram folga:

1. **Defina a VRAM na BIOS.** Rodar com `vram = 12` (GB) é uma baseline conhecida-como-boa que deixa RAM para o sistema ([src](https://t.me/c/2424231195/101077)). Divisões de VRAM mais altas deixam modelos maiores carregarem, mas matam o SO de fome.
2. **Eleve o limite de páginas TTM do kernel** para que o gerenciador de memória da GPU realmente entregue as grandes alocações que um modelo de 14B+ precisa (veja a configuração abaixo). Essa é a única mudança que destrava modelos maiores no Vulkan.

Um truque da comunidade para recuperar 1–2 GB: rode um **SO de servidor headless** e fale com ele pela rede (ex.: Open WebUI / uma API), de modo que não haja um desktop comendo VRAM ([src](https://t.me/c/2424231195/101077)).

---

## Rode modelos MoE, não densos

Esta é a escolha de modelagem mais importante em uma caixa de 16 GB de memória compartilhada, e o chat é explícito sobre o porquê ([src](https://t.me/c/2424231195/125233)):

- Para um modelo **denso** você só consegue dividi-lo *sequencialmente* camada por camada; truques de tensor-parallel não ajudam, então você está limitado pelo que cabe e pela largura de banda bruta.
- Para um modelo **MoE** você mantém a parte densa/de atenção na placa e ativa apenas alguns poucos experts pequenos por token. O resultado: **um modelo bem maior cabe com qualidade decente, e você ganha um multiplicador de throughput** porque só uma fração dos pesos é tocada por token.

É exatamente por isso que os modelos que as pessoas realmente rodam na BC-250 são MoE com uma contagem pequena de parâmetros ativos: **gpt-oss-20b** (o favorito do chat), **Qwen3.5-35B-A3B** (35B total / ~3B ativos), **Gemma-4-26B-A3B**. Eles batem muito acima do que um modelo denso da mesma pegada de VRAM conseguiria.

> Um insight relacionado para setups multi-placa: para MoE você pode dividir **colunas de experts** entre placas e ganhar largura de banda agregada, ao passo que o estado oculto de um modelo denso é minúsculo (~1 MB mesmo para 70B), então um link gigabit entre nós *não* é o gargalo ([src](https://t.me/c/2424231195/125233)). Para uma única BC-250 isso é irrelevante, mas explica por que as pessoas as encadeiam.

---

## Setup A — Ollama + Vulkan (recomendado, reproduzível)

A receita BC-250 mais completa e reproduzível é o guia da comunidade [`akandr/bc250` → *Ollama + Vulkan setup*](https://github.com/akandr/bc250#3-ollama--vulkan-setup) (referenciado repetidamente no chat). Ele assume uma stack de gráficos BC-250 funcionando (veja [06-linux.md](06-linux.md)) — Fedora com um Mesa/RADV recente — e então coloca o Ollama por cima. Reproduzido daquele repositório:

**1. Instale o Ollama:**
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

**2. Habilite o backend Vulkan + opções memory-safe** via um override do systemd (`/etc/systemd/system/ollama.service.d/override.conf`):
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
Depois:
```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```
`OLLAMA_FLASH_ATTENTION=1` e `OLLAMA_KV_CACHE_TYPE=q4_0` encolhem o KV-cache para que um contexto longo caiba; `OOMScoreAdjust=-1000` impede que o kernel mate o Ollama primeiro sob pressão de memória.

**3. A correção-chave de memória — eleve o limite de páginas TTM** (é isso que deixa modelos de 14B+ / contexto grande carregarem de jeito nenhum):
```bash
echo 4194304 | sudo tee /sys/module/ttm/parameters/pages_limit
echo 4194304 | sudo tee /sys/module/ttm/parameters/page_pool_size
```
Faça persistir entre reboots:
```bash
echo "options ttm pages_limit=4194304 page_pool_size=4194304" | \
  sudo tee /etc/modprobe.d/ttm-gpu-memory.conf
```

**4. Baixe e rode um modelo MoE**, ex.:
```bash
ollama run gpt-oss:20b
```

> O guia `akandr/bc250` foi validado em **Fedora 43 / kernel 6.18.9 / Mesa 25.3.4 RADV / Ollama 0.20.0**. As versões exatas dos pacotes vão mudar — mantenha as variáveis de ambiente e a correção TTM; atualize o resto. ⚠ verifique as versões contra o repositório antes de copiar.

**Empilhe o governor Oberon.** Rodar o [`mothenjoyer69/oberon-governor`](https://gitlab.com/mothenjoyer69/oberon-governor) (o mesmo governor usado para jogos, veja [09-overclock-undervolt.md](09-overclock-undervolt.md)) é relatado como adicionando **+10–20 tok/s no gpt-oss-20b** ao segurar clocks mais altos ([src](https://t.me/c/2424231195/101077)). É o speedup mais barato disponível.

---

## Setup B — llama.cpp (Vulkan), compilado ou empacotado

Se você quer o `llama.cpp` puro (mais controle, GGUF de qualquer lugar, a API compatível com OpenAI do `llama-server`):

**Arch / paru (o único comando verificado no chat):**
```bash
paru -S aur/llama.cpp-vulkan
```
([src](https://t.me/c/2424231195/101026) — o único comando de build no corpus de chat desta seção; conferido contra o nome do pacote.)

**Compile a partir do código-fonte** (conforme a [documentação de build do `ggml-org/llama.cpp`](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md)) — Debian/Ubuntu:
```bash
sudo apt-get install libvulkan-dev glslc spirv-headers
cmake -B build -DGGML_VULKAN=1
cmake --build build --config Release
```
(No Fedora o pacote de headers SPIR-V é `spirv-headers-devel`.) Depois rode com todas as camadas na GPU:
```bash
./build/bin/llama-cli -m PATH_TO_MODEL.gguf -ngl 99 -p "Hi, how are you?"
```
`-ngl 99` descarrega cada camada para o dispositivo Vulkan. Use `--list-devices` para confirmar que a BC-250 é o dispositivo que o llama.cpp escolheu, e `--device` para forçá-lo caso você tenha mais de um. Binários pré-compilados estão na [página de releases do llama.cpp](https://github.com/ggml-org/llama.cpp/releases).

> **Não compile o backend HIP/ROCm** (`-DGGML_HIP=ON -DGPU_TARGETS=gfx1013`). Não existe runtime ROCm para `gfx1013`, então ele não vai rodar mesmo que compile. Vulkan é o caminho com suporte aqui. ([build doc](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md))

**Front-ends que as pessoas realmente usam:**
- **[Jan AI](https://jan.ai/)** — o daily driver atual do chat: seletor de modelos grande, configurações de contexto/ferramentas, pode dar ao modelo acesso à web + ler imagens/documentos, suporte a MCP. Roda o modelo sobre Vulkan por baixo ([src](https://t.me/c/2424231195/101077)).
- **[KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)** — wrapper de binário único do llama.cpp com Vulkan, prático para implantação de arquivo único.
- **Open WebUI** — combine com uma caixa headless para conduzi-lo a partir de outra máquina (economiza VRAM do desktop).

---

## Expectativas realistas de token/s

Os números abaixo são **relatados pela comunidade no Vulkan**, modelos MoE dimensionados para caber em 16 GB. Trate-os como ordem de grandeza, não como uma suíte de benchmark — eles vêm do guia `akandr/bc250` e do chat, em uma única placa com a correção TTM + flash-attention + KV-cache `q4_0`.

| Modelo | Quant | Params ativos / total | Velocidade de geração relatada |
|---|---|---|---|
| Qwen3.5-9B | Q4_K_M | denso 9B | ~32 tok/s |
| Gemma-4-26B-A3B (MoE) | UD-Q3_K_M | ~3B / 26B | ~39 tok/s |
| Qwen3.5-35B-A3B (MoE) | UD-IQ2_M | ~3B / 35B | ~38 tok/s |
| gpt-oss-20b (MoE, MXFP4) | MXFP4 | ~3.6B / 20B | favorito da comunidade; +10–20 tok/s com o governor Oberon |

Fontes: velocidades de [`akandr/bc250`](https://github.com/akandr/bc250#3-ollama--vulkan-setup); uso do gpt-oss-20b & uplift do governor ([src](https://t.me/c/2424231195/101077)). Os GGUFs dos modelos vêm do Hugging Face — ex.: [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF), [unsloth Qwen3.6-35B-A3B](https://huggingface.co/unsloth/Qwen3.6-35B-A3B-GGUF), [Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M).

**Leitura honesta:** ~30–40 tok/s em um MoE de 20–35B é genuinamente utilizável para chat, ajuda em código e loops de agente/ferramenta. **Não** é uma 4090. A qualidade é limitada pela quantização agressiva que os 16 GB forçam (IQ2/Q3 nos modelos de 35B) — e um usuário notou que empurrar um 30B em um quant mais duro "provavelmente vai cometer muitos erros" ([src](https://t.me/c/2424231195/101077)). O ponto ideal é o **gpt-oss-20b**, repetidamente descrito como "mais inteligente que todos os pequenos" enquanto se mantém estável ([src](https://t.me/c/2424231195/101077)).

### O unlock de 40 CU acelera os LLMs? Sim — medido ao vivo em um modelo denso

O unlock de 40 CU (veja [09-overclock-undervolt.md](09-overclock-undervolt.md)) ajuda a inferência mais do que ajuda os jogos, porque a geração de tokens de fato usa as unidades de compute. Um vídeo mediu isso **ao vivo** enquanto alternava CUs em um modelo **denso** — Qwen3.5-9B (~10 GB de GDDR6) no **Ollama + Vulkan** — e o throughput acompanhou a contagem de CU quase linearmente ([Old Lamer — vídeo RU de unlock de CU](https://youtu.be/M7PsojWr4KA), ~8:30–12:03): *(⚠ legendas automáticas — trate os decimais como ≈.)*

| CUs ativas | Velocidade de geração | vs 24 CU |
|---|---|---|
| 24 CU (padrão) | ≈25.7 tok/s | baseline |
| passo de unlock | ≈31.9 tok/s | **~+16–17 %** |
| 36 CU | ≈33.4 tok/s | **~+20 % total** |

Aquela placa **estabilizou no máximo em 36 CU** — as duas últimas CUs eram genuinamente defeituosas e o **llama travou no carregamento** quando elas foram habilitadas, um exemplo concreto do ponto "38/40 é uma loteria" do capítulo de OC. O ambiente Ollama correspondia à receita acima (`OLLAMA_VULKAN=1`, KV-cache `q4_0`, contexto 65536, `ttm.pages_limit=4194304`). Por ser um modelo *denso*, o ganho é puro escalonamento de CU — sem multiplicador de roteamento de experts MoE por cima ([Old Lamer — vídeo RU de unlock de CU](https://youtu.be/M7PsojWr4KA)).

O guia `akandr/bc250` rodou um A/B mais completo em modelos **MoE** com o unlock de 40 CU (o próprio patch de unlock vive em [`duggasco/bc250-40cu-unlock`](https://github.com/duggasco/bc250-40cu-unlock), não no akandr; o akandr adiciona uma checagem de sanidade FP32 independente + re-execução de throughput). Dois deltas de geração de destaque, ambos **via llama.cpp** ([akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results)):

| Modelo | Quant | Geração @ 24 CU | Geração @ 40 CU | Δ |
|---|---|---|---|---|
| gpt-oss-20b (MoE) | MXFP4 | 66.1 tok/s | 87.5 tok/s | **+32 %** |
| Qwen3.5-35B-A3B (MoE) | — | 59.5 tok/s | 78.7 tok/s | **+32 %** |

Em 11 modelos a mediana foi de **+32 % geração / +50 % prefill** com o unlock. Duas coisas que valem destacar daquela tabela: **o gpt-oss-20b roda confortavelmente (66 → 87 tok/s)**, confirmando o favorito do chat, e o akandr mediu modelos MoE **substancialmente mais rápidos diretamente pelo `llama.cpp` do que pelo Ollama** (o caminho de expert-dispatch do Ollama é menos eficiente para esta arquitetura — ex.: o Qwen3.5-35B-A3B fez 25.1 tok/s no Ollama vs 59.5 tok/s no llama.cpp em clocks de fábrica) ([akandr/bc250 §4](https://github.com/akandr/bc250#4-benchmarks)).

> 💬 **Datapoints MoE não verificados (comentários do Hackaday — trate como boato).** A partir de comentários de leitores em vez de uma execução reproduzida: um Qwen "27b" com **MTP** (multi-token prediction) a **≈14.5 tok/s**, e um "35b" com MTP a **≈47 tok/s**. A ampla dispersão é exatamente o que diferenças de MTP + parâmetros-ativos MoE produziriam, mas nenhuma das duas cifras é confirmada de forma independente aqui — sinalizado por contexto, não como benchmark. ⚠ verificar

---

## O que é doloroso (sejamos honestos)

- **OOM é o modo de falha padrão.** Modelo grande em 16 GB de memória compartilhada = vivendo na borda. Espere travamentos; no KDE o desktop pode morrer e deixar só um console ([src](https://t.me/c/2424231195/101077)). Mitigue com a divisão de VRAM na BIOS, a correção TTM, KV-cache `q4_0`, flash attention e um setup headless.
- **A estabilidade varia por distro.** O chat achou o **Ubuntu mais estável que o Fedora** para não travar sob pressão de memória no Vulkan, apesar de o Fedora ser a baseline documentada ([src](https://t.me/c/2424231195/101077)). Se uma distro fica travando por OOM, tente a outra.
- **O ROCm está efetivamente fora de questão** (veja a seção do topo). Não queime dias atrás de treinamento PyTorch/vLLM nesta placa — [o caminho AMD do vLLM](https://docs.vllm.ai/en/latest/getting_started/installation/gpu/#amd-rocm) precisa de ROCm, que precisa de um ID de GPU com suporte que esta placa não tem.
- **É uma caixa de inferência, não um treinador.** Fine-tuning em qualquer escala real quer mais VRAM e uma stack de compute funcional. Use-a para *rodar* modelos, não para treiná-los.
- **O throughput depende dos clocks.** Sem um governor segurando clocks altos você deixa 10–20 tok/s na mesa ([src](https://t.me/c/2424231195/101077)); o resfriamento importa aqui também (veja [04-cooling.md](04-cooling.md)) já que inferência sustentada é uma carga sustentada.

---

## Setup inicial recomendado

| Nível | Faça isto | Espere |
|------|---------|--------|
| Mínimo | Stack RADV funcional ([06-linux.md](06-linux.md)) → Ollama + `OLLAMA_VULKAN=1` → correção TTM → `ollama run gpt-oss:20b` | ~30+ tok/s, chat estável |
| Melhor | Adicione o governor Oberon + flash-attn + KV-cache `q4_0`; front-end via Jan AI | +10–20 tok/s, contexto mais longo, ferramentas/MCP |
| Modelo maior | MoE 35B-A3B em IQ2/Q3 com `pages_limit` do TTM elevado; headless + Open WebUI para liberar VRAM | ~38 tok/s, perto do teto de memória |
| Não faça | Treinamento ROCm / HIP / vLLM em `gfx1013` | beco sem saída, pule isso |

---

## Fontes

- Receita de LLM da BC-250 (Ollama+Vulkan, correção TTM, tok/s) — [akandr/bc250 §Ollama+Vulkan](https://github.com/akandr/bc250#3-ollama--vulkan-setup)
- Por que o ROCm falha no gfx1013 (sem bibliotecas de solução rocBLAS/Tensile → `rocblas_abort()`; o ROCm recompila a cada launch vs Vulkan armazena shaders) — [akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm) · A ISA `gfx103x` do RDNA2 tem INT8 dp4a (`v_dot4c_i32_i8`), então isso é uma lacuna de biblioteca, não de hardware — [LLVM GFX1030 ISA](https://llvm.org/docs/AMDGPU/AMDGPUAsmGFX1030.html)
- Unlock de 40 CU em MoE, deltas de geração medidos (gpt-oss-20b 66.1→87.5, Qwen3.5-35B-A3B 59.5→78.7, mediana +32 % geração / +50 % prefill em 11 modelos; llama.cpp ≫ Ollama para MoE) — [akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results) · [§4 benchmarks](https://github.com/akandr/bc250#4-benchmarks) · patch de unlock: [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock)
- Setup funcional, gpt-oss-20b, uplift do Oberon, notas de OOM/distro — https://t.me/c/2424231195/101077
- MoE vs denso, largura de banda multi-placa — https://t.me/c/2424231195/125233
- Escalonamento de LLM com unlock de 40 CU, medido ao vivo (⚠ ASR — aproximado) — Qwen3.5-9B denso no Ollama+Vulkan: 25.7 → 31.9 → 33.4 tok/s (24 → unlock → 36 CU, ~+20 % total); placa limitada a 36 CU (2 CUs defeituosas, llama travou no carregamento) — [Old Lamer — vídeo RU de unlock de CU](https://youtu.be/M7PsojWr4KA)
- Datapoints MoE c/ MTP (⚠ não verificados, comentários do Hackaday) — Qwen "27b"+MTP ≈14.5 tk/s, "35b"+MTP ≈47 tk/s — thread de comentários do artigo da Hackaday sobre a BC-250
- Comando de pacote verificado — https://t.me/c/2424231195/101026 · Symlink de firmware Navi10→Cyan Skillfish — https://t.me/c/2424231195/7458/136321
- Build do llama.cpp (Vulkan / HIP) — [ggml-org/llama.cpp build.md](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md) · [releases](https://github.com/ggml-org/llama.cpp/releases) · [install](https://github.com/ggml-org/llama.cpp/blob/master/docs/install.md)
- A realidade do ROCm no gfx1013 — [ROCm/ROCm](https://github.com/ROCm/ROCm) · [woodrex83/ROCm-For-RX580 (somente gfx803)](https://github.com/woodrex83/ROCm-For-RX580) · [ulyssesrr/docker-rocm-xtra (arquivado; sem gfx1013)](https://github.com/ulyssesrr/docker-rocm-xtra) · [xuhuisheng/rocm-build navi10](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) · [robertrosenbusch/gfx803_rocm](https://github.com/robertrosenbusch/gfx803_rocm)
- Front-ends — [Jan AI](https://jan.ai/) · [KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)
- Modelos (GGUF) — [Hugging Face](https://huggingface.co/) · [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF) · [Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M)
- Overclock/governor — [09-overclock-undervolt.md](09-overclock-undervolt.md) · Base Linux — [06-linux.md](06-linux.md) · Resfriamento — [04-cooling.md](04-cooling.md)
