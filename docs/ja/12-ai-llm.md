> 🌐 コミュニティ翻訳です。英語版が正となり、より新しい場合があります。誤りを見つけたら issue を立ててください：[English](../en/12-ai-llm.md) · https://github.com/lildebil0/awesome-bc250/issues

# BC-250 での AI / LLM

> **要点** — BC-250 の AI における魅力は、ジャンク価格の **16 GB の GDDR6** です。現実的な使い方は **Vulkan（RADV）バックエンド上の llama.cpp / Ollama** であり、ROCm では *ありません*。GPU は **gfx1013（Cyan Skillfish）** で、どの ROCm ビルドも公式にはこれをターゲットにしていないため、ROCm は多くの人が避ける深い泥沼です。Vulkan 上では、VRAM に収まる MoE モデルを使えば、コミュニティはおおよそ **30–40 tok/s** を見ています（例: gpt-oss-20b、Qwen3.5-35B-A3B、Gemma-4-26B-A3B）。問題は **メモリ** です: 16 GB は CPU+GPU で共有されるので、大きなモデルはギリギリのところに住み、OOM が #1 の失敗要因です。BIOS で VRAM を設定し、カーネルの TTM ページ上限を引き上げ、**MoE** モデルを動かす — それがすべてです。

BC-250 は優れた *予算推論ボックス* であり、貧弱な *トレーニングボックス* です。「Vulkan 経由で量子化モデルを動かす 16 GB のカード」として扱えば、楽しい時間を過ごせます。

---

## なぜ ROCm ではなく Vulkan なのか

GPU ダイは **Cyan Skillfish = `gfx1013`**（RDNA-1.x クラスの部品で、Navi 10/`gfx1010` の兄弟）です。この単一の事実がすべてを決めます:

- **ROCm は `gfx1013` のサポートを出荷していません。** AMD の ROCm スタックは特定の許可リストの GPU ID をターゲットにしており、Cyan Skillfish はそこにありません。だから公式の `ROCm/ROCm` パスは単にカードを認識しません。具体的には: `gfx1013` は LLVM では `rocm-amdhsa` 対応として *記載されています* が、**AMD の ROCm ユーザー空間（rocBLAS/Tensile）は `gfx1013` の数学（ソリューション）ライブラリを一切出荷していません** — なので GEMM が rocBLAS に当たった瞬間に `rocblas_abort()`（「GFX1013 not in GPU list」）が出ます。呼び出すべき数学カーネルがないのです（[akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)）。
- **それを脇に置いても、ROCm はこれらの APU で使えるシェーダーキャッシュを持たず — 起動のたびに再コンパイルします** が、**Vulkan バックエンドはコンパイル済みシェーダーをディスクにキャッシュします**。それだけで Vulkan が実用的な計算パスになります: akandr のテストは、Vulkan がこのボードで使える唯一の GPU 計算パスだったと結論づけています（[akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)）。（これは *ドライバー/ライブラリ* のギャップであり、**ハードウェア機能の欠如ではない** ことに注意 — RDNA2 の `gfx103x` ISA は INT8 dp4a を含みます、例えば `v_dot4c_i32_i8`; 問題は純粋に ROCm がこの ID 向けに何も出荷していないことです。）
- よく知られた「古いカードで ROCm をアンロックする」リポジトリも **これをカバーしていません**:
  - [`woodrex83/ROCm-For-RX580`](https://github.com/woodrex83/ROCm-For-RX580) は **`gfx803` 専用**（Polaris: RX 580/570/480）。アーキテクチャがまったく違う — ここでは使えません。
  - [`ulyssesrr/docker-rocm-xtra`](https://github.com/ulyssesrr/docker-rocm-xtra) は追加のターゲット（`gfx803`、`gfx900/906/908`、`gfx1010/1011/1012`、`gfx1030…`）を加えます — が **`gfx1013` はリストにありません**し、リポジトリは **2025-08-12 にアーカイブ** されました。`HSA_OVERRIDE_GFX_VERSION=10.1.0` で `gfx1010`（Navi 10）に *なりすます* ことを試せます。人々がディスプレイドライバーを立ち上げるために Navi 10 ファームウェアをシンボリックリンクするのと同じ方法です（`navi10_gpu_info.bin → cyan_skillfish_gpu_info.bin`、[src](https://t.me/c/2424231195/7458/136321)）。しかしこれは BC-250 の計算については未検証で、チャットで動く ROCm LLM スタックを報告している人は誰もいません。⚠ 要検証

人々が持ち出すその他のリポジトリ — [`xuhuisheng/rocm-build`（navi10）](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) と [`robertrosenbusch/gfx803_rocm`](https://github.com/robertrosenbusch/gfx803_rocm) — はそれぞれ Navi 10 dGPU と Polaris 向けで、Cyan Skillfish 向けではありません。有用な背景知識であって、このボードのレシピではありません。

**結論（2026 年半ば時点）:** BC-250 での ROCm は未解決/非経済的なハックです。コミュニティが共有してきた動作する全セットアップは **Mesa RADV 経由の Vulkan** 上で動いており、これは BC-250 のドライバースタックがすでにゲーミング用に提供しているものです。もし誰かが ROCm を動かすとすれば、パッチを当てたコンテナ内で `gfx1010` になりすますことによってでしょう — 週末が消えるのを覚悟してください、保証なしで。

> **アップデート — 誰かが HIP/ROCm を動作させました (Discord、2026年中頃)。** 上記の「動作するスタックが報告されていない」という結論の後に、あるメンバーが **MEC ファームウェアの変更**、BIOS設定の変更、およびスタックの再コンパイルを行った後、BC-250 上で **ROCm、HIP、および PyTorch の演算が動作している**ことを報告しました ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1482848457478901851))。その方法では、**HIP 向けにビルドされた `llama.cpp`** は定格クロックにおいて **TinyLlama-1.1B (pp512) で 709 tok/s**、および **Llama-3.1-8B (pp512) で 115 tok/s** を測定し ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1483073888551440384))、プレフィルは CU のアンロックに伴ってスケールしました — **24 CU (94–95 W) で約 230 tok/s 対 40 CU (125 W) で 371.6 tok/s、いずれも 1500 MHz** ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1506023598048022588))。これはファームウェア層に及ぶ実験的な経路であり、推奨されるルートではありませんが、「ROCm は不可能である」という結論がもはや絶対ではないことを示しています。 ⚠ advanced.

---

## 16 GB VRAM の優位性（とその落とし穴）

16 GB は、**量子化**（Q3–Q4）すれば 20–35B モデルを保持するのに十分です — そうでなければ 4060 Ti 16 GB か中古の 3090 が必要になる VRAM です。それがこのボードが LLM にとって面白い理由のすべてです。

落とし穴: **16 GB は CPU と GPU で共有されます。** フォールバックできる別のシステム RAM プールはありません。だから:

- モデル + KV キャッシュ + OS + あらゆるバックグラウンドプロセスが、すべて *同じ* 16 GB に収まります。
- モデルを大きくしすぎると「遅く」なるのではなく、ハードな **OOM** になります。一部のディストロでは KDE が倒れてコンソールに落とされます（[src](https://t.me/c/2424231195/101077)）。
- ある常連貢献者の数ヶ月のテスト後の評決: *「性能は多くの用途に十分; 足りないのは **メモリ** だ」* （[src](https://t.me/c/2424231195/101077)）。

ヘッドルームを買う 2 つのレバー:

1. **BIOS で VRAM を設定する。** `vram = 12`（GB）で動かすのは既知の良好なベースラインで、システム用に RAM を残します（[src](https://t.me/c/2424231195/101077)）。VRAM 分割を増やせばより大きなモデルがロードできますが、OS が飢えます。
2. **カーネルの TTM ページ上限を引き上げる** ことで、GPU メモリマネージャが 14B+ モデルが必要とする大きな割り当てを実際に渡すようにします（下記のセットアップを参照）。これが Vulkan でより大きなモデルをアンロックする唯一の変更です。

1–2 GB を取り戻すコミュニティの裏技: **ヘッドレスサーバー OS** を動かしてネットワーク越しにそれと話す（例: Open WebUI / API）ことで、VRAM を食うデスクトップをなくします（[src](https://t.me/c/2424231195/101077)）。

---

## 密なモデルではなく MoE モデルを動かす

これは 16 GB 共有メモリボックスで最も重要なモデリングの選択であり、チャットはその理由を明言しています（[src](https://t.me/c/2424231195/125233)）:

- **密な** モデルでは、レイヤーごとに *逐次的に* しか分割できません; テンソル並列の技は役立たないので、収まるものと生のバンド幅で制約されます。
- **MoE** モデルでは、密/アテンション部分をカードに保持し、トークンごとにいくつかの小さなエキスパートだけを起動します。結果: **はるかに大きなモデルが妥当な品質で収まり、スループットの倍率が得られます** — トークンごとに重みのごく一部しか触れられないからです。

それがまさに、人々が実際に BC-250 で動かすモデルが、小さなアクティブパラメータ数を持つ MoE である理由です: **gpt-oss-20b**（チャットのお気に入り）、**Qwen3.5-35B-A3B**（合計 35B / アクティブ 〜3B）、**Gemma-4-26B-A3B**。これらは同じ VRAM フットプリントの密なモデルがなしえるものをはるかに上回ります。

> マルチカードセットアップに関する関連する洞察: MoE では **エキスパートの列** をボード間で分割して集約バンド幅を得られますが、密なモデルの隠れ状態は小さい（70B でも 〜1 MB）ので、ノード間のギガビットリンクはボトルネックに *なりません*（[src](https://t.me/c/2424231195/125233)）。単一の BC-250 ではこれは無意味ですが、人々がそれらを連結する理由を説明します。

---

## セットアップ A — Ollama + Vulkan（推奨、再現可能）

最も完全で再現可能な BC-250 レシピは、コミュニティガイド [`akandr/bc250` → *Ollama + Vulkan setup*](https://github.com/akandr/bc250#3-ollama--vulkan-setup)（チャットで繰り返し参照されています）です。動作する BC-250 グラフィックススタック（[06-linux.md](06-linux.md) を参照）を前提とし — 最近の Mesa/RADV を持つ Fedora — その上に Ollama を重ねます。そのリポジトリから再掲:

**1. Ollama をインストール:**
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

**2. Vulkan バックエンド + メモリ安全オプションを有効化** systemd オーバーライド経由（`/etc/systemd/system/ollama.service.d/override.conf`）:
```ini
[Service]
Environment=OLLAMA_VULKAN=1
Environment=OLLAMA_FLASH_ATTENTION=1
Environment=OLLAMA_KV_CACHE_TYPE=q4_0
Environment=OLLAMA_MAX_LOADED_MODELS=1
Environment=OLLAMA_KEEP_ALIVE=30m
Environment=OLLAMA_CONTEXT_LENGTH=65536
Environment=OLLAMA_GPU_OVERHEAD=0
Environment=OLLAMA_MAX_QUEUE=4
OOMScoreAdjust=-1000
```
それから:
```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```
`OLLAMA_FLASH_ATTENTION=1` と `OLLAMA_KV_CACHE_TYPE=q4_0` は KV キャッシュを縮小して長いコンテキストが収まるようにします; `OOMScoreAdjust=-1000` はメモリ逼迫下でカーネルが最初に Ollama を kill するのを防ぎます。

**3. 鍵となるメモリ修正 — TTM ページ上限を引き上げる**（これが 14B+ / 大コンテキストのモデルをそもそもロードさせるものです）:
```bash
echo 4194304 | sudo tee /sys/module/ttm/parameters/pages_limit
echo 4194304 | sudo tee /sys/module/ttm/parameters/page_pool_size
```
再起動をまたいで永続化:
```bash
echo "options ttm pages_limit=4194304 page_pool_size=4194304" | \
  sudo tee /etc/modprobe.d/ttm-gpu-memory.conf
```

**4. MoE モデルを pull して動かす**、例:
```bash
ollama run gpt-oss:20b
```

> `akandr/bc250` ガイドは **Fedora 43 / kernel 6.18.9 / Mesa 25.3.4 RADV / Ollama 0.20.0** で検証されました。正確なパッケージバージョンはずれていきます — 環境変数と TTM 修正は維持し、残りは更新してください。⚠ コピーする前にリポジトリに対してバージョンを要検証。

**Oberon ガバナーを積み重ねる。** [`mothenjoyer69/oberon-governor`](https://gitlab.com/mothenjoyer69/oberon-governor)（ゲーミングで使うのと同じガバナー、[09-overclock-undervolt.md](09-overclock-undervolt.md) を参照）を動かすと、高クロックを保持することで **gpt-oss-20b で +10–20 tok/s** 追加すると報告されています（[src](https://t.me/c/2424231195/101077)）。利用可能な最も安価な高速化です。

---

## セットアップ B — llama.cpp（Vulkan）、ビルドまたはパッケージ

生の `llama.cpp` が欲しいなら（より細かい制御、どこからでも GGUF、`llama-server` の OpenAI 互換 API）:

**Arch / paru（チャットで検証された唯一のコマンド）:**
```bash
paru -S aur/llama.cpp-vulkan
```
（[src](https://t.me/c/2424231195/101026) — このセクションのチャットコーパスにおける唯一のビルドコマンド; パッケージ名に対してクロスチェック済み。）

**ソースからビルド**（[`ggml-org/llama.cpp` ビルドドキュメント](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md) に従う）— Debian/Ubuntu:
```bash
sudo apt-get install libvulkan-dev glslc spirv-headers
cmake -B build -DGGML_VULKAN=1
cmake --build build --config Release
```
（Fedora では SPIR-V ヘッダーパッケージは `spirv-headers-devel` です。）それから全レイヤーを GPU 上で動かす:
```bash
./build/bin/llama-cli -m PATH_TO_MODEL.gguf -ngl 99 -p "Hi, how are you?"
```
`-ngl 99` はすべてのレイヤーを Vulkan デバイスにオフロードします。`--list-devices` で llama.cpp が選んだデバイスが BC-250 であることを確認し、複数ある場合は `--device` で強制してください。事前ビルド済みバイナリは [llama.cpp リリースページ](https://github.com/ggml-org/llama.cpp/releases) にあります。

> **HIP/ROCm バックエンドはビルドしないでください**（`-DGGML_HIP=ON -DGPU_TARGETS=gfx1013`）。`gfx1013` 向けの ROCm ランタイムがないので、コンパイルできても動きません。Vulkan がここでサポートされるパスです。([ビルドドキュメント](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md))

**人々が実際に使うフロントエンド:**
- **[Jan AI](https://jan.ai/)** — チャットの現在の日常使い: 大きなモデルピッカー、コンテキスト/ツール設定、モデルにウェブアクセスを与えて画像/ドキュメントを読ませられる、MCP サポート。内部でモデルを Vulkan 上で動かします（[src](https://t.me/c/2424231195/101077)）。
- **[KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)** — Vulkan を備えた単一バイナリの llama.cpp ラッパー、1 ファイルデプロイに便利。
- **Open WebUI** — ヘッドレスボックスとペアにして別のマシンから駆動（デスクトップ VRAM を節約）。

---

## 現実的な token/s の期待値

下記の数値は **Vulkan 上でコミュニティ報告** されたもので、16 GB に収まるサイズの MoE モデルです。ベンチマークスイートではなくオーダー単位として扱ってください — `akandr/bc250` ガイドとチャットから、TTM 修正 + flash-attention + `q4_0` KV キャッシュを備えた単一ボード上のものです。

| モデル | 量子化 | アクティブ / 合計パラメータ | 報告された生成速度 |
|---|---|---|---|
| Qwen3.5-9B | Q4_K_M | 密 9B | 〜32 tok/s |
| Gemma-4-26B-A3B (MoE) | UD-Q3_K_M | 〜3B / 26B | 〜39 tok/s |
| Qwen3.5-35B-A3B (MoE) | UD-IQ2_M | 〜3B / 35B | 〜38 tok/s |
| gpt-oss-20b (MoE, MXFP4) | MXFP4 | 〜3.6B / 20B | コミュニティのお気に入り; Oberon ガバナーで +10–20 tok/s |

出典: 速度は [`akandr/bc250`](https://github.com/akandr/bc250#3-ollama--vulkan-setup) より; gpt-oss-20b の使用とガバナーの向上は（[src](https://t.me/c/2424231195/101077)）。モデルの GGUF は Hugging Face から — 例: [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF)、[unsloth Qwen3.6-35B-A3B](https://huggingface.co/unsloth/Qwen3.6-35B-A3B-GGUF)、[Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M)。

**正直な読み:** 20–35B MoE での 〜30–40 tok/s は、チャット、コーディング支援、エージェント/ツールループに本当に使えます。4090 では **ありません**。品質は 16 GB が強いる積極的な量子化（35B モデルでの IQ2/Q3）で頭打ちになります — そしてあるユーザーは、より厳しい量子化で 30B を押し込むと「おそらく多くのミスをするだろう」と指摘しました（[src](https://t.me/c/2424231195/101077)）。最良の選択肢は **gpt-oss-20b** で、繰り返し「小さいものすべてより賢い」と表現されつつ安定を保ちます（[src](https://t.me/c/2424231195/101077)）。

### 40-CU アンロックは LLM を高速化するか？ する — 密なモデルでライブ計測

40-CU アンロック（[09-overclock-undervolt.md](09-overclock-undervolt.md) を参照）は、ゲームより推論に効きます。トークン生成は計算ユニットを実際に使うからです。ある動画が、**密な** モデル — **Ollama + Vulkan** 上の Qwen3.5-9B（〜10 GB の GDDR6）— で CU をトグルしながら **ライブで** 計測し、スループットは CU 数にほぼ線形に追随しました（[Old Lamer — RU CU-unlock 動画](https://youtu.be/M7PsojWr4KA)、〜8:30–12:03）: *（⚠ 自動字幕 — 小数点以下は ≈ として扱ってください。）*

| アクティブ CU | 生成速度 | 24 CU 比 |
|---|---|---|
| 24 CU（ストック） | ≈25.7 tok/s | ベースライン |
| アンロックステップ | ≈31.9 tok/s | **〜+16–17 %** |
| 36 CU | ≈33.4 tok/s | **〜+20 % 合計** |

そのボードは **36 CU で頭打ち** になりました — 最後の 2 つの CU は本当に欠陥があり、有効化すると **llama がロード時にクラッシュ** しました。OC 章の「38/40 は宝くじ」という点の具体例です。Ollama 環境は上記のレシピに一致していました（`OLLAMA_VULKAN=1`、KV キャッシュ `q4_0`、コンテキスト 65536、`ttm.pages_limit=4194304`）。*密な* モデルなので、向上は純粋な CU スケーリングです — その上に MoE エキスパートルーティングの倍率はありません（[Old Lamer — RU CU-unlock 動画](https://youtu.be/M7PsojWr4KA)）。

`akandr/bc250` ガイドは、40-CU アンロックをまたいで **MoE** モデルでより完全な A/B を実施しました（アンロックパッチ自体は akandr ではなく [`duggasco/bc250-40cu-unlock`](https://github.com/duggasco/bc250-40cu-unlock) にあります; akandr は独立した FP32 サニティチェック + スループット再ランを加えます）。2 つの目玉となる生成のデルタ、どちらも **llama.cpp 経由**（[akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results)）:

| モデル | 量子化 | Gen @ 24 CU | Gen @ 40 CU | Δ |
|---|---|---|---|---|
| gpt-oss-20b (MoE) | MXFP4 | 66.1 tok/s | 87.5 tok/s | **+32 %** |
| Qwen3.5-35B-A3B (MoE) | — | 59.5 tok/s | 78.7 tok/s | **+32 %** |

11 モデルにわたって中央値はアンロックから **+32 % 生成 / +50 % プレフィル** でした。その表から取り上げる価値のある 2 点: **gpt-oss-20b は快適に動き（66 → 87 tok/s）**、チャットのお気に入りを裏付けます。そして akandr は MoE モデルが **Ollama よりも `llama.cpp` 経由で直接のほうが大幅に速い** ことを計測しました（Ollama のエキスパートディスパッチパスはこのアーキテクチャに対してより非効率です — 例えば Qwen3.5-35B-A3B はストッククロックで Ollama 上 25.1 tok/s 対 llama.cpp 上 59.5 tok/s でした）（[akandr/bc250 §4](https://github.com/akandr/bc250#4-benchmarks)）。

> 💬 **未検証の MoE データポイント（Hackaday コメント — 伝聞として扱う）。** 再現されたランではなく読者コメントから: **MTP**（マルチトークン予測）付きの Qwen「27b」が **≈14.5 tok/s**、MTP 付きの「35b」が **≈47 tok/s**。この広いばらつきはまさに MTP + MoE のアクティブパラメータ差が生むものですが、どちらの数字もここでは独立に確認されていません — コンテキストとして示しており、ベンチマークとしてではありません。⚠ 要検証

---

## つらい点（正直に）

- **OOM がデフォルトの失敗モード。** 16 GB 共有メモリ内の大きなモデル = 崖っぷちの暮らし。クラッシュを覚悟してください; KDE ではデスクトップが死んでコンソールだけが残ることがあります（[src](https://t.me/c/2424231195/101077)）。BIOS VRAM 分割、TTM 修正、`q4_0` KV キャッシュ、flash attention、ヘッドレスセットアップで緩和を。
- **ディストロの安定性はばらつく。** チャットでは、Vulkan 上のメモリ逼迫下でクラッシュしない点で **Ubuntu のほうが Fedora より安定** だと判明しました。Fedora が文書化されたベースラインであるにもかかわらずです（[src](https://t.me/c/2424231195/101077)）。あるディストロが OOM クラッシュを繰り返すなら、もう一方を試してください。
- **ROCm は事実上テーブルの外**（最上部のセクションを参照）。このカードで PyTorch/vLLM のトレーニングを追って何日も燃やさないでください — [vLLM の AMD パス](https://docs.vllm.ai/en/latest/getting_started/installation/gpu/#amd-rocm) は ROCm を必要とし、それはこのボードが持たないサポート済み GPU ID を必要とします。
- **これは推論ボックスであり、トレーナーではありません。** 実際の規模でのファインチューニングはより多くの VRAM と動作する計算スタックを欲しがります。モデルを *動かす* のに使い、トレーニングには使わないでください。
- **スループットはクロックに依存します。** 高クロックを保持するガバナーがなければ 10–20 tok/s を取りこぼします（[src](https://t.me/c/2424231195/101077)）; 持続的な推論は持続的な負荷なので、冷却もここで重要です（[04-cooling.md](04-cooling.md) を参照）。

---

## 推奨スターターセットアップ

| 段階 | これをする | 期待 |
|------|---------|--------|
| 最小限 | 動作する RADV スタック（[06-linux.md](06-linux.md)）→ Ollama + `OLLAMA_VULKAN=1` → TTM 修正 → `ollama run gpt-oss:20b` | 〜30+ tok/s、安定したチャット |
| より良く | Oberon ガバナー + flash-attn + `q4_0` KV キャッシュを追加; フロントエンドは Jan AI 経由 | +10–20 tok/s、長いコンテキスト、ツール/MCP |
| より大きなモデル | `pages_limit` を引き上げた状態の IQ2/Q3 での 35B-A3B MoE; ヘッドレス + Open WebUI で VRAM を解放 | 〜38 tok/s、メモリの上限近く |
| やめておく | `gfx1013` での ROCm / HIP / vLLM トレーニング | 行き止まり、スキップを |

---

## 出典

- BC-250 LLM レシピ（Ollama+Vulkan、TTM 修正、tok/s）— [akandr/bc250 §Ollama+Vulkan](https://github.com/akandr/bc250#3-ollama--vulkan-setup)
- なぜ gfx1013 で ROCm が失敗するのか（rocBLAS/Tensile ソリューションライブラリなし → `rocblas_abort()`; ROCm は起動のたびに再コンパイル 対 Vulkan はシェーダーをキャッシュ）— [akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm) · RDNA2 `gfx103x` ISA は INT8 dp4a（`v_dot4c_i32_i8`）を持つので、これはハードウェアではなくライブラリのギャップ — [LLVM GFX1030 ISA](https://llvm.org/docs/AMDGPU/AMDGPUAsmGFX1030.html)
- MoE での 40-CU アンロック、計測された生成デルタ（gpt-oss-20b 66.1→87.5、Qwen3.5-35B-A3B 59.5→78.7、11 モデルにわたって中央値 +32 % 生成 / +50 % プレフィル; MoE では llama.cpp ≫ Ollama）— [akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results) · [§4 ベンチマーク](https://github.com/akandr/bc250#4-benchmarks) · アンロックパッチ: [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock)
- 動作するセットアップ、gpt-oss-20b、Oberon の向上、OOM/ディストロの注記 — https://t.me/c/2424231195/101077
- MoE 対密、マルチカードバンド幅 — https://t.me/c/2424231195/125233
- 40-CU アンロックの LLM スケーリング、ライブ計測（⚠ ASR — 概算）— Ollama+Vulkan 上の Qwen3.5-9B 密: 25.7 → 31.9 → 33.4 tok/s（24 → アンロック → 36 CU、〜+20 % 合計）; ボードは 36 CU で頭打ち（2 CU が欠陥、llama がロード時にクラッシュ）— [Old Lamer — RU CU-unlock 動画](https://youtu.be/M7PsojWr4KA)
- MoE w/ MTP データポイント（⚠ 未検証、Hackaday コメント）— Qwen「27b」+MTP ≈14.5 tk/s、「35b」+MTP ≈47 tk/s — Hackaday BC-250 記事のコメントスレッド
- 検証済みパッケージコマンド — https://t.me/c/2424231195/101026 · Navi10→Cyan Skillfish ファームウェアシンボリックリンク — https://t.me/c/2424231195/7458/136321
- llama.cpp ビルド（Vulkan / HIP）— [ggml-org/llama.cpp build.md](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md) · [リリース](https://github.com/ggml-org/llama.cpp/releases) · [インストール](https://github.com/ggml-org/llama.cpp/blob/master/docs/install.md)
- gfx1013 での ROCm の現実 — [ROCm/ROCm](https://github.com/ROCm/ROCm) · [woodrex83/ROCm-For-RX580（gfx803 のみ）](https://github.com/woodrex83/ROCm-For-RX580) · [ulyssesrr/docker-rocm-xtra（アーカイブ済み; gfx1013 なし）](https://github.com/ulyssesrr/docker-rocm-xtra) · [xuhuisheng/rocm-build navi10](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) · [robertrosenbusch/gfx803_rocm](https://github.com/robertrosenbusch/gfx803_rocm)
- フロントエンド — [Jan AI](https://jan.ai/) · [KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)
- モデル（GGUF）— [Hugging Face](https://huggingface.co/) · [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF) · [Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M)
- オーバークロック/ガバナー — [09-overclock-undervolt.md](09-overclock-undervolt.md) · Linux ベース — [06-linux.md](06-linux.md) · 冷却 — [04-cooling.md](04-cooling.md)
