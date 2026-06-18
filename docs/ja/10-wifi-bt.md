# WiFi と Bluetooth のドングル

> **要点** — BC-250 には **オンボードの WiFi も Bluetooth もない** ので、USB ドングルが必要です。チャットで最も信頼できる単一の選択肢は **aic8800d80** ベースのスティック（例: *AX90BT / D80MU3*）で、[`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) で駆動します — テスト済みの Bazzite RPM レシピがあります。**Realtek RTL88xx** スティックは安くて一般的ですが、チャットの頭痛のタネ No.1 です: つながった後、**負荷下でランダムに切断** します。[`lwfinger/rtw88`](https://github.com/lwfinger/rtw88)（バックポートしたドライバー）が RTL8821/8822 ファミリのそれのほとんどを直します; RTL8851BU/8831BU の「AX900 WiFi 6」スティックには [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) が必要です。棚から出して「ただ動く」スティックが欲しいなら、オーナーは **Digma DWA-BT5** シリーズがそうだと報告しています。Bluetooth は 2.4 GHz 無線を共有するので、BT がアクティブな間は WiFi スループットが落ちると見込んでください。

セットアップ用にインターネットだけが必要なら、**有線 USB-Ethernet アダプターかオンボード NIC** がこのページ全体を回避します。実際にワイヤレスや Bluetooth コントローラーが必要なときに WiFi/BT ドングルに手を伸ばしてください。

> **オンボードの Realtek RTL8111 イーサネットについて:** これは最小抵抗の道ですが、RTL8111/8168 ファミリは **Linux で気まぐれ〜信頼できない** です — ストックの `r8169` ドライバーはランダムなリンクのアップ/ダウン、帯域幅下でのドロップアウト、時には 100 Mbit への低下を引き起こすと広く報告されています。アウトオブツリーの `r8168` モジュールへの切り替えが通常の緩和策です。オンボードポートが誤動作するなら、**Intel または MediaTek の USB/PCIe NIC を優先** してください — それらの Linux ドライバーははるかに信頼できます。([Intel/MediaTek vs Realtek は Linux の信頼性における長年のギャップです](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)) ⚠ RTL8111 の気まぐれさは BC-250 固有ではなく一般的な Linux のパターンです — 自分のボードで確認してください。

---

## まず理解すべき 1 つのこと

BC-250 上のほぼすべての「ドングルが切断し続ける」報告は、**箱に書いてあるブランドではなく、2 つのこと** に行き着きます:

1. **中のチップセット。** ラベル（ASUS、TP-Link、D-Link…）は無意味です — 重要なのは外殻の下にある Realtek/aic/MediaTek チップです。異なるブランドの 3 つのスティックがまったく同じチップを載せ、同じように失敗し得ます。([src](https://t.me/c/2424231195/16332))
2. **負荷下での USB の電力/安定性。** 複数のユーザーが、スティックがアイドル/ブラウジング中はきちんと動き、それから **トラフィックがスパイクした瞬間にドロップ**（大きなダウンロード）するのを見ています、「まるで USB が追いつけないかのように」。あるユーザーの ASUS スティックは、ダウンロードでドロップするまでにたった 17 分しか持ちませんでした。([src](https://t.me/c/2424231195/16331)) · ([src](https://t.me/c/2424231195/17319))

なので: **チップセットで選び**、それをメンテナンスされたアウトオブツリードライバーに合わせ、それでもドロップするなら、電力/リセットの問題として扱ってください（下記の [切断を直す](#ランダムな切断を直す) を参照）。

> **チップセットはどうやって調べる?** 箱はめったに印刷していません。買う前に、スティックの **FCC ID**（デバイス/リスティングに印刷）をオンラインで調べてください — その申請が本当のチップを明かします。プラグインした後は、Linux で **`lsusb`** を実行してベンダー/プロダクト ID とチップセットを見ます。

---

## 既知の良好なドングル

ドライバーリポジトリと相互確認しました。「メモ」はチャットメンバーが実際に BC-250 で観察したことを反映しています。

| Chipset | Example sticks (from chat) | Driver repo | Notes |
|---|---|---|---|
| **aic8800d80** (aic8800) | AX90BT / D80MU3 ("AIC device wlan") | [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) | **最も推奨。** テスト済み Bazzite RPM レシピ; WiFi+BT。最初は USB-CDROM として現れ、`install_setup.sh` 後に `aic device wlan` に切り替わる。([src](https://t.me/c/2424231195/120502)) |
| **RTL8821CU / 8821AU** | generic Realtek "свисток" | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | 動くが、古いカーネル内蔵ドライバーでは **ランダムなドロップが起きやすい**。lwfinger バックポートはほとんどで安定; 適切な修正はカーネル 6.13–6.14 で着地。([src](https://t.me/c/2424231195/17321)) |
| **RTL8822BU** | unnamed dual-band stick | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | あるオーナー: つながった後、**5–10 分ごとにドロップ**。rtw88 USB リストでサポートされているが BC-250 での信頼性は当たり外れ。([src](https://t.me/c/2424231195/138512)) |
| **RTL8851BU / 8831BU** | "$5 AX900 WiFi 6 + BT 5.3" | [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) | **箱出しで動かなかった** — WiFi 6 チップが rtw88 には新しすぎる。専用の `8851bu` ドライバーが必要。([src](https://t.me/c/2424231195/17320)) |
| **Digma DWA-BT5-AC600C / AC1300E** | Digma USB WiFi+BT | in-kernel (Realtek) | **箱出しで動作** と報告（「一発で起動した」）; BC-250 オーナーが製品レビューで確認。([src](https://t.me/c/2424231195/138520)) |

> **動かなかった / 苦痛だったと報告されたもの:** 箱出しの汎用 **RTL8851BU「AX900」** ([src](https://t.me/c/2424231195/17320)); 素の **RTL8821cu/8821au** はストックカーネルドライバーでランダムにドロップ ([src](https://t.me/c/2424231195/16330)); 無名の **RTL8822BU** は数分ごとにドロップ ([src](https://t.me/c/2424231195/138512))。あるユーザーは完全に諦めて代わりに **Edimax EW-7733UnD** を注文しました。([src](https://t.me/c/2424231195/120503))

---

## 道 A — aic8800d80（推奨）

これは BC-250 で最もきれいな経緯を持つチップです。完全な Bazzite RPM レシピとコミュニティが書いたミニガイドがあります。

### Bazzite (rpm-ostree) — RPM ビルド

メンテナの [`bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) は適切な RPM をビルドするので、ドライバーは生の `make` よりイメージアップデートをうまく生き残ります。リポジトリと照合済み:

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

チャットメンバー（[Nurmukhamed](https://github.com/Nurmukhamed/aic8800d80/tree/15a927286788af46529909bc2c14d16ea4241ec0/bazzite)）が RPM パッケージングのウォークスルーを書き、コミュニティが感謝しました。([src](https://t.me/c/2424231195/122580))

### コミュニティのミニガイド（手軽な「make」の道）

*今すぐ* 立ち上げたくてリブート後に再実行するのを気にしないなら、Aqtilek のガイド ([src](https://t.me/c/2424231195/120502)):

```bash
# The stick first appears as a fake CD-ROM. Flip it to WiFi mode (ONE TIME):
sudo sh install_setup.sh         # now shows as "aic device wlan"

# Temporarily lift the read-only root (Bazzite/atomic):
sudo rpm-ostree usroverlay

# Clone and build the driver (use the repo's "method 2"):
git clone https://github.com/shenmintao/aic8800d80.git && cd aic8800d80
# …then follow the repo's second install method.
```

> ⚠ **リブートの永続性:** 生の `make` の道では、**ドライバーはリブートのたびに失われ** 再インストールが必要です — 作者は小さな自動起動スクリプトを提案しています。([src](https://t.me/c/2424231195/120502)) 上記の RPM の道が永続的な修正です。

あるメンバーが使ったファームウェア/ドライバーアーカイブ（*AX90BT(D80MU3)*）はチャットで共有されました。([src](https://t.me/c/2424231195/119991)) 別の上流、[`goecho/aic8800_linux_drvier`](https://github.com/goecho/aic8800_linux_drvier) も存在しますが、ある CachyOS ユーザーは 6 時間費やしてもコンパイルできませんでした — BC-250 では `shenmintao` を優先してください。([src](https://t.me/c/2424231195/82100)) ⚠ 自分のディストロで確認してください。

> **aic8800d80の注意点 (ドライバーのイシュートラッカーより):**
> - ファームウェア `fmacfw_8800d80_u02.bin` は `/lib/firmware/aic8800D80/` に配置されている必要があります。ファームウェアのアップロードに失敗すると、インターフェースが `DOWN` のまま動かなくなります。 ([aic8800d80 #37](https://github.com/shenmintao/aic8800d80/issues/37) · [#10](https://github.com/shenmintao/aic8800d80/issues/10))
> - **Kernel 7.0 / 7.1:** 1.0.0 ドライバーは DKMS でのビルドに失敗します。`cfg80211_new_sta` / `cfg80211_del_sta` のシグネチャが変更され、`-Wimplicit-fallthrough` エラーによりコンパイルが失敗するためです。アップストリームが対応するまでは、古いカーネルを使用するか、ソースにパッチを適用してください。 ([aic8800d80 #49](https://github.com/shenmintao/aic8800d80/issues/49))
> - **Debian 13 (kernel 6.12.90):** Wi-Fi インターフェースの起動やネットワークの検出に失敗することがあります。 ([aic8800d80 #58](https://github.com/shenmintao/aic8800d80/issues/58))

---

## 道 B — Realtek RTL8821 / RTL8822 (rtw88)

安くてどこにでもありますが、古いカーネルでのカーネル内蔵ドライバーは **バグが多くランダムにドロップ** します。修正は `lwfinger/rtw88` のバックポートしたアウトオブツリードライバーです。あるメンバーが使って安定を確認した正確なコマンド ([src](https://t.me/c/2424231195/16326)):

```bash
git clone https://github.com/lwfinger/rtw88
cd rtw88
make
sudo make install
sudo make install_fw
```

Secure-Boot / DKMS セットアップでは、リポジトリは `sudo dkms install $PWD` + `mokutil` フローも文書化しています — [リポジトリ README](https://github.com/lwfinger/rtw88) を参照。

**なぜこれが役立つか:** ドロップアウトは既知のドライバーバグです; 適切な修正は **カーネル 6.13–6.14** でようやくメインラインに到達し、多くのディストロイメージはまだ壊れたバージョンを同梱していました。lwfinger バックポートは今、修正されたドライバーを与えます。([src](https://t.me/c/2424231195/17321)) サポートされる USB パーツには RTL8811AU/CU、RTL8812AU/BU/CU、RTL8814AU、RTL8821AU/CU、RTL8822BU/CU が含まれます（フルリストはリポジトリに）。

> 正直な注意点: rtw88 でも、RTL8821cu のあるユーザーは依然として時折ドロップを見ました（「同じ帽子」）、そしてスループットは壊れているが速いストックドライバーよりやや落ちます。([src](https://t.me/c/2424231195/16333)) 価格より信頼性が重要なら、aic8800d80 か確認済みの Digma にしてください。

---

## 道 C — Realtek RTL8851BU / RTL8831BU（「AX900 WiFi 6」）

非常に安い「AX900 WiFi 6 + Bluetooth 5.3」スティックは **RTL8851BU/8831BU** を使い、これを `rtw88` は **カバーしない** ので、箱出しでは動きません。([src](https://t.me/c/2424231195/17320)) 専用ドライバー [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) を使ってください:

```bash
git clone https://github.com/biglinux/rtl8831
cd rtl8831
sudo dkms install .        # or: make && sudo make install
sudo modprobe 8851bu
```

⚠ 確認 — このリポジトリは BC-250 でビルドされる様子がチャットで示されていません; コマンドはリポジトリ README からです。

> **このクラスの名前付き例 — TP-Link Archer TX10UB Nano（「AX900 WiFi 6 + BT 5.3」）。** これは実在の見つけやすい製品で、その **WiFi は Linux で動きます** — **RTL8851BU** チップを載せているので道 C に該当します（ストックの rtw88 ではなく `8851bu`/`biglinux/rtl8831` ドライバーが必要）。**しかしその Bluetooth は Linux でベンダーサポートされていません:** TP-Link 自身のスペックはこのアダプターを Windows 10/11 のみとし、**Bluetooth 機能は Mac、Linux、TV と互換性がない** と明示しています ([TP-Link 製品ページ](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/))。なのでこれを **「WiFi は Linux で動く（8851bu ドライバー経由）; BT は Linux でベンダーサポートされていない」** として扱ってください。コミュニティは汎用 Realtek BT ドライバーで BT を立ち上げるかもしれませんが、それは未検証です — **クリーンなプラグアンドプレイの WiFi+BT Linux ドングルを期待して買わないでください。** **UGreen** も「AX900」スティックを売っており代替としてコミュニティで報告されていますが、同じ RTL8851BU ファミリです — チップセットを確認し、同じ BT の注意点が当てはまります。⚠ 確認してください。

---

## ランダムな切断を直す

スティックがつながった後にドロップする場合（古典的な Realtek-on-BC-250 の症状）:

1. **正しいアウトオブツリードライバーをインストール**（道 B/C） — これがほとんどのケースを解決します。
2. **起動後に挿し直す。** 一部のスティックはコールドブートで検出されず、一度抜き挿しが必要です。([src](https://t.me/c/2424231195/16325))
3. **物理的に抜く代わりにソフトウェアでデバイスをリセット** — `usbreset` を使う（物理的に引き抜く必要なし）。([src](https://t.me/c/2424231195/135895)) · [how-to (Superuser)](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
4. **別の USB ポートを試す**（できれば背面/ルートハブのポート） — 症状は負荷下での電力/帯域幅関連に見えます。([src](https://t.me/c/2424231195/17319))
5. **ドングルを USB 3.0 から外しておく。** USB 3.0 ポートは **2.4 GHz の RF 干渉** の文書化されたソースです — 高速シグナリングが 2.4–2.5 GHz にわたって 〜20 dB のブロードバンドノイズを加え、これはどんなフィルターでも除去できず、まさに WiFi と Bluetooth が住む場所でそれらを劣化させます。Intel のホワイトペーパーが正典のリファレンスです。WiFi/BT ドングルを **USB 2.0 ポート** に挿すか、**短い USB 延長ケーブル** を使ってドングルを USB 3.0 コネクタや DisplayPort/HDMI 配線から数インチ離してください。([Intel: USB 3.0 RF Interference Impact on 2.4 GHz Wireless Devices](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf))

---

## Bluetooth のメモ

- WiFi+BT コンボスティックは **2.4 GHz** 無線を共有するので、**Bluetooth がアクティブな間は WiFi スループットが落ちます**。あるメンバーは **BT オンで 〜150 Mbit vs オフで 〜190 Mbit** を測定しました — 実在しますが「それほど劇的ではない」とのこと。([src](https://t.me/c/2424231195/123366)) · ([src](https://t.me/c/2424231195/123367))
- aic8800d80 ドライバーには BT サポート用の **別の `bluetooth` ブランチ** があります。([repo branch](https://github.com/shenmintao/aic8800d80/tree/bluetooth?tab=readme-ov-file))

- **Bluetoothがまったく表示されない場合は、一般的な `btusb` ドライバーが先にデバイスを掴んでしまっています。** aic8800 BTコントローラーには独自の `aic_btusb` モジュールが必要です。カーネル内の `btusb` では初期化できません。`sudo rmmod btusb && sudo modprobe aic_btusb` で入れ替えるか、`/etc/modprobe.d/aic8800-bt.conf` に `softdep btusb pre: aic_btusb` を追加して永続化させてください。 ([aic8800d80 #53](https://github.com/shenmintao/aic8800d80/issues/53) · [#44](https://github.com/shenmintao/aic8800d80/issues/44))

---

## 購入のショートリスト

最もリスクの低い道が欲しいなら、順に:

1. **aic8800d80 スティック**（AX90BT / D80MU3 クラス）+ Bazzite RPM レシピ — 最も文書化されている、WiFi+BT。
2. **Digma DWA-BT5-AC600C / AC1300E** — 箱出しで動作と報告。([Ozon リスティング](https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/))
3. **RTL8821CU スティック + lwfinger/rtw88** — 最安、時折のドロップを受け入れる。
4. `biglinux/rtl8831` と戦う気がない限り、最底値の **RTL8851BU「AX900」** を避ける。

> ドングルについて AI チャットボットの「やあ兄弟、完璧な選択だ」を信頼しないでください — あるメンバーがまさにそうして、5–10 分ごとにドロップする RTL8822BU を手に入れ、同じボットがその後それは動かないだろうと言いました。チップセットで買ってください、ここで検証済みです。([src](https://t.me/c/2424231195/138512))

---

## ソース

- aic8800d80 Bazzite RPM — [`shenmintao/aic8800d80` `bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) · spec — https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec
- aic8800d80 mini-guide — https://t.me/c/2424231195/120502 · RPM fork — https://t.me/c/2424231195/122580 · firmware zip — https://t.me/c/2424231195/119991
- aic8800 BT branch — https://github.com/shenmintao/aic8800d80/tree/bluetooth · alt repo — https://github.com/goecho/aic8800_linux_drvier (https://t.me/c/2424231195/82100)
- rtw88 build steps — https://t.me/c/2424231195/16326 · backport rationale — https://t.me/c/2424231195/17321 · driver — [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88)
- RTL8851BU AX900 not working — https://t.me/c/2424231195/17320 · driver — [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831)
- Dropout symptom / by-chip-not-brand — https://t.me/c/2424231195/16330 · https://t.me/c/2424231195/16331 · https://t.me/c/2424231195/16332 · https://t.me/c/2424231195/17319
- Digma works OOB — https://t.me/c/2424231195/138520 · listing — https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/
- AI-recommended RTL8822BU drops — https://t.me/c/2424231195/138512 · Edimax escape — https://t.me/c/2424231195/120503
- BT vs WiFi speed — https://t.me/c/2424231195/123366 · usbreset — https://t.me/c/2424231195/135895 · [Superuser how-to](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
- Onboard RTL8111/8168 flaky on Linux; r8168 mitigation, prefer Intel/MediaTek — [LinuxQuestions r8169 vs r8168](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)
- USB 3.0 interferes with 2.4 GHz WiFi/BT (use USB 2.0 / extension) — [Intel white paper](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf)
- TP-Link Archer TX10UB Nano — WiFi works on Linux (RTL8851BU), BT vendor-listed Windows-only / not Linux — [TP-Link product page](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)
