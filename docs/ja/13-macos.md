> 🌐 コミュニティ翻訳です。英語版が正となり、より新しい場合があります。誤りを見つけたら issue を立ててください：[English](../en/13-macos.md) · https://github.com/lildebil0/awesome-bc250/issues

# macOS / Hackintosh

> **要点** — **やめておけ。** BC-250 の CPU では macOS をおそらく起動できます（Zen 2 の AMD チップであり、一般的な AMD-OSX hackintosh の小技が通用します）。しかし **GPU はアクセラレーションしません**し、それを実現する現実的な道はありません。macOS はハードコードされたデバイス ID で GPU をサポートしますが、BC-250 の GPU（Cyan Skillfish / Oberon、PS5 を削った派生品）には **なりすまし対象になるネイティブサポートのデスクトップ版双子が存在しません**。さらに Apple のスタックは、いかなる AMD APU の統合グラフィックスも *一度も* 駆動できたことがありません。したがって、得られるのは Metal もない、遅くてソフトウェアレンダリングの Mac だけです。2026 年時点で、コミュニティの誰もアクセラレーションが動作した結果を報告していません。代わりに Linux を使ってください — [06-linux.md](06-linux.md) を参照。

これは **ニッチな好奇心の対象** であって、実用的なユースケースではありません。正直な答えはこのセクション全体です。

---

## なぜ GPU アクセラレーションが壁なのか

このトピックで最も反応の多かった技術投稿の上位 2 件は、どちらも同じ結論に達しており、その仕組みを明快に説明しています。

macOS には Linux のようなオープンなドライバモデルがありません。特定の GPU に **デバイス ID で** バインドするクローズドなドライバを出荷しており、介入できる唯一の場所は OS がロードされる *前* の **OpenCore** ブートローダーだけです — OpenCore は macOS に下ごしらえ済みのデータを渡すだけで、クローズドなシステムを内側からパッチすることはできません（[src](https://t.me/c/2424231195/103173)）。

OpenCore は GPU のデバイス ID を *なりすます* ことはできますが、それは **1 つのアーキテクチャファミリー内** に限られます — 例えば、サポート外の RX 6950 XT をサポート済みの RX 6900 XT として見せかける、これは両者が *同じ* シリコンだからです。この小技は OpenCore 開発者に **1 年以上** かかり、それらの Navi カードが Apple がすでにサポートしていたものとアーキテクチャ的に同一だったからこそ動作しました（[src](https://t.me/c/2424231195/53321)）。

BC-250 はこれを 2 つの面で破綻させます：

1. **なりすます双子がいない。** その GPU は PS5 由来の削った派生品（`gfx1013`）です。**macOS がネイティブにサポートする、同じアーキテクチャのデスクトップ AMD カードは存在しません**ので、化けるべき相手がいません。BC-250 を動かすには、Apple のスタックがこのデバイス ID をゼロから学習する必要があります — それが起きるのは OpenCore 開発者がこのチップに取り組んだ場合だけで、そうする商業的な理由はありません（[src](https://t.me/c/2424231195/53321)）。
2. **これは APU であり、APU は一度も動いたことがない。** デスクトップアーキテクチャの Ryzen 統合グラフィックス（Vega / Navi の iGPU）でさえ、サポート済みのディスクリートカードとマイクロアーキテクチャを共有しているにもかかわらず、macOS で **一度も** 立ち上がったことがありません。著者は macOS 上で動作する Ryzen iGPU の事例を「ただの 1 件も見たことがない」と述べています（[src](https://t.me/c/2424231195/103173)）。BC-250 はその同じ APU の枠に入ります。

同じ寄稿者からの率直なまとめ：*このチップの Windows ドライバですら整っていないのなら、macOS は夢に見る価値もない*（[src](https://t.me/c/2424231195/53321)）。（Windows ドライバの状況については [07-windows.md](07-windows.md) を参照。）

---

## 人々が実際に試したこと

- ある人物が早い段階で **macOS Monterey recovery + OpenCore** パッケージ（`Monterey recovery + OpenCore.zip`、それに加えて以前の `Архив.zip`）を準備・共有したので、少なくとも 1 人はインストールに着手しました（[src](https://t.me/c/2424231195/53590)）。GPU アクセラレーション成功の報告は一度も返ってきませんでした。
- 人々が指し示した関連ツール群は、標準的な AMD-hackintosh のキットです：[RehabMan/OS-X-Fake-PCI-ID](https://github.com/RehabMan/OS-X-Fake-PCI-ID) によるデバイス ID 偽装、実際に何がサポートされているかを示す [Dortania AMD GPU buyers guide](https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series)、そして — APU グラフィックスサポートに最も近いもの — AMD APU の iGPU 向け kext である **[ChefKissInc/NootedRed](https://github.com/ChefKissInc/NootedRed)**。NootedRed は Vega/Renoir クラスの APU を対象としており、BC-250 のダイは **カバーしていません**ので、このボードを救いません。
- AMD Ryzen で VMware/OpenCore 経由で macOS を動かす件についての後の [フォーラムリンク](https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/)（[src](https://t.me/c/2424231195/107779)）は **一般的な AMD hackintosh** であって、BC-250 固有のものではありません — それに VM ではどのみち GPU パススルー/Metal はありません。

> ⚠ **冗談を結果と勘違いしないこと。** このトピックには軽い「いいね、ここでは無敵の hackintosh が君臨する」という冗談（[src](https://t.me/c/2424231195/85166)）や称賛のリアクションがありますが、それらは動作する macOS ビルドの報告では *ありません*。証拠のなかに、BC-250 でアクセラレーションする macOS を示すものは何もありません。

---

## では、やる価値はあるのか？

**いいえ、いかなる実用目的にも価値はありません。** 現実的に最良の結果でも、UI をソフトウェアレンダリングする CPU のみの macOS にすぎません — Metal なし、GPU コンピュートなし、このボードを買う目的であるゲーミング/AI ワークロードには使い物になりません。**2025-06** から **2026-03** まで日付が変わっても変わらないコミュニティの総意は、OpenCore 開発者がこのチップを特別に採用しない限り GPU サポートは事実上不可能であり、それは起きていないし期待もできない、というものです。

このボードに何かを *させたい* なら、GPU が Mesa/RADV 経由で本当にサポートされている Linux をインストールしてください（[06-linux.md](06-linux.md)）。Windows は大きく離れた第 2 候補です（[07-windows.md](07-windows.md)）。macOS は最下位であり、実際のところ行き止まりです。

---

## ソース

- デバイス ID による GPU + 1 年がかりの Navi なりすまし物語 — https://t.me/c/2424231195/53321
- OpenCore の限界と「Ryzen iGPU は一度も動いたことがない」 — https://t.me/c/2424231195/103173
- 誰かが準備した Monterey + OpenCore パッケージ — https://t.me/c/2424231195/53590
- 一般的な AMD-Ryzen hackintosh のフォーラムスレッド（BC-250 固有ではない） — https://t.me/c/2424231195/107779 · [amd-osx.com thread](https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/)
- 参照されたツール群 — [RehabMan/OS-X-Fake-PCI-ID](https://github.com/RehabMan/OS-X-Fake-PCI-ID) · [ChefKissInc/NootedRed](https://github.com/ChefKissInc/NootedRed)（AMD APU iGPU kext；このダイはカバーしない） · [Dortania AMD GPU guide](https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series)
- チップの正体（Cyan Skillfish / Oberon、`gfx1013`） — [01-what-is-bc250.md](01-what-is-bc250.md) を参照

> **結論：** BC-250 上の macOS は技術トリビアの脚注であって、ビルドの対象ではありません。[06-linux.md](06-linux.md) へ進んでください。
