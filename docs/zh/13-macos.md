> 🌐 社区翻译。英文版为权威来源，可能更新更及时。发现错误？请提交 issue：[English](../en/13-macos.md) · https://github.com/lildebil0/awesome-bc250/issues

# macOS / 黑苹果

> **太长不看** —— **别。** 你大概能在 BC-250 的 CPU 上引导 macOS（它是一颗 Zen 2 AMD 芯片，通用的 AMD-OSX 黑苹果技巧适用），但 **GPU 不会加速**，而且没有现实的路径让它加速。macOS 通过硬编码的设备 ID 支持 GPU；BC-250 的 GPU（Cyan Skillfish / Oberon，一个削减的 PS5 部件）**没有可原生支持的桌面孪生体可冒充**，而 Apple 的栈*从未*被做成驱动任何 AMD APU 的集成显卡。所以你会得到一台慢的、软件渲染的 Mac，没有 Metal。截至 2026 年，社区里没人报告过一个工作的加速结果。改用 Linux —— 见 [06-linux.md](../en/06-linux.md)。

这是一个**小众的好奇心**，不是一个真实用例。诚实的答案就是这整一节。

---

## 为何 GPU 加速是那堵墙

这个话题里被反应最多的两篇技术帖子都得出同一个结论，且它们清楚地解释了机制。

macOS 没有像 Linux 那样的开放驱动模型。它发布闭源驱动，按**设备 ID** 绑定到特定 GPU，而你唯一能干预的地方是 OS 加载*之前*的 **OpenCore** 引导加载器 —— OpenCore 把预制好的数据交给 macOS，它不能从内部给闭源系统打补丁（[来源](https://t.me/c/2424231195/103173)）。

OpenCore *能*冒充一个 GPU 的设备 ID，但只在**一个架构家族内** —— 例如把一张不受支持的 RX 6950 XT 呈现为受支持的 RX 6900 XT，因为它们是*同一块*硅片。那个把戏花了 OpenCore 开发者**一年多**，且只因为那些 Navi 卡与 Apple 已支持的卡架构相同才成功（[来源](https://t.me/c/2424231195/53321)）。

BC-250 在两个方面打破了这点：

1. **没有孪生体可冒充。** 它的 GPU 是一个削减的、PS5 衍生的部件（`gfx1013`）。**没有 macOS 原生支持的、相同架构的桌面 AMD 卡**，所以没有东西可伪装。要让 BC-250 工作，Apple 的栈需要从头学这个设备 ID —— 而那只在 OpenCore 开发者接手这颗芯片时才会发生，且没有商业理由这么做（[来源](https://t.me/c/2424231195/53321)）。
2. **它是一颗 APU，而 APU 从未工作过。** 即便是桌面架构的锐龙集成显卡（Vega / Navi iGPU）也**从未**在 macOS 里被唤起，尽管它们与受支持的独显共享一个微架构。该作者"没见过一个工作的案例"是锐龙 iGPU 在 macOS 里的（[来源](https://t.me/c/2424231195/103173)）。BC-250 就在那同一个 APU 桶里。

同一贡献者的直白总结：*如果连这颗芯片的 Windows 驱动都还没搞定，macOS 就别做梦了*（[来源](https://t.me/c/2424231195/53321)）。（关于 Windows 驱动情况，见 [07-windows.md](../en/07-windows.md)。）

---

## 人们实际尝试了什么

- 有人早期准备并分享了一个 **macOS Monterey 恢复 + OpenCore** 包（`Monterey recovery + OpenCore.zip`，外加一个更早的 `Архив.zip`），所以至少有一个人着手去装它（[来源](https://t.me/c/2424231195/53590)）。从未有加速 GPU 成功的反馈。
- 人们指向的相关工具是标准的 AMD 黑苹果套件：经 [RehabMan/OS-X-Fake-PCI-ID](https://github.com/RehabMan/OS-X-Fake-PCI-ID) 的设备 ID 伪造、用于看什么实际受支持的 [Dortania AMD GPU 购买指南](https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series)，以及 —— 最接近 APU 显卡支持的东西 —— **[ChefKissInc/NootedRed](https://github.com/ChefKissInc/NootedRed)**，一个给 AMD APU iGPU 的 kext。NootedRed 瞄准 Vega/Renoir 级 APU，且**不**覆盖 BC-250 的裸片，所以它救不了这块板卡。
- 一个后来的论坛链接关于[经 VMware/OpenCore 在 AMD 锐龙上跑 macOS](https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/)（[来源](https://t.me/c/2424231195/107779)）是**通用 AMD 黑苹果**，不是 BC-250 特定的 —— 而一个 VM 意味着无论如何都没有 GPU 直通/Metal。

> ⚠ **别把玩笑当结果。** 这个话题有轻松的"棒，强大的黑苹果在这儿称王"调侃（[来源](https://t.me/c/2424231195/85166)）和点赞反应，那些*不是*工作 macOS 构建的报告。证据里没有任何东西显示 BC-250 上有加速的 macOS。

---

## 那么值得吗？

**不，对任何实际用途都不。** 最好的现实结果是一台仅 CPU 的 macOS，软件渲染 UI —— 没有 Metal，没有 GPU 计算，对买这块板卡所为的游戏/AI 工作负载毫无用处。社区共识，从 **2025-06** 到 **2026-03** 期间有记录且未变，是：在 OpenCore 开发者专门采纳这颗芯片之前，GPU 支持实际上不可能，而那并没发生也不被预期。

如果你想让这块板卡*做*点什么，装 Linux（[06-linux.md](../en/06-linux.md)），那里 GPU 经由 Mesa/RADV 得到真正支持。Windows 是遥远的第二（[07-windows.md](../en/07-windows.md)）。macOS 排最后，而且实际上是一条死路。

---

## 来源

- GPU 按设备 ID + 那个一年的 Navi 冒充故事 —— https://t.me/c/2424231195/53321
- OpenCore 的限制 & "没有锐龙 iGPU 曾工作过" —— https://t.me/c/2424231195/103173
- 有人准备的 Monterey + OpenCore 包 —— https://t.me/c/2424231195/53590
- 通用 AMD-锐龙黑苹果论坛帖（非 BC-250 特定） —— https://t.me/c/2424231195/107779 · [amd-osx.com 帖](https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/)
- 引用的工具 —— [RehabMan/OS-X-Fake-PCI-ID](https://github.com/RehabMan/OS-X-Fake-PCI-ID) · [ChefKissInc/NootedRed](https://github.com/ChefKissInc/NootedRed)（AMD APU iGPU kext；不覆盖这颗裸片） · [Dortania AMD GPU 指南](https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series)
- 芯片身份（Cyan Skillfish / Oberon，`gfx1013`） —— 见 [01-what-is-bc250.md](../en/01-what-is-bc250.md)

> **底线：** BC-250 上的 macOS 是一个技术冷知识脚注，不是一个构建目标。去 [06-linux.md](../en/06-linux.md)。
