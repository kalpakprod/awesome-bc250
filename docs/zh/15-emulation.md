# 模拟（Emulation）

> 🌐 社区翻译。英文版为权威来源，可能更新更及时。发现错误？请提交 issue：[English](../en/15-emulation.md) · https://github.com/lildebil0/awesome-bc250/issues

> **太长不看** —— BC-250 是一台出奇好用的模拟主机，因为它把一颗 PS5 级 RDNA2 GPU 配上 16 GB 高速 GDDR6 —— 但模拟是**重度 CPU 受限**的，而那颗削减的 **6 核 Zen 2**（约 3.5 GHz）就是高负载系统的天花板。**直到并包括 PS2 / GameCube / Wii / PSP / Dreamcast 在内的一切都是舒适区**（复古机轻松跑；PSP 经聊天确认能以 4× 内部分辨率运行）。**Switch / PS3 / PS4 吃力且时好时坏**，而 **Xbox 360 勉强能开机**。聊天里在板卡上经证实的：**经 Eden 的 Switch**"运行良好且快"，**经 RPCS3 的 PS3** 在逐游戏调校下可用，**经 shadPS4 的 PS4** 把《血源诅咒》跑得不错，**经 PPSSPP 的 PSP** 跑得很棒，而**经 Xenia 的 Xbox 360** 进游戏就坏。**先给板卡超频并散热** —— 没有调速器，GPU 在模拟器里会坐在约 1000 MHz 上憋死。（[来源](https://t.me/c/2424231195/78988)，[来源](https://t.me/c/2424231195/130879)）

这一页是深入剖析；[11-gaming.md](11-gaming.md) 在它的结果表里有简短版。ROM／密钥／BIOS 是你自己要合法获取的问题 —— 这里一概不涉及。

> **如何读状态列。** 这块板卡被讨论得并不均衡：少数几个系统在聊天里被第一手测试过，大多数复古系统没有。所以每一行都打了标签：
> - **✅ / ⚠️ / ❌（chat）** —— 某成员*在一台 BC-250 上*跑过它并报告了结果，附上引用的消息。
> - **(general ⚠)** —— **该类硬件（Zen 2 + RDNA2）最知名的 Linux 模拟器和通用预期**。**未在 BC-250 上测试过。**把它当作"应该没问题／应该很难"，绝不要当作一个实测的承诺。本页任何地方都没有编造 BC-250 专属的 FPS 数字。

---

## 模拟任何东西之前先做这两件事

模拟会放大板卡的两个怪癖，所以这里的前置条件比普通游戏更重要：

1. **先超频。** 一位在原厂板卡上尝试 Switch 模拟的成员发现，即便普通游戏频率正常，GPU 在模拟器里仍被钉在 **1000 MHz** —— 修复办法是在启动前手动把调速器设到它的最高频率。（[来源](https://t.me/c/2424231195/130879)）按 [09-overclock-undervolt.md](09-overclock-undervolt.md) 把 **oberon-governor** 跑到 **2000 MHz**（并考虑把 CPU 超频到 4 GHz）—— 模拟需要 CPU 能给的每一兆赫兹。
2. **先散热。** 2000 MHz 需要散热改造，否则板卡会降频／重启。在追求超频之前先做 [04-cooling.md](04-cooling.md)。

> **为什么 CPU 受限在这里如此要命。** 一个游戏引擎是为它随附的硬件调校的；而一个模拟器是在你的硬件上*模拟*另一台主机的 CPU，这每帧要重得多。在 BC-250 上，**约 3.5 GHz 的 6 颗 Zen 2 核心**（[硬件规格](https://elektricm.github.io/amd-bc250-docs/hardware/specifications/)）是 Switch／PS3／PS4 的限制因素 —— 那颗 PS5 级 GPU 通常还有富余。一位追求更好 Switch 性能的成员恰好看到了这一点：游戏里 **GPU 严重闲置而 CPU 是那堵墙**。（[来源](https://t.me/c/2424231195/136712)）更多核心帮不了模拟器的热线程；时钟频率和 IPC 才行。这就是 [11-gaming.md](11-gaming.md) 里描述的同一个 CPU 瓶颈，只是更尖锐。

---

## 上手 —— 三种安装方式

除了上面两个前置条件，这块板卡没有任何模拟专属的怪癖 —— 在模拟器看来它就是一台普通的 Linux PC。从以下三者中选一个：

- **EmuDeck** —— 一次到位拿到完整多系统配置的最快方式。它下载并预配置整套独立栈（RetroArch、PCSX2、Dolphin、DuckStation、PPSSPP、melonDS、Ryujinx……），接好手柄，并已确认在板卡上能用（"EmuDeck 随附的那个 Ryujinx 也不错"）。（[来源](https://t.me/c/2424231195/99039)）它面向 Steam Deck / Linux，正好契合 BC-250 典型的 Bazzite/CachyOS/Arch 安装（[06-linux.md](06-linux.md)）。**RetroDECK**（一个 Flatpak 容器化的等价物）是同样的思路，如果你更喜欢一个沙盒化的单一应用。
- **RetroArch** —— 一个前端，许多"核心"（作为插件的模拟器）。从 8/16/32 位一直到 PS1/N64/DS 的一切都很理想 —— 装一次，加上下面的核心，把它指向你的 ROM。在每个 BC-250 发行版上都有 Flatpak。
- **独立模拟器** —— 对于重型系统（Switch、PS3、PS4、PS2、GameCube/Wii、Xbox），专用的独立应用在功能和兼容性上胜过 RetroArch 核心。**尽量装原生 Linux 构建** —— 早期 BC-250 测试显示原生构建（Ryujinx）比通过 Proton 跑的 Windows 构建表现更好。（[来源](https://t.me/c/2424231195/23577)）大多数在 Flathub 或 Arch AUR 上（例如 `paru -S cemu`）。（[来源](https://t.me/c/2424231195/74138)）

然后**通过 Steam 启动**（"添加一个非 Steam 游戏"）以获得手柄支持和一个覆盖层 —— 这跟聊天里其他一切用的是同一套流程（见 [11-gaming.md](11-gaming.md)）。

> **想要一个专门的模拟发行版？** **Batocera**（一个现成的模拟发行版 + 前端）已被**社区确认在 BC-250 上运行**（[r/linux_gaming 社区帖](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)）—— 启动它而不是桌面 Linux，你得到的是一台主机风格、即插即用的模拟主机，而不用一个个去装模拟器。它在 [06-linux.md](06-linux.md) 里被列为一个确认能启动的发行版。同样的超频 + 散热前置条件仍然适用。

> **盯着调速器。** 如果一个模拟器跑得慢，在怪罪模拟器之前先检查你的频率：它可能正坐在 1000 MHz。启动前把 oberon-governor 设到它的最大值（有些人把它钉在约 2250 MHz），然后用一个覆盖层验证（`amdgpu_top` / MangoHud）。（[来源](https://t.me/c/2424231195/130879)，[来源](https://t.me/c/2424231195/130955)）

> **没有预配置的模拟镜像。** 新人经常索要一个模拟器已配好的现成镜像。社区把一个共享的"配置好的 BC-250 镜像"视为禁忌 —— 自己照着指南配；板卡一旦超了频，这并不难。（[来源](https://t.me/c/2424231195/130845)，[来源](https://t.me/c/2424231195/130877)）

---

## 社区实际跑过什么

最有用的单一数据点，是一位成员在板卡上测了若干模拟器之后的总结（[来源](https://t.me/c/2424231195/78988)）：

- **Switch（Eden）** —— "运行良好且快。"
- **PS3（RPCS3）** —— 能用，但"逐个游戏需要单独调校"。
- **PS4（shadPS4 0.9.0）** —— 《血源诅咒》跑得不错，没有掉帧；《最后的守护者》开始出现伪影，但保持了稳定帧率。
- **Xbox 360（Xenia Canary）** —— 游戏菜单能启动，但玩法掉到黑屏（它仍然响应手柄）；未解决。

更多第一手确认：

- **Switch / Eden 是共识之选。** 当一位新人问该装哪个 Switch 模拟器时，答案很干脆：**"Eden 最像样。"**（[来源](https://t.me/c/2424231195/130842)）其他人也附和 **Eden 安装并工作正常**（[来源](https://t.me/c/2424231195/98942)），以及 **Eden 跑得很棒，EmuDeck 随附的那个 Ryujinx 也不错。**（[来源](https://t.me/c/2424231195/99039)）重型第一方大作仍然吃 CPU：一位玩**《王国之泪》于 Eden（配 NX Optimizer）的成员报告掉帧**。（[来源](https://t.me/c/2424231195/124216)）
- **PS4 / shadPS4** —— 一位成员**卖掉了他的实体 PS4，现在经 shadPS4 在 BC-250 上重玩《血源诅咒》**，说它"两下点击就启动"。（[来源](https://t.me/c/2424231195/38704)，[来源](https://t.me/c/2424231195/38706)）另一位确认 **Drive Club 在 shadPS4 上 100% 跑得动**。（[来源](https://t.me/c/2424231195/82128)）
- **PS3 / RPCS3** —— 除了那份总结，成员们报告了**《神秘海域》"帧率稳定，可玩"**（[来源](https://t.me/c/2424231195/74644)）以及一句干脆的 **"在 RPCS3 里跑得很棒。"**（[来源](https://t.me/c/2424231195/53601)）
- **PSP / PPSSPP** —— 被反复第一手运行并称赞：一位成员在板卡上以 **4× 内部分辨率**跑 **PPSSPP** 而没有热降频。（[来源](https://t.me/c/2424231195/101579)，[来源](https://t.me/c/2424231195/103218)，[来源](https://t.me/c/2424231195/111096)）

### 关于 Switch 模拟器历史的一则说明（Yuzu → Eden / Ryubing）

板卡上的 Switch 模拟经历了和其他地方一样的动荡。一份早期的现状快照发现 **Yuzu 和 Suyu 在启动时挂起**，而 **Ryujinx 能用**（原生构建）。（[来源](https://t.me/c/2424231195/23577)）Yuzu 在 2024 年被任天堂关停，它的继任者们接过了火炬：**Eden**（一个 Yuzu 分支）是 BC-250 社区之选，"运行良好且快"，而 **Ryujinx** 一脉作为社区 **Ryubing** 分支延续，在 2026 年仍在积极开发。注意任天堂对 Switch 模拟器穷追猛打并清扫密钥／下载链接 —— 2026 年 2 月它对 Eden 连同其他十几个分支发了 DMCA，所以预期你得去搜寻二进制文件和密钥两样。（[来源](https://t.me/c/2424231195/136649)）

---

## 完整兼容性表 —— 每一个平台

每个平台一行。**模拟器**是当前最佳的 Linux 选择；**BC-250 上的状态**在某成员测试过的地方是聊天引用的，否则是对 Zen 2 + RDNA2 硬件的通用预期（标记 `general ⚠`，**非 BC-250 实测**）。

### 任天堂

| 系统 | 最佳 Linux 模拟器 | BC-250 上的状态 | 说明 |
|--------|--------------------|------------------|-------|
| **NES / Famicom** | Mesen（或 FCEUmm）—— RetroArch 核心 | ✅ 轻松（general ⚠） | 8 位；随便一台土豆都能跑。无需 BC-250 报告。 |
| **SNES** | Snes9x（bsnes 求精确）—— RetroArch | ✅ 轻松（general ⚠） | Snes9x 又快又约 99% 兼容；想要逐周期精确就用 bsnes。 |
| **Game Boy / GBC** | SameBoy / Gambatte —— RetroArch | ✅ 轻松（general ⚠） | SameBoy 是精确之选。 |
| **GBA** | mGBA（独立或 RetroArch） | ✅ 轻松（general ⚠） | mGBA 是黄金标准。 |
| **N64** | simple64 / RMG（mupen64plus）；RetroArch 核心 | ✅ 容易（general ⚠） | simple64 已归档；其开发者转向了 **gopher64**（Rust）。RMG 或 gopher64 都行。在这颗 CPU 上很舒适。 |
| **DS** | melonDS（独立或 RetroArch） | ✅ 容易（general ⚠） | melonDS 早就取代了 DeSmuME。 |
| **3DS** | **Azahar**（Citra/Lime3DS 合并） | ✅ 应该容易（general ⚠） | Citra 被 DMCA 了；**Azahar** 是维护中的继任者。对这套硬件很舒适。 |
| **GameCube** | **Dolphin** | ✅ 应该跑得很棒（general ⚠） | Dolphin 成熟且有 Vulkan 加速。聊天里提到过（多窗口/CLI）但没贴第一手 FPS —— 当作容易，非实测。（[来源](https://t.me/c/2424231195/19715)） |
| **Wii** | **Dolphin** | ✅ 应该跑得不错（general ⚠） | 同一个 Dolphin 构建。对 BC-250 是舒适年代；聊天里未在 BC-250 上跑分。 |
| **Wii U** | **Cemu**（原生 Linux，开源） | ⚠ 有人问过，未确认 | 一位成员问起跑它（且 `cemu` 在 AUR 里），但**没贴出能用的 BC-250 结果**。Cemu 比 Dolphin 重 —— 自己验证。（[来源](https://t.me/c/2424231195/68253)，[来源](https://t.me/c/2424231195/74138)） |
| **Switch** | **Eden**（Yuzu 继任者） | ✅ 运行良好且快（chat） | 社区的头号之选。启动前把调速器设到最大。有些大作随附锁 30 FPS，需要一个 60 FPS 补丁（例如《塞尔达》）；重型第一方大作（TOTK）仍会掉帧 —— CPU 受限。（[来源](https://t.me/c/2424231195/78988)，[来源](https://t.me/c/2424231195/130842)，[来源](https://t.me/c/2424231195/124216)，[来源](https://t.me/c/2424231195/130887)） |
| **Switch** | **Ryujinx**（现为 **Ryubing** 分支） | ✅ 能用（chat） | 原生构建成功运行；EmuDeck 捆绑的 Ryujinx "也不错"。（[来源](https://t.me/c/2424231195/51606)，[来源](https://t.me/c/2424231195/99039)） |
| **Switch** | Yuzu / Suyu | ❌ 启动即坏 —— 遗留（chat） | 早期报告：开始游戏时挂起。Yuzu 已停产 —— 用 Eden。（[来源](https://t.me/c/2424231195/23577)） |

### 索尼

| 系统 | 最佳 Linux 模拟器 | BC-250 上的状态 | 说明 |
|--------|--------------------|------------------|-------|
| **PS1** | **DuckStation**（独立或 RetroArch） | ✅ 轻松（general ⚠） | DuckStation 是现代标准；增强特性白送。 |
| **PS2** | **PCSX2**（v2.x，Qt + Vulkan） | ✅ 应该跑得不错（general ⚠） | 98%+ 兼容性，经典的"容易模拟"目标。聊天里未在 BC-250 上第一手跑分 —— 但远在这套硬件的能力范围内。 |
| **PSP** | **PPSSPP** | ✅ 跑得很棒 —— 4× 分辨率（chat） | 第一手：以 4× 内部分辨率运行而不降频。板卡上最舒适的系统之一。（[来源](https://t.me/c/2424231195/101579)，[来源](https://t.me/c/2424231195/103218)，[来源](https://t.me/c/2424231195/111096)） |
| **PS Vita** | **Vita3K** | ⚠ 实验性（general ⚠） | Vita3K 是唯一的 Vita 模拟器，在哪儿都还很早期；预期逐游戏出问题。无 BC-250 报告。（聊天里一句"基本就是一台拉满的 PS Vita"说的是硬件，不是模拟器。（[来源](https://t.me/c/2424231195/86140））） |
| **PS3** | **RPCS3** | ⚠️ 能用，逐游戏调校（chat） | 现实目标里最折磨 CPU 的。报告过《神秘海域》"稳定、可玩"、"跑得很棒"；一位早期测试者遇到错误。需要逐个标题微调。社区有 PS3 演练视频。（[来源](https://t.me/c/2424231195/78988)，[来源](https://t.me/c/2424231195/74644)，[来源](https://t.me/c/2424231195/53601)，[来源](https://t.me/c/2424231195/13)） |
| **PS4** | **shadPS4**（0.9.0+；2026 年 0.16） | ✅ 《血源诅咒》/ Drive Club 可玩（chat） | "两下点击就启动。"《血源诅咒》流畅且不掉帧；Drive Club 100%；有些标题出伪影但保住 FPS。逐游戏而定。（[来源](https://t.me/c/2424231195/78988)，[来源](https://t.me/c/2424231195/38706)，[来源](https://t.me/c/2424231195/82128)） |

### 微软

| 系统 | 最佳 Linux 模拟器 | BC-250 上的状态 | 说明 |
|--------|--------------------|------------------|-------|
| **Xbox（初代）** | **xemu** | ⚠ 应该能用（general ⚠） | xemu 是 LLE，约 80% 的游戏可玩；原生 Linux AppImage。无 BC-250 报告 —— 但对这颗 CPU 是轻负载目标。逐游戏验证。 |
| **Xbox 360** | **Xenia**（原版） | ⚠️ 能开机，性能低（chat） | 普通 Xenia 能跑，但"原厂下性能贴地"—— 超频是强制的。（[来源](https://t.me/c/2424231195/23577)） |
| **Xbox 360** | **Xenia Canary** | ❌ 游戏内黑屏（chat） | 菜单能加载、手柄有响应，但玩法是黑屏。在 Linux 上 Vulkan 后端仍不完整。未解决。（[来源](https://t.me/c/2424231195/78988)） |

### 世嘉

| 系统 | 最佳 Linux 模拟器 | BC-250 上的状态 | 说明 |
|--------|--------------------|------------------|-------|
| **Master System** | Genesis Plus GX —— RetroArch | ✅ 轻松（general ⚠） | 一个核心覆盖 SMS/Genesis/Game Gear/SG-1000/Sega CD。 |
| **Genesis / Mega Drive** | Genesis Plus GX（BlastEm 求精确） | ✅ 轻松（general ⚠） | 对这套硬件轻松。 |
| **Game Gear** | Genesis Plus GX —— RetroArch | ✅ 轻松（general ⚠） | 同一个世嘉多核心。 |
| **Saturn** | **Mednafen/Beetle Saturn**（或 Kronos） | ✅ 应该没问题（general ⚠） | Saturn 以难模拟、吃 CPU 著称，但对 Zen 2 轻松。无 BC-250 报告。 |
| **Dreamcast** | **Flycast**（独立或 RetroArch） | ✅ 应该跑得不错（general ⚠） | Flycast 成熟且轻；对这套硬件很舒适。聊天里未跑分。 |

### 其他 / 街机 / 计算机

| 系统 | 最佳 Linux 模拟器 | BC-250 上的状态 | 说明 |
|--------|--------------------|------------------|-------|
| **街机 / MAME** | **MAME**（或 FinalBurn Neo）—— RetroArch | ✅ 多数容易（general ⚠） | 常见套件用 FBNeo；要全部就用完整 MAME。重型的 90 年代末/3D 街机基板仍可能吃力。 |
| **Neo Geo** | **FinalBurn Neo** —— RetroArch | ✅ 轻松（general ⚠） | FBNeo 是 Neo Geo / CPS 之选。 |
| **TurboGrafx-16 / PC Engine** | **Beetle PCE** —— RetroArch | ✅ 轻松（general ⚠） | Beetle/Mednafen PCE 核心。 |
| **Atari（2600/5200/7800/ST/…）** | Stella / RetroArch（Atari800、Hatari） | ✅ 轻松（general ⚠） | 2600 用 Stella；其余有对应核心。 |
| **DOS** | **DOSBox**（DOSBox-Staging / DOSBox-X） | ✅ 轻松（general ⚠） | 或者 DOSBox-Pure RetroArch 核心。 |
| **ScummVM** | **ScummVM**（原生 Linux） | ✅ 轻松（general ⚠） | 引擎重实现，不是模拟 —— 哪儿都能跑。 |

> ✅ 能用 / 轻松 · ⚠️ 有保留地能用 · ❌ 坏 · **(chat)** = 第一手 BC-250 报告（已引用）· **(general ⚠)** = 最佳 Linux 模拟器 + 对这类硬件的预期，**未在 BC-250 上测试**。

---

## 现实的预期 —— 什么容易 vs 难

| 档位 | 系统 | 在一台 2000 MHz、已散热的 BC-250 上的现实 |
|------|---------|--------------------------------------|
| **舒适** | NES · SNES · GB/GBC/GBA · N64 · DS · 3DS · **PS1 · PS2 · PSP** · Genesis/SMS/Game Gear · Saturn · Dreamcast · 街机/Neo Geo/PCE · Atari · DOS · ScummVM · **GameCube · Wii** | 板卡的甜点位。复古机轻松；PSP 经聊天确认在 4× 分辨率；PS2/GC/Wii 远在这套硬件的能力范围内（通用预期 —— 自己给吃力的标题跑分）。用 EmuDeck 或 RetroArch 然后开跑。 |
| **吃力 / 时好时坏** | **Switch · PS3 · PS4** | 真能跑，但 CPU 受限且逐游戏而定。Switch（Eden）"良好且快"，但重型第一方掉帧；PS4（shadPS4）对合适的标题很棒（《血源诅咒》）；PS3（RPCS3）能用但需逐游戏调校。先把调速器设到最大。 |
| **勉强 / 尚不能** | **Xbox 360** · Wii U · PS Vita | Xenia 菜单能开然后玩法黑屏（chat）。Wii U（Cemu）和 Vita（Vita3K）在板卡上未确认，且总体吃力/实验性 —— 依赖它们之前先验证。 |
| **一份省心、免超频的体验** | （任何吃力的系统） | 没有。不超频，GPU 在模拟器里会降频，连 Switch 都憋死。先做 OC + 散热。 |

---

## 来源

- 模拟器总结（Switch/Eden、PS3/RPCS3、PS4/shadPS4、Xbox360/Xenia）—— https://t.me/c/2424231195/78988
- "Eden 最像样" —— https://t.me/c/2424231195/130842 · Eden 安装且能用 —— https://t.me/c/2424231195/98942 · Eden + EmuDeck Ryujinx —— https://t.me/c/2424231195/99039 · Ryujinx 跑起来了 —— https://t.me/c/2424231195/51606 · TOTK 于 Eden 掉帧（NX Optimizer）—— https://t.me/c/2424231195/124216 · CPU 是那堵墙，GPU 闲置 —— https://t.me/c/2424231195/136712
- 早期模拟器状态（Yuzu/Suyu 挂起、Ryujinx 正常、Xenia 低、RPCS3 出错）—— https://t.me/c/2424231195/23577
- PS4/shadPS4 《血源诅咒》（"两下点击"）—— https://t.me/c/2424231195/38704 · https://t.me/c/2424231195/38706 · Drive Club 100% —— https://t.me/c/2424231195/82128
- PS3/RPCS3 《神秘海域》稳定且可玩 —— https://t.me/c/2424231195/74644 · "在 RPCS3 里跑得很棒" —— https://t.me/c/2424231195/53601 · PS3 模拟演练视频 —— https://t.me/c/2424231195/13
- PSP/PPSSPP 跑起来了（4× 分辨率，无降频）—— https://t.me/c/2424231195/101579 · https://t.me/c/2424231195/103218 · https://t.me/c/2424231195/111096
- Wii U/Cemu 在 6.15+ 内核上被问起 —— https://t.me/c/2424231195/68253 · 经 AUR（paru）装 cemu —— https://t.me/c/2424231195/74138
- 从终端跑 Dolphin —— https://t.me/c/2424231195/19715 · "基本就是一台拉满的 PS Vita"（硬件，非模拟器）—— https://t.me/c/2424231195/86140
- 调速器在模拟器里卡在 1000 MHz；手动设到最大 —— https://t.me/c/2424231195/130879 · https://t.me/c/2424231195/130955 · 《塞尔达》30→60 补丁 —— https://t.me/c/2424231195/130887
- 没有预配置镜像（社区禁忌）—— https://t.me/c/2424231195/130845 · https://t.me/c/2424231195/130877
- 任天堂对 Switch 模拟器穷追猛打 / 密钥难找 —— https://t.me/c/2424231195/136649
- Batocera（模拟发行版）确认在 BC-250 上运行 —— [r/linux_gaming 帖](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- 硬件规格（6× Zen 2 @ ~3.5 GHz、RDNA2 24→40 CU、16 GB GDDR6）—— [elektricm/amd-bc250-docs](https://elektricm.github.io/amd-bc250-docs/hardware/specifications/)
- 通用模拟能力的框定（⚠ 验证；这份第三方指南把核心数误算成 8）—— [koukan.co.uk BC-250 指南](https://www.koukan.co.uk/blog/amd-bc-250-guide)

> 这些结果所依赖的超频在 [09-overclock-undervolt.md](09-overclock-undervolt.md)；在跑 2000 MHz 之前先做 [04-cooling.md](04-cooling.md) 改造。要了解更广的游戏图景和 CPU 受限的解释，见 [11-gaming.md](11-gaming.md)；要安装模拟器所运行的操作系统，见 [06-linux.md](06-linux.md)。
