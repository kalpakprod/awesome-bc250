> 🌐 Tradução da comunidade. A versão em inglês é a fonte da verdade e pode estar mais atualizada. Achou um erro? Abra uma issue: [../en/11-gaming.md](../en/11-gaming.md) · https://github.com/lildebil0/awesome-bc250/issues

# Resultados e Configurações de Jogos

> **TL;DR** — A BC-250 é uma **GPU classe PS5 parafusada a um Zen2 de 6 núcleos reduzido**. A GPU é genuinamente capaz: em um overclock real de **2000 MHz** ela roda títulos AAA modernos a **40–60 FPS**, e jogos mais leves/antigos bem acima de 60. O problema é a **CPU**. A metade Zen2 da APU é o gargalo muito mais frequentemente que a GPU — benchmarks da comunidade mostram repetidamente a placa parada em **~36–47 % de carga de GPU enquanto travada em ~38 FPS**, limitada pela CPU. Então: **faça overclock primeiro** (~1500 MHz de fábrica é ~30 % mais lento), apoie-se em **FSR** e geração de quadros, mire **1080p–1440p**, e aceite que jogos pesados em física ou mal-threadados vão engasgar não importa a resolução. Ports first-party estilo console (God of War, Horizon, Last of Us, Spider-Man) são o ponto ideal.

Esta seção define expectativas e reúne os resultados reais e publicados da comunidade — muitos deles capturas de tela de benchmark. Os números variam com clock, distro, driver e divisão de VRAM, então cada linha está atrelada à sua fonte.

---

## A primeira coisa a entender: é limitado pela CPU

A GPU da BC-250 é uma peça RDNA2 derivada do PS5 (o RADV a reporta como `GFX1013` / classe NAVI10). Ela *não* é o elo fraco na maioria dos jogos. O elo fraco é a **CPU Zen2 de 6 núcleos** rodando a ~3,5 GHz com cache reduzido estilo PS5 e sem folga de SMT de sobra.

Um benchmark da comunidade a **1080p, High, GPU @ 2000 MHz / mem @ 3600 MHz** torna isso concreto: a execução **"atingiu 38 FPS"** com **GPU Limited Percentage de apenas 36,5 %** — a thread de simulação da CPU era o gargalo (CPU sim ~70 / CPU render ~43 / GPU ~47 no medidor por estágio). A GPU estava ociosa em um terço de sua capacidade enquanto a CPU segurava a taxa de quadros. ([src](https://t.me/c/2424231195/136242))

Consequências práticas:

- **A resolução muitas vezes é "de graça".** Como você está limitado pela CPU, ir de 1080p para 1440p (ou até 4K com FSR) frequentemente custa pouco FPS — a GPU tinha folga de sobra de qualquer jeito. Vários resultados em 4K abaixo parecem quase tão bons quanto suas contrapartes em 1080p exatamente por esse motivo.
- **O upscaling ajuda menos que num PC normal.** O FSR alivia a GPU, mas se a CPU é o limitador, baixar a resolução de renderização não vai elevar muito seu FPS. Use o FSR para qualidade de imagem / temperaturas, não como um botão mágico de FPS.
- **Jogos mal-threadados ou pesados em física te punem.** Engasgos e picos de frame-time (Gothic Remake, Doom: The Dark Ages antes das correções) vêm da CPU, não da GPU.
- **Faça overclock da GPU mesmo assim** — quando um jogo *é* limitado pela GPU (4K, ray tracing pesado, engines bem-threadadas), 1500 → 2000 MHz é ~+30 % de FPS. Veja [09-overclock-undervolt.md](09-overclock-undervolt.md) para como chegar lá, e [04-cooling.md](04-cooling.md) primeiro, porque 2000 MHz exige o mod de refrigeração.

---

## Configurações que realmente fazem diferença

- **Clocks.** ~1500 MHz de GPU de fábrica é o padrão lento; a comunidade roda **GPU a 2000 MHz, mem ~1900–2000 MHz** como alvo do dia a dia, com alguns empurrando **2,65 GHz de núcleo num build classe dGPU**. De fábrica vs. 2000 MHz é mais ou menos **+30 % de FPS** em cenas limitadas pela GPU. ([guia de overclock](09-overclock-undervolt.md))
- **Desbloqueio de 40 CUs.** A placa vem com CUs desabilitados. Desbloquear todos os **40 CUs** dá um ganho mensurável e amplo — um usuário relatou Doom: The Dark Ages indo de quebrado a **60 FPS High**, um título "007" a **60 FPS High**, e frame-times mais estáveis em Great Pragmata após o desbloqueio. ([src](https://t.me/c/2424231195/141193)) Veja [09-overclock-undervolt.md](09-overclock-undervolt.md).
- **FSR / FSR 4.** Use Quality ou Balanced em 1440p/4K para manter a GPU alimentada e as temperaturas baixas. A comunidade está ativamente portando o **FSR 4** (pacotes DLL compartilhados na thread). ([discussão FSR4 INT8 src](https://t.me/c/2424231195/136354)) Ganhos de FSR medidos por elektricM: **Quality +20–30 %, Balanced +30–40 %, Performance +40–60 %** de FPS; a **Frame Generation pode aproximadamente dobrar** a taxa de quadros (leve latência). **FSR 4 via Optiscaler** — a comunidade acha que **Balanced supera o FSR 3.1.5 Quality nativo**. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
  - **Qual upscaler realmente usar:** **FSR 1–3 é a escolha prática** aqui — é maduro, barato e bem suportado. **FSR 4 e XeSS *podem* tecnicamente rodar** neste silício RDNA2 via o **caminho DP4a (INT8)** — RDNA2 tem dp4a/Rapid Packed Math, então tanto o build FSR 4 INT8 do OptiScaler quanto a variante XeSS-DP4a agnóstica de GPU carregam — mas numa GPU tão fraca quanto esta eles são **lentos e experimentais**: o fallback DP4a é ~10–20 % mais pesado que o caminho WMMA que placas mais novas usam, e a qualidade de imagem no XeSS-DP4a fica abaixo da versão XMX. Trate FSR 4 / XeSS como algo para experimentar, não como seu driver diário. ([OptiScaler FSR4 INT8 em RDNA2 — VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/)) **O FSR 4 oficial da AMD para RDNA2 (classe RX 6000) chega ~início de 2027**; até lá é a rota OptiScaler/moddada. ([Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals))
- **Geração de quadros além do FSR — LSFG.** O **Lossless Scaling Frame-Generation (LSFG)** roda no Linux através da camada Vulkan **`lsfg-vk`** ([github.com/PancakeTAS/lsfg-vk](https://github.com/PancakeTAS/lsfg-vk)) — uma camada de geração de quadros agnóstica de jogo que se acopla a qualquer título Vulkan. A comunidade a usa para **aproximadamente dobrar o FPS** (ex.: 30 → 60) em jogos sem geração de quadros embutida. Como toda geração de quadros, ela adiciona latência e quer uma taxa de quadros real razoável da qual interpolar, mas é uma opção genuína quando a FG própria do FSR não está disponível.
- **Divisão de VRAM (UMA).** É um pool unificado de 16 GB. Em uma varredura cuidadosa (1440p, 1850 MHz), a divisão da GDDR6 (512 MB vs 8 GB reservados) **mal mudou o FPS médio** — mas uma configuração de UMA pequena demais ou errada pode te jogar na renderização por software (`llvmpipe`) ou travar um benchmark. Auto / uma reserva sensata serve; não pense demais. ([src](https://t.me/c/2424231195/81203))
- **VSync desligado** para benchmarking; **geração de quadros ligada** onde oferecida (ajudou Wukong a atingir médias de três dígitos, veja abaixo).
- **`mitigations=off`** (flag de boot do kernel) é um ajuste comum; na varredura de VRAM teve apenas efeitos pequenos e ruidosos no FPS. Trate como pequeno. ⚠ **verifique (magnitude contestada)** — elektricM relata um ganho bem maior (**+18 FPS em Cyberpunk, "+10–15 %"** nas dicas deles). É claramente dependente do jogo: grande em alguns títulos limitados pela CPU, desprezível em outros. Teste e meça; não assuma nenhum dos números. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

---

## Resultados que as pessoas realmente publicaram

Estes são números relatados pela comunidade com suas configurações e fonte. **Pontuações de benchmark e FPS são como publicados** — clocks/distro/driver diferem entre as linhas, então leia a coluna de contexto, não compare cegamente.

| Jogo | Configurações (res / preset / upscaling) | Resultado | HW / clocks | Fonte |
|------|--------------------------------------|--------|-------------|--------|
| **Black Myth: Wukong** (bench) | 1080p, High, FSR + Frame Gen ligado | **méd 96** (mín 78, máx 113) | BC-250, Windows, RADV NAVI10 | ([src](https://t.me/c/2424231195/10069)) |
| **Black Myth: Wukong** (bench) | 1440p, Medium, sem FSR | **méd ~48** (máx 56) | BC-250, 1850 MHz, Linux | ([src](https://t.me/c/2424231195/81203)) |
| **Shadow of the Tomb Raider** (bench) | 1440p, Max | **méd ~70** | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Marvel's Guardians of the Galaxy** (bench) | 1440p, High | **méd ~70** (89 máx, mín cai a ~3) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Dying Light 2** (bench) | 1440p, High, sem VSync | **méd ~48** (máx 62) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Cyberpunk 2077** (bench) | 1440p, Ray Tracing **mín** | **méd ~36** (mín 30) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Indiana Jones and the Great Circle** | 1440p, low, sem upscaler | **45** | BC-250, GPU ~1900 MHz, Vulkan | ([src](https://t.me/c/2424231195/36931)) |
| **Indiana Jones and the Great Circle** | 1440p, medium, upscaler ligado | **60** | BC-250 | ([src](https://t.me/c/2424231195/36931)) |
| **Forza Horizon 5** | **4K**, preset High, **sem FSR** | jogável (vídeo) | BC-250 | ([src](https://t.me/c/2424231195/81891)) |
| **The Witcher 3** | 4K, Medium, FSR Balanced | **~50** | BC-250 | ([src](https://t.me/c/2424231195/81894)) |
| **Kingdom Come: Deliverance II** | 4K, Med/High, FSR Quality | **~30** ("experiência PS5") | BC-250 | ([src](https://t.me/c/2424231195/81893)) |
| **The Last of Us Part II** | 1080p, preset padrão | jogável (vídeo) | BC-250 | ([src](https://t.me/c/2424231195/94237)) |
| **Doom: The Dark Ages** | High | **60** (após desbloqueio de 40 CUs + fix) | BC-250, 40 CU | ([src](https://t.me/c/2424231195/141193)) · [fix no Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/) · [Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS) |
| **Doom Eternal** | RT ligado (relatado pela comunidade) | **60 + RT** | BC-250; relatado pela comunidade (r/BC250Gaming) | ([síntese do Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Tekken 8** | (relatado pela comunidade) | **~60** | BC-250; relatado pela comunidade (r/BC250Gaming) | ([síntese do Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Street Fighter 6** | (relatado pela comunidade) | **~60** | BC-250; relatado pela comunidade (r/BC250Gaming) | ([síntese do Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Stellar Blade** | (relatado pela comunidade) | **~70–80** | BC-250; relatado pela comunidade (r/BC250Gaming) | ([síntese do Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | Frame Generation ligada (relatado pela comunidade) | **60 → 100** (FG) | BC-250; relatado pela comunidade (r/BC250Gaming) | ([síntese do Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | (vídeo) | jogável | BC-250, CPU de fábrica, **GPU 2000** | ([src](https://t.me/c/2424231195/121772)) |
| **Gothic Remake** | Medium | **engasga** — "sem otimização" | BC-250 | ([src](https://t.me/c/2424231195/142708)) |
| **Hi-Fi Rush** | (vídeo, captura OBS) | suave | BC-250, `mitigations=off` | ([src](https://t.me/c/2424231195/91022)) |
| **Cyberpunk 2077** | 1080p, High, FSR Quality, **sem RT** | **70–90** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Cyberpunk 2077** (bench) | 1080p (de fábrica 2000 MHz / 1000 mV) | **57.66** → **60.82** OC (2230 MHz); `mitigations=off` **+18** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **The Last of Us Part I** | 1080p, Medium-High | **60** (estável) | BC-250 — 90–100 °C durante compilação de shaders; alguns estalos no áudio | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Devil May Cry 5** | 1080p, High | **100** (menor latência, ~10 ms) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Detroit: Become Human** | 1080p, Medium | **60** (limitado) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Control** | 1080p, **RT** completo | **40** | BC-250 — bom para RT de nível de entrada | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Company of Heroes 3** | 1080p | jogável — **precisa de divisão de 4 GB de VRAM** (512 MB dá artefatos/crashes) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Red Dead Redemption 2** (bench) | use a flag `-useMaximumSettings` | **45+** mín | BC-250 — pode detectar o adaptador de GPU errado, defina manualmente | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **CS2** / **Rocket League** / **Elden Ring** | 1080p | **100+** / **120+** / **60** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Helldivers 2** | 1080p, low (relatado) | **≈82** | BC-250, de fábrica, único Noctua NF-P12 — GPU 73 °C / CPU 76 °C; ⚠ ASR | ([“Temps Shocked Me”](https://youtu.be/d7Hwqxn9yg8) ~5:08) |
| **Stalker 2** | medium (relatado) | **≈80** | BC-250 — autor sinaliza limitado pela CPU / 8 GB de RAM; ⚠ ASR | ([review em RU](https://youtu.be/19l03qneKJ4) ~0:23) |
| **Stalker 2** | QHD (2560×1600), FSR Quality + Frame Gen, patch 1.21 (relatado) | **57–70** (1080p, sem FG **≈45**) | BC-250; ⚠ ASR | ([review em RU](https://youtu.be/19l03qneKJ4) ~18:52) |
| **Arc Raiders** | 1080p (relatado) | **≈56–80** | BC-250, de fábrica; ⚠ ASR | ([Temps Shocked Me](https://youtu.be/d7Hwqxn9yg8) ~5:58) |
| **Spider-Man 2** | 1080p, High, FSR Frame Gen (relatado) | **≈100** méd (abaixo de 60 nativo) | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~11:04) |
| **Forza Horizon 5** | 1080p, Medium, sem FSR (relatado) | **70–95** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~12:19) |
| **Metro Exodus** | QHD, High (relatado) | **≈58** | BC-250; ⚠ ASR | ([review em RU](https://youtu.be/19l03qneKJ4) ~14:12) |
| **Palworld** | 1080p, med-high (relatado) | **<60** (jogável) | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:04) |
| **Red Dead Redemption 2** | 1080p, med-high, FSR Quality (relatado) | **60 sólido** | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:19) |
| **Left 4 Dead 2** | 1080p, max (relatado) | **>150** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~10:18) |
| _Referência: build com GPU discreta_ | RE-engine bench, 1080p, High, sem RT | **méd 67.99** (mín 58, máx 82) | **RX 6600** + Xeon E5-2667v4, Win10 | ([src](https://t.me/c/2424231195/116494)) |

> A linha da RX 6600 **não é um resultado da BC-250** — é um membro rodando uma placa discreta no mesmo chassi/CPU como ponto de comparação. Incluída para mostrar o que a *CPU* sozinha consegue sustentar.

> ⚠️ **Elden Ring — resultados variam.** Os ~60 FPS acima (elektricM, 1080p) não são universais: um build da comunidade ficou **travado num lock de 30 FPS no High e não atingiu 60 nem em 720p low** (limitado pela CPU). Trate 60 como o melhor caso, não uma garantia. ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:50)

### Ports first-party / de console — o ponto ideal

Estes rodaram bem o suficiente para que um membro simplesmente os listasse como "funciona" (ports estilo PS se apoiam na GPU e são bem otimizados, o que combina com esta placa):

> Days Gone · Death Stranding · DIRT 5 · Ghost of Tsushima: Director's Cut · God of War (2018) · God of War: Ragnarök · Horizon Forbidden West · Horizon Zero Dawn · The Last of Us Part I · The Last of Us Part II Remastered · Returnal · Uncharted: Legacy of Thieves

([src](https://t.me/c/2424231195/99563))

---

## Jogos com problemas conhecidos (não funcionam / precisam de contorno)

elektricM acompanha títulos que não cobrimos e que **falham ou brigam com a plataforma** — confira antes de comprar:

| Jogo | Problema | Contorno |
|------|---------|-----------|
| **Fortnite** | O Easy Anti-Cheat **não suporta Linux** | **Nenhum — não dá para rodar** numa BC-250 com Linux |
| **Valorant** | Anti-cheat em nível de kernel | Problemas técnicos no Linux; na prática um não |
| **Magic: The Gathering Arena** | Crashes/travamentos especificamente no **Fedora** | Funciona melhor no **Manjaro / Bazzite**; tente outro Proton |
| **Final Fantasy VII Rebirth** | "DX12 is not supported on your system" (checagem de compatibilidade de GPU) | **Ainda sem correção** |
| **Black Myth: Wukong** (crackeado) | "CreateProcess() returned 2" (anti-tamper) | Use **arquivos de jogo não modificados** |

(O status de anti-cheat muda com o tempo — confira cruzando [areweanticheatyet.com](https://areweanticheatyet.com) e [protondb.com](https://www.protondb.com).) ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

### Bloqueados de vez por recursos de GPU ausentes (não corrigível)

Isto é **silício classe RDNA 2** (GFX1013). Um punhado de títulos mais novos **exige obrigatoriamente recursos de GPU que o RDNA 2 não tem** — principalmente **mesh shaders** e **variable-rate shading (VRS) por hardware** — e se recusa a rodar. O silício ausente é uma **limitação de hardware, não um bug de driver**: nenhuma atualização do Mesa, parâmetro de kernel ou versão do Proton adiciona o recurso em si. **Mesh shaders** são um muro de verdade. Um requisito de **VRS** às vezes é só uma checagem em tempo de inicialização que uma camada Vulkan em espaço de usuário pode burlar (veja a nota do Doom abaixo) — então nem sempre é fatal. Exemplos confirmados ([thread da comunidade r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)):

| Jogo | Requisito obrigatório que a BC-250 não tem |
|------|------------------------------------|
| **Final Fantasy VII Rebirth** | **Mesh shaders** — não roda (é também por isso que ele dispara a checagem de compatibilidade de GPU DX12 na tabela acima) |
| **Doom: The Dark Ages — Update 2** | **Vulkan fragment shading rate** (VRS por hardware) — o Update 2 tornou o VRS obrigatório *na inicialização*; a GPU não tem, então o jogo não modificado não inicia mais (o build anterior ao Update 2 rodava a 60 FPS após o desbloqueio de 40 CUs, acima). **Existe um contorno** — veja a nota abaixo. |

> **Doom: The Dark Ages Update 2 — agora existe um contorno.** O jogo só *checa* o VRS na inicialização; ele nunca realmente precisa dele para o gameplay. A camada Vulkan **`bangstk/Vulkan_NullVRS`** ([github.com/bangstk/Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS)) intercepta o `vkCmdSetFragmentShadingRateKHR()` e o transforma em no-op, satisfazendo a checagem de inicialização para que o jogo rode sem efeitos colaterais no jogo. Então Doom: The Dark Ages **não** é um bloqueio permanente. **Mesh shaders são diferentes** — não há shim equivalente para o requisito de mesh shaders do FF7 Rebirth, então esse realmente não vai rodar.

> Antes de comprar um título AAA novíssimo, verifique se ele lista mesh shaders ou VRS por hardware como requisito. **Mesh shaders** são um muro de hardware de verdade aqui (sem contorno). Um requisito de **VRS por hardware** muitas vezes é só uma trava em tempo de inicialização — às vezes burlável (como no Doom acima), às vezes não — então consulte a comunidade antes de assumir qualquer dos lados.

## Ray tracing — o que realmente foi testado

A BC-250 tem **RT por hardware RDNA2 real** (não emulação por software, considerando Mesa 25.2+). Títulos de RT testados por elektricM:

| Jogo | Res | FPS | Notas |
|------|-----|-----|-------|
| Cyberpunk 2077 | 1080p | 50–60 | Apenas iluminação RT, FSR Quality |
| Control | 1080p | 40 | RT completo |
| Portal 2 RTX | 720p | 40 | Caminho de RT por software no Mesa 25.2+ |
| Half-Life 2 RTX | 720p | 20–30 | Muito exigente |

O RT aqui é de nível de entrada — ok para *apenas iluminação* em jogos bem otimizados, não para cargas com path tracing completo. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

## Proton e opções de inicialização (Linux)

- **Versão do Proton:** comece com **Proton GE** (melhor compatibilidade) ou **Proton Experimental**; recorra ao estável **8.0 / 9.0** por jogo. Instale o GE via **ProtonUp-Qt** (`protonup-qt`). Alguns títulos só funcionam numa versão específica — teste se um falhar. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Opções de inicialização da Steam** que vale conhecer:
  - `mangohud %command%` — overlay de FPS/temperaturas.
  - `RADV_DEBUG=nohiz %command%` — força o RADV / corrige alguns glitches.
  - `gamemoderun %command%` — governador de CPU para performance durante a sessão (ajuda esta placa limitada pela CPU).
  - Combinado: `RADV_DEBUG=nohiz mangohud gamemoderun %command%`.
- **VRAM por jogo (divisão UMA):** esports/indie ficam bem com **512 MB**; **a maioria dos jogos quer 4 GB**; AAA/RT também querem os parâmetros de kernel de VRAM extra (`amdgpu.gttsize=...`, veja [06-linux.md](06-linux.md) / [08-bios.md](08-bios.md)). Uma divisão pequena demais causa artefatos, crashes ou uma queda para renderização por software. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Engasgo na primeira execução** costuma ser **compilação de shaders** — deixe a Steam terminar de pré-compilar antes de julgar o FPS; um cache de shaders maior ajuda. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Correções por jogo** (relatadas pela comunidade, r/BC250Gaming — tente se você bater nestes bugs exatos):
  - **Resident Evil Requiem — cabelo quebrado/com glitch:** adicione `RADV_DEBUG=nohiz %command%` às opções de inicialização (a mesma flag RADV listada acima, aplicada aqui especificamente). ([síntese do Reddit](https://www.reddit.com/r/BC250Gaming/))
  - **Spider-Man 2 / Assassin's Creed Shadows — travamentos:** habilitar o **zswap** (swap comprimido) supostamente para os travamentos. ([síntese do Reddit](https://www.reddit.com/r/BC250Gaming/))

---

## Emulação

Emuladores são pesados em CPU, então os resultados são mistos, mas vários são sólidos ([src](https://t.me/c/2424231195/78988)):

- **Switch — Eden / Ryujinx:** funciona bem e rápido. Relatado pela comunidade (r/BC250Gaming): **Mario Kart ~60 FPS**; **Tears of the Kingdom ~30–40 FPS**. ✅ ([síntese do Reddit](https://www.reddit.com/r/BC250Gaming/))
- **PS4 — shadPS4 (0.9.0+):** Bloodborne roda bem sem quedas; alguns títulos (The Last Guardian) dão artefatos mas mantêm FPS estável. ✅
- **PS3 — RPCS3:** funciona, mas precisa de ajuste por jogo. ⚠️ **Peculiaridade conhecida** (relatada pela comunidade, r/BC250Gaming): um bug do emulador **trava a GPU em 1000 MHz** sob o RPCS3, então a GPU não consegue subir de clock — o contorno é **fazer overclock da CPU para compensar** a folga de GPU perdida. ([síntese do Reddit](https://www.reddit.com/r/BC250Gaming/))
- **Xbox 360 — Xenia Canary:** menus carregam, o gameplay cai para uma tela preta (ainda em investigação). ❌

---

## Onde ver rodando (vídeo)

A comunidade publica bastante vídeo de gameplay/benchmark. Algumas capturas e canais da thread:

- Clipes de gameplay/benchmark da BC-250: [youtu.be/CYDv1SfD2Pc](https://youtu.be/CYDv1SfD2Pc) · [youtu.be/g3uWOfqcexA](https://youtu.be/g3uWOfqcexA) · [youtu.be/9fozmRrAouc](https://youtu.be/9fozmRrAouc) · [youtu.be/q64M2XzADjA](https://youtu.be/q64M2XzADjA) · [youtu.be/0LEkOG1yqqw](https://youtu.be/0LEkOG1yqqw)
- Planilha de acompanhamento da comunidade com jogos testados (FPS/configurações): [Google Sheet](https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing)

---

## Cheat-sheet de expectativas realistas

| Você quer… | Realidade numa BC-250 a 2000 MHz, moddada |
|-----------|--------------------------------------|
| 1080p AAA, 60 FPS | Às vezes — depende da carga de CPU. FSR + Frame Gen ajuda. AAA mais antigo/leve: sim. |
| 1440p AAA | 40–60 FPS na maioria dos ports; a GPU tem folga aqui. Resolução de melhor custo-benefício. |
| 4K AAA | 30–50 FPS com FSR em ports bem otimizados/de console (Forza, Witcher 3, KCD2). |
| Ray tracing | Só no mínimo, FPS baixo (Cyberpunk ~36 @ 1440p RT-mín). Não é o forte da placa. |
| 60 travado em tudo | Não. Títulos limitados pela CPU e pesados em física vão cair/engasgar independente das configurações. |
| Ports PS first-party | O ponto ideal — é o que a placa faz de melhor. |

---

## Fontes

- Benchmark limitado pela CPU (38 FPS, 36,5 % GPU) — https://t.me/c/2424231195/136242
- Tabela grande de benchmark de VRAM/clock (Wukong, Tomb Raider, Dying Light 2, Cyberpunk, Guardians) — https://t.me/c/2424231195/81203
- Wukong 1080p High FSR+FG, méd 96 — https://t.me/c/2424231195/10069
- Indiana Jones Great Circle, multi-res — https://t.me/c/2424231195/36931
- Forza Horizon 5 4K — https://t.me/c/2424231195/81891 · Witcher 3 4K — https://t.me/c/2424231195/81894 · KCD2 4K — https://t.me/c/2424231195/81893
- Resultados do desbloqueio de 40 CUs (Doom Dark Ages 60 FPS) — https://t.me/c/2424231195/141193 · fix do Doom — https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/
- TLOU II 1080p — https://t.me/c/2424231195/94237 · Resident Evil Requiem — https://t.me/c/2424231195/121772 · engasgo do Gothic Remake — https://t.me/c/2424231195/142708
- Lista de ports first-party — https://t.me/c/2424231195/99563
- Resumo de emulação — https://t.me/c/2424231195/78988
- Comparação com dGPU RX 6600 — https://t.me/c/2424231195/116494
- Compatibilidade de jogos do elektricM (configurações/FPS por jogo, jogos com problemas, tabela de RT, Proton e opções de inicialização, ganhos de FSR) — https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/
- Capturas de FPS do YouTube (auto-legenda / ASR — números aproximados): ETA Prime (Spider-Man 2, Forza H5, Left 4 Dead 2) — https://youtu.be/q_CxcbS5HI8 · "Temps Shocked Me" (Helldivers 2, Arc Raiders) — https://youtu.be/d7Hwqxn9yg8 · review em RU (Stalker 2, Metro Exodus) — https://youtu.be/19l03qneKJ4 · Pixels & Power (Palworld, RDR2, Elden Ring 30 FPS) — https://youtu.be/4S0DvIpqm0E
- Bloqueios de hardware por mesh-shader / VRS por hardware (FF7 Rebirth, Doom: The Dark Ages Update 2) — [thread r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- **Contorno de VRS do Doom: The Dark Ages — `bangstk/Vulkan_NullVRS`** (camada Vulkan no-op para `vkCmdSetFragmentShadingRateKHR`) — https://github.com/bangstk/Vulkan_NullVRS
- **Geração de quadros LSFG no Linux — `lsfg-vk`** (camada Vulkan) — https://github.com/PancakeTAS/lsfg-vk
- **FSR 4 / XeSS via DP4a (INT8) em RDNA2** — build OptiScaler FSR4 INT8: [VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/) · [wiki de compat FSR4 do OptiScaler](https://github.com/optiscaler/OptiScaler/wiki/FSR4-Compatibility-List)
- **FSR 4 oficial da AMD para RDNA2 (~início de 2027) / RDNA3 (julho de 2026)** — [Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals)
- **Resultados de jogos relatados pela comunidade (r/BC250Gaming)** — Tekken 8, Street Fighter 6, Stellar Blade, RE Requiem Frame-Gen, Doom Eternal RT, Switch (Mario Kart / TOTK), lock de GPU em 1000 MHz no RPCS3, correções de cabelo do RE Requiem / Spider-Man 2 / AC Shadows — https://www.reddit.com/r/BC250Gaming/
- Planilha de testes de jogos da comunidade — https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing

> Clocks e o desbloqueio de 40 CUs ficam em [09-overclock-undervolt.md](09-overclock-undervolt.md); faça o mod de [04-cooling.md](04-cooling.md) antes de rodar a 2000 MHz.
