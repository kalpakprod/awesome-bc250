> 🌐 Tradução da comunidade. A versão em inglês é a fonte da verdade e pode estar mais atualizada. Achou um erro? Abra uma issue: [../en/13-macos.md](../en/13-macos.md) · https://github.com/lildebil0/awesome-bc250/issues

# macOS / Hackintosh

> **TL;DR** — **Não faça.** Você provavelmente consegue dar boot no macOS na CPU da BC-250 (é um chip AMD Zen 2, e truques genéricos de hackintosh AMD-OSX se aplicam), mas a **GPU não vai acelerar** e não há caminho realista para fazer isso acontecer. O macOS dá suporte a GPUs por device ID hard-coded; a GPU da BC-250 (Cyan Skillfish / Oberon, uma peça cortada do PS5) **não tem gêmea de desktop com suporte nativo para se passar por ela**, e a stack da Apple *nunca* foi feita para dirigir os gráficos integrados de nenhuma APU AMD. Então você teria um Mac lento, renderizado por software, sem Metal. Em 2026, ninguém na comunidade relatou um resultado acelerado funcionando. Use Linux em vez disso — veja [06-linux.md](06-linux.md).

Isto é uma **curiosidade de nicho**, não um caso de uso real. A resposta honesta é a seção inteira.

---

## Por que a aceleração de GPU é o muro

Os dois posts técnicos mais reagidos do tópico chegam ambos à mesma conclusão, e explicam o mecanismo com clareza.

O macOS não tem um modelo de driver aberto como o Linux. Ele envia drivers fechados que se vinculam a GPUs específicas **por device ID**, e o único lugar onde você pode intervir é no bootloader **OpenCore** *antes* de o SO carregar — o OpenCore entrega ao macOS dados pré-cozidos, ele não consegue dar patch no sistema fechado por dentro ([src](https://t.me/c/2424231195/103173)).

O OpenCore *consegue* falsificar o device ID de uma GPU, mas apenas **dentro de uma mesma família arquitetural** — ex.: apresentar uma RX 6950 XT sem suporte como uma RX 6900 XT com suporte, porque são o *mesmo* silício. Esse truque levou aos devs do OpenCore **mais de um ano** e só funcionou porque aquelas placas Navi são arquiteturalmente idênticas a outras que a Apple já dava suporte ([src](https://t.me/c/2424231195/53321)).

A BC-250 quebra isso de duas maneiras:

1. **Sem gêmea para se passar por ela.** Sua GPU é uma peça cortada, derivada do PS5 (`gfx1013`). **Não existe placa AMD de desktop com a mesma arquitetura que o macOS suporte nativamente**, então não há nada por que se passar. Para a BC-250 funcionar, a stack da Apple precisaria aprender esse device ID do zero — o que só acontece se os desenvolvedores do OpenCore adotarem o chip, e não há razão comercial para isso ([src](https://t.me/c/2424231195/53321)).
2. **É uma APU, e APUs nunca funcionaram.** Mesmo gráficos integrados Ryzen de arquitetura-de-desktop (iGPUs Vega / Navi) **nunca** foram colocados para funcionar no macOS, apesar de compartilharem uma microarquitetura com placas dedicadas que têm suporte. O autor "não viu um único caso funcionando" de uma iGPU Ryzen no macOS ([src](https://t.me/c/2424231195/103173)). A BC-250 está nesse mesmo balde de APU.

O resumo direto do mesmo colaborador: *se nem os drivers de Windows para este chip estão resolvidos, o macOS não vale a pena nem sonhar* ([src](https://t.me/c/2424231195/53321)). (Para a situação dos drivers de Windows, veja [07-windows.md](07-windows.md).)

---

## O que as pessoas de fato tentaram

- Alguém preparou e compartilhou um pacote **macOS Monterey recovery + OpenCore** no começo (`Monterey recovery + OpenCore.zip`, mais um `Архив.zip` anterior), então pelo menos uma pessoa se propôs a instalá-lo ([src](https://t.me/c/2424231195/53590)). Nenhum sucesso de GPU-acelerada foi jamais relatado de volta.
- A ferramentaria relevante para a qual as pessoas apontaram é o kit padrão de hackintosh AMD: falsificação de device ID via [RehabMan/OS-X-Fake-PCI-ID](https://github.com/RehabMan/OS-X-Fake-PCI-ID), o [guia de compra de GPU AMD da Dortania](https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series) para o que de fato tem suporte e — a coisa mais próxima de suporte a gráficos de APU — **[ChefKissInc/NootedRed](https://github.com/ChefKissInc/NootedRed)**, um kext para iGPUs de APU AMD. O NootedRed mira APUs de classe Vega/Renoir e **não** cobre o die da BC-250, então ele não resgata esta placa.
- Um link de fórum posterior sobre [rodar macOS em AMD Ryzen via VMware/OpenCore](https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/) ([src](https://t.me/c/2424231195/107779)) é **hackintosh AMD genérico**, não específico da BC-250 — e uma VM significa nenhum passthrough de GPU/Metal de qualquer forma.

> ⚠ **Não confunda piadas com resultados.** O tópico tem brincadeiras leves do tipo "ótimo, o poderoso hackintosh reina aqui" ([src](https://t.me/c/2424231195/85166)) e reações de elogio que *não* são relatos de um build de macOS funcionando. Nada nas evidências mostra macOS acelerado em uma BC-250.

---

## Então vale a pena?

**Não, para qualquer propósito prático.** O melhor resultado realista é um macOS apenas-CPU que renderiza a UI por software — sem Metal, sem compute de GPU, inutilizável para as cargas de jogos/IA para as quais esta placa é comprada. O consenso da comunidade, datado e inalterado de **2025-06** até **2026-03**, é que o suporte de GPU é efetivamente impossível sem que os desenvolvedores do OpenCore adotem especificamente este chip, o que não aconteceu e não é esperado.

Se você quer que esta placa *faça* algo, instale Linux ([06-linux.md](06-linux.md)) onde a GPU tem suporte genuíno via Mesa/RADV. O Windows é um segundo distante ([07-windows.md](07-windows.md)). O macOS é o último e, na prática, um beco sem saída.

---

## Fontes

- GPU-por-device-ID + a história do spoof de Navi de um ano — https://t.me/c/2424231195/53321
- Os limites do OpenCore & "nenhuma iGPU Ryzen jamais funcionou" — https://t.me/c/2424231195/103173
- Pacote Monterey + OpenCore que alguém preparou — https://t.me/c/2424231195/53590
- Thread de fórum genérico de hackintosh AMD-Ryzen (não específico da BC-250) — https://t.me/c/2424231195/107779 · [thread amd-osx.com](https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/)
- Ferramentaria referenciada — [RehabMan/OS-X-Fake-PCI-ID](https://github.com/RehabMan/OS-X-Fake-PCI-ID) · [ChefKissInc/NootedRed](https://github.com/ChefKissInc/NootedRed) (kext de iGPU de APU AMD; não cobre este die) · [guia de GPU AMD da Dortania](https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series)
- Identidade do chip (Cyan Skillfish / Oberon, `gfx1013`) — veja [01-what-is-bc250.md](01-what-is-bc250.md)

> **Conclusão:** macOS na BC-250 é uma nota de rodapé de trivia técnica, não um alvo de build. Vá para [06-linux.md](06-linux.md).
