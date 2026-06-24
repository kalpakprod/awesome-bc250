> 🌐 Tradução da comunidade. A versão em inglês é a fonte da verdade e pode estar mais atualizada. Achou um erro? Abra uma issue: [../en/15-emulation.md](../en/15-emulation.md) · https://github.com/lildebil0/awesome-bc250/issues

# Emulação

> **TL;DR** — A BC-250 é uma máquina de emulação surpreendentemente boa porque junta uma GPU RDNA2 de classe PS5 com 16 GB de GDDR6 rápida — mas a emulação é **fortemente limitada pela CPU**, e o **Zen 2 de 6 núcleos** reduzido a ~3,5 GHz é o teto para os sistemas mais exigentes. **Tudo até PS2 / GameCube / Wii / PSP / Dreamcast, inclusive, é a zona confortável** (retrô é trivial; o PSP está confirmado no chat rodando em 4× a resolução interna). **Switch / PS3 / PS4 são exigentes e instáveis**, e o **Xbox 360 mal dá boot**. Comprovado no chat na placa: **Switch via Eden** "funciona bem e rápido", **PS3 via RPCS3** funciona com ajuste por jogo, **PS4 via shadPS4** roda Bloodborne bem, **PSP via PPSSPP** roda ótimo, e **Xbox 360 via Xenia** está quebrado em jogo. **Faça overclock e resfrie a placa primeiro** — sem um governor a GPU fica em ~1000 MHz dentro de um emulador e engasga. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/130879))

Esta página é o mergulho profundo; [11-gaming.md](11-gaming.md) tem a versão curta dentro da sua tabela de resultados. ROMs/chaves/BIOS são problema seu para obter legalmente — nada disso é coberto aqui.

> **Como ler a coluna de status.** Esta placa foi discutida de forma desigual: alguns sistemas foram testados em primeira mão no chat, a maioria dos sistemas retrô não. Então cada linha é marcada:
> - **✅ / ⚠️ / ❌ (chat)** — um membro rodou *em uma BC-250* e relatou o resultado, com a mensagem citada.
> - **(geral ⚠)** — o **melhor emulador Linux conhecido e a expectativa geral para esta classe de hardware** (Zen 2 + RDNA2). **Não testado na BC-250.** Trate como "deveria ir bem / deveria ser difícil", nunca como uma promessa medida. Nenhum número de FPS específico da BC-250 é inventado em qualquer ponto desta página.

---

## Faça estas duas coisas antes de emular qualquer coisa

A emulação amplifica ambas as esquisitices da placa, então os pré-requisitos importam mais aqui do que em jogos normais:

1. **Faça overclock primeiro.** Um membro que tentou emular Switch numa placa padrão encontrou a GPU travada em **1000 MHz dentro do emulador** mesmo que jogos normais clocassem bem — a correção foi definir o governor no clock máximo manualmente antes de lançar. ([src](https://t.me/c/2424231195/130879)) Rode o **oberon-governor** a **2000 MHz** (e considere o OC da CPU para 4 GHz), conforme [09-overclock-undervolt.md](09-overclock-undervolt.md) — a emulação precisa de cada megahertz que a CPU puder dar.
2. **Resfrie primeiro.** 2000 MHz precisa do mod de resfriamento ou a placa faz throttle/reseta. Faça [04-cooling.md](04-cooling.md) antes de buscar o overclock.

> **Por que ser limitado pela CPU importa tanto aqui.** Um motor de jogo é otimizado para o hardware em que ele vem; um emulador, em vez disso, *simula* a CPU de outro console na sua, o que é muito mais pesado por frame. Na BC-250 os **6 núcleos Zen 2 a ~3,5 GHz** ([especificação de hardware](https://elektricm.github.io/amd-bc250-docs/hardware/specifications/)) são o limitador para Switch/PS3/PS4 — a GPU de classe PS5 geralmente tem folga de sobra. Um membro buscando melhor desempenho no Switch viu exatamente isso: em jogo a **GPU fica muito subutilizada enquanto a CPU é a parede**. ([src](https://t.me/c/2424231195/136712)) Mais núcleos não ajudam a thread quente de um emulador; clock e IPC ajudam. Este é o mesmo gargalo de CPU descrito em [11-gaming.md](11-gaming.md), só que mais acentuado.

---

## Começando — três formas de instalar

Esta placa não tem esquisitices específicas de emulação além dos dois pré-requisitos acima — para os emuladores ela é um PC Linux normal. Escolha uma de:

- **EmuDeck** — a forma mais rápida de obter uma configuração completa multi-sistema de uma vez só. Ele baixa e pré-configura toda a stack standalone (RetroArch, PCSX2, Dolphin, DuckStation, PPSSPP, melonDS, Ryujinx, …), conecta os controles, e foi confirmado funcionando na placa ("o Ryujinx que vem com o EmuDeck também é bom"). ([src](https://t.me/c/2424231195/99039)) Ele tem como alvo Steam Deck / Linux, o que combina com a instalação típica de Bazzite/CachyOS/Arch da BC-250 ([06-linux.md](06-linux.md)). O **RetroDECK** (um equivalente contido em Flatpak) é a mesma ideia se você preferir um app em sandbox.
- **RetroArch** — um front-end, vários "cores" (emuladores-como-plugins). Ideal para tudo 8/16/32-bit até PS1/N64/DS — instale uma vez, adicione os cores abaixo, aponte para suas ROMs. Disponível como Flatpak em toda distro da BC-250.
- **Emuladores standalone** — para os sistemas pesados (Switch, PS3, PS4, PS2, GameCube/Wii, Xbox) o app standalone dedicado bate o core do RetroArch em recursos e compatibilidade. **Instale o build nativo de Linux** onde puder — os primeiros testes da BC-250 mostraram builds nativos (Ryujinx) se comportando melhor do que builds Windows rodados via Proton. ([src](https://t.me/c/2424231195/23577)) A maioria está no Flathub ou no AUR do Arch (ex.: `paru -S cemu`). ([src](https://t.me/c/2424231195/74138))

Depois **lance pela Steam** ("adicionar um jogo não-Steam") para suporte a controle e um overlay — o mesmo fluxo que o chat usa para todo o resto (veja [11-gaming.md](11-gaming.md)).

> **Quer uma distro dedicada à emulação?** O **Batocera** (uma distro de emulação pronta + frontend) está **confirmado pela comunidade rodando na BC-250** ([thread da comunidade r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)) — dê boot nele em vez de um Linux desktop e você tem uma máquina de emulação estilo console, plug-and-play, em vez de instalar emuladores um por um. Ele está listado como uma distro confirmada dando boot em [06-linux.md](06-linux.md). Os mesmos pré-requisitos de overclock + resfriamento continuam valendo.

> **Fique de olho no governor.** Se um emulador rodar devagar, verifique seus clocks antes de culpar o emulador: ele pode estar em 1000 MHz. Defina o oberon-governor no valor máximo (alguns rodam travado em ~2250 MHz) antes de lançar, depois verifique com um overlay (`amdgpu_top` / MangoHud). ([src](https://t.me/c/2424231195/130879), [src](https://t.me/c/2424231195/130955))

> **Sem imagem de emulação pré-configurada.** Novatos pedem regularmente uma imagem pronta com emuladores configurados. A comunidade trata uma "imagem BC-250 configurada" compartilhada como tabu — configure você mesmo a partir dos guias; não é difícil depois que a placa está com overclock. ([src](https://t.me/c/2424231195/130845), [src](https://t.me/c/2424231195/130877))

---

## O que a comunidade de fato rodou

O ponto de dado mais útil é o resumo de um membro depois de testar vários emuladores na placa ([src](https://t.me/c/2424231195/78988)):

- **Switch (Eden)** — "funciona bem e rápido."
- **PS3 (RPCS3)** — funciona, mas "precisa de ajuste individual de jogo para jogo."
- **PS4 (shadPS4 0.9.0)** — Bloodborne roda bem sem quedas; The Last Guardian começou a apresentar artefatos mas manteve uma taxa de frames estável.
- **Xbox 360 (Xenia Canary)** — os menus do jogo abrem, mas o gameplay cai para uma tela preta (ainda responde ao gamepad); não resolvido.

Mais confirmações em primeira mão:

- **Switch / Eden é a escolha consensual.** Quando um novato perguntou qual emulador de Switch pegar, a resposta foi direta: **"O Eden é o mais decente."** ([src](https://t.me/c/2424231195/130842)) Outros ecoaram que o **Eden instala e funciona bem** ([src](https://t.me/c/2424231195/98942)), e que o **Eden funciona ótimo, e o Ryujinx que vem com o EmuDeck também é bom.** ([src](https://t.me/c/2424231195/99039)) Títulos first-party pesados ainda taxam a CPU: um membro jogando **Tears of the Kingdom no Eden (com NX Optimizer) relatou quedas de frames**. ([src](https://t.me/c/2424231195/124216))
- **PS4 / shadPS4** — um membro **vendeu seu PS4 físico e agora rejoga Bloodborne na BC-250 via shadPS4**, dizendo que "abre em 2 cliques." ([src](https://t.me/c/2424231195/38704), [src](https://t.me/c/2424231195/38706)) Outro confirmou que **Drive Club roda 100%** no shadPS4. ([src](https://t.me/c/2424231195/82128))
- **PS3 / RPCS3** — além do resumo, membros relataram **Uncharted com "framerate estável, jogável"** ([src](https://t.me/c/2424231195/74644)) e um direto **"funciona ótimo no RPCS3."** ([src](https://t.me/c/2424231195/53601))
- **PSP / PPSSPP** — rodado em primeira mão e elogiado repetidamente: um membro rodou **PPSSPP em 4× a resolução interna** sem throttling térmico na placa. ([src](https://t.me/c/2424231195/101579), [src](https://t.me/c/2424231195/103218), [src](https://t.me/c/2424231195/111096))

### Uma nota sobre o histórico dos emuladores de Switch (Yuzu → Eden / Ryubing)

A emulação de Switch na placa passou pela mesma reviravolta que em todo lugar. Um retrato inicial do estado das coisas encontrou **Yuzu e Suyu travando ao lançar** enquanto o **Ryujinx funcionava** (builds nativos). ([src](https://t.me/c/2424231195/23577)) O Yuzu foi encerrado pela Nintendo em 2024 e seus sucessores carregam a tocha: o **Eden** (um fork do Yuzu) é a escolha da comunidade BC-250 que "funciona bem e rápido", e a linha **Ryujinx** segue viva como o fork comunitário **Ryubing**, que permanece em desenvolvimento ativo em 2026. Note que a Nintendo litiga agressivamente contra emuladores de Switch e remove chaves/links de download — em fev/2026 ela aplicou DMCA ao Eden junto com uma dúzia de outros forks, então espere caçar tanto os binários quanto as chaves. ([src](https://t.me/c/2424231195/136649))

---

## Tabela completa de compatibilidade — toda plataforma

Uma linha por plataforma. **Emulador** é a melhor escolha atual de Linux; **Status na BC-250** é citado do chat onde um membro testou, caso contrário a expectativa geral para hardware Zen 2 + RDNA2 (marcado `geral ⚠`, **não medido na BC-250**).

### Nintendo

| Sistema | Melhor emulador Linux | Status na BC-250 | Notas |
|--------|--------------------|------------------|-------|
| **NES / Famicom** | Mesen (ou FCEUmm) — core RetroArch | ✅ Trivial (geral ⚠) | 8-bit; qualquer batata roda. Não precisa de relato BC-250. |
| **SNES** | Snes9x (bsnes para precisão) — RetroArch | ✅ Trivial (geral ⚠) | Snes9x é rápido e ~99% compatível; bsnes se você quiser precisão de ciclo. |
| **Game Boy / GBC** | SameBoy / Gambatte — RetroArch | ✅ Trivial (geral ⚠) | SameBoy é a escolha de precisão. |
| **GBA** | mGBA (standalone ou RetroArch) | ✅ Trivial (geral ⚠) | mGBA é o padrão-ouro. |
| **N64** | simple64 / RMG (mupen64plus); core RetroArch | ✅ Fácil (geral ⚠) | simple64 está arquivado; seu dev migrou para o **gopher64** (Rust). Tanto RMG quanto gopher64 servem. Confortável nesta CPU. |
| **DS** | melonDS (standalone ou RetroArch) | ✅ Fácil (geral ⚠) | melonDS há tempos substituiu o DeSmuME. |
| **3DS** | **Azahar** (fusão Citra/Lime3DS) | ✅ Deveria ser fácil (geral ⚠) | Citra recebeu DMCA; o **Azahar** é o sucessor mantido. Confortável para este hardware. |
| **GameCube** | **Dolphin** | ✅ Deveria rodar ótimo (geral ⚠) | Dolphin é maduro e acelerado por Vulkan. Mencionado no chat (multi-janela/CLI) mas sem FPS em primeira mão postado — trate como fácil, não medido. ([src](https://t.me/c/2424231195/19715)) |
| **Wii** | **Dolphin** | ✅ Deveria rodar bem (geral ⚠) | Mesmo build do Dolphin. Era confortável para a BC-250; não foi benchmarkado na BC-250 no chat. |
| **Wii U** | **Cemu** (Linux nativo, open-source) | ⚠ Perguntado, não confirmado | Um membro perguntou sobre rodá-lo (e `cemu` está no AUR), mas **nenhum resultado funcional na BC-250 foi postado**. Cemu é mais pesado que o Dolphin — verifique você mesmo. ([src](https://t.me/c/2424231195/68253), [src](https://t.me/c/2424231195/74138)) |
| **Switch** | **Eden** (sucessor do Yuzu) | ✅ Funciona bem e rápido (chat) | A escolha nº 1 da comunidade. Defina o governor no máximo antes de lançar. Alguns títulos vêm travados em 30 FPS e precisam de um patch de 60 FPS (ex.: Zelda); títulos first-party pesados (TOTK) ainda derrubam frames — limitados pela CPU. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/130842), [src](https://t.me/c/2424231195/124216), [src](https://t.me/c/2424231195/130887)) |
| **Switch** | **Ryujinx** (agora o fork **Ryubing**) | ✅ Funciona (chat) | Builds nativos rodaram com sucesso; o Ryujinx empacotado com o EmuDeck "também é bom." ([src](https://t.me/c/2424231195/51606), [src](https://t.me/c/2424231195/99039)) |
| **Switch** | Yuzu / Suyu | ❌ Quebrou ao lançar — legado (chat) | Relatos iniciais: travava ao iniciar um jogo. Yuzu foi descontinuado — use o Eden. ([src](https://t.me/c/2424231195/23577)) |

### Sony

| Sistema | Melhor emulador Linux | Status na BC-250 | Notas |
|--------|--------------------|------------------|-------|
| **PS1** | **DuckStation** (standalone ou RetroArch) | ✅ Trivial (geral ⚠) | DuckStation é o padrão moderno; recursos de aprimoramento de graça. |
| **PS2** | **PCSX2** (v2.x, Qt + Vulkan) | ✅ Deveria rodar bem (geral ⚠) | 98%+ de compatibilidade, o clássico alvo de "emulação fácil". Não benchmarkado em primeira mão na BC-250 no chat — mas bem dentro da classe deste hardware. |
| **PSP** | **PPSSPP** | ✅ Roda ótimo — 4× res (chat) | Em primeira mão: rodou em 4× a resolução interna sem throttling. Um dos sistemas mais confortáveis na placa. ([src](https://t.me/c/2424231195/101579), [src](https://t.me/c/2424231195/103218), [src](https://t.me/c/2424231195/111096)) |
| **PS Vita** | **Vita3K** | ⚠ Experimental (geral ⚠) | Vita3K é o único emulador de Vita e ainda é inicial em todo lugar; espere quebras por jogo. Sem relato BC-250. (Uma fala do chat "basicamente um PS Vita no talo" era sobre o hardware, não o emulador. ([src](https://t.me/c/2424231195/86140))) |
| **PS3** | **RPCS3** | ⚠️ Funciona, ajuste por jogo (chat) | O mais punitivo de CPU entre os alvos realistas. Uncharted "estável, jogável", "funciona ótimo" relatados; um testador inicial encontrou erros. Precisa de ajuste título a título. Existe vídeo-tutorial da comunidade para PS3. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/74644), [src](https://t.me/c/2424231195/53601), [src](https://t.me/c/2424231195/13)) |
| **PS4** | **shadPS4** (0.9.0+; 0.16 em 2026) | ✅ Bloodborne / Drive Club jogáveis (chat) | "Abre em 2 cliques." Bloodborne suave e sem quedas; Drive Club 100%; alguns títulos apresentam artefatos mas mantêm o FPS. Por jogo. ([src](https://t.me/c/2424231195/78988), [src](https://t.me/c/2424231195/38706), [src](https://t.me/c/2424231195/82128)) |

### Microsoft

| Sistema | Melhor emulador Linux | Status na BC-250 | Notas |
|--------|--------------------|------------------|-------|
| **Xbox (OG)** | **xemu** | ⚠ Deveria funcionar (geral ⚠) | xemu é LLE com ~80% dos jogos jogáveis; AppImage nativo de Linux. Sem relato BC-250 — mas um alvo leve para esta CPU. Verifique por jogo. |
| **Xbox 360** | **Xenia** (padrão) | ⚠️ Dá boot, perf baixa (chat) | Xenia comum roda mas "o desempenho no padrão está no chão" — overclock é obrigatório. ([src](https://t.me/c/2424231195/23577)) |
| **Xbox 360** | **Xenia Canary** | ❌ Tela preta em jogo (chat) | Os menus carregam e o gamepad responde, mas o gameplay é uma tela preta. No Linux o backend Vulkan ainda está incompleto. Não resolvido. ([src](https://t.me/c/2424231195/78988)) |

### Sega

| Sistema | Melhor emulador Linux | Status na BC-250 | Notas |
|--------|--------------------|------------------|-------|
| **Master System** | Genesis Plus GX — RetroArch | ✅ Trivial (geral ⚠) | Um core cobre SMS/Genesis/Game Gear/SG-1000/Sega CD. |
| **Genesis / Mega Drive** | Genesis Plus GX (BlastEm para precisão) | ✅ Trivial (geral ⚠) | Trivial para este hardware. |
| **Game Gear** | Genesis Plus GX — RetroArch | ✅ Trivial (geral ⚠) | Mesmo multi-core Sega. |
| **Saturn** | **Mednafen/Beetle Saturn** (ou Kronos) | ✅ Deveria ir bem (geral ⚠) | Saturn é famosamente pesado de emular na CPU, mas trivial para Zen 2. Sem relato BC-250. |
| **Dreamcast** | **Flycast** (standalone ou RetroArch) | ✅ Deveria rodar bem (geral ⚠) | Flycast é maduro e leve; confortável neste hardware. Não benchmarkado no chat. |

### Outros / arcade / computador

| Sistema | Melhor emulador Linux | Status na BC-250 | Notas |
|--------|--------------------|------------------|-------|
| **Arcade / MAME** | **MAME** (ou FinalBurn Neo) — RetroArch | ✅ Fácil para a maioria (geral ⚠) | FBNeo para os conjuntos comuns; MAME completo para tudo. Placas de arcade 3D/fim dos anos 90 pesadas ainda podem ser exigentes. |
| **Neo Geo** | **FinalBurn Neo** — RetroArch | ✅ Trivial (geral ⚠) | FBNeo é a escolha para Neo Geo / CPS. |
| **TurboGrafx-16 / PC Engine** | **Beetle PCE** — RetroArch | ✅ Trivial (geral ⚠) | Core Beetle/Mednafen PCE. |
| **Atari (2600/5200/7800/ST/…)** | Stella / RetroArch (Atari800, Hatari) | ✅ Trivial (geral ⚠) | Stella para o 2600; existem cores para o resto. |
| **DOS** | **DOSBox** (DOSBox-Staging / DOSBox-X) | ✅ Trivial (geral ⚠) | Ou o core DOSBox-Pure do RetroArch. |
| **ScummVM** | **ScummVM** (Linux nativo) | ✅ Trivial (geral ⚠) | Reimplementação de motor, não emulação — roda em qualquer lugar. |

> ✅ funciona / trivial · ⚠️ funciona com ressalvas · ❌ quebrado · **(chat)** = relato em primeira mão na BC-250 (citado) · **(geral ⚠)** = melhor emulador Linux + expectativa para esta classe de hardware, **não testado na BC-250**.

---

## Expectativas realistas — o que é fácil vs difícil

| Nível | Sistemas | Realidade numa BC-250 a 2000 MHz, resfriada |
|------|---------|--------------------------------------|
| **Confortável** | NES · SNES · GB/GBC/GBA · N64 · DS · 3DS · **PS1 · PS2 · PSP** · Genesis/SMS/Game Gear · Saturn · Dreamcast · Arcade/Neo Geo/PCE · Atari · DOS · ScummVM · **GameCube · Wii** | O ponto forte da placa. Retrô é trivial; o PSP está confirmado no chat em 4× res; PS2/GC/Wii estão bem dentro da classe deste hardware (expectativa geral — benchmarke seus próprios títulos exigentes). Use EmuDeck ou RetroArch e vá. |
| **Exigente / instável** | **Switch · PS3 · PS4** | Real, mas limitado pela CPU e por jogo. Switch (Eden) "bem e rápido" mas first-party pesado derruba frames; PS4 (shadPS4) ótimo para os títulos certos (Bloodborne); PS3 (RPCS3) funciona mas precisa de ajuste por jogo. Defina o governor no máximo primeiro. |
| **Mal / ainda não** | **Xbox 360** · Wii U · PS Vita | Xenia dá boot nos menus e depois fica com tela preta no gameplay (chat). Wii U (Cemu) e Vita (Vita3K) não estão confirmados na placa e são exigentes/experimentais em geral — verifique antes de depender deles. |
| **Uma experiência sem fricção, sem OC** | (qualquer sistema exigente) | Não. Sem o overclock a GPU faz underclock dentro dos emuladores e até o Switch engasga. Faça o OC + resfriamento primeiro. |

---

## Fontes

- Resumo de emuladores (Switch/Eden, PS3/RPCS3, PS4/shadPS4, Xbox360/Xenia) — https://t.me/c/2424231195/78988
- "O Eden é o mais decente" — https://t.me/c/2424231195/130842 · Eden instala e funciona — https://t.me/c/2424231195/98942 · Eden + Ryujinx do EmuDeck — https://t.me/c/2424231195/99039 · Ryujinx rodou — https://t.me/c/2424231195/51606 · TOTK no Eden derruba frames (NX Optimizer) — https://t.me/c/2424231195/124216 · A CPU é a parede, GPU subutilizada — https://t.me/c/2424231195/136712
- Estado inicial dos emuladores (Yuzu/Suyu travam, Ryujinx ok, Xenia baixo, RPCS3 erros) — https://t.me/c/2424231195/23577
- PS4/shadPS4 Bloodborne ("2 cliques") — https://t.me/c/2424231195/38704 · https://t.me/c/2424231195/38706 · Drive Club 100% — https://t.me/c/2424231195/82128
- PS3/RPCS3 Uncharted estável e jogável — https://t.me/c/2424231195/74644 · "funciona ótimo no RPCS3" — https://t.me/c/2424231195/53601 · vídeo-tutorial de emulação de PS3 — https://t.me/c/2424231195/13
- PSP/PPSSPP rodou (4× resolução, sem throttle) — https://t.me/c/2424231195/101579 · https://t.me/c/2424231195/103218 · https://t.me/c/2424231195/111096
- Wii U/Cemu perguntado no kernel 6.15+ — https://t.me/c/2424231195/68253 · cemu via AUR (paru) — https://t.me/c/2424231195/74138
- Dolphin pelo terminal — https://t.me/c/2424231195/19715 · "basicamente um PS Vita no talo" (hardware, não emulador) — https://t.me/c/2424231195/86140
- Governor travado em 1000 MHz no emulador; defina o máximo manualmente — https://t.me/c/2424231195/130879 · https://t.me/c/2424231195/130955 · patch Zelda 30→60 — https://t.me/c/2424231195/130887
- Sem imagem pré-configurada (tabu da comunidade) — https://t.me/c/2424231195/130845 · https://t.me/c/2424231195/130877
- Nintendo litiga contra emuladores de Switch / chaves difíceis de achar — https://t.me/c/2424231195/136649
- Batocera (distro de emulação) confirmado rodando na BC-250 — [thread r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- Especificação de hardware (6× Zen 2 @ ~3,5 GHz, RDNA2 24→40 CU, 16 GB GDDR6) — [elektricm/amd-bc250-docs](https://elektricm.github.io/amd-bc250-docs/hardware/specifications/)
- Enquadramento geral de capacidade de emulação (⚠ verifique; este guia de terceiros conta os núcleos errado como 8) — [guia BC-250 koukan.co.uk](https://www.koukan.co.uk/blog/amd-bc-250-guide)

> O overclock do qual estes resultados dependem está em [09-overclock-undervolt.md](09-overclock-undervolt.md); faça o mod de [04-cooling.md](04-cooling.md) antes de rodar 2000 MHz. Para o panorama mais amplo de jogos e a explicação do gargalo de CPU, veja [11-gaming.md](11-gaming.md); para instalar o SO em que os emuladores rodam, veja [06-linux.md](06-linux.md).
