🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · **日本語** · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — AMD BC-250 初心者のためのバイブル" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> **AMD BC-250** 初心者のためのバイブル — PlayStation 5 派生の APU ボード（Cyan Skillfish / Oberon、16 GB GDDR6）を、安価な Linux ゲーミング & AI マシンとして転用するためのガイドです。

**箱の中のボードからゲームが動くまで** に必要なすべて — BC-250 コミュニティの 125,000 件超のメッセージから厳選し、実際にアップvoteやピン留めされた内容でランク付けし、公式プロジェクトリポジトリと照合しています。

🌍 言語: [English](README.md)（メイン） · [Русский](README.ru.md) · **日本語**

---

## ⚡ ここから始める

新品のボードを手に入れたけれど何も分からない？ 順番に黄金ルートをたどってください。

**[docs/ja/00-start-here.md](docs/ja/00-start-here.md)** — 購入 → 電源 → 冷却 → OS インストール → ドライバー → オーバークロック → プレイ。

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
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — 全 40 CU を解放
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### ドライバー
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — Windows GPU ドライバー（実験的、2026 年初頭時点で完全なアクセラレーションなし）
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — PSP/GPU ドライバーの開発
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — Linux カーネル

### BIOS / ファームウェア
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — 最も参照される BIOS イメージ & 改造
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
