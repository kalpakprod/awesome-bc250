<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — AMD BC-250 初心者のためのバイブル" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> **ASRock AMD BC-250** 初心者のためのバイブル — PlayStation 5 派生の APU ボード（Cyan Skillfish / Oberon、6コア Zen 2 + RDNA 2、16 GB GDDR6）を、安価な **Linux ゲーミング & AI ミニ PC** — DIY の予算型 Steam Machine として転用したものです。

**箱の中のボードからゲームが動くまで** に必要なすべて — BC-250 コミュニティの 130k+ 件のメッセージから厳選し、実際にアップvoteやピン留めされた内容でランク付けし、公式プロジェクトリポジトリと照合しています。

🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · **日本語** · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<sub>_メンテナンス済み · 最終更新 **2026年8月** · AI エージェント向け [llms.txt](llms.txt)_</sub>

---

## ❓ クイックアンサー

- **ASRock AMD BC-250 とは何か？** PlayStation 5 派生の APU ボード — 6コア Zen 2 + 24/40 RDNA 2 CU（"Cyan Skillfish"）、16 GB GDDR6 — 元マイニングカードとして安価に販売され、Linux ゲーミング & AI ミニ PC、DIY の予算型 Steam Machine として転用されます。
- **価格はいくらか？** ボード単体でおよそ **$60–130**。フル構成（PSU、クーラー、SSD）なら **$150–250** 前後。[購入ガイド](docs/en/02-buying.md) を参照。
- **ゲーム性能は？** ほとんどのタイトルでおよそ **1080p 60 FPS**（RX 6600 クラス）。FSR / フレーム生成と GPU+CPU オーバークロックで達成します。[ゲーミングの結果](docs/en/11-gaming.md) を参照。
- **どの OS？** GPU アクセラレーションに使えるのは **Linux のみ** — Bazzite、Fedora、CachyOS、または Mesa 25.1+ の Arch。Windows 用 GPU ドライバーはありません。[Linux セットアップ](docs/en/06-linux.md) を参照。
- **LLM は動かせるか？** はい — Vulkan 経由の llama.cpp / Ollama が 16 GB GDDR6 を VRAM として使用します（小規模モデルで約 30–47 tok/s）。[AI / LLM](docs/en/12-ai-llm.md) を参照。
- **冷却はどうするか？** 純正のサーバーヒートシンクは机の上ではサーマルスロットリングを起こします。フィンを薄くして 120 mm ファンを追加するか、水冷にしましょう。[冷却](docs/en/04-cooling.md) を参照。

---

## ⚡ ここから始める

新品のボードを手に入れたけれど何も分からない？ 順番に黄金ルートをたどってください。

**[docs/ja/00-start-here.md](docs/ja/00-start-here.md)** — 購入 → 電源 → 冷却 → OS インストール → ドライバー → オーバークロック → プレイ。

---

## 📈 チューニングで実際に得られるもの

このボードのすべての調整項目は、何かと引き換えです。コミュニティの実測結果から抽出した、重要度の高い 4 つがこれです — 何かをフラッシュする前に読んでください。

<p align="center">
  <img src="assets/diagrams/gpu-clock-tradeoff.svg" width="100%" alt="GPU コアクロック: FPS の向上は 2000 MHz までに約 95% に達し、その後は CPU がボトルネックとなって頭打ちになります。一方、電力と発熱は 95% まで上昇し続けます。スイートスポットは約 2000 MHz で、FPS はおよそ +30%。">
</p>

<p align="center">
  <img src="assets/diagrams/undervolt-tradeoff.svg" width="100%" alt="アンダーボルト: 電圧が 1129 mV から 700 mV に下がるにつれ、効率は 20% から 95% に上昇しますが、不安定性のリスクは 15% から 100% に上昇します。ゲームで安定する範囲はおよそ 905〜955 mV。700 mV を下回ると GPU は 1500 MHz に固定されます。">
</p>

<p align="center">
  <img src="assets/diagrams/cu40-tradeoff.svg" width="100%" alt="40-CU 解放: コンピュート性能は 40% から 90% に上昇する一方、ゲーミング FPS は 40% から 47% にしか動かず、電力と不安定性は 25% から 100% に上昇します。38 CU が一般的な安定上限。40 CU はシリコンロットリーであり、300 W 超と AIO が必要です。">
</p>

<p align="center">
  <img src="assets/diagrams/memory-tradeoff.svg" width="100%" alt="GDDR6 メモリチューニング: 帯域幅と FPS の向上は 30% から 52% までしか動かない一方、文鎮化リスクは 20% から 100% に上昇します。1950 MHz が、ボードが文鎮化して戻ってきた境目です。">
</p>

<p align="center">
  <img src="assets/diagrams/power-by-config.svg" width="100%" alt="構成別の壁面消費電力の実測値: 38 CU + 1200 MHz / 850 mV で 200 W、40 CU + 1800 MHz / 860 mV で 260 W、38 CU + 1500 MHz で 310 W、40 CU + 2000 MHz / 960 mV で 350 W。1025 mV でも追加されるのはわずか 2 W。報告されている中で最も優れたワット毎フレームのポイントは、40 CU @ 1800 MHz です。">
</p>

これら 5 つのポイントは測定値であり、モデルではありません: 1800 から 2000 MHz への引き上げには約 90 W かかります — これは以前の 600 MHz 分にほぼ相当 — そして 960 mV から 1025 mV への引き上げは、2 W の熱をもたらすだけです。350 W では 300 W 電源が 30 秒以内にトリップし、+12V レールには 26 A が流れます。

<details>
<summary>アイドル電力 — ワットメーターがほとんど動かない理由</summary>

<p align="center">
  <img src="assets/diagrams/idle-power-tradeoff.svg" width="100%" alt="アイドル電力: governor、アンダーボルト、オートサスペンドにより GPU の消費は 80 W から 5 W に下がりますが、壁面の総消費は、サスペンドで 10 W に落ちるまで 125 W から 110 W にしか下がりません。">
</p>

governor とアンダーボルトは GPU の消費を削りますが、CPU と GDDR6 はそれに関係なく消費し続けます。オートサスペンドが効き始めるまで、ワットメーターの数値はほとんど変わりません。リーク電流の多いバッチでは、70〜80 W あたりが下限になります。

</details>

<sub>ソースデータ: [`assets/diagrams/data.json`](assets/diagrams/data.json) · `node assets/diagrams/build.mjs` で再ビルド</sub>

---

## 📚 ハンドブック

| # | セクション | 対象 |
|---|---------|-----|
| 01 | [BC-250 とは何か](docs/en/01-what-is-bc250.md) | スペック、サイズ、ピン配置、期待値 |
| 02 | [購入ガイド](docs/en/02-buying.md) | 入手先、価格、リスク、共同購入 |
| 03 | [電源](docs/en/03-power-supply.md) | LOP / Flex ATX、8-pin ピン配置、配線 |
| 04 | [冷却](docs/en/04-cooling.md) | ヒートシンク、ファンシュラウド、テスト方法 |
| 05 | [ケース & 3D プリント](docs/en/05-case.md) | プリント可能なケースのカタログ（STL） |
| 06 | [Linux ドライバー & セットアップ](docs/en/06-linux.md) | ディストロ選択、amdgpu、インストール |
| 07 | [Windows ドライバー & セットアップ](docs/en/07-windows.md) | ドライバー状況、手順 |
| 08 | [BIOS & 文鎮復旧](docs/en/08-bios.md) | 改造 BIOS、書き込み、文鎮化からの復旧 |
| 09 | [オーバークロック & アンダーボルト](docs/en/09-overclock-undervolt.md) | governor、SMU、40CU 解放 |
| 10 | [WiFi & Bluetooth ドングル](docs/en/10-wifi-bt.md) | 実際に動くドングル |
| 11 | [ゲーミングの結果 & 設定](docs/en/11-gaming.md) | ベンチマーク、ゲームごとのチューニング |
| 12 | [BC-250 での AI / LLM](docs/en/12-ai-llm.md) | llama.cpp、ROCm |
| 13 | [macOS / Hackintosh](docs/en/13-macos.md) | 状況 |
| 14 | [ディスプレイ & 出力](docs/en/14-display.md) | DisplayPort、DP→HDMI 変換、デュアル画面 |
| 15 | [エミュレーション](docs/en/15-emulation.md) | 各コンソール/プラットフォーム、現実的な状況 |
| 16 | [USB、ハブ & ストレージ](docs/en/16-usb-peripherals.md) | ハブ、5V 改造、M.2 / SATA アダプター |
| ❓ | [FAQ](docs/ja/faq.md) · [トラブルシューティング](docs/ja/troubleshooting.md) | よくある問題 |

---

## 🔗 Awesome リソース

公式のコミュニティプロジェクト。コミュニティが参照した頻度でランク付けしています。

### ドキュメント
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) — 主要なハードウェアリファレンス（リバースエンジニアリング）
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [サイト](https://elektricm.github.io/amd-bc250-docs/) — 包括的なコミュニティドキュメント（ピン配置、ディストロ別、トラブルシューティング）
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — 組織のドキュメント
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — ビルド & スクリプト

### オーバークロック / アンダーボルト / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — 多くのビルドで使われている governor（クロック/電圧を設定）
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — GUI 付きの oberon-governor フォーク（Linux）
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [bc250-collective フォーク](https://github.com/bc250-collective/cyan-skillfish-governor)
- [rw-r-r-0644/bc250-core-unlock](https://github.com/rw-r-r-0644/bc250-core-unlock) — 無効化されている 2 つの CPU コアを解放（標準マスクは 0x77。0xB7 マスクは物理的に不良なコアを意味し、無理に使用するとアーティファクトやクラッシュが発生します）
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — 全 40 CU を解放
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### ツールキット & プレビルドイメージ
- [redbeard1083/bc250-toolkit](https://github.com/redbeard1083/bc250-toolkit) — CachyOS 用のメニュー駆動セットアップ: カーネル、CPU/GPU governor、swap、ZRAM→ZSWAP、ACPI、起動時の調整
- [62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images](https://github.com/62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images) — BC-250 パッチを適用済みの Bazzite Deck/GNOME/KDE プレビルドイメージ

### ドライバー
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — Windows GPU ドライバー（実験的、2026 年初頭時点で完全なアクセラレーションなし）
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — PSP/GPU ドライバーの開発
- [DryhoppedIPA/bc250-gfx1013-fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix) — 壊れた GPU コンピュートキュー（非同期コンピュート）用のカーネル + Mesa/RADV パッチ。FSR 4 / XeSS 3 の INT8 パスも修正します
- [MastaG/linux-cachyos-bc250](https://github.com/MastaG/linux-cachyos-bc250) — BC-250 のチェリーピックを適用した CachyOS カーネル
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — Linux カーネル

### BIOS / ファームウェア
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — 最も参照される BIOS イメージ & 改造
- [TheRetroWeb — BC-250 BIOS データベース](https://theretroweb.com/bios?itemsPerPage=24&chipsetIds%5B%5D=1990) — 純正 BIOS ダンプ、バージョン別に閲覧/ダウンロード可能
- [Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script](https://github.com/Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script) — メニュー駆動のファームウェアバックアップとカスタムファームウェア書き込み
- 書き込みと文鎮復旧については [docs/en/08-bios.md](docs/en/08-bios.md) を参照

### WiFi / BT ドングル
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### AI / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### ケース / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables & MakerWorld — [docs/en/05-case.md](docs/en/05-case.md) を参照

---

## 🤝 コントリビュート

これは **生きている** リポジトリです。知識は再現可能なパイプライン（[CONTRIBUTING.md](CONTRIBUTING.md) を参照）でコミュニティのチャットから抽出され、新しいエクスポートで再実行されます。修正、新しいドングル、新しいケース、検証済みのコマンドの PR を歓迎します。

## 📄 ライセンス

ドキュメント: [CC-BY-SA-4.0](LICENSE)。`assets/scripts/` 配下のスクリプト: MIT。ミラーされたサードパーティのファームウェア/ドライバーは元の権利を保持します — [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md) を参照してください。

## 🙏 クレジット

BC-250 コミュニティの皆さん全員へ — このハンドブックを実現してくれた主要な貢献者については **[CREDITS](CREDITS.md)** を参照してください。情報源: *AMD BC-250 コミュニティのチャット*。プロジェクト作者は上記のリポジトリハンドル名でクレジットされています。
