> 🌐 Tradução da comunidade. A versão em inglês é a fonte da verdade e pode estar mais atualizada. Achou um erro? Abra uma issue: [../en/05-case.md](../en/05-case.md) · https://github.com/lildebil0/awesome-bc250/issues

# Gabinetes e impressão 3D

> **TL;DR** — A BC-250 vem como uma placa nua, então quase todo mundo imprime um gabinete. Não existe um único gabinete "certo" — a comunidade já produziu **dezenas** de designs, desde um **sleeve** de refrigeração mínimo que apenas encaixa duas metades em volta da placa, até **caixas estilo console** completas com alça, tela frontal e RGB. O que quer que você imprima, o gabinete tem que fazer uma coisa que a placa de fábrica não consegue: **vedar uma ventoinha de 120 mm contra as aletas do dissipador** para que o ar passe *através* delas (veja [Refrigeração](04-cooling.md)). Esta página é o catálogo: nome → STL → ventoinhas → onde baixar. **Atenção à PSU**: a maioria dos gabinetes é projetada em torno de uma fonte específica (LOP, Flex/SFX ATX ou um brick de servidor HP) — escolha o gabinete que combina com a [PSU](03-power-supply.md) que você tem.

Um "gabinete" aqui vai desde uma impressão de 200 g que leva 20 minutos de trabalho até um console de várias partes que levou semanas para seu autor. Comece simples; você sempre pode reimprimir.

> **Novato e na dúvida? Imprima o gabinete [onemorecap sleeve/shell](#tier-1--cooling-sleeve-mínimo-comece-aqui) — mínimo, nada para cortar, acomoda uma única ventoinha de 120 mm — e pare por aí.** O catálogo abaixo é extenso; você não precisa lê-lo para começar.

> **Quer a lista completa?** elektricM mantém um **catálogo pesquisável e filtrável de ~143 designs** (filtre por família de PSU, disponibilidade, plataforma) — muito mais do que o conjunto curado abaixo, incluindo muitos builds só-do-Discord e em andamento. Navegue por ele em **[elektricM — Cases & Enclosures](https://elektricm.github.io/amd-bc250-docs/community/cases/)**. As escolhas abaixo são as nomeadas, de download público, que valem a pena como ponto de partida.

---

## Builds da comunidade

Uma amostra do que as pessoas realmente imprimiram — desde um shell aberto e nu até consoles totalmente temáticos. Mesma placa, resultados radicalmente diferentes.

<p align="center">
  <img src="../../assets/img/case-shell.jpg" alt="onemorecap Shell Case: placa lateral aberta, alça, aletas de cobre expostas, ventoinha Arctic de 120 mm" width="60%"><br>
  <sub>Build por Дима Ткач · <a href="https://t.me/c/2424231195/22771">fonte</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-frame.jpg" alt="Frame aberto de alumínio branco com as entranhas à mostra: dois dissipadores, ventoinha Arctic branca central, PSU Flex" width="60%"><br>
  <sub>Build por Сергей · <a href="https://t.me/c/2424231195/87420">fonte</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-orange.jpg" alt="Console fechado laranja-e-branco com painel lateral de malha perfurada e uma alça moldada" width="60%"><br>
  <sub>Build por Alexander Susl · <a href="https://t.me/c/2424231195/122822">fonte</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-arasaka.jpg" alt="Console com tema cyberpunk ARASAKA: face branca, grade de ventoinha cromada, detalhes e pés verdes" width="60%"><br>
  <sub>Build por Maxim Perelygin · <a href="https://t.me/c/2424231195/98072">fonte</a></sub>
</p>

---

## Como escolher

Três perguntas decidem qual gabinete combina com você:

1. **Qual PSU você está usando?** ([Fonte de alimentação](03-power-supply.md)) — Uma Meanwell **LOP-300** é pequena e fica *dentro* da maioria dos gabinetes. Uma PSU **Flex/SFX ATX** é maior e precisa de um gabinete com baia dedicada. Um **brick HP/servidor** recuperado precisa dos gabinetes "v3/v4 server PSU". Esse é o maior filtro de todos.
2. **Quais ventoinhas você vai usar?** Quase todo gabinete é construído em torno de **uma ventoinha de 120 mm** sobre o dissipador. Builds maiores adicionam uma **segunda de 120 mm** no backplate (para refrigerar a memória GDDR6, que [não tem sensor de temperatura](04-cooling.md)) ou alimentar a PSU. Alguns usam ventoinhas de **140 mm** ou **slim** onde a altura é apertada.
3. **Você já afinou as aletas?** A maioria dos gabinetes assume que você já **limou/lixou as aletas do dissipador de fábrica** para abri-las (veja [Refrigeração, Caminho A](04-cooling.md)). Um gabinete sozinho não conserta o cooler de fábrica — ele apenas segura a ventoinha no lugar certo.

> **Jargão, uma vez:** **STL** = o arquivo de malha padrão de impressão 3D que você carrega num slicer. **STEP / 3MF** = formatos CAD editáveis (use estes se quiser modificar o design). **Shroud / sleeve / adaptador** = um funil impresso que faz a ventoinha vedar contra as aletas em vez de vazar ar ao redor delas. **Flex / SFX ATX** = fontes de PC de fator de forma pequeno. **LOP** = a PSU industrial Meanwell LOP-300 que a comunidade prefere.

> **💡 Imprima um furo de acesso ao jumper de limpar o CMOS.** Toda vez que você muda a divisão VRAM/UMA tem que **limpar o CMOS** (veja [BIOS](08-bios.md)), então projetar um gabinete vedado que enterra o jumper significa abri-lo repetidamente. Deixe um **furo de acesso de ⌀10 mm** sobre o jumper de limpar o CMOS em qualquer design fechado — ou, melhor, leve um pequeno **interruptor de 3 posições** até o painel para conseguir resetar sem ferramentas. ([4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980))

---

## Tier 1 — "Cooling sleeve" mínimo (comece aqui)

A coisa menor e mais rápida que você pode imprimir. **Não é realmente um gabinete** — é uma jaqueta impressa que se encaixa na placa em duas metades por fricção apertada, segura uma ventoinha de 120 mm contra o dissipador e duta o ar. **Nada para cortar, sem parafusos na placa.** Дима Ткач (um dos primeiros builders do projeto) descreve duas variantes — uma compacta e uma de "visual mais divertido" — ambas atingindo **~70 °C a 150 W** de carga, ~210 g / ~170 g de plástico cada, com a PSU permanecendo fria no fluxo de ar turbulento ([src](https://t.me/c/2424231195/10743)). O veredito dele: *"isto não é realmente um gabinete, mais um sleeve de refrigeração, mas nada precisa ser cortado, tudo se segura por encaixe bem apertado, as metades são colocadas por lados opostos."*

- **Arquivos:** `BC-250-FanSleeves.3mf` ([src](https://t.me/c/2424231195/10766)), CAD da placa `bc-250-body.step` ([src](https://t.me/c/2424231195/18266))
- **Repositório de origem:** [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) — o design mínimo mais recomendado, "verificado, impresso, confirmado funcionando", no chat ([src](https://t.me/c/2424231195/18260))
- **Ventoinha:** 1× 120 mm
- **PSU:** qualquer uma — há um furo/recorte para o cabo de alimentação, então você pode usar uma LOP *ou* uma fonte externa ([src](https://t.me/c/2424231195/22950))

---

## Tier 2 — Frame aberto / "shell" (placa em exposição)

Meio-gabinetes que envolvem a placa de um lado e deixam o dissipador visível. Leves em plástico, fáceis de montar, bom fluxo de ar.

### onemorecap "Shell Case" — o build de referência

O post de gabinete com mais reações de valor no chat (❤33): uma placa lateral plana sobre a placa gravada com **"BC-250"** e o padrão da grade CU, uma **alça** moldada no topo, as **aletas afinadas do dissipador expostas** no meio, e uma ventoinha **Arctic** de 120 mm em seu próprio shroud aparafusada na extremidade direita. Marcado *"BC-250 SHELL CASE BY ONEMORECAP / ASRock × CMG"* ([src](https://t.me/c/2424231195/22771)). O conjunto correspondente de STLs foi postado no chat em um lote ([src](https://t.me/c/2424231195/81672)) e o autor confirmou que os modelos são gratuitos no Printables e no MakerWorld ([src](https://t.me/c/2424231195/24505)).

- **Arquivos (lote do chat):** `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl`, mais os shrouds de ventoinha abaixo ([src](https://t.me/c/2424231195/81680))
- **Fonte:** [GitHub onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case)
- **Ventoinha:** 1× ou 2× 120 mm (via shroud), ou 1× 140 mm
- **PSU:** o painel traseiro `Shell_Back_FLEX_ATX` é recortado para uma PSU **Flex ATX**

### Frame aberto de acrílico (Владислав)

Um frame aberto de **alumínio-e-acrílico**: duas placas de extremidade metálicas com painéis laterais transparentes, a placa montada na vertical, uma única ventoinha **Arctic de 120 mm** soprando direto através do dissipador afinado no centro, e uma PSU Flex/SFX na baia inferior ([src](https://t.me/c/2424231195/114651)). Este é o design depois cruzado no [r/BC250Gaming como o "acrylic case"](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/). Os suportes impressos são as peças que você reproduz; o frame em si é cortado a laser/de prateleira.

- **Ventoinha:** 1× 120 mm (centro) — espaço para adicionar uma ventoinha de backplate
- **PSU:** Flex / SFX ATX na baia inferior

---

## Tier 3 — Caixas estilo console (totalmente fechadas)

Gabinetes fechados que parecem um console de videogame ou um pequeno NAS. Mais plástico e mais tempo de impressão, mas um produto acabado com alça, botão de liga/desliga, painéis ventilados e às vezes uma tela.

### "Просто лучший корпус" (Jack Fisher × B1zon) — favorito da comunidade

Postado sob a tag curada **#BC250body** como *"simplesmente o melhor gabinete"*, este é um console totalmente acabado com uma lista de materiais publicada: PSU, ventoinhas, conector, pés de borracha, botão de liga/desliga, parafusos + insertos roscados, um splitter PWM de ventoinha, um adesivo "Cyberpunk" e um pente para endireitar o dissipador. Algumas peças estão fora de produção e têm substitutos ([src](https://t.me/c/2424231195/79990)). Crédito de design para B1zon, montagem por Jack Fisher.

- **Arquivos:** `BC250 korpus исправленный.rar` ("gabinete BC250, corrigido") ([src](https://t.me/c/2424231195/79989))
- **Ventoinha:** 120 mm (frontal) + splitter PWM para uma segunda ventoinha
- **PSU:** interna (classe LOP)

### Frente com "GPU" tripla (Гослинг)

Uma caixa console cujo painel frontal é um **shroud falso de placa de vídeo** — três recortes circulares de ventoinha em fila com RGB, então a máquina parece uma GPU dedicada. Mostrado rodando **Bazzite 42** na BC-250 ([src](https://t.me/c/2424231195/66616)). As três aberturas são cosméticas sobre a única ventoinha funcional mais a entrada de ar.

### Console branco com painel labiríntico (Jhonatan)

Uma caixa branca e alta com um marcante **painel lateral ventilado com padrão de labirinto/circuito**, um botão de liga/desliga metálico iluminado (verde) e uma grade de entrada de altura total na face frontal — uma das estéticas mais bem-acabadas do chat ([src](https://t.me/c/2424231195/121274)).

### Mini-torre com malha quadriculada (Joglik)

Uma mini-torre vertical cinza com **malha de grade quadrada** densa na lateral e no topo, um entalhe/alça na borda superior, e uma passagem redonda de cabos na parte inferior traseira. Visual industrial limpo ([src](https://t.me/c/2424231195/126525)).

### Caixa hi-fi com janela oval (a m)

Um gabinete retangular branco estilizado como uma frente de hi-fi/micro-ondas: uma grande **janela de malha em formato de estádio** com a ventoinha visível atrás de uma malha circular, ladeada por duas fendas verticais de malha ([src](https://t.me/c/2424231195/52955)). A iteração posterior do autor caminha para "plástico de verdade" em vez de PVC expandido e adiciona alimentação externa série XT e RGB ([src](https://t.me/c/2424231195/128048)).

### Console compacto (Volodymyr Spyrydonov, "v15")

Uma pequena caixa console preto-e-prata com entrada lateral de malha e uma frente escura trazendo um emblema estilo cyberpunk e uma fita RGB, mostrada ao lado de uma TV como uma máquina de sala de estar ([src](https://t.me/c/2424231195/135995)). Parte de uma longa linha de revisões (imagens-fonte das v15/v19/v20 foram compartilhadas no início).

### BC250 Vented Edition (MaelremremDotXYZ)

Um console **FlexATX** minimalista rodando **fins-open**, mantendo **~67 °C @ 2145 MHz / 1.1 V**, com um kill-switch da PSU na traseira. [MakerWorld 2899020](https://makerworld.com/en/models/2899020).

### Stellar 250 (isaacalvex)

Um console completo e autossuficiente com um **guia de build** completo: armazenamento interno, **WiFi 6** e um **display de temperatura ESP32**. [GitHub isaacalvex/AMD-BC-250-Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide).

### Simple Case for the ASRock AMD BC-250

Um gabinete console nomeado e de download público, publicado pelo autor do [walkthrough de build em ucraniano no YouTube](https://youtu.be/p5Zd86vFe8w) — uma caixa fechada direta para quem quer uma impressão acabada sem a complexidade de várias partes. [MakerWorld 2870270](https://makerworld.com/en/models/2870270).

---

## Tier 4 — Builds grandes: PSU ATX, líquido AIO, telas

Para quem quer uma PSU de tamanho completo, refrigeração líquida ou um display integrado.

### Família NexGen3D "DIY Steam Machine"

O **projeto 3D mais apontado** na comunidade (repostado 7×). Uma família de gabinetes console no Printables, incluindo uma variante **"Pro" com refrigeração líquida** e uma edição **"Redux"** que acomoda uma **tela Pi de 1080×480 interna** na frente ([build no Reddit](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)). Há um modelo dedicado de **suporte AIO** para colocar um water cooler all-in-one de 120 mm sobre o die.

- [Printables 1499974 — DIY Steam Machine (base)](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite)
- [Printables 1614131 — Pro Liquid-Cooled](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) · [Printables 1649679 — Redux](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) · [Printables 1554003 — AIO mount](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250)
- **Ventoinha/refrigeração:** 120 mm a ar **ou** AIO de 120 mm dependendo da variante
- **PSU:** versão LOP e versões ATX documentadas

### Build de referência "Steam Machine Pro" com refrigeração líquida (Old Lamer)

Um build high-end, totalmente refrigerado a líquido, documentado de ponta a ponta em vídeo — útil como lista de compras de peças se você for all-in numa máquina AIO ([Old Lamer](https://youtu.be/afYhUQFa-AY)). A BOM publicada:

- **AIO:** TEUCER AF 240 (all-in-one de 240 mm) sobre o die
- **PSU:** Mean Well **LOP-600-12** (ou **LOP-500-12** como a opção menor) — veja [Fonte de alimentação](03-power-supply.md)
- **Ventoinhas:** 2× Arctic **P12 Pro** + 1× Arctic **P8**
- **Liga/desliga remoto:** uma **placa de relé ESP32** para ligar/desligar a máquina remotamente
- **Software:** **OpenLinkHub** / **Commander Duo** no Linux para controlar a bomba e as ventoinhas do AIO

---

### Steam Cube — gabinete vertical paramétrico, water-cooled (em desenvolvimento)

Um gabinete vertical **totalmente paramétrico** no fator de forma do **Xbox Series X**, projetado **com water cooling em primeiro lugar**, com um lado frio intercambiável: um water block, um **Thermalright AXP90-X47 Full-Copper** ou uma única **Arctic P12 Max** se aparafusam todos no mesmo suporte. Ele surgiu do esboço **"Xbox Serie X BC-250 Edition" de Sol Diego** ([Printables 1748271](https://www.printables.com/model/1748271)) e do preciso **modelo de placa torassk** ([Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)), depois redesenhado como código (build123d) para que cada dimensão seja uma variável que você reajusta, não uma malha fixa.

**Envelope e o raciocínio por trás dele** (derivado do tamanho verificado da placa e das metas térmicas em [Refrigeração](04-cooling.md)):

- **Torre vertical de ~180 × 212 × 380 mm** — alta o suficiente para colocar um **radiador de 240 mm na vertical** ao lado da placa (um conjunto de radiador de ~277 mm cabe dentro dos 380 mm de altura).
- **Fluxo de ar por chaminé** — entrada de 120 mm embaixo, exaustão de 120 mm em cima, para que o calor suba direto para fora.
- **Backplate ativo é obrigatório, não opcional** — o lado da GDDR6 / VRM [não tem sensor de temperatura](04-cooling.md), então o design trata a refrigeração traseira como parte obrigatória.
- **Metas de refrigeração** (objetivos de projeto, **não** resultados medidos): die com água < 60 °C sustentados a 40 CU; AXP90 < 75 °C @ 2000 MHz; base P12 ~73–78 °C.

> ⚠️ **Status: conceito de design, não uma impressão verificada.** O CAD atual é um **modelo espacial paramétrico** — as peças estão corretamente dimensionadas, orientadas e posicionadas, e ele exporta 8 STL + um STEP — mas **não** foi impresso, montado ou testado termicamente, e o water block é posicionado a partir da caixa delimitadora da placa em vez de uma posição de die medida. Trate-o como um **CAD inicial para forkar**, não um gabinete acabado; a validação real de impressão / encaixe / térmica é o próximo passo em aberto. As metas acima são objetivos, não benchmarks.

---

### Gabinetes com PSU ATX (Victor L., V\ad, server-PSU v3/v4)

Para uma fonte **ATX** completa: um gabinete construído em torno de uma PSU ATX completa ([src](https://t.me/c/2424231195/119293), a caminho do MakerWorld), um protótipo Blender anterior de iniciante ([src](https://t.me/c/2424231195/105570)), e uma linha publicada de **PSU HP/servidor** no Printables/MakerWorld com provisões para HDD e hub USB.

- [Printables 1580750 — Case v3, HP server PSU + HDD + USB hub](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) · [MakerWorld 2481620 — Case v4, FlexATX & HP-server PSU](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) · [Printables 1550729 — ATX-PSU Bazzite Box](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box)

### Builds Twin-120 (refrigeração de memória + PSU)

Uma placa de montagem redesenhada carregando **duas ventoinhas de 120 mm** — uma dutada para o backplate (memória) como o designer da placa pretendia, a segunda alimentando a PSU. Com ventoinhas Lian Li P28 na frente + um Thermalright C12015, o autor mantém **2200 MHz a 80 °C em jogos**, onde uma única ventoinha frontal não bastava ([src](https://t.me/c/2424231195/120606)). Um **`Twin_120mm_Fan_Shroud.stl`** independente é compartilhado para isso ([src](https://t.me/c/2424231195/121684)).

### The Lanboy — arcade portátil / lancheira

Um build de arcade-lancheira portátil: ele aciona um **painel eDP de notebook de 16″ (1920×1200 @ 165 Hz)** através de uma **placa adaptadora eDisplayPort** ([AliExpress](https://www.aliexpress.com/item/1005006351527252.html)), 2× alto-falantes de 2″ num amp USB, tudo alimentado por um único **breakout ATX de 12 V**. [Printables 1746364](https://www.printables.com/model/1746364). O truque do adaptador eDP é reutilizável para **qualquer** build com painel de notebook.

### BC250-HUD (Bloodyly) — tela de status interna

Um app de tela de status em Qt5/C++ **para um Raspberry Pi Zero 2** (usado em builds como o NexGen3D Redux): **60 FPS via USB gadget mode**, lê FPS/frametime do MangoHud, detecta a tensão da ventoinha para escurecer a tela em modo de espera, e **inclui o patch de kernel vc4** que de outra forma trava o Pi. Tela: **IPS de 8.8″ 1920×480** (Hannstar HSD088IPW1-A). [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD).

---

## Adaptadores e suportes (não são gabinetes completos)

Pequenas peças impressas que resolvem um problema — geralmente montar um cooler ou ventoinha na placa.

- **Shrouds de ventoinha** (vedam uma ventoinha às aletas): `Fan_Shroud_Single_120mm.stl`, `Fan_Shroud_Dual_120mm.stl`, `Fan_Shroud_Single_120mm_Restricted.stl`, `Fan_Shroud_Single_140mm.stl` ([src](https://t.me/c/2424231195/81673)), `Twin_120mm_Fan_Shroud.stl` ([src](https://t.me/c/2424231195/121684)). Também catalogados em [Refrigeração](04-cooling.md).
- **Suportes de ventoinha de backplate / memória:** `Backplate.stl` + `backplane-top-fixed.stl` ([src](https://t.me/c/2424231195/133049)); `bottom_fan_mount.stl`, `top_fan_mount.stl`, `Front-Mount.stl`, `Back-Mount.stl` ([src](https://t.me/c/2424231195/131189))
- **Adaptadores de cooler AM4** (aparafusam um cooler de CPU padrão no die): `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` ([src](https://t.me/c/2424231195/9949)). Veja também [Printables 1042228 — BC250→AMD CPU-cooler mount](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount).
- **Suporte ITX genérico** (majzok): imprime em duas partes que se encaixam num frame — parafuse a BC-250 nele, depois parafuse o frame em **qualquer gabinete com furos padrão de placa-mãe ITX** (testado num DeepCool CH170 PLUS). Resolve o problema de "não existe suporte ITX genérico". Nenhum link canônico do Printables registrado — pesquise no Printables/MakerWorld por **"BC-250 ITX Mount"**.
- **Adaptador Thermalright AXP90-X53 / AXP120-X67** (cooler low-profile no die): um suporte impresso que precisa de roscas M3, com variantes de espessura por cooler/pressão de CPU — [Printables 1694793](https://www.printables.com/model/1694793). Também em [Refrigeração](04-cooling.md).
- **Adaptador de ventoinha de 120 mm:** `BC250_FanAdapter_120mm.step` ([src](https://t.me/c/2424231195/83135)), `cooler adapter v3.0 (1).stl` ([src](https://t.me/c/2424231195/111091))
- **Modelos precisos da placa** (projete seu próprio gabinete contra estes): [Printables 1341336 — accurate BC-250 board](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) ([src](https://t.me/c/2424231195/55496)), [Printables 1103626 — AMD BC250 board](https://www.printables.com/model/1103626-amd-bc250-board)

---

## Tabela de catálogo

Arquivos marcados *(chat)* estão espelhados em `assets/stl/`; todo o resto baixa da página vinculada do Printables / MakerWorld / GitHub.

| Caixa / peça | Tipo | Arquivos STL / fonte | Ventoinhas | Download |
|---|---|---|---|---|
| **onemorecap cooling sleeve** | sleeve mínimo | `BC-250-FanSleeves.3mf` *(chat)* | 1× 120 | [GitHub onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) |
| **onemorecap Shell Case** ⭐ | shell aberto | `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl` *(chat)* | 1–2× 120 / 1× 140 | [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [GitHub](https://github.com/onemorecap/bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case) |
| **Frame aberto de acrílico** (Владислав) | frame aberto | suportes impressos *(chat #114651)* | 1× 120 | [Reddit thread](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) |
| **"Просто лучший корпус"** (Jack Fisher × B1zon) | console | `BC250 korpus исправленный.rar` *(chat)* | 120 + splitter PWM | [chat #79989](https://t.me/c/2424231195/79989) |
| **Minimal case for Flex PSU** | caixa pequena | `minimal-case-...-model_files.zip` *(chat)* | 1× 120 | [Printables 1423572](https://www.printables.com/model/1423572-minimal-case-for-bc250-and-flex-psu) |
| **forgenam case** | console | `forgenam-case-bc250-model_files.zip` *(chat)* | 1× 120 | [Printables 1375929](https://www.printables.com/model/1375929-forgenam-case-bc250) |
| **Minimalist 240** | console + alça | `Minimalist 240 Front/Back/Handle.stl` *(chat)* | 120 | [chat #117404](https://t.me/c/2424231195/117404) |
| **M360** | console | `M360 Front.stl`, `M360 Back.stl` *(chat)* | 120 | [chat #126566](https://t.me/c/2424231195/126566) |
| **NexGen3D DIY Steam Machine** ⭐ | console | arquivos do Printables | 1× 120 | [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) |
| **NexGen3D Pro (líquido)** | console + AIO | arquivos do Printables | 120 AIO | [Printables 1614131](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) |
| **NexGen3D Redux (+tela)** | console + tela 1080×480 | arquivos do Printables | 1× 120 | [Printables 1649679](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) |
| **NexGen3D AIO mount** | adaptador | arquivos do Printables | 120 AIO | [Printables 1554003](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250) |
| **Case v3 — HP server PSU** | console + HDD/USB | arquivos do Printables | 120 | [Printables 1580750](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) |
| **Case v4 — FlexATX / HP PSU** | console | arquivos do MakerWorld | 120 | [MakerWorld 2481620](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) |
| **ATX-PSU Bazzite Box** | caixa full-ATX | arquivos do Printables | 120 | [Printables 1550729](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box) |
| **ivanov-innokentii case** | console | fontes do GitHub | 120 | [GitHub ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) |
| **rLapchynski enclosure** | gabinete | fontes do GitHub | 120 | [GitHub rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure) |
| **BC-250 Scooper** | shroud/scoop | arquivos do Printables | 120 | [Printables 1282906](https://www.printables.com/model/1282906-bc-250-scooper) |
| **Pitman case** | console | arquivos do Printables | 120 | [Printables 1570248](https://www.printables.com/model/1570248-amd-bc-250-pitman-case) |
| **Industrial-style FlexATX** | console | `amd_bc_250_industrial_style_case...zip` *(chat)* | 120 (sem cooler de fábrica) | [chat #144265](https://t.me/c/2424231195/144265) |
| **The Lanboy** | arcade portátil + tela eDP de 16″ | arquivos do Printables | breakout ATX de 12 V | [Printables 1746364](https://www.printables.com/model/1746364) |
| **BC250 Vented Edition** (MaelremremDotXYZ) | console FlexATX, fins-open | arquivos do MakerWorld | 120 | [MakerWorld 2899020](https://makerworld.com/en/models/2899020) |
| **Stellar 250** (isaacalvex) | console + guia de build (WiFi6, ESP32) | guia do GitHub | 120 | [GitHub isaacalvex/...Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide) |
| **Simple Case for the ASRock AMD BC-250** | console | arquivos do MakerWorld | 120 | [MakerWorld 2870270](https://makerworld.com/en/models/2870270) |
| **BC250-HUD** (Bloodyly) | tela de status interna Pi Zero 2 | fontes do GitHub | — | [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD) |
| **Generic ITX mount** (majzok) | adaptador (qualquer gabinete ITX) | pesquise Printables/MakerWorld | — | "BC-250 ITX Mount" |
| **Thermalright AXP90/AXP120 mount** | adaptador de cooler low-profile | arquivos do Printables | tower low-profile | [Printables 1694793](https://www.printables.com/model/1694793) |
| **Twin-120 mount plate** | placa adaptadora | `Twin_120mm_Fan_Shroud.stl` *(chat)* | 2× 120 | [chat #121684](https://t.me/c/2424231195/121684) |
| **Fan shrouds (120/140)** | shroud | `Fan_Shroud_Single_120mm.stl`, `_Dual_120mm`, `_Single_140mm`, `_120mm_Restricted` *(chat)* | 120 / 140 | [Printables 1339540](https://www.printables.com/model/1339540-yet-another-bc-250-fan-shroud) · veja [Refrigeração](04-cooling.md) |
| **AM4 cooler adapter** | suporte | `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` *(chat)* | tower/AIO | [Printables 1042228](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount) |
| **Accurate board model** | CAD de referência | `bc-250-body.step` *(chat)* | — | [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) |

⭐ = com mais reações de valor / mais repostado na comunidade.

### Mais designs públicos (do catálogo do elektricM)

Designs nomeados e baixáveis do [catálogo de 143 designs do elektricM](https://elektricm.github.io/amd-bc250-docs/community/cases/) que não estão listados acima — agrupados pela PSU em torno da qual foram construídos. Navegue pelo catálogo completo para builds só-do-Discord/em-andamento e miniaturas.

**MeanWell LOP (PSU interna):**

| Caixa / peça | Destaque | Download |
|---|---|---|
| **Steamboat Case** (yannichaboyer) | console LOP-300 | [MakerWorld 2431616](https://makerworld.com/en/models/2431616) |
| **Ultra-Thin Custom Case** (MrRoze) | LOP-300 slim | [Printables 1626501](https://www.printables.com/model/1626501) |
| **Internal PSU 2×140 mm** (Kacikor) | LOP-400, dois 140 | [Printables 1599644](https://www.printables.com/model/1599644) · [MakerWorld 2400574](https://makerworld.com/en/models/2400574) |
| **Push-Pull Internal 12V PSU** (penzoiders) | push-pull | [MakerWorld 2505974](https://makerworld.com/en/models/2505974) |
| **Shell Case + 40 mm SSD fan** (Munkee915) | remix do Shell, refrigeração de SSD | [Printables 1568074](https://www.printables.com/model/1568074) |
| **Noctua Push-Pull Mod** (Janjd) | remix do Shell | [MakerWorld 2354123](https://makerworld.com/en/models/2354123) |

**MeanWell LRS/UHP (o outro brick de servidor comum):**

| Caixa / peça | Destaque | Download |
|---|---|---|
| **LRS-350-12 PSU Case** (TARGZ) | caixa LRS-350 | [Printables 1543979](https://www.printables.com/model/1543979) |
| **BC250 slim case** (C4kew4lk) | UHP-350-12, slim | [Printables 1504664](https://www.printables.com/model/1504664) |

**FlexATX — família "Console Style" do Arthrimus** (toda uma linhagem de remixes; o console slim é um clássico da comunidade):

| Caixa / peça | Destaque | Download |
|---|---|---|
| **Console Style Case v1** (Arthrimus) | o original | [Thingiverse 7165679](https://www.thingiverse.com/thing:7165679) · [MakerWorld 2097988](https://makerworld.com/ko/models/2097988-bc250) |
| **Slim Console Style Case** (Arthrimus) | variante slim | [Thingiverse 7172528](https://www.thingiverse.com/thing:7172528) |
| **Slim Console — double-fan mod** (TKXXTH) | ventoinha dupla | [Thingiverse 7214884](https://www.thingiverse.com/thing:7214884) |
| **Slim Console — On/Off + Apevia** | interruptor de liga/desliga | [Thingiverse 7274042](https://www.thingiverse.com/thing:7274042) |

**FlexATX — outros:**

| Caixa / peça | Destaque | Download |
|---|---|---|
| **Minimal Case (Toolless)** (chriszf) | sem parafusos | [Printables 1423572](https://www.printables.com/model/1423572) |
| **Minimalist BC-250 Case** (SebastienGau/Gadget) | minimalista | [Printables 1581724](https://www.printables.com/model/1581724) |
| **ADT UT3G eGPU-Inspired** (R0mn) | visual de eGPU | [Printables 1539301](https://www.printables.com/model/1539301) |
| **"Steam Machine" by MrLarva** | console | [Printables 1618501](https://www.printables.com/model/1618501) · [MakerWorld 2453965](https://makerworld.com/en/models/2453965) · [Thingiverse 7278235](https://www.thingiverse.com/thing:7278235) |
| **Steam Machine** (Pocket Adventures) | console | [MakerWorld 2350219](https://makerworld.com/en/models/2350219) |
| **Steam Machine Slim Console** (MTSquar3D) | slim + kit de ventoinha OC vRAM | [MakerWorld 2232434](https://makerworld.com/en/models/2232434) · [Thingiverse 7271946](https://www.thingiverse.com/thing:7271946) |
| **ASRock Console Case** (songdawgdesigns) | console | [Printables 1617023](https://www.printables.com/model/1617023) · [Cults3D](https://cults3d.com/en/3d-model/gadget/asrock-amd-bc-250-console-case-steamos-bazzite-diy-steam-machine-style-build) |
| **AMD BC250 Case** (vitamins) | console | [MakerWorld 2219947](https://makerworld.com/en/models/2219947) |
| **E-waste Steam Machine** (Pesen333) | build de recuperação | [Thingiverse 7245584](https://www.thingiverse.com/thing:7245584) |

**Full ATX:**

| Caixa / peça | Destaque | Download |
|---|---|---|
| **Case for Standard ATX** (CatSiewDai) | caixa ATX | [Printables 1553599](https://www.printables.com/model/1553599) |
| **ATX + Fan Duct** (ZMASLO) | com duto | [Printables 1616167](https://www.printables.com/model/1616167) |
| **Dual Fan ATX Case** (Mateo Fdez) | ventoinha dupla | [Printables 1579658](https://www.printables.com/model/1579658) |
| **Simple Wooden Case** (suvalle55) | madeira + ATX | [Printables 1595794](https://www.printables.com/model/1595794) |
| **Open Frame + IKEA hack** (GreatApo) | frame aberto | [Thingiverse 7314188](https://www.thingiverse.com/thing:7314188) |
| **Case for ATX PSU** (matmiak) | caixa ATX | [Thingiverse 7303096](https://www.thingiverse.com/thing:7303096) |

**TFX / VESA / de prateleira:**

| Caixa / peça | Destaque | Download |
|---|---|---|
| **Case Remix for TFX** (PlayNation) | PSU TFX-400 | [MakerWorld 2387157](https://makerworld.com/en/models/2387157) |
| **VESA 100/75 Basket** (Oleksii) | montar atrás de um monitor | [MakerWorld 1844470](https://makerworld.com/en/models/1844470) |
| **3.9L MKII FlexATX + PS5 fan** (FitFormSolutions) | compre um kit pronto | [Etsy](https://www.etsy.com/listing/4405362103/) · [eBay](https://www.ebay.com/itm/127460591552) |
| **Shiny Snake S400** (ITX de malha 10.8 L) | host de prateleira sabidamente bom (suporte BC-250→AM4 + H60 AIO na baia da PSU + escudo de I/O ATX customizado) | [AliExpress](https://a.aliexpress.com/_EyQdoBU) |
| **SFX-PSU minimalist case** (Methsman) | PSU SFX completa, painéis magnéticos, hub USB, AXP120 + Noctua 120 — *arquivos em andamento / ainda não lançados* | — |
| **Cults3D ATX/server line** (KABANCHYK, lumstudio, kapa3D) | STLs pagos | [Cults3D — bc-250](https://cults3d.com/en/3d-model/gadget/bc-250-atx-case) |

---

## Sem impressora? Opções que as pessoas usam

- **Compre uma impressão.** Existem vendedores no [Etsy](https://www.etsy.com/listing/1904632447/), eBay e OLX; pessoas também se ofereceram para imprimir/vender gabinetes no chat ([src](https://t.me/c/2424231195/55507)).
- **Print-on-demand:** envie um STL para um serviço. Builders no chat operam fazendas de impressão (um mostra uma parede de impressoras Flsun/Creality/Bambu, [src](https://t.me/c/2424231195/73481)).
- **Sem gabinete nenhum / reaproveitamento.** Muitos rodam a placa numa bancada aberta enquanto testam. Outros esvaziam hardware existente: um PC all-in-one antigo com a placa implantada e um blower ([src](https://t.me/c/2424231195/30914)), uma caixa de duto de ventilação ([src](https://t.me/c/2424231195/64265)), ou gabinetes de amplificador de alumínio (precisa de limar/furar, [src](https://t.me/c/2424231195/108907)). Um membro até escondeu a placa dentro de um video-cassete VHS antigo de brincadeira ([src](https://t.me/c/2424231195/84106)). **Shell de Xbox One** (JoeyDepDollas): esvazie um Xbox One quebrado e encaixe um build completo de BC-250 dentro — mantém CPU e GPU abaixo de **60 °C** sob carga; consoles doadores quebrados saem por **~$15 com frete** no eBay e rendem peças reutilizáveis.
- **Compensado cortado a laser** (ContributionRich3242): não é impresso em 3D — compensado dobrado por kerf nas quinas com uma grande área traseira para refrigeração extra, atingindo **75 °C a 40 CU** (1800 MHz, CPU 3.9 GHz) e silenciosíssimo. (Os arquivos de laser não foram lançados.) Sua **técnica de refrigeração do backplate** é reutilizável em qualquer gabinete: massa térmica chip→backplate, pasta backplate→coolers traseiros, e fixe os coolers traseiros com cupilhas tipo R apertadas no vão do VRM + fita Kapton (~20 °C mais frio a 40 CU).

> Uma placa nua e bem refrigerada supera uma caixa bonita e vedada com fluxo de ar ruim. Acerte a [Refrigeração](04-cooling.md) primeiro; o gabinete é o segundo passo.

---

## Fontes

- Vitrine curada **#BC250body** (um bom build por dia) — ideia fixada [src](https://t.me/c/2424231195/79685)
- Sleeve mínimo, duas variantes — [src](https://t.me/c/2424231195/10743) · modelos em [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) [src](https://t.me/c/2424231195/18260)
- Shell Case (❤33) — [src](https://t.me/c/2424231195/22771) · gratuito no Printables/MakerWorld [src](https://t.me/c/2424231195/24505) · lote de STL [src](https://t.me/c/2424231195/81680)
- "Просто лучший корпус" + BOM — [src](https://t.me/c/2424231195/79990) · arquivos [src](https://t.me/c/2424231195/79989)
- Frame aberto de acrílico — [src](https://t.me/c/2424231195/114651) · [Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/)
- Placa de montagem Twin-120, 2200 MHz @ 80 °C — [src](https://t.me/c/2424231195/120606) · shroud [src](https://t.me/c/2424231195/121684)
- Designs de console (fotos) — Гослинг/Bazzite [src](https://t.me/c/2424231195/66616) · Jhonatan painel labiríntico [src](https://t.me/c/2424231195/121274) · Joglik malha quadriculada [src](https://t.me/c/2424231195/126525) · a m janela oval [src](https://t.me/c/2424231195/52955) · Spyrydonov v15 [src](https://t.me/c/2424231195/135995)
- Família NexGen3D Steam Machine — [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) · [Redux + tela Pi (Reddit)](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)
- Modelo de referência da placa — [src](https://t.me/c/2424231195/55496) · [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)
- Repositórios de gabinetes no GitHub — [onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) · [rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure)
- **Catálogo completo de gabinetes do elektricM (~143 designs, pesquisável/filtrável)** — [elektricm.github.io/amd-bc250-docs/community/cases](https://elektricm.github.io/amd-bc250-docs/community/cases/)
- Simple Case (MakerWorld 2870270) + walkthrough de build em ucraniano — [MakerWorld 2870270](https://makerworld.com/en/models/2870270) · [Old Lamer (YouTube)](https://youtu.be/p5Zd86vFe8w)
- Lifehack do furo de acesso para limpar o CMOS — [4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980)
- BOM do build "Steam Machine Pro" com refrigeração líquida (TEUCER AF 240, Mean Well LOP-600-12, Arctic P12 Pro/P8, relé ESP32, OpenLinkHub/Commander Duo) — [Old Lamer (YouTube)](https://youtu.be/afYhUQFa-AY)

> STLs de shroud de ventoinha são compartilhados com [Refrigeração](04-cooling.md). Todos os arquivos STL/STEP/3MF hospedados no chat estão espelhados em `assets/stl/`.
