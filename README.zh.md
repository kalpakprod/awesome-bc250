<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 —— 面向新手的 AMD BC-250 圣经" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> 面向新手的 **ASRock AMD BC-250** 圣经 —— 一块源自 PlayStation 5 的 APU 板卡（Cyan Skillfish / Oberon，6 核 Zen 2 + RDNA 2，16 GB GDDR6），被改造成廉价的 **Linux 游戏与 AI 迷你主机** —— 一台 DIY 预算版 Steam Machine。

从**一块装在盒子里的板卡到能跑游戏**所需的一切 —— 内容精选自 BC-250 社区的 130k+ 条消息，按大家真正点赞和置顶的内容排序，并与官方项目仓库交叉核对。

🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · **中文** · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<sub>_持续维护 · 最后更新 **2026 年 8 月** · 面向 AI 代理的 [llms.txt](llms.txt)_</sub>

---

## ❓ 快速问答

- **什么是 ASRock AMD BC-250？** 一块源自 PlayStation 5 的 APU 板卡 —— 6 核 Zen 2 + 24/40 个 RDNA 2 CU（"Cyan Skillfish"），16 GB GDDR6 —— 作为矿卡退役后低价出售，被改造成 Linux 游戏与 AI 迷你主机，一台 DIY 预算版 Steam Machine。
- **多少钱？** 裸板约 **$60–130**；完整装机（电源、散热、SSD）约 **$150–250**。见 [购买指南](docs/en/02-buying.md)。
- **游戏性能如何？** 在 FSR / 补帧（Frame-Gen）和 GPU+CPU 超频下，多数游戏约 **1080p 60 FPS**（RX 6600 级别）。见 [游戏实测与设置](docs/en/11-gaming.md)。
- **用哪个系统？** GPU 加速**仅限 Linux** —— Bazzite、Fedora、CachyOS 或 Arch + Mesa 25.1+。没有 Windows GPU 驱动。见 [Linux 驱动与配置](docs/en/06-linux.md)。
- **能跑 LLM 吗？** 可以 —— 通过 Vulkan 运行的 llama.cpp / Ollama 可把 16 GB GDDR6 当作显存使用（小模型约 30–47 tok/s）。见 [AI / LLM](docs/en/12-ai-llm.md)。
- **怎么散热？** 原装服务器散热器在桌面上会降频；把鳍片磨薄并加装 120 mm 风扇，或直接上水冷。见 [散热](docs/en/04-cooling.md)。

---

## ⚡ 从这里开始

刚拿到板卡，一无所知？按顺序沿着这条黄金路径走：

**[docs/zh/00-start-here.md](docs/zh/00-start-here.md)** —— 购买 → 供电 → 散热 → 装系统 → 驱动 → 超频 → 开玩。

---

## 📈 调校的实际收益

这块板子上的每个旋钮都有取舍。以下四个是最关键的，均来自社区实测数据 —— 在刷写任何东西之前请先读完。

<p align="center">
  <img src="assets/diagrams/gpu-clock-tradeoff.svg" width="100%" alt="GPU 核心频率：2000 MHz 时 FPS 提升升至约 95%，随后因 CPU 成为瓶颈而趋于平缓，而功耗与温度持续攀升至 95%。甜点区约在 2000 MHz，FPS 约 +30%。">
</p>

<p align="center">
  <img src="assets/diagrams/undervolt-tradeoff.svg" width="100%" alt="降压：电压从 1129 mV 降至 700 mV，能效从 20% 升至 95%，而不稳定风险从 15% 升至 100%。游戏稳定范围约为 905 至 955 mV；低于 700 mV 时 GPU 会把自己锁在 1500 MHz。">
</p>

<p align="center">
  <img src="assets/diagrams/cu40-tradeoff.svg" width="100%" alt="40-CU 解锁：计算性能从 40% 升至 90%，而游戏 FPS 仅从 40% 升至 47%，功耗与不稳定风险从 25% 升至 100%。38 CU 是通常的稳定上限；40 CU 全凭运气，需要超过 300 W 功耗和一体式水冷（AIO）。">
</p>

<p align="center">
  <img src="assets/diagrams/memory-tradeoff.svg" width="100%" alt="GDDR6 内存调校：带宽与 FPS 提升仅从 30% 升至 52%，而变砖风险从 20% 升至 100%。1950 MHz 就是板卡变砖被退回的临界点。">
</p>

<p align="center">
  <img src="assets/diagrams/power-by-config.svg" width="100%" alt="各配置下的实测整机功耗：850 mV 下 38 CU + 1200 MHz 为 200 W，860 mV 下 40 CU + 1800 MHz 为 260 W，38 CU + 1500 MHz 为 310 W，960 mV 下 40 CU + 2000 MHz 为 350 W，而 1025 mV 仅再多 2 W。社区报告的最佳每帧功耗点为 40 CU @ 1800 MHz。">
</p>

这五张图是实测数据，而不是理论模型：从 1800 拉到 2000 MHz 要多耗约 90 W —— 大约相当于此前 600 MHz 频率提升的代价 —— 而从 960 mV 加到 1025 mV 除了多出 2 W 热量外毫无收益。在 350 W 功耗下，300 W 电源会在 30 秒内触发保护，+12V 轨要承载 26 A 电流。

<details>
<summary>待机功耗 —— 为什么功率计几乎不动</summary>

<p align="center">
  <img src="assets/diagrams/idle-power-tradeoff.svg" width="100%" alt="待机功耗：经过 governor、降压和自动挂起，GPU 功耗从 80 W 降至 5 W，但整机功耗仅从 125 W 降至 110 W，直到挂起后降至 10 W。">
</p>

governor 和降压砍掉了 GPU 的功耗，但 CPU 和 GDDR6 仍在持续耗电。在自动挂起生效之前，功率计几乎察觉不到变化。高漏电批次的下限在 70–80 W 左右。

</details>

<sub>数据来源：[`assets/diagrams/data.json`](assets/diagrams/data.json) · 使用 `node assets/diagrams/build.mjs` 重新生成</sub>

---

## 📚 手册

| # | 章节 | 适用于 |
|---|---------|-----|
| 01 | [什么是 BC-250](docs/en/01-what-is-bc250.md) | 规格、尺寸、针脚、预期 |
| 02 | [购买指南](docs/en/02-buying.md) | 渠道、价格、风险、团购 |
| 03 | [供电](docs/en/03-power-supply.md) | LOP / Flex ATX、8-pin 针脚、接线 |
| 04 | [散热](docs/en/04-cooling.md) | 散热片、风扇导风罩、测试方法 |
| 05 | [机箱与 3D 打印](docs/en/05-case.md) | 可打印机箱目录（STL） |
| 06 | [Linux 驱动与配置](docs/en/06-linux.md) | 发行版选择、amdgpu、安装 |
| 07 | [Windows 驱动与配置](docs/en/07-windows.md) | 驱动现状、操作方法 |
| 08 | [BIOS 与变砖恢复](docs/en/08-bios.md) | 改版 BIOS、刷写、解砖 |
| 09 | [超频与降压](docs/en/09-overclock-undervolt.md) | governor、SMU、40CU 解锁 |
| 10 | [WiFi 与蓝牙适配器](docs/en/10-wifi-bt.md) | 真正能用的适配器 |
| 11 | [游戏实测与设置](docs/en/11-gaming.md) | 跑分、逐游戏调优 |
| 12 | [BC-250 上的 AI / LLM](docs/en/12-ai-llm.md) | llama.cpp、ROCm |
| 13 | [macOS / 黑苹果](docs/en/13-macos.md) | 现状 |
| 14 | [显示与输出](docs/en/14-display.md) | DisplayPort、DP→HDMI 转接、双屏 |
| 15 | [模拟](docs/en/15-emulation.md) | 各主机/平台，真实可用现状 |
| 16 | [USB、集线器与存储](docs/en/16-usb-peripherals.md) | 集线器、5V 改造、M.2 / SATA 转接 |
| ❓ | [FAQ](docs/zh/faq.md) · [故障排查](docs/zh/troubleshooting.md) | 常见问题 |

---

## 🔗 精选资源

官方社区项目，按社区引用频率排序。

### 文档
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) —— 主要的硬件参考（逆向工程）
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [站点](https://elektricm.github.io/amd-bc250-docs/) —— 全面的社区文档（针脚、各发行版、故障排查）
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) —— 组织文档
- [kenavru/BC-250](https://github.com/kenavru/BC-250) —— 构建与脚本

### 超频 / 降压 / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) —— 多数配置都在用的 governor（设定频率/电压）
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) —— 带图形界面的 oberon-governor 分支（Linux）
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [bc250-collective 分支](https://github.com/bc250-collective/cyan-skillfish-governor)
- [rw-r-r-0644/bc250-core-unlock](https://github.com/rw-r-r-0644/bc250-core-unlock) —— 解锁被禁用的 2 个 CPU 核心（默认掩码 0x77；0xB7 掩码意味着核心存在物理缺陷 —— 强行解锁会出现花屏与崩溃）
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) —— 解锁全部 40 个 CU
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### 工具包与预构建镜像
- [redbeard1083/bc250-toolkit](https://github.com/redbeard1083/bc250-toolkit) —— 面向 CachyOS 的菜单式配置：内核、CPU/GPU governor、swap、ZRAM→ZSWAP、ACPI 与启动优化
- [62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images](https://github.com/62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images) —— 已应用 BC-250 补丁的预构建 Bazzite Deck/GNOME/KDE 镜像

### 驱动
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) —— Windows GPU 驱动（实验性，截至 2026 年初尚无完整加速）
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) —— PSP/GPU 驱动开发
- [DryhoppedIPA/bc250-gfx1013-fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix) —— 针对损坏的 GPU 计算队列（异步计算）的内核 + Mesa/RADV 补丁；同时修复 FSR 4 / XeSS 3 的 INT8 路径
- [MastaG/linux-cachyos-bc250](https://github.com/MastaG/linux-cachyos-bc250) —— 带 BC-250 精选补丁的 CachyOS 内核
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) —— Linux 内核

### BIOS / 固件
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) —— 被引用最多的 BIOS 镜像与改版
- [TheRetroWeb —— BC-250 BIOS 数据库](https://theretroweb.com/bios?itemsPerPage=24&chipsetIds%5B%5D=1990) —— 原版 BIOS 固件转储，按版本浏览/下载
- [Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script](https://github.com/Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script) —— 菜单式固件备份与自定义固件刷写
- 刷写与变砖恢复见 [docs/en/08-bios.md](docs/en/08-bios.md)

### WiFi / BT 适配器
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### AI / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### 机箱 / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables 与 MakerWorld —— 见 [docs/en/05-case.md](docs/en/05-case.md)

---

## 🤝 贡献

这是一个**持续更新**的仓库。知识通过一条可复现的流水线从社区聊天中提取（见 [CONTRIBUTING.md](CONTRIBUTING.md)），并在有新的导出数据时重新运行。欢迎提交 PR，修正错误、补充新适配器、新机箱、已验证的命令。

## 📄 许可证

文档：[CC-BY-SA-4.0](LICENSE)。`assets/scripts/` 下的脚本：MIT。镜像的第三方固件/驱动保留其原有权利 —— 见 [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md)。

## 🙏 致谢

致整个 BC-250 社区 —— 见 **[CREDITS](CREDITS.md)**，里面列出了让这本手册成为可能的顶尖贡献者。来源：*AMD BC-250 社区聊天*。项目作者以上文中的仓库账号署名。
