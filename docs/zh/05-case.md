> 🌐 社区翻译。英文版为权威来源，可能更新更及时。发现错误？请提交 issue：[English](../en/05-case.md) · https://github.com/lildebil0/awesome-bc250/issues

# 机箱与 3D 打印

> **太长不看** —— BC-250 以裸板出货，所以几乎人人都打印一个外壳。没有唯一"正确"的机箱 —— 社区已经做出了**几十种**设计，从一个只把两半卡在板卡上的极简**散热套**，到带提手、前置屏幕和 RGB 的完整**主机式盒子**。无论你打印什么，机箱都要做一件原装板卡做不到的事：**把一个 120 mm 风扇密封贴住散热片鳍片**，好让空气*穿过*它们（见[散热](04-cooling.md)）。本页就是目录：名称 → STL → 风扇 → 在哪下载。**留意 PSU**：大多数机箱是围绕某个特定电源（LOP、Flex/SFX ATX，或一个 HP 服务器砖块）设计的 —— 挑那个匹配你手里 [PSU](03-power-supply.md) 的机箱。

这里的"机箱"从一个花 20 分钟工时的 200 g 打印件，到一个作者花了几周的多件式主机不等。从简单的开始；你随时能重打。

> **新手而拿不准？打印 [onemorecap 散热套/外壳](#档位-1--极简散热套从这里开始)机箱 —— 极简、无需切割、装得下一个 120 mm 风扇 —— 然后就到此为止。** 下面的目录很深；你不需要读它就能起步。

> **想要完整清单？** elektricM 维护着一个**可搜索、可筛选的约 143 种设计的目录**（按 PSU 系列、可获取性、平台筛选）—— 远比下面这套精选多，包括许多仅 Discord 和开发中的构建。在 **[elektricM —— Cases & Enclosures](https://elektricm.github.io/amd-bc250-docs/community/cases/)** 浏览它。下面的精选是值得作为起点的、有名字且可公开下载的那些。

---

## 社区构建

人们实际打印过的一瞥 —— 从一个裸露的开放外壳到完全主题化的主机。同一块板卡，结果千差万别。

<p align="center">
  <img src="../../assets/img/case-shell.jpg" alt="onemorecap Shell Case: open side-plate, carry handle, exposed copper fins, Arctic 120 mm fan" width="60%"><br>
  <sub>Build by Дима Ткач · <a href="https://t.me/c/2424231195/22771">source</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-frame.jpg" alt="White aluminium open frame with internals on show: twin heatsinks, central white Arctic fan, Flex PSU" width="60%"><br>
  <sub>Build by Сергей · <a href="https://t.me/c/2424231195/87420">source</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-orange.jpg" alt="Orange-and-white enclosed console with perforated mesh side panel and a moulded carry handle" width="60%"><br>
  <sub>Build by Alexander Susl · <a href="https://t.me/c/2424231195/122822">source</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-arasaka.jpg" alt="ARASAKA cyberpunk-themed console: white face, chrome fan grille, green accents and feet" width="60%"><br>
  <sub>Build by Maxim Perelygin · <a href="https://t.me/c/2424231195/98072">source</a></sub>
</p>

---

## 怎么选

三个问题决定哪个机箱适合你：

1. **你用什么 PSU？**（[供电](03-power-supply.md)）—— 一个 Meanwell **LOP-300** 小巧，住在大多数机箱*内部*。一个 **Flex/SFX ATX** PSU 更大，需要一个带专用仓位的机箱。一个回收的 **HP/服务器砖块**需要那些"v3/v4 服务器 PSU"机箱。这是最大的单项筛选条件。
2. **你会跑什么风扇？** 几乎每个机箱都围绕**一个 120 mm 风扇**在散热片上构建。更大的构建会在背板上加**第二个 120 mm** 风扇（冷却 GDDR6 内存，它[没有温度传感器](04-cooling.md)）或给 PSU 供风。少数在高度紧张处用 **140 mm** 或**超薄**风扇。
3. **你减薄鳍片了吗？** 大多数机箱假设你已经把**原装散热片鳍片锉/砂磨开**了（见[散热，路径 A](04-cooling.md)）。机箱本身不能修复原装散热器 —— 它只是把风扇固定在正确的位置。

> **行话，只说一次：** **STL** = 你加载进切片器的标准 3D 打印网格文件。**STEP / 3MF** = 可编辑的 CAD 格式（如果你想修改设计就用这些）。**Shroud / sleeve / adapter（导风罩/套/转接）** = 一个打印的漏斗，让风扇密封贴住鳍片而不是漏气绕过去。**Flex / SFX ATX** = 小尺寸的 PC 电源。**LOP** = 社区偏爱的 Meanwell LOP-300 工业 PSU。

> **💡 给清除 CMOS 跳线打印一个开孔。** 每次你改 VRAM/UMA 划分都要**清除 CMOS**（见 [BIOS](08-bios.md)），所以设计一个把跳线埋起来的密封机箱，意味着要反复把它撬开。在任何封闭设计里，给清除 CMOS 跳线留一个 **⌀10 mm 开孔** —— 或者更好，把一个小的**3 位开关**引到面板上，这样你不用工具就能复位它。（[4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980)）

---

## 档位 1 —— 极简"散热套"（从这里开始）

你能打印的最小、最快的东西。它**其实不算机箱** —— 它是一件打印的外套，以紧密的摩擦配合分两半卡在板卡上，把一个 120 mm 风扇压在散热片上，并引导气流。**无需切割，不往板卡里拧螺丝。** Дима Ткач（项目最早的构建者之一）描述了两个变体 —— 一个紧凑的和一个"更有趣"的 —— 都在 **150 W** 负载下达到**约 70 °C**，各约 210 g / 170 g 塑料，PSU 在湍流气流下保持凉爽（[src](https://t.me/c/2424231195/10743)）。他的评语：*"这其实不算机箱，更像一个散热套，但什么都不用切，全靠很紧的配合固定，两半从相对两侧扣上去。"*

- **文件：** `BC-250-FanSleeves.3mf`（[src](https://t.me/c/2424231195/10766)），板卡 CAD `bc-250-body.step`（[src](https://t.me/c/2424231195/18266)）
- **源仓库：** [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) —— 群里最被推荐的"已验证、已打印、确认可用"的极简设计（[src](https://t.me/c/2424231195/18260)）
- **风扇：** 1× 120 mm
- **PSU：** 任意 —— 有一个给电源引线的孔/开口，所以你能用 LOP *或*一个外部电源（[src](https://t.me/c/2424231195/22950)）

---

## 档位 2 —— 开放式框架 / "外壳"（板卡可见）

把板卡一侧包起来、让散热片可见的半机箱。塑料用得少，易组装，气流好。

### onemorecap "Shell Case" —— 参考构建

群里反应价值最高的单条机箱帖子（❤33）：一块盖在板卡上的平侧板，压印着 **"BC-250"** 和 CU 网格图案，顶部模塑了一个**提手**，中间**露出减薄的散热片鳍片**，一个 120 mm **Arctic** 风扇带自己的导风罩拧在右端。标着 *"BC-250 SHELL CASE BY ONEMORECAP / ASRock × CMG"*（[src](https://t.me/c/2424231195/22771)）。配套的 STL 套件曾一批发到群里（[src](https://t.me/c/2424231195/81672)），作者确认模型在 Printables 和 MakerWorld 上免费（[src](https://t.me/c/2424231195/24505)）。

- **文件（群内批次）：** `Shell_Front.stl`、`Shell_Back_FLEX_ATX.stl`、`Front_Panel.stl`、`USB_Bracket.stl`，外加下面的导风罩（[src](https://t.me/c/2424231195/81680)）
- **源：** [GitHub onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case)
- **风扇：** 1× 或 2× 120 mm（通过导风罩），或 1× 140 mm
- **PSU：** `Shell_Back_FLEX_ATX` 后面板是为一个 **Flex ATX** PSU 切的

### 亚克力开放框架（Владислав）

一个开放的**铝与亚克力**框架：两块金属端板配透明侧板，板卡竖直安装，单个 **Arctic 120 mm** 风扇径直吹过中间减薄的散热片，一个 Flex/SFX PSU 坐在底部仓位（[src](https://t.me/c/2424231195/114651)）。这就是后来作为["acrylic case"被转发到 r/BC250Gaming](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) 的那个设计。打印的支架是你要复刻的部件；框架本身是激光切割/现成的。

- **风扇：** 1× 120 mm（中央）—— 有空间加一个背板风扇
- **PSU：** Flex / SFX ATX 在下部仓位

---

## 档位 3 —— 主机式盒子（完全封闭）

看起来像游戏主机或小型 NAS 的封闭外壳。更多塑料、更多打印时间，但是一个成品，带提手、电源按钮、通风面板，有时还有屏幕。

### "Просто лучший корпус"（Jack Fisher × B1zon）—— 社区最爱

发在精选 **#BC250body** 标签下，称为*"就是最好的机箱"*，这是一个完全成形的主机，附有公开的物料清单：PSU、风扇、接口、橡胶脚垫、电源按钮、螺丝 + 螺纹嵌件、一个风扇 PWM 分线器、一张 "Cyberpunk" 贴纸和一把散热片掰直梳。有些部件已停产并有替代品（[src](https://t.me/c/2424231195/79990)）。设计归功于 B1zon，组装由 Jack Fisher 完成。

- **文件：** `BC250 korpus исправленный.rar`（"BC250 机箱，已修正"）（[src](https://t.me/c/2424231195/79989)）
- **风扇：** 120 mm（前）+ 给第二个风扇的 PWM 分线器
- **PSU：** 内置（LOP 级）

### 三"GPU"前脸（Гослинг）

一个主机盒子，其前面板是一个**假显卡外壳** —— 一排三个圆形风扇开口配 RGB，让机器看起来像一张独立 GPU。展示时在 BC-250 上跑 **Bazzite 42**（[src](https://t.me/c/2424231195/66616)）。这三个开口是装饰性的，盖在单个工作风扇加进气之上。

### 迷宫面板白色主机（Jhonatan）

一个高白盒子，带一块醒目的**迷宫/电路图案通风侧板**、一个发光（绿色）的金属电源按钮，以及前脸上一个全高进气格栅 —— 群里更精致的美学之一（[src](https://t.me/c/2424231195/121274)）。

### 网格迷你塔（Joglik）

一个灰色竖式迷你塔，侧面和顶部有密集的**方格网**、顶边一个槽/提手缺口，以及后底部一个圆形过线孔。干净的工业风（[src](https://t.me/c/2424231195/126525)）。

### 椭圆窗 hi-fi 盒子（a m）

一个白色矩形机箱，造型像一台 hi-fi/微波炉前脸：一个大的**体育场形网孔窗**，风扇在一圈圆形网孔后可见，两侧各有一道竖直网孔槽（[src](https://t.me/c/2424231195/52955)）。作者后来的迭代转向用"正经塑料"而非发泡 PVC，并加了外部 XT 系列供电和 RGB（[src](https://t.me/c/2424231195/128048)）。

### 紧凑主机（Volodymyr Spyrydonov，"v15"）

一个银黑相间的小主机盒子，带一个网孔侧进气和一个暗色前脸，前脸带一个赛博朋克风格的徽标和一条 RGB 灯带，展示时摆在电视旁作为客厅机器（[src](https://t.me/c/2424231195/135995)）。是一长串修订（v15/v19/v20 源图早早分享过）的一部分。

### BC250 Vented Edition（MaelremremDotXYZ）

一个极简的 **FlexATX** 主机，以**鳍片打开**方式运行，在 **2145 MHz / 1.1 V 下保持约 67 °C**，带一个后置 PSU 断电开关。[MakerWorld 2899020](https://makerworld.com/en/models/2899020)。

### Stellar 250（isaacalvex）

一个完整的自给主机，附有一份完整的**构建指南**：内置存储、**WiFi 6**，以及一块 **ESP32 温度显示屏**。[GitHub isaacalvex/AMD-BC-250-Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide)。

### Simple Case for the ASRock AMD BC-250

一个有名字、可公开下载的主机外壳，由[乌克兰构建演练（YouTube）](https://youtu.be/p5Zd86vFe8w)的作者发布 —— 给那些想要一个不带多件式复杂度的成品打印件的人的、一个直白的封闭盒子。[MakerWorld 2870270](https://makerworld.com/en/models/2870270)。

---

## 档位 4 —— 大构建：ATX PSU、AIO 水冷、屏幕

给那些想要全尺寸 PSU、水冷或集成显示屏的人。

### NexGen3D "DIY Steam Machine" 家族

社区里**被指向最多的 3D 项目**（转发 7 次）。Printables 上的一个主机机箱家族，包括一个**水冷"Pro"**变体和一个**"Redux"**版本，后者在前面装得下一块**内置 1080×480 Pi 屏幕**（[Reddit build](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)）。有一个专用的 **AIO 安装**模型，用于把一个 120 mm 一体式水冷装到 die 上。

- [Printables 1499974 — DIY Steam Machine (base)](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite)
- [Printables 1614131 — Pro Liquid-Cooled](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) · [Printables 1649679 — Redux](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) · [Printables 1554003 — AIO mount](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250)
- **风扇/散热：** 120 mm 风冷**或** 120 mm AIO，取决于变体
- **PSU：** LOP 版本和 ATX 版本都有文档

### "Steam Machine Pro" 水冷参考构建（Old Lamer）

一个高端、全水冷的构建，在视频上从头到尾记录 —— 如果你要全力上一台 AIO 机器，可作为采购清单（[Old Lamer](https://youtu.be/afYhUQFa-AY)）。公开的物料清单：

- **AIO：** TEUCER AF 240（240 mm 一体式）装在 die 上
- **PSU：** Mean Well **LOP-600-12**（或更小的选项 **LOP-500-12**）—— 见[供电](03-power-supply.md)
- **风扇：** 2× Arctic **P12 Pro** + 1× Arctic **P8**
- **远程电源：** 一块 **ESP32 继电器板**，用于远程开关机器
- **软件：** Linux 下用 **OpenLinkHub** / **Commander Duo** 驱动 AIO 泵和风扇

---

### Steam Cube —— 参数化竖式机箱，水冷（开发中）

一个**完全参数化**的竖塔机箱，采用 **Xbox Series X** 外形，**以水冷优先**设计，配一个可换的冷端：一个水冷头、一个 **Thermalright AXP90-X47 全铜**，或单个 **Arctic P12 Max**，全都拧到同一个安装座上。它从 **Sol Diego 的 "Xbox Serie X BC-250 Edition"** 草图（[Printables 1748271](https://www.printables.com/model/1748271)）和精确的 **torassk 板卡模型**（[Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)）发展而来，然后被重写为代码（build123d），于是每个尺寸都是一个你可以重新适配的变量，而非固定的网格。

**外形包络及其背后的推理**（由已核实的板卡尺寸和[散热](04-cooling.md)里的热目标推导）：

- **约 180 × 212 × 380 mm** 竖塔 —— 高到足以在板卡旁**竖放一个 240 mm 散热排**（一个约 277 mm 的散热排组件装得进 380 mm 的高度内）。
- **烟囱气流** —— 120 mm 进气在低处，120 mm 排气在高处，于是热量径直上升排出。
- **主动背板是强制的，不是可选的** —— GDDR6 / VRM 那一面[没有温度传感器](04-cooling.md)，所以设计把背面散热当作必需的一部分。
- **散热目标**（设计目标，**不是**实测结果）：水冷 die 在 40 CU 下持续 < 60 °C；AXP90 在 2000 MHz 下 < 75 °C；P12 基准约 73–78 °C。

> ⚠️ **状态：设计概念，不是已验证的打印件。** 当前 CAD 是一个**参数化空间模型** —— 部件尺寸、朝向和位置正确，并导出 8 个 STL + 一个 STEP —— 但它**尚未**被打印、组装或做热测试，而且水冷头是按板卡的包围盒放置的，而非按实测的 die 位置。把它当作一个**可以 fork 的起步 CAD**，而非成品机箱；真正的打印 / 配合 / 热验证是有待完成的下一步。上面的目标是目标，不是基准。

---

### ATX-PSU 机箱（Victor L.、V\ad、服务器 PSU v3/v4）

给一个全尺寸 **ATX** 电源：一个围绕完整 ATX PSU 构建的机箱（[src](https://t.me/c/2424231195/119293)，正发往 MakerWorld）、一个更早的新手 Blender 原型（[src](https://t.me/c/2424231195/105570)），以及一条发布在 Printables/MakerWorld 上、带硬盘和 USB 集线器位的 **HP/服务器 PSU** 产品线。

- [Printables 1580750 — Case v3, HP server PSU + HDD + USB hub](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) · [MakerWorld 2481620 — Case v4, FlexATX & HP-server PSU](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) · [Printables 1550729 — ATX-PSU Bazzite Box](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box)

### 双 120 构建（内存 + PSU 散热）

一块重新设计的安装板，承载**两个 120 mm 风扇** —— 一个按板卡设计者本意引向背板（内存），第二个供给 PSU。配前置的 Lian Li P28 风扇 + 一个 Thermalright C12015，作者在**游戏中保持 2200 MHz @ 80 °C**，而单个前置风扇做不到（[src](https://t.me/c/2424231195/120606)）。为此分享了一个独立的 **`Twin_120mm_Fan_Shroud.stl`**（[src](https://t.me/c/2424231195/121684)）。

### The Lanboy —— 便携街机 / 午餐盒

一个便携午餐盒街机构建：它通过一块 **eDisplayPort 转接板**（[AliExpress](https://www.aliexpress.com/item/1005006351527252.html)）驱动一块 **16″ 笔记本 eDP 面板（1920×1200 @ 165 Hz）**，2× 2″ 扬声器接一个 USB 功放，全靠单个 **12 V ATX 引出**供电。[Printables 1746364](https://www.printables.com/model/1746364)。这个 eDP 转接小技巧对**任何**笔记本面板构建都可复用。

### BC250-HUD（Bloodyly）—— 内置状态屏

一个用于 **Raspberry Pi Zero 2** 的 Qt5/C++ **状态屏应用**（用在像 NexGen3D Redux 这样的构建里）：**通过 USB gadget 模式 60 FPS**，从 MangoHud 读取 FPS/帧时间，感知风扇电压以在睡眠时调暗屏幕，并**包含 vc4 内核补丁**（否则 Pi 会冻结）。屏幕：**8.8″ 1920×480 IPS**（Hannstar HSD088IPW1-A）。[GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD)。

---

## 转接与安装件（不是完整机箱）

解决单个问题的小打印件 —— 通常是把一个散热器或风扇装到板卡上。

- **导风罩**（把风扇密封贴住鳍片）：`Fan_Shroud_Single_120mm.stl`、`Fan_Shroud_Dual_120mm.stl`、`Fan_Shroud_Single_120mm_Restricted.stl`、`Fan_Shroud_Single_140mm.stl`（[src](https://t.me/c/2424231195/81673)）、`Twin_120mm_Fan_Shroud.stl`（[src](https://t.me/c/2424231195/121684)）。也在[散热](04-cooling.md)里编目。
- **背板 / 内存风扇安装件：** `Backplate.stl` + `backplane-top-fixed.stl`（[src](https://t.me/c/2424231195/133049)）；`bottom_fan_mount.stl`、`top_fan_mount.stl`、`Front-Mount.stl`、`Back-Mount.stl`（[src](https://t.me/c/2424231195/131189)）
- **AM4 散热器转接**（把一个标准 CPU 散热器拧到 die 上）：`bc250 am4 adapter polished.stl`、`bc250 cooler mount.stl`（[src](https://t.me/c/2424231195/9949)）。另见 [Printables 1042228 — BC250→AMD CPU-cooler mount](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount)。
- **通用 ITX 安装件**（majzok）：分两部分打印，扣进一个框架 —— 把 BC-250 拧进它，再把框架拧进**任何带标准 ITX 主板孔位的机箱**（在一个 DeepCool CH170 PLUS 里测过）。解决了"没有通用 ITX 安装件"的问题。没有捕获到权威的 Printables 链接 —— 在 Printables/MakerWorld 搜 **"BC-250 ITX Mount"**。
- **Thermalright AXP90-X53 / AXP120-X67 转接**（把低矮散热器装到 die 上）：一个需要 M3 螺纹的打印安装件，按散热器/CPU 压力分不同厚度变体 —— [Printables 1694793](https://www.printables.com/model/1694793)。也在[散热](04-cooling.md)里。
- **120 mm 风扇转接：** `BC250_FanAdapter_120mm.step`（[src](https://t.me/c/2424231195/83135)）、`cooler adapter v3.0 (1).stl`（[src](https://t.me/c/2424231195/111091)）
- **精确板卡模型**（对照这些设计你自己的机箱）：[Printables 1341336 — accurate BC-250 board](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)（[src](https://t.me/c/2424231195/55496)），[Printables 1103626 — AMD BC250 board](https://www.printables.com/model/1103626-amd-bc250-board)

---

## 目录表

标记 *(chat)* 的文件镜像在 `assets/stl/` 下；其余都从所链接的 Printables / MakerWorld / GitHub 页面下载。

| 机箱 / 部件 | 类型 | STL / 源文件 | 风扇 | 下载 |
|---|---|---|---|---|
| **onemorecap cooling sleeve** | 极简套 | `BC-250-FanSleeves.3mf` *(chat)* | 1× 120 | [GitHub onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) |
| **onemorecap Shell Case** ⭐ | 开放外壳 | `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl` *(chat)* | 1–2× 120 / 1× 140 | [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [GitHub](https://github.com/onemorecap/bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case) |
| **亚克力开放框架**（Владислав） | 开放框架 | 打印支架 *(chat #114651)* | 1× 120 | [Reddit thread](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) |
| **"Просто лучший корпус"**（Jack Fisher × B1zon） | 主机 | `BC250 korpus исправленный.rar` *(chat)* | 120 + PWM 分线器 | [chat #79989](https://t.me/c/2424231195/79989) |
| **给 Flex PSU 的极简机箱** | 小盒子 | `minimal-case-...-model_files.zip` *(chat)* | 1× 120 | [Printables 1423572](https://www.printables.com/model/1423572-minimal-case-for-bc250-and-flex-psu) |
| **forgenam case** | 主机 | `forgenam-case-bc250-model_files.zip` *(chat)* | 1× 120 | [Printables 1375929](https://www.printables.com/model/1375929-forgenam-case-bc250) |
| **Minimalist 240** | 主机 + 提手 | `Minimalist 240 Front/Back/Handle.stl` *(chat)* | 120 | [chat #117404](https://t.me/c/2424231195/117404) |
| **M360** | 主机 | `M360 Front.stl`, `M360 Back.stl` *(chat)* | 120 | [chat #126566](https://t.me/c/2424231195/126566) |
| **NexGen3D DIY Steam Machine** ⭐ | 主机 | Printables 文件 | 1× 120 | [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) |
| **NexGen3D Pro (liquid)** | 主机 + AIO | Printables 文件 | 120 AIO | [Printables 1614131](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) |
| **NexGen3D Redux (+screen)** | 主机 + 1080×480 屏幕 | Printables 文件 | 1× 120 | [Printables 1649679](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) |
| **NexGen3D AIO mount** | 转接 | Printables 文件 | 120 AIO | [Printables 1554003](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250) |
| **Case v3 — HP server PSU** | 主机 + HDD/USB | Printables 文件 | 120 | [Printables 1580750](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) |
| **Case v4 — FlexATX / HP PSU** | 主机 | MakerWorld 文件 | 120 | [MakerWorld 2481620](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) |
| **ATX-PSU Bazzite Box** | 全 ATX 盒子 | Printables 文件 | 120 | [Printables 1550729](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box) |
| **ivanov-innokentii case** | 主机 | GitHub 源 | 120 | [GitHub ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) |
| **rLapchynski enclosure** | 外壳 | GitHub 源 | 120 | [GitHub rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure) |
| **BC-250 Scooper** | 导风罩/勺 | Printables 文件 | 120 | [Printables 1282906](https://www.printables.com/model/1282906-bc-250-scooper) |
| **Pitman case** | 主机 | Printables 文件 | 120 | [Printables 1570248](https://www.printables.com/model/1570248-amd-bc-250-pitman-case) |
| **工业风 FlexATX** | 主机 | `amd_bc_250_industrial_style_case...zip` *(chat)* | 120（无原装散热器） | [chat #144265](https://t.me/c/2424231195/144265) |
| **The Lanboy** | 便携街机 + 16″ eDP 屏幕 | Printables 文件 | 12 V ATX 引出 | [Printables 1746364](https://www.printables.com/model/1746364) |
| **BC250 Vented Edition**（MaelremremDotXYZ） | FlexATX 主机，鳍片打开 | MakerWorld 文件 | 120 | [MakerWorld 2899020](https://makerworld.com/en/models/2899020) |
| **Stellar 250**（isaacalvex） | 主机 + 构建指南（WiFi6, ESP32） | GitHub 指南 | 120 | [GitHub isaacalvex/...Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide) |
| **Simple Case for the ASRock AMD BC-250** | 主机 | MakerWorld 文件 | 120 | [MakerWorld 2870270](https://makerworld.com/en/models/2870270) |
| **BC250-HUD**（Bloodyly） | 内置 Pi Zero 2 状态屏 | GitHub 源 | — | [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD) |
| **通用 ITX 安装件**（majzok） | 转接（任意 ITX 机箱） | 搜 Printables/MakerWorld | — | "BC-250 ITX Mount" |
| **Thermalright AXP90/AXP120 mount** | 低矮散热器转接 | Printables 文件 | 低矮塔 | [Printables 1694793](https://www.printables.com/model/1694793) |
| **Twin-120 安装板** | 转接板 | `Twin_120mm_Fan_Shroud.stl` *(chat)* | 2× 120 | [chat #121684](https://t.me/c/2424231195/121684) |
| **导风罩（120/140）** | 导风罩 | `Fan_Shroud_Single_120mm.stl`, `_Dual_120mm`, `_Single_140mm`, `_120mm_Restricted` *(chat)* | 120 / 140 | [Printables 1339540](https://www.printables.com/model/1339540-yet-another-bc-250-fan-shroud) · 见[散热](04-cooling.md) |
| **AM4 散热器转接** | 安装件 | `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` *(chat)* | 塔/AIO | [Printables 1042228](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount) |
| **精确板卡模型** | 参考 CAD | `bc-250-body.step` *(chat)* | — | [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) |

⭐ = 社区里反应价值最高 / 转发最多。

### 更多公开设计（出自 elektricM 的目录）

来自 [elektricM 的 143 种设计目录](https://elektricm.github.io/amd-bc250-docs/community/cases/)、上面未列出的、有名字且可下载的设计 —— 按它们围绕构建的 PSU 分组。仅 Discord/开发中的构建及缩略图请浏览完整目录。

**MeanWell LOP（内置 PSU）：**

| 机箱 / 部件 | 看点 | 下载 |
|---|---|---|
| **Steamboat Case**（yannichaboyer） | LOP-300 主机 | [MakerWorld 2431616](https://makerworld.com/en/models/2431616) |
| **Ultra-Thin Custom Case**（MrRoze） | 超薄 LOP-300 | [Printables 1626501](https://www.printables.com/model/1626501) |
| **Internal PSU 2×140 mm**（Kacikor） | LOP-400，双 140 | [Printables 1599644](https://www.printables.com/model/1599644) · [MakerWorld 2400574](https://makerworld.com/en/models/2400574) |
| **Push-Pull Internal 12V PSU**（penzoiders） | push-pull | [MakerWorld 2505974](https://makerworld.com/en/models/2505974) |
| **Shell Case + 40 mm SSD fan**（Munkee915） | Shell 改版，SSD 散热 | [Printables 1568074](https://www.printables.com/model/1568074) |
| **Noctua Push-Pull Mod**（Janjd） | Shell 改版 | [MakerWorld 2354123](https://makerworld.com/en/models/2354123) |

**MeanWell LRS/UHP（另一个常见的服务器砖块）：**

| 机箱 / 部件 | 看点 | 下载 |
|---|---|---|
| **LRS-350-12 PSU Case**（TARGZ） | LRS-350 盒子 | [Printables 1543979](https://www.printables.com/model/1543979) |
| **BC250 slim case**（C4kew4lk） | UHP-350-12，超薄 | [Printables 1504664](https://www.printables.com/model/1504664) |

**FlexATX —— Arthrimus "Console Style" 家族**（一整条改版谱系；这个超薄主机是社区常备款）：

| 机箱 / 部件 | 看点 | 下载 |
|---|---|---|
| **Console Style Case v1**（Arthrimus） | 原版 | [Thingiverse 7165679](https://www.thingiverse.com/thing:7165679) · [MakerWorld 2097988](https://makerworld.com/ko/models/2097988-bc250) |
| **Slim Console Style Case**（Arthrimus） | 超薄变体 | [Thingiverse 7172528](https://www.thingiverse.com/thing:7172528) |
| **Slim Console — double-fan mod**（TKXXTH） | 双风扇 | [Thingiverse 7214884](https://www.thingiverse.com/thing:7214884) |
| **Slim Console — On/Off + Apevia** | 电源开关 | [Thingiverse 7274042](https://www.thingiverse.com/thing:7274042) |

**FlexATX —— 其他：**

| 机箱 / 部件 | 看点 | 下载 |
|---|---|---|
| **Minimal Case (Toolless)**（chriszf） | 无螺丝 | [Printables 1423572](https://www.printables.com/model/1423572) |
| **Minimalist BC-250 Case**（SebastienGau/Gadget） | 极简 | [Printables 1581724](https://www.printables.com/model/1581724) |
| **ADT UT3G eGPU-Inspired**（R0mn） | eGPU 外观 | [Printables 1539301](https://www.printables.com/model/1539301) |
| **"Steam Machine" by MrLarva** | 主机 | [Printables 1618501](https://www.printables.com/model/1618501) · [MakerWorld 2453965](https://makerworld.com/en/models/2453965) · [Thingiverse 7278235](https://www.thingiverse.com/thing:7278235) |
| **Steam Machine**（Pocket Adventures） | 主机 | [MakerWorld 2350219](https://makerworld.com/en/models/2350219) |
| **Steam Machine Slim Console**（MTSquar3D） | 超薄 + 超频 vRAM 风扇套件 | [MakerWorld 2232434](https://makerworld.com/en/models/2232434) · [Thingiverse 7271946](https://www.thingiverse.com/thing:7271946) |
| **ASRock Console Case**（songdawgdesigns） | 主机 | [Printables 1617023](https://www.printables.com/model/1617023) · [Cults3D](https://cults3d.com/en/3d-model/gadget/asrock-amd-bc-250-console-case-steamos-bazzite-diy-steam-machine-style-build) |
| **AMD BC250 Case**（vitamins） | 主机 | [MakerWorld 2219947](https://makerworld.com/en/models/2219947) |
| **E-waste Steam Machine**（Pesen333） | 回收料构建 | [Thingiverse 7245584](https://www.thingiverse.com/thing:7245584) |

**全 ATX：**

| 机箱 / 部件 | 看点 | 下载 |
|---|---|---|
| **Case for Standard ATX**（CatSiewDai） | ATX 盒子 | [Printables 1553599](https://www.printables.com/model/1553599) |
| **ATX + Fan Duct**（ZMASLO） | 带风道 | [Printables 1616167](https://www.printables.com/model/1616167) |
| **Dual Fan ATX Case**（Mateo Fdez） | 双风扇 | [Printables 1579658](https://www.printables.com/model/1579658) |
| **Simple Wooden Case**（suvalle55） | 木质 + ATX | [Printables 1595794](https://www.printables.com/model/1595794) |
| **Open Frame + IKEA hack**（GreatApo） | 开放框架 | [Thingiverse 7314188](https://www.thingiverse.com/thing:7314188) |
| **Case for ATX PSU**（matmiak） | ATX 盒子 | [Thingiverse 7303096](https://www.thingiverse.com/thing:7303096) |

**TFX / VESA / 现成的：**

| 机箱 / 部件 | 看点 | 下载 |
|---|---|---|
| **Case Remix for TFX**（PlayNation） | TFX-400 PSU | [MakerWorld 2387157](https://makerworld.com/en/models/2387157) |
| **VESA 100/75 Basket**（Oleksii） | 装在显示器背后 | [MakerWorld 1844470](https://makerworld.com/en/models/1844470) |
| **3.9L MKII FlexATX + PS5 fan**（FitFormSolutions） | 买一套成品套件 | [Etsy](https://www.etsy.com/listing/4405362103/) · [eBay](https://www.ebay.com/itm/127460591552) |
| **Shiny Snake S400**（10.8 L 网孔 ITX） | 已知好用的现成主机（BC-250→AM4 安装件 + PSU 仓里的 H60 AIO + 定制 ATX I/O 挡板） | [AliExpress](https://a.aliexpress.com/_EyQdoBU) |
| **SFX-PSU 极简机箱**（Methsman） | 全 SFX PSU、磁吸面板、USB 集线器、AXP120 + Noctua 120 —— *文件开发中 / 尚未发布* | — |
| **Cults3D ATX/服务器产品线**（KABANCHYK, lumstudio, kapa3D） | 付费 STL | [Cults3D — bc-250](https://cults3d.com/en/3d-model/gadget/bc-250-atx-case) |

---

## 没有打印机？人们用的办法

- **买一个打印件。** [Etsy](https://www.etsy.com/listing/1904632447/)、eBay 和 OLX 上有卖家；也有人在群里提出代打印/出售机箱（[src](https://t.me/c/2424231195/55507)）。
- **按需打印：** 把一个 STL 上传到某个服务。群里有构建者在跑打印农场（一位展示了一墙的 Flsun/Creality/Bambu 打印机，[src](https://t.me/c/2424231195/73481)）。
- **完全不用机箱 / 改造别的东西。** 很多人在测试时让板卡裸跑在开放台架上。另一些人掏空现有硬件：一台旧一体机植入板卡配一个鼓风机（[src](https://t.me/c/2424231195/30914)）、一个通风管道盒子（[src](https://t.me/c/2424231195/64265)），或铝制功放外壳（需要锉/钻，[src](https://t.me/c/2424231195/108907)）。一位成员甚至把板卡藏进一台旧 VHS 播放器里当个玩笑（[src](https://t.me/c/2424231195/84106)）。**Xbox One 外壳**（JoeyDepDollas）：掏空一台坏掉的 Xbox One，把一套完整 BC-250 构建装进去 —— 负载下 CPU 和 GPU 保持在 **60 °C** 以下；坏掉的捐件主机在 eBay 上约 **$15 含运费**，还能拆出可复用的部件。
- **激光切割胶合板**（ContributionRich3242）：不是 3D 打印 —— 在转角处用刻痕弯折的胶合板，后部留一大块区域做额外散热，在 **40 CU（1800 MHz，CPU 3.9 GHz）下达到 75 °C**，且静悄悄。（激光文件没有发布。）它的**背板散热技术**对任何机箱都可复用：芯片→背板用导热膏、背板→后部散热器用导热膏，并用 VRM 缝里紧的 R 型开口销 + Kapton 胶带固定后部散热器（40 CU 下约低 20 °C）。

> 一块裸露、散热良好的板卡胜过一个密封漂亮但气流糟糕的盒子。先把[散热](04-cooling.md)做对；机箱是第二步。

---

## 来源

- 精选 **#BC250body** 展示（每天一个好构建）—— 置顶想法 [src](https://t.me/c/2424231195/79685)
- 极简套，两个变体 —— [src](https://t.me/c/2424231195/10743) · 模型在 [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) [src](https://t.me/c/2424231195/18260)
- Shell Case（❤33）—— [src](https://t.me/c/2424231195/22771) · 在 Printables/MakerWorld 免费 [src](https://t.me/c/2424231195/24505) · STL 批次 [src](https://t.me/c/2424231195/81680)
- "Просто лучший корпус" + 物料清单 —— [src](https://t.me/c/2424231195/79990) · 文件 [src](https://t.me/c/2424231195/79989)
- 亚克力开放框架 —— [src](https://t.me/c/2424231195/114651) · [Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/)
- 双 120 安装板，2200 MHz @ 80 °C —— [src](https://t.me/c/2424231195/120606) · 导风罩 [src](https://t.me/c/2424231195/121684)
- 主机设计（照片）—— Гослинг/Bazzite [src](https://t.me/c/2424231195/66616) · Jhonatan 迷宫面板 [src](https://t.me/c/2424231195/121274) · Joglik 网格 [src](https://t.me/c/2424231195/126525) · a m 椭圆窗 [src](https://t.me/c/2424231195/52955) · Spyrydonov v15 [src](https://t.me/c/2424231195/135995)
- NexGen3D Steam Machine 家族 —— [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) · [Redux + Pi 屏幕 (Reddit)](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)
- 板卡参考模型 —— [src](https://t.me/c/2424231195/55496) · [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)
- GitHub 机箱仓库 —— [onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) · [rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure)
- **elektricM 完整机箱目录（约 143 种设计，可搜索/筛选）** —— [elektricm.github.io/amd-bc250-docs/community/cases](https://elektricm.github.io/amd-bc250-docs/community/cases/)
- Simple Case（MakerWorld 2870270）+ 乌克兰构建演练 —— [MakerWorld 2870270](https://makerworld.com/en/models/2870270) · [Old Lamer (YouTube)](https://youtu.be/p5Zd86vFe8w)
- 清除 CMOS 开孔小窍门 —— [4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980)
- "Steam Machine Pro" 水冷构建物料清单（TEUCER AF 240、Mean Well LOP-600-12、Arctic P12 Pro/P8、ESP32 继电器、OpenLinkHub/Commander Duo）—— [Old Lamer (YouTube)](https://youtu.be/afYhUQFa-AY)

> 导风罩 STL 与[散热](04-cooling.md)共享。所有群内托管的 STL/STEP/3MF 文件镜像在 `assets/stl/` 下。
