> 🌐 社区翻译。英文版为权威来源，可能更新更及时。发现错误？请提交 issue：[English](../en/07-windows.md) · https://github.com/lildebil0/awesome-bc250/issues

# Windows 驱动与配置

> **太长不看** —— 截至 **2026 年初，BC-250 没有可用的 Windows GPU 驱动。** Windows 能安装并启动，但 GPU 停在 **Code 43**，零 3D 加速 —— 每一个现成的 AMD 驱动（Adrenalin、Pro、W5700 的 `.inf` 小技巧）都被硬件拒绝。社区正**从零逆向工程一个**，而诚实的状态是"早期管道能用，还没有任何东西能渲染游戏"。如果你想今天真正*用上*这块板卡，**装 Linux**（[06-linux.md](06-linux.md)）—— 那才是可用驱动所在之处。本页的一切都带着怀疑去看，信任之前先查仓库的提交日期。

长期以来的社区结论，自 2025 年起为新手置顶：*"入此门者，当弃绝一切希望。Windows 驱动有 99.5% 的概率不会出现。没有驱动，这块板卡几乎完全无用。Linux 驱动存在 —— 如果你不准备好接受那个系统，你就不需要这块板卡。"*（[src](https://t.me/c/2424231195/28109)）

那是一年多里的共识。它在 2026 年**终于受到了挑战** —— 但很慢，而诚实的答案仍然是：还没到。

---

## 为什么 Windows 在这里很难（Code 43 之墙）

BC-250 APU（"Cyan Skillfish" / Oberon，GFX10.1.3）以一个**未知设备**的身份向系统呈现自己 —— PCI ID `1002:13FE` —— 没有任何已发货的 AMD 驱动认它。人们什么都试过了：

- **强行喂一个官方 `.inf`** 给设备管理器：Windows 唯一作为"兼容"提供的驱动是 **Radeon Pro W5700**。它能装上，然后卡在 **Error 43**，和试过的每一个其他驱动一模一样。（[src](https://t.me/c/2424231195/57123)）
- **编辑 `.inf` / 替换设备 ID**（gfx1013、1014、Navi 21/22/23 "Dragonball"、旧条目）、禁用驱动签名强制、甚至从 USB 启动 Windows 10 并试一个 Steam Deck 驱动 —— **全是死路**。那些旧条目不报错地出现，只是因为一个显示 bug，不是因为它们能用。（[src](https://t.me/c/2424231195/94029)）
- **改 BIOS** 来换设备 ID 也没帮上忙 —— iGPU 仍然报告 `1002:13FE`。Dev ID 似乎是**焊死在 APU 上的**，不只是 BIOS，所以只打一处补丁不够。（[src](https://t.me/c/2424231195/57123)）

为什么 Linux 能用而 Windows 不能？在 Linux 上，开源的 **amdgpu/Mesa** 栈被社区打了补丁（并部分上游化）来认这颗确切的芯片；在 Windows 上没有开源驱动可打补丁 —— AMD 从未为这个矿机/服务器部件发过 Windows 驱动，而封闭的 Adrenalin/Pro 栈拒绝那个未知 ID。（[src](https://t.me/c/2424231195/13210)）AMD 自家关于 "BC-250 drivers" 的论坛帖也无疾而终。（[community.amd.com](https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692)）

> **也没有 GPU 直通的逃生口。** 在虚拟机里跑 Windows 并把 BC-250 直通进去不行：这块板卡上 IOMMU 直通路径是坏的，而且它是一个 *APU*（不是宿主能干净交出去的独立显卡），而且这颗芯片从一开始就被误识别为未知设备。（[src](https://t.me/c/2424231195/64772)）

---

## 当前驱动状态 —— 到底存在什么（截至 2026 年初）

2025 年末，社区不再等 AMD，开始通过逆向工程硬件**从零构建一个 Windows 驱动**。两个努力值得关注；两者都是**实验性、开发中，且还不能渲染游戏。**

### Keshas-dev —— 从零开始的 WDDM 驱动（最活跃）

一对配套的内核模式驱动，是最活跃开发的 Windows 努力（截至撰写本文，**仅 PSP 驱动就有约 56 次提交**）：

- **[Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver)** —— 一个给 **PSP**（Platform Security Processor，平台安全处理器）的底层驱动。**能用的：** 它加载、启动 **SOS 固件**、通过 BAR5 MMIO 读写硬件寄存器（GC、MMHUB、HDP、NBIO、DF 模块）、做 NBIO 解锁，并充当 GPU 驱动的寄存器代理。**不能用的：** GPCOM 环创建（SOS 固件不支持 TOS 环协议）、通过环缓冲区加载 GPU 固件，以及 Trusted Memory Region 初始化。换句话说：它能和芯片对话，但**还不能把图形引擎拉起来。**（[repo](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver/commits/main/)）
- **[Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver)** —— 配套的 GPU 驱动。和 PSP 驱动共享同样的证书/测试签名基础设施，并把它用作寄存器桥。仍然很早期；没有可用的 3D 输出。（[repo](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver/commits/main/)）

第一个公开的生命迹象是一位成员在 2025 年 10 月报告**"我的第一个可用驱动（OpenGL 1.1）"**（[src](https://t.me/c/2424231195/83320)）—— 之所以被庆祝，正是因为在一年的 Code 43 之后，哪怕一个勉强能用的驱动*装上并运行*都是真正的里程碑：*"如果这个驱动真的装上并能用（哪怕很糟）—— 那是一大步。"*（[src](https://t.me/c/2424231195/83332)）那一波里的一个驱动转储，`AMD Radeon BC-250 (Cyan Skillfish) driver 00.00.01.7z`，被分享/置顶在群里。（[src](https://t.me/c/2424231195/83322)）**把任何这种早期转储当作实验性 —— 版本 `00.00.01` 正如它听起来那样生。**

### ZEROAESQUERDA —— WDDM 2.0 参考实现

**[ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest)** —— 一个独立的努力（"那个葡萄牙人起了个头"），2026 年 3 月被置顶在群里，作为坚冰正在裂开的迹象。（[src](https://t.me/c/2424231195/123644)）它最好理解为一个**参考/教育性 WDDM 2.0 实现**，而非可用驱动：

- 只实现了 **Direct3D 9 DDI**；**D3D11、D3D12 和 Vulkan 未实现。**
- **RDNA2（GFX10.1 ISA）的着色器编译不工作** —— 它接受着色器提交但无法为实际硬件编译它们，所以什么都渲染不出来。
- **不**加载命令处理器微码（依赖 BIOS 加载的固件）；**VCN 视频编码/解码不支持**；仅单 DisplayPort 输出。
- 需要**测试签名模式**（无 WHQL 签名）。main 上只有约 2 次提交。

在你花时间之前，先看项目自己的 **[Known Limitations](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas)** 部分。

> ⚠ **仓库命名更正。** 主仓库清单在 "Drivers → Windows" 下指向 `ZEROAESQUERDA/PS5GPU-BC250`。经检查，那个仓库是一个 **Linux GPU governor**（一个带 GUI 的 Oberon-governor fork），**不是** Windows 驱动。这位作者真正的 Windows 代码是 **`BC250-windowsDriverTest`**。

### 一览状态

| 项目 | 类型 | 能用的 | 不能用的 | 今天能用吗？ |
|---|---|---|---|---|
| Keshas-dev/AMD-BC-250-PSP-Driver | PSP 内核驱动（WIP） | 启动 SOS 固件、BAR5 寄存器读写、NBIO 解锁、寄存器代理 | GPU 环创建、固件加载、TMR 初始化 | 不 —— 只有管道 |
| Keshas-dev/AMD-BC-250-Windows-Driver | GPU 驱动（WIP） | 与 PSP 驱动一起加载 | 没有可用 3D | 不 |
| ZEROAESQUERDA/BC250-windowsDriverTest | WDDM 2.0 参考 | 驱动模型脚手架、D3D9 DDI 存在 | 着色器编译、D3D11/12、Vulkan、VCN | 不 —— 教育性 |
| Adrenalin / Pro / W5700 `.inf` | 官方 AMD | —— | **Code 43**，什么都没有 | 不 |

**底线：** 今天没有人在 BC-250 的 Windows 上玩游戏。工作是真实的并在加速，但它处在"我们到底能不能让 GPU 初始化"的阶段，而非"我的 Cyberpunk FPS 是多少"的阶段。

---

## 如果你仍然想试试开发中的驱动

这是给想要**帮忙测试**的爱折腾者的，不是为了得到一个能用的桌面。你将需要：

- **Windows 10（build 1607+）或 Windows 11，x64。**
- **启用测试签名**并**禁用 Secure Boot**（这些驱动是未签名/测试签名的）：
  ```
  bcdedit /set testsigning on
  ```
  重启。⚠ 核实 —— 确切步骤跟随每个仓库的 README；这里的命令是标准的 WDK 测试签名流程，不是从某个项目脚本里复制的。
- 通过仓库提供的 **PowerShell 脚本**（例如 `Install-Driver.ps1`）或用 `pnputil` 手动安装。跟随**仓库 README**，而非本页 —— 这些项目变化很快，安装步骤随之移动。

预期：最好情况下设备被枚举出来、早期初始化日志出现；最坏情况下什么都不变，或者你得到一个不同的错误代码。**备份你在乎的任何东西，并假设它不会渲染。**

### ⚠ 未经证实的传言："泄露驱动会让板卡变砖"

在 2025 年初的 beta 测试阶段，一位成员警告说 **BC-250 因泄露预发布驱动而被远程变砖** —— 声称有 Reddit 报告说变砖、远程设备封锁，以及连硬件编程器都解不开它们。（[src](https://t.me/c/2424231195/26231)）**我们无法证实这一点**，而且围绕它的整个"私有 beta"说法都很可疑（见下一节）。提及只为完整性；别把它当作既定事实。如果你因不相关的原因把板卡刷砖了，见 [08-bios.md](08-bios.md) 做恢复。

---

## 骗局、玩笑与死路 —— 别上当

BC-250 上的 Windows 驱动炒作有一段**恶作剧和一厢情愿**的长历史。认识那些有名的，免得你浪费一个周末：

- **"给 AMD BC-250 的 NVIDIA 驱动"。** 一个**愚人节（2026 年 4 月 1 日）**玩笑 —— 一个做得很像的假 "NVIDIA NEW DRIVER RELEASE … for AMD BC-250" 横幅，一度让人问*"NVIDIA 真的发了一个 BC-250 Windows 驱动？！"*（[src](https://t.me/c/2424231195/130053)）它没有。NVIDIA 不为一颗 AMD APU 做驱动。群里的反应是*"期待已久的玩笑终于来了。"*（[src](https://t.me/c/2424231195/130727)）另外注意一个名字像 `whql-amd-software-adrenalin-edition-25.5.1-...-bc250.exe` 的 `.exe` 曾流传 —— 一个文件名后面被加了 "bc250" 的普通 Adrenalin 安装包并**不会**因此变成一个 BC-250 驱动。（[src](https://t.me/c/2424231195/73924)）
- **"直接强装一张相似显卡的驱动。"** RX 6700 / W5700 / Radeon Pro V340 —— 每个新手的第一个念头，而它已经出现在*"每一个握过 BC-250 的傻瓜"*脑子里了。它不可能行，原因一大堆，不值得重新推导：**BC-250 上没有 Windows 驱动，没有荣誉，也没有啤酒。**（[src](https://t.me/c/2424231195/29710)）
- **频道里的恶意软件。** 有人发过假"驱动"，其实是病毒/压缩炸弹/钓鱼。管理员见到就封；一个干脆名为 `Trojan.txt` 的文件曾经出现过。（[src](https://t.me/c/2424231195/49668)）**只运行那些指名的 GitHub 仓库里的二进制文件，并且要读代码。**

---

## 人们提到的那个 40-CU 解锁脚本呢？

`git clone https://github.com/duggasco/bc250-40cu-unlock.git` 出现在 Windows 话题的闲聊里，主资源清单甚至把它归在 "Windows" 下。**它是一个 Linux `amdgpu` 内核补丁/脚本**（`bc250-enable-40cu.sh`），不是 Windows 工具 —— 它在 Linux 驱动上解锁全部 40 个 CU。它在 [09-overclock-undervolt.md](09-overclock-undervolt.md) 里被正确介绍；它对 Windows 毫无作用。⚠ 核实（没有 Command 语料的 shell 历史确认其 Windows 用途；唯一捕获到的命令就是上面那条朴素的 `git clone`）。

---

## 建议

| 你想要…… | 这样做 |
|---|---|
| 现在玩游戏 / 真正用上板卡 | **装 Linux。** 见 [06-linux.md](06-linux.md)。可用的 GPU 驱动只存在那里。 |
| 关注 / 为 Windows 努力做贡献 | 关注 **Keshas-dev**（PSP + GPU 驱动）和 **ZEROAESQUERDA/BC250-windowsDriverTest**；预期是内核/WDK 工作，不是游戏。 |
| 一个神奇的 `.inf` 或"相似显卡"驱动 | 没有这种东西。到此为止 —— 你只会撞上 Code 43。 |

Windows 支持是一个**移动的靶子**：动手之前，重新核对仓库的提交日期和本节的日期（这反映**2026 年初**）。2025 年的结论是"永远不会"；2026 年把它降级为"还没到" —— 真实的进展，但是固件初始化层的进展，不是可玩桌面层的。

---

## 来源

- 置顶新手警告（"弃绝一切希望"）—— https://t.me/c/2424231195/28109
- Code 43 / W5700 `.inf` / BIOS 改造尝试 —— https://t.me/c/2424231195/57123 · https://t.me/c/2424231195/94029
- "没有 Windows 驱动，没有荣誉，没有啤酒" —— https://t.me/c/2424231195/29710 · 为什么 Linux 而非 Windows —— https://t.me/c/2424231195/13210
- VM 直通行不通 —— https://t.me/c/2424231195/64772
- 第一个"可用"驱动（OpenGL 1.1）及反应 —— https://t.me/c/2424231195/83320 · https://t.me/c/2424231195/83332 · 驱动转储 `00.00.01` —— https://t.me/c/2424231195/83322
- ZEROAESQUERDA 项目置顶 / "坚冰裂开" —— https://t.me/c/2424231195/123644
- 愚人节 "NVIDIA 驱动" —— https://t.me/c/2424231195/130053 · https://t.me/c/2424231195/130727 · 误标的 Adrenalin `.exe` —— https://t.me/c/2424231195/73924
- 恶意软件封禁政策 —— https://t.me/c/2424231195/49668 · 泄露即变砖传言（未经证实）—— https://t.me/c/2424231195/26231
- 仓库 —— [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) · [Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver) · [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest)（[known limitations](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas)）
- AMD 论坛帖（无疾而终）—— https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692
- 40-CU 解锁（Linux，被误标为 Windows）—— https://github.com/duggasco/bc250-40cu-unlock → 见 [09-overclock-undervolt.md](09-overclock-undervolt.md)

> 40-CU 解锁、governor 和 Linux 驱动配置在 [06-linux.md](06-linux.md) 和 [09-overclock-undervolt.md](09-overclock-undervolt.md)。变砖恢复：[08-bios.md](08-bios.md)。
