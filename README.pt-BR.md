<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — a bíblia do iniciante para a AMD BC-250" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> A bíblia do iniciante para a **ASRock AMD BC-250** — uma placa APU derivada do PlayStation 5 (Cyan Skillfish / Oberon, 6 núcleos Zen 2 + RDNA 2, 16 GB GDDR6) reaproveitada como um **mini PC Linux barato para jogos e IA** — uma Steam Machine barata de DIY.

Tudo o que você precisa para sair **de uma placa na caixa até rodar jogos** — compilado a partir de 130k+ mensagens da comunidade BC-250, classificado pelo que as pessoas de fato votaram e fixaram, e cruzado com os repositórios canônicos do projeto.

🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · **Português (BR)** · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<sub>_Mantido · última atualização **agosto de 2026** · [llms.txt](llms.txt) para agentes de IA_</sub>

---

## ❓ Respostas rápidas

- **O que é a ASRock AMD BC-250?** Uma placa APU derivada do PlayStation 5 — 6 núcleos Zen 2 + 24/40 CUs RDNA 2 ("Cyan Skillfish"), 16 GB GDDR6 — vendida barata como placa ex-mineração e reaproveitada como um mini PC Linux para jogos e IA, uma Steam Machine barata de DIY.
- **Quanto custa?** Cerca de **US$ 60–130** pela placa nua; uma configuração completa (fonte, cooler, SSD) fica perto de **US$ 150–250**. Veja [Guia de compra](docs/en/02-buying.md).
- **Como ela se sai em jogos?** Aproximadamente **1080p 60 FPS** na maioria dos títulos (classe RX 6600) com FSR / Frame-Gen e um overclock de GPU+CPU. Veja [Resultados em jogos](docs/en/11-gaming.md).
- **Qual SO?** **Somente Linux** para aceleração de GPU — Bazzite, Fedora, CachyOS ou Arch com Mesa 25.1+. Não existe driver de GPU para Windows. Veja [Configuração do Linux](docs/en/06-linux.md).
- **Dá para rodar LLMs?** Sim — llama.cpp / Ollama via Vulkan usam os 16 GB GDDR6 como VRAM (~30–47 tok/s em modelos pequenos). Veja [IA / LLM](docs/en/12-ai-llm.md).
- **Como resfriar?** O dissipador de servidor original sofre thermal throttling sobre uma mesa; afine as aletas e adicione uma ventoinha de 120 mm, ou vá de watercooling. Veja [Refrigeração](docs/en/04-cooling.md).

---

## ⚡ Comece por aqui

Placa nova e você não sabe nada? Siga o caminho dourado na ordem:

**[docs/pt-BR/00-start-here.md](docs/pt-BR/00-start-here.md)** — Comprar → Alimentar → Refrigerar → Instalar o SO → Drivers → Overclock → Jogar.

---

## 📈 O que o ajuste realmente rende

Cada parâmetro desta placa envolve uma troca. Estes são os quatro que importam, extraídos do que a comunidade mediu — leia-os antes de flashar qualquer coisa.

<p align="center">
  <img src="assets/diagrams/gpu-clock-tradeoff.svg" width="100%" alt="Clock do núcleo da GPU: o ganho de FPS sobe até cerca de 95% em 2000 MHz e depois estabiliza quando a CPU passa a ser o limite, enquanto potência e calor continuam subindo até 95%. Ponto ideal em torno de 2000 MHz, aproximadamente +30% de FPS.">
</p>

<p align="center">
  <img src="assets/diagrams/undervolt-tradeoff.svg" width="100%" alt="Undervolt: a eficiência sobe de 20% para 95% conforme a voltagem cai de 1129 mV para 700 mV, enquanto o risco de instabilidade sobe de 15% para 100%. A faixa estável para jogos é de aproximadamente 905 a 955 mV; abaixo de 700 mV a GPU se trava em 1500 MHz.">
</p>

<p align="center">
  <img src="assets/diagrams/cu40-tradeoff.svg" width="100%" alt="Desbloqueio de 40 CUs: a computação sobe de 40% para 90% enquanto o FPS em jogos vai apenas de 40% para 47%, e potência e instabilidade sobem de 25% para 100%. 38 CUs é o máximo estável típico; 40 CUs é uma loteria que exige mais de 300 W e um AIO.">
</p>

<p align="center">
  <img src="assets/diagrams/memory-tradeoff.svg" width="100%" alt="Ajuste de memória GDDR6: a largura de banda e o ganho de FPS vão apenas de 30% para 52% enquanto o risco de brick sobe de 20% para 100%. 1950 MHz é onde as placas voltaram brickadas.">
</p>

<p align="center">
  <img src="assets/diagrams/power-by-config.svg" width="100%" alt="Consumo medido na tomada por configuração: 200 W com 38 CUs e 1200 MHz em 850 mV, 260 W com 40 CUs e 1800 MHz em 860 mV, 310 W com 38 CUs e 1500 MHz e 350 W com 40 CUs e 2000 MHz em 960 mV, com 1025 mV adicionando apenas 2 W a mais. O melhor ponto de watts por frame relatado é 40 CUs a 1800 MHz.">
</p>

Esses cinco pontos são medições, não um modelo: ir de 1800 para 2000 MHz custa cerca de 90 W — aproximadamente o mesmo que custaram os 600 MHz anteriores — e subir de 960 mV para 1025 mV não compra nada além de 2 W de calor. Com 350 W, uma fonte de 300 W desarma em 30 segundos e o trilho de +12V está carregando 26 A.

<details>
<summary>Consumo em idle — por que o medidor de tomada mal se move</summary>

<p align="center">
  <img src="assets/diagrams/idle-power-tradeoff.svg" width="100%" alt="Consumo em idle: o consumo da GPU cai de 80 W para 5 W com governor, undervolt e auto-suspend, mas o consumo total na tomada cai apenas de 125 W para 110 W até o suspend derrubá-lo para 10 W.">
</p>

O governor e o undervolt cortam a GPU, mas a CPU e a GDDR6 continuam consumindo independentemente. Até o auto-suspend entrar em ação, o medidor de tomada mal percebe. Lotes com alta corrente de fuga chegam a um piso em torno de 70–80 W.

</details>

<sub>Dados de origem: [`assets/diagrams/data.json`](assets/diagrams/data.json) · reconstrua com `node assets/diagrams/build.mjs`</sub>

---

## 📚 Manual

| # | Seção | Para |
|---|---------|-----|
| 01 | [O que é a BC-250](docs/en/01-what-is-bc250.md) | especificações, tamanhos, pinout, expectativas |
| 02 | [Guia de compra](docs/en/02-buying.md) | onde, preço, riscos, compras em grupo |
| 03 | [Fonte de alimentação](docs/en/03-power-supply.md) | LOP / Flex ATX, pinout de 8 pinos, cabeamento |
| 04 | [Refrigeração](docs/en/04-cooling.md) | dissipador, dutos de ventoinha, método de teste |
| 05 | [Gabinetes e impressão 3D](docs/en/05-case.md) | catálogo de gabinetes imprimíveis (STL) |
| 06 | [Drivers e configuração do Linux](docs/en/06-linux.md) | escolha da distro, amdgpu, instalação |
| 07 | [Drivers e configuração do Windows](docs/en/07-windows.md) | situação dos drivers, passo a passo |
| 08 | [BIOS e recuperação de brick](docs/en/08-bios.md) | BIOS modificada, flash, des-brickar |
| 09 | [Overclocking e undervolting](docs/en/09-overclock-undervolt.md) | governor, SMU, desbloqueio de 40 CUs |
| 10 | [Dongles WiFi e Bluetooth](docs/en/10-wifi-bt.md) | dongles que realmente funcionam |
| 11 | [Resultados em jogos e configurações](docs/en/11-gaming.md) | benchmarks, ajuste por jogo |
| 12 | [IA / LLM na BC-250](docs/en/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/en/13-macos.md) | situação |
| 14 | [Vídeo e saída de imagem](docs/en/14-display.md) | DisplayPort, adaptadores DP→HDMI, tela dupla |
| 15 | [Emulação](docs/en/15-emulation.md) | cada console/plataforma, situação realista |
| 16 | [USB, hubs e armazenamento](docs/en/16-usb-peripherals.md) | hubs, mod de 5V, adaptadores M.2 / SATA |
| ❓ | [FAQ](docs/pt-BR/faq.md) · [Solução de problemas](docs/pt-BR/troubleshooting.md) | problemas comuns |

---

## 🔗 Recursos Awesome

Projetos canônicos da comunidade, classificados pela frequência com que a comunidade os indicou.

### Documentação
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) — a principal referência de hardware (engenharia reversa)
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [site](https://elektricm.github.io/amd-bc250-docs/) — documentação comunitária completa (pinouts, por distro, solução de problemas)
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — documentação da organização
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — builds e scripts

### Overclock / Undervolt / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — o governor que a maioria dos builds usa (define clocks/voltagem)
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — fork do oberon-governor com interface gráfica (Linux)
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [fork da bc250-collective](https://github.com/bc250-collective/cyan-skillfish-governor)
- [rw-r-r-0644/bc250-core-unlock](https://github.com/rw-r-r-0644/bc250-core-unlock) — desbloqueia os 2 núcleos de CPU desabilitados (máscara padrão 0x77; uma máscara 0xB7 significa núcleos fisicamente defeituosos — forçá-la causa artefatos e travamentos)
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — desbloqueia todas as 40 CUs
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Toolkits e imagens prontas
- [redbeard1083/bc250-toolkit](https://github.com/redbeard1083/bc250-toolkit) — configuração guiada por menu para o CachyOS: kernel, governors de CPU/GPU, swap, ZRAM→ZSWAP, ajustes de ACPI e de boot
- [62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images](https://github.com/62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images) — imagens Bazzite Deck/GNOME/KDE pré-construídas com os patches da BC-250 aplicados

### Drivers
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — driver de GPU para Windows (experimental, sem aceleração completa no início de 2026)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — trabalho no driver PSP/GPU
- [DryhoppedIPA/bc250-gfx1013-fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix) — patches de kernel + Mesa/RADV para a fila de compute quebrada da GPU (async compute); também corrige o caminho INT8 do FSR 4 / XeSS 3
- [MastaG/linux-cachyos-bc250](https://github.com/MastaG/linux-cachyos-bc250) — kernel CachyOS com cherry-picks da BC-250
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — kernel do Linux

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — as imagens e mods de BIOS mais referenciados
- [TheRetroWeb — Banco de dados de BIOS da BC-250](https://theretroweb.com/bios?itemsPerPage=24&chipsetIds%5B%5D=1990) — dumps de BIOS originais, navegue/baixe por versão
- [Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script](https://github.com/Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script) — backup de firmware e flash de firmware personalizado guiados por menu
- Veja [docs/en/08-bios.md](docs/en/08-bios.md) para flash e recuperação de brick

### Dongles WiFi / BT
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### IA / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Gabinetes / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables e MakerWorld — veja [docs/en/05-case.md](docs/en/05-case.md)

---

## 🤝 Contribuindo

Este é um repositório **vivo**. O conhecimento é extraído do chat da comunidade por um pipeline reproduzível (veja [CONTRIBUTING.md](CONTRIBUTING.md)) e reexecutado a cada nova exportação. PRs com correções, novos dongles, novos gabinetes e comandos verificados são bem-vindos.

## 📄 Licença

Documentação: [CC-BY-SA-4.0](LICENSE). Scripts em `assets/scripts/`: MIT. Firmware/drivers de terceiros espelhados mantêm seus direitos originais — veja [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md).

## 🙏 Créditos

Toda a comunidade BC-250 — veja **[CREDITS](CREDITS.md)** para os principais contribuidores que tornaram este manual possível. Fonte: *chat da comunidade AMD BC-250*. Os autores do projeto são creditados pelo nome de seus repositórios acima.
