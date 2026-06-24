> 🌐 コミュニティ翻訳です。英語版が正となり、より新しい場合があります。誤りを見つけたら issue を立ててください：[English](../en/11-gaming.md) · https://github.com/lildebil0/awesome-bc250/issues

# ゲーミングの結果と設定

> **要点** — BC-250 は **PS5 クラスの GPU を、削減された 6 コア Zen2 に取り付けたもの** です。GPU は本当に有能で、実用的な **2000 MHz** オーバークロックでは現代の AAA タイトルを **40–60 FPS** で動かし、軽め/古めのゲームなら 60 を十分に超えます。問題は **CPU** です。APU の Zen2 側は、GPU よりもはるかに頻繁にボトルネックになります — コミュニティのベンチマークは、カードが **〜36–47 % の GPU 負荷のまま 〜38 FPS に張り付いている** 様子を繰り返し示しており、これは CPU 制限です。したがって：**まずオーバークロック**（標準の 〜1500 MHz は 〜30 % 遅い）し、**FSR** とフレーム生成に頼り、**1080p–1440p** を狙い、物理演算が重いゲームやスレッド処理が下手なゲームは解像度に関係なくカクつくと受け入れてください。コンソール風のファーストパーティ移植（God of War、Horizon、Last of Us、Spider-Man）が最適解です。

このセクションでは期待値を設定し、コミュニティが実際に投稿した結果 — その多くはベンチマークのスクリーンショット — を収集します。数値はクロック、ディストロ、ドライバー、VRAM 分割によって変動するため、すべての行がそのソースに紐付けられています。

---

## まず理解すべき唯一のこと：CPU バウンドである

BC-250 の GPU は PS5 由来の RDNA2 パーツです（RADV は `GFX1013` / NAVI10 クラスとして報告します）。これは多くのゲームで*弱点ではありません*。弱点は、〜3.5 GHz で動作し、PS5 風の削減されたキャッシュと余剰のない SMT を持つ **6 コア Zen2 CPU** です。

**1080p、High、GPU @ 2000 MHz / mem @ 3600 MHz** でのコミュニティのベンチマークが、これを具体的にしています：そのランは **「38 FPS を達成」** し、**GPU Limited Percentage はわずか 36.5 %** でした — CPU のシミュレーションスレッドがゲートだったのです（ステージ別メーターで CPU sim 〜70 / CPU render 〜43 / GPU 〜47）。GPU は能力の 3 分の 1 でアイドリングしている一方、CPU がフレームレートを抑え込んでいました。([src](https://t.me/c/2424231195/136242))

実際的な帰結：

- **解像度はしばしば「タダ」。** CPU バウンドなので、1080p から 1440p（あるいは FSR 付きの 4K でさえ）へ上げても FPS の犠牲は小さいことが多い — もともと GPU には余裕があったのです。以下のいくつかの 4K の結果が 1080p のものとほぼ同等に見えるのは、まさにこの理由からです。
- **アップスケーリングは通常の PC ほど効かない。** FSR は GPU を軽くしますが、リミッターが CPU の場合、レンダリング解像度を下げても FPS はあまり上がりません。FSR は画質/熱のために使い、魔法の FPS ボタンとしては使わないでください。
- **スレッド処理が下手なゲームや物理演算が重いゲームは罰を与える。** カクつきとフレームタイムのスパイク（Gothic Remake、修正前の Doom: The Dark Ages）は GPU ではなく CPU から来ます。
- **それでも GPU はオーバークロックすべき** — ゲームが*実際に* GPU バウンドのとき（4K、重いレイトレーシング、スレッド処理の良いエンジン）、1500 → 2000 MHz は 〜+30 % FPS です。そこに至る方法は [09-overclock-undervolt.md](09-overclock-undervolt.md) を、そしてその前に [04-cooling.md](04-cooling.md) を参照してください。2000 MHz には冷却 mod が必要だからです。

---

## 実際に効果を発揮する設定

- **クロック。** 標準の GPU 〜1500 MHz は遅いデフォルトです。コミュニティは日常の目標として **GPU 2000 MHz、mem 〜1900–2000 MHz** で動かし、一部は **dGPU クラスのビルドでコア 2.65 GHz** まで押し上げています。標準対 2000 MHz は GPU バウンドのシーンでおおよそ **+30 % FPS** です。([overclock guide](09-overclock-undervolt.md))
- **40 CU アンロック。** ボードは CU を無効化した状態で出荷されます。全 **40 CU** をアンロックすると、測定可能で広範な向上が得られます — あるユーザーは、アンロック後に Doom: The Dark Ages が動かない状態から **60 FPS High** へ、ある「007」タイトルが **60 FPS High** へ、Great Pragmata でフレームタイムがより安定したと報告しています。([src](https://t.me/c/2424231195/141193)) [09-overclock-undervolt.md](09-overclock-undervolt.md) を参照。
- **FSR / FSR 4。** 1440p/4K では Quality または Balanced を使い、GPU に仕事を供給し続けて温度を下げます。コミュニティは **FSR 4** を積極的に移植中です（スレッド内で DLL パッケージが共有されています）。([FSR4 INT8 discussion src](https://t.me/c/2424231195/136354)) elektricM が測定した FSR の向上：**Quality +20–30 %、Balanced +30–40 %、Performance +40–60 %** FPS。**フレーム生成はおおよそフレームレートを倍** にできます（わずかなレイテンシ）。**Optiscaler 経由の FSR 4** — コミュニティは **Balanced がネイティブの FSR 3.1.5 Quality を上回る** ことを発見しています。([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
  - **実際にどのアップスケーラーを使うか：** ここでは **FSR 1–3 が実用的な選択** です — 成熟しており、軽く、よくサポートされています。**FSR 4 と XeSS は技術的には** この RDNA2 シリコン上で **DP4a（INT8）パス経由で*動かせます*** — RDNA2 には dp4a/Rapid Packed Math があるため、OptiScaler の FSR 4 INT8 ビルドと GPU 非依存の XeSS-DP4a バリアントの両方がロードされます — が、これほど貧弱な GPU では **遅く実験的** です：DP4a フォールバックは新しいカードが使う WMMA パスより 〜10–20 % 重く、XeSS-DP4a の画質は XMX 版より下です。FSR 4 / XeSS は実験するものとして扱い、日常用途とはしないでください。([OptiScaler FSR4 INT8 on RDNA2 — VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/)) **RDNA2（RX 6000 クラス）向けの公式 AMD FSR 4 は 〜2027 年初頭に登場** します。それまでは OptiScaler/mod ルートです。([Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals))
- **FSR を超えるフレーム生成 — LSFG。** **Lossless Scaling Frame-Generation (LSFG)** は **`lsfg-vk`** Vulkan レイヤー経由で Linux 上で動きます（[github.com/PancakeTAS/lsfg-vk](https://github.com/PancakeTAS/lsfg-vk)） — 任意の Vulkan タイトルにフックするゲーム非依存のフレーム生成レイヤーです。コミュニティはこれを使って、組み込みのフレーム生成がないゲームで **おおよそ FPS を倍**（例：30 → 60）にしています。すべてのフレーム生成と同様にレイテンシを追加し、補間元として相応の実フレームレートを必要としますが、FSR 自身の FG が使えないときには本物の選択肢です。
- **VRAM 分割（UMA）。** 16 GB の統合プールです。ある入念なスイープ（1440p、1850 MHz）では、GDDR6 分割（512 MB 対 8 GB 予約）は **平均 FPS をほとんど変えませんでした** — ただし小さすぎるか誤った UMA 設定はソフトウェアレンダリング（`llvmpipe`）に落とすか、ベンチマークをハングさせる可能性があります。Auto / まともな予約で十分です。考えすぎないでください。([src](https://t.me/c/2424231195/81203))
- ベンチマークでは **VSync オフ**。提供されている場合は **フレーム生成オン**（Wukong が 3 桁の平均に到達するのを助けました、下記参照）。
- **`mitigations=off`**（カーネルのブートフラグ）はよくある調整です。VRAM スイープでは FPS への影響はわずかでノイジーでした。小さいものとして扱ってください。⚠ **要検証（効果の大きさは議論あり）** — elektricM ははるかに大きな向上を報告しています（**Cyberpunk で +18 FPS、彼らの tips では「+10–15 %」**）。明らかにゲーム依存です：一部の CPU バウンドタイトルでは大きく、他では無視できます。試して測定してください。どちらの数字も決めつけないでください。([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

---

## 人々が実際に投稿した結果

これらは設定とソース付きのコミュニティ報告の数値です。**ベンチマークスコアと FPS は投稿されたまま** です — クロック/ディストロ/ドライバーは行ごとに異なるので、コンテキストの列を読み、やみくもに比較しないでください。

| ゲーム | 設定（解像度 / プリセット / アップスケーリング） | 結果 | HW / クロック | ソース |
|------|--------------------------------------|--------|-------------|--------|
| **Black Myth: Wukong** (bench) | 1080p, High, FSR + Frame Gen on | **avg 96** (min 78, max 113) | BC-250, Windows, RADV NAVI10 | ([src](https://t.me/c/2424231195/10069)) |
| **Black Myth: Wukong** (bench) | 1440p, Medium, no FSR | **avg ~48** (max 56) | BC-250, 1850 MHz, Linux | ([src](https://t.me/c/2424231195/81203)) |
| **Shadow of the Tomb Raider** (bench) | 1440p, Max | **avg ~70** | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Marvel's Guardians of the Galaxy** (bench) | 1440p, High | **avg ~70** (89 max, min dips to ~3) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Dying Light 2** (bench) | 1440p, High, no VSync | **avg ~48** (max 62) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Cyberpunk 2077** (bench) | 1440p, Ray Tracing **min** | **avg ~36** (min 30) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Indiana Jones and the Great Circle** | 1440p, low, no upscaler | **45** | BC-250, GPU ~1900 MHz, Vulkan | ([src](https://t.me/c/2424231195/36931)) |
| **Indiana Jones and the Great Circle** | 1440p, medium, upscaler on | **60** | BC-250 | ([src](https://t.me/c/2424231195/36931)) |
| **Forza Horizon 5** | **4K**, High preset, **no FSR** | playable (video) | BC-250 | ([src](https://t.me/c/2424231195/81891)) |
| **The Witcher 3** | 4K, Medium, FSR Balanced | **~50** | BC-250 | ([src](https://t.me/c/2424231195/81894)) |
| **Kingdom Come: Deliverance II** | 4K, Med/High, FSR Quality | **~30** ("PS5 experience") | BC-250 | ([src](https://t.me/c/2424231195/81893)) |
| **The Last of Us Part II** | 1080p, default preset | playable (video) | BC-250 | ([src](https://t.me/c/2424231195/94237)) |
| **Doom: The Dark Ages** | High | **60** (after 40 CU unlock + fix) | BC-250, 40 CU | ([src](https://t.me/c/2424231195/141193)) · [Reddit fix](https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/) · [Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS) |
| **Doom Eternal** | RT on (community-reported) | **60 + RT** | BC-250; community-reported (r/BC250Gaming) | ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/)) |
| **Tekken 8** | (community-reported) | **~60** | BC-250; community-reported (r/BC250Gaming) | ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/)) |
| **Street Fighter 6** | (community-reported) | **~60** | BC-250; community-reported (r/BC250Gaming) | ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/)) |
| **Stellar Blade** | (community-reported) | **~70–80** | BC-250; community-reported (r/BC250Gaming) | ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | Frame Generation on (community-reported) | **60 → 100** (FG) | BC-250; community-reported (r/BC250Gaming) | ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | (video) | playable | BC-250, CPU stock, **GPU 2000** | ([src](https://t.me/c/2424231195/121772)) |
| **Gothic Remake** | Medium | **stutters** — "no optimization" | BC-250 | ([src](https://t.me/c/2424231195/142708)) |
| **Hi-Fi Rush** | (video, OBS capture) | smooth | BC-250, `mitigations=off` | ([src](https://t.me/c/2424231195/91022)) |
| **Cyberpunk 2077** | 1080p, High, FSR Quality, **no RT** | **70–90** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Cyberpunk 2077** (bench) | 1080p (stock 2000 MHz / 1000 mV) | **57.66** → **60.82** OC (2230 MHz); `mitigations=off` **+18** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **The Last of Us Part I** | 1080p, Medium-High | **60** (stable) | BC-250 — 90–100 °C during shader compile; some audio clicking | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Devil May Cry 5** | 1080p, High | **100** (lowest latency, ~10 ms) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Detroit: Become Human** | 1080p, Medium | **60** (capped) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Control** | 1080p, full **RT** | **40** | BC-250 — good for entry-level RT | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Company of Heroes 3** | 1080p | playable — **needs 4 GB VRAM split** (512 MB artifacts/crashes) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Red Dead Redemption 2** (bench) | use `-useMaximumSettings` flag | **45+** min | BC-250 — can detect wrong GPU adapter, set it manually | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **CS2** / **Rocket League** / **Elden Ring** | 1080p | **100+** / **120+** / **60** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Helldivers 2** | 1080p, low (reported) | **≈82** | BC-250, stock, single Noctua NF-P12 — GPU 73 °C / CPU 76 °C; ⚠ ASR | ([“Temps Shocked Me”](https://youtu.be/d7Hwqxn9yg8) ~5:08) |
| **Stalker 2** | medium (reported) | **≈80** | BC-250 — author flags CPU-bound / 8 GB RAM; ⚠ ASR | ([RU review](https://youtu.be/19l03qneKJ4) ~0:23) |
| **Stalker 2** | QHD (2560×1600), FSR Quality + Frame Gen, patch 1.21 (reported) | **57–70** (1080p, no FG **≈45**) | BC-250; ⚠ ASR | ([RU review](https://youtu.be/19l03qneKJ4) ~18:52) |
| **Arc Raiders** | 1080p (reported) | **≈56–80** | BC-250, stock; ⚠ ASR | ([Temps Shocked Me](https://youtu.be/d7Hwqxn9yg8) ~5:58) |
| **Spider-Man 2** | 1080p, High, FSR Frame Gen (reported) | **≈100** avg (sub-60 native) | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~11:04) |
| **Forza Horizon 5** | 1080p, Medium, no FSR (reported) | **70–95** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~12:19) |
| **Metro Exodus** | QHD, High (reported) | **≈58** | BC-250; ⚠ ASR | ([RU review](https://youtu.be/19l03qneKJ4) ~14:12) |
| **Palworld** | 1080p, med-high (reported) | **<60** (playable) | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:04) |
| **Red Dead Redemption 2** | 1080p, med-high, FSR Quality (reported) | **solid 60** | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:19) |
| **Left 4 Dead 2** | 1080p, max (reported) | **>150** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~10:18) |
| _参考：ディスクリート GPU ビルド_ | RE-engine bench, 1080p, High, no RT | **avg 67.99** (min 58, max 82) | **RX 6600** + Xeon E5-2667v4, Win10 | ([src](https://t.me/c/2424231195/116494)) |

> RX 6600 の行は **BC-250 の結果ではありません** — メンバーが比較点として同じシャーシ/CPU でディスクリートカードを動かしているものです。*CPU* 単体が何を維持できるかを示すために含めています。

### ファーストパーティ / コンソール移植 — 最適解

これらは十分よく動いたため、あるメンバーは単に「動く」と列挙しました（PS 風の移植は GPU に頼り、よく最適化されているので、このボードに合います）：

> Days Gone · Death Stranding · DIRT 5 · Ghost of Tsushima: Director's Cut · God of War (2018) · God of War: Ragnarök · Horizon Forbidden West · Horizon Zero Dawn · The Last of Us Part I · The Last of Us Part II Remastered · Returnal · Uncharted: Legacy of Thieves

([src](https://t.me/c/2424231195/99563))

---

## 既知の問題ゲーム（動かない / 回避策が必要）

elektricM は、本書がカバーしなかった、**失敗するかプラットフォームと戦う** タイトルを追跡しています — 購入前に確認してください：

| ゲーム | 問題 | 回避策 |
|------|---------|-----------|
| **Fortnite** | Easy Anti-Cheat が **Linux をサポートしない** | **なし — Linux BC-250 では動作不可** |
| **Valorant** | カーネルレベルのアンチチート | Linux で技術的問題；事実上ノー |
| **Magic: The Gathering Arena** | 特に **Fedora** でクラッシュ/フリーズ | **Manjaro / Bazzite** ではよりよく動く；別の Proton を試す |
| **Final Fantasy VII Rebirth** | 「DX12 is not supported on your system」（GPU 互換チェック） | **まだ修正なし** |
| **Black Myth: Wukong** (cracked) | 「CreateProcess() returned 2」（アンチタンパー） | **改変されていないゲームファイル** を使う |

（アンチチートの状態は時間とともに変化します — [areweanticheatyet.com](https://areweanticheatyet.com) と [protondb.com](https://www.protondb.com) を相互確認してください。）([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

### GPU 機能の欠如によるハードブロック（修正不可）

これは **RDNA 2 クラスのシリコン**（GFX1013）です。一握りの新しいタイトルは、**RDNA 2 が持たない GPU 機能をハード要求** します — 主に **メッシュシェーダー** と **ハードウェア可変レートシェーディング（VRS）** — そして動作を拒否します。欠けているシリコンは **ハードウェアの制限であり、ドライバーのバグではありません**：いかなる Mesa の更新、カーネルパラメータ、Proton のバージョンもその機能自体を追加しません。**メッシュシェーダー** は本当の壁です。**VRS** 要求は、ユーザー空間の Vulkan レイヤーがスタブアウトできる起動時のチェックにすぎないこともあります（下記の Doom の注記を参照） — なので常に致命的とは限りません。確認済みの例（[r/linux_gaming community thread](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)）：

| ゲーム | BC-250 に欠けているハード要求 |
|------|------------------------------------|
| **Final Fantasy VII Rebirth** | **メッシュシェーダー** — 動かない（これが上の表で DX12 GPU 互換チェックに引っかかる理由でもある） |
| **Doom: The Dark Ages — Update 2** | **Vulkan fragment shading rate**（ハードウェア VRS） — Update 2 は VRS を*起動時に*必須にした；GPU はそれを欠くため、改変されていないゲームはもう起動しない（Update 2 前のビルドは上記のとおり 40 CU アンロック後に 60 FPS で動いた）。**回避策あり** — 下記の注記を参照。 |

> **Doom: The Dark Ages Update 2 — 現在は回避策がある。** ゲームは起動時に VRS を*チェックする*だけで、ゲームプレイに実際に必要とすることはありません。**`bangstk/Vulkan_NullVRS`** Vulkan レイヤー（[github.com/bangstk/Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS)）は `vkCmdSetFragmentShadingRateKHR()` をインターセプトして no-op 化し、起動チェックを満たすので、ゲーム内の副作用なしにゲームが動きます。よって Doom: The Dark Ages は恒久的なハードブロックでは **ありません**。**メッシュシェーダーは別物** です — FF7 Rebirth のメッシュシェーダー要求に相当する shim はないので、そちらは本当に動きません。

> 真新しい AAA タイトルを買う前に、メッシュシェーダーやハードウェア VRS を要件として挙げていないか確認してください。**メッシュシェーダー** はここでは本当のハードウェアの壁です（回避策なし）。**ハードウェア VRS** 要求はしばしば起動時のゲートにすぎません — shim 可能なこともあれば（上記の Doom のように）そうでないこともあります — なので、どちらにせよ決めつける前にコミュニティを確認してください。

## レイトレーシング — 実際にテストされたもの

BC-250 は **本物の RDNA2 ハードウェア RT** を持ちます（Mesa 25.2+ を前提とすれば、ソフトウェアエミュレーションではありません）。elektricM によるテスト済み RT タイトル：

| ゲーム | 解像度 | FPS | 備考 |
|------|-----|-----|-------|
| Cyberpunk 2077 | 1080p | 50–60 | RT lighting only, FSR Quality |
| Control | 1080p | 40 | Full RT |
| Portal 2 RTX | 720p | 40 | Software RT path in Mesa 25.2+ |
| Half-Life 2 RTX | 720p | 20–30 | Very demanding |

ここでの RT はエントリーレベルです — よく最適化されたゲームの*ライティングのみ*には十分ですが、フルパストレーシングの負荷には向きません。([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

## Proton と起動オプション（Linux）

- **Proton バージョン：** まず **Proton GE**（最良の互換性）または **Proton Experimental** から始め、ゲームごとに安定版 **8.0 / 9.0** にフォールバックします。GE は **ProtonUp-Qt**（`protonup-qt`）経由でインストールします。一部のタイトルは特定のバージョンでしか動かない — 失敗したらテストしてください。([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- 知っておくべき **Steam 起動オプション**：
  - `mangohud %command%` — FPS/温度のオーバーレイ。
  - `RADV_DEBUG=nohiz %command%` — RADV を強制 / 一部のグリッチを修正。
  - `gamemoderun %command%` — そのセッションのあいだ CPU ガバナーを performance に（この CPU バウンドなボードに効く）。
  - 組み合わせ：`RADV_DEBUG=nohiz mangohud gamemoderun %command%`。
- **ゲームごとの VRAM（UMA 分割）：** e スポーツ/インディーは **512 MB** で問題なし。**ほとんどのゲームは 4 GB を欲しがる**。AAA/RT は追加 VRAM のカーネルパラメータ（`amdgpu.gttsize=...`、[06-linux.md](06-linux.md) / [08-bios.md](08-bios.md) を参照）も欲しがる。小さすぎる分割はアーティファクト、クラッシュ、またはソフトウェアレンダリングへの転落を引き起こします。([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **初回実行時のカクつき** は通常 **シェーダーコンパイル** です — FPS を判断する前に Steam にプリコンパイルを終わらせてください。より大きなシェーダーキャッシュが助けになります。([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **ゲームごとの修正**（コミュニティ報告、r/BC250Gaming — これらの正確なバグに遭遇したら試してください）：
  - **Resident Evil Requiem — 壊れた/グリッチした髪：** 起動オプションに `RADV_DEBUG=nohiz %command%` を追加（上で挙げた同じ RADV フラグを、ここで特に適用）。([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/))
  - **Spider-Man 2 / Assassin's Creed Shadows — フリーズ：** **zswap**（圧縮スワップ）を有効にするとフリーズが止まると報告されています。([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/))

---

## エミュレーション

エミュレーターは CPU 負荷が高いので結果はまちまちですが、いくつかは堅実です（[src](https://t.me/c/2424231195/78988)）：

- **Switch — Eden / Ryujinx：** よく動き、速い。コミュニティ報告（r/BC250Gaming）：**Mario Kart 〜60 FPS**；**Tears of the Kingdom 〜30–40 FPS**。✅ ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/))
- **PS4 — shadPS4 (0.9.0+)：** Bloodborne はドロップなしでよく動く。一部のタイトル（The Last Guardian）はアーティファクトが出るが安定した FPS を保つ。✅
- **PS3 — RPCS3：** 動くが、ゲームごとの調整が必要。⚠️ **既知のクセ**（コミュニティ報告、r/BC250Gaming）：エミュレーターのバグが RPCS3 下で **GPU を 1000 MHz に固定** するため、GPU がクロックアップできない — 回避策は、失われた GPU の余裕を補うために **CPU をオーバークロックする** ことです。([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/))
- **Xbox 360 — Xenia Canary：** メニューはロードされるが、ゲームプレイは黒画面に落ちる（調査中）。❌

---

## 動いているところを見るには（動画）

コミュニティはゲームプレイ/ベンチマーク動画を多数投稿しています。スレッド内のキャプチャとチャンネルをいくつか：

- BC-250 のゲームプレイ/ベンチマーククリップ：[youtu.be/CYDv1SfD2Pc](https://youtu.be/CYDv1SfD2Pc) · [youtu.be/g3uWOfqcexA](https://youtu.be/g3uWOfqcexA) · [youtu.be/9fozmRrAouc](https://youtu.be/9fozmRrAouc) · [youtu.be/q64M2XzADjA](https://youtu.be/q64M2XzADjA) · [youtu.be/0LEkOG1yqqw](https://youtu.be/0LEkOG1yqqw)
- テスト済みゲームのコミュニティ追跡シート（FPS/設定）：[Google Sheet](https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing)

---

## 現実的な期待値チートシート

| あなたが望むもの… | 2000 MHz の mod 済み BC-250 での現実 |
|-----------|--------------------------------------|
| 1080p AAA、60 FPS | 時々 — CPU 負荷次第。FSR + Frame Gen が助ける。古め/軽めの AAA：イエス。 |
| 1440p AAA | ほとんどの移植で 40–60 FPS；ここでは GPU に余裕がある。コスパ最良の解像度。 |
| 4K AAA | よく最適化された/コンソール移植（Forza、Witcher 3、KCD2）で FSR 付き 30–50 FPS。 |
| レイトレーシング | 最低設定でのみ、低 FPS（Cyberpunk 〜36 @ 1440p RT-min）。ボードの強みではない。 |
| どこでもロック 60 | ノー。CPU バウンドや物理演算が重いタイトルは設定に関係なくディップ/カクつきする。 |
| ファーストパーティ PS 移植 | 最適解 — これこそがボードの最も得意とするもの。 |

---

## ソース

- CPU バウンドのベンチマーク（38 FPS、36.5 % GPU） — https://t.me/c/2424231195/136242
- 大きな VRAM/クロックのベンチマーク表（Wukong, Tomb Raider, Dying Light 2, Cyberpunk, Guardians） — https://t.me/c/2424231195/81203
- Wukong 1080p High FSR+FG, avg 96 — https://t.me/c/2424231195/10069
- Indiana Jones Great Circle, マルチ解像度 — https://t.me/c/2424231195/36931
- Forza Horizon 5 4K — https://t.me/c/2424231195/81891 · Witcher 3 4K — https://t.me/c/2424231195/81894 · KCD2 4K — https://t.me/c/2424231195/81893
- 40 CU アンロックの結果（Doom Dark Ages 60 FPS） — https://t.me/c/2424231195/141193 · Doom fix — https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/
- TLOU II 1080p — https://t.me/c/2424231195/94237 · Resident Evil Requiem — https://t.me/c/2424231195/121772 · Gothic Remake のカクつき — https://t.me/c/2424231195/142708
- ファーストパーティ移植リスト — https://t.me/c/2424231195/99563
- エミュレーションのまとめ — https://t.me/c/2424231195/78988
- RX 6600 dGPU 比較ラン — https://t.me/c/2424231195/116494
- elektricM のゲーム互換性（ゲームごとの設定/FPS、問題ゲーム、RT 表、Proton と起動オプション、FSR の向上） — https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/
- YouTube の FPS キャプチャ（自動字幕 / ASR — 数値は概算）：ETA Prime (Spider-Man 2, Forza H5, Left 4 Dead 2) — https://youtu.be/q_CxcbS5HI8 · "Temps Shocked Me" (Helldivers 2, Arc Raiders) — https://youtu.be/d7Hwqxn9yg8 · RU review (Stalker 2, Metro Exodus) — https://youtu.be/19l03qneKJ4 · Pixels & Power (Palworld, RDR2, Elden Ring 30 FPS) — https://youtu.be/4S0DvIpqm0E
- メッシュシェーダー / ハードウェア VRS のハードブロック（FF7 Rebirth, Doom: The Dark Ages Update 2） — [r/linux_gaming thread](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- **Doom: The Dark Ages VRS 回避策 — `bangstk/Vulkan_NullVRS`**（`vkCmdSetFragmentShadingRateKHR` 用の no-op Vulkan レイヤー） — https://github.com/bangstk/Vulkan_NullVRS
- **Linux での LSFG フレーム生成 — `lsfg-vk`**（Vulkan レイヤー） — https://github.com/PancakeTAS/lsfg-vk
- **RDNA2 での DP4a（INT8）経由の FSR 4 / XeSS** — OptiScaler FSR4 INT8 ビルド：[VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/) · [OptiScaler FSR4 compat wiki](https://github.com/optiscaler/OptiScaler/wiki/FSR4-Compatibility-List)
- **RDNA2（〜2027 年初頭）/ RDNA3（2026 年 7 月）向け公式 AMD FSR 4** — [Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals)
- **コミュニティ報告のゲーム結果（r/BC250Gaming）** — Tekken 8, Street Fighter 6, Stellar Blade, RE Requiem Frame-Gen, Doom Eternal RT, Switch (Mario Kart / TOTK), RPCS3 1000 MHz GPU ロック, RE Requiem の髪 / Spider-Man 2 / AC Shadows の修正 — https://www.reddit.com/r/BC250Gaming/
- コミュニティのゲームテストスプレッドシート — https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing

> クロックと 40 CU アンロックは [09-overclock-undervolt.md](09-overclock-undervolt.md) にあります；2000 MHz で動かす前に [04-cooling.md](04-cooling.md) の mod を行ってください。
