🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · **中文** · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 —— 面向新手的 AMD BC-250 圣经" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> 面向新手的 **AMD BC-250** 圣经 —— 一块源自 PlayStation 5 的 APU 板卡（Cyan Skillfish / Oberon，16 GB GDDR6），被改造成廉价的 Linux 游戏与 AI 主机。

从**一块装在盒子里的板卡到能跑游戏**所需的一切 —— 内容精选自 BC-250 社区的 12.5 万余条消息，按大家真正点赞和置顶的内容排序，并与官方项目仓库交叉核对。

🌍 语言: [English](README.md)（主） · [Русский](README.ru.md) · **简体中文**

---

## ⚡ 从这里开始

刚拿到板卡，一无所知？按顺序沿着这条黄金路径走：

**[docs/zh/00-start-here.md](docs/zh/00-start-here.md)** —— 购买 → 供电 → 散热 → 装系统 → 驱动 → 超频 → 开玩。

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
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) —— 解锁全部 40 个 CU
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### 驱动
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) —— Windows GPU 驱动（实验性，截至 2026 年初尚无完整加速）
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) —— PSP/GPU 驱动开发
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) —— Linux 内核

### BIOS / 固件
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) —— 被引用最多的 BIOS 镜像与改版
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

致整个 BC-250 社区 —— 见 **[CREDITS](CREDITS.md)**，里面列出了让这本手册成为可能的顶尖贡献者。来源：*чат AMD BC-250 community*。项目作者以上文中的仓库账号署名。
