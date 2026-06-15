🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · **Português (BR)** · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — a bíblia do iniciante para a AMD BC-250" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> A bíblia do iniciante para a **AMD BC-250** — uma placa APU derivada do PlayStation 5 (Cyan Skillfish / Oberon, 16 GB GDDR6) reaproveitada como uma máquina barata de Linux para jogos e IA.

Tudo o que você precisa para sair **de uma placa na caixa até rodar jogos** — compilado a partir de mais de 125 mil mensagens da comunidade BC-250, classificado pelo que as pessoas de fato votaram e fixaram, e cruzado com os repositórios canônicos do projeto.

🌍 Idiomas: [English](README.md) · [Русский](README.ru.md) · **Português (BR)**

---

## ⚡ Comece por aqui

Placa nova e você não sabe nada? Siga o caminho dourado na ordem:

**[docs/pt-BR/00-start-here.md](docs/pt-BR/00-start-here.md)** — Comprar → Alimentar → Refrigerar → Instalar o SO → Drivers → Overclock → Jogar.

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
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — desbloqueia todas as 40 CUs
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Drivers
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — driver de GPU para Windows (experimental, sem aceleração completa no início de 2026)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — trabalho no driver PSP/GPU
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — kernel do Linux

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — as imagens e mods de BIOS mais referenciados
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
