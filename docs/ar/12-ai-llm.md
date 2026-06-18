> 🌐 ترجمة مجتمعية. النسخة الإنجليزية هي المرجع الأساسي وقد تكون أحدث. وجدت خطأ؟ افتح issue: [English](../en/12-ai-llm.md) · https://github.com/lildebil0/awesome-bc250/issues

# الذكاء الاصطناعي / LLM على BC-250

> **باختصار** — ما يجذب الناس إلى BC-250 للذكاء الاصطناعي هو **ذاكرتها 16 GB من GDDR6** بسعر بخس. الطريقة الواقعية لاستخدامها هي **llama.cpp / Ollama على واجهة Vulkan (RADV) الخلفية** — *لا* ROCm. شريحة GPU هي **gfx1013 (Cyan Skillfish)**، التي لا تستهدفها أي نسخة ROCm رسميًّا، فيكون ROCm نفقًا عميقًا يتجنّبه معظم الناس. على Vulkan، مع نموذج MoE يتّسع داخل VRAM، يرى المجتمع نحو **30–40 tok/s** (مثل gpt-oss-20b وQwen3.5-35B-A3B وGemma-4-26B-A3B). المعضلة هي **الذاكرة**: الـ 16 GB مشتركة بين المعالج وGPU، فالنماذج الكبيرة تعيش على الحافة تمامًا، وOOM هو سبب الإخفاق رقم 1. اضبط VRAM في BIOS، وارفع حد صفحات TTM في النواة، وشغّل نماذج **MoE** — تلك هي اللعبة كلها.

إن BC-250 *صندوق استدلال اقتصادي* جيد و*صندوق تدريب* رديء. عاملها على أنها "بطاقة 16 GB تشغّل نماذج مكمَّمة عبر Vulkan"، وستقضي وقتًا طيبًا.

---

## لماذا Vulkan، لا ROCm

شريحة GPU هي **Cyan Skillfish = `gfx1013`** (قطعة من فئة RDNA-1.x، شقيقة Navi 10/`gfx1010`). هذه الحقيقة الواحدة تحسم كل شيء:

- **ROCm لا يشحن دعمًا لـ `gfx1013`.** تستهدف منظومة ROCm من AMD قائمة سماح محدّدة من معرّفات GPU، وCyan Skillfish ليست عليها. فالمسار الرسمي `ROCm/ROCm` ببساطة لا يرى البطاقة. وعلى وجه الدقة: `gfx1013` *مدرَجة* في LLVM على أنها قادرة على `rocm-amdhsa`، لكن **فضاء مستخدم ROCm من AMD (rocBLAS/Tensile) لا يشحن أي مكتبات رياضيات (حلول) لـ `gfx1013`** — فبمجرد أن يصل GEMM إلى rocBLAS تحصل على `rocblas_abort()` ("GFX1013 not in GPU list"). لا توجد نواة رياضيات لاستدعائها ([akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)).
- **وحتى مع تجاوز ذلك، لا يملك ROCm أي ذاكرة مخبّأة قابلة للاستخدام للمظلِّلات (shaders) على هذه الـ APU — فهو يعيد التصريف عند كل إطلاق**، بينما **تخزّن واجهة Vulkan الخلفية المظلِّلات المصرَّفة على القرص**. هذا وحده يجعل Vulkan مسار الحوسبة العملي: ينتهي اختبار akandr إلى أن Vulkan كان مسار الحوسبة على GPU الوحيد القابل للاستخدام الذي وُجد على هذه اللوحة ([akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm)). (لاحظ أن هذه فجوة في *التعريف/المكتبة*، **لا** ميزة عتاد مفقودة — فمجموعة تعليمات `gfx103x` في RDNA2 تتضمّن INT8 dp4a، مثل `v_dot4c_i32_i8`؛ المشكلة محض أن ROCm لا يشحن شيئًا لهذا المعرّف.)
- مستودعات "افتح ROCm على البطاقات القديمة" المعروفة **لا تغطّيها هي أيضًا**:
  - [`woodrex83/ROCm-For-RX580`](https://github.com/woodrex83/ROCm-For-RX580) خاص بـ **`gfx803` فقط** (Polaris: RX 580/570/480). معمارية خاطئة تمامًا — غير قابل للاستخدام هنا.
  - [`ulyssesrr/docker-rocm-xtra`](https://github.com/ulyssesrr/docker-rocm-xtra) يضيف أهدافًا إضافية (`gfx803`، `gfx900/906/908`، `gfx1010/1011/1012`، `gfx1030…`) — لكن **`gfx1013` ليست في القائمة**، والمستودع **أُرشِف في 2025-08-12**. يمكنك *أن تجرّب* التنكّر بهيئة `gfx1010` (Navi 10) عبر `HSA_OVERRIDE_GFX_VERSION=10.1.0`، بنفس الطريقة التي يربط بها الناس برنامج Navi 10 الثابت رمزيًّا لإقلاع تعريف العرض (`navi10_gpu_info.bin → cyan_skillfish_gpu_info.bin`، [src](https://t.me/c/2424231195/7458/136321))، لكن هذا غير مُتحقَّق منه للحوسبة على BC-250، ولا أحد في المحادثة يبلّغ عن منظومة ROCm LLM عاملة.  ⚠ تحقّق

المستودعات الأخرى التي يتداولها الناس — [`xuhuisheng/rocm-build` (navi10)](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) و[`robertrosenbusch/gfx803_rocm`](https://github.com/robertrosenbusch/gfx803_rocm) — هي لبطاقات Navi 10 المنفصلة ولـ Polaris على التوالي، لا لـ Cyan Skillfish. إنها خلفية مفيدة، لا وصفة لهذه اللوحة.

**الخلاصة (حتى منتصف 2026):** ROCm على BC-250 هو اختراق غير محلول/غير مُجدٍ اقتصاديًّا. كل إعداد عامل شاركه المجتمع يعمل على **Vulkan عبر Mesa RADV**، وهو ما تمنحه إيّاك منظومة تعريفات BC-250 أصلًا من أجل الألعاب. إن نجح أحدهم في تشغيل ROCm، فسيكون ذلك بانتحال `gfx1010` داخل حاوية مرقَّعة — توقّع أن تخسر عطلة نهاية أسبوع، دون أي ضمان.

> **تحديث — تمكن شخص ما من تشغيل HIP/ROCm (Discord، منتصف 2026).** بعد صدور حكم "لا أحد يبلغ عن تشغيل الحزمة البرمجية" أعلاه، أبلغ أحد الأعضاء عن **تشغيل عمليات الحوسبة لـ ROCm و HIP و PyTorch** على BC-250 بعد **تعديل البرنامج الثابت لـ MEC**، وتغيير إعدادات BIOS، وإعادة تجميع الحزمة البرمجية ([المصدر](https://discord.com/channels/1315924807128449065/1315933088668454942/1482848457478901851)). وفي هذا المسار، حققت **نسخة `llama.cpp` المبنية مع HIP** سرعة **709 tok/s على TinyLlama-1.1B (pp512)** و **115 tok/s على Llama-3.1-8B (pp512)** بالترددات الافتراضية ([المصدر](https://discord.com/channels/1315924807128449065/1315933088668454942/1483073888551440384))، كما تحسنت سرعة الـ prefill مع فتح وحدات الحوسبة (CU) — **~230 tok/s عند 24 CU (94–95 W) مقابل 371.6 tok/s عند 40 CU (125 W)، كلاهما بتردد 1500 MHz** ([المصدر](https://discord.com/channels/1315924807128449065/1315933088668454942/1506023598048022588)). هذا مسار تجريبي عميق على مستوى البرامج الثابتة — وليس الطريق الموصى به — ولكنه يوضح أن حكم "ROCm مستحيل" لم يعد مطلقًا. ⚠ متقدم.

---

## ميزة الـ 16 GB من VRAM (ومعضلتها)

الـ 16 GB تكفي لاحتواء نموذج بحجم 20–35B عندما يكون **مكمَّمًا** (Q3–Q4) — وهي ذاكرة VRAM كانت ستكلّفك لولا ذلك بطاقة 4060 Ti 16 GB أو 3090 مستعملة. ذلك هو السبب الكامل في كون اللوحة مثيرة للاهتمام لنماذج LLM.

المعضلة: **الـ 16 GB مشتركة بين المعالج وGPU.** لا يوجد مجمَّع ذاكرة نظام منفصل يُرجع إليه. لذا:

- النموذج + KV-cache + نظام التشغيل + كل عملية تعمل في الخلفية، كلها تتّسع في *نفس* الـ 16 GB.
- ادفع النموذج إلى حجم أكبر من اللازم فلا تحصل على "بطء" — بل تحصل على **OOM** صريح، وعلى بعض التوزيعات ينهار KDE ويسقطك إلى الطرفية ([src](https://t.me/c/2424231195/101077)).
- حُكم أحد المساهمين المنتظمين بعد شهور من الاختبار: *"الأداء يكفي للكثير؛ الذاكرة هي ما لا يكفي."* ([src](https://t.me/c/2424231195/101077))

ذراعان يشتريان لك متّسعًا:

1. **اضبط VRAM في BIOS.** التشغيل بـ `vram = 12` (GB) خط أساس معروف الجودة يترك ذاكرة RAM للنظام ([src](https://t.me/c/2424231195/101077)). حصص VRAM الأعلى تتيح تحميل نماذج أكبر لكنها تجوّع نظام التشغيل.
2. **ارفع حد صفحات TTM في النواة** كي يسلّم مدير ذاكرة GPU فعلًا التخصيصات الكبيرة التي يحتاجها نموذج 14B+ (راجع الإعداد أدناه). هذا هو التغيير الوحيد الذي يفتح النماذج الأكبر على Vulkan.

حيلة مجتمعية لاستعادة 1–2 GB: شغّل **نظام تشغيل خادم بلا واجهة رسومية (headless)** وتحدّث إليه عبر الشبكة (مثل Open WebUI / واجهة برمجية)، فلا يكون هناك سطح مكتب يلتهم VRAM ([src](https://t.me/c/2424231195/101077)).

---

## شغّل نماذج MoE، لا الكثيفة

هذا أهمّ خيار نمذجة على صندوق ذاكرة مشتركة سعة 16 GB، والمحادثة صريحة في بيان السبب ([src](https://t.me/c/2424231195/125233)):

- بالنسبة لنموذج **كثيف (dense)** لا يمكنك تقسيمه إلا *تسلسليًّا* طبقةً طبقة؛ حِيَل التوازي التنسوري لا تساعد، فتكون مقيَّدًا بما يتّسع وبعرض النطاق الخام.
- بالنسبة لنموذج **MoE** تُبقي الجزء الكثيف/الانتباه على البطاقة وتفعّل فقط بضعة خبراء صغار لكل رمز. والنتيجة: **نموذج أكبر بكثير يتّسع بجودة لا بأس بها، وتحصل على مضاعِف للإنتاجية** لأن جزءًا يسيرًا فقط من الأوزان يُلمَس لكل رمز.

ولهذا بالضبط فإن النماذج التي يشغّلها الناس فعلًا على BC-250 هي MoE بعدد صغير من المعاملات النشطة: **gpt-oss-20b** (مفضّلة المحادثة)، **Qwen3.5-35B-A3B** (35B إجمالًا / ~3B نشطة)، **Gemma-4-26B-A3B**. إنها تتفوّق بكثير على ما يستطيعه نموذج كثيف بنفس بصمة VRAM.

> رؤية ذات صلة لإعدادات متعدّدة البطاقات: بالنسبة لـ MoE يمكنك تقسيم **أعمدة الخبراء** عبر اللوحات وكسب عرض نطاق إجمالي، بينما تكون الحالة المخفية لنموذج كثيف ضئيلة جدًّا (~1 MB حتى لـ 70B) فلا يكون رابط بسرعة gigabit بين العقد هو عنق الزجاجة ([src](https://t.me/c/2424231195/125233)). بالنسبة لـ BC-250 وحيدة هذا غير ذي صلة، لكنه يفسّر لماذا يسلسلها الناس.

---

## الإعداد A — Ollama + Vulkan (موصى به، قابل للتكرار)

أكمل وصفة BC-250 وأقبلها للتكرار هي دليل المجتمع [`akandr/bc250` → *إعداد Ollama + Vulkan*](https://github.com/akandr/bc250#3-ollama--vulkan-setup) (يُشار إليه مرارًا في المحادثة). يفترض منظومة رسوميات BC-250 عاملة (راجع [06-linux.md](06-linux.md)) — Fedora مع Mesa/RADV حديثة — ثم يضيف Ollama فوقها. منقول من ذلك المستودع:

**1. ثبّت Ollama:**
```bash
curl -fsSL https://ollama.com/install.sh | sh
```

**2. فعّل واجهة Vulkan الخلفية + خيارات آمنة للذاكرة** عبر تجاوز systemd (`/etc/systemd/system/ollama.service.d/override.conf`):
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
ثم:
```bash
sudo systemctl daemon-reload && sudo systemctl restart ollama
```
يقلّص `OLLAMA_FLASH_ATTENTION=1` و`OLLAMA_KV_CACHE_TYPE=q4_0` من الـ KV-cache كي يتّسع سياق طويل؛ ويمنع `OOMScoreAdjust=-1000` النواة من قتل Ollama أولًا تحت ضغط الذاكرة.

**3. إصلاح الذاكرة الأساسي — ارفع حد صفحات TTM** (هذا ما يتيح تحميل نماذج 14B+ / كبيرة السياق أصلًا):
```bash
echo 4194304 | sudo tee /sys/module/ttm/parameters/pages_limit
echo 4194304 | sudo tee /sys/module/ttm/parameters/page_pool_size
```
اجعله يصمد عبر إعادات التشغيل:
```bash
echo "options ttm pages_limit=4194304 page_pool_size=4194304" | \
  sudo tee /etc/modprobe.d/ttm-gpu-memory.conf
```

**4. اسحب نموذج MoE وشغّله**، مثلًا:
```bash
ollama run gpt-oss:20b
```

> جرى التحقق من دليل `akandr/bc250` على **Fedora 43 / kernel 6.18.9 / Mesa 25.3.4 RADV / Ollama 0.20.0**. إصدارات الحزم الدقيقة ستتغيّر — أبقِ متغيّرات البيئة وإصلاح TTM؛ وحدّث الباقي. ⚠ تحقّق من الإصدارات مقابل المستودع قبل النسخ.

**أضِف منظِّم Oberon.** يُبلَّغ أن تشغيل [`mothenjoyer69/oberon-governor`](https://gitlab.com/mothenjoyer69/oberon-governor) (نفس المنظِّم المستخدم للألعاب، راجع [09-overclock-undervolt.md](09-overclock-undervolt.md)) يضيف **+10–20 tok/s على gpt-oss-20b** بإبقاء ترددات أعلى ([src](https://t.me/c/2424231195/101077)). إنه أرخص تسريع متاح.

---

## الإعداد B — llama.cpp (Vulkan)، مبنيًّا أو معبَّأً

إن أردت `llama.cpp` خامًا (تحكّم أكثر، GGUF من أي مكان، الواجهة البرمجية المتوافقة مع OpenAI لـ `llama-server`):

**Arch / paru (الأمر الوحيد المُتحقَّق منه في المحادثة):**
```bash
paru -S aur/llama.cpp-vulkan
```
([src](https://t.me/c/2424231195/101026) — أمر البناء الوحيد في مدوّنة محادثة هذا القسم؛ جرى التحقّق المتقاطع مقابل اسم الحزمة.)

**ابنِ من المصدر** (وفق [وثائق بناء `ggml-org/llama.cpp`](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md)) — Debian/Ubuntu:
```bash
sudo apt-get install libvulkan-dev glslc spirv-headers
cmake -B build -DGGML_VULKAN=1
cmake --build build --config Release
```
(على Fedora تكون حزمة ترويسات SPIR-V هي `spirv-headers-devel`.) ثم شغّل بكل الطبقات على GPU:
```bash
./build/bin/llama-cli -m PATH_TO_MODEL.gguf -ngl 99 -p "Hi, how are you?"
```
يفرّغ `-ngl 99` كل طبقة إلى جهاز Vulkan. استخدم `--list-devices` لتأكيد أن BC-250 هي الجهاز الذي اختاره llama.cpp، و`--device` لفرضه إن كان لديك أكثر من واحد. الثنائيات المبنية مسبقًا موجودة على [صفحة إصدارات llama.cpp](https://github.com/ggml-org/llama.cpp/releases).

> **لا تبنِ واجهة HIP/ROCm الخلفية** (`-DGGML_HIP=ON -DGPU_TARGETS=gfx1013`). لا يوجد وقت تشغيل ROCm لـ `gfx1013`، فلن يعمل حتى لو صُرِّف. Vulkan هو المسار المدعوم هنا. ([وثيقة البناء](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md))

**الواجهات الأمامية التي يستخدمها الناس فعلًا:**
- **[Jan AI](https://jan.ai/)** — السائق اليومي الحالي للمحادثة: منتقي نماذج كبير، إعدادات سياق/أدوات، يستطيع منح النموذج وصولًا إلى الويب + قراءة صور/مستندات، ودعم MCP. يشغّل النموذج عبر Vulkan تحته ([src](https://t.me/c/2424231195/101077)).
- **[KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)** — غلاف llama.cpp بثنائي واحد مع Vulkan، مفيد للنشر بملف واحد.
- **Open WebUI** — اقرنه بصندوق بلا واجهة رسومية لتشغيله من جهاز آخر (يوفّر VRAM سطح المكتب).

---

## توقعات tok/s الواقعية

الأرقام أدناه **مُبلَّغ عنها من المجتمع على Vulkan**، لنماذج MoE محجَّمة لتتّسع في 16 GB. عاملها كرتبة قدر، لا كمجموعة معايير قياس — فهي تأتي من دليل `akandr/bc250` والمحادثة، على لوحة واحدة مع إصلاح TTM + flash-attention + KV-cache بنوع `q4_0`.

| النموذج | التكميم | المعاملات النشطة / الإجمالية | سرعة التوليد المُبلَّغة |
|---|---|---|---|
| Qwen3.5-9B | Q4_K_M | كثيف 9B | ~32 tok/s |
| Gemma-4-26B-A3B (MoE) | UD-Q3_K_M | ~3B / 26B | ~39 tok/s |
| Qwen3.5-35B-A3B (MoE) | UD-IQ2_M | ~3B / 35B | ~38 tok/s |
| gpt-oss-20b (MoE, MXFP4) | MXFP4 | ~3.6B / 20B | مفضّلة المجتمع؛ +10–20 tok/s مع منظِّم Oberon |

المصادر: السرعات من [`akandr/bc250`](https://github.com/akandr/bc250#3-ollama--vulkan-setup)؛ استخدام gpt-oss-20b وزيادة المنظِّم ([src](https://t.me/c/2424231195/101077)). تأتي ملفات GGUF للنماذج من Hugging Face — مثل [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF) و[unsloth Qwen3.6-35B-A3B](https://huggingface.co/unsloth/Qwen3.6-35B-A3B-GGUF) و[Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M).

**قراءة صادقة:** ~30–40 tok/s على نموذج MoE بحجم 20–35B قابلة للاستخدام فعلًا للمحادثة والمساعدة في البرمجة وحلقات الوكيل/الأدوات. إنها **ليست** 4090. الجودة مقيَّدة بالتكميم العدواني الذي تفرضه الـ 16 GB (IQ2/Q3 على نماذج الـ 35B) — وأشار أحد المستخدمين إلى أن دفع نموذج 30B بتكميم أقسى "سيرتكب على الأرجح كثيرًا من الأخطاء" ([src](https://t.me/c/2424231195/101077)). النقطة المثلى هي **gpt-oss-20b**، الموصوفة مرارًا بأنها "أذكى من كل الصغار" مع بقائها مستقرة ([src](https://t.me/c/2424231195/101077)).

### هل يسرّع فتح الـ 40-CU نماذج LLM؟ نعم — قِيس مباشرةً على نموذج كثيف

فتح الـ 40-CU (راجع [09-overclock-undervolt.md](09-overclock-undervolt.md)) يساعد الاستدلال أكثر مما يساعد الألعاب، لأن توليد الرموز يستخدم وحدات الحوسبة فعلًا. قاسه فيديو **مباشرةً** أثناء تبديل وحدات الحوسبة على نموذج **كثيف** — Qwen3.5-9B (~10 GB من GDDR6) على **Ollama + Vulkan** — وتتبّعت الإنتاجية عدد وحدات الحوسبة بصورة شبه خطّية ([Old Lamer — فيديو فتح CU بالروسية](https://youtu.be/M7PsojWr4KA)، ~8:30–12:03): *(⚠ ترجمة آلية تلقائية — عامل الكسور على أنها ≈.)*

| وحدات الحوسبة النشطة | سرعة التوليد | مقابل 24 CU |
|---|---|---|
| 24 CU (قياسي) | ≈25.7 tok/s | خط الأساس |
| خطوة الفتح | ≈31.9 tok/s | **~+16–17 %** |
| 36 CU | ≈33.4 tok/s | **~+20 % إجمالًا** |

تلك اللوحة **بلغت حدّها الأقصى عند 36 CU** — فآخر وحدتي حوسبة كانتا معطوبتين فعلًا و**انهار llama عند التحميل** عند تفعيلهما، مثال ملموس على نقطة "الـ 38/40 يانصيب" من فصل كسر السرعة. طابقت بيئة Ollama الوصفة أعلاه (`OLLAMA_VULKAN=1`، KV-cache `q4_0`، سياق 65536، `ttm.pages_limit=4194304`). ولأنه نموذج *كثيف*، فالمكسب هو تحجيم وحدات الحوسبة الصافي — بلا مضاعِف توجيه خبراء MoE فوقه ([Old Lamer — فيديو فتح CU بالروسية](https://youtu.be/M7PsojWr4KA)).

أجرى دليل `akandr/bc250` مقارنة A/B أوفى على نماذج **MoE** عبر فتح الـ 40-CU (رقعة الفتح نفسها تعيش في [`duggasco/bc250-40cu-unlock`](https://github.com/duggasco/bc250-40cu-unlock)، لا akandr؛ يضيف akandr فحص سلامة FP32 مستقلًّا + إعادة تشغيل للإنتاجية). فارقان رئيسيان في التوليد، كلاهما **عبر llama.cpp** ([akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results)):

| النموذج | التكميم | التوليد @ 24 CU | التوليد @ 40 CU | Δ |
|---|---|---|---|---|
| gpt-oss-20b (MoE) | MXFP4 | 66.1 tok/s | 87.5 tok/s | **+32 %** |
| Qwen3.5-35B-A3B (MoE) | — | 59.5 tok/s | 78.7 tok/s | **+32 %** |

عبر 11 نموذجًا كان الوسيط **+32 % توليد / +50 % تعبئة مسبقة (prefill)** من الفتح. شيئان يستحقان الاستخلاص من ذلك الجدول: **gpt-oss-20b تعمل بأريحية (66 → 87 tok/s)**، ما يؤكّد مفضّلة المحادثة، وقاس akandr نماذج MoE **أسرع جوهريًّا عبر `llama.cpp` مباشرةً منها عبر Ollama** (مسار توزيع الخبراء في Ollama أقل كفاءة لهذه المعمارية — مثلًا كانت Qwen3.5-35B-A3B بسرعة 25.1 tok/s على Ollama مقابل 59.5 tok/s على llama.cpp عند الترددات القياسية) ([akandr/bc250 §4](https://github.com/akandr/bc250#4-benchmarks)).

> 💬 **نقاط بيانات MoE غير مُتحقَّق منها (تعليقات Hackaday — عاملها كنقل سماعي).** من تعليقات قرّاء لا من تشغيل مُعاد إنتاجه: Qwen "27b" مع **MTP** (تنبؤ متعدّد الرموز) عند **≈14.5 tok/s**، و"35b" مع MTP عند **≈47 tok/s**. الانتشار الواسع هو بالضبط ما قد ينتجه MTP + فروق المعاملات النشطة في MoE، لكن لا أحد من الرقمين مؤكَّد مستقلًّا هنا — مُشار إليه للسياق، لا كمعيار قياس. ⚠ تحقّق

---

## ما هو مؤلم (لنكن صادقين)

- **OOM هو نمط الإخفاق الافتراضي.** نموذج كبير في ذاكرة مشتركة سعة 16 GB = عيش على الحافة. توقّع انهيارات؛ على KDE قد يموت سطح المكتب ويترك طرفيةً فقط ([src](https://t.me/c/2424231195/101077)). خفّف الأمر بحصّة VRAM في BIOS، وإصلاح TTM، وKV-cache بنوع `q4_0`، وflash attention، وإعداد بلا واجهة رسومية.
- **استقرار التوزيعة يتفاوت.** وجدت المحادثة أن **Ubuntu أكثر استقرارًا من Fedora** في عدم الانهيار تحت ضغط الذاكرة على Vulkan، رغم أن Fedora هي خط الأساس الموثَّق ([src](https://t.me/c/2424231195/101077)). إن استمرّت توزيعةٌ بالانهيار من OOM، فجرّب الأخرى.
- **ROCm خارج الطاولة فعليًّا** (راجع القسم العلوي). لا تحرق أيامًا في مطاردة تدريب PyTorch/vLLM على هذه البطاقة — [مسار AMD في vLLM](https://docs.vllm.ai/en/latest/getting_started/installation/gpu/#amd-rocm) يحتاج ROCm، الذي يحتاج معرّف GPU مدعومًا لا تملكه هذه اللوحة.
- **إنها صندوق استدلال، لا مدرّب.** الضبط الدقيق (fine-tuning) بأي حجم حقيقي يريد ذاكرة VRAM أكثر ومنظومة حوسبة عاملة. استخدمها لـ *تشغيل* النماذج، لا لتدريبها.
- **الإنتاجية تعتمد على الترددات.** بلا منظِّم يُبقي ترددات عالية تترك 10–20 tok/s مهدورة ([src](https://t.me/c/2424231195/101077))؛ والتبريد يهمّ هنا أيضًا (راجع [04-cooling.md](04-cooling.md)) لأن الاستدلال المستمر حِملٌ مستمر.

---

## الإعداد المبدئي الموصى به

| المستوى | افعل هذا | توقّع |
|------|---------|--------|
| الحد الأدنى | منظومة RADV عاملة ([06-linux.md](06-linux.md)) ← Ollama + `OLLAMA_VULKAN=1` ← إصلاح TTM ← `ollama run gpt-oss:20b` | ~30+ tok/s، محادثة مستقرة |
| أفضل | أضِف منظِّم Oberon + flash-attn + KV-cache بنوع `q4_0`؛ واجهة أمامية عبر Jan AI | +10–20 tok/s، سياق أطول، أدوات/MCP |
| نموذج أكبر | 35B-A3B MoE بـ IQ2/Q3 مع رفع `pages_limit` لـ TTM؛ بلا واجهة رسومية + Open WebUI لتحرير VRAM | ~38 tok/s، قرب سقف الذاكرة |
| لا تفعل | تدريب ROCm / HIP / vLLM على `gfx1013` | طريق مسدود، تخطّه |

---

## المصادر

- وصفة LLM لـ BC-250 (Ollama+Vulkan، إصلاح TTM، tok/s) — [akandr/bc250 §Ollama+Vulkan](https://github.com/akandr/bc250#3-ollama--vulkan-setup)
- لماذا يفشل ROCm على gfx1013 (لا مكتبات حلول rocBLAS/Tensile ← `rocblas_abort()`؛ ROCm يعيد التصريف عند كل إطلاق مقابل تخزين Vulkan للمظلِّلات) — [akandr/bc250 §2](https://github.com/akandr/bc250#2-why-vulkan-not-rocm) · مجموعة تعليمات `gfx103x` في RDNA2 تملك INT8 dp4a (`v_dot4c_i32_i8`)، فهذه فجوة مكتبة لا عتاد — [LLVM GFX1030 ISA](https://llvm.org/docs/AMDGPU/AMDGPUAsmGFX1030.html)
- فتح الـ 40-CU على MoE، فوارق التوليد المقيسة (gpt-oss-20b 66.1→87.5، Qwen3.5-35B-A3B 59.5→78.7، الوسيط +32 % توليد / +50 % تعبئة مسبقة عبر 11 نموذجًا؛ llama.cpp ≫ Ollama لـ MoE) — [akandr/bc250 §B9](https://github.com/akandr/bc250#b9-40-cu-unlock-results) · [§4 معايير القياس](https://github.com/akandr/bc250#4-benchmarks) · رقعة الفتح: [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock)
- إعداد عامل، gpt-oss-20b، زيادة Oberon، ملاحظات OOM/التوزيعة — https://t.me/c/2424231195/101077
- MoE مقابل الكثيف، عرض نطاق متعدّد البطاقات — https://t.me/c/2424231195/125233
- تحجيم LLM بفتح الـ 40-CU، مقيس مباشرةً (⚠ ASR — تقريبي) — Qwen3.5-9B كثيف على Ollama+Vulkan: 25.7 → 31.9 → 33.4 tok/s (24 → فتح → 36 CU، ~+20 % إجمالًا)؛ اللوحة محدودة عند 36 CU (وحدتا حوسبة معطوبتان، انهار llama عند التحميل) — [Old Lamer — فيديو فتح CU بالروسية](https://youtu.be/M7PsojWr4KA)
- نقاط بيانات MoE مع MTP (⚠ غير مُتحقَّق منها، تعليقات Hackaday) — Qwen "27b"+MTP ≈14.5 tk/s، "35b"+MTP ≈47 tk/s — سلسلة تعليقات مقالة Hackaday عن BC-250
- أمر الحزمة المُتحقَّق منه — https://t.me/c/2424231195/101026 · الرابط الرمزي لبرنامج Navi10→Cyan Skillfish الثابت — https://t.me/c/2424231195/7458/136321
- بناء llama.cpp (Vulkan / HIP) — [ggml-org/llama.cpp build.md](https://github.com/ggml-org/llama.cpp/blob/master/docs/build.md) · [الإصدارات](https://github.com/ggml-org/llama.cpp/releases) · [التثبيت](https://github.com/ggml-org/llama.cpp/blob/master/docs/install.md)
- واقع ROCm على gfx1013 — [ROCm/ROCm](https://github.com/ROCm/ROCm) · [woodrex83/ROCm-For-RX580 (gfx803 فقط)](https://github.com/woodrex83/ROCm-For-RX580) · [ulyssesrr/docker-rocm-xtra (مؤرشف؛ لا gfx1013)](https://github.com/ulyssesrr/docker-rocm-xtra) · [xuhuisheng/rocm-build navi10](https://github.com/xuhuisheng/rocm-build/tree/master/navi10) · [robertrosenbusch/gfx803_rocm](https://github.com/robertrosenbusch/gfx803_rocm)
- الواجهات الأمامية — [Jan AI](https://jan.ai/) · [KoboldCpp](https://github.com/LostRuins/koboldcpp/releases/tag/v1.109.2)
- النماذج (GGUF) — [Hugging Face](https://huggingface.co/) · [Qwen3.5-35B-A3B](https://huggingface.co/mudler/Qwen3.5-35B-A3B-APEX-GGUF) · [Gemma-4-26B-A3B](https://huggingface.co/majentik/gemma-4-26B-A4B-RotorQuant-GGUF-Q3_K_M)
- كسر السرعة/المنظِّم — [09-overclock-undervolt.md](09-overclock-undervolt.md) · أساس Linux — [06-linux.md](06-linux.md) · التبريد — [04-cooling.md](04-cooling.md)
