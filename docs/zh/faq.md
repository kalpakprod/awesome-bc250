> 🌐 社区翻译。英文版为权威来源，可能更新更及时。发现错误？请提交 issue：[English](../en/faq.md) · https://github.com/lildebil0/awesome-bc250/issues

# FAQ

> **太长不看** —— 新手第一周会问的问题，配上简短而正确的答案，每个都链接到对应的完整章节。如果某个答案感觉太短，那是有意为之 —— 深度都在所链接的手册页面里。

这是一份速查表。想走有引导的"一块装在盒子里的板卡 → 游戏跑起来"路径，请从 [00-start-here.md](00-start-here.md) 开始。

---

## 硬件与我买到的东西

**BC-250 到底是什么？**
一颗源自 PlayStation 5 的 APU（AMD **Cyan Skillfish** / Oberon），装在一块加密货币矿机/服务器板卡上：**6 核/12 线程 Zen 2 CPU + 24-CU RDNA 2 GPU + 16 GB 板载 GDDR6**。它不是显卡，也不是普通 PC —— 没有 PCIe 插槽，没有 24-pin ATX，没有熟悉的 BIOS。见 [01-what-is-bc250.md](../en/01-what-is-bc250.md)。

**它是即插即用的吗？我是不是不该买？**
不是。它需要折腾驱动、改造散热，还有古怪的供电 —— 这是一块给爱折腾的人的板卡。一位老手的原话：它"需要一定的技能、精力和脑子"。如果你想要零麻烦，退货；如果你喜欢搞项目，它是这个档次里最便宜的 Linux 游戏 / 本地 AI 主机。见 [01-what-is-bc250.md](../en/01-what-is-bc250.md)。

**我能加更多内存吗？**
不能。这 16 GB GDDR6 是板载的，由 CPU 和 GPU 共享；没有 DIMM 插槽。你只能选择 GPU 从这个内存池里保留多少（UMA），在改版 BIOS 里设定。见 [01-what-is-bc250.md](../en/01-what-is-bc250.md) 和 [08-bios.md](../en/08-bios.md)。

**它有电源按钮吗？**
没有。12 V 一到它就立刻开机 —— PSU 自己的开关就是你的电源按钮。见 [03-power-supply.md](../en/03-power-supply.md)。

**我的板卡开箱就不 POST / 黑屏 —— 坏了吗？**
通常没坏。很多板卡出厂时需要先做一次 **BIOS/CMOS 重置**才会 POST，还有一些到手时因散热片安装而略微**弯曲** —— 一位机主用纸把板卡垫平解决了无法开机的问题。先试试这些，再断定它坏了。见 [01-what-is-bc250.md](../en/01-what-is-bc250.md)。

**它能用 GPU 录制/直播游戏吗？**
硬件上不能。视频编码模块（VCN）不可用，所以 OBS/直播会回退到**软件（CPU）编码器** —— 它能用（有人用 Sunshine/Moonlight），但会占用 CPU 并损失画质。见 [01-what-is-bc250.md](../en/01-what-is-bc250.md)。

**背板改造的导热垫厚度是多少？**
社区报告：**内存 2 mm，芯片组 1.5 mm**（[src](https://t.me/c/2424231195/22442)）。背面的 GDDR6 没有温度传感器，所以你是盲冷它。见 [04-cooling.md](../en/04-cooling.md)。

## 供电

**我需要什么电源？**
一个**单路 12 V** 电源，通过 **PCIe 8-pin（6+2）** 接口提供 **≥300 W**。三条常见路线：普通 ATX/SFX PSU（直接插它的 PCIe 线 —— 最简单）、便宜的二手 HP Flex 500 W 服务器 PSU，或一个 Mean Well 工业砖块电源。见 [03-power-supply.md](../en/03-power-supply.md)。

**我能用 PSU 上的 CPU/EPS 8-pin 吗？**
**不行 —— 会烧板。** PCIe 和 CPU/EPS 的 8-pin 看起来几乎一模一样，但**极性是反的**。板卡没有任何检测保护；请用 **PCIe** 线，不确定就用万用表核实。见 [03-power-supply.md](../en/03-power-supply.md)。

**我那块旧的 750 W PSU 瓦数绰绰有余 —— 为什么还吃力？**
旧电源常常把 **12 V 拆到多路弱电流轨**上，没有任何单路能覆盖板卡所吃的约 235 W。优先用现代的单路 / DC-DC PSU，或一个余量很大的。见 [03-power-supply.md](../en/03-power-supply.md)。

**我的供电线发烫/冒烟了。为什么？**
几乎可以肯定是**假铜** —— 铜包钢或铝线，电阻是真铜的好几倍，在负载下过热（一位成员买的成品 PCIe 分线器真的冒烟了）（[src](https://t.me/c/2424231195/97202)）。用磁铁测试：它吸钢，不吸铜。用真铜线，**16 AWG 或更粗**。见 [03-power-supply.md](../en/03-power-supply.md)。

## 散热

**为什么它开箱就过热/降频？**
原装散热片是**被动式**的，为矿机机柜的强制风道而设计。放在没有气流的桌面上它会积热并降频。约 **85 °C** 开始降频，约 **90 °C** 硬重置。见 [04-cooling.md](../en/04-cooling.md)。

**真正有效的最便宜散热改法是什么？**
**把密集的原装鳍片减薄**（轨道式砂磨机最快），再用一个 **120 mm 高静压风扇**透过打印的导风罩往里吹。参考成绩：Noctua NF-P12 → Furmark 约 73 °C，游戏 63–65 °C（[src](https://t.me/c/2424231195/42843)）；Arctic P12 Max 保持约 75 °C（[src](https://t.me/c/2424231195/58869)）。见 [04-cooling.md](../en/04-cooling.md)。

**为什么要高静压风扇，而不是高风量的"机箱风扇"？**
密集鳍片是高阻力负载 —— 高风量机箱风扇撞上它们只会失速，而高静压风扇（Noctua/Arctic P12）才真正把空气*推过去*。对于非常密集的鳍片，用两个风扇**串联（push–pull）**，而不是并排。见 [04-cooling.md](../en/04-cooling.md)。

**我怎么知道散热够不够？**
把 **GPU 和 CPU 一起**加压（它们共用一个散热片）—— Furmark VK 加上一个 CPU 负载 —— 并且**在你的超频下**（2000 MHz，不是默频），让负载温度保持在约 85 °C 以下。有一份置顶的测试流程。见 [04-cooling.md](../en/04-cooling.md)。

## Linux

**我该装哪个发行版？**
想"就玩游戏"，刷 **Bazzite** 并 rebase 到 **`bazzite-bc250`** 镜像 —— GPU 修复已内置。想了解这台机器：**Fedora**（COPR + 配置脚本）或 **CachyOS/EndeavourOS**（Arch）。见 [06-linux.md](../en/06-linux.md)。

**我装好了 Linux，但一切都很慢 / 个位数 FPS。为什么？**
GPU 没有被加速 —— 你在用软件（LLVMpipe）渲染。你需要**新版 Mesa（25.1+）**、**`cyan_skillfish` 固件符号链接**（或一个打过补丁的软件包），以及正确的内核参数。用 `vulkaninfo | grep deviceName` 确认（它*不应*显示 `llvmpipe`）。见 [06-linux.md](../en/06-linux.md)。

**内核更新后黑屏 —— 怎么修？**
在大多数发行版上，修复办法是加上固件符号链接，好让 amdgpu 能加载：
```bash
sudo ln -s /lib/firmware/amdgpu/navi10_gpu_info.bin.zst \
           /lib/firmware/amdgpu/cyan_skillfish_gpu_info.bin.zst
```
这个链接能扛过内核更新（但在 Bazzite 上**不行**，而且一次 firmware/amdgpu 更新可能把它清掉）（[src](https://t.me/c/2424231195/98882)）。否则就启动一个旧的/LTS 内核，并把那个坏内核锁版本。见 [06-linux.md](../en/06-linux.md)。

**我该用 Flatpak 装应用吗？**
任何涉及图形的都别用。Flatpak 会捆绑**它自己的 Mesa**，覆盖板卡那个打过补丁的，于是它们**没有硬件加速**地运行。比如 PortProton 就必须用终端安装，而不是 Flatpak（[src](https://t.me/c/2424231195/17949)、[src](https://t.me/c/2424231195/47092)）。见 [06-linux.md](../en/06-linux.md)。

**我的 CPU 感觉偏弱 —— 有什么速效办法？**
两个内核微调：**`mitigations=off`**（关闭 CPU 漏洞缓解）（[src](https://t.me/c/2424231195/23359)）和 **`nosmt=force`**（关闭 SMT —— 在轻度多线程的游戏里 +15–25 % FPS，但会拖累像高码率 OBS 这类重度多任务）（[src](https://t.me/c/2424231195/61332)）。两者都是安全性/吞吐量的取舍。见 [06-linux.md](../en/06-linux.md)。

**Wayland 上的 GNOME/KDE 有故障 —— 我该怎么办？**
已知问题。成员报告 Wayland 会话（通常是 GNOME/KDE）在这块板卡上表现异常；**改用 X11 会话**（[src](https://t.me/c/2424231195/19623)）。见 [06-linux.md](../en/06-linux.md)。

**我的内存很快就满了 —— 能弄更多 swap 吗？**
可以，扩大 **zRAM** swap（压缩内存 swap）—— 社区配方把它提到 32 GB，并在 `/etc/systemd/zram-generator.conf` 里设为持久化（[src](https://t.me/c/2424231195/38703)）。它不增加真实内存，但能吸收峰值。见 [06-linux.md](../en/06-linux.md)。

**一次内核更新搞坏了东西 —— 我怎么回滚？**
系统会保留最近几个内核。在 Fedora 上，用 `grubby` 列出它们，再 `grubby --set-default /boot/vmlinuz-…`，然后重启（[src](https://t.me/c/2424231195/39393)）。拿不准时，跑 **LTS 内核**。见 [06-linux.md](../en/06-linux.md)。

## Windows

**已经有 Windows 驱动了吗？**
没有 —— 截至 2026 年初**还没有可用的 Windows GPU 驱动**。Windows 能启动，但 GPU 停在 **Code 43**，没有 3D。存在两个从零开始的逆向工程项目（Keshas-dev、ZEROAESQUERDA），但它们还处在"GPU 到底能不能初始化"的阶段，离游戏还远。见 [07-windows.md](../en/07-windows.md)。

**我就不能强装一个 RX 6700 / W5700 驱动吗？**
不行。每一个官方 `.inf`（包括 Windows 提示为"兼容"的 W5700）装上后都会卡在 Code 43 —— 设备 ID `1002:13FE` 是焊死在这颗 APU 上的。这是每个新手的第一个念头，可它行不通。见 [07-windows.md](../en/07-windows.md)。

**那 Windows 虚拟机加 GPU 直通呢？**
不行 —— 这块板卡上 IOMMU 直通是坏的，它是 APU（不是一张干净的、可以交出去的独立显卡），而且这颗芯片本来就会被误识别。见 [07-windows.md](../en/07-windows.md)。

**我看到一个"BC-250 的 NVIDIA 驱动" / 一个 `…bc250.exe` —— 是真的吗？**
不是。那个"NVIDIA 驱动"是**愚人节玩笑**，而一个文件名后面被加了"bc250"的 Adrenalin 安装包，依然只是一个普通的 Adrenalin 安装包。只运行那些指名的 GitHub 仓库里的二进制文件，并且要读代码 —— 假"驱动"曾经是恶意软件。见 [07-windows.md](../en/07-windows.md)。

## BIOS 与恢复

**我该刷改版 BIOS 吗？**
仅当你想解锁超频/时序/iGPU-VRAM，**并且**你已备好恢复硬件时。一个错误的设置就能**把板卡彻底变砖**，而在这块板卡上**清除 CMOS 不一定能救回来**。用当前基于 5.00 的改版，核对 SHA-256，并且永远别禁用集成显卡（它是你唯一的显示输出）。见 [08-bios.md](../en/08-bios.md)。

**我把它刷砖了 —— 能解砖吗？**
通常能，但只能靠硬件：一个 **CH341A 级 SPI 编程器**接到板卡的 **J4004 排针**（SOIC 夹子在这里*不管用*）去重刷那颗 16 MB 芯片。当心 CH341A 的 3.3 V 数据线陷阱。见 [08-bios.md](../en/08-bios.md)。

**我改了 VRAM 划分，但系统仍显示旧的数值。**
刷写/更改 UMA 后要**清除 CMOS** —— 取下 CR2032 超过 60 秒，或短接 CMOS 跳线。有些设置（尤其是 VRAM/UMA）不这么做就不会生效（[src](https://t.me/c/2424231195/97290)）。见 [08-bios.md](../en/08-bios.md)。

## 超频与降压

**怎么超频？值得吗？**
跑一个 **governor**（多数配置用 **oberon-governor**），把 GPU 往 **2000 MHz** 推（*在 GPU 受限时* 约 +30 % FPS）。更新的 `bc250_smu_oc` 还能给 CPU 超频（约 4 GHz @ 1275 mV）。**先把板卡散热搞好** —— 在约 90 °C 以上超频会让它重置。见 [09-overclock-undervolt.md](../en/09-overclock-undervolt.md)。

**40-CU 解锁是什么？**
这颗 die 物理上有 **40 个 CU**，但固件只放出 **24** 个。一个打过补丁的 amdgpu + `amdgpu.bc250_cc_write_mode=3` 重新启用全部 40 个 —— 这比超频带来的 GPU 提升更大（一次 Superposition 跑分从 4647 → 6863）。它需要重新编译内核模块，且仅限 Linux。见 [09-overclock-undervolt.md](../en/09-overclock-undervolt.md)。

**我该设多少电压？**
每颗芯片都不一样（体质彩票）。常见的游戏稳定点：**2000 MHz ≈ 955 mV**（约 75 °C）。要在**真实游戏 + alt-tab/菜单**里验证，而不只是 Furmark，后者会掩盖不稳定。CPU 硬上限：**Vid 绝不超过 1.325 V**。见 [09-overclock-undervolt.md](../en/09-overclock-undervolt.md)。

**降压太激进危险吗？**
不危险 —— 最坏情况是板卡掉线或禁用 M.2 插槽，几秒钟就恢复，因为超频不存进 BIOS。给 CPU **加压**才是危险的方向。见 [09-overclock-undervolt.md](../en/09-overclock-undervolt.md)。

## 显示、WiFi 与蓝牙

**HDMI 没画面？**
板卡通过 **DisplayPort** 输出；要用 HDMI/电视，就用一个 **DP→HDMI 转接或线缆**（好的那种在 BIOS 里也能用，还能 4K）（[src](https://t.me/c/2424231195/24107)）。优先选真正的 **DP→HDMI 线缆**，而不是便宜的无源转接头 —— 一个劣质转接头曾让一位成员黑屏（[src](https://t.me/c/2424231195/96416)）。

**DisplayPort 上的音频失真。**
Linux 上的已知问题。简单的修法是通过一个 **DP→HDMI** 转接输出，它能传送干净的音频（[src](https://t.me/c/2424231195/17953)）。见 [01-what-is-bc250.md](../en/01-what-is-bc250.md)。

**它有 WiFi/蓝牙吗？**
没有板载无线 —— 你需要一个 **USB 适配器**，按**芯片组而非品牌**来选。文档最完善的是一个 **aic8800d80** 棒子；便宜的 Realtek RTL8821/8822 棒子配 `lwfinger/rtw88` 能用，但负载下会掉线。要配置的话，一个有线 USB-以太网适配器能绕开整个问题。见 [10-wifi-bt.md](../en/10-wifi-bt.md)。

**我的 WiFi 适配器老是断开。**
经典的 Realtek-在-BC-250 症状：装上正确的树外驱动（rtw88 / rtl8831），换一个后置 USB 口试试，并用 `usbreset` 重置而不是拔插。如果可靠性比价格更重要，换成 aic8800d80 或一个确认好用的 Digma 棒子。见 [10-wifi-bt.md](../en/10-wifi-bt.md)。

## 游戏与 AI

**我能期待多少 FPS？**
在真正 **2000 MHz** 超频下：现代 3A 大作 **40–60 FPS**，较轻/较老的游戏超过 60。最适合 **1080p–1440p** 配 FSR。板卡通常**受 CPU 限制**，所以提分辨率往往"免费"，但物理量大/线程化糟糕的游戏不管怎样都会卡顿。见 [11-gaming.md](../en/11-gaming.md)。

**哪些游戏跑得最好？**
**第一方 PlayStation 移植作**（God of War、Horizon、The Last of Us、Spider-Man、Ghost of Tsushima）—— 它们偏重 GPU 且优化良好。模拟方面：Switch（Eden）和 PS4（shadPS4）很稳；Xbox 360（Xenia）不行。见 [11-gaming.md](../en/11-gaming.md)。

**为什么我的 GPU 才约 40 % 占用但 FPS 很低？**
你**受 CPU 限制** —— 6 核 Zen 2 才是瓶颈，不是 GPU。这种情况下超分辨率提不了多少 FPS；试试 `nosmt=force`/`mitigations=off`，并接受有些游戏就是受 CPU 限制。见 [11-gaming.md](../en/11-gaming.md)。

**我能在上面跑本地 LLM / AI 吗？**
能 —— 这 16 GB GDDR6 能在 **Vulkan** 后端上通过 `llama.cpp`/Jan 装下中等规模的模型；先在 BIOS 里给 GPU 分配约 12 GB。见 [12-ai-llm.md](../en/12-ai-llm.md)。

## 购买

**什么是公道价，我去哪买？**
价格和渠道变化很快且因地区而异（eBay、AliExpress，独联体地区的 Ozon/Avito）—— 近期报告大致集中在一百多美元到约 13000 卢布。见 [02-buying.md](../en/02-buying.md)。

**买一块有什么风险？**
它是二手矿机/服务器硬件：板卡到手时可能需要 BIOS 重置、略微弯曲，或偶尔有故障，而且没有厂商支持 —— 社区就是你的支持。预算的是时间，不只是钱。见 [01-what-is-bc250.md](../en/01-what-is-bc250.md) 和 [02-buying.md](../en/02-buying.md)。

**我能在上面跑 macOS 吗？**
别。CPU 也许能启动，但 **GPU 永远不会加速**（没有可冒充的受支持双胞胎型号，而且从来没有任何 AMD APU 的核显在 macOS 里跑起来过）。用 Linux。见 [13-macos.md](../en/13-macos.md)。

---

## 来源

- 来源聊天：*AMD BC-250 community*（Telegram）。多数答案是对某一完整手册章节的概括 —— 跟随章节链接查看其背后的引用。
- 导热垫厚度 —— https://t.me/c/2424231195/22442
- Arctic P12 Max 约 75 °C —— https://t.me/c/2424231195/58869 · Noctua P12 约 73 °C —— https://t.me/c/2424231195/42843
- 内核更新后黑屏的固件符号链接修复（非 Bazzite）—— https://t.me/c/2424231195/98882
- Flatpak 破坏硬件加速 —— https://t.me/c/2424231195/17949 · PortProton 通过终端安装 —— https://t.me/c/2424231195/47092
- 弱 CPU 用 `mitigations=off` —— https://t.me/c/2424231195/23359 · `nosmt=force` 提升 FPS —— https://t.me/c/2424231195/61332
- Wayland 故障，改用 X11 —— https://t.me/c/2424231195/19623
- zRAM swap 扩容 —— https://t.me/c/2424231195/38703 · 内核选择/回滚 —— https://t.me/c/2424231195/39393
- 电源分线器过热/冒烟（假铜）—— https://t.me/c/2424231195/97202
- 改 VRAM 后需要清除 CMOS —— https://t.me/c/2424231195/97290
- DP→HDMI 转接（4K/电视，BIOS 里可用）—— https://t.me/c/2424231195/24107 · 劣质转接 → 黑屏 —— https://t.me/c/2424231195/96416 · DP 音频失真修复 —— https://t.me/c/2424231195/17953

> 这份 FAQ 是地图，不是疆域本身 —— 每个答案都指向承载细节与一手来源的章节。欢迎通过 PR 提交更正（见 [CONTRIBUTING.md](../../CONTRIBUTING.md)）。
