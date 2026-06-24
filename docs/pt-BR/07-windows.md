> 🌐 Tradução da comunidade. A versão em inglês é a fonte da verdade e pode estar mais atualizada. Achou um erro? Abra uma issue: [../en/07-windows.md](../en/07-windows.md) · https://github.com/lildebil0/awesome-bc250/issues

# Drivers e Configuração no Windows

> **TL;DR** — No **início de 2026 não existe nenhum driver de GPU funcional para Windows na BC-250.** O Windows instala e dá boot, mas a GPU fica com **Code 43** e zero aceleração 3D — todo driver AMD de prateleira (Adrenalin, Pro, o truque do `.inf` da W5700) é rejeitado pelo hardware. A comunidade está **fazendo engenharia reversa de um driver do zero**, e o estado honesto é "a infraestrutura básica inicial funciona, mas nada renderiza jogos ainda". Se você quer realmente *usar* esta placa hoje, **instale Linux** ([06-linux.md](06-linux.md)) — é lá que vive o driver funcional. Trate tudo nesta página com ceticismo e confira as datas dos commits do repositório antes de confiar nelas.

O veredito de longa data da comunidade, fixado para novatos desde 2025: *"Abandonai toda esperança, vós que entrais aqui. Drivers para Windows não vão acontecer com 99,5% de probabilidade. Sem um driver esta placa é quase completamente inútil. O driver de Linux existe — se você não está pronto para esse sistema operacional, você não precisa desta placa."* ([src](https://t.me/c/2424231195/28109))

Esse foi o consenso por mais de um ano. Ele finalmente **está sendo desafiado** em 2026 — mas devagar, e a resposta honesta ainda é: ainda não.

---

## Por que o Windows é difícil aqui (a barreira do Code 43)

O APU da BC-250 ("Cyan Skillfish" / Oberon, GFX10.1.3) se apresenta ao SO como um **dispositivo desconhecido** — PCI ID `1002:13FE` — que nenhum driver AMD comercial reconhece. As pessoas tentaram de tudo:

- **Forçar um `.inf` oficial** no Gerenciador de Dispositivos: o único driver que o Windows oferece como "compatível" é o da **Radeon Pro W5700**. Ele instala, e então trava no **Error 43**, exatamente como todo outro driver tentado. ([src](https://t.me/c/2424231195/57123))
- **Editar o `.inf` / trocar os IDs de dispositivo** (gfx1013, 1014, Navi 21/22/23 "Dragonball", entradas legadas), desabilitar a verificação de assinatura de driver, até dar boot no Windows 10 a partir de USB e tentar um driver de Steam Deck — **todos becos sem saída**. As entradas legadas aparecem sem erro apenas por causa de um bug de exibição, não porque funcionam. ([src](https://t.me/c/2424231195/94029))
- **Modificar a BIOS** para mudar o ID de dispositivo também não ajudou — a iGPU ainda reporta `1002:13FE`. O Dev ID parece estar **soldado ao APU**, não apenas à BIOS, então corrigir um único lugar não é suficiente. ([src](https://t.me/c/2424231195/57123))

Por que o Linux funciona e o Windows não? No Linux a stack open-source **amdgpu/Mesa** foi corrigida pela comunidade (e parcialmente integrada upstream) para reconhecer exatamente este chip; no Windows não há driver aberto para corrigir — a AMD nunca lançou um driver de Windows para esta peça de mineração/servidor, e a stack fechada Adrenalin/Pro recusa o ID desconhecido. ([src](https://t.me/c/2424231195/13210)) O próprio tópico do fórum da AMD sobre "BC-250 drivers" não deu em nada. ([community.amd.com](https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692))

> **Também não existe uma saída via GPU passthrough.** Rodar o Windows em uma VM com a BC-250 em passthrough não funciona: o caminho de passthrough do IOMMU está quebrado nesta placa, e é um *APU* (não uma placa dedicada que o host possa repassar de forma limpa), e o chip é mal-detectado como um dispositivo desconhecido para começar. ([src](https://t.me/c/2424231195/64772))

---

## Status atual dos drivers — o que existe de fato (no início de 2026)

No fim de 2025 a comunidade parou de esperar pela AMD e começou a **construir um driver de Windows do zero** fazendo engenharia reversa do hardware. Dois esforços importam; ambos são **experimentais, WIP, e ainda não renderizam jogos.**

### Keshas-dev — o driver WDDM feito do zero (o mais ativo)

Um par de drivers companheiros em modo kernel, o esforço de Windows mais ativamente desenvolvido (o **driver do PSP sozinho tem ~56 commits** no momento desta escrita):

- **[Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver)** — um driver de baixo nível para o **PSP** (Platform Security Processor). **O que funciona:** ele carrega, dá boot na **SOS firmware**, lê/escreve registradores de hardware via BAR5 MMIO (blocos GC, MMHUB, HDP, NBIO, DF), faz o unlock do NBIO, e atua como proxy de registradores para o driver da GPU. **O que não funciona:** criação do ring GPCOM (a SOS firmware não suporta o protocolo de ring do TOS), carregamento da GPU-firmware via ring buffer, e init da Trusted Memory Region. Em outras palavras: ele consegue falar com o chip, mas **ainda não consegue subir o engine gráfico.** ([repo](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver/commits/main/))
- **[Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver)** — o driver de GPU companheiro. Compartilha a mesma infraestrutura de certificado/test-signing do driver do PSP e o usa como ponte de registradores. Ainda inicial; sem saída 3D utilizável. ([repo](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver/commits/main/))

O primeiro sinal público de vida foi um membro relatando **"meu primeiro driver funcional (OpenGL 1.1)"** em outubro de 2025 ([src](https://t.me/c/2424231195/83320)) — comemorado justamente porque até um driver mal-funcional *instalando e rodando* já era um marco real depois de um ano de Code 43: *"se este driver realmente instalou e funciona (mesmo que mal) — é um passo enorme."* ([src](https://t.me/c/2424231195/83332)) Um dump de driver dessa onda, `AMD Radeon BC-250 (Cyan Skillfish) driver 00.00.01.7z`, foi compartilhado/fixado no chat. ([src](https://t.me/c/2424231195/83322)) **Trate qualquer dump inicial desses como experimental — a versão `00.00.01` é exatamente tão crua quanto parece.**

### ZEROAESQUERDA — a implementação de referência WDDM 2.0

**[ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest)** — um esforço separado ("o cara português começou alguma coisa"), fixado no chat em março de 2026 como um sinal de que o gelo estava quebrando. ([src](https://t.me/c/2424231195/123644)) É melhor entendido como uma **implementação WDDM 2.0 de referência/educacional**, não um driver utilizável:

- Implementa apenas o **Direct3D 9 DDI**; **D3D11, D3D12 e Vulkan não estão implementados.**
- **A compilação de shaders para RDNA2 (GFX10.1 ISA) não é funcional** — ele aceita submissões de shaders mas não consegue compilá-las para o hardware real, então nada renderiza.
- **Não** carrega o microcódigo do Command Processor (depende da firmware carregada pela BIOS); **codificação/decodificação de vídeo VCN não suportada**; apenas uma saída DisplayPort.
- Requer **modo test-signing** (sem assinatura WHQL). Apenas ~2 commits na main.

Veja a seção **[Known Limitations](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas)** do próprio projeto antes de gastar tempo nele.

> ⚠ **Correção de nome do repositório.** A lista principal de repositórios aponta para `ZEROAESQUERDA/PS5GPU-BC250` em "Drivers → Windows". Numa inspeção, esse repositório é um **governor de GPU para Linux** (um fork de Oberon-governor com GUI), **não** um driver de Windows. O código de Windows real deste autor é o **`BC250-windowsDriverTest`**.

### Status num relance

| Projeto | Tipo | O que funciona | O que não funciona | Usar hoje? |
|---|---|---|---|---|
| Keshas-dev/AMD-BC-250-PSP-Driver | Driver kernel do PSP (WIP) | Dá boot na SOS firmware, R/W de registradores BAR5, unlock do NBIO, proxy de registradores | Criação do ring da GPU, carga de FW, init da TMR | Não — só infraestrutura básica |
| Keshas-dev/AMD-BC-250-Windows-Driver | Driver de GPU (WIP) | Carrega junto do driver do PSP | Sem 3D utilizável | Não |
| ZEROAESQUERDA/BC250-windowsDriverTest | Referência WDDM 2.0 | Estrutura do modelo de driver, D3D9 DDI presente | Compilação de shaders, D3D11/12, Vulkan, VCN | Não — educacional |
| Adrenalin / Pro / `.inf` da W5700 | AMD oficial | — | **Code 43**, nada | Não |

**Conclusão:** ninguém está jogando no Windows numa BC-250 hoje. O trabalho é real e está acelerando, mas está no estágio de "conseguimos fazer a GPU inicializar de algum jeito", não no estágio de "qual é meu FPS no Cyberpunk".

---

## Se mesmo assim você quiser testar os drivers WIP

Isto é para entusiastas que querem **ajudar a testar**, não para conseguir um desktop funcional. Você vai precisar de:

- **Windows 10 (build 1607+) ou Windows 11, x64.**
- **Test signing habilitado** e **Secure Boot desabilitado** (estes drivers são não assinados/test-signed):
  ```
  bcdedit /set testsigning on
  ```
  Reinicie. ⚠ verifique — os passos exatos seguem o README de cada repositório; os comandos aqui são o fluxo padrão de test-sign do WDK, não copiados de um script de projeto.
- Instale via o **script PowerShell** fornecido pelo repositório (ex.: `Install-Driver.ps1`) ou manualmente com `pnputil`. Siga o **README do repositório**, não esta página — estes projetos mudam rápido e os passos de instalação acompanham.

Espere: na melhor das hipóteses o dispositivo é enumerado e logs de init inicial aparecem; na pior, nada muda ou você recebe um código de erro diferente. **Faça backup de tudo que importa e assuma que não vai renderizar.**

### ⚠ Rumor não verificado: "vazar drivers brica a placa"

Durante a fase inicial de beta-test em 2025, um membro avisou que **BC-250s estavam sendo bricadas remotamente por vazar drivers pré-lançamento** — alegando relatos no Reddit de bricking, bloqueios remotos de dispositivo, e que nem um programador de hardware conseguia desbloqueá-las. ([src](https://t.me/c/2424231195/26231)) **Não conseguimos verificar isso**, e todo o enquadramento de "beta privado" em volta disso é duvidoso (veja a próxima seção). Mencionado por completude; não trate como fato estabelecido. Se você bricar uma placa por motivos não relacionados, veja [08-bios.md](08-bios.md) para recuperação.

---

## Trotes, piadas e becos sem saída — não caia nessas

O hype em torno de drivers de Windows na BC-250 tem um longo histórico de **pegadinhas e pensamento mágico**. Conheça os casos famosos para não perder um fim de semana:

- **O "driver NVIDIA para AMD BC-250".** Uma piada de **Dia da Mentira (1 de abril de 2026)** — um banner falso e caprichado "NVIDIA NEW DRIVER RELEASE … for AMD BC-250" que brevemente fez as pessoas perguntarem *"a NVIDIA lançou mesmo um driver de Windows para BC-250?!"* ([src](https://t.me/c/2424231195/130053)) Não lançou. A NVIDIA não faz drivers para um APU da AMD. A reação no chat foi *"a piada tão esperada chegou."* ([src](https://t.me/c/2424231195/130727)) Note também que um `.exe` nomeado como `whql-amd-software-adrenalin-edition-25.5.1-...-bc250.exe` circulou por aí — um instalador normal do Adrenalin com "bc250" colado no nome do arquivo **não** o torna um driver de BC-250. ([src](https://t.me/c/2424231195/73924))
- **"É só forçar a instalação do driver de uma placa parecida."** RX 6700 / W5700 / Radeon Pro V340 — a primeira ideia de todo novato, e já ocorreu a *"todo tolo que algum dia segurou uma BC-250."* Não pode funcionar, por uma pilha de razões que não vale a pena re-derivar: **não há drivers de Windows, não há honra, e não há cerveja na BC-250.** ([src](https://t.me/c/2424231195/29710))
- **Malware no canal.** Pessoas postaram "drivers" falsos que eram vírus/zip-bombs/phishers. Os mods banem na hora; um arquivo literalmente chamado `Trojan.txt` apareceu uma vez. ([src](https://t.me/c/2424231195/49668)) **Só rode binários dos repositórios GitHub nomeados, e leia o código.**

---

## E aquele script de unlock dos 40 CUs que as pessoas mencionam?

`git clone https://github.com/duggasco/bc250-40cu-unlock.git` aparece em conversas sobre Windows, e a lista mestra de recursos até o marca em "Windows". **É um patch/script de kernel `amdgpu` para Linux** (`bc250-enable-40cu.sh`), não uma ferramenta de Windows — ele desbloqueia todos os 40 CUs no driver de Linux. É coberto adequadamente em [09-overclock-undervolt.md](09-overclock-undervolt.md); não faz nada para Windows. ⚠ verifique (nenhum histórico de shell no corpus de Comandos confirma um uso em Windows; o único comando capturado é o `git clone` simples acima).

---

## Recomendação

| Você quer… | Faça isto |
|---|---|
| Jogar / realmente usar a placa agora | **Instale Linux.** Veja [06-linux.md](06-linux.md). O driver de GPU funcional só existe lá. |
| Acompanhar / contribuir com o esforço de Windows | Acompanhe **Keshas-dev** (driver PSP + GPU) e **ZEROAESQUERDA/BC250-windowsDriverTest**; espere trabalho de kernel/WDK, não jogos. |
| Um `.inf` mágico ou driver de "placa parecida" | Não existe. Pare por aqui — você só vai bater no Code 43. |

O suporte a Windows é um **alvo móvel**: confira de novo as datas dos commits do repositório e a data desta seção (isto reflete o **início de 2026**) antes de agir. O veredito de 2025 era "nunca"; 2026 rebaixou isso para "ainda não" — progresso real, mas progresso na camada de init de firmware, não na camada de desktop jogável.

---

## Fontes

- Aviso fixado para novatos ("abandonai toda esperança") — https://t.me/c/2424231195/28109
- Tentativas de Code 43 / `.inf` da W5700 / mod de BIOS — https://t.me/c/2424231195/57123 · https://t.me/c/2424231195/94029
- "Sem drivers de Windows, sem honra, sem cerveja" — https://t.me/c/2424231195/29710 · por que Linux e não Windows — https://t.me/c/2424231195/13210
- Passthrough em VM não funciona — https://t.me/c/2424231195/64772
- Primeiro driver "funcional" (OpenGL 1.1) e reação — https://t.me/c/2424231195/83320 · https://t.me/c/2424231195/83332 · dump de driver `00.00.01` — https://t.me/c/2424231195/83322
- Projeto da ZEROAESQUERDA fixado / "gelo quebrando" — https://t.me/c/2424231195/123644
- "Driver NVIDIA" de Dia da Mentira — https://t.me/c/2424231195/130053 · https://t.me/c/2424231195/130727 · `.exe` do Adrenalin mal-rotulado — https://t.me/c/2424231195/73924
- Política de banimento de malware — https://t.me/c/2424231195/49668 · rumor de brick-por-vazamento (não verificado) — https://t.me/c/2424231195/26231
- Repositórios — [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) · [Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver) · [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) ([known limitations](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas))
- Tópico do fórum da AMD (não deu em nada) — https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692
- Unlock de 40 CUs (Linux, mal-rotulado como Windows) — https://github.com/duggasco/bc250-40cu-unlock → veja [09-overclock-undervolt.md](09-overclock-undervolt.md)

> O unlock de 40 CUs, o governor e a configuração do driver de Linux vivem em [06-linux.md](06-linux.md) e [09-overclock-undervolt.md](09-overclock-undervolt.md). Recuperação de brick: [08-bios.md](08-bios.md).
