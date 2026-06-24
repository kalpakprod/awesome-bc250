> 🌐 コミュニティ翻訳です。英語版が正となり、より新しい場合があります。誤りを見つけたら issue を立ててください：[English](../en/05-case.md) · https://github.com/lildebil0/awesome-bc250/issues

# ケースと 3D プリント

> **要点** — BC-250 はむき出しのボードとして出荷されるため、ほぼ全員がエンクロージャをプリントします。唯一の「正しい」ケースは存在しません — コミュニティは **数十種類** の設計を生み出してきました。ボードに 2 つの半割りをクリップするだけの最小限の **冷却スリーブ** から、キャリーハンドル・前面スクリーン・RGB を備えた本格的な **コンソール風ボックス** までさまざまです。何をプリントするにせよ、ケースには標準ボードにはできない 1 つの仕事があります。**120 mm ファンをヒートシンクのフィンに密着させ**、空気がフィンを*通り抜ける*ようにすることです（[冷却](../en/04-cooling.md)を参照）。このページはそのカタログです。名前 → STL → ファン → ダウンロード先。**PSU に注意**：ほとんどのケースは特定の電源（LOP、Flex/SFX ATX、または HP サーバーブリック）を前提に設計されています — 手持ちの [PSU](../en/03-power-supply.md) に合うケースを選んでください。

ここでいう「ケース」は、20 分の作業で済む 200 g のプリントから、作者が何週間もかけた複数パーツのコンソールまで幅があります。シンプルに始めましょう。いつでも刷り直せます。

> **初めてで不安？ [onemorecap スリーブ/シェル](#tier-1--最小限の冷却スリーブここから始める)ケースをプリントしてください — 最小限で、切削不要、1 基の 120 mm ファンに対応 — それで十分です。** 以下のカタログは深いですが、始めるために読む必要はありません。

> **全リストが欲しい？** elektricM が **検索・フィルタ可能な約 143 設計のカタログ**（PSU ファミリー、入手性、プラットフォームでフィルタ可能）を維持しています — 以下の厳選セットよりはるかに多く、Discord 限定や WIP のビルドも多数含みます。**[elektricM — Cases & Enclosures](https://elektricm.github.io/amd-bc250-docs/community/cases/)** で閲覧してください。以下のピックは、名前が付き公開ダウンロード可能で、出発点として価値のあるものです。

---

## コミュニティのビルド

人々が実際にプリントしたものの一例です — むき出しのオープンシェルから、フルにテーマ付けされたコンソールまで。同じボードでも、結果は大きく異なります。

<p align="center">
  <img src="../../assets/img/case-shell.jpg" alt="onemorecap シェルケース：開放型サイドプレート、キャリーハンドル、露出した銅フィン、Arctic 120 mm ファン" width="60%"><br>
  <sub>Дима Ткач によるビルド · <a href="https://t.me/c/2424231195/22771">出典</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-frame.jpg" alt="内部が見える白いアルミ製オープンフレーム：ツインヒートシンク、中央の白い Arctic ファン、Flex PSU" width="60%"><br>
  <sub>Сергей によるビルド · <a href="https://t.me/c/2424231195/87420">出典</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-orange.jpg" alt="オレンジと白の密閉型コンソール、パンチングメッシュのサイドパネルと成形キャリーハンドル付き" width="60%"><br>
  <sub>Alexander Susl によるビルド · <a href="https://t.me/c/2424231195/122822">出典</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-arasaka.jpg" alt="ARASAKA サイバーパンク風コンソール：白いフェイス、クロームのファングリル、緑のアクセントと脚" width="60%"><br>
  <sub>Maxim Perelygin によるビルド · <a href="https://t.me/c/2424231195/98072">出典</a></sub>
</p>

---

## 選び方

どのケースが合うかは 3 つの質問で決まります。

1. **どの PSU を使っていますか？** （[電源](../en/03-power-supply.md)） — Meanwell **LOP-300** は小型で、ほとんどのケースの*内部*に収まります。**Flex/SFX ATX** PSU はより大きく、専用のベイを持つケースが必要です。回収した **HP/サーバーブリック** には「v3/v4 サーバー PSU」ケースが必要です。これが最大のフィルターです。
2. **どのファンを回しますか？** ほぼすべてのケースは、ヒートシンク上の **1 基の 120 mm ファン** を中心に設計されています。大型ビルドでは、バックプレートに **2 基目の 120 mm** ファンを追加して（[温度センサーのない](../en/04-cooling.md) GDDR6 メモリを冷やす）か、PSU に送風します。高さが厳しい場合には **140 mm** や **薄型** ファンを使うものもあります。
3. **フィンはもう薄くしましたか？** ほとんどのケースは、標準ヒートシンクのフィンを**ヤスリ/サンドペーパーで開けてある**ことを前提とします（[冷却、経路 A](../en/04-cooling.md)を参照）。ケースだけでは標準クーラーは直りません — ただファンを正しい位置に保持するだけです。

> **専門用語、一度だけ：** **STL** = スライサーに読み込む標準的な 3D プリント用メッシュファイル。**STEP / 3MF** = 編集可能な CAD フォーマット（設計を改変したいならこれを使う）。**シュラウド / スリーブ / アダプター** = ファンが空気をフィンの周りから漏らさず密着させる、プリントされたじょうご。**Flex / SFX ATX** = 小型フォームファクタの PC 電源。**LOP** = コミュニティが好む Meanwell LOP-300 産業用 PSU。

> **💡 CMOS クリア用ジャンパーへのアクセス穴をプリントしましょう。** VRAM/UMA の分割を変更するたびに **CMOS クリア** が必要なので（[BIOS](../en/08-bios.md)を参照）、ジャンパーを埋めてしまう密閉ケースを設計すると、繰り返しこじ開けることになります。密閉設計では、CMOS クリアジャンパーの上に **⌀10 mm のアクセス穴** を残してください — あるいはもっと良いのは、小さな **3 ポジションスイッチ** をパネルに配線して、工具なしでリセットできるようにすることです。（[4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980)）

---

## Tier 1 — 最小限の「冷却スリーブ」（ここから始める）

プリントできる中で最小・最速のものです。これは **本当の意味でのケースではなく** — タイトな摩擦嵌めで 2 つの半割りがボードにパチンとはまり、120 mm ファンをヒートシンクに保持し、空気を導く、プリントされたジャケットです。**切るものはなく、ボードへのネジ止めもありません。** Дима Ткач（プロジェクト最初期のビルダーの一人）は 2 つのバリアント — コンパクトなものと「より楽しい見た目」のもの — を紹介しており、どちらも **150 W の負荷で約 70 °C** に収まり、プラスチックは各々約 210 g / 約 170 g、乱流気流のおかげで PSU は冷えたままです（[出典](https://t.me/c/2424231195/10743)）。彼の評価：*「これは本当の意味でのケースというより冷却スリーブだが、何も切る必要がなく、すべて非常にタイトな嵌合で保持され、半割りは反対側から落とし込む。」*

- **ファイル：** `BC-250-FanSleeves.3mf`（[出典](https://t.me/c/2424231195/10766)）、ボード CAD `bc-250-body.step`（[出典](https://t.me/c/2424231195/18266)）
- **ソースリポジトリ：** [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) — チャットで最も推奨される「検証済み・プリント済み・動作確認済み」の最小設計（[出典](https://t.me/c/2424231195/18260)）
- **ファン：** 1× 120 mm
- **PSU：** 任意 — 電源リード用の穴/切り欠きがあるので、LOP *または* 外部電源が使えます（[出典](https://t.me/c/2424231195/22950)）

---

## Tier 2 — オープンフレーム / 「シェル」（ボードを見せる）

ボードを片側だけ覆い、ヒートシンクを見せるハーフケースです。プラスチックが少なく、組み立てが簡単で、気流が良好です。

### onemorecap「シェルケース」 — 基準となるビルド

チャットで最も「いいね」を集めたケース投稿（❤33）：ボードの上に **「BC-250」** と CU グリッドパターンがエンボス加工されたフラットなサイドプレート、上部に成形された **キャリーハンドル**、中央に **薄くしたヒートシンクフィンを露出**、右端には専用シュラウドにボルト止めした 120 mm **Arctic** ファン。*「BC-250 SHELL CASE BY ONEMORECAP / ASRock × CMG」* と記されています（[出典](https://t.me/c/2424231195/22771)）。対応する STL 一式はチャットに一括で投稿され（[出典](https://t.me/c/2424231195/81672)）、作者はモデルが Printables と MakerWorld で無料であることを確認しました（[出典](https://t.me/c/2424231195/24505)）。

- **ファイル（チャット一括）：** `Shell_Front.stl`、`Shell_Back_FLEX_ATX.stl`、`Front_Panel.stl`、`USB_Bracket.stl`、加えて以下のファンシュラウド（[出典](https://t.me/c/2424231195/81680)）
- **ソース：** [GitHub onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case)
- **ファン：** 1× または 2× 120 mm（シュラウド経由）、または 1× 140 mm
- **PSU：** `Shell_Back_FLEX_ATX` バックパネルは **Flex ATX** PSU 用に切られています

### アクリル製オープンフレーム（Владислав）

開放型の **アルミ＋アクリル** フレーム：2 枚の金属エンドプレートに透明なサイドパネル、ボードを縦置きにマウントし、中央の薄くしたヒートシンクをまっすぐ吹き抜ける 1 基の **Arctic 120 mm** ファン、下部ベイに Flex/SFX PSU を配置（[出典](https://t.me/c/2424231195/114651)）。これは後に [r/BC250Gaming に「アクリルケース」として](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/)クロスポストされた設計です。再現するのはプリントされたブラケットの部分で、フレーム自体はレーザーカット/既製品です。

- **ファン：** 1× 120 mm（中央） — バックプレートファンを追加する余地あり
- **PSU：** 下部ベイに Flex / SFX ATX

---

## Tier 3 — コンソール風ボックス（完全密閉）

ゲーム機や小型 NAS のように見える密閉エンクロージャです。プラスチックとプリント時間は増えますが、ハンドル・電源ボタン・通気パネル、ときにはスクリーンを備えた完成品になります。

### 「Просто лучший корпус」（Jack Fisher × B1zon） — コミュニティのお気に入り

厳選された **#BC250body** タグの下に *「まさに最高のケース」* として投稿された、部品表（BOM）まで公開された完全に仕上がったコンソールです：PSU、ファン、コネクタ、ゴム足、電源ボタン、ネジ＋ねじ込みインサート、ファン PWM スプリッター、「Cyberpunk」ステッカー、ヒートシンク矯正用コーム。一部の部品は製造終了で代替品があります（[出典](https://t.me/c/2424231195/79990)）。設計は B1zon、組み立ては Jack Fisher。

- **ファイル：** `BC250 korpus исправленный.rar`（「BC250 ケース、修正版」）（[出典](https://t.me/c/2424231195/79989)）
- **ファン：** 120 mm（前面）＋ 2 基目のファン用 PWM スプリッター
- **PSU：** 内蔵（LOP クラス）

### トリプル「GPU」フロント（Гослинг）

前面パネルが **偽のグラフィックスカード・シュラウド** になっているコンソールボックス — RGB 付きの円形ファン切り欠きが横一列に 3 つ並び、マシンが単体 GPU のように見えます。BC-250 上で **Bazzite 42** を動かして示されています（[出典](https://t.me/c/2424231195/66616)）。3 つの開口部は、1 基の実働ファンと吸気の上にある装飾です。

### 迷路パネルの白いコンソール（Jhonatan）

印象的な **迷路/回路パターンの通気サイドパネル**、緑に光る金属製電源ボタン、前面に全高の吸気グリルを備えた、背の高い白いボックス — チャットの中でもより洗練された美観の一つです（[出典](https://t.me/c/2424231195/121274)）。

### グリッドメッシュのミニタワー（Joglik）

側面と上面に密な **正方形グリッドメッシュ**、上端にスロット/ハンドルの切り欠き、背面下部に丸いケーブル貫通口を備えた、灰色の縦型ミニタワー。クリーンな工業的ルックです（[出典](https://t.me/c/2424231195/126525)）。

### 楕円窓のハイファイボックス（a m）

ハイファイ/電子レンジの前面のようなスタイルの白い長方形ケース：大きな **スタジアム型メッシュ窓** から円形メッシュ越しにファンが見え、その両脇に 2 つの縦メッシュスロット（[出典](https://t.me/c/2424231195/52955)）。作者の後のイテレーションでは、発泡 PVC の代わりに「ちゃんとしたプラスチック」へ移行し、外部 XT シリーズ電源と RGB を追加しています（[出典](https://t.me/c/2424231195/128048)）。

### コンパクトコンソール（Volodymyr Spyrydonov、「v15」）

メッシュのサイド吸気と、サイバーパンク風エンブレム＋RGB ストリップを載せた暗い前面を持つ、小型のシルバー＆ブラックのコンソールボックス。リビングルーム用マシンとしてテレビの横に置かれて示されています（[出典](https://t.me/c/2424231195/135995)）。長い改訂版シリーズの一部です（v15/v19/v20 のソース画像が早い段階で共有されました）。

### BC250 Vented Edition（MaelremremDotXYZ）

**フィンを開いた** 状態で動かすミニマルな **FlexATX** コンソールで、**2145 MHz / 1.1 V で約 67 °C** を維持し、背面に PSU キルスイッチを備えます。[MakerWorld 2899020](https://makerworld.com/en/models/2899020)。

### Stellar 250（isaacalvex）

完全な **ビルドガイド** 付きの、自己完結型コンソール一式：内蔵ストレージ、**WiFi 6**、**ESP32 温度ディスプレイ**。[GitHub isaacalvex/AMD-BC-250-Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide)。

### Simple Case for the ASRock AMD BC-250

[YouTube のウクライナ語ビルド解説](https://youtu.be/p5Zd86vFe8w)の作者が公開した、名前付きで公開ダウンロード可能なコンソールエンクロージャ — 複数パーツの複雑さなしに完成プリントが欲しい人向けの、素直な密閉ボックスです。[MakerWorld 2870270](https://makerworld.com/en/models/2870270)。

---

## Tier 4 — 大型ビルド：ATX PSU、AIO 水冷、スクリーン

フルサイズ PSU、水冷、または一体型ディスプレイが欲しい人向けです。

### NexGen3D「DIY Steam Machine」ファミリー

コミュニティで **最も多く参照される 3D プロジェクト**（7 回リポスト）。Printables 上のコンソールケースのファミリーで、**水冷の「Pro」** バリアントと、前面に **内蔵 1080×480 Pi スクリーン** が収まる **「Redux」** エディションを含みます（[Reddit ビルド](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)）。ダイに 120 mm オールインワン水冷を載せるための専用 **AIO マウント** モデルもあります。

- [Printables 1499974 — DIY Steam Machine（ベース）](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite)
- [Printables 1614131 — Pro 水冷](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) · [Printables 1649679 — Redux](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) · [Printables 1554003 — AIO マウント](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250)
- **ファン/冷却：** バリアントに応じて 120 mm 空冷 **または** 120 mm AIO
- **PSU：** LOP 版と ATX 版が文書化されています

### 「Steam Machine Pro」水冷リファレンスビルド（Old Lamer）

ハイエンドで完全水冷のビルドを動画で端から端まで記録 — AIO マシンに全振りするなら部品買い物リストとして有用です（[Old Lamer](https://youtu.be/afYhUQFa-AY)）。公開された BOM：

- **AIO：** ダイ上に TEUCER AF 240（240 mm オールインワン）
- **PSU：** Mean Well **LOP-600-12**（または小型の選択肢として **LOP-500-12**） — [電源](../en/03-power-supply.md)を参照
- **ファン：** 2× Arctic **P12 Pro** ＋ 1× Arctic **P8**
- **リモート電源：** マシンをリモートでオン/オフする **ESP32 リレーボード**
- **ソフトウェア：** Linux 上で AIO ポンプとファンを駆動する **OpenLinkHub** / **Commander Duo**

---

### Steam Cube — パラメトリックな縦型ケース、水冷（開発中）

**Xbox Series X** のフォームファクタの **完全パラメトリック** な縦型ケースで、**水冷を最優先** に設計され、コールドサイドが交換可能：ウォーターブロック、**Thermalright AXP90-X47 Full-Copper**、または 1 基の **Arctic P12 Max** がすべて同じマウントにボルト止めできます。**Sol Diego の「Xbox Serie X BC-250 Edition」** スケッチ（[Printables 1748271](https://www.printables.com/model/1748271)）と、正確な **torassk ボードモデル**（[Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)）から発展し、コード（build123d）として描き直されたため、すべての寸法が固定メッシュではなく、再フィットできる変数になっています。

**外形寸法とその根拠**（検証済みのボードサイズと [冷却](../en/04-cooling.md) の熱目標から導出）：

- **約 180 × 212 × 380 mm** の縦型タワー — ボードの横に **240 mm ラジエーターを縦に** 立てられる高さ（約 277 mm のラジエーターアセンブリが 380 mm の高さ内に収まる）。
- **煙突気流** — 120 mm 吸気を下に、120 mm 排気を上に配置し、熱がまっすぐ上に抜ける。
- **アクティブなバックプレートは任意ではなく必須** — GDDR6 / VRM 側は [温度センサーがない](../en/04-cooling.md) ため、設計では背面冷却を必須部品として扱う。
- **冷却目標**（設計目標であり、**測定結果ではない**）：水冷ダイは 40 CU で持続 60 °C 未満；AXP90 は 2000 MHz で 75 °C 未満；P12 ベースは約 73〜78 °C。

> ⚠ **ステータス：設計コンセプトであり、検証済みプリントではありません。** 現在の CAD は **パラメトリックな空間モデル** です — 部品は正しくサイズ・向き・配置され、8 個の STL ＋ STEP をエクスポートしますが — **プリント・組み立て・熱テストはされておらず**、ウォーターブロックは測定したダイ位置ではなくボードのバウンディングボックスから配置されています。完成したケースではなく、**フォークして使う出発点の CAD** として扱ってください。実際のプリント / フィット / 熱検証が次のオープンなステップです。上記の目標はベンチマークではなくゴールです。

---

### ATX-PSU ケース（Victor L.、V\ad、サーバー PSU v3/v4）

フル **ATX** 電源向け：完全な ATX PSU を中心に組まれたケース（[出典](https://t.me/c/2424231195/119293)、MakerWorld へ移行予定）、初心者の初期 Blender プロトタイプ（[出典](https://t.me/c/2424231195/105570)）、そして HDD と USB ハブの対応を備えた、Printables/MakerWorld で公開された **HP/サーバー PSU** ラインです。

- [Printables 1580750 — Case v3、HP サーバー PSU ＋ HDD ＋ USB ハブ](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) · [MakerWorld 2481620 — Case v4、FlexATX ＆ HP サーバー PSU](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) · [Printables 1550729 — ATX-PSU Bazzite Box](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box)

### ツイン 120 ビルド（メモリ ＋ PSU 冷却）

**2 基の 120 mm ファン** を載せた再設計マウントプレート — 1 基はボード設計者の意図どおりバックプレート（メモリ）に導かれ、2 基目は PSU に送風します。Lian Li P28 ファンを前面に ＋ Thermalright C12015 で、作者は **ゲームで 80 °C にて 2200 MHz** を維持しており、これは前面 1 基だけでは不十分でした（[出典](https://t.me/c/2424231195/120606)）。これ用に単体の **`Twin_120mm_Fan_Shroud.stl`** が共有されています（[出典](https://t.me/c/2424231195/121684)）。

### The Lanboy — ポータブルアーケード / ランチボックス

ポータブルなランチボックス型アーケードビルド：**eDisplayPort アダプターボード**（[AliExpress](https://www.aliexpress.com/item/1005006351527252.html)）を介して **16 インチのノート PC 用 eDP パネル（1920×1200 @ 165 Hz）** を駆動し、USB アンプ上に 2 インチスピーカー 2 基、すべて 1 基の **12 V ATX ブレイクアウト** から給電されます。[Printables 1746364](https://www.printables.com/model/1746364)。この eDP アダプターの技は **どの** ノート PC パネルのビルドにも再利用できます。

### BC250-HUD（Bloodyly） — 内蔵ステータススクリーン

**Raspberry Pi Zero 2 用の** Qt5/C++ **ステータススクリーンアプリ**（NexGen3D Redux のようなビルドで使用）：**USB ガジェットモードで 60 FPS**、MangoHud から FPS/フレームタイムを読み取り、ファン電圧を感知してスリープ時に画面を暗くし、そのままでは Pi がフリーズする **vc4 カーネルパッチを含みます**。スクリーン：**8.8 インチ 1920×480 IPS**（Hannstar HSD088IPW1-A）。[GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD)。

---

## アダプターとマウント（フルケースではない）

1 つの問題だけを解決する小さなプリント部品 — たいていはクーラーやファンをボードにマウントするものです。

- **ファンシュラウド**（ファンをフィンに密着させる）：`Fan_Shroud_Single_120mm.stl`、`Fan_Shroud_Dual_120mm.stl`、`Fan_Shroud_Single_120mm_Restricted.stl`、`Fan_Shroud_Single_140mm.stl`（[出典](https://t.me/c/2424231195/81673)）、`Twin_120mm_Fan_Shroud.stl`（[出典](https://t.me/c/2424231195/121684)）。[冷却](../en/04-cooling.md) にもカタログ化されています。
- **バックプレート / メモリファンマウント：** `Backplate.stl` ＋ `backplane-top-fixed.stl`（[出典](https://t.me/c/2424231195/133049)）；`bottom_fan_mount.stl`、`top_fan_mount.stl`、`Front-Mount.stl`、`Back-Mount.stl`（[出典](https://t.me/c/2424231195/131189)）
- **AM4 クーラーアダプター**（標準的な CPU クーラーをダイにボルト止め）：`bc250 am4 adapter polished.stl`、`bc250 cooler mount.stl`（[出典](https://t.me/c/2424231195/9949)）。[Printables 1042228 — BC250→AMD CPU クーラーマウント](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount)も参照。
- **汎用 ITX マウント**（majzok）：フレームにパチンとはまる 2 パーツでプリント — BC-250 をそれにネジ止めし、そのフレームを **標準 ITX マザーボード穴を持つ任意のケース** にネジ止めします（DeepCool CH170 PLUS でテスト済み）。「汎用 ITX マウントが存在しない」問題を解決します。標準的な Printables リンクは記録されていません — Printables/MakerWorld で **「BC-250 ITX Mount」** を検索してください。
- **Thermalright AXP90-X53 / AXP120-X67 アダプター**（ダイに低背クーラー）：M3 ネジを要するプリントマウントで、クーラー/CPU 圧力に応じた厚みバリアントあり — [Printables 1694793](https://www.printables.com/model/1694793)。[冷却](../en/04-cooling.md) にもあり。
- **120 mm ファンアダプター：** `BC250_FanAdapter_120mm.step`（[出典](https://t.me/c/2424231195/83135)）、`cooler adapter v3.0 (1).stl`（[出典](https://t.me/c/2424231195/111091)）
- **正確なボードモデル**（これらをもとに自分のケースを設計する）：[Printables 1341336 — 正確な BC-250 ボード](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)（[出典](https://t.me/c/2424231195/55496)）、[Printables 1103626 — AMD BC250 ボード](https://www.printables.com/model/1103626-amd-bc250-board)

---

## カタログ表

*(chat)* と記されたファイルは `assets/stl/` 以下にミラーされています。それ以外はすべて、リンク先の Printables / MakerWorld / GitHub ページからダウンロードします。

| ケース / 部品 | タイプ | STL / ソースファイル | ファン | ダウンロード |
|---|---|---|---|---|
| **onemorecap 冷却スリーブ** | 最小スリーブ | `BC-250-FanSleeves.3mf` *(chat)* | 1× 120 | [GitHub onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) |
| **onemorecap シェルケース** ⭐ | オープンシェル | `Shell_Front.stl`、`Shell_Back_FLEX_ATX.stl`、`Front_Panel.stl`、`USB_Bracket.stl` *(chat)* | 1〜2× 120 / 1× 140 | [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [GitHub](https://github.com/onemorecap/bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case) |
| **アクリル製オープンフレーム**（Владислав） | オープンフレーム | プリントされたブラケット *(chat #114651)* | 1× 120 | [Reddit スレッド](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) |
| **「Просто лучший корпус」**（Jack Fisher × B1zon） | コンソール | `BC250 korpus исправленный.rar` *(chat)* | 120 ＋ PWM スプリッター | [chat #79989](https://t.me/c/2424231195/79989) |
| **Flex PSU 向けミニマルケース** | 小型ボックス | `minimal-case-...-model_files.zip` *(chat)* | 1× 120 | [Printables 1423572](https://www.printables.com/model/1423572-minimal-case-for-bc250-and-flex-psu) |
| **forgenam ケース** | コンソール | `forgenam-case-bc250-model_files.zip` *(chat)* | 1× 120 | [Printables 1375929](https://www.printables.com/model/1375929-forgenam-case-bc250) |
| **Minimalist 240** | コンソール ＋ ハンドル | `Minimalist 240 Front/Back/Handle.stl` *(chat)* | 120 | [chat #117404](https://t.me/c/2424231195/117404) |
| **M360** | コンソール | `M360 Front.stl`、`M360 Back.stl` *(chat)* | 120 | [chat #126566](https://t.me/c/2424231195/126566) |
| **NexGen3D DIY Steam Machine** ⭐ | コンソール | Printables ファイル | 1× 120 | [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) |
| **NexGen3D Pro（水冷）** | コンソール ＋ AIO | Printables ファイル | 120 AIO | [Printables 1614131](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) |
| **NexGen3D Redux（＋スクリーン）** | コンソール ＋ 1080×480 スクリーン | Printables ファイル | 1× 120 | [Printables 1649679](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) |
| **NexGen3D AIO マウント** | アダプター | Printables ファイル | 120 AIO | [Printables 1554003](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250) |
| **Case v3 — HP サーバー PSU** | コンソール ＋ HDD/USB | Printables ファイル | 120 | [Printables 1580750](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) |
| **Case v4 — FlexATX / HP PSU** | コンソール | MakerWorld ファイル | 120 | [MakerWorld 2481620](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) |
| **ATX-PSU Bazzite Box** | フル ATX ボックス | Printables ファイル | 120 | [Printables 1550729](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box) |
| **ivanov-innokentii ケース** | コンソール | GitHub ソース | 120 | [GitHub ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) |
| **rLapchynski エンクロージャ** | エンクロージャ | GitHub ソース | 120 | [GitHub rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure) |
| **BC-250 Scooper** | シュラウド/スクープ | Printables ファイル | 120 | [Printables 1282906](https://www.printables.com/model/1282906-bc-250-scooper) |
| **Pitman ケース** | コンソール | Printables ファイル | 120 | [Printables 1570248](https://www.printables.com/model/1570248-amd-bc-250-pitman-case) |
| **工業スタイル FlexATX** | コンソール | `amd_bc_250_industrial_style_case...zip` *(chat)* | 120（標準クーラーなし） | [chat #144265](https://t.me/c/2424231195/144265) |
| **The Lanboy** | ポータブルアーケード ＋ 16 インチ eDP スクリーン | Printables ファイル | 12 V ATX ブレイクアウト | [Printables 1746364](https://www.printables.com/model/1746364) |
| **BC250 Vented Edition**（MaelremremDotXYZ） | FlexATX コンソール、フィン開放 | MakerWorld ファイル | 120 | [MakerWorld 2899020](https://makerworld.com/en/models/2899020) |
| **Stellar 250**（isaacalvex） | コンソール ＋ ビルドガイド（WiFi6、ESP32） | GitHub ガイド | 120 | [GitHub isaacalvex/...Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide) |
| **Simple Case for the ASRock AMD BC-250** | コンソール | MakerWorld ファイル | 120 | [MakerWorld 2870270](https://makerworld.com/en/models/2870270) |
| **BC250-HUD**（Bloodyly） | 内蔵 Pi Zero 2 ステータススクリーン | GitHub ソース | — | [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD) |
| **汎用 ITX マウント**（majzok） | アダプター（任意の ITX ケース） | Printables/MakerWorld を検索 | — | "BC-250 ITX Mount" |
| **Thermalright AXP90/AXP120 マウント** | 低背クーラーアダプター | Printables ファイル | 低背タワー | [Printables 1694793](https://www.printables.com/model/1694793) |
| **ツイン 120 マウントプレート** | アダプタープレート | `Twin_120mm_Fan_Shroud.stl` *(chat)* | 2× 120 | [chat #121684](https://t.me/c/2424231195/121684) |
| **ファンシュラウド（120/140）** | シュラウド | `Fan_Shroud_Single_120mm.stl`、`_Dual_120mm`、`_Single_140mm`、`_120mm_Restricted` *(chat)* | 120 / 140 | [Printables 1339540](https://www.printables.com/model/1339540-yet-another-bc-250-fan-shroud) · [冷却](../en/04-cooling.md)を参照 |
| **AM4 クーラーアダプター** | マウント | `bc250 am4 adapter polished.stl`、`bc250 cooler mount.stl` *(chat)* | タワー/AIO | [Printables 1042228](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount) |
| **正確なボードモデル** | リファレンス CAD | `bc-250-body.step` *(chat)* | — | [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) |

⭐ = コミュニティで最も「いいね」されたもの / 最もリポストされたもの。

### さらに多くの公開設計（elektricM のカタログより）

上に挙げていない、[elektricM の 143 設計カタログ](https://elektricm.github.io/amd-bc250-docs/community/cases/) からの名前付き・ダウンロード可能な設計 — それらが中心に据える PSU でグループ分けしています。Discord 限定/WIP のビルドやサムネイルはフルカタログを閲覧してください。

**MeanWell LOP（内蔵 PSU）：**

| ケース / 部品 | 特記事項 | ダウンロード |
|---|---|---|
| **Steamboat Case**（yannichaboyer） | LOP-300 コンソール | [MakerWorld 2431616](https://makerworld.com/en/models/2431616) |
| **Ultra-Thin Custom Case**（MrRoze） | 薄型 LOP-300 | [Printables 1626501](https://www.printables.com/model/1626501) |
| **Internal PSU 2×140 mm**（Kacikor） | LOP-400、ツイン 140 | [Printables 1599644](https://www.printables.com/model/1599644) · [MakerWorld 2400574](https://makerworld.com/en/models/2400574) |
| **Push-Pull Internal 12V PSU**（penzoiders） | プッシュプル | [MakerWorld 2505974](https://makerworld.com/en/models/2505974) |
| **Shell Case + 40 mm SSD fan**（Munkee915） | Shell リミックス、SSD 冷却 | [Printables 1568074](https://www.printables.com/model/1568074) |
| **Noctua Push-Pull Mod**（Janjd） | Shell リミックス | [MakerWorld 2354123](https://makerworld.com/en/models/2354123) |

**MeanWell LRS/UHP（もう一つの一般的なサーバーブリック）：**

| ケース / 部品 | 特記事項 | ダウンロード |
|---|---|---|
| **LRS-350-12 PSU Case**（TARGZ） | LRS-350 ボックス | [Printables 1543979](https://www.printables.com/model/1543979) |
| **BC250 slim case**（C4kew4lk） | UHP-350-12、薄型 | [Printables 1504664](https://www.printables.com/model/1504664) |

**FlexATX — Arthrimus「Console Style」ファミリー**（まるごとリミックスの系譜。薄型コンソールはコミュニティの定番）：

| ケース / 部品 | 特記事項 | ダウンロード |
|---|---|---|
| **Console Style Case v1**（Arthrimus） | オリジナル | [Thingiverse 7165679](https://www.thingiverse.com/thing:7165679) · [MakerWorld 2097988](https://makerworld.com/ko/models/2097988-bc250) |
| **Slim Console Style Case**（Arthrimus） | 薄型バリアント | [Thingiverse 7172528](https://www.thingiverse.com/thing:7172528) |
| **Slim Console — double-fan mod**（TKXXTH） | デュアルファン | [Thingiverse 7214884](https://www.thingiverse.com/thing:7214884) |
| **Slim Console — On/Off + Apevia** | 電源スイッチ | [Thingiverse 7274042](https://www.thingiverse.com/thing:7274042) |

**FlexATX — その他：**

| ケース / 部品 | 特記事項 | ダウンロード |
|---|---|---|
| **Minimal Case (Toolless)**（chriszf） | ネジ不要 | [Printables 1423572](https://www.printables.com/model/1423572) |
| **Minimalist BC-250 Case**（SebastienGau/Gadget） | ミニマリスト | [Printables 1581724](https://www.printables.com/model/1581724) |
| **ADT UT3G eGPU-Inspired**（R0mn） | eGPU ルック | [Printables 1539301](https://www.printables.com/model/1539301) |
| **"Steam Machine" by MrLarva** | コンソール | [Printables 1618501](https://www.printables.com/model/1618501) · [MakerWorld 2453965](https://makerworld.com/en/models/2453965) · [Thingiverse 7278235](https://www.thingiverse.com/thing:7278235) |
| **Steam Machine**（Pocket Adventures） | コンソール | [MakerWorld 2350219](https://makerworld.com/en/models/2350219) |
| **Steam Machine Slim Console**（MTSquar3D） | 薄型 ＋ OC vRAM ファンキット | [MakerWorld 2232434](https://makerworld.com/en/models/2232434) · [Thingiverse 7271946](https://www.thingiverse.com/thing:7271946) |
| **ASRock Console Case**（songdawgdesigns） | コンソール | [Printables 1617023](https://www.printables.com/model/1617023) · [Cults3D](https://cults3d.com/en/3d-model/gadget/asrock-amd-bc-250-console-case-steamos-bazzite-diy-steam-machine-style-build) |
| **AMD BC250 Case**（vitamins） | コンソール | [MakerWorld 2219947](https://makerworld.com/en/models/2219947) |
| **E-waste Steam Machine**（Pesen333） | サルベージビルド | [Thingiverse 7245584](https://www.thingiverse.com/thing:7245584) |

**フル ATX：**

| ケース / 部品 | 特記事項 | ダウンロード |
|---|---|---|
| **Case for Standard ATX**（CatSiewDai） | ATX ボックス | [Printables 1553599](https://www.printables.com/model/1553599) |
| **ATX + Fan Duct**（ZMASLO） | ダクト付き | [Printables 1616167](https://www.printables.com/model/1616167) |
| **Dual Fan ATX Case**（Mateo Fdez） | デュアルファン | [Printables 1579658](https://www.printables.com/model/1579658) |
| **Simple Wooden Case**（suvalle55） | 木製 ＋ ATX | [Printables 1595794](https://www.printables.com/model/1595794) |
| **Open Frame + IKEA hack**（GreatApo） | オープンフレーム | [Thingiverse 7314188](https://www.thingiverse.com/thing:7314188) |
| **Case for ATX PSU**（matmiak） | ATX ボックス | [Thingiverse 7303096](https://www.thingiverse.com/thing:7303096) |

**TFX / VESA / 既製品：**

| ケース / 部品 | 特記事項 | ダウンロード |
|---|---|---|
| **Case Remix for TFX**（PlayNation） | TFX-400 PSU | [MakerWorld 2387157](https://makerworld.com/en/models/2387157) |
| **VESA 100/75 Basket**（Oleksii） | モニター背面にマウント | [MakerWorld 1844470](https://makerworld.com/en/models/1844470) |
| **3.9L MKII FlexATX + PS5 fan**（FitFormSolutions） | 完成キットを購入 | [Etsy](https://www.etsy.com/listing/4405362103/) · [eBay](https://www.ebay.com/itm/127460591552) |
| **Shiny Snake S400**（10.8 L メッシュ ITX） | 動作確認済みの既製ホスト（BC-250→AM4 マウント ＋ PSU ベイに H60 AIO ＋ カスタム ATX I/O シールド） | [AliExpress](https://a.aliexpress.com/_EyQdoBU) |
| **SFX-PSU ミニマリストケース**（Methsman） | フル SFX PSU、マグネットパネル、USB ハブ、AXP120 ＋ Noctua 120 — *ファイルは WIP / 未公開* | — |
| **Cults3D ATX/サーバーライン**（KABANCHYK、lumstudio、kapa3D） | 有料 STL | [Cults3D — bc-250](https://cults3d.com/en/3d-model/gadget/bc-250-atx-case) |

---

## プリンターがない？ 人々が使う選択肢

- **プリントを買う。** [Etsy](https://www.etsy.com/listing/1904632447/)、eBay、OLX に出品者がいます。チャット内でケースをプリント/販売すると申し出た人もいます（[出典](https://t.me/c/2424231195/55507)）。
- **オンデマンドプリント：** STL をサービスにアップロードします。チャットのビルダーにはプリントファームを運営する人もいます（Flsun/Creality/Bambu プリンターの壁を見せる人もいます、[出典](https://t.me/c/2424231195/73481)）。
- **ケースなし / 流用。** 多くの人はテスト中、オープンなベンチでボードを動かします。既存ハードウェアを中身ごと利用する人もいます：ボードを埋め込みブロワーを付けた古い一体型 PC（[出典](https://t.me/c/2424231195/30914)）、換気ダクトのボックス（[出典](https://t.me/c/2424231195/64265)）、あるいはアルミ製アンプエンクロージャ（ヤスリ/穴あけが必要、[出典](https://t.me/c/2424231195/108907)）。あるメンバーは冗談で古い VHS プレーヤーの中にボードを隠しさえしました（[出典](https://t.me/c/2424231195/84106)）。**Xbox One シェル**（JoeyDepDollas）：壊れた Xbox One を中身ごと取り出し、BC-250 ビルド一式を中に収めます — 負荷時に CPU と GPU を **60 °C** 未満に保ち、壊れたドナー機は eBay で **送料込み約 $15** で入手でき、再利用できる部品が得られます。
- **レーザーカット合板**（ContributionRich3242）：3D プリントではありません — 角でカーフ曲げした合板に、追加冷却用の大きな背面エリアを設け、**40 CU で 75 °C**（1800 MHz、CPU 3.9 GHz）かつ非常に静かに動作します。（レーザーファイルは未公開。）その **バックプレート冷却テクニック** はどのケースにも再利用可能です：チップ→バックプレートにサーマルパテ、バックプレート→背面クーラーにペースト、そして背面クーラーを VRM の隙間にきつい R 型コッターピン ＋ カプトンテープで固定（40 CU で約 20 °C 低下）。

> よく冷却されたむき出しのボードは、気流の悪い密閉された美しいボックスより性能が上です。まず [冷却](../en/04-cooling.md) を正しく行い、ケースは第二のステップです。

---

## 出典

- 厳選 **#BC250body** ショーケース（1 日 1 つの良いビルド） — ピン留めアイデア [出典](https://t.me/c/2424231195/79685)
- 最小スリーブ、2 バリアント — [出典](https://t.me/c/2424231195/10743) · モデルは [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) [出典](https://t.me/c/2424231195/18260)
- シェルケース（❤33） — [出典](https://t.me/c/2424231195/22771) · Printables/MakerWorld で無料 [出典](https://t.me/c/2424231195/24505) · STL 一括 [出典](https://t.me/c/2424231195/81680)
- 「Просто лучший корпус」＋ BOM — [出典](https://t.me/c/2424231195/79990) · ファイル [出典](https://t.me/c/2424231195/79989)
- アクリル製オープンフレーム — [出典](https://t.me/c/2424231195/114651) · [Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/)
- ツイン 120 マウントプレート、2200 MHz @ 80 °C — [出典](https://t.me/c/2424231195/120606) · シュラウド [出典](https://t.me/c/2424231195/121684)
- コンソール設計（写真） — Гослинг/Bazzite [出典](https://t.me/c/2424231195/66616) · Jhonatan 迷路パネル [出典](https://t.me/c/2424231195/121274) · Joglik グリッドメッシュ [出典](https://t.me/c/2424231195/126525) · a m 楕円窓 [出典](https://t.me/c/2424231195/52955) · Spyrydonov v15 [出典](https://t.me/c/2424231195/135995)
- NexGen3D Steam Machine ファミリー — [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) · [Redux ＋ Pi スクリーン（Reddit）](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)
- ボードリファレンスモデル — [出典](https://t.me/c/2424231195/55496) · [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)
- GitHub ケースリポジトリ — [onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) · [rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure)
- **elektricM フルケースカタログ（約 143 設計、検索・フィルタ可能）** — [elektricm.github.io/amd-bc250-docs/community/cases](https://elektricm.github.io/amd-bc250-docs/community/cases/)
- Simple Case（MakerWorld 2870270）＋ ウクライナ語ビルド解説 — [MakerWorld 2870270](https://makerworld.com/en/models/2870270) · [Old Lamer（YouTube）](https://youtu.be/p5Zd86vFe8w)
- CMOS クリア用アクセス穴のライフハック — [4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980)
- 「Steam Machine Pro」水冷ビルド BOM（TEUCER AF 240、Mean Well LOP-600-12、Arctic P12 Pro/P8、ESP32 リレー、OpenLinkHub/Commander Duo） — [Old Lamer（YouTube）](https://youtu.be/afYhUQFa-AY)

> ファンシュラウドの STL は [冷却](../en/04-cooling.md) と共有されています。チャットでホストされたすべての STL/STEP/3MF ファイルは `assets/stl/` 以下にミラーされています。
