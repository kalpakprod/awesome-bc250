> 🌐 社区翻译。英文版为权威来源，可能更新更及时。发现错误？请提交 issue：[English](../en/11-gaming.md) · https://github.com/lildebil0/awesome-bc250/issues

# 游戏结果与设置

> **太长不看** —— BC-250 是**一颗 PS5 级 GPU 被栓在一颗削减的 6 核 Zen2 上**。这颗 GPU 确实有能力：在真实世界的 **2000 MHz** 超频下，它能以 **40–60 FPS** 跑现代 3A 大作，更轻/更老的游戏远超 60。陷阱是 **CPU**。这颗 APU 的 Zen2 那一半比 GPU 更常成为瓶颈 —— 社区跑分反复显示这块卡坐在 **~36–47% GPU 负载却被钉在 ~38 FPS**，受 CPU 限制。所以：**先超频**（原厂 ~1500 MHz 慢约 30%），依靠 **FSR** 和帧生成，瞄准 **1080p–1440p**，并接受物理密集或线程化糟糕的游戏无论分辨率都会卡顿。主机风格的第一方移植（《战神》《地平线》《最后生还者》《蜘蛛侠》）是甜点位。

本节设定预期，并汇集社区真实、已发布的结果 —— 其中许多是跑分截图。数字随时钟、发行版、驱动和 VRAM 划分而变，所以每一行都绑定到它的来源。

---

## 首先要理解的一件事：它是 CPU 受限

BC-250 的 GPU 是一颗 PS5 衍生的 RDNA2 部件（RADV 把它报告为 `GFX1013` / NAVI10 级）。在大多数游戏里它*不是*弱环节。弱环节是那颗以 ~3.5 GHz 运行、带 PS5 风格削减缓存、没有富余 SMT 余量的 **6 核 Zen2 CPU**。

一份 **1080p、高画质、GPU @ 2000 MHz / 内存 @ 3600 MHz** 的社区跑分把这点具体化了：该运行**"达到 38 FPS"**，而 **GPU Limited Percentage 仅 36.5%** —— CPU 模拟线程是瓶颈（每阶段表上 CPU sim ~70 / CPU render ~43 / GPU ~47）。GPU 在三分之一容量上闲着，而 CPU 把帧率压下去。（[来源](https://t.me/c/2424231195/136242)）

实际后果：

- **分辨率常常是"免费的"。** 因为你受 CPU 限制，从 1080p 到 1440p（甚至带 FSR 的 4K）通常损失很少 FPS —— GPU 本来就有富余余量。下面几个 4K 结果看起来几乎和它们的 1080p 对应一样好，正是因为这个原因。
- **升频比在普通 PC 上帮助更少。** FSR 卸载 GPU，但如果 CPU 是限制者，降低渲染分辨率不会大幅提升你的 FPS。把 FSR 用于画质/热量，而非当作一个魔法 FPS 按钮。
- **线程化糟糕或物理密集的游戏会惩罚你。** 卡顿和帧时间尖峰（《哥特王朝重制版》、修复前的《毁灭战士：黑暗时代》）来自 CPU，不是 GPU。
- **无论如何还是给 GPU 超频** —— 当一个游戏*确实*受 GPU 限制时（4K、重度光追、线程化良好的引擎），1500 → 2000 MHz 是 ~+30% FPS。怎么做到见 [09-overclock-undervolt.md](../en/09-overclock-undervolt.md)，并先做 [04-cooling.md](../en/04-cooling.md)，因为 2000 MHz 需要散热改造。

---

## 真正起作用的设置

- **时钟。** 原厂 GPU ~1500 MHz 是缓慢的默认值；社区把 **GPU 2000 MHz、内存 ~1900–2000 MHz** 作为日常目标，有些人在 dGPU 级构建上推到 **2.65 GHz 核心**。原厂 vs 2000 MHz 在 GPU 受限场景里大致是 **+30% FPS**。（[超频指南](../en/09-overclock-undervolt.md)）
- **40 CU 解锁。** 板卡出厂时禁用了部分 CU。解锁全部 **40 个 CU** 给出可测、广泛的提升 —— 一位用户报告《毁灭战士：黑暗时代》从崩坏变成 **60 FPS 高画质**，一个"007"游戏 **60 FPS 高画质**，以及解锁后《Great Pragmata》更稳的帧时间。（[来源](https://t.me/c/2424231195/141193)）见 [09-overclock-undervolt.md](../en/09-overclock-undervolt.md)。
- **FSR / FSR 4。** 在 1440p/4K 用 Quality 或 Balanced 来喂饱 GPU 并降温。社区正在积极移植 **FSR 4**（线程内分享了 DLL 包）。（[FSR4 INT8 讨论 来源](https://t.me/c/2424231195/136354)）elektricM 测得的 FSR 收益：**Quality +20–30%、Balanced +30–40%、Performance +40–60%** FPS；**帧生成大致能翻倍**帧率（轻微延迟）。**经 Optiscaler 的 FSR 4** —— 社区发现 **Balanced 优于原生 FSR 3.1.5 Quality**。（[elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/)）
  - **实际该用哪个升频器：** **FSR 1–3 是这里的实用选择** —— 它成熟、便宜、支持良好。**FSR 4 和 XeSS *技术上能*跑**在这颗 RDNA2 硅片上，经由 **DP4a（INT8）路径** —— RDNA2 有 dp4a/Rapid Packed Math，所以 OptiScaler 的 FSR 4 INT8 构建和 GPU 无关的 XeSS-DP4a 变体都能加载 —— 但在一颗这么弱的 GPU 上它们**慢且实验性**：DP4a 回退比新卡用的 WMMA 路径重 ~10–20%，而 XeSS-DP4a 的画质低于 XMX 版本。把 FSR 4 / XeSS 当作可以折腾的东西，而非你的日常驾驶。（[OptiScaler FSR4 INT8 on RDNA2 — VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/)）**官方 AMD FSR 4 给 RDNA2（RX 6000 级）大约在 2027 年初落地**；在那之前是 OptiScaler/魔改路线。（[Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals)）
- **超越 FSR 的帧生成 —— LSFG。** **Lossless Scaling 帧生成（LSFG）** 在 Linux 上通过 **`lsfg-vk`** Vulkan 层运行（[github.com/PancakeTAS/lsfg-vk](https://github.com/PancakeTAS/lsfg-vk)） —— 一个游戏无关的帧生成层，钩住任何 Vulkan 游戏。社区用它在没有内置帧生成的游戏里**大致翻倍 FPS**（例如 30 → 60）。像所有帧生成一样它增加延迟，并想要一个合理的真实帧率来插值，但当 FSR 自己的 FG 不可用时它是一个真正的选项。
- **VRAM 划分（UMA）。** 它是一个统一的 16 GB 池。在一次细致的扫描里（1440p、1850 MHz），GDDR6 划分（512 MB vs 8 GB 预留）**几乎不改平均 FPS** —— 但一个太小或错误的 UMA 设置会把你掉进软件渲染（`llvmpipe`）或挂起一个跑分。Auto / 一个合理的预留就行；别想太多。（[来源](https://t.me/c/2424231195/81203)）
- **关 VSync** 用于跑分；**开帧生成**（在提供处） —— 它帮助《悟空》达到三位数平均（见下文）。
- **`mitigations=off`**（内核启动标志）是一个常见微调；在 VRAM 扫描里它对 FPS 只有微小、嘈杂的影响。当作小的。⚠ **验证（幅度有争议）** —— elektricM 报告大得多的收益（**赛博朋克 +18 FPS，他们提示里"+10–15%"**）。它显然取决于游戏：在某些 CPU 受限的游戏里大，在其他里可忽略。试试并测量；别假设任一数字。（[elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/)）

---

## 人们实际发布的结果

这些是带设置和来源的社区报告数字。**跑分分数和 FPS 按发布原样** —— 各行的时钟/发行版/驱动不同，所以读情境列，别盲目比较。

| 游戏 | 设置（分辨率 / 预设 / 升频） | 结果 | 硬件 / 时钟 | 来源 |
|------|--------------------------------------|--------|-------------|--------|
| **黑神话：悟空**（跑分） | 1080p，高，FSR + 帧生成开 | **平均 96**（最低 78，最高 113） | BC-250，Windows，RADV NAVI10 | （[来源](https://t.me/c/2424231195/10069)） |
| **黑神话：悟空**（跑分） | 1440p，中，无 FSR | **平均 ~48**（最高 56） | BC-250，1850 MHz，Linux | （[来源](https://t.me/c/2424231195/81203)） |
| **古墓丽影：暗影**（跑分） | 1440p，最高 | **平均 ~70** | BC-250，1850 MHz | （[来源](https://t.me/c/2424231195/81203)） |
| **漫威银河护卫队**（跑分） | 1440p，高 | **平均 ~70**（最高 89，最低掉到 ~3） | BC-250，1850 MHz | （[来源](https://t.me/c/2424231195/81203)） |
| **消逝的光芒 2**（跑分） | 1440p，高，无 VSync | **平均 ~48**（最高 62） | BC-250，1850 MHz | （[来源](https://t.me/c/2424231195/81203)） |
| **赛博朋克 2077**（跑分） | 1440p，光追**最低** | **平均 ~36**（最低 30） | BC-250，1850 MHz | （[来源](https://t.me/c/2424231195/81203)） |
| **印第安纳琼斯与古老之圈** | 1440p，低，无升频器 | **45** | BC-250，GPU ~1900 MHz，Vulkan | （[来源](https://t.me/c/2424231195/36931)） |
| **印第安纳琼斯与古老之圈** | 1440p，中，升频器开 | **60** | BC-250 | （[来源](https://t.me/c/2424231195/36931)） |
| **极限竞速：地平线 5** | **4K**，高预设，**无 FSR** | 可玩（视频） | BC-250 | （[来源](https://t.me/c/2424231195/81891)） |
| **巫师 3** | 4K，中，FSR Balanced | **~50** | BC-250 | （[来源](https://t.me/c/2424231195/81894)） |
| **天国：拯救 II** | 4K，中/高，FSR Quality | **~30**（"PS5 体验"） | BC-250 | （[来源](https://t.me/c/2424231195/81893)） |
| **最后生还者 第二部** | 1080p，默认预设 | 可玩（视频） | BC-250 | （[来源](https://t.me/c/2424231195/94237)） |
| **毁灭战士：黑暗时代** | 高 | **60**（40 CU 解锁 + 修复后） | BC-250，40 CU | （[来源](https://t.me/c/2424231195/141193)）· [Reddit 修复](https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/) · [Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS) |
| **毁灭战士：永恒** | RT 开（社区报告） | **60 + RT** | BC-250；社区报告（r/BC250Gaming） | （[Reddit 综合](https://www.reddit.com/r/BC250Gaming/)） |
| **铁拳 8** | （社区报告） | **~60** | BC-250；社区报告（r/BC250Gaming） | （[Reddit 综合](https://www.reddit.com/r/BC250Gaming/)） |
| **街头霸王 6** | （社区报告） | **~60** | BC-250；社区报告（r/BC250Gaming） | （[Reddit 综合](https://www.reddit.com/r/BC250Gaming/)） |
| **剑星** | （社区报告） | **~70–80** | BC-250；社区报告（r/BC250Gaming） | （[Reddit 综合](https://www.reddit.com/r/BC250Gaming/)） |
| **生化危机 安魂曲** | 帧生成开（社区报告） | **60 → 100**（FG） | BC-250；社区报告（r/BC250Gaming） | （[Reddit 综合](https://www.reddit.com/r/BC250Gaming/)） |
| **生化危机 安魂曲** | （视频） | 可玩 | BC-250，CPU 原厂，**GPU 2000** | （[来源](https://t.me/c/2424231195/121772)） |
| **哥特王朝重制版** | 中 | **卡顿** —— "没有优化" | BC-250 | （[来源](https://t.me/c/2424231195/142708)） |
| **Hi-Fi Rush** | （视频，OBS 捕获） | 流畅 | BC-250，`mitigations=off` | （[来源](https://t.me/c/2424231195/91022)） |
| **赛博朋克 2077** | 1080p，高，FSR Quality，**无 RT** | **70–90** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **赛博朋克 2077**（跑分） | 1080p（原厂 2000 MHz / 1000 mV） | **57.66** → **60.82** 超频（2230 MHz）；`mitigations=off` **+18** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **最后生还者 第一部** | 1080p，中高 | **60**（稳定） | BC-250 —— 着色器编译期间 90–100 °C；有些音频咔哒声 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **鬼泣 5** | 1080p，高 | **100**（最低延迟，~10 ms） | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **底特律：化身为人** | 1080p，中 | **60**（封顶） | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **控制** | 1080p，全 **RT** | **40** | BC-250 —— 适合入门级 RT | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **英雄连 3** | 1080p | 可玩 —— **需要 4 GB VRAM 划分**（512 MB 伪影/崩溃） | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **荒野大镖客 2**（跑分） | 用 `-useMaximumSettings` 标志 | **45+** 最低 | BC-250 —— 可能检测到错误的 GPU 适配器，手动设置 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **CS2** / **火箭联盟** / **艾尔登法环** | 1080p | **100+** / **120+** / **60** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **绝地潜兵 2** | 1080p，低（报告） | **≈82** | BC-250，原厂，单 Noctua NF-P12 —— GPU 73 °C / CPU 76 °C；⚠ ASR | （["Temps Shocked Me"](https://youtu.be/d7Hwqxn9yg8) ~5:08） |
| **潜行者 2** | 中（报告） | **≈80** | BC-250 —— 作者标注 CPU 受限 / 8 GB RAM；⚠ ASR | （[RU 评测](https://youtu.be/19l03qneKJ4) ~0:23） |
| **潜行者 2** | QHD (2560×1600)，FSR Quality + 帧生成，补丁 1.21（报告） | **57–70**（1080p，无 FG **≈45**） | BC-250；⚠ ASR | （[RU 评测](https://youtu.be/19l03qneKJ4) ~18:52） |
| **Arc Raiders** | 1080p（报告） | **≈56–80** | BC-250，原厂；⚠ ASR | （[Temps Shocked Me](https://youtu.be/d7Hwqxn9yg8) ~5:58） |
| **蜘蛛侠 2** | 1080p，高，FSR 帧生成（报告） | 平均 **≈100**（原生低于 60） | BC-250；⚠ ASR | （[ETA Prime](https://youtu.be/q_CxcbS5HI8) ~11:04） |
| **极限竞速：地平线 5** | 1080p，中，无 FSR（报告） | **70–95** | BC-250；⚠ ASR | （[ETA Prime](https://youtu.be/q_CxcbS5HI8) ~12:19） |
| **地铁：离去** | QHD，高（报告） | **≈58** | BC-250；⚠ ASR | （[RU 评测](https://youtu.be/19l03qneKJ4) ~14:12） |
| **幻兽帕鲁** | 1080p，中高（报告） | **<60**（可玩） | BC-250；⚠ ASR | （[Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:04） |
| **荒野大镖客 2** | 1080p，中高，FSR Quality（报告） | **稳定 60** | BC-250；⚠ ASR | （[Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:19） |
| **求生之路 2** | 1080p，最高（报告） | **>150** | BC-250；⚠ ASR | （[ETA Prime](https://youtu.be/q_CxcbS5HI8) ~10:18） |
| _参考：独显构建_ | RE 引擎跑分，1080p，高，无 RT | **平均 67.99**（最低 58，最高 82） | **RX 6600** + Xeon E5-2667v4，Win10 | （[来源](https://t.me/c/2424231195/116494)） |

> RX 6600 那一行**不是 BC-250 结果** —— 是一位成员在同一机箱/CPU 上跑一张独显作为对照点。包含进来是为展示*仅 CPU* 能撑住什么。

> ⚠️ **艾尔登法环 —— 结果不一。** 上面 ~60 FPS（elektricM，1080p）并非普适：一个社区构建**在高画质被锁死 30 FPS，甚至在 720p 低画质也达不到 60**（CPU 受限）。把 60 当作最好情况，不是保证。（[Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:50）

### 第一方 / 主机移植 —— 甜点位

这些跑得够好，一位成员干脆把它们列为"能用"（PS 风格移植依赖 GPU 且优化良好，这适合这块板卡）：

> Days Gone · 死亡搁浅 · DIRT 5 · 对马岛之魂：导演剪辑版 · 战神（2018） · 战神：诸神黄昏 · 地平线 西之绝境 · 地平线 零之曙光 · 最后生还者 第一部 · 最后生还者 第二部 重制版 · Returnal · 神秘海域：盗贼遗产合集

（[来源](https://t.me/c/2424231195/99563)）

---

## 已知有问题的游戏（不工作 / 需要变通）

elektricM 跟踪我们没覆盖、且**失败或与平台较劲**的游戏 —— 买之前先查：

| 游戏 | 问题 | 变通 |
|------|---------|-----------|
| **堡垒之夜** | Easy Anti-Cheat **不支持 Linux** | **无 —— 在 Linux BC-250 上无法运行** |
| **无畏契约** | 内核级反作弊 | Linux 上有技术问题；实际上不行 |
| **万智牌：竞技场** | 专门在 **Fedora** 上崩溃/冻结 | 在 **Manjaro / Bazzite** 上更好；试试其他 Proton |
| **最终幻想 VII 重生** | "DX12 is not supported on your system"（GPU 兼容性检查） | **暂无修复** |
| **黑神话：悟空**（破解版） | "CreateProcess() returned 2"（反篡改） | 使用**未修改的游戏文件** |

（反作弊状态随时间变化 —— 交叉核对 [areweanticheatyet.com](https://areweanticheatyet.com) 和 [protondb.com](https://www.protondb.com)。）（[elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/)）

### 被缺失的 GPU 特性硬性阻挡（不可修复）

这是 **RDNA 2 级硅片**（GFX1013）。少数较新的游戏**硬性要求 RDNA 2 没有的 GPU 特性** —— 主要是 **mesh shader** 和 **硬件可变速率着色（VRS）** —— 并拒绝运行。缺失的硅片是一个**硬件限制，而非驱动 bug**：没有 Mesa 更新、内核参数或 Proton 版本能加上该特性本身。**Mesh shader** 是一堵真正的墙。一个 **VRS** 要求有时只是一个启动时检查，一个用户态 Vulkan 层能把它桩掉（见下面的毁灭战士注解） —— 所以它并不总是致命。确认的例子（[r/linux_gaming 社区帖](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)）：

| 游戏 | BC-250 缺失的硬性要求 |
|------|------------------------------------|
| **最终幻想 VII 重生** | **Mesh shader** —— 不能运行（这也是它在上表里触发 DX12 GPU 兼容性检查的原因） |
| **毁灭战士：黑暗时代 —— 更新 2** | **Vulkan fragment shading rate**（硬件 VRS） —— 更新 2 让 VRS *在启动时*成为强制；GPU 没有它，所以未修改的游戏不再启动（更新 2 之前的构建在 40 CU 解锁后以 60 FPS 运行，见上文）。**存在变通** —— 见下面的注解。 |

> **毁灭战士：黑暗时代 更新 2 —— 现在有变通了。** 游戏只在启动时*检查* VRS；它从不在玩法中真正需要它。**`bangstk/Vulkan_NullVRS`** Vulkan 层（[github.com/bangstk/Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS)）拦截 `vkCmdSetFragmentShadingRateKHR()` 并将其变为空操作，满足启动检查，让游戏在无游戏内副作用的情况下运行。所以毁灭战士：黑暗时代**不是**永久硬阻挡。**Mesh shader 不同** —— FF7 重生的 mesh-shader 要求没有等价的垫片，所以那个真的不能运行。

> 买一个全新 3A 大作之前，查它是否把 mesh shader 或硬件 VRS 列为要求。**Mesh shader** 在这里是一堵真正的硬件墙（无变通）。一个**硬件 VRS** 要求常常只是一个启动时关卡 —— 有时能垫掉（如上面的毁灭战士），有时不能 —— 所以在假设任一方向之前查一下社区。

## 光线追踪 —— 实际测试了什么

BC-250 有**真正的 RDNA2 硬件 RT**（不是软件模拟，前提 Mesa 25.2+）。按 elektricM 测试过的 RT 游戏：

| 游戏 | 分辨率 | FPS | 备注 |
|------|-----|-----|-------|
| 赛博朋克 2077 | 1080p | 50–60 | 仅 RT 光照，FSR Quality |
| 控制 | 1080p | 40 | 全 RT |
| 传送门 2 RTX | 720p | 40 | Mesa 25.2+ 中的软件 RT 路径 |
| 半衰期 2 RTX | 720p | 20–30 | 非常吃配置 |

RT 在这里是入门级 —— 在优化良好的游戏里做*仅光照*没问题，做不了完整路径追踪负载。（[elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/)）

## Proton 与启动选项（Linux）

- **Proton 版本：** 从 **Proton GE**（最佳兼容性）或 **Proton Experimental** 开始；按游戏回退到稳定的 **8.0 / 9.0**。经 **ProtonUp-Qt**（`protonup-qt`）安装 GE。有些游戏只在某个特定版本工作 —— 一个失败就测试。（[elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/)）
- **值得知道的 Steam 启动选项：**
  - `mangohud %command%` —— FPS/温度叠加。
  - `RADV_DEBUG=nohiz %command%` —— 强制 RADV / 修复一些故障。
  - `gamemoderun %command%` —— 为该会话把 CPU 调速器调到 performance（帮助这块 CPU 受限的板卡）。
  - 组合：`RADV_DEBUG=nohiz mangohud gamemoderun %command%`。
- **每游戏 VRAM（UMA 划分）：** 电竞/独立游戏在 **512 MB** 上没问题；**大多数游戏想要 4 GB**；3A/RT 还想要额外 VRAM 内核参数（`amdgpu.gttsize=...`，见 [06-linux.md](../en/06-linux.md) / [08-bios.md](../en/08-bios.md)）。一个太小的划分导致伪影、崩溃，或掉进软件渲染。（[elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/)）
- **首次运行卡顿**通常是**着色器编译** —— 在评判 FPS 之前让 Steam 完成预编译；更大的着色器缓存有帮助。（[elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/)）
- **每游戏修复**（社区报告，r/BC250Gaming —— 如果你撞上这些确切 bug 就试）：
  - **生化危机 安魂曲 —— 头发损坏/故障：** 在启动选项里加 `RADV_DEBUG=nohiz %command%`（上面列出的同一个 RADV 标志，在这里专门应用）。（[Reddit 综合](https://www.reddit.com/r/BC250Gaming/)）
  - **蜘蛛侠 2 / 刺客信条：影 —— 冻结：** 据报告启用 **zswap**（压缩 swap）能停止冻结。（[Reddit 综合](https://www.reddit.com/r/BC250Gaming/)）

---

## 模拟

模拟器吃 CPU，所以结果不一，但有几个很扎实（[来源](https://t.me/c/2424231195/78988)）：

- **Switch —— Eden / Ryujinx：** 工作良好且快。社区报告（r/BC250Gaming）：**马里奥赛车 ~60 FPS**；**王国之泪 ~30–40 FPS**。✅（[Reddit 综合](https://www.reddit.com/r/BC250Gaming/)）
- **PS4 —— shadPS4 (0.9.0+)：** 《血源诅咒》跑得好无掉帧；有些游戏（《最后的守护者》）出伪影但保持稳定 FPS。✅
- **PS3 —— RPCS3：** 能用，但需要每游戏调整。⚠️ **已知怪癖**（社区报告，r/BC250Gaming）：一个模拟器 bug **把 GPU 锁在 1000 MHz** 在 RPCS3 下，所以 GPU 无法升频 —— 变通是**给 CPU 超频以补偿**丢失的 GPU 余量。（[Reddit 综合](https://www.reddit.com/r/BC250Gaming/)）
- **Xbox 360 —— Xenia Canary：** 菜单加载，玩法掉到黑屏（仍在调查）。❌

---

## 在哪看它运行（视频）

社区发布大量玩法/跑分视频。一些线程内捕获和频道：

- BC-250 玩法/跑分片段：[youtu.be/CYDv1SfD2Pc](https://youtu.be/CYDv1SfD2Pc) · [youtu.be/g3uWOfqcexA](https://youtu.be/g3uWOfqcexA) · [youtu.be/9fozmRrAouc](https://youtu.be/9fozmRrAouc) · [youtu.be/q64M2XzADjA](https://youtu.be/q64M2XzADjA) · [youtu.be/0LEkOG1yqqw](https://youtu.be/0LEkOG1yqqw)
- 社区测试游戏的跟踪表（FPS/设置）：[Google Sheet](https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing)

---

## 现实预期速查表

| 你想要… | 一台 2000 MHz、改造过的 BC-250 上的现实 |
|-----------|--------------------------------------|
| 1080p 3A，60 FPS | 有时 —— 取决于 CPU 负载。FSR + 帧生成有帮助。更老/更轻的 3A：可以。 |
| 1440p 3A | 大多数移植 40–60 FPS；GPU 在这里有余量。最值的分辨率。 |
| 4K 3A | 优化良好/主机移植里带 FSR 30–50 FPS（极限竞速、巫师 3、天国拯救 II）。 |
| 光线追踪 | 仅在最低、低 FPS（赛博朋克 ~36 @ 1440p RT-最低）。不是板卡的强项。 |
| 处处锁定 60 | 不。CPU 受限和物理密集的游戏无论设置都会掉/卡顿。 |
| 第一方 PS 移植 | 甜点位 —— 这些是板卡做得最好的。 |

---

## 来源

- CPU 受限跑分（38 FPS，36.5% GPU） —— https://t.me/c/2424231195/136242
- 大 VRAM/时钟跑分表（悟空、古墓丽影、消逝光芒 2、赛博朋克、护卫队） —— https://t.me/c/2424231195/81203
- 悟空 1080p 高 FSR+FG，平均 96 —— https://t.me/c/2424231195/10069
- 印第安纳琼斯古老之圈，多分辨率 —— https://t.me/c/2424231195/36931
- 极限竞速地平线 5 4K —— https://t.me/c/2424231195/81891 · 巫师 3 4K —— https://t.me/c/2424231195/81894 · 天国拯救 II 4K —— https://t.me/c/2424231195/81893
- 40 CU 解锁结果（毁灭战士黑暗时代 60 FPS） —— https://t.me/c/2424231195/141193 · 毁灭战士修复 —— https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/
- 最后生还者 II 1080p —— https://t.me/c/2424231195/94237 · 生化危机安魂曲 —— https://t.me/c/2424231195/121772 · 哥特王朝重制版卡顿 —— https://t.me/c/2424231195/142708
- 第一方移植列表 —— https://t.me/c/2424231195/99563
- 模拟综述 —— https://t.me/c/2424231195/78988
- RX 6600 独显对照运行 —— https://t.me/c/2424231195/116494
- elektricM 游戏兼容性（每游戏设置/FPS、问题游戏、RT 表、Proton & 启动选项、FSR 收益） —— https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/
- YouTube FPS 捕获（自动字幕 / ASR —— 数字近似）：ETA Prime（蜘蛛侠 2、地平线 5、求生之路 2） —— https://youtu.be/q_CxcbS5HI8 · "Temps Shocked Me"（绝地潜兵 2、Arc Raiders） —— https://youtu.be/d7Hwqxn9yg8 · RU 评测（潜行者 2、地铁离去） —— https://youtu.be/19l03qneKJ4 · Pixels & Power（幻兽帕鲁、荒野大镖客 2、艾尔登法环 30 FPS） —— https://youtu.be/4S0DvIpqm0E
- Mesh-shader / 硬件 VRS 硬阻挡（FF7 重生、毁灭战士黑暗时代更新 2） —— [r/linux_gaming 帖](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- **毁灭战士：黑暗时代 VRS 变通 —— `bangstk/Vulkan_NullVRS`**（给 `vkCmdSetFragmentShadingRateKHR` 的空操作 Vulkan 层） —— https://github.com/bangstk/Vulkan_NullVRS
- **Linux 上的 LSFG 帧生成 —— `lsfg-vk`**（Vulkan 层） —— https://github.com/PancakeTAS/lsfg-vk
- **经 DP4a（INT8）在 RDNA2 上的 FSR 4 / XeSS** —— OptiScaler FSR4 INT8 构建：[VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/) · [OptiScaler FSR4 兼容性 wiki](https://github.com/optiscaler/OptiScaler/wiki/FSR4-Compatibility-List)
- **官方 AMD FSR 4 给 RDNA2（~2027 年初）/ RDNA3（2026 年 7 月）** —— [Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals)
- **社区报告的游戏结果（r/BC250Gaming）** —— 铁拳 8、街头霸王 6、剑星、生化危机安魂曲帧生成、毁灭战士永恒 RT、Switch（马里奥赛车 / 王国之泪）、RPCS3 1000 MHz GPU 锁定、生化危机安魂曲头发 / 蜘蛛侠 2 / 刺客信条影修复 —— https://www.reddit.com/r/BC250Gaming/
- 社区游戏测试表格 —— https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing

> 时钟和 40 CU 解锁在 [09-overclock-undervolt.md](../en/09-overclock-undervolt.md) 里；跑 2000 MHz 之前先做 [04-cooling.md](../en/04-cooling.md) 改造。
