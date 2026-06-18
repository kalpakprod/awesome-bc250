> 🌐 社区翻译。英文版为权威来源，可能更新更及时。发现错误？请提交 issue：[English](../en/10-wifi-bt.md) · https://github.com/lildebil0/awesome-bc250/issues

# WiFi 与蓝牙 Dongle

> **太长不看** —— BC-250 **没有板载 WiFi 或蓝牙**，所以你需要一个 USB dongle。聊天里最可靠的单一选择是基于 **aic8800d80** 的棒子（例如 *AX90BT / D80MU3*），由 [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) 驱动 —— 有一个测试过的 Bazzite RPM 配方。**Realtek RTL88xx** 棒子便宜又常见，但它们是聊天里头号头疼货：它们能连上，然后在负载下**随机掉线**。[`lwfinger/rtw88`](https://github.com/lwfinger/rtw88)（移植回来的驱动）修复了 RTL8821/8822 家族的大部分问题；RTL8851BU/8831BU "AX900 WiFi 6" 棒子需要 [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831)。如果你想要一个开箱即"就能用"的棒子，机主报告 **Digma DWA-BT5** 系列可以。蓝牙共享 2.4 GHz 射频，所以预期蓝牙活动时 WiFi 吞吐会下降。

如果你只是为了安装需要联网，一个**有线 USB-以太网适配器或板载 NIC** 能完全绕过这一页。当你真正需要无线或一个蓝牙手柄时再去拿 WiFi/BT dongle。

> **关于板载 Realtek RTL8111 以太网：** 它是阻力最小的路径，但 RTL8111/8168 家族在 Linux 上**不稳定到不可靠** —— 原厂 `r8169` 驱动被广泛报告导致随机链路起落、带宽下的掉线，有时掉到 100 Mbit。切到树外的 `r8168` 模块是常见的缓解。如果板载口表现不佳，**优先选 Intel 或 MediaTek 的 USB/PCIe NIC** —— 它们的 Linux 驱动可靠得多。（[Intel/MediaTek vs Realtek 是 Linux 上长期存在的可靠性差距](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)）⚠ RTL8111 的不稳定是一个普遍的 Linux 现象，不是 BC-250 特有的 —— 在你自己的板卡上验证。

---

## 首先要理解的一件事

BC-250 上几乎每一份"我的 dongle 一直掉线"的报告都追溯到**两件事，而不是盒子上的牌子**：

1. **里面的芯片组。** 标签（ASUS、TP-Link、D-Link…）毫无意义 —— 重要的是壳子底下的 Realtek/aic/MediaTek 芯片。三个不同品牌的棒子可能装着完全相同的芯片，并以相同方式失败。（[来源](https://t.me/c/2424231195/16332)）
2. **负载下的 USB 供电/稳定性。** 多名用户看到一个棒子在空闲/上网时跑得好好的，然后**在流量飙升的那一刻掉线**（一个大下载），"好像 USB 跟不上了"。一位用户的 ASUS 棒子在下载时撑了整整 17 分钟就掉了。（[来源](https://t.me/c/2424231195/16331)）·（[来源](https://t.me/c/2424231195/17319)）

所以：**按芯片组挑**，把它匹配到一个维护中的树外驱动，如果它仍然掉线，就把它当作一个供电/复位问题处理（见下面的[修复随机掉线](#修复随机掉线)）。

> **怎么找到芯片组？** 盒子很少印出来。买之前，在线查棒子的 **FCC ID**（印在设备/列表上） —— 备案文件会揭示真正的芯片。插上之后，在 Linux 上跑 **`lsusb`** 看 vendor/product ID 和芯片组。

---

## 已知好用的 dongle

已与驱动仓库交叉核对。"备注"反映聊天成员在 BC-250 上实际观察到的东西。

| 芯片组 | 示例棒子（来自聊天） | 驱动仓库 | 备注 |
|---|---|---|---|
| **aic8800d80** (aic8800) | AX90BT / D80MU3（"AIC device wlan"） | [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) | **最推荐。** 测试过的 Bazzite RPM 配方；WiFi+BT。先显示为一个 USB-CDROM，运行 `install_setup.sh` 后翻转成 `aic device wlan`。（[来源](https://t.me/c/2424231195/120502)） |
| **RTL8821CU / 8821AU** | 通用 Realtek "свисток"（小棒子） | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | 能用，但在旧的内核内驱动上**易随机掉线**。lwfinger 移植版对大多数人稳定；正式修复在内核 6.13–6.14 落地。（[来源](https://t.me/c/2424231195/17321)） |
| **RTL8822BU** | 无名双频棒子 | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | 一位机主：能连上，然后**每 5–10 分钟掉线**。rtw88 的 USB 列表支持它，但在 BC-250 上的可靠性时好时坏。（[来源](https://t.me/c/2424231195/138512)） |
| **RTL8851BU / 8831BU** | "$5 AX900 WiFi 6 + BT 5.3" | [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) | **开箱即不工作** —— WiFi 6 芯片对 rtw88 太新。需要专门的 `8851bu` 驱动。（[来源](https://t.me/c/2424231195/17320)） |
| **Digma DWA-BT5-AC600C / AC1300E** | Digma USB WiFi+BT | 内核内（Realtek） | 报告**开箱即工作**（"第一次就启动了"）；一位 BC-250 机主在产品评论里确认。（[来源](https://t.me/c/2424231195/138520)） |

> **报告为不工作 / 痛苦的：** 通用 **RTL8851BU "AX900"** 开箱（[来源](https://t.me/c/2424231195/17320)）；裸 **RTL8821cu/8821au** 在原厂内核驱动上随机掉线（[来源](https://t.me/c/2424231195/16330)）；一个无名 **RTL8822BU** 每几分钟掉线（[来源](https://t.me/c/2424231195/138512)）。一位用户彻底放弃，转而订了一个 **Edimax EW-7733UnD**。（[来源](https://t.me/c/2424231195/120503)）

---

## 路径 A —— aic8800d80（推荐）

这是 BC-250 故事最干净的芯片。有一个完整的 Bazzite RPM 配方和一篇社区写的小指南。

### Bazzite (rpm-ostree) —— RPM 构建

维护者的 [`bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) 构建一个正经的 RPM，所以驱动比裸 `make` 更能挺过镜像更新。已对照仓库验证：

```bash
# 1. Build deps (then reboot so the overlay is active)
sudo rpm-ostree install rpm-build rpmdevtools dkms
sudo systemctl reboot

# 2. Set up the rpmbuild tree and grab the spec
cd "$HOME"
rpmdev-setuptree
cd "$HOME/rpmbuild/SPECS"
curl -LO -s https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec

# 3. Fetch sources and build
spectool -g -R "$HOME/rpmbuild/SPECS/aic8800d80.spec"
rpmbuild -bs "$HOME/rpmbuild/SPECS/aic8800d80.spec"
sudo rpm-ostree usroverlay
rpmbuild --define "uname $(uname -r)" -bb "$HOME/rpmbuild/SPECS/aic8800d80.spec"

# 4. Install the built RPM and reboot (filename will match your kernel/fedora ver)
sudo rpm-ostree install "$HOME"/rpmbuild/RPMS/x86_64/aic8800d80-*.rpm
sudo systemctl reboot
```

一位聊天成员（[Nurmukhamed](https://github.com/Nurmukhamed/aic8800d80/tree/15a927286788af46529909bc2c14d16ea4241ec0/bazzite)）写了一篇 RPM 打包教程，社区为此感谢了他。（[来源](https://t.me/c/2424231195/122580)）

### 社区小指南（快速的 "make" 路径）

如果你只想*现在*把它弄起来，且不介意重启后重跑，看 Aqtilek 的指南（[来源](https://t.me/c/2424231195/120502)）：

```bash
# The stick first appears as a fake CD-ROM. Flip it to WiFi mode (ONE TIME):
sudo sh install_setup.sh         # now shows as "aic device wlan"

# Temporarily lift the read-only root (Bazzite/atomic):
sudo rpm-ostree usroverlay

# Clone and build the driver (use the repo's "method 2"):
git clone https://github.com/shenmintao/aic8800d80.git && cd aic8800d80
# …then follow the repo's second install method.
```

> ⚠ **重启持久性：** 用裸 `make` 路径，**驱动在每次重启时丢失**，必须重装 —— 作者建议一个小的自启动脚本。（[来源](https://t.me/c/2424231195/120502)）上面的 RPM 路径是持久的修复。

一位成员用的固件/驱动归档（*AX90BT(D80MU3)*）在聊天里分享过。（[来源](https://t.me/c/2424231195/119991)）一个替代的上游 [`goecho/aic8800_linux_drvier`](https://github.com/goecho/aic8800_linux_drvier) 存在，但一位 CachyOS 用户花了 6 小时也没能让它编译 —— 在 BC-250 上优先用 `shenmintao`。（[来源](https://t.me/c/2424231195/82100)）⚠ 在你的发行版上验证。

> **aic8800d80 注意事项（来自驱动的 issue 追踪器）：**
> - 固件 `fmacfw_8800d80_u02.bin` 必须位于 `/lib/firmware/aic8800D80/`；固件上传失败会导致接口卡在 `DOWN` 状态。([aic8800d80 #37](https://github.com/shenmintao/aic8800d80/issues/37) · [#10](https://github.com/shenmintao/aic8800d80/issues/10))
> - **内核 7.0 / 7.1：** 1.0.0 驱动在 DKMS 下构建失败 —— `cfg80211_new_sta` / `cfg80211_del_sta` 的签名发生了变化，且 `-Wimplicit-fallthrough` 错误会导致编译中断。请继续使用较旧版本的内核，或对源码打补丁，直到上游跟进修复。([aic8800d80 #49](https://github.com/shenmintao/aic8800d80/issues/49))
> - **Debian 13（内核 6.12.90）：** Wi-Fi 接口可能会启动失败或无法检测到网络。([aic8800d80 #58](https://github.com/shenmintao/aic8800d80/issues/58))

---

## 路径 B —— Realtek RTL8821 / RTL8822 (rtw88)

便宜又到处都是，但旧内核上的内核内驱动**有 bug 且随机掉线**。修复是来自 `lwfinger/rtw88` 的移植回来的树外驱动。一位成员用过并确认稳定的确切命令（[来源](https://t.me/c/2424231195/16326)）：

```bash
git clone https://github.com/lwfinger/rtw88
cd rtw88
make
sudo make install
sudo make install_fw
```

在 Secure-Boot / DKMS 设置上，仓库还记录了一个 `sudo dkms install $PWD` + `mokutil` 流程 —— 见[仓库 README](https://github.com/lwfinger/rtw88)。

**为何这有帮助：** 掉线是一个已知的驱动 bug；正式修复直到**内核 6.13–6.14** 才进主线，而许多发行版镜像仍带着坏掉的版本。lwfinger 移植版让你现在就拿到修好的驱动。（[来源](https://t.me/c/2424231195/17321)）支持的 USB 部件包括 RTL8811AU/CU、RTL8812AU/BU/CU、RTL8814AU、RTL8821AU/CU 和 RTL8822BU/CU（完整列表在仓库里）。

> 诚实的注意事项：即便用了 rtw88，一位 RTL8821cu 用户仍偶尔看到掉线（"同一顶帽子"），而吞吐相比坏掉但更快的原厂驱动有所下降。（[来源](https://t.me/c/2424231195/16333)）如果可靠性比价格更重要，去用 aic8800d80 或一个确认过的 Digma。

---

## 路径 C —— Realtek RTL8851BU / RTL8831BU（"AX900 WiFi 6"）

非常便宜的"AX900 WiFi 6 + 蓝牙 5.3"棒子用 **RTL8851BU/8831BU**，而 `rtw88` **不**覆盖它们，所以它们开箱即死。（[来源](https://t.me/c/2424231195/17320)）使用专门的驱动 [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831)：

```bash
git clone https://github.com/biglinux/rtl8831
cd rtl8831
sudo dkms install .        # or: make && sudo make install
sudo modprobe 8851bu
```

⚠ 验证 —— 这个仓库没在聊天里被展示在 BC-250 上构建过；命令来自仓库 README。

> **这一类的一个具名示例 —— TP-Link Archer TX10UB Nano（"AX900 WiFi 6 + BT 5.3"）。** 这是一个真实、易找的产品，它的 **WiFi 在 Linux 上能用** —— 它装着 **RTL8851BU** 芯片，所以归在路径 C 下（你需要 `8851bu`/`biglinux/rtl8831` 驱动，而非原厂 rtw88）。**但它的蓝牙在 Linux 上*不*受厂商支持：** TP-Link 自己的规格把该适配器列为仅 Windows 10/11，并明确说**蓝牙功能与 Mac、Linux 或 TV 不兼容**（[TP-Link 产品页](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)）。所以把它当作 **"WiFi 在 Linux 上能用（经由 8851bu 驱动）；BT 在 Linux 上不受厂商支持。"** 社区或许能通过通用 Realtek BT 驱动让它的 BT 起来，但那未经验证 —— **别指望它是一个干净的即插即用 WiFi+BT Linux dongle 而去买它。** **UGreen** 也卖一个被社区报告为替代品的 "AX900" 棒子，但它是同一个 RTL8851BU 家族 —— 验证芯片组，且同样的 BT 注意事项适用。⚠ 验证。

---

## 修复随机掉线

如果你的棒子连上然后掉线（经典的 Realtek-on-BC-250 症状）：

1. **装上正确的树外驱动**（路径 B/C） —— 这解决了大多数情况。
2. **开机后重新插拔。** 一些棒子在冷启动时不被检测，需要一次拔插。（[来源](https://t.me/c/2424231195/16325)）
3. **用软件复位设备而非拔插** —— 用 `usbreset`（无需物理拔出）。（[来源](https://t.me/c/2424231195/135895)）· [如何操作（Superuser）](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
4. **试一个不同的 USB 口**（最好是后置/根集线器口） —— 症状在负载下看起来与供电/带宽相关。（[来源](https://t.me/c/2424231195/17319)）
5. **让 dongle 远离 USB 3.0。** USB 3.0 口是有记录的 **2.4 GHz 射频干扰**来源 —— 高速信令在 2.4–2.5 GHz 上加入约 20 dB 的宽带噪声，没有滤波器能去除，恰好在 WiFi *和*蓝牙所在之处降级它们。Intel 的白皮书是权威参考。把 WiFi/BT dongle 插进一个 **USB 2.0 口**，或用一根**短 USB 延长线**把 dongle 从 USB 3.0 接口和任何 DisplayPort/HDMI 线缆挪开几英寸。（[Intel: USB 3.0 RF Interference Impact on 2.4 GHz Wireless Devices](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf)）

---

## 蓝牙备注

- WiFi+BT 组合棒子共享 **2.4 GHz** 射频，所以**蓝牙活动时 WiFi 吞吐下降**。一位成员测得**开 BT 时 ~150 Mbit vs 关时 ~190 Mbit** —— 真实，但"没那么夸张"。（[来源](https://t.me/c/2424231195/123366)）·（[来源](https://t.me/c/2424231195/123367)）
- aic8800d80 驱动有一个**单独的 `bluetooth` 分支**用于 BT 支持。（[仓库分支](https://github.com/shenmintao/aic8800d80/tree/bluetooth?tab=readme-ov-file)）

- **如果蓝牙一直没有显示，通用的 `btusb` 驱动首先抢占了该设备。** aic8800 蓝牙控制器需要其专有的 `aic_btusb` 模块——内核中的 `btusb` 无法对其进行初始化。使用 `sudo rmmod btusb && sudo modprobe aic_btusb` 来替换它们，或者通过将 `softdep btusb pre: aic_btusb` 添加到 `/etc/modprobe.d/aic8800-bt.conf` 来使其永久生效。([aic8800d80 #53](https://github.com/shenmintao/aic8800d80/issues/53) · [#44](https://github.com/shenmintao/aic8800d80/issues/44))

---

## 购买精选清单

如果你想要风险最低的路径，按顺序：

1. **aic8800d80 棒子**（AX90BT / D80MU3 类）+ Bazzite RPM 配方 —— 文档最齐全，WiFi+BT。
2. **Digma DWA-BT5-AC600C / AC1300E** —— 报告开箱即工作。（[Ozon 列表](https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/)）
3. **RTL8821CU 棒子 + lwfinger/rtw88** —— 最便宜，接受偶尔掉线。
4. 避免最低价的 **RTL8851BU "AX900"**，除非你愿意跟 `biglinux/rtl8831` 较劲。

> 别相信一个 AI 聊天机器人在 dongle 上的"对，老铁，完美选择" —— 一位成员正是这么干的，搞到一个每 5–10 分钟掉线的 RTL8822BU，然后同一个机器人又说它不会工作。按芯片组买，这里已验证。（[来源](https://t.me/c/2424231195/138512)）

---

## 来源

- aic8800d80 Bazzite RPM —— [`shenmintao/aic8800d80` `bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) · spec —— https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec
- aic8800d80 小指南 —— https://t.me/c/2424231195/120502 · RPM fork —— https://t.me/c/2424231195/122580 · 固件 zip —— https://t.me/c/2424231195/119991
- aic8800 BT 分支 —— https://github.com/shenmintao/aic8800d80/tree/bluetooth · 替代仓库 —— https://github.com/goecho/aic8800_linux_drvier (https://t.me/c/2424231195/82100)
- rtw88 构建步骤 —— https://t.me/c/2424231195/16326 · 移植理由 —— https://t.me/c/2424231195/17321 · 驱动 —— [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88)
- RTL8851BU AX900 不工作 —— https://t.me/c/2424231195/17320 · 驱动 —— [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831)
- 掉线症状 / 按芯片不按品牌 —— https://t.me/c/2424231195/16330 · https://t.me/c/2424231195/16331 · https://t.me/c/2424231195/16332 · https://t.me/c/2424231195/17319
- Digma 开箱即工作 —— https://t.me/c/2424231195/138520 · 列表 —— https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/
- AI 推荐的 RTL8822BU 掉线 —— https://t.me/c/2424231195/138512 · Edimax 逃离 —— https://t.me/c/2424231195/120503
- BT vs WiFi 速度 —— https://t.me/c/2424231195/123366 · usbreset —— https://t.me/c/2424231195/135895 · [Superuser 如何操作](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
- 板载 RTL8111/8168 在 Linux 上不稳定；r8168 缓解，优先 Intel/MediaTek —— [LinuxQuestions r8169 vs r8168](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)
- USB 3.0 干扰 2.4 GHz WiFi/BT（用 USB 2.0 / 延长线） —— [Intel 白皮书](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf)
- TP-Link Archer TX10UB Nano —— WiFi 在 Linux 上能用（RTL8851BU），BT 厂商列为仅 Windows / 非 Linux —— [TP-Link 产品页](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)
