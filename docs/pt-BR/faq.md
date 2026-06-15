> 🌐 Tradução da comunidade. A versão em inglês é a fonte da verdade e pode estar mais atualizada. Achou um erro? Abra uma issue: [../en/faq.md](../en/faq.md) · https://github.com/lildebil0/awesome-bc250/issues

# FAQ

> **TL;DR** — As perguntas que os iniciantes fazem na primeira semana, com respostas curtas e corretas e um link para a seção completa de cada uma. Se uma resposta parecer curta demais, é de propósito — a profundidade está na página do manual correspondente.

Isto é uma referência rápida. Para o caminho guiado "placa na caixa → rodando jogos", comece em [00-start-here.md](00-start-here.md).

---

## Hardware e o que eu comprei

**O que de fato é a BC-250?**
Uma APU derivada do PlayStation 5 (AMD **Cyan Skillfish** / Oberon) numa placa de mineração/servidor: **CPU Zen 2 de 6 núcleos/12 threads + GPU RDNA 2 de 24 CUs + 16 GB de GDDR6 soldada**. Não é uma placa de vídeo nem um PC normal — sem slot PCIe, sem ATX de 24 pinos, sem BIOS familiar. Veja [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**É plug-and-play? Eu deveria ter comprado?**
Não. Ela exige trabalho de driver, um mod de refrigeração e uma alimentação esquisita — é uma placa para quem gosta de mexer. Nas palavras de um veterano: ela "exige certas habilidades, esforço e cabeça". Se você quer zero dor de cabeça, devolva; se você curte projetos, é a máquina mais barata de Linux para jogos / IA local nessa faixa. Veja [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Posso adicionar mais RAM?**
Não. Os 16 GB de GDDR6 são soldados e compartilhados entre CPU e GPU; não há slots DIMM. Você só escolhe quanto do pool a GPU reserva (UMA), definido numa BIOS modificada. Veja [01-what-is-bc250.md](../en/01-what-is-bc250.md) e [08-bios.md](../en/08-bios.md).

**Tem botão de liga/desliga?**
Não. Ela liga no instante em que os 12 V chegam — o próprio interruptor da PSU é o seu botão de ligar. Veja [03-power-supply.md](../en/03-power-supply.md).

**Minha placa não faz POST / tela preta de cara — morta?**
Muitas vezes não. Muitas placas vêm precisando de um **reset de BIOS/CMOS** antes de fazer POST, e algumas chegam levemente **entortadas** pela fixação do dissipador — um dono resolveu um caso de não-boot calçando a placa reta com papel. Tente isso antes de declarar morta. Veja [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Dá para gravar/transmitir jogos usando a GPU?**
Não por hardware. O bloco de codificação de vídeo (VCN) está indisponível, então OBS/streaming recorre a um **codificador por software (CPU)** — funciona (as pessoas usam Sunshine/Moonlight), mas custa CPU e qualidade. Veja [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Quais as espessuras dos thermal pads para o mod do backplate?**
Relatado pela comunidade: **memória 2 mm, chipset 1,5 mm** ([src](https://t.me/c/2424231195/22442)). A GDDR6 traseira não tem sensor de temperatura, então você refrigera às cegas. Veja [04-cooling.md](../en/04-cooling.md).

## Alimentação

**De qual fonte eu preciso?**
Uma fonte **single-rail de 12 V** entregando **≥300 W** num conector **PCIe de 8 pinos (6+2)**. Três caminhos comuns: uma PSU ATX/SFX normal (basta plugar o cabo PCIe dela — o mais fácil), uma PSU de servidor HP Flex 500 W usada e barata, ou um brick industrial Mean Well. Veja [03-power-supply.md](../en/03-power-supply.md).

**Posso usar o 8 pinos de CPU/EPS da minha PSU?**
**Não — pode queimar a placa.** Os 8 pinos PCIe e CPU/EPS parecem quase idênticos, mas têm **polaridade invertida**. A placa não tem verificação de segurança; use o cabo **PCIe** e confirme com um multímetro se tiver dúvida. Veja [03-power-supply.md](../en/03-power-supply.md).

**Minha PSU antiga de 750 W tem watts de sobra — por que ela pena?**
Unidades antigas costumam **dividir os 12 V em vários rails fracos**, e nenhum rail sozinho cobre os ~235 W que a placa puxa. Prefira uma PSU moderna single-rail / DC-DC, ou uma com bastante folga. Veja [03-power-supply.md](../en/03-power-supply.md).

**Meu cabo de alimentação esquentou / soltou fumaça. Por quê?**
Quase certamente **cobre falso** — fio de aço ou alumínio revestido de cobre, que tem muitas vezes a resistência do cobre real e superaquece sob carga (o splitter PCIe pronto de um membro literalmente soltou fumaça) ([src](https://t.me/c/2424231195/97202)). Teste com um ímã: ele gruda no aço, não no cobre. Use cobre real, **16 AWG ou mais grosso**. Veja [03-power-supply.md](../en/03-power-supply.md).

## Refrigeração

**Por que ela superaquece / faz throttling de cara?**
O dissipador de fábrica é **passivo**, feito para o túnel de ar forçado de um rack de mineração. Numa mesa, sem fluxo de ar, ele acumula calor e faz throttling. O throttling começa por volta de **85 °C**, o reset forçado por volta de **90 °C**. Veja [04-cooling.md](../en/04-cooling.md).

**Qual é o conserto de refrigeração mais barato que realmente funciona?**
**Afinar as aletas densas de fábrica** (lixadeira orbital é o mais rápido) e parafusar uma **ventoinha de 120 mm de alta pressão estática** soprando através delas por um duto impresso. Resultados de referência: Noctua NF-P12 → ~73 °C no Furmark, 63–65 °C em jogos ([src](https://t.me/c/2424231195/42843)); a Arctic P12 Max mantém ~75 °C ([src](https://t.me/c/2424231195/58869)). Veja [04-cooling.md](../en/04-cooling.md).

**Por que uma ventoinha de alta pressão estática, e não uma "ventoinha de gabinete" de alto fluxo de ar?**
Aletas densas são uma carga de alta resistência — uma ventoinha de gabinete de alto fluxo simplesmente estola contra elas, enquanto uma de alta pressão estática (Noctua/Arctic P12) de fato empurra o ar *através*. Para aletas muito densas, use duas ventoinhas em **push-pull (em série)**, não lado a lado. Veja [04-cooling.md](../en/04-cooling.md).

**Como sei se minha refrigeração é suficiente?**
Estresse a **GPU e a CPU juntas** (elas compartilham um dissipador) — Furmark VK mais uma carga de CPU — **sob o seu overclock** (2000 MHz, não o padrão), e mantenha a carga abaixo de ~85 °C. Há um procedimento de teste fixado. Veja [04-cooling.md](../en/04-cooling.md).

## Linux

**Qual distro devo instalar?**
Para "só jogar", instale o **Bazzite** e faça rebase para a imagem **`bazzite-bc250`** — as correções de GPU já vêm prontas. Para aprender a máquina: **Fedora** (COPR + script de configuração) ou **CachyOS/EndeavourOS** (Arch). Veja [06-linux.md](../en/06-linux.md).

**Instalei o Linux e tudo está lento / FPS de um dígito. Por quê?**
A GPU não está sendo acelerada — você está em renderização por software (LLVMpipe). Você precisa de um **Mesa novo (25.1+)**, do **symlink de firmware `cyan_skillfish`** (ou de um pacote corrigido) e dos parâmetros de kernel certos. Confirme com `vulkaninfo | grep deviceName` (ele *não* deve dizer `llvmpipe`). Veja [06-linux.md](../en/06-linux.md).

**Tela preta depois de uma atualização de kernel — como conserto?**
Na maioria das distros, o conserto é o symlink de firmware para o amdgpu carregar:
```bash
sudo ln -s /lib/firmware/amdgpu/navi10_gpu_info.bin.zst \
           /lib/firmware/amdgpu/cyan_skillfish_gpu_info.bin.zst
```
Isso sobrevive a atualizações de kernel (mas **não** no Bazzite, e uma atualização de firmware/amdgpu pode apagá-lo) ([src](https://t.me/c/2424231195/98882)). Caso contrário, dê boot num kernel mais antigo/LTS e fixe a versão do ruim. Veja [06-linux.md](../en/06-linux.md).

**Devo instalar apps como Flatpaks?**
Evite-os para qualquer coisa gráfica. Os Flatpaks empacotam o **próprio Mesa**, sobrescrevendo o patcheado da placa, então rodam **sem aceleração por hardware**. O PortProton, por exemplo, precisa ser instalado pelo terminal, não como Flatpak ([src](https://t.me/c/2424231195/17949), [src](https://t.me/c/2424231195/47092)). Veja [06-linux.md](../en/06-linux.md).

**Minha CPU parece fraca — algum ganho rápido?**
Dois ajustes de kernel: **`mitigations=off`** (desativa as mitigações de vulnerabilidades da CPU) ([src](https://t.me/c/2424231195/23359)) e **`nosmt=force`** (desativa o SMT — +15–25 % de FPS em jogos com poucas threads, mas prejudica multitarefa pesada como OBS em bitrate alto) ([src](https://t.me/c/2424231195/61332)). Ambos são trocas de segurança/throughput. Veja [06-linux.md](../en/06-linux.md).

**GNOME/KDE no Wayland está com glitches — o que faço?**
Problema conhecido. Membros relatam que sessões Wayland (geralmente GNOME/KDE) se comportam mal nesta placa; **use a sessão X11** no lugar ([src](https://t.me/c/2424231195/19623)). Veja [06-linux.md](../en/06-linux.md).

**Minha RAM enche rápido — dá para ter mais swap?**
Sim, aumente o swap **zRAM** (swap em RAM comprimida) — a receita da comunidade sobe para 32 GB e o torna persistente em `/etc/systemd/zram-generator.conf` ([src](https://t.me/c/2424231195/38703)). Não adiciona memória real, mas absorve picos. Veja [06-linux.md](../en/06-linux.md).

**Uma atualização de kernel quebrou as coisas — como reverto?**
O sistema mantém os últimos kernels. No Fedora, liste-os com `grubby` e `grubby --set-default /boot/vmlinuz-…`, depois reinicie ([src](https://t.me/c/2424231195/39393)). Na dúvida, rode um kernel **LTS**. Veja [06-linux.md](../en/06-linux.md).

## Windows

**Já existe um driver para Windows?**
Não — no início de 2026 **não há driver de GPU funcional para Windows**. O Windows dá boot, mas a GPU fica no **Código 43** sem 3D. Existem dois esforços de engenharia reversa do zero (Keshas-dev, ZEROAESQUERDA), mas estão no estágio de "será que a GPU inicializa", não jogando. Veja [07-windows.md](../en/07-windows.md).

**Não dá só para forçar a instalação de um driver da RX 6700 / W5700?**
Não. Todo `.inf` oficial (incluindo o da W5700 que o Windows oferece como "compatível") instala e então trava no Código 43 — o device ID `1002:13FE` está soldado à APU. Essa é a primeira ideia de todo iniciante e não tem como funcionar. Veja [07-windows.md](../en/07-windows.md).

**E uma VM Windows com GPU passthrough?**
Não funciona — o passthrough por IOMMU está quebrado nesta placa, é uma APU (não uma placa discreta limpa para repassar), e o chip é mal detectado de qualquer jeito. Veja [07-windows.md](../en/07-windows.md).

**Vi um "driver NVIDIA para BC-250" / um `…bc250.exe` — é real?**
Não. O "driver NVIDIA" foi uma **piada de Primeiro de Abril**, e um instalador Adrenalin com "bc250" colado no nome do arquivo continua sendo só um instalador Adrenalin normal. Só execute binários dos repositórios GitHub nomeados, e leia o código — "drivers" falsos já foram malware. Veja [07-windows.md](../en/07-windows.md).

## BIOS e recuperação

**Devo fazer flash de uma BIOS modificada?**
Só se você quiser desbloquear overclock/timings/VRAM da iGPU **e** tiver hardware de recuperação pronto. Uma configuração errada pode **brickar a placa de vez**, e nesta placa um **clear de CMOS nem sempre recupera**. Use o mod atual baseado no 5.00, confira o SHA-256, e nunca desative o Integrated Graphics (é sua única saída de vídeo). Veja [08-bios.md](../en/08-bios.md).

**Eu brickei — dá para des-brickar?**
Geralmente sim, mas só com hardware: um **programador SPI classe CH341A** ligado ao **header J4004** da placa (o clip SOIC *não* funciona aqui) para regravar o chip de 16 MB. Cuidado com a armadilha da linha de dados de 3,3 V do CH341A. Veja [08-bios.md](../en/08-bios.md).

**Mudei a divisão de VRAM, mas o SO ainda mostra o valor antigo.**
**Limpe o CMOS** após flashar/alterar a UMA — remova a CR2032 por 60+ s ou curto-circuite o jumper de CMOS. Algumas configurações (em especial VRAM/UMA) só se aplicam depois disso ([src](https://t.me/c/2424231195/97290)). Veja [08-bios.md](../en/08-bios.md).

## Overclock e undervolt

**Como faço overclock? Vale a pena?**
Rode um **governor** (a maioria dos builds usa o **oberon-governor**) e suba a GPU em direção a **2000 MHz** (~+30 % de FPS *quando GPU-bound*). O mais novo `bc250_smu_oc` também faz overclock da CPU (~4 GHz @ 1275 mV). **Refrigere a placa primeiro** — OC acima de ~90 °C reseta. Veja [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**O que é o desbloqueio de 40 CUs?**
O die tem fisicamente **40 CUs**, mas o firmware deixa só **24** ativos. Um amdgpu patcheado + `amdgpu.bc250_cc_write_mode=3` reativa todos os 40 — um ganho de GPU maior que os clocks (uma rodada do Superposition foi de 4647 → 6863). Exige recompilar o módulo do kernel e é exclusivo do Linux. Veja [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**Que voltagem devo definir?**
Cada chip é diferente (loteria do silício). Pontos comuns estáveis em jogos: **2000 MHz ≈ 955 mV** (~75 °C). Valide em **jogos de verdade + alt-tab/menus**, não só no Furmark, que esconde instabilidade. Limite rígido da CPU: **nunca exceda 1,325 V de Vid**. Veja [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**Um undervolt agressivo demais é perigoso?**
Não — na pior das hipóteses a placa cai ou desativa o slot M.2, e isso se resolve em alguns segundos porque o OC não é salvo na BIOS. *Aumentar* a voltagem da CPU é a direção perigosa. Veja [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

## Vídeo, WiFi e Bluetooth

**Sem imagem pelo HDMI?**
A placa gera saída por **DisplayPort**; para HDMI/TV use um **adaptador ou cabo DP→HDMI** (um bom também funciona na BIOS e faz 4K) ([src](https://t.me/c/2424231195/24107)). Prefira um **cabo DP→HDMI** de verdade a um adaptador passivo barato — um adaptador ruim causou telas pretas para um membro ([src](https://t.me/c/2424231195/96416)).

**O áudio por DisplayPort está distorcido.**
Problema conhecido no Linux. O conserto simples é sair por um adaptador **DP→HDMI**, que leva áudio limpo ([src](https://t.me/c/2424231195/17953)). Veja [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Tem WiFi/Bluetooth?**
Sem wireless integrado — você precisa de um **dongle USB**, escolhido pelo **chipset, não pela marca**. O mais bem documentado é um stick **aic8800d80**; sticks Realtek RTL8821/8822 baratos funcionam com `lwfinger/rtw88`, mas caem sob carga. Para configurar, um adaptador USB-Ethernet com fio contorna o problema todo. Veja [10-wifi-bt.md](../en/10-wifi-bt.md).

**Meu dongle WiFi fica desconectando.**
Sintoma clássico de Realtek na BC-250: instale o driver out-of-tree certo (rtw88 / rtl8831), tente uma porta USB traseira e reinicie com `usbreset` em vez de desplugar. Se a confiabilidade importa mais que o preço, troque para o aic8800d80 ou um stick Digma confirmado. Veja [10-wifi-bt.md](../en/10-wifi-bt.md).

## Jogos e IA

**Quanto de FPS posso esperar?**
Num OC real de **2000 MHz**: AAA modernos a **40–60 FPS**, jogos mais leves/antigos passando de 60. Melhor em **1080p–1440p** com FSR. A placa costuma ser **CPU-bound**, então a resolução muitas vezes é "de graça", mas jogos pesados em física/mal threadeados engasgam de qualquer forma. Veja [11-gaming.md](../en/11-gaming.md).

**Quais jogos rodam melhor?**
**Ports first-party do PlayStation** (God of War, Horizon, The Last of Us, Spider-Man, Ghost of Tsushima) — eles se apoiam na GPU e são bem otimizados. Emulação: Switch (Eden) e PS4 (shadPS4) estão sólidos; Xbox 360 (Xenia) não. Veja [11-gaming.md](../en/11-gaming.md).

**Por que minha GPU está em ~40 % de carga mas o FPS está baixo?**
Você está **CPU-bound** — a Zen 2 de 6 núcleos é o gargalo, não a GPU. Upscaling não vai elevar muito o FPS nesse caso; tente `nosmt=force`/`mitigations=off` e aceite que alguns títulos são limitados pela CPU. Veja [11-gaming.md](../en/11-gaming.md).

**Dá para rodar LLMs locais / IA nela?**
Sim — os 16 GB de GDDR6 acomodam modelos de tamanho médio via `llama.cpp`/Jan no backend **Vulkan**; configure a BIOS para alocar ~12 GB à GPU primeiro. Veja [12-ai-llm.md](../en/12-ai-llm.md).

## Compra

**Qual é um preço justo, e onde compro?**
Preços e fontes mudam rápido e variam por região (eBay, AliExpress, Ozon/Avito na CEI) — relatos recentes giram em torno de pouco mais de US$ 100 até ~13 mil ₽. Veja [02-buying.md](../en/02-buying.md).

**Quais os riscos de comprar uma?**
É hardware usado de mineração/servidor: placas podem chegar precisando de reset de BIOS, levemente entortadas, ou ocasionalmente com defeito, e não há suporte do fabricante — a comunidade é o seu suporte. Reserve tempo, não só dinheiro. Veja [01-what-is-bc250.md](../en/01-what-is-bc250.md) e [02-buying.md](../en/02-buying.md).

**Dá para rodar macOS nela?**
Não vá por aí. A CPU até pode dar boot, mas a **GPU nunca vai acelerar** (não há um gêmeo suportado para spoofar, e nenhuma iGPU de APU da AMD jamais funcionou no macOS). Use Linux. Veja [13-macos.md](../en/13-macos.md).

---

## Fontes

- Chat de origem: *comunidade AMD BC-250* (Telegram). A maioria das respostas resume uma seção completa do manual — siga o link da seção para as citações de origem.
- Espessuras de thermal pad — https://t.me/c/2424231195/22442
- Arctic P12 Max ~75 °C — https://t.me/c/2424231195/58869 · Noctua P12 ~73 °C — https://t.me/c/2424231195/42843
- Conserto do symlink de firmware para tela preta após kernel (não Bazzite) — https://t.me/c/2424231195/98882
- Flatpak quebra a aceleração por hardware — https://t.me/c/2424231195/17949 · PortProton pelo terminal — https://t.me/c/2424231195/47092
- `mitigations=off` para CPU fraca — https://t.me/c/2424231195/23359 · ganho de FPS com `nosmt=force` — https://t.me/c/2424231195/61332
- Glitches no Wayland, use X11 — https://t.me/c/2424231195/19623
- Aumento do swap zRAM — https://t.me/c/2424231195/38703 · seleção/rollback de kernel — https://t.me/c/2424231195/39393
- Splitter de alimentação superaqueceu/soltou fumaça (cobre falso) — https://t.me/c/2424231195/97202
- Clear de CMOS necessário após mudança de VRAM — https://t.me/c/2424231195/97290
- Adaptador DP→HDMI (4K/TV, funciona na BIOS) — https://t.me/c/2424231195/24107 · adaptador ruim → tela preta — https://t.me/c/2424231195/96416 · conserto da distorção de áudio DP — https://t.me/c/2424231195/17953

> Este FAQ é um mapa, não o território — cada resposta aponta para a seção que carrega o detalhe e as fontes primárias. Correções são bem-vindas via PR (veja [CONTRIBUTING.md](../../CONTRIBUTING.md)).
