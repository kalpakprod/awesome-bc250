> 🌐 社区翻译。英文版为权威来源，可能更新更及时。发现错误？请提交 issue：[English](../en/12-ai-llm.md) · https://github.com/lildebil0/awesome-bc250/issues

# BC-250 上的 AI / LLM

> **太长不看** —— BC-250 对 AI 的吸引力是它在废品价上的 **16 GB GDDR6**。现实的用法是 **llama.cpp / Ollama 跑在 Vulkan (RADV) 后端上** —— *而非* ROCm。这颗 GPU 是 **gfx1013（Cyan Skillfish）**，没有任何 ROCm 构建官方瞄准它，所以 ROCm 是大多数人会跳过的一个深坑。在 Vulkan 上，用一个能装进 VRAM 的 MoE 模型，社区看到大约 **30–40 tok/s**（例如 gpt-oss-20b、Qwen3.5-35B-A3B、Gemma-4-26B-A3B）。陷阱是**内存**：16 GB 是 CPU+GPU 共享的，所以大模型就活在边缘上，OOM 是头号失败。设好 BIOS VRAM，提高内核 TTM 页限制，并跑 **MoE** 模型 —— 这就是全部要诀。

BC-250 是一台不错的*预算推理盒子*，一台糟糕的*训练盒子*。把它当作"一张跑 Vulkan 量化模型的 16 GB 卡"，你会玩得开心。

---

## 为什么是 Vulkan，不是 ROCm

GPU 裸片是 **Cyan Skillfish = `gfx1013`**（一个 RDNA-1.x 级部件，Navi 10/`gfx1010` 的同胞）。这一个事实决定了一切：

- **ROCm 不提供对 `gfx1013` 的支持。** AMD 的 ROCm 栈瞄准一份特定的 GPU ID 白名单，而 Cyan Skillfish 不在上面。所以官方的 `ROCm/ROCm` 路径根本看不到这张卡。具体来说：`gfx1013` *确实*在 LLVM 里被列为 `rocm-amdhsa` 可用，但 **AMD 的 ROCm 用户态（rocBLAS/Tensile）不提供 `gfx1013` 数学（solution）库** —— 所以一个 GEMM 一打到 rocBLAS 你就得到 `rocblas_abort()`（"GFX1013 not in GPU list"）。没有数学内核可调用（[akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)）。
- **即便撇开那点，ROCm 在这些 APU 上也没有可用的着色器缓存 —— 它每次启动都重新编译**，而 **Vulkan 后端把编译好的着色器缓存到磁盘**。仅这一点就让 Vulkan 成为实用的计算路径：akandr 的测试得出结论，Vulkan 是这块板卡上唯一被发现可用的 GPU 计算路径（[akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)）。（注意这是一个*驱动/库*的缺口，**而非**一个缺失硬件特性的缺口 —— RDNA2 的 `gfx103x` ISA 确实包含 INT8 dp4a，例如 `v_dot4c_i32_i8`；问题纯粹是 ROCm 没为这个 ID 提供任何东西。）
- 那些知名的"在老卡上解锁 ROCm"仓库**也都不覆盖它**：
  - [`woodrex83/ROCm-For-RX580`](https://github.com/woodrex83/ROCm-For-RX580) 是**仅 `gfx803`**（Polaris：RX 580/570/480）。完全是错误的架构 —— 这里用不了。
  - [`ulyssesrr/docker-rocm-xtra`](https://github.com/ulyssesrr/docker-rocm-xtra) 添加了额外目标（`gfx803`、`gfx900/906/908`、`gfx1010/1011/1012`、`gfx1030…`） —— 但**`gfx1013` 不在列表里**，且该仓库已于 **2025-08-12 归档**。你*可以*试着用 `HSA_OVERRIDE_GFX_VERSION=10.1.0` 伪装成 `gfx1010`（Navi 10），就像人们符号链接 Navi 10 固件来唤起显示驱动那样（`navi10_gpu_info.bin → cyan_skillfish_gpu_info.bin`，[来源](https://t.me/c/2424231195/7458/136321)），但这在 BC-250 上用于计算未经验证，聊天里没人报告一个工作的 ROCm LLM 栈。⚠ 验证

人们到处扔的其他仓库 —— [`xuhuisheng/rocm-build` (navi10)](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) 和 [`robertrosenbusch/gfx803_rocm`](https://github.com/robertrosenbusch/gfx803_rocm) —— 分别是给 Navi 10 独显和 Polaris 的，不是 Cyan Skillfish。它们是有用的背景，不是这块板卡的配方。

**底线（截至 2026 年中）：** BC-250 上的 ROCm 是一个未解决/不经济的折腾。社区分享的每一个工作设置都跑在 **Vulkan via Mesa RADV** 上，BC-250 的驱动栈已经为游戏给了你它。如果有人让 ROCm 工作了，那会是在一个打过补丁的容器里冒充 `gfx1010` —— 预期搭进一个周末，且没有保证。

> **更新 — 有人成功运行了 HIP/ROCm (Discord，2026年中)。** 在此前的“无人报告成功运行的软件栈”结论之后，有成员报告，在**修改 MEC 固件**、更改 BIOS 设置并重新编译软件栈后，在 BC-250 上**运行了 ROCm, HIP 和 PyTorch 计算** ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1482848457478901851))。在此路径下，**基于 HIP 构建的 `llama.cpp`** 在默认频率下测得 **TinyLlama-1.1B (pp512) 达 709 tok/s** 且 **Llama-3.1-8B (pp512) 达 115 tok/s** ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1483073888551440384))，且 prefill 性能随 CU 解锁而提升 —— **在 24 CU (94–95 W) 下约为 ~230 tok/s，对比在 40 CU (125 W) 下的 371.6 tok/s，两者频率均为 1500 MHz** ([src](https://discord.com/channels/1315924807128449065/1315933088668454942/1506023598048022588))。这是一种涉及底层固件的实验性路径 —— 并非推荐路线 —— 但它表明“ROCm 无法运行”的结论不再是绝对的。 ⚠ 进阶。

---

## 16 GB VRAM 优势（及其陷阱）

16 GB 足以在**量化**（Q3–Q4）时容纳一个 20–35B 模型 —— 否则要花你一张 4060 Ti 16 GB 或一张二手 3090 的 VRAM。这就是板卡对 LLM 有趣的全部原因。

陷阱：**16 GB 是 CPU 和 GPU 共享的。** 没有单独的系统 RAM 池可回退。所以：

- 模型 + KV 缓存 + OS + 每个后台进程全都装进*同一个* 16 GB。
- 把模型推得太大你不会得到"慢" —— 你得到一个硬 **OOM**，而在某些发行版上 KDE 会垮掉把你丢到一个控制台（[来源](https://t.me/c/2424231195/101077)）。
- 一位常规贡献者经过数月测试的判断：*"性能对很多事够了；不够的是**内存**。"*（[来源](https://t.me/c/2424231195/101077)）

两个调节杆给你买到余量：

1. **在 BIOS 里设 VRAM。** 用 `vram = 12`（GB）运行是一个已知好用的基准，给系统留下 RAM（[来源](https://t.me/c/2424231195/101077)）。更高的 VRAM 划分让更大的模型加载，但饿死 OS。
2. **提高内核 TTM 页限制**，让 GPU 内存管理器真正发出一个 14B+ 模型需要的大分配（见下面的设置）。这是在 Vulkan 上解锁更大模型的唯一改动。

一个抢回 1–2 GB 的社区技巧：跑一个**无头服务器 OS** 并通过网络与它对话（例如 Open WebUI / 一个 API），这样就没有桌面在吃 VRAM（[来源](https://t.me/c/2424231195/101077)）。

---

## 跑 MoE 模型，不是密集模型

这是一台 16 GB 共享内存盒子上最重要的建模选择，而聊天对原因说得很明白（[来源](https://t.me/c/2424231195/125233)）：

- 对一个**密集**模型，你只能*顺序*地逐层切分；张量并行的把戏帮不上忙，所以你被能装下的东西和原始带宽所限。
- 对一个 **MoE** 模型，你把密集/注意力部分留在卡上，每个 token 只激活几个小专家。结果：**一个大得多的模型以不错的质量装下，而你得到一个吞吐倍增器**，因为每个 token 只触碰一小部分权重。

这正是人们在 BC-250 上实际跑的模型都是带小激活参数量的 MoE 的原因：**gpt-oss-20b**（聊天的最爱）、**Qwen3.5-35B-A3B**（35B 总 / ~3B 激活）、**Gemma-4-26B-A3B**。它们的表现远超相同 VRAM 占用的密集模型所能。

> 一个针对多卡设置的相关洞见：对 MoE，你可以把**专家列**切分到各块板卡并获得聚合带宽，而一个密集模型的隐藏状态很小（即便 70B 也才 ~1 MB），所以节点间的千兆链路*不是*瓶颈（[来源](https://t.me/c/2424231195/125233)）。对单块 BC-250 这无关紧要，但它解释了人们为何把它们串起来。

---

## 设置 A —— Ollama + Vulkan（推荐，可复现）

最完整、可复现的 BC-250 配方是社区指南 [`akandr/bc250` → *Ollama + Vulkan setup*](https://github.com/akandr/bc250#3-ollama--vulkan-setup)（聊天里反复引用）。它假设一个工作的 BC-250 图形栈（见 [06-linux.md](../en/06-linux.md)） —— Fedora 配近期 Mesa/RADV —— 然后在上面叠加 Ollama。复现自该仓库：

**1. 安装 Ollama：**
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

**2. 启用 Vulkan 后端 + 内存安全选项**，经一个 systemd override（`/etc/systemd/system/ollama.service.d/override.conf`）：
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
然后：
```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```
`OLLAMA_FLASH_ATTENTION=1` 和 `OLLAMA_KV_CACHE_TYPE=q4_0` 缩小 KV 缓存，让一个长上下文装得下；`OOMScoreAdjust=-1000` 在内存压力下阻止内核先杀 Ollama。

**3. 关键的内存修复 —— 提高 TTM 页限制**（这是让 14B+ / 大上下文模型能加载的东西）：
```bash
echo 4194304 | sudo tee /sys/module/ttm/parameters/pages_limit
echo 4194304 | sudo tee /sys/module/ttm/parameters/page_pool_size
```
让它跨重启持久：
```bash
echo "options ttm pages_limit=4194304 page_pool_size=4194304" | \
  sudo tee /etc/modprobe.d/ttm-gpu-memory.conf
```

**4. 拉取并运行一个 MoE 模型**，例如：
```bash
ollama run gpt-oss:20b
```

> `akandr/bc250` 指南在 **Fedora 43 / 内核 6.18.9 / Mesa 25.3.4 RADV / Ollama 0.20.0** 上验证。确切的软件包版本会漂移 —— 保留环境变量和 TTM 修复；其余的更新。⚠ 复制前与仓库核对版本。

**叠加 Oberon 调速器。** 跑 [`mothenjoyer69/oberon-governor`](https://gitlab.com/mothenjoyer69/oberon-governor)（与游戏用的同一个调速器，见 [09-overclock-undervolt.md](../en/09-overclock-undervolt.md)）据报告通过保持更高时钟在 gpt-oss-20b 上**加 +10–20 tok/s**（[来源](https://t.me/c/2424231195/101077)）。它是可用的最便宜的提速。

---

## 设置 B —— llama.cpp (Vulkan)，构建或打包

如果你想要原始 `llama.cpp`（更多控制，来自任何地方的 GGUF，`llama-server` 的 OpenAI 兼容 API）：

**Arch / paru（聊天里唯一验证的命令）：**
```bash
paru -S aur/llama.cpp-vulkan
```
（[来源](https://t.me/c/2424231195/101026) —— 本节聊天语料里唯一的构建命令；已对照软件包名核对。）

**从源码构建**（按 [`ggml-org/llama.cpp` build docs](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md)） —— Debian/Ubuntu：
```bash
sudo apt-get install libvulkan-dev glslc spirv-headers
cmake -B build -DGGML_VULKAN=1
cmake --build build --config Release
```
（在 Fedora 上 SPIR-V 头文件包是 `spirv-headers-devel`。）然后把所有层放到 GPU 上运行：
```bash
./build/bin/llama-cli -m PATH_TO_MODEL.gguf -ngl 99 -p "Hi, how are you?"
```
`-ngl 99` 把每一层卸载到 Vulkan 设备。用 `--list-devices` 确认 BC-250 是 llama.cpp 选中的设备，如果你有多于一个就用 `--device` 强制它。预构建二进制在 [llama.cpp releases 页](https://github.com/ggml-org/llama.cpp/releases)。

> **不要构建 HIP/ROCm 后端**（`-DGGML_HIP=ON -DGPU_TARGETS=gfx1013`）。没有给 `gfx1013` 的 ROCm 运行时，所以即便它编译也不会运行。Vulkan 是这里受支持的路径。（[build doc](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md)）

**人们实际使用的前端：**
- **[Jan AI](https://jan.ai/)** —— 聊天当前的日常驾驶：大的模型选择器、上下文/工具设置、能给模型网络访问 + 读图像/文档、MCP 支持。底下经 Vulkan 跑模型（[来源](https://t.me/c/2424231195/101077)）。
- **[KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)** —— 单二进制 llama.cpp 封装，带 Vulkan，便于单文件部署。
- **Open WebUI** —— 与一台无头机器配对，从另一台机器驱动它（省桌面 VRAM）。

---

## 现实的 token/s 预期

下面的数字是**社区报告的、在 Vulkan 上**，MoE 模型尺寸适配 16 GB。把它们当作数量级，而非一套基准测试 —— 它们来自 `akandr/bc250` 指南和聊天，在单块板卡上带 TTM 修复 + flash-attention + `q4_0` KV 缓存。

| 模型 | 量化 | 激活 / 总参数 | 报告的生成速度 |
|---|---|---|---|
| Qwen3.5-9B | Q4_K_M | 密集 9B | ~32 tok/s |
| Gemma-4-26B-A3B (MoE) | UD-Q3_K_M | ~3B / 26B | ~39 tok/s |
| Qwen3.5-35B-A3B (MoE) | UD-IQ2_M | ~3B / 35B | ~38 tok/s |
| gpt-oss-20b (MoE, MXFP4) | MXFP4 | ~3.6B / 20B | 社区最爱；配 Oberon 调速器 +10–20 tok/s |

来源：速度来自 [`akandr/bc250`](https://github.com/akandr/bc250#3-ollama--vulkan-setup)；gpt-oss-20b 用法 & 调速器提升（[来源](https://t.me/c/2424231195/101077)）。模型 GGUF 来自 Hugging Face —— 例如 [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF)、[unsloth Qwen3.6-35B-A3B](https://huggingface.co/unsloth/Qwen3.6-35B-A3B-GGUF)、[Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M)。

**诚实的解读：** 在一个 20–35B MoE 上 ~30–40 tok/s 对聊天、编程帮助和 agent/工具循环是真正可用的。它**不是**一张 4090。质量受 16 GB 强制的激进量化所限（35B 模型上的 IQ2/Q3） —— 而一位用户指出在更狠的量化下推一个 30B"大概会犯很多错误"（[来源](https://t.me/c/2424231195/101077)）。甜点位是 **gpt-oss-20b**，被反复描述为"比所有小的都聪明"同时保持稳定（[来源](https://t.me/c/2424231195/101077)）。

### 40-CU 解锁会加速 LLM 吗？会 —— 在一个密集模型上实时测得

40-CU 解锁（见 [09-overclock-undervolt.md](../en/09-overclock-undervolt.md)）对推理的帮助大于对游戏，因为 token 生成确实使用计算单元。一段视频在一个**密集**模型上切换 CU 时**实时**测量它 —— Qwen3.5-9B（~10 GB GDDR6）在 **Ollama + Vulkan** 上 —— 吞吐几乎线性地跟随 CU 数（[Old Lamer — RU CU-unlock 视频](https://youtu.be/M7PsojWr4KA)，~8:30–12:03）：*（⚠ 自动字幕 —— 把小数当作 ≈。）*

| 激活 CU | 生成速度 | vs 24 CU |
|---|---|---|
| 24 CU（原厂） | ≈25.7 tok/s | 基准 |
| 解锁步进 | ≈31.9 tok/s | **~+16–17%** |
| 36 CU | ≈33.4 tok/s | **~+20% 总计** |

那块板卡**止步于 36 CU** —— 最后两个 CU 真正有缺陷，启用它们时 **llama 在加载时崩溃**，是超频章节里"38/40 是彩票"这点的一个具体例子。Ollama 环境与上面的配方一致（`OLLAMA_VULKAN=1`，KV 缓存 `q4_0`，上下文 65536，`ttm.pages_limit=4194304`）。因为是一个*密集*模型，收益是纯 CU 扩展 —— 没有 MoE 专家路由倍增器叠加在上面（[Old Lamer — RU CU-unlock 视频](https://youtu.be/M7PsojWr4KA)）。

`akandr/bc250` 指南在 40-CU 解锁上对 **MoE** 模型跑了一个更完整的 A/B（解锁补丁本身在 [`duggasco/bc250-40cu-unlock`](https://github.com/duggasco/bc250-40cu-unlock) 里，不是 akandr；akandr 加了一个独立的 FP32 理智检查 + 吞吐重跑）。两个标题生成增量，都**经 llama.cpp**（[akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results)）：

| 模型 | 量化 | 生成 @ 24 CU | 生成 @ 40 CU | Δ |
|---|---|---|---|---|
| gpt-oss-20b (MoE) | MXFP4 | 66.1 tok/s | 87.5 tok/s | **+32%** |
| Qwen3.5-35B-A3B (MoE) | — | 59.5 tok/s | 78.7 tok/s | **+32%** |

跨 11 个模型，解锁带来的中位数是 **+32% 生成 / +50% 预填充**。从那张表里值得拎出来两点：**gpt-oss-20b 舒适地运行（66 → 87 tok/s）**，证实了聊天的最爱，而 akandr 测得 MoE 模型**通过 `llama.cpp` 直接跑比通过 Ollama 快得多**（Ollama 的专家派发路径对这个架构效率较低 —— 例如 Qwen3.5-35B-A3B 在 Ollama 上是 25.1 tok/s vs llama.cpp 上 59.5 tok/s，均在原厂时钟）（[akandr/bc250 §4](https://github.com/akandr/bc250#4-benchmarks)）。

> 💬 **未经验证的 MoE 数据点（Hackaday 评论 —— 当作传闻）。** 来自读者评论而非一次复现的运行：一个带 **MTP**（多 token 预测）的 Qwen "27b" 在 **≈14.5 tok/s**，一个带 MTP 的 "35b" 在 **≈47 tok/s**。这个宽泛的分布正是 MTP + MoE 激活参数差异会产生的，但这里两个数字都未被独立确认 —— 标注为背景，而非基准。⚠ 验证

---

## 什么是痛苦的（说实话）

- **OOM 是默认的失败模式。** 16 GB 共享内存里的大模型 = 活在边缘。预期崩溃；在 KDE 上桌面可能死掉只留一个控制台（[来源](https://t.me/c/2424231195/101077)）。用 BIOS VRAM 划分、TTM 修复、`q4_0` KV 缓存、flash attention 和一个无头设置来缓解。
- **发行版稳定性不一。** 聊天发现 **Ubuntu 比 Fedora 更稳定**，在 Vulkan 上的内存压力下不崩溃，尽管 Fedora 是有记录的基准（[来源](https://t.me/c/2424231195/101077)）。如果一个发行版一直 OOM 崩溃，试另一个。
- **ROCm 实际上不在桌面上**（见顶部章节）。别在这张卡上烧几天追 PyTorch/vLLM 训练 —— [vLLM 的 AMD 路径](https://docs.vllm.ai/en/latest/getting_started/installation/gpu/#amd-rocm) 需要 ROCm，而 ROCm 需要一个这块板卡没有的受支持 GPU ID。
- **它是一台推理盒子，不是训练器。** 任何真实规模的微调都想要更多 VRAM 和一个工作的计算栈。用它来*运行*模型，不是训练它们。
- **吞吐取决于时钟。** 没有一个保持高时钟的调速器，你会在桌上留下 10–20 tok/s（[来源](https://t.me/c/2424231195/101077)）；散热在这里也重要（见 [04-cooling.md](../en/04-cooling.md)），因为持续推理是一个持续负载。

---

## 推荐入门设置

| 层级 | 这么做 | 预期 |
|------|---------|--------|
| 最低 | 工作的 RADV 栈（[06-linux.md](../en/06-linux.md)）→ Ollama + `OLLAMA_VULKAN=1` → TTM 修复 → `ollama run gpt-oss:20b` | ~30+ tok/s，稳定聊天 |
| 更好 | 加 Oberon 调速器 + flash-attn + `q4_0` KV 缓存；前端经 Jan AI | +10–20 tok/s，更长上下文，工具/MCP |
| 更大模型 | 35B-A3B MoE 在 IQ2/Q3 配提高的 TTM `pages_limit`；无头 + Open WebUI 释放 VRAM | ~38 tok/s，接近内存上限 |
| 别做 | 在 `gfx1013` 上 ROCm / HIP / vLLM 训练 | 死路，跳过 |

---

## 来源

- BC-250 LLM 配方（Ollama+Vulkan、TTM 修复、tok/s） —— [akandr/bc250 §Ollama+Vulkan](https://github.com/akandr/bc250#3-ollama--vulkan-setup)
- 为何 ROCm 在 gfx1013 上失败（无 rocBLAS/Tensile solution 库 → `rocblas_abort()`；ROCm 每次启动重编译 vs Vulkan 缓存着色器） —— [akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm) · RDNA2 `gfx103x` ISA 有 INT8 dp4a（`v_dot4c_i32_i8`），所以这是库缺口而非硬件缺口 —— [LLVM GFX1030 ISA](https://llvm.org/docs/AMDGPU/AMDGPUAsmGFX1030.html)
- MoE 上的 40-CU 解锁，测得的生成增量（gpt-oss-20b 66.1→87.5、Qwen3.5-35B-A3B 59.5→78.7，跨 11 个模型中位数 +32% 生成 / +50% 预填充；MoE 上 llama.cpp ≫ Ollama） —— [akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results) · [§4 benchmarks](https://github.com/akandr/bc250#4-benchmarks) · 解锁补丁：[duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock)
- 工作设置、gpt-oss-20b、Oberon 提升、OOM/发行版备注 —— https://t.me/c/2424231195/101077
- MoE vs 密集、多卡带宽 —— https://t.me/c/2424231195/125233
- 40-CU 解锁 LLM 扩展，实时测得（⚠ ASR —— 近似） —— Qwen3.5-9B 密集在 Ollama+Vulkan：25.7 → 31.9 → 33.4 tok/s（24 → 解锁 → 36 CU，~+20% 总计）；板卡止步于 36 CU（2 个 CU 有缺陷，llama 加载时崩溃） —— [Old Lamer — RU CU-unlock 视频](https://youtu.be/M7PsojWr4KA)
- MoE 带 MTP 数据点（⚠ 未验证，Hackaday 评论） —— Qwen "27b"+MTP ≈14.5 tk/s、"35b"+MTP ≈47 tk/s —— Hackaday BC-250 文章评论区
- 已验证的软件包命令 —— https://t.me/c/2424231195/101026 · Navi10→Cyan Skillfish 固件符号链接 —— https://t.me/c/2424231195/7458/136321
- llama.cpp 构建（Vulkan / HIP） —— [ggml-org/llama.cpp build.md](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md) · [releases](https://github.com/ggml-org/llama.cpp/releases) · [install](https://github.com/ggml-org/llama.cpp/blob/master/docs/install.md)
- gfx1013 上的 ROCm 现实 —— [ROCm/ROCm](https://github.com/ROCm/ROCm) · [woodrex83/ROCm-For-RX580（仅 gfx803）](https://github.com/woodrex83/ROCm-For-RX580) · [ulyssesrr/docker-rocm-xtra（已归档；无 gfx1013）](https://github.com/ulyssesrr/docker-rocm-xtra) · [xuhuisheng/rocm-build navi10](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) · [robertrosenbusch/gfx803_rocm](https://github.com/robertrosenbusch/gfx803_rocm)
- 前端 —— [Jan AI](https://jan.ai/) · [KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)
- 模型（GGUF） —— [Hugging Face](https://huggingface.co/) · [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF) · [Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M)
- 超频/调速器 —— [09-overclock-undervolt.md](../en/09-overclock-undervolt.md) · Linux 基础 —— [06-linux.md](../en/06-linux.md) · 散热 —— [04-cooling.md](../en/04-cooling.md)
