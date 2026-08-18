---
type: Reference
title: BC-250 — AI / LLM
description: Community-verified BC-250 ai / llm facts extracted from chat, with source citations.
tags: [bc250, ai-llm]
timestamp: 2026-06-18T00:00:00Z
---

# AI / LLM

_178 verified facts. Each bullet links to the source message; reaction count (re) reflects community upvotes at export._

- The BC250 is being used for Hipfire local development and AMD architecture validation. — schuttdev (re147, 2026-04-29) · _r/LocalLLaMA_ [[1]](https://www.reddit.com/r/LocalLLaMA/comments/1syp3un/hipfire_dev_update_full_amd_arch_validation/)
  - src: Hipfire dev update: full AMD arch validation incoming (RDNA 1 thru 4, plus Strix Halo and bc250) Hipfire local dev lab coming together. MS-S1 MAX (Strix Halo, RDNA 3.5) + R9700 (RDNA 4 Pro) just lande…
- llama-server can be run with Vulkan, a 40960 context window, all layers offloaded to the GPU, Flash Attention on, K and V cache quantization q4_0, and 4 concurrent sessions. — kingofgames0880 (re13, 2025-08-12) · _VC(VibeCode)-250_ [[2]](https://discord.com/channels/1315924807128449065/1404938772747128892/1404938772747128892)
  - src: Batteries included instructions for setting up the open source, local equivalent of Claude Code or Gemini CLI.  The server also exposes a chat web app on the LAN if you just want to use it for general…
- ROCm, HIP, and PyTorch compute work on the BC-250 after changing the MEC firmware, BIOS settings, and recompiling software stacks. — hammercoral (re11, 2026-03-15) [[3]](https://discord.com/channels/1315924807128449065/1315933088668454942/1482848457478901851)
  - src: fyi for anyone curious ROCM/HIP/PYTORCH compute all work on these boards with a specific setup. its not a hardware issue at all like everyone claims (maybe for graphics? havnt tested that but compute …
- At 1500 MHz, 24 CUs achieved approximately 230 tok/s at 94-95W, while 40 CUs achieved 371.60 tok/s at 125W. — scallion_9883 (re5, 2026-05-18) [[4]](https://discord.com/channels/1315924807128449065/1315933088668454942/1506023598048022588)
  - src: controlled test: ```results at 1500 MHz / ~880 mV:                         pp512 tok/s    SCLK     Voltage    Power    Temp   24 CU (A):            230.38      1500MHz    881mV      95W      67→79C   …
- The BC250 can run Fedora 44 with Llama-cpp (Vulcan). — icepatfork (re5, 2026-06-04) · _r/LocalLLaMA_ [[5]](https://www.reddit.com/r/LocalLLaMA/comments/1twln7p/quick_numbers_on_a_bc250/)
  - src: Quick numbers on a BC250 Here is what I got on my BC250 with a fresh Llama-cpp (Vulcan) yesterday :  \- Fedora 44   \- Ran stock, then with Cyan governor and overclock (max at 2Ghz) then with overcloc…
- A speed boost for Qwen3 VL 32B from 2350 MHz increases performance from 11.5 t/s to 12.7 t/s. — xseol (re4, 2026-01-29) [[6]](https://discord.com/channels/1315924807128449065/1315933088668454942/1466308604973023436)
  - src: Nice little speed boost for Qwen3 VL 32B from 2350 Mhz. 11.5 t/s to 12.7 t/s
- The BC-250 can be used for local LLMs if not used for gaming. — fudge_u (re4, 2026-05-05) · _r/BC250Gaming_ [[7]](https://www.reddit.com/comments/1t3zqqz/_/ojz0ngj/)
  - src: You have a really nice setup. If I had access to a 3D printer I'd probably just print out everything I need but I don't. I just don't have the space for one in my home, so I have to resort to buying w…
- Optimization for llama.cpp is expected soon. — Міхась (re4, 2025-02-26) [[8]](https://t.me/c/2424231195/16984)
  - src: Скоро оптимизацию подкинут в llama.cpp  https://github.com/ggml-org/llama.cpp/pull/11826
- The BC-250 can run local LLMs like Qwen3.5-35B-A3B or Qwen3.5:9B, as well as speech-to-text and text-to-speech models. — Motoko Kusanagi (re4, 2026-04-10) [[9]](https://t.me/c/2424231195/131726)
  - src: Че расскажу вам ребята. Из-за того, что я захотел домой локальные нейросети для игр передумал продавать бцшку третью. На ютубе можно найти моды на игры для оживления нпс нейросетью. На однос канале бы…
- The BC-250 has 16GB of VRAM, which is suitable for small AI models but limited for large ones. — deathstalkerjr (re3, 2025-11-14) [[10]](https://discord.com/channels/1315924807128449065/1315933088668454942/1438661993283321856)
  - src: These things are pretty good for ai, if they had rocm they would be amazing || Small models maybe, 16gb VRAM is kinda stinky for big models
- Using llama.cpp with HIP (ROCm) on stock clocks yields 709 tok/s for TinyLlama 1.1B pp512 and 115 tok/s for Llama 3.1 8B pp512. — hammercoral (re3, 2026-03-16) [[11]](https://discord.com/channels/1315924807128449065/1315933088668454942/1483073888551440384)
  - src: using llama.cpp for both these were the results  ### TinyLlama 1.1B Q4_K_M | Metric | Vulkan (RADV) | HIP (ROCm) | Speedup | |--------|--------------|------------|---------| | pp512 | 326 tok/s | **70…
- The Gemma4 26b MoE model can be 100% offloaded to the BC-250 GPU. — craiga358888 (re3, 2026-04-23) · _VC(VibeCode)-250_ [[12]](https://discord.com/channels/1315924807128449065/1404938772747128892/1496654193128112138)
  - src: I found this rather comprehensive write-up on Github that benches a bunch of models on the BC-250 and even includes a compatibility list  TLDR: The author settled on the new Gemma4 26b MoE model which…
- For maximum Vulkan compatibility, llama-server should be compiled on the machine itself because shaders are compiled during the build. — twobombs (re3, 2026-02-28) · _Llama-server GPT-OSS 20 LLM on Mesa Vulkan in Ubuntu 26.04_ [[13]](https://discord.com/channels/1315924807128449065/1477230107515945062/1477230107515945062)
  - src: `./llama-vulkan/build/bin/llama-server -hf ggml-org/gpt-oss-20b-GGUF --jinja -c 4096 -ngl 10 --device Vulkan0 --host 0.0.0.0 --port 8033`  For initial tests the GPU memory was set at 4GB vram, so when…
- Loading a gpt-oss 20b LLM model via llama.cpp and running a query can max the GPU/RAM utility LED to green. — fanoush (re3, 2026-02-12) · _r/BC250Gaming_ [[14]](https://www.reddit.com/comments/1r2oqa6/_/o4yfrgx/)
  - src: it is GPU/RAM utility usage somehow done in bios or firmware, the idea is that as a mining rig green means it is mining properly, red = something is wrong. I can max it to green by loading gpt-oss 20b…
- Having 20GB of RAM available would be beneficial for running local models. — Exigefettm (re3, 2026-02-11) · _r/BC250Gaming_ [[15]](https://www.reddit.com/comments/1r0xpcg/_/o4qj9mu/)
  - src: So far I’ve not see the device be limited in total ram… if anything it does a damn better job at total memory allocation for 1080/1440p gaming than many of the popular modern cards (these 8gb cards ar…
- Tweaking the kernel's GTT settings on a cluster of four BC-250 cards can yield around 56GB of VRAM. — ExtremeAdventurous63 (re3, 2026-06-06) · _r/homelab_ [[16]](https://www.reddit.com/r/homelab/comments/1tycge6/my_next_project_a_super_junky_bc250powered/)
  - src: My next project: A "super junky" BC250-powered inference cluster Inspired by a post I saw a few weeks ago, I finally decided to do something a bit crazy: I bought four BC250 cards to build a dedicated…
- LM Studio works out of the box with the qwen2.5 7b 1m model at governor 750/1.3ghz. — dat's nice (re3, 2025-02-26) [[17]](https://t.me/c/2424231195/16887)
  - src: кстати, если кому интересно LM Studio работает из коробки. на видео governor 750/1.3ghz, модель qwen2.5 7b 1m
- A 14B text model yields about 24 tokens per second, but the kernel must be patched for llama.cpp to see more memory. — Nekto (re3, 2025-07-07) [[18]](https://t.me/c/2424231195/57767)
  - src: текстовые нормально, 14B давало ~24 ток/сек, мултимодальные (со зрением например) тоже работают, в целом проблем не заметил, но нужно патчить ядро чтоб больше памяти увидела llama.cpp рокм мне не удал…
- Using the system for LLMs will result in large speed losses because it only has a 1-gigabit port. — Sasha (re3, 2025-12-29) [[19]](https://t.me/c/2424231195/106468)
  - src: Но бесполезно  Для llm будут большие потери в скорости  Всего 1 гигабитный порт
- For neural networks, a gigabit connection is not critical, and dense models can only run layers sequentially while MoE models allow distributing expert layers across different cards. — Stas Zubenko🦄 (re3, 2026-03-18) [[20]](https://t.me/c/2424231195/125233)
  - src: @me_tema тут напишу, чтобы ещё сильнее ветку корпусов не забивать для нейронки гигабит это не настолько критично, все зависит от того как организовать, если модель dense, то да, эффективно можно тольк…
- The board can be used for LLM, Sunshine, or as a LAN station for cooperative gaming. — Stas Zubenko🦄 (re3, 2026-05-15) [[21]](https://t.me/c/2424231195/136622)
  - src: да, как опция и llm или sunshine или как лан станция на кооперативную игру, я много смысла в это не вкладывал, захотелось я и решил попробовать - нигде такого не видел чтобы делали
- The BC-250 is used for gaming and running llama.cpp. — machinezer0 (re2, 2025-02-04) [[22]](https://discord.com/channels/1315924807128449065/1315933088668454942/1336165934813020212)
  - src: This place although lively was also lonely because everyone uses BC-250 for gaming while I was using for llama.cpp. Let me know if you figured out exllamav2 in Vulkan.
- A GPT OSS 20B model fits on one node and runs at 78 tokens per second with a 16k context. — rcboosted (re2, 2025-09-07) [[23]](https://discord.com/channels/1315924807128449065/1315933088668454942/1414076084106039399)
  - src: The gpt oss 20B I tried fits on 1 node and I was getting 78tk/s with 16k context
- A split layer pull request for RPC has been opened in llama.cpp which might offer a speed up. — deathstalkerjr (re2, 2025-09-16) [[24]](https://discord.com/channels/1315924807128449065/1315933088668454942/1417413832170672188)
  - src: As a side note for those llm lovers, someone open up a split layer pr for rpc, we might see an option for a speed up if it goes somewhere https://github.com/ggml-org/llama.cpp/pull/16020
- Page settings increase the amount of RAM available as fallback when the GPU runs over, rather than using standard llama.cpp UMA settings. — deathstalkerjr (re2, 2026-01-09) [[25]](https://discord.com/channels/1315924807128449065/1315933088668454942/1459019189804073003)
  - src: The page settings increase the amount of ram available as fall back when the gpu runs over. Technically we aren't using the standard settings that the llama.cpp uma settings would look for
- Running Ollama on Fedora 41 Server across two blades requires setting export HIP_VISIBLE_DEVICES=-1 on the master blade to route work to the RPC server and prevent crashes. — adaptive__manipulator (re2, 2026-04-19) · _VC(VibeCode)-250_ [[26]](https://discord.com/channels/1315924807128449065/1404938772747128892/1495223934852006079)
  - src: I'd love to! It's been awhile since I set it up, so if you need clarification on something I didn't explain clearly enough, ask and I'll check my notes from when I was setting this up.  Basically, I i…
- Running local AI models or Python programs on a BC-250 with Bazzite OS can cause the system to freeze. — Negative_Quote_5042 (re2, 2026-04-18) · _r/BC250Gaming_ [[27]](https://www.reddit.com/r/BC250Gaming/comments/1soy8ti/freezing_or_crashing/)
  - src: freezing or crashing im using bazzite os and whenever i run local ai model,or any python programms like my pc freeze.but i can play games smoothly like no problem for example batman arkham knight in f…
- The BC-250 can run Whisper and other Vulkan machine learning workloads by netbooting a custom kernel with a 40CU patch. — trucekill (re2, 2026-06-02) · _r/BC250Gaming_ [[28]](https://www.reddit.com/comments/1tusvsg/_/opcmk0n/)
  - src: Also Cachy but mainly using the BC-250 to run Whisper and other vulkan ML workloads. Netbooting a custom kernel with the 40CU patch.
- The BC-250 lacks INT8 support, making XeSS a poor choice for the board. — _I_AM_A_STRANGE_LOOP (re2, 2026-05-28) · _r/BC250Gaming_ [[29]](https://www.reddit.com/comments/1tnsudz/_/oobsawr/)
  - src: Unfair downvote-catch here you’re totally right. It’s a lost cause, not gonna happen with no int8, same reason XeSS is a very bad choice on these boards
- VSCode, the Codex plugin, and the superpowers plugin can be installed locally on the BC-250. — tiga_94 (re2, 2026-05-25) · _r/BC250Gaming_ [[30]](https://www.reddit.com/comments/1tnegf9/_/ontppr3/)
  - src: I installed VSCode, then Codex plugin for VSCode and superpowers plugin for Codex     all locally on BC-250. if you use flatpak version - you will face limitations, but again you can ask codex on how …
- The Qwen 3.6 35B model runs on the BC-250 but requires a small quantization to fit on a single card. — RukkusIsMe (re2, 2026-05-24) · _r/BC250Gaming_ [[31]](https://www.reddit.com/comments/1tm5tv2/_/onklnm8/)
  - src: A few things I’ve observed.  I’m mainly tested with the unsloth dynamic quant qwen models https://unsloth.ai/docs/basics/unsloth-dynamic-2.0-ggufs qwen 3.6 35 a3b is pretty fast on a bc250 but you nee…
- Llama rpc-server can be used to split models over multiple BC-250 cards. — RukkusIsMe (re2, 2026-05-24) · _r/BC250Gaming_ [[32]](https://www.reddit.com/comments/1tm5tv2/_/onkgosq/)
  - src: I’m had good experience with the qwen 3.6 models, I’m currently waiting on a 2nd bc250 to see how it performs with llama rpc-server for splitting models over a few cards.
- The BC-250 can be used to build an AI cluster. — JPAchilles (re2, 2026-04-06) · _r/BC250Gaming_ [[33]](https://www.reddit.com/comments/1sds130/_/oen77pq/)
  - src: So I already thought of this. The plan for this machine is half of it is going to be an AI cluster and the other half is going to be remote gaming machines for me and other people that I know that hav…
- The BC-250 chugs power compared to a Mac mini when running LLMs. — Awkward_Attempt3925 (re2, 2026-04-06) · _r/BC250Gaming_ [[34]](https://www.reddit.com/comments/1scshbe/_/oejfn8w/)
  - src: I feel like there are better LLM solutions. This thing absolutely chugs power compared to something like a Mac mini
- It is better to run models via llama.cpp and easier via ollama. — Sasha (re2, 2026-01-01) [[35]](https://t.me/c/2424231195/107552)
  - src: Привет  Лучше будет через llama.cpp Проще через ollama   В праздники скину , пока не до всего
- PyTorch is not available for the video card, making it easier to download an uncensored model instead. — Игорь ториг (re2, 2026-04-21) [[36]](https://t.me/c/2424231195/133916)
  - src: Нам не подходит, там пайторч нужен, у нас его для видеокарты нет. Легче уже обезцензуреную модель скачать
- The stablediffusion.cpp webui works fine on the BC-250 board. — deathstalkerjr (re1, 2025-11-29) [[37]](https://discord.com/channels/1315924807128449065/1315933088668454942/1444224335006142606)
  - src: Sorry stablediffusion.cpp webui || I mean these work fine with stable diffusion webui
- Generating 512x512 images with z-image turbo takes around 24 seconds. — 34njj4oipnj4ip_25652 (re1, 2026-01-21) · _VC(VibeCode)-250_ [[38]](https://discord.com/channels/1315924807128449065/1404938772747128892/1463516081921720444)
  - src: 512x512 images take around 24 seconds ..
- The 40-CU unlock on the BC-250 performs the same as the default CU count but runs more efficiently due to bandwidth limitations. — dantistnfs (re1, 2026-06-16) · _VC(VibeCode)-250_ [[39]](https://discord.com/channels/1315924807128449065/1404938772747128892/1516561560913580123)
  - src: Same as with default CU, but will run more efficient, as usual, we are bandwidth limited 1. Compile lama.cpp with vulkan support 2. Download some models that you like 3. Run them, that's it || are these still the recommended steps for testing inference on a bc250? What average performance are people seeing post-40-cu-unlock?
- WAN video generation has been added to KoboldCpp. — Игорь ториг (re1, 2025-10-16) [[40]](https://t.me/c/2424231195/82086)
  - src: Новость. В KoboldCpp добавлена генерация видео WAN!!! Теоретически у нас оно должно запуститься. Сегодня вечером буду проверять.
- Changing parameters like LLAMA_ARG_SPLIT_MODE, LLAMA_ARG_FLASH_ATTN, LLAMA_ARG_BATCH, LLAMA_ARG_UBATCH, LLAMA_ARG_CONTEXT_SHIFT, and quantizing the KV cache does not significantly improve multi-node performance. — xseol (re0, 2025-09-07) [[41]](https://discord.com/channels/1315924807128449065/1315933088668454942/1414089096913223730)
  - src: I've tried a lot of different things to improve the performance with multiple nodes, nothing has seemed to work, I've tried `LLAMA_ARG_SPLIT_MODE=row` `LLAMA_ARG_FLASH_ATTN=enabled` `LLAMA_ARG_BATCH=4…
- RPC is not included in official llama.cpp docker containers, requiring a custom container. — xseol (re0, 2025-09-07) [[42]](https://discord.com/channels/1315924807128449065/1315933088668454942/1414089433115791411)
  - src: RPC must just need some work, I don't think it's really a focus for llama.cpp, it's not even included in their docker containers. I had to custom make a container.
- ComfyUI was run on the board in CPU mode using SD 1.5 checkpoints. — barker (re0, 2025-11-29) [[43]](https://discord.com/channels/1315924807128449065/1315933088668454942/1444223630883029012)
  - src: I managed to get comfy ui working but only in --cpu mode and only on sd1.5 checkpoints. If you guys manage to get SDXL running with some magical settings let me know.
- Without a kernel patch or SMU-based governor, active LLM inference runs at 2000 MHz at around 77°C, and runs at 1000 MHz at around 56°C with a model loaded in VRAM. — dantistnfs (re0, 2026-03-19) [[44]](https://discord.com/channels/1315924807128449065/1315933088668454942/1483969983456219158)
  - src: Hahahah, it they didn't even apply kernel patch or smu based governor State     Clock     Temp     Meaning generating     2000 MHz     ~77°C     Active LLM inference loaded     1000 MHz     ~56°C     …
- The BC-250 can run Qwopus 3.5 9B v3 - Q4_k_m. — katostrofik (re0, 2026-04-01) [[45]](https://discord.com/channels/1315924807128449065/1315933088668454942/1488921903136637010)
  - src: AI setups, okay! Here's how the BC-250 does with Qwopus 3.5 9B v3 - Q4_k_m!
- The BC-250 is not very good at LLM tasks and does not scale well with multiple boards. — corbanitevevo (re0, 2026-05-22) [[46]](https://discord.com/channels/1315924807128449065/1315933088668454942/1507160536448630834)
  - src: Fortunately, its not THAT great at it and doesn't scale well with multiple boards im pretty sure || I find it funny when anyone asks about LLM stuff on here it goes completely ignored 98% of the time
- The BC-250 is the cheapest way to run a model that requires 16GB of VRAM. — kilrah (re0, 2026-05-27) [[47]](https://discord.com/channels/1315924807128449065/1315933088668454942/1509249902356725900)
  - src: then it's the cheapest way to run a model that needs 16GB of VRAM
- Llama.cpp supports RPC and Vulkan, and features an OpenAI-compatible API. — xseol (re0, 2026-06-01) [[48]](https://discord.com/channels/1315924807128449065/1315933088668454942/1511064351430410482)
  - src: Either way, no reason to use ollama, llama.cpp is superior in every way. RPC and vulkan support. Plus the API is OpenAI compatible, so it just works with anything that works with chatgpt.
- The BC250 supports Ollama and Vulkan inference up to 35B MoE models. — elektricM (re0, 2026-06-16) · _canonical_ [[49]](https://elektricM.github.io/amd-bc250-docs/)
- The 8GB RAM / 8GB VRAM split (UMA Frame Buffer Size = 8192MB) is recommended for AI/LLM inference. — elektricM (re0, 2026-06-16) · _canonical_ [[50]](https://elektricM.github.io/amd-bc250-docs/bios/vram/)
- Kernel parameters can override VRAM limits to access up to ~14.75GB VRAM for AI inference or compute. — elektricM (re0, 2026-06-16) · _canonical_ [[51]](https://elektricM.github.io/amd-bc250-docs/bios/vram/)
- Limit memory allocation during LLM inference to avoid crashes using llama.cpp --mem 14500. — elektricM (re0, 2026-06-16) · _canonical_ [[52]](https://elektricM.github.io/amd-bc250-docs/bios/vram/)
- Force applications to treat the BC-250 (gfx1013) as gfx1010 (RDNA 1.0) by setting HSA_OVERRIDE_GFX_VERSION=10.1.0. — elektricM (re0, 2026-06-16) · _canonical_ [[53]](https://elektricM.github.io/amd-bc250-docs/drivers/environment/)
- Limit Vulkan memory allocation size for llama.cpp to prevent out-of-memory errors by setting GGML_VK_FORCE_MAX_ALLOCATION_SIZE=2000000000. — elektricM (re0, 2026-06-16) · _canonical_ [[54]](https://elektricM.github.io/amd-bc250-docs/drivers/environment/)
- ROCm support is very limited on BC-250 because rocBLAS is missing gfx1013 binaries (TensileLibrary_lazy_gfx1013.dat), making the Vulkan backend recommended instead. — elektricM (re0, 2026-06-16) · _canonical_ [[55]](https://elektricM.github.io/amd-bc250-docs/drivers/environment/)
- When compiling llama.cpp with ROCm support, use the cmake flags -DAMDGPU_TARGETS=gfx1013 and -DGGML_HIP_UMA=ON to enable Unified Memory Architecture. — elektricM (re0, 2026-06-16) · _canonical_ [[56]](https://elektricM.github.io/amd-bc250-docs/drivers/environment/)
- For ROCm compatibility on BC-250, set the environment variable HSA_OVERRIDE_GFX_VERSION=10.1.0. — elektricM (re0, 2026-06-16) · _canonical_ [[57]](https://elektricM.github.io/amd-bc250-docs/drivers/environment/)
- For llama.cpp LLM inference memory allocation, set the environment variable GGML_VK_FORCE_MAX_ALLOCATION_SIZE=2000000000. — elektricM (re0, 2026-06-16) · _canonical_ [[58]](https://elektricM.github.io/amd-bc250-docs/drivers/environment/)
- ROCm support for the BC-250 GFX1013 architecture is experimental and incomplete, missing pre-compiled rocBLAS kernels. — elektricM (re0, 2026-06-16) · _canonical_ [[59]](https://elektricM.github.io/amd-bc250-docs/drivers/radv/)
- For LLM inference on BC-250, the Vulkan backend is more stable than ROCm. — elektricM (re0, 2026-06-16) · _canonical_ [[60]](https://elektricM.github.io/amd-bc250-docs/drivers/radv/)
- Download the pre-compiled llama.cpp Vulkan binary using: wget https://github.com/ggerganov/llama.cpp/releases/download/b6104/llama-b6104-bin-ubuntu-vulkan-x64.zip — elektricM (re0, 2026-06-16) · _canonical_ [[61]](https://elektricM.github.io/amd-bc250-docs/drivers/radv/)
- Avoid OOM errors in llama.cpp by setting: export GGML_VK_FORCE_MAX_ALLOCATION_SIZE = 2000000000 — elektricM (re0, 2026-06-16) · _canonical_ [[62]](https://elektricM.github.io/amd-bc250-docs/drivers/radv/)
- Run llama.cpp inference using: ./llama-server --model /path/to/model.gguf --gpu-layers 99 — elektricM (re0, 2026-06-16) · _canonical_ [[63]](https://elektricM.github.io/amd-bc250-docs/drivers/radv/)
- A 4-bit quantized 8B model achieves approximately 60 tokens/sec on the BC-250. — elektricM (re0, 2026-06-16) · _canonical_ [[64]](https://elektricM.github.io/amd-bc250-docs/drivers/radv/)
- Disable the GUI to free approximately 800MB of RAM for inference using: sudo systemctl set-default multi-user.target and sudo reboot — elektricM (re0, 2026-06-16) · _canonical_ [[65]](https://elektricM.github.io/amd-bc250-docs/drivers/radv/)
- Restore the GUI using: sudo systemctl set-default graphical.target and sudo reboot — elektricM (re0, 2026-06-16) · _canonical_ [[66]](https://elektricM.github.io/amd-bc250-docs/drivers/radv/)
- Vulkan on the BC-250 sees approximately 10GB of the 12GB VRAM, and large models (70B+) may trigger OOM errors. — elektricM (re0, 2026-06-16) · _canonical_ [[67]](https://elektricM.github.io/amd-bc250-docs/drivers/radv/)
- AI LLM inference via llama.cpp (Vulkan) achieves ~60 tokens/sec for 8B models. — elektricM (re0, 2026-06-16) · _canonical_ [[68]](https://elektricM.github.io/amd-bc250-docs/getting-started/introduction/)
- Stable Diffusion achieves ~1.1 it/s for 512x512 using SD1.5. — elektricM (re0, 2026-06-16) · _canonical_ [[69]](https://elektricM.github.io/amd-bc250-docs/getting-started/introduction/)
- A 10-minute sustained llama-bench run at 40 CU and 2 GHz on a BC-250 with stock heatsink and dual Arctic P12 Max fans resulted in a peak GPU edge temperature of 107°C and peak package power of 223 W. — elektricM (re0, 2026-06-16) · _canonical_ [[70]](https://elektricM.github.io/amd-bc250-docs/hardware/cooling/)
- LLM and compute builds require 24/7 operation and reliability, utilizing dual 120mm fans at full speed with dust filtering. — elektricM (re0, 2026-06-16) · _canonical_ [[71]](https://elektricM.github.io/amd-bc250-docs/hardware/cooling/)
- For LLM or GPU-compute workloads, configure a fixed split of 8GB RAM / 8GB VRAM or 12GB RAM / 4GB VRAM. — elektricM (re0, 2026-06-16) · _canonical_ [[72]](https://elektricM.github.io/amd-bc250-docs/linux/alpine/)
- Expose the GPU to Podman containers for compute uses like LLMs by adding --device /dev/dri --device /dev/kfd to the command line. — elektricM (re0, 2026-06-16) · _canonical_ [[73]](https://elektricM.github.io/amd-bc250-docs/linux/fedora-coreos/)
- In Vulkan llama-bench pp512, unlocking to 40 CUs increases performance from 302 tok/s (at 56 W) to 466 tok/s (at 181 W). — elektricM (re0, 2026-06-16) · _canonical_ [[74]](https://elektricM.github.io/amd-bc250-docs/linux/kernel/)
- At 1500 MHz / 900 mV, the 40 CU unlock achieves 372 tok/s compared to 230 tok/s stock in llama-bench pp512. — elektricM (re0, 2026-06-16) · _canonical_ [[75]](https://elektricM.github.io/amd-bc250-docs/linux/kernel/)
- A fixed VRAM allocation of 8GB/8GB is balanced and good for AI and compute workloads. — elektricM (re0, 2026-06-16) · _canonical_ [[76]](https://elektricM.github.io/amd-bc250-docs/reference/quick-reference/)
- Stock 24 CU at 1500 MHz / 881 mV achieves 230.4 tok/s on Vulkan llama-bench pp512 at 95 W and 79 °C. — elektricM (re0, 2026-06-16) · _canonical_ [[77]](https://elektricM.github.io/amd-bc250-docs/system/40cu-unlock/)
- Unlocked 40 CU at 1500 MHz / 874 mV achieves 371.6 tok/s on Vulkan llama-bench pp512 at 125 W and 83 °C. — elektricM (re0, 2026-06-16) · _canonical_ [[78]](https://elektricM.github.io/amd-bc250-docs/system/40cu-unlock/)
- At 2 GHz, llama-bench pp512 bursts to 466 tok/s but draws ~181 W and reaches 96 °C. — elektricM (re0, 2026-06-16) · _canonical_ [[79]](https://elektricM.github.io/amd-bc250-docs/system/40cu-unlock/)
- Sustained 10-minute llama-bench was tested on Llama-3.2-1B Q4_K_M with 40 CUs at 2 GHz. — elektricM (re0, 2026-06-16) · _canonical_ [[80]](https://elektricM.github.io/amd-bc250-docs/system/40cu-unlock/)
- The akandr/bc250 repository covers Ollama and Vulkan inference, achieving 37.5 tok/s on a 35B MoE model. — elektricM (re0, 2026-06-16) · _canonical_ [[81]](https://elektricM.github.io/amd-bc250-docs/system/40cu-unlock/)
- Wraith Stealth coolers with thermal putty achieve approximately 70°C during mining or LLM workloads at 180W. — elektricM (re0, 2026-06-16) · _canonical_ [[82]](https://elektricM.github.io/amd-bc250-docs/system/sensors/)
- For LLM/AI workloads, add amdgpu.gttsize=14750 ttm.pages_limit=3959290 ttm.page_pool_size=3959290 to the kernel command line to allow up to ~14.75GB VRAM allocation. — elektricM (re0, 2026-06-16) · _canonical_ [[83]](https://elektricM.github.io/amd-bc250-docs/troubleshooting/performance/)
- Use `llama-bench -m model.gguf -ngl 99` to load the GPU for real on a headless BC-250. — elektricM (re0, 2026-06-16) · _canonical_ [[84]](https://elektricM.github.io/amd-bc250-docs/troubleshooting/performance/)
- Running cards at different PCIe generations is popular in the LLM community on bifurcation. — deathstalkerjr (re0, 2025-12-21) · _BC-250 PCIe Speculation_ [[85]](https://discord.com/channels/1315924807128449065/1452152658168381593/1452182002362093609)
  - src: Ya running cards at different gens is popular in the llm community on bifurcation
- ROCm can be installed and Vulkan Stable Diffusion can run on the BC-250. — ellesardragon (re0, 2026-03-20) · _Increased GPU frequency range kernel patch_ [[86]](https://discord.com/channels/1315924807128449065/1398316687165624412/1484640353507344576)
  - src: I run multiple different ones. my main pc(laptop actually) now runs debian, had arch before but the screen driver chip in the screen fried itself(turned out to be standard for those laptops to have th…
- ROCm does not work on the board. — deathstalkerjr (re0, 2025-11-22) · _Proper documentation site for BC250_ [[87]](https://discord.com/channels/1315924807128449065/1441568446872686662/1441581233799823411)
  - src: Rocm doesn't work
- Llama server launches a lightweight chat UI that can be connected to at the BC-250's local IP and port. — deathstalkerjr (re0, 2025-08-29) · _VC(VibeCode)-250_ [[88]](https://discord.com/channels/1315924807128449065/1404938772747128892/1410860772103295046)
  - src: Are you currently on the bc-250 or another computer? Becase llama server, launches a light weight chat ui, that you can connect to at the bc-250s local ip plus port. By hosting on 0.0.0.0 you allow co…
- The Vulkan version of llama.cpp uses the GPU correctly, whereas the standard Ubuntu version offloads to the CPU. — ghost.pr (re0, 2025-08-31) · _VC(VibeCode)-250_ [[89]](https://discord.com/channels/1315924807128449065/1404938772747128892/1411735394474528869)
  - src: uses the GPU correctly the ubuntu version it offloads to CPU || (https://github.com/ggml-org/llama.cpp/releases/download/b6332/llama-b6332-bin-ubuntu-vulkan-x64.zip)
- Llama.cpp version b6332 supports GPU offloading and does not require the -fa flag. — rcboosted (re0, 2025-08-31) · _VC(VibeCode)-250_ [[90]](https://discord.com/channels/1315924807128449065/1404938772747128892/1411791460134551574)
  - src: b6332 is working for me with GPU offloading! I asked it to write a python script to rename .JPG files to .jpg and it did it in 1 min.  prompt eval time =     555.70 ms /    49 tokens (   11.34 ms per …
- Running the deepseek-coder-6.7b-instruct.Q4_K_M.gguf model achieved a speed of 33.88 tokens per second. — rcboosted (re0, 2025-08-31) · _VC(VibeCode)-250_ [[91]](https://discord.com/channels/1315924807128449065/1404938772747128892/1411810811302903820)
  - src: I'm getting 33.88tk/sec for the same query under deepseek gguf! || TheBloke_deepseek-coder-6.7B-instruct-GGUF_deepseek-coder-6.7b-instruct.Q4_K_M.gguf
- Gemma-3-12b-it with the official Google Q4 runs at around 60 tokens per second with 50,000 context. — kingofgames0880 (re0, 2025-09-10) · _VC(VibeCode)-250_ [[92]](https://discord.com/channels/1315924807128449065/1404938772747128892/1415188750899871846)
  - src: Gemma-3-12b-it with the official Google Q4 works around 60/tks with 50000 ctx, I've got it working on a RAG for itself using the new mini 300M embeddinggemma that just came out
- Qwen30BA3b on distributed llama gets around 17 tokens per second for q40. — deathstalkerjr (re0, 2025-09-10) · _VC(VibeCode)-250_ [[93]](https://discord.com/channels/1315924807128449065/1404938772747128892/1415193770152038430)
  - src: btw tested out qwen30BA3b on distributed llama got around 17 tps for q40
- Going to q8 for the cache cuts context memory usage in half. — deathstalkerjr (re0, 2025-09-12) · _VC(VibeCode)-250_ [[94]](https://discord.com/channels/1315924807128449065/1404938772747128892/1415952515102670962)
  - src: The biggest reason to go to q8 for the cache is that it cuts memory usage in half || For context
- Reducing batch and ubatch sizes can speed up performance by reducing GPU idle time while the CPU processes the prompt. — kingofgames0880 (re0, 2025-09-13) · _VC(VibeCode)-250_ [[95]](https://discord.com/channels/1315924807128449065/1404938772747128892/1416334544923132015)
  - src: The smaller batch size might seem counter intuitive but in my tweaking it was directly responsible for an overall speed up, it reduced the "valleys" in GPU activity while the CPU chunks out the prompt…
- Running AI models works on Bazzite with a 512MB split. — kingofgames0880 (re0, 2025-09-26) · _VC(VibeCode)-250_ [[96]](https://discord.com/channels/1315924807128449065/1404938772747128892/1420930799833714700)
  - src: Yeah that's exactly how I'm running mine work just fine || Is there a way to make this work on one running Bazzite with the 512MB split? I would love to use it for gaming while not working and have it as an AI helper for my proyects.  Maybe I could dual boot …
- Fitting an i2v model on one card is limited by the 16GB VRAM capacity. — kingofgames0880 (re0, 2025-09-26) · _VC(VibeCode)-250_ [[97]](https://discord.com/channels/1315924807128449065/1404938772747128892/1421054940746612807)
  - src: I've been messing with it all day trying to cram an i2v model into one card but the 16GB all around isn't leaving it any room, I just found llama-box which serves stablediffusion.cpp with the rpc serv…
- The Vulkan GPU version of llama.cpp is available via the GitHub releases link. — deathstalkerjr (re0, 2025-11-25) · _VC(VibeCode)-250_ [[98]](https://discord.com/channels/1315924807128449065/1404938772747128892/1442649256811954187)
  - src: https://github.com/ggml-org/llama.cpp/releases/download/b7150/llama-b7150-bin-ubuntu-vulkan-x64.zip is the latest one for gpu || Mainly it links to the cpu version of llama
- Adjusting llamacpp to offload all layers to the GPU increases performance to 50 tokens per second without batching. — birdetta (re0, 2025-12-08) · _VC(VibeCode)-250_ [[99]](https://discord.com/channels/1315924807128449065/1404938772747128892/1447634327008710707)
  - src: I did figure out that llamacpp was only offloading some, but not all, layers to the GPU. After adjusting  for this, performance was up to 50tok/sec without batching.
- PyTorch has experimental Vulkan support that can be compiled to run ComfyUI. — kingofgames0880 (re0, 2025-12-08) · _VC(VibeCode)-250_ [[100]](https://discord.com/channels/1315924807128449065/1404938772747128892/1447371402524233799)
  - src: Okay I'm gearing up to try and hack video generation together, I did some digging and it looks like the only viable out of the box way to do it right now with a Vulkan limitation is stablediffusion.cp…
- Gemma 3 12b fits on a single BC-250 board. — deathstalkerjr (re0, 2025-12-09) · _VC(VibeCode)-250_ [[101]](https://discord.com/channels/1315924807128449065/1404938772747128892/1447780136471761101)
  - src: Gemma 3 12b is decent if you mean ones that would fit on this board || Gemma 3 12b || Is what I would go with for a single board
- The error key not found in model gemma3.attention.sliding_window requires a fresh version of llama.cpp. — __nightfox (re0, 2025-12-11) · _VC(VibeCode)-250_ [[102]](https://discord.com/channels/1315924807128449065/1404938772747128892/1448680435117723865)
  - src: > key not found in model: gemma3.attention.sliding_window this model requires a fresh llama.cpp || llama_model_load: error loading model: error loading model hyperparameters: key not found in model: gemma3.attention.sliding_window llama_model_load_from_file_impl: failed to load model common_init_fr…
- To run a model on multiple boards, secondary boards can be set up as RPC servers with the primary llama-server instance pointing to them. — kingofgames0880 (re0, 2025-12-12) · _VC(VibeCode)-250_ [[103]](https://discord.com/channels/1315924807128449065/1404938772747128892/1448827613798989865)
  - src: Yeah so you set all your secondary boards up running as rpc servers then point your primary llama-server instance at them and choose how much to offload to each. || How to run the model on 2 boards instead of just one?
- Z-Image GGUF works through Vulkan on the BC-250 using stablediffusion.cpp or kobold.cpp. — kingofgames0880 (re0, 2025-12-15) · _VC(VibeCode)-250_ [[104]](https://discord.com/channels/1315924807128449065/1404938772747128892/1450042556514697287)
  - src: With stablediffusion.cpp/kobold.cpp yeah || oh ... so z-image gguf works through vulkan on bc250 ? 😮
- The --jinja flag can be used to make llama.cpp load the chat template from the model file. — deathstalkerjr (re0, 2025-12-11) · _VC(VibeCode)-250_ [[105]](https://discord.com/channels/1315924807128449065/1404938772747128892/1448525530180616252)
  - src: -jinja should work || It looks like it's scaffolded like Gemma3 but "--chat-template gemma" just throws nonsense, the chat template is in the huggingface files but I can't figure out how to make llama.cpp use it, anyone ha… || It takes the template from the actual file
- PyTorch with ComfyUI is out because Vulkan support only extends to the torch library itself, not torchvision or torchaudio. — kingofgames0880 (re0, 2025-12-09) · _VC(VibeCode)-250_ [[106]](https://discord.com/channels/1315924807128449065/1404938772747128892/1447761706234286192)
  - src: So PyTorch with ComfyUI is out, the vulkan support only extends to the torch library itself, not torchvision or torchaudio.  Looks like llama-box is ahead of the game on distributed inference with sta…
- Deepseek-OCR runs reliably on the system using Ollama. — teafordani (re0, 2025-12-18) · _VC(VibeCode)-250_ [[107]](https://discord.com/channels/1315924807128449065/1404938772747128892/1451318853576691723)
  - src: allright so I think I'll flash something like debian headerless. For now I tried Deepseek-OCR with ollama and it works solid
- Vulkan-llama.cpp runs successfully in a LocalAI container configured with the same kernel and Mesa driver as the Bazzite host. — .nightcarnage (re0, 2025-12-29) · _VC(VibeCode)-250_ [[108]](https://discord.com/channels/1315924807128449065/1404938772747128892/1454967227966292111)
  - src: I'm pretty close to getting distributed inference working.  I have a working container with localai targeting the same kernel and mesa driver as bazzite host. vulkan-llama.cpp works.   I have a script…
- A deployment guide for BC-250 LocalAI distributed inference is available on GitHub. — .nightcarnage (re0, 2026-01-01) · _VC(VibeCode)-250_ [[109]](https://discord.com/channels/1315924807128449065/1404938772747128892/1456087364991717508)
  - src: https://github.com/nightcarnage/BC-250-LocalAI-Distributed-Inference-Deployment-Guide
- Running Qwen3 VL 30b distributed across two BC-250 boards yields a speed of 6 tokens per second. — .nightcarnage (re0, 2026-01-01) · _VC(VibeCode)-250_ [[110]](https://discord.com/channels/1315924807128449065/1404938772747128892/1456094617375346849)
  - src: I loaded Qwen3 VL 30b over two bc-250s and it performed about as expected. 6 tokens/s  :finefire:
- Running Qwen2.5 8B with a 26k context achieves 30 tokens per second when split over two cards, compared to 70 tokens per second on a single node. — .nightcarnage (re0, 2026-01-01) · _VC(VibeCode)-250_ [[111]](https://discord.com/channels/1315924807128449065/1404938772747128892/1456096445265346642)
  - src: It's actually decent with the test model though!  Qwen2.5 8B split over two cards w/ 26k context does 30 tokens/s.  It does 70 tokens/s on single node though..  It's always a trade-off.  I'm guessing …
- A two-blade tensor split with two 5 GbE NICs achieves a Time to First Token of 1 minute 26 seconds and 12 to 15 tokens per second for the Qwen3-VL-30B model with 16k context. — .nightcarnage (re0, 2026-01-18) · _VC(VibeCode)-250_ [[112]](https://discord.com/channels/1315924807128449065/1404938772747128892/1462263045039329280)
  - src: I currently have two 5 GbE NICs. I’m seeing a Time to First Token (TTFT) of ~~2 minutes 30 seconds~~  **1:26!!!!**   for the Qwen3-VL-30B (~18 GB) +16k context model using a two-blade tensor split. To…
- Using a Ryzen 5 3600 with 128 GB RAM as the LocalAI Master yields better memory mapping and worker coordination than using a BC-250 as the Master. — .nightcarnage (re0, 2026-01-18) · _VC(VibeCode)-250_ [[113]](https://discord.com/channels/1315924807128449065/1404938772747128892/1462263045039329280)
  - src: I currently have two 5 GbE NICs. I’m seeing a Time to First Token (TTFT) of ~~2 minutes 30 seconds~~  **1:26!!!!**   for the Qwen3-VL-30B (~18 GB) +16k context model using a two-blade tensor split. To…
- Stable-diffusion.cpp and Wan2GP can be used to run z-image turbo. — axelgarciak (re0, 2026-01-20) · _VC(VibeCode)-250_ [[114]](https://discord.com/channels/1315924807128449065/1404938772747128892/1463077988336668703)
  - src: An easy way to run z-image turbo is by either using stablediffussion.cpp or wan2gp. <https://github.com/leejet/stable-diffusion.cpp> and <https://github.com/deepbeepmeep/Wan2GP>
- Koboldcpp via the CLI is recommended for headless setups. — deathstalkerjr (re0, 2026-01-20) · _VC(VibeCode)-250_ [[115]](https://discord.com/channels/1315924807128449065/1404938772747128892/1463130563341844540)
  - src: I would try koboldcpp via the cli if you are doing headless
- Z-image turbo works via stablediffusion.cpp but runs slowly due to a slow Vulkan implementation. — __nightfox (re0, 2026-01-20) · _VC(VibeCode)-250_ [[116]](https://discord.com/channels/1315924807128449065/1404938772747128892/1463139206569394207)
  - src: I don't know why you're quoting me. GLM-4.7-Flash is LLM. Z-image turbo will currently only work for you via stablediffusion.cpp, and it will work very slowly (because the implementation of Vulkan in …
- Generating 15 seconds of audio takes around 20 seconds. — 34njj4oipnj4ip_25652 (re0, 2026-01-23) · _VC(VibeCode)-250_ [[117]](https://discord.com/channels/1315924807128449065/1404938772747128892/1464115256786686085)
  - src: its really good with pretrained voices.  the english accent woman sounds very natural and expressive .... also almost real time .  15 secs audio take around 20 seconds to generate ... but voice clonin…
- Cosyvoice3 Alibaba only runs on CUDA and not in GGUF. — 34njj4oipnj4ip_25652 (re0, 2026-01-23) · _VC(VibeCode)-250_ [[118]](https://discord.com/channels/1315924807128449065/1404938772747128892/1464115501407141971)
  - src: best model i tried for zero shot cloning has been cosyvoice3 alibaba .   amazing results with just 20 sec audio .  but it will not run in gguf . only cuda
- The BC250 runs self-hosted LLMs two to three times faster than a Raspberry Pi due to its high memory bandwidth. — dantistnfs (re0, 2026-01-27) · _VC(VibeCode)-250_ [[119]](https://discord.com/channels/1315924807128449065/1404938772747128892/1465780135075774599)
  - src: Clawdbot AI would run on something like raspberry pi 1 or 2 (most people use it with cloud LLMs) But for self-hosted LLMs, BC250 will run it like 2-3 times faster, thanks for stupidly high memory band…
- Prompt processing speed is slow with AMD, but token generation speed is good. — axelgarciak (re0, 2026-01-28) · _VC(VibeCode)-250_ [[120]](https://discord.com/channels/1315924807128449065/1404938772747128892/1466086800463495179)
  - src: prompt processing speed is sad with AMD, but token generation looks quite good || thank you !!!   i can confir, prompt processing speed is a bit sad .. but not eccesively . but gen speed is awesome
- In llama.cpp, prompt processing can be optimized by using flash attention, key-value quantization, limiting context size, and offloading layers to the GPU. — axelgarciak (re0, 2026-01-28) · _VC(VibeCode)-250_ [[121]](https://discord.com/channels/1315924807128449065/1404938772747128892/1466089198091239506)
  - src: If you're using llama.cpp you can use flash attention and optionally key value quantization to see if it helps with prompt processing. Also limit the context to the size you think you need, for exampl…
- Models can be run on the BC-250 using llama.cpp with a Vulkan backend. — 34njj4oipnj4ip_25652 (re0, 2026-01-29) · _VC(VibeCode)-250_ [[122]](https://discord.com/channels/1315924807128449065/1404938772747128892/1466319205375803453)
  - src: in essence what im doing at least is running models with lamacpp + vulkan backend ... if i get stuck i drop a message here and amazingly people give advice and eventually things start to work
- Using a Vulkan backend for LLMs on the BC-250 utilizes all available memory bandwidth and GPU computation. — dantistnfs (re0, 2026-01-29) · _VC(VibeCode)-250_ [[123]](https://discord.com/channels/1315924807128449065/1404938772747128892/1466419505734615147)
  - src: You can use any LLM backend that has CPU or Vulkan computation (preferably to use Vulkan, because it will get you all the memory bandwidth and computation GPU can handle), that's basically it on hardw…
- The MiroThinker-14b model can run on the BC-250 using llama.cpp. — toastboy6035 (re0, 2026-02-08) · _VC(VibeCode)-250_ [[124]](https://discord.com/channels/1315924807128449065/1404938772747128892/1470006680107487232)
  - src: model is MiroThinker-14b, seems to do the job nicely. Are there faster/better models? || I've just got llama.cpp running from the first post on this thread. Didn't bother with crush, just pointed a browser at localhost:8080. This thing is amazing. I just asked it to write "hello world" in…
- The Z turbo model is usable on the BC-250. — 1soundwave12345 (re0, 2026-02-08) · _VC(VibeCode)-250_ [[125]](https://discord.com/channels/1315924807128449065/1404938772747128892/1470060943554904271)
  - src: Is anyone was able to run qwen edit? I was able to run Z turbo it's pretty usable (thx n00bos) , I would like to run qwen edit but all models seems to be too big to run on this awesome rig
- Running pure llama.cpp docker with Vulkan headless on the BC-250 was unsuccessful, but Ollama worked. — kilrah (re0, 2026-04-28) · _VC(VibeCode)-250_ [[126]](https://discord.com/channels/1315924807128449065/1404938772747128892/1498450938959106181)
  - src: i couldn't get pure llama.cpp docker to run with vulkan headless on the BC, but then i didn't spend much time since ollama just worked
- Llama.cpp compiled from source works better and faster than ollama. — teafordani (re0, 2026-04-29) · _VC(VibeCode)-250_ [[127]](https://discord.com/channels/1315924807128449065/1404938772747128892/1498809367624159325)
  - src: and yeah ollama is bs. It's allright if you want to try out AI for the first time, but llama.cpp from source just works better and faster
- Vulkan zips and llama-server work without needing to build llama.cpp. — dr.delahoya (re0, 2026-04-30) · _VC(VibeCode)-250_ [[128]](https://discord.com/channels/1315924807128449065/1404938772747128892/1499260591724822589)
  - src: I don't think you even need to bother with Building llama.cpp. I find that the vulkan zips +llama-server work just fine.
- Two BC250s can run larger models that do not fit on one board by using llama rpc. — deathstalkerjr (re0, 2026-05-22) · _VC(VibeCode)-250_ [[129]](https://discord.com/channels/1315924807128449065/1404938772747128892/1507141583647014972)
  - src: Yes you can run larger models || If i have two BC250s, can i run larger models that wouldn't fit in one of them, or a dual setup is only useful as a way of getting faster inference speeds on models that already fit on one board? || It would be done via llama rpc
- Llama rpc might be slow because it runs over 1 Gbps ethernet. — neoney (re0, 2026-05-22) · _VC(VibeCode)-250_ [[130]](https://discord.com/channels/1315924807128449065/1404938772747128892/1507437118346105013)
  - src: ive heard that llama rpc would be slow cus its only 1 gbps ethernet but dont quote me on that
- Llama.cpp compiled with vulkan flags on a 38 CU unlocked setup can hang during the empty run warmup. — directcurrent (re0, 2026-06-02) · _VC(VibeCode)-250_ [[131]](https://discord.com/channels/1315924807128449065/1404938772747128892/1511375360955256842)
  - src: downloaded and compiled llama.cpp with vulkan flags, got 38 CU unlocked, try to fire it up and it hangs on ` warming up the model with an empty run - please wait ...`  llama-server -m gemma-4-26B-A4B-…
- The --no-warmup option can be used to skip the warm up phase. — deathstalkerjr (re0, 2026-06-02) · _VC(VibeCode)-250_ [[132]](https://discord.com/channels/1315924807128449065/1404938772747128892/1511459100133818498)
  - src: You can try --no-warmup to skip the warm up
- The --no-mmap option can be tried to resolve loading issues. — deathstalkerjr (re0, 2026-06-02) · _VC(VibeCode)-250_ [[133]](https://discord.com/channels/1315924807128449065/1404938772747128892/1511461001470414929)
  - src: Last idea would be to to --no-mmap
- Setting ngl to 0 allows the model to load, running at 5 tps until Vulkan ops compile. — directcurrent (re0, 2026-06-03) · _VC(VibeCode)-250_ [[134]](https://discord.com/channels/1315924807128449065/1404938772747128892/1511792581867208824)
  - src: ok, setting ngl 0 lets it load but the slop repo accurately identifies that llama.cpp has problems running it. it runs at like 5 tps with no vulkan ops || OK, so it literally just needs to sit there and compile the vulkan ops. || it did eventually load
- The Nanbeige 4.1 3b model loads and runs at q8 on the BC-250. — directcurrent (re0, 2026-06-03) · _VC(VibeCode)-250_ [[135]](https://discord.com/channels/1315924807128449065/1404938772747128892/1511785934494896189)
  - src: i'll try it with pool_size 3959290 and see how it goes, but im not sure why it would do this anyway, the nanbeiege 4.1 3b model loads perfectly at q8 and runs with this current set of parameters || Nanbeige 4.1 3b works but id obviously like the new gemma
- Setting GPU_PINNED_MIN_XFER_SIZE=16384 and HSA_ENABLE_SDMA=0 fixes layer loading hanging. — neoney (re0, 2026-06-09) · _VC(VibeCode)-250_ [[136]](https://discord.com/channels/1315924807128449065/1404938772747128892/1513978315768205504)
  - src: that GPU_PINNED_MIN_XFER_SIZE var fixed layer loading hanging || `GPU_PINNED_MIN_XFER_SIZE=16384 HSA_ENABLE_SDMA=0` || okay it might not be necessary at all. just env vars.
- Running Bielik-11B-v3.0-Instruct at a hf4 quant on hipfire achieves 41.9 tokens per second without speculative decode. — neoney (re0, 2026-06-09) · _VC(VibeCode)-250_ [[137]](https://discord.com/channels/1315924807128449065/1404938772747128892/1513972427309449238)
  - src: i got https://huggingface.co/speakleash/Bielik-11B-v3.0-Instruct at a hf4 quant generating 41.9tok/s without speculative decode || well i got hipfire to run
- Running Qwen 3.5 9b mq6 on hipfire achieves 39.8 tokens per second generation. — neoney (re0, 2026-06-09) · _VC(VibeCode)-250_ [[138]](https://discord.com/channels/1315924807128449065/1404938772747128892/1513974667952787747)
  - src: small test of qwen 3.5 9b mq6 shows 39.8tok/s generation || well i got hipfire to run
- Recompiling PyTorch for gfx1013 still results in memory mapping issues when loading models. — pierrebouvier (re0, 2026-06-10) · _VC(VibeCode)-250_ [[139]](https://discord.com/channels/1315924807128449065/1404938772747128892/1514046443915186298)
  - src: I had codex recompile the whole pytorch but I would still get issues loading the model. Some kind of memory mapping issue || so much to do everything just blacklists gfx1013
- Using mmap to load large models can cause loading to fail because the page cache prevents copying to the GPU. — neoney (re0, 2026-06-10) · _VC(VibeCode)-250_ [[140]](https://discord.com/channels/1315924807128449065/1404938772747128892/1514209728505315339)
  - src: I don't think mmap should be used || I had mmap fuck up loading larger models || It maps the file in the page cache, and a copy then goes to the gpu || And if its too big || Then that page cache prevents it from being able to actually copy it to the gpu || Because the memory is taken
- Running LLM models off of Vulkan works perfectly fine. — deathstalkerjr (re0, 2025-12-09) · _Geekbench 6_ [[141]](https://discord.com/channels/1315924807128449065/1447804672604901397/1447807727534477343)
  - src: runnning models off of vulkan works perfectly fine
- Setting the iGPU VRAM to 12GB and layers to 25 achieves 65 tps on gpt-oss20b. — twobombs (re0, 2026-02-28) · _Llama-server GPT-OSS 20 LLM on Mesa Vulkan in Ubuntu 26.04_ [[142]](https://discord.com/channels/1315924807128449065/1477230107515945062/1477238768787390619)
  - src: with 12Gb vRAM for the iGPU and the layers set to 25 it goes to 65 tps on gtp-oss20b
- Using the flags -ctk q8_0 and -ctv q8_0 allows fitting 8k of context into 12GB and 40k of context into 15GB. — __nightfox (re0, 2026-03-01) · _Llama-server GPT-OSS 20 LLM on Mesa Vulkan in Ubuntu 26.04_ [[143]](https://discord.com/channels/1315924807128449065/1477230107515945062/1477708465077096501)
  - src: I could easily fit 8k of context into 12GB with 15GB there are already 40k with q8 context (`-ctk q8_0 -ctv q8_0`)
- When sequentially generating material with multiple models on a single BC-250, the VRAM must be flushed each time to make space for the new model. — 34njj4oipnj4ip_25652 (re0, 2026-01-30) · _BC-250  scripts orchestration for stiched video gen_ [[144]](https://discord.com/channels/1315924807128449065/1466365391138722007/1466883364077175008)
  - src: hopefully they will like each other ...  the major issue is the fact that im trying to keep everything in one BC250 and sequencially generating all the material ... so the VRAM has to be flushed every…
- ROCm is known to not work on AMD BC-250 boards or requires a very specific configuration. — antmagl (re0, 2026-04-25) · _Display Blackout & System Freeze on my AMD BC-250 (Ariel) during ROCm AI Inference (SadTalker)_ [[145]](https://discord.com/channels/1315924807128449065/1497433415098568824/1497499107500101722)
  - src: rocm is known to not work on these boards, or they need a really specific config
- LM-Studio works on the AMD BC-250 when using the Vulkan backend. — antmagl (re0, 2026-04-25) · _Display Blackout & System Freeze on my AMD BC-250 (Ariel) during ROCm AI Inference (SadTalker)_ [[146]](https://discord.com/channels/1315924807128449065/1497433415098568824/1497499387931267102)
  - src: I know that it is not the same thing, but lm-studio + vulkan works for me || use vulkan backend if you can
- The `--rpc` argument is used instead of `--rpc-workers` to offload to worker nodes in llama.cpp. — deathstalkerjr (re0, 2025-09-01) · _llama master/worker set up help_ [[147]](https://discord.com/channels/1315924807128449065/1412172151699800104/1412174228987445310)
  - src: Its just --rpc not rpc-worker || I currently have my BC-250 (Arch linux 6.16.4) set up to running llama b6332 on a single node. I would like to use rpc to offload to worker nodes.  on my worker node I simply ran: ./rpc-server -H 0.0.…
- Adding the `-c` flag to the llama.cpp worker node enables local caching. — deathstalkerjr (re0, 2025-09-01) · _llama master/worker set up help_ [[148]](https://discord.com/channels/1315924807128449065/1412172151699800104/1412174576804171797)
  - src: As a side note, I would suggest adding -c to your worker node as it enables local caching
- To offload to RPC workers in llama.cpp, the devices must be specified using the `--device` argument. — .x41 (re0, 2025-09-02) · _llama master/worker set up help_ [[149]](https://discord.com/channels/1315924807128449065/1412172151699800104/1412198137841320076)
  - src: when i was testing, i had to specify the devices to use as well, for some reason it didn't automatically begin offloading to the RPC workers  ``` ./llama-server -m ../../Llama-3.2-3B-Instruct-IQ3_M.gg…
- Using the pre-built llama.cpp binary with Vulkan support on the BC-250 allows the GPU to scale to 2.23ghz. — rcboosted (re0, 2025-09-02) · _llama master/worker set up help_ [[150]](https://discord.com/channels/1315924807128449065/1412172151699800104/1412200227519336449)
  - src: --rpc does indeed work! and -c switch showed lots of caching on the worker node.  I went back to the pre-built binary with Vulkan support, so it is still offloading to GPU.  (I never needed to build i…
- The `--list-devices` command can be used to check the local device name, such as VULKAN-0, in llama.cpp. — .x41 (re0, 2025-09-02) · _llama master/worker set up help_ [[151]](https://discord.com/channels/1315924807128449065/1412172151699800104/1412209704079196280)
  - src: no, the master was my laptop and i didn't want any compute on that, just on the RPC workers to see how well things were running. you can check what your local device is with `--list-devices`, i think …
- A Qwen3-vl-235b model quantized to IQ2_XS with an imatrix fits onto six BC-250 boards, excluding the mmproj. — xseol (re0, 2025-11-04) [[152]](https://discord.com/channels/1315924807128449065/1315924808688599061/1435272398776700958)
  - src: So i'm using the Huihui abliterated version of qwen3-vl-235b, unfortunately huihui only supplies Q2_K_M, Q3_K_M, and Q4_K_M. Trying out requantizing the Q4_K_M into IQ2_XXS with mradermacher's Qwen3-v…
- ROCm triggers a GPU reset on the BC-250 APU. — github (re0, 2026-06-18) · _issue_ [[153]](https://github.com/mothenjoyer69/bc250-documentation/issues/2)
- Unlocking to 40 CUs increases Qwen3.5-9B Q4_K_XL Vulkan LLM inference performance from 230 tok/s to 372 tok/s at 1500MHz. — github (re0, 2026-06-18) · _canonical_ [[154]](https://github.com/duggasco/bc250-40cu-unlock)
- The BC-250 can be used for neural networks. — King (re0, 2025-01-28) [[155]](https://t.me/c/2424231195/7399)
  - src: https://www.ebay.com/itm/166828062009?_trksid=p2332490.c101196.m2219&itmprp=cksum%3A166828062009339faa73aae848888698850de18c8a44%7Cenc%3AAQAJAAABIB6tSU1IUGaqvILZ3n%252B5EoAGkGRUqjwbNARep5T%252Ftdk9Ecy…
- A GPU with 32 GB of video memory allows running normal neural network models. — Vlad (re0, 2025-03-05) [[156]](https://t.me/c/2424231195/21515)
  - src: на 32 гб видео памяти можно уже нормальную модель запустить, может будет как личный помощник || Прикинь сделать кластер из двух карт для нейронок из 32рам ГПУ и по цене бюджетной видео карты или мини пк?
- The BC-250 has enough performance to run YOLO with a custom model and a local assistant. — Гоша Шмитт (re0, 2025-04-06) [[157]](https://t.me/c/2424231195/33551)
  - src: Мощности хватит чтобы нормально запустить какой-нибудь YOLO с кастомной моделью + какого-нибудь локального ассистента
- The BC-250 is better for neural networks than 4GB systems because it has more memory. — Иннокентий Иванов (re0, 2025-06-14) [[158]](https://t.me/c/2424231195/52495)
  - src: Естественно на бц будет лучше из-за большей памяти просто || 4гига для нейронок это пипец
- The system can run a Minecraft server and neural networks. — Jack Fisher (re0, 2025-09-16) [[159]](https://t.me/c/2424231195/74925)
  - src: Неиронично для отопления балкона. Пока балкон не топился - Майнкрафт сервер + нейронки
- The device can be used as a server with connected AI. — Владислав (re0, 2025-11-12) [[160]](https://t.me/c/2424231195/92414)
  - src: Где-то в группе писали, что поддерживается и даже работает. || Ребят а кто то пробовал этот апарат использоваться как сервак к которому ии подключено и так работает ?
- The system achieved a performance of 71 tokens per second. — Sasha (re0, 2025-12-11) [[161]](https://t.me/c/2424231195/101084)
  - src: 71 токен выдавало || Ти мозги не еби скільки токенів в секунду?
- PyTorch for AMD ROCm does not run on the BC-250. — Игорь ториг (re0, 2025-12-11) [[162]](https://t.me/c/2424231195/101358)
  - src: Не там PyTorch, для amd rocm у нас он не заводится.
- Running the Qwen3.6-35B-A3B-IQ2-M model yields about 55 tokens per second and leaves about 1 GB of free RAM. — John Bercow (re0, 2026-04-24) [[163]](https://t.me/c/2424231195/134321)
  - src: Пробував Qwen3.6-35B-A3B-IQ2-M видає близько 55 т/с займає майже всю памʼять вільного залишається близько 1 gb оперативи. По точності моделі цілком достатньо для вивчення програмування і нетільки
- Using smart context significantly increases prompt processing speed. — Євген (re0, 2026-04-25) [[164]](https://t.me/c/2424231195/134411)
  - src: Так я швидкість написав вище, мені 10ток/сек вистачає, + smart context (сильно збільшує швидкість обробки промтів).
- Large AI models cannot fit into the BC-250, and small models are too simple. — Andrey Po (re0, 2026-05-20) [[165]](https://t.me/c/2424231195/138108)
  - src: ну это похоже на правду. в бцшку большую модель не засунуть, а маленькие совсем тупые
- Llama 8B runs only on the CPU and does not load the GPU, even when using Bazzite or running in a container. — Alex (re0, 2026-06-08) [[166]](https://t.me/c/2424231195/143000)
  - src: Привет! Если можете, помогите, пожалуйста, запустить Llama на 8 миллиардов параметров. Она работает у меня только через процессор (CPU). Сначала у меня стояла Bazzite, потом я её поменял. Пробовал так…
- The rife-ncnn-vulkan repository on GitHub is suggested for use. — pussy eater (re0, 2026-06-15) [[167]](https://t.me/c/2424231195/144611)
  - src: https://github.com/nihui/rife-ncnn-vulkan попробуй

- The Bonsai-27B large language model runs at an average speed of approximately 17 tokens per second on the AMD BC-250. — Unknown (re0, 2026-07-16) [[168]](https://t.me/c/2424231195/149261)
  - src: В среднем 17 токенов в секунду
- Executing Ternary quantized LLM models on AMD BC-250 requires a dedicated custom fork of llama.cpp. — Игорь ториг (re0, 2026-07-16) [[169]](https://t.me/c/2424231195/149277)
  - src: Для ternary нужен их форк llama.cpp
- The QuarkStar C and Vulkan inference engine (https://github.com/Ninnix/q36) is optimized to run Qwen3.6-35B-A3B in unified memory on AMD BC-250, using roughly 10–11 GB of RAM with asymmetric quantization. — Nicoló (@nicolodeva) (re0, 2026-07-22) [[170]](https://t.me/c/2424231195/149867)
  - src: Привет! Не уверен, разрешена ли здесь самореклама, поэтому модераторы могут удалить сообщение, если оно неуместно. Я разработал QuarkStar — open-source движок инференса на C и Vulkan, оптимизированный
- Running QuarkStar LLM inference on AMD BC-250 requires kernel parameters ttm.pages_limit=3959290 and ttm.page_pool_size=3959290, with UMA/VRAM dynamic setting disabled in BIOS. — Nicoló (@nicolodeva) (re0, 2026-07-22) [[171]](https://t.me/c/2424231195/149891)
  - src: What configuration do you have for the ram? did you have set kernel parameters ttm.pages limit=3959290 ttm.page_pool_size=3959290; UMA/VRAM in BIOS is not set to 512 MB dynamic; Try use: Close actual
- In QuarkStar running Qwen3.6-35B-A3B Q2 on BC-250, generation speed delivers 51 tok/s at 2K context, 44.5 tok/s at 6K context, 32 tok/s at 16K context, and 23 tok/s at 32K context. — Pavel (@pacha416) (re0, 2026-07-22) [[172]](https://t.me/c/2424231195/149893)
  - src: 2k ctx 51tks, 4k ctx 46tks, 6k ctx 44.5 tks. All on basic q2 model
- A QuarkStar update achieved decode speedups of +40% at 2k context and +70% at 24k context. — Nicoló (@nicolodeva) (re0, 2026-07-26) [[173]](https://t.me/c/2424231195/150305)
  - src: Hi, I have released a big speedup in decode on QuarkStar. +40% at 2k, +70% at 24k.
- The native LLM agent context window was upgraded to 100k tokens with automatic compaction, leaving approximately 500-600 MB of free RAM on CachyOS. — Nicoló (@nicolodeva) (re0, 2026-07-28) [[174]](https://t.me/c/2424231195/150519)
  - src: I also decreased the use of ram, now native agent context window has been upgraded to 100k, When it reaches them, compact. At 100k I have about 500-600 mb empty on cachy os.
- SSD streaming mode on BC-250 supports running the Qwen3.6-35B-A3B-UD-Q4_K_M.gguf quantized model by Unsloth. — Nicoló (@nicolodeva) (re0, 2026-07-28) [[175]](https://t.me/c/2424231195/150529)
  - src: In ssd streaming it is already compatible with Qwen3.6-35B-A3B-UD-Q4_K_M.gguf by unsloth
- The Qwen3.6-35B-A3B model can be run on AMD BC-250 using SSD streaming through the q36 tool via the --ssd-streaming flag. — Nicoló (@nicolodeva) (re0, 2026-08-05) [[176]](https://t.me/c/2424231195/152791)
  - src: ./download_model.sh q2-q4-imatrix ./q36 -m gguf/Qwen3.6-35B-A3B-Layers34-39Q4KExperts-OtherExpertLayersIQ2XXSGateUp-Q2KDown-Q8Rest-imatrix.gguf \ --ssd-streaming -p "Hello" Se vuoi usare il modello
- Running a 27B LLM quantized to Q3 on the AMD BC-250 achieves approximately 20 tokens per second using the q36-27b branch of Ninnix/q36. — Nicoló (@nicolodeva) (re0, 2026-08-05) [[177]](https://t.me/c/2424231195/152840)
  - src: Лучше 27b q3 mradermacher У меня включено 20 t/s Quarkstar branch https://github.com/Ninnix/q36/tree/q36-27b Это ещё экспериментально, решу, менять ли её, как только выйдет qwen 3.8 27b
- Running 40 unlocked CUs at 2000 MHz with 18 AWG power wiring operates stably for LLM inference on BC-250 without needing 8 CPU cores unlocked. — D K (@cdk_black) (re0, 2026-08-15) [[178]](https://t.me/c/2424231195/155314)
  - src: У меня так сделано, тоже 18awg, полет нормальный. Разлочено 40 CU на 2000мгц. 8 ядер не разблокировал, нет надобности для запуска моделей.
# Citations

[1] https://www.reddit.com/r/LocalLLaMA/comments/1syp3un/hipfire_dev_update_full_amd_arch_validation/
[2] https://discord.com/channels/1315924807128449065/1404938772747128892/1404938772747128892
[3] https://discord.com/channels/1315924807128449065/1315933088668454942/1482848457478901851
[4] https://discord.com/channels/1315924807128449065/1315933088668454942/1506023598048022588
[5] https://www.reddit.com/r/LocalLLaMA/comments/1twln7p/quick_numbers_on_a_bc250/
[6] https://discord.com/channels/1315924807128449065/1315933088668454942/1466308604973023436
[7] https://www.reddit.com/comments/1t3zqqz/_/ojz0ngj/
[8] https://t.me/c/2424231195/16984
[9] https://t.me/c/2424231195/131726
[10] https://discord.com/channels/1315924807128449065/1315933088668454942/1438661993283321856
[11] https://discord.com/channels/1315924807128449065/1315933088668454942/1483073888551440384
[12] https://discord.com/channels/1315924807128449065/1404938772747128892/1496654193128112138
[13] https://discord.com/channels/1315924807128449065/1477230107515945062/1477230107515945062
[14] https://www.reddit.com/comments/1r2oqa6/_/o4yfrgx/
[15] https://www.reddit.com/comments/1r0xpcg/_/o4qj9mu/
[16] https://www.reddit.com/r/homelab/comments/1tycge6/my_next_project_a_super_junky_bc250powered/
[17] https://t.me/c/2424231195/16887
[18] https://t.me/c/2424231195/57767
[19] https://t.me/c/2424231195/106468
[20] https://t.me/c/2424231195/125233
[21] https://t.me/c/2424231195/136622
[22] https://discord.com/channels/1315924807128449065/1315933088668454942/1336165934813020212
[23] https://discord.com/channels/1315924807128449065/1315933088668454942/1414076084106039399
[24] https://discord.com/channels/1315924807128449065/1315933088668454942/1417413832170672188
[25] https://discord.com/channels/1315924807128449065/1315933088668454942/1459019189804073003
[26] https://discord.com/channels/1315924807128449065/1404938772747128892/1495223934852006079
[27] https://www.reddit.com/r/BC250Gaming/comments/1soy8ti/freezing_or_crashing/
[28] https://www.reddit.com/comments/1tusvsg/_/opcmk0n/
[29] https://www.reddit.com/comments/1tnsudz/_/oobsawr/
[30] https://www.reddit.com/comments/1tnegf9/_/ontppr3/
[31] https://www.reddit.com/comments/1tm5tv2/_/onklnm8/
[32] https://www.reddit.com/comments/1tm5tv2/_/onkgosq/
[33] https://www.reddit.com/comments/1sds130/_/oen77pq/
[34] https://www.reddit.com/comments/1scshbe/_/oejfn8w/
[35] https://t.me/c/2424231195/107552
[36] https://t.me/c/2424231195/133916
[37] https://discord.com/channels/1315924807128449065/1315933088668454942/1444224335006142606
[38] https://discord.com/channels/1315924807128449065/1404938772747128892/1463516081921720444
[39] https://discord.com/channels/1315924807128449065/1404938772747128892/1516561560913580123
[40] https://t.me/c/2424231195/82086
[41] https://discord.com/channels/1315924807128449065/1315933088668454942/1414089096913223730
[42] https://discord.com/channels/1315924807128449065/1315933088668454942/1414089433115791411
[43] https://discord.com/channels/1315924807128449065/1315933088668454942/1444223630883029012
[44] https://discord.com/channels/1315924807128449065/1315933088668454942/1483969983456219158
[45] https://discord.com/channels/1315924807128449065/1315933088668454942/1488921903136637010
[46] https://discord.com/channels/1315924807128449065/1315933088668454942/1507160536448630834
[47] https://discord.com/channels/1315924807128449065/1315933088668454942/1509249902356725900
[48] https://discord.com/channels/1315924807128449065/1315933088668454942/1511064351430410482
[49] https://elektricM.github.io/amd-bc250-docs/
[50] https://elektricM.github.io/amd-bc250-docs/bios/vram/
[51] https://elektricM.github.io/amd-bc250-docs/bios/vram/
[52] https://elektricM.github.io/amd-bc250-docs/bios/vram/
[53] https://elektricM.github.io/amd-bc250-docs/drivers/environment/
[54] https://elektricM.github.io/amd-bc250-docs/drivers/environment/
[55] https://elektricM.github.io/amd-bc250-docs/drivers/environment/
[56] https://elektricM.github.io/amd-bc250-docs/drivers/environment/
[57] https://elektricM.github.io/amd-bc250-docs/drivers/environment/
[58] https://elektricM.github.io/amd-bc250-docs/drivers/environment/
[59] https://elektricM.github.io/amd-bc250-docs/drivers/radv/
[60] https://elektricM.github.io/amd-bc250-docs/drivers/radv/
[61] https://elektricM.github.io/amd-bc250-docs/drivers/radv/
[62] https://elektricM.github.io/amd-bc250-docs/drivers/radv/
[63] https://elektricM.github.io/amd-bc250-docs/drivers/radv/
[64] https://elektricM.github.io/amd-bc250-docs/drivers/radv/
[65] https://elektricM.github.io/amd-bc250-docs/drivers/radv/
[66] https://elektricM.github.io/amd-bc250-docs/drivers/radv/
[67] https://elektricM.github.io/amd-bc250-docs/drivers/radv/
[68] https://elektricM.github.io/amd-bc250-docs/getting-started/introduction/
[69] https://elektricM.github.io/amd-bc250-docs/getting-started/introduction/
[70] https://elektricM.github.io/amd-bc250-docs/hardware/cooling/
[71] https://elektricM.github.io/amd-bc250-docs/hardware/cooling/
[72] https://elektricM.github.io/amd-bc250-docs/linux/alpine/
[73] https://elektricM.github.io/amd-bc250-docs/linux/fedora-coreos/
[74] https://elektricM.github.io/amd-bc250-docs/linux/kernel/
[75] https://elektricM.github.io/amd-bc250-docs/linux/kernel/
[76] https://elektricM.github.io/amd-bc250-docs/reference/quick-reference/
[77] https://elektricM.github.io/amd-bc250-docs/system/40cu-unlock/
[78] https://elektricM.github.io/amd-bc250-docs/system/40cu-unlock/
[79] https://elektricM.github.io/amd-bc250-docs/system/40cu-unlock/
[80] https://elektricM.github.io/amd-bc250-docs/system/40cu-unlock/
[81] https://elektricM.github.io/amd-bc250-docs/system/40cu-unlock/
[82] https://elektricM.github.io/amd-bc250-docs/system/sensors/
[83] https://elektricM.github.io/amd-bc250-docs/troubleshooting/performance/
[84] https://elektricM.github.io/amd-bc250-docs/troubleshooting/performance/
[85] https://discord.com/channels/1315924807128449065/1452152658168381593/1452182002362093609
[86] https://discord.com/channels/1315924807128449065/1398316687165624412/1484640353507344576
[87] https://discord.com/channels/1315924807128449065/1441568446872686662/1441581233799823411
[88] https://discord.com/channels/1315924807128449065/1404938772747128892/1410860772103295046
[89] https://discord.com/channels/1315924807128449065/1404938772747128892/1411735394474528869
[90] https://discord.com/channels/1315924807128449065/1404938772747128892/1411791460134551574
[91] https://discord.com/channels/1315924807128449065/1404938772747128892/1411810811302903820
[92] https://discord.com/channels/1315924807128449065/1404938772747128892/1415188750899871846
[93] https://discord.com/channels/1315924807128449065/1404938772747128892/1415193770152038430
[94] https://discord.com/channels/1315924807128449065/1404938772747128892/1415952515102670962
[95] https://discord.com/channels/1315924807128449065/1404938772747128892/1416334544923132015
[96] https://discord.com/channels/1315924807128449065/1404938772747128892/1420930799833714700
[97] https://discord.com/channels/1315924807128449065/1404938772747128892/1421054940746612807
[98] https://discord.com/channels/1315924807128449065/1404938772747128892/1442649256811954187
[99] https://discord.com/channels/1315924807128449065/1404938772747128892/1447634327008710707
[100] https://discord.com/channels/1315924807128449065/1404938772747128892/1447371402524233799
[101] https://discord.com/channels/1315924807128449065/1404938772747128892/1447780136471761101
[102] https://discord.com/channels/1315924807128449065/1404938772747128892/1448680435117723865
[103] https://discord.com/channels/1315924807128449065/1404938772747128892/1448827613798989865
[104] https://discord.com/channels/1315924807128449065/1404938772747128892/1450042556514697287
[105] https://discord.com/channels/1315924807128449065/1404938772747128892/1448525530180616252
[106] https://discord.com/channels/1315924807128449065/1404938772747128892/1447761706234286192
[107] https://discord.com/channels/1315924807128449065/1404938772747128892/1451318853576691723
[108] https://discord.com/channels/1315924807128449065/1404938772747128892/1454967227966292111
[109] https://discord.com/channels/1315924807128449065/1404938772747128892/1456087364991717508
[110] https://discord.com/channels/1315924807128449065/1404938772747128892/1456094617375346849
[111] https://discord.com/channels/1315924807128449065/1404938772747128892/1456096445265346642
[112] https://discord.com/channels/1315924807128449065/1404938772747128892/1462263045039329280
[113] https://discord.com/channels/1315924807128449065/1404938772747128892/1462263045039329280
[114] https://discord.com/channels/1315924807128449065/1404938772747128892/1463077988336668703
[115] https://discord.com/channels/1315924807128449065/1404938772747128892/1463130563341844540
[116] https://discord.com/channels/1315924807128449065/1404938772747128892/1463139206569394207
[117] https://discord.com/channels/1315924807128449065/1404938772747128892/1464115256786686085
[118] https://discord.com/channels/1315924807128449065/1404938772747128892/1464115501407141971
[119] https://discord.com/channels/1315924807128449065/1404938772747128892/1465780135075774599
[120] https://discord.com/channels/1315924807128449065/1404938772747128892/1466086800463495179
[121] https://discord.com/channels/1315924807128449065/1404938772747128892/1466089198091239506
[122] https://discord.com/channels/1315924807128449065/1404938772747128892/1466319205375803453
[123] https://discord.com/channels/1315924807128449065/1404938772747128892/1466419505734615147
[124] https://discord.com/channels/1315924807128449065/1404938772747128892/1470006680107487232
[125] https://discord.com/channels/1315924807128449065/1404938772747128892/1470060943554904271
[126] https://discord.com/channels/1315924807128449065/1404938772747128892/1498450938959106181
[127] https://discord.com/channels/1315924807128449065/1404938772747128892/1498809367624159325
[128] https://discord.com/channels/1315924807128449065/1404938772747128892/1499260591724822589
[129] https://discord.com/channels/1315924807128449065/1404938772747128892/1507141583647014972
[130] https://discord.com/channels/1315924807128449065/1404938772747128892/1507437118346105013
[131] https://discord.com/channels/1315924807128449065/1404938772747128892/1511375360955256842
[132] https://discord.com/channels/1315924807128449065/1404938772747128892/1511459100133818498
[133] https://discord.com/channels/1315924807128449065/1404938772747128892/1511461001470414929
[134] https://discord.com/channels/1315924807128449065/1404938772747128892/1511792581867208824
[135] https://discord.com/channels/1315924807128449065/1404938772747128892/1511785934494896189
[136] https://discord.com/channels/1315924807128449065/1404938772747128892/1513978315768205504
[137] https://discord.com/channels/1315924807128449065/1404938772747128892/1513972427309449238
[138] https://discord.com/channels/1315924807128449065/1404938772747128892/1513974667952787747
[139] https://discord.com/channels/1315924807128449065/1404938772747128892/1514046443915186298
[140] https://discord.com/channels/1315924807128449065/1404938772747128892/1514209728505315339
[141] https://discord.com/channels/1315924807128449065/1447804672604901397/1447807727534477343
[142] https://discord.com/channels/1315924807128449065/1477230107515945062/1477238768787390619
[143] https://discord.com/channels/1315924807128449065/1477230107515945062/1477708465077096501
[144] https://discord.com/channels/1315924807128449065/1466365391138722007/1466883364077175008
[145] https://discord.com/channels/1315924807128449065/1497433415098568824/1497499107500101722
[146] https://discord.com/channels/1315924807128449065/1497433415098568824/1497499387931267102
[147] https://discord.com/channels/1315924807128449065/1412172151699800104/1412174228987445310
[148] https://discord.com/channels/1315924807128449065/1412172151699800104/1412174576804171797
[149] https://discord.com/channels/1315924807128449065/1412172151699800104/1412198137841320076
[150] https://discord.com/channels/1315924807128449065/1412172151699800104/1412200227519336449
[151] https://discord.com/channels/1315924807128449065/1412172151699800104/1412209704079196280
[152] https://discord.com/channels/1315924807128449065/1315924808688599061/1435272398776700958
[153] https://github.com/mothenjoyer69/bc250-documentation/issues/2
[154] https://github.com/duggasco/bc250-40cu-unlock
[155] https://t.me/c/2424231195/7399
[156] https://t.me/c/2424231195/21515
[157] https://t.me/c/2424231195/33551
[158] https://t.me/c/2424231195/52495
[159] https://t.me/c/2424231195/74925
[160] https://t.me/c/2424231195/92414
[161] https://t.me/c/2424231195/101084
[162] https://t.me/c/2424231195/101358
[163] https://t.me/c/2424231195/134321
[164] https://t.me/c/2424231195/134411
[165] https://t.me/c/2424231195/138108
[166] https://t.me/c/2424231195/143000
[167] https://t.me/c/2424231195/144611
[168] https://t.me/c/2424231195/149261
[169] https://t.me/c/2424231195/149277
[170] https://t.me/c/2424231195/149867
[171] https://t.me/c/2424231195/149891
[172] https://t.me/c/2424231195/149893
[173] https://t.me/c/2424231195/150305
[174] https://t.me/c/2424231195/150519
[175] https://t.me/c/2424231195/150529
[176] https://t.me/c/2424231195/152791
[177] https://t.me/c/2424231195/152840
[178] https://t.me/c/2424231195/155314
