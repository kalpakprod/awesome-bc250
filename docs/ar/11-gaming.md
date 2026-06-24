> 🌐 ترجمة مجتمعية. النسخة الإنجليزية هي المرجع الأساسي وقد تكون أحدث. وجدت خطأ؟ افتح issue: [English](../en/11-gaming.md) · https://github.com/lildebil0/awesome-bc250/issues

# نتائج الألعاب والإعدادات

> **باختصار** — إن BC-250 هي **وحدة معالجة رسومية من فئة PS5 مثبَّتة على معالج Zen2 سداسي الأنوية مُقلَّص**. وحدة معالجة الرسوميات قادرة فعلًا: عند كسر سرعة واقعي إلى **2000 MHz** تشغّل عناوين AAA الحديثة عند **40–60 FPS**، والألعاب الأخفّ/الأقدم بما يتجاوز 60 بمراحل. المشكلة في **المعالج**. نصف الـ APU من نوع Zen2 هو عنق الزجاجة أكثر بكثير من GPU — تُظهر اختبارات المجتمع مرارًا البطاقة جالسةً عند **حمل GPU بنسبة ~36–47 % بينما هي مثبَّتة عند ~38 FPS**، محدودة بالمعالج. لذا: **اكسر السرعة أولًا** (القياسي ~1500 MHz أبطأ بنحو ~30 %)، واعتمد على **FSR** وتوليد الإطارات، واستهدف **1080p–1440p**، واقبل أن الألعاب كثيفة الفيزياء أو سيئة الخيوط ستتلعثم مهما كانت الدقة. منافذ الطرف الأول على طراز الكونسول (God of War، Horizon، Last of Us، Spider-Man) هي المنطقة المثالية.

يضبط هذا القسم التوقعات ويجمع نتائج المجتمع الحقيقية المنشورة — كثير منها لقطات شاشة لاختبارات الأداء. تختلف الأرقام بحسب التردد والتوزيعة والتعريف وتقسيم VRAM، لذا يرتبط كل صف بمصدره.

---

## الشيء الوحيد الذي يجب فهمه أولًا: إنها محدودة بالمعالج

وحدة معالجة الرسوميات في BC-250 جزء RDNA2 مشتق من PS5 (يبلّغ عنها RADV بأنها `GFX1013` / من فئة NAVI10). إنها *ليست* الحلقة الأضعف في معظم الألعاب. الحلقة الأضعف هي **المعالج Zen2 سداسي الأنوية** الذي يعمل عند ~3.5 GHz بذاكرة تخزين مؤقت مُقلَّصة على طراز PS5 وبلا فائض من SMT.

اختبار أداء مجتمعي عند **1080p، High، GPU @ 2000 MHz / mem @ 3600 MHz** يجسّد هذا: بلغت التشغيلة **"38 FPS"** بينما كانت **نسبة الحد من GPU 36.5 % فقط** — كان خيط محاكاة المعالج هو البوابة (محاكاة المعالج ~70 / عرض المعالج ~43 / GPU ~47 على مقياس كل مرحلة). كانت GPU خاملة عند ثلث طاقتها بينما أبقى المعالج معدل الإطارات منخفضًا. ([src](https://t.me/c/2424231195/136242))

العواقب العملية:

- **الدقة غالبًا "مجانية".** لأنك محدود بالمعالج، فإن الانتقال من 1080p إلى 1440p (أو حتى 4K مع FSR) كثيرًا ما يكلّف القليل من FPS — كان لدى GPU فائض على أي حال. عدة نتائج 4K أدناه تبدو جيدة تقريبًا كنظيراتها بدقة 1080p لهذا السبب بالضبط.
- **الترقية (upscaling) تساعد أقل مما تفعل على حاسوب عادي.** يخفّف FSR العبء عن GPU، لكن إن كان المعالج هو الحدّ، فخفض دقة العرض لن يرفع FPS كثيرًا. استخدم FSR لجودة الصورة / الحرارة، لا كزرّ سحري لـ FPS.
- **الألعاب سيئة الخيوط أو كثيفة الفيزياء تعاقبك.** التلعثم وقفزات زمن الإطار (Gothic Remake، Doom: The Dark Ages قبل الإصلاحات) تأتي من المعالج، لا من GPU.
- **اكسر سرعة GPU على أي حال** — حين *تكون* اللعبة محدودة بـ GPU (4K، تتبّع أشعة ثقيل، محركات جيدة الخيوط)، يكون 1500 ← 2000 MHz بنحو ~+30 % FPS. راجع [09-overclock-undervolt.md](09-overclock-undervolt.md) لكيفية الوصول إلى ذلك، و[04-cooling.md](04-cooling.md) أولًا، لأن 2000 MHz يحتاج تعديل التبريد.

---

## الإعدادات التي تُحدِث فرقًا فعليًا

- **الترددات.** GPU القياسي عند ~1500 MHz هو الإعداد الافتراضي البطيء؛ يشغّل المجتمع **GPU 2000 MHz، الذاكرة ~1900–2000 MHz** كهدف يومي، مع دفع البعض إلى **2.65 GHz للنواة على بناء من فئة dGPU**. القياسي مقابل 2000 MHz هو تقريبًا **+30 % FPS** في المشاهد المحدودة بـ GPU. ([دليل كسر السرعة](09-overclock-undervolt.md))
- **فتح الـ 40 CU.** تُشحن اللوحة ووحدات الحوسبة معطّلة. فتح كل وحدات الحوسبة الأربعين **40 CU** يمنح ارتفاعًا قابلًا للقياس وواسعًا — أبلغ أحد المستخدمين عن انتقال Doom: The Dark Ages من معطوب إلى **60 FPS High**، وعنوان "007" عند **60 FPS High**، وأزمنة إطار أكثر ثباتًا في Great Pragmata بعد الفتح. ([src](https://t.me/c/2424231195/141193)) راجع [09-overclock-undervolt.md](09-overclock-undervolt.md).
- **FSR / FSR 4.** استخدم Quality أو Balanced عند 1440p/4K لإبقاء GPU مشغولة وخفض الحرارة. ينقل المجتمع بنشاط **FSR 4** (حزم DLL تُشارَك داخل المحادثة). ([مصدر نقاش FSR4 INT8](https://t.me/c/2424231195/136354)) مكاسب FSR المقيسة من elektricM: **Quality +20–30 %، Balanced +30–40 %، Performance +40–60 %** FPS؛ **توليد الإطارات يمكن أن يضاعف** معدل الإطارات تقريبًا (زمن استجابة طفيف). **FSR 4 عبر Optiscaler** — يجد المجتمع أن **Balanced يتفوّق على FSR 3.1.5 Quality الأصلي**. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
  - **أيّ مُرقٍّ تستخدمه فعلًا:** **FSR 1–3 هو الخيار العملي** هنا — فهو ناضج ورخيص ومدعوم جيدًا. **FSR 4 وXeSS *يمكن* تقنيًا أن يعملا** على سيليكون RDNA2 هذا عبر **مسار DP4a (INT8)** — يملك RDNA2 dp4a/Rapid Packed Math، لذا يحمّل كل من بناء OptiScaler لـ FSR 4 INT8 ومتغيّر XeSS-DP4a المستقل عن GPU — لكن على GPU بهذا الضعف هما **بطيئان وتجريبيان**: مسار DP4a البديل أثقل بنحو ~10–20 % من مسار WMMA الذي تستخدمه البطاقات الأحدث، وجودة الصورة على XeSS-DP4a أدنى من نسخة XMX. عامِل FSR 4 / XeSS كشيء للتجربة، لا كخيارك اليومي. ([OptiScaler FSR4 INT8 على RDNA2 — VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/)) **FSR 4 الرسمي من AMD لـ RDNA2 (من فئة RX 6000) يصل ~أوائل 2027**؛ وحتى ذلك الحين هو مسار OptiScaler/المعدّل. ([Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals))
- **توليد الإطارات ما بعد FSR — LSFG.** يعمل **Lossless Scaling Frame-Generation (LSFG)** على Linux عبر طبقة Vulkan **`lsfg-vk`** ([github.com/PancakeTAS/lsfg-vk](https://github.com/PancakeTAS/lsfg-vk)) — طبقة توليد إطارات مستقلة عن اللعبة تربط أي عنوان Vulkan. يستخدمها المجتمع لـ **مضاعفة FPS تقريبًا** (مثلًا 30 ← 60) في الألعاب التي بلا توليد إطارات مدمج. مثل كل توليد إطارات، يضيف زمن استجابة ويريد معدل إطارات حقيقيًا معقولًا للاستيفاء منه، لكنه خيار حقيقي حين لا يكون توليد إطارات FSR الخاص متاحًا.
- **تقسيم VRAM (UMA).** إنه مجمَّع موحَّد بسعة 16 GB. في مسح دقيق واحد (1440p، 1850 MHz)، **بالكاد غيّر** تقسيم GDDR6 (512 MB مقابل 8 GB محجوزة) متوسط FPS — لكن إعداد UMA صغيرًا جدًا أو خاطئًا قد يُسقطك في العرض البرمجي (`llvmpipe`) أو يعلّق اختبار الأداء. الوضع التلقائي / احتياطي معقول يكفي؛ لا تُفرط في التفكير. ([src](https://t.me/c/2424231195/81203))
- **VSync مُطفأ** لاختبار الأداء؛ **توليد الإطارات مُفعّل** حيثما يتوفّر (ساعد Wukong على بلوغ متوسطات بثلاث خانات، انظر أدناه).
- **`mitigations=off`** (علم إقلاع النواة) تعديل شائع؛ في مسح VRAM كان له تأثيرات طفيفة ومشوّشة فقط على FPS. عامِله كأمر صغير. ⚠ **تحقّق (المقدار محل خلاف)** — يبلّغ elektricM عن مكسب أكبر بكثير (**+18 FPS في Cyberpunk، "+10–15 %"** في نصائحه). إنه بوضوح يعتمد على اللعبة: كبير في بعض العناوين المحدودة بالمعالج، مهمل في غيرها. جرّبه وقِس؛ لا تفترض أيًّا من الرقمين. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

---

## نتائج نشرها الناس فعلًا

هذه أرقام أبلغ عنها المجتمع مع إعداداتها ومصدرها. **درجات الأداء وFPS كما نُشرت** — تختلف الترددات/التوزيعة/التعريف بين الصفوف، فاقرأ عمود السياق، ولا تقارن بلا تمعّن.

| اللعبة | الإعدادات (الدقة / الإعداد المسبق / الترقية) | النتيجة | العتاد / الترددات | المصدر |
|------|--------------------------------------|--------|-------------|--------|
| **Black Myth: Wukong** (اختبار) | 1080p، High، FSR + Frame Gen مُفعّل | **متوسط 96** (أدنى 78، أقصى 113) | BC-250، Windows، RADV NAVI10 | ([src](https://t.me/c/2424231195/10069)) |
| **Black Myth: Wukong** (اختبار) | 1440p، Medium، بلا FSR | **متوسط ~48** (أقصى 56) | BC-250، 1850 MHz، Linux | ([src](https://t.me/c/2424231195/81203)) |
| **Shadow of the Tomb Raider** (اختبار) | 1440p، Max | **متوسط ~70** | BC-250، 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Marvel's Guardians of the Galaxy** (اختبار) | 1440p، High | **متوسط ~70** (89 أقصى، أدنى يهبط إلى ~3) | BC-250، 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Dying Light 2** (اختبار) | 1440p، High، بلا VSync | **متوسط ~48** (أقصى 62) | BC-250، 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Cyberpunk 2077** (اختبار) | 1440p، تتبّع أشعة **أدنى** | **متوسط ~36** (أدنى 30) | BC-250، 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Indiana Jones and the Great Circle** | 1440p، low، بلا مُرقٍّ | **45** | BC-250، GPU ~1900 MHz، Vulkan | ([src](https://t.me/c/2424231195/36931)) |
| **Indiana Jones and the Great Circle** | 1440p، medium، مُرقٍّ مُفعّل | **60** | BC-250 | ([src](https://t.me/c/2424231195/36931)) |
| **Forza Horizon 5** | **4K**، إعداد High المسبق، **بلا FSR** | قابلة للّعب (فيديو) | BC-250 | ([src](https://t.me/c/2424231195/81891)) |
| **The Witcher 3** | 4K، Medium، FSR Balanced | **~50** | BC-250 | ([src](https://t.me/c/2424231195/81894)) |
| **Kingdom Come: Deliverance II** | 4K، Med/High، FSR Quality | **~30** ("تجربة PS5") | BC-250 | ([src](https://t.me/c/2424231195/81893)) |
| **The Last of Us Part II** | 1080p، الإعداد المسبق الافتراضي | قابلة للّعب (فيديو) | BC-250 | ([src](https://t.me/c/2424231195/94237)) |
| **Doom: The Dark Ages** | High | **60** (بعد فتح 40 CU + إصلاح) | BC-250، 40 CU | ([src](https://t.me/c/2424231195/141193)) · [إصلاح Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/) · [Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS) |
| **Doom Eternal** | RT مُفعّل (أبلغ عنه المجتمع) | **60 + RT** | BC-250؛ أبلغ عنه المجتمع (r/BC250Gaming) | ([خلاصة Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Tekken 8** | (أبلغ عنه المجتمع) | **~60** | BC-250؛ أبلغ عنه المجتمع (r/BC250Gaming) | ([خلاصة Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Street Fighter 6** | (أبلغ عنه المجتمع) | **~60** | BC-250؛ أبلغ عنه المجتمع (r/BC250Gaming) | ([خلاصة Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Stellar Blade** | (أبلغ عنه المجتمع) | **~70–80** | BC-250؛ أبلغ عنه المجتمع (r/BC250Gaming) | ([خلاصة Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | توليد الإطارات مُفعّل (أبلغ عنه المجتمع) | **60 ← 100** (FG) | BC-250؛ أبلغ عنه المجتمع (r/BC250Gaming) | ([خلاصة Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | (فيديو) | قابلة للّعب | BC-250، معالج قياسي، **GPU 2000** | ([src](https://t.me/c/2424231195/121772)) |
| **Gothic Remake** | Medium | **تتلعثم** — "لا تحسين" | BC-250 | ([src](https://t.me/c/2424231195/142708)) |
| **Hi-Fi Rush** | (فيديو، التقاط OBS) | سلسة | BC-250، `mitigations=off` | ([src](https://t.me/c/2424231195/91022)) |
| **Cyberpunk 2077** | 1080p، High، FSR Quality، **بلا RT** | **70–90** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Cyberpunk 2077** (اختبار) | 1080p (قياسي 2000 MHz / 1000 mV) | **57.66** ← **60.82** OC (2230 MHz)؛ `mitigations=off` **+18** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **The Last of Us Part I** | 1080p، Medium-High | **60** (مستقرة) | BC-250 — 90–100 °C أثناء تجميع الشيدر؛ بعض نقرات الصوت | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Devil May Cry 5** | 1080p، High | **100** (أدنى زمن استجابة، ~10 ms) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Detroit: Become Human** | 1080p، Medium | **60** (مُقيّدة) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Control** | 1080p، **RT** كامل | **40** | BC-250 — جيدة لـ RT المبتدئ | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Company of Heroes 3** | 1080p | قابلة للّعب — **تحتاج تقسيم VRAM بـ 4 GB** (512 MB تشوّهات/انهيارات) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Red Dead Redemption 2** (اختبار) | استخدم علم `-useMaximumSettings` | **45+** أدنى | BC-250 — قد تكتشف محوّل GPU خاطئًا، اضبطه يدويًا | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **CS2** / **Rocket League** / **Elden Ring** | 1080p | **100+** / **120+** / **60** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Helldivers 2** | 1080p، low (مُبلَّغ) | **≈82** | BC-250، قياسي، مروحة Noctua NF-P12 واحدة — GPU 73 °C / CPU 76 °C؛ ⚠ ASR | ([“Temps Shocked Me”](https://youtu.be/d7Hwqxn9yg8) ~5:08) |
| **Stalker 2** | medium (مُبلَّغ) | **≈80** | BC-250 — يشير المؤلف إلى الحد بالمعالج / 8 GB RAM؛ ⚠ ASR | ([مراجعة RU](https://youtu.be/19l03qneKJ4) ~0:23) |
| **Stalker 2** | QHD (2560×1600)، FSR Quality + Frame Gen، التصحيح 1.21 (مُبلَّغ) | **57–70** (1080p، بلا FG **≈45**) | BC-250؛ ⚠ ASR | ([مراجعة RU](https://youtu.be/19l03qneKJ4) ~18:52) |
| **Arc Raiders** | 1080p (مُبلَّغ) | **≈56–80** | BC-250، قياسي؛ ⚠ ASR | ([Temps Shocked Me](https://youtu.be/d7Hwqxn9yg8) ~5:58) |
| **Spider-Man 2** | 1080p، High، FSR Frame Gen (مُبلَّغ) | **≈100** متوسط (دون 60 أصليًا) | BC-250؛ ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~11:04) |
| **Forza Horizon 5** | 1080p، Medium، بلا FSR (مُبلَّغ) | **70–95** | BC-250؛ ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~12:19) |
| **Metro Exodus** | QHD، High (مُبلَّغ) | **≈58** | BC-250؛ ⚠ ASR | ([مراجعة RU](https://youtu.be/19l03qneKJ4) ~14:12) |
| **Palworld** | 1080p، med-high (مُبلَّغ) | **<60** (قابلة للّعب) | BC-250؛ ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:04) |
| **Red Dead Redemption 2** | 1080p، med-high، FSR Quality (مُبلَّغ) | **60 ثابتة** | BC-250؛ ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:19) |
| **Left 4 Dead 2** | 1080p، max (مُبلَّغ) | **>150** | BC-250؛ ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~10:18) |
| _مرجع: بناء بوحدة معالجة رسومية منفصلة_ | اختبار محرك RE، 1080p، High، بلا RT | **متوسط 67.99** (أدنى 58، أقصى 82) | **RX 6600** + Xeon E5-2667v4، Win10 | ([src](https://t.me/c/2424231195/116494)) |

> صف RX 6600 **ليس نتيجة BC-250** — إنه عضو يشغّل بطاقة منفصلة على نفس الهيكل/المعالج كنقطة مقارنة. أُدرج ليُظهر ما يستطيع *المعالج* وحده الحفاظ عليه.

> ⚠️ **Elden Ring — النتائج تختلف.** الـ ~60 FPS أعلاه (elektricM، 1080p) ليست عامة: بناء مجتمعي واحد كان **مُقيّدًا عند 30 FPS مقفلة عند High ولم يستطع بلوغ 60 حتى عند 720p low** (محدود بالمعالج). عامِل 60 كأفضل حالة، لا كضمان. ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:50)

### منافذ الطرف الأول / الكونسول — المنطقة المثالية

عملت هذه بشكل جيد بما يكفي حتى إن أحد الأعضاء سردها ببساطة على أنها "تعمل" (منافذ PS تعتمد على GPU ومُحسَّنة جيدًا، وهو ما يناسب هذه اللوحة):

> Days Gone · Death Stranding · DIRT 5 · Ghost of Tsushima: Director's Cut · God of War (2018) · God of War: Ragnarök · Horizon Forbidden West · Horizon Zero Dawn · The Last of Us Part I · The Last of Us Part II Remastered · Returnal · Uncharted: Legacy of Thieves

([src](https://t.me/c/2424231195/99563))

---

## ألعاب معروفة بالمشاكل (لا تعمل / تحتاج حلًّا بديلًا)

يتابع elektricM عناوين لم نغطّها **تفشل أو تقاوم المنصة** — تحقّق قبل أن تشتري:

| اللعبة | المشكلة | الحل البديل |
|------|---------|-----------|
| **Fortnite** | Easy Anti-Cheat **لا يدعم Linux** | **لا شيء — لا يمكن تشغيلها** على BC-250 بنظام Linux |
| **Valorant** | مانع غش على مستوى النواة | مشاكل تقنية على Linux؛ عمليًا لا |
| **Magic: The Gathering Arena** | تعطّل/تجمّد تحديدًا على **Fedora** | تعمل أفضل على **Manjaro / Bazzite**؛ جرّب Proton آخر |
| **Final Fantasy VII Rebirth** | "DX12 is not supported on your system" (فحص توافق GPU) | **لا إصلاح بعد** |
| **Black Myth: Wukong** (مكسورة الحماية) | "CreateProcess() returned 2" (مانع عبث) | استخدم **ملفات لعبة غير معدَّلة** |

(حالة مانع الغش تتغيّر بمرور الوقت — راجع بشكل متقاطع [areweanticheatyet.com](https://areweanticheatyet.com) و[protondb.com](https://www.protondb.com).) ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

### محجوبة بصلابة بسبب ميزات GPU مفقودة (غير قابلة للإصلاح)

هذا **سيليكون من فئة RDNA 2** (GFX1013). حفنة من العناوين الأحدث **تتطلّب بصلابة ميزات GPU لا يملكها RDNA 2** — أساسًا **شيدرات الميش (mesh shaders)** و**التظليل العتادي متغيّر المعدل (VRS)** — وترفض العمل. السيليكون المفقود **قيد عتادي، لا خلل تعريف**: لا تحديث Mesa ولا معامل نواة ولا نسخة Proton تضيف الميزة نفسها. **شيدرات الميش** جدار حقيقي. متطلّب **VRS** أحيانًا يكون مجرد فحص وقت الإطلاق يمكن لطبقة Vulkan في فضاء المستخدم أن تُبطله (انظر ملاحظة Doom أدناه) — فهو ليس قاتلًا دائمًا. أمثلة مؤكَّدة ([محادثة مجتمع r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)):

| اللعبة | المتطلّب الصارم الذي تفتقده BC-250 |
|------|------------------------------------|
| **Final Fantasy VII Rebirth** | **شيدرات الميش** — لن تعمل (وهذا أيضًا سبب فشلها في فحص توافق DX12 لـ GPU في الجدول أعلاه) |
| **Doom: The Dark Ages — Update 2** | **معدل تظليل شظايا Vulkan** (VRS العتادي) — جعل Update 2 الـ VRS إلزاميًا *عند الإطلاق*؛ تفتقده GPU، فلم تعد اللعبة غير المعدَّلة تبدأ (كان بناء ما قبل Update 2 يعمل عند 60 FPS بعد فتح 40 CU، أعلاه). **يوجد حل بديل** — انظر الملاحظة أدناه. |

> **Doom: The Dark Ages Update 2 — يوجد الآن حل بديل.** اللعبة فقط *تفحص عن* VRS عند الإطلاق؛ لا تحتاجه فعليًا للّعب أبدًا. تعترض طبقة Vulkan **`bangstk/Vulkan_NullVRS`** ([github.com/bangstk/Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS)) استدعاء `vkCmdSetFragmentShadingRateKHR()` وتُبطله، فتُرضي فحص الإطلاق لتعمل اللعبة بلا آثار جانبية داخلها. لذا فإن Doom: The Dark Ages **ليست** حجبًا صارمًا دائمًا. **شيدرات الميش مختلفة** — لا يوجد بديل مكافئ لمتطلّب شيدرات الميش في FF7 Rebirth، فتلك لن تعمل فعلًا.

> قبل شراء عنوان AAA جديد كليًا، تحقّق مما إن كان يدرج شيدرات الميش أو VRS العتادي كمتطلّب. **شيدرات الميش** جدار عتادي حقيقي هنا (لا حل بديل). متطلّب **VRS العتادي** غالبًا مجرد بوابة وقت الإطلاق — أحيانًا قابلة للإبطال (كما مع Doom أعلاه)، وأحيانًا لا — فتحقّق من المجتمع قبل افتراض أيٍّ من الاتجاهين.

## تتبّع الأشعة — ما الذي اختُبر فعلًا

تملك BC-250 **عتاد RT حقيقيًا من فئة RDNA2** (لا محاكاة برمجية، بالنظر إلى Mesa 25.2+). عناوين RT المختبَرة بحسب elektricM:

| اللعبة | الدقة | FPS | ملاحظات |
|------|-----|-----|-------|
| Cyberpunk 2077 | 1080p | 50–60 | إضاءة RT فقط، FSR Quality |
| Control | 1080p | 40 | RT كامل |
| Portal 2 RTX | 720p | 40 | مسار RT برمجي في Mesa 25.2+ |
| Half-Life 2 RTX | 720p | 20–30 | متطلّب جدًا |

تتبّع الأشعة هنا للمبتدئين — جيد لـ *الإضاءة فقط* في الألعاب جيدة التحسين، لا للأحمال كاملة المسار. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

## Proton وخيارات الإطلاق (Linux)

- **نسخة Proton:** ابدأ بـ **Proton GE** (أفضل توافق) أو **Proton Experimental**؛ وارجع إلى **8.0 / 9.0** المستقرة بحسب اللعبة. ثبّت GE عبر **ProtonUp-Qt** (`protonup-qt`). بعض العناوين تعمل فقط على نسخة محددة — اختبر إن فشلت إحداها. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **خيارات إطلاق Steam** الجديرة بالمعرفة:
  - `mangohud %command%` — تراكب FPS/الحرارة.
  - `RADV_DEBUG=nohiz %command%` — يفرض RADV / يصلح بعض الأعطال.
  - `gamemoderun %command%` — منظِّم المعالج إلى performance للجلسة (يساعد هذه اللوحة المحدودة بالمعالج).
  - مدمجة: `RADV_DEBUG=nohiz mangohud gamemoderun %command%`.
- **VRAM لكل لعبة (تقسيم UMA):** الرياضات الإلكترونية/المستقلة على ما يرام عند **512 MB**؛ **معظم الألعاب تريد 4 GB**؛ وتريد AAA/RT أيضًا معاملات نواة الـ VRAM الإضافي (`amdgpu.gttsize=...`، راجع [06-linux.md](06-linux.md) / [08-bios.md](08-bios.md)). تقسيم صغير جدًا يسبّب تشوّهات أو انهيارات أو هبوطًا إلى العرض البرمجي. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **التلعثم عند أول تشغيل** عادةً هو **تجميع الشيدر** — دع Steam ينهي التجميع المسبق قبل الحكم على FPS؛ ذاكرة شيدر أكبر تساعد. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **إصلاحات لكل لعبة** (أبلغ عنها المجتمع، r/BC250Gaming — جرّبها إن صادفت هذه العلل بالضبط):
  - **Resident Evil Requiem — شعر معطوب/مشوَّه:** أضِف `RADV_DEBUG=nohiz %command%` إلى خيارات الإطلاق (نفس علم RADV المسرود أعلاه، مطبَّق هنا تحديدًا). ([خلاصة Reddit](https://www.reddit.com/r/BC250Gaming/))
  - **Spider-Man 2 / Assassin's Creed Shadows — تجمّد:** يُبلَّغ أن تفعيل **zswap** (swap مضغوط) يوقف التجمّد. ([خلاصة Reddit](https://www.reddit.com/r/BC250Gaming/))

---

## المحاكاة

المحاكيات ثقيلة على المعالج، فالنتائج متفاوتة لكن عدة منها متين ([src](https://t.me/c/2424231195/78988)):

- **Switch — Eden / Ryujinx:** يعمل جيدًا وبسرعة. أبلغ عنه المجتمع (r/BC250Gaming): **Mario Kart ~60 FPS**؛ **Tears of the Kingdom ~30–40 FPS**. ✅ ([خلاصة Reddit](https://www.reddit.com/r/BC250Gaming/))
- **PS4 — shadPS4 (0.9.0+):** يعمل Bloodborne جيدًا بلا هبوط؛ بعض العناوين (The Last Guardian) تُظهر تشوّهات لكنها تحافظ على FPS ثابت. ✅
- **PS3 — RPCS3:** يعمل، لكنه يحتاج ضبطًا لكل لعبة. ⚠️ **علّة معروفة** (أبلغ عنها المجتمع، r/BC250Gaming): علّة في المحاكي **تقفل GPU عند 1000 MHz** تحت RPCS3، فلا تستطيع GPU رفع التردد — الحل البديل هو **كسر سرعة المعالج للتعويض** عن فائض GPU المفقود. ([خلاصة Reddit](https://www.reddit.com/r/BC250Gaming/))
- **Xbox 360 — Xenia Canary:** تُحمَّل القوائم، لكن اللعب يهبط إلى شاشة سوداء (ما زال قيد البحث). ❌

---

## أين تراها تعمل (فيديو)

ينشر المجتمع الكثير من فيديوهات اللعب/الاختبار. بعض الالتقاطات داخل المحادثة والقنوات:

- مقاطع لعب/اختبار لـ BC-250: [youtu.be/CYDv1SfD2Pc](https://youtu.be/CYDv1SfD2Pc) · [youtu.be/g3uWOfqcexA](https://youtu.be/g3uWOfqcexA) · [youtu.be/9fozmRrAouc](https://youtu.be/9fozmRrAouc) · [youtu.be/q64M2XzADjA](https://youtu.be/q64M2XzADjA) · [youtu.be/0LEkOG1yqqw](https://youtu.be/0LEkOG1yqqw)
- ورقة تتبّع مجتمعية للألعاب المختبَرة (FPS/الإعدادات): [Google Sheet](https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing)

---

## ورقة غش للتوقعات الواقعية

| تريد… | الواقع على BC-250 بـ 2000 MHz ومعدَّلة |
|-----------|--------------------------------------|
| 1080p AAA، 60 FPS | أحيانًا — يعتمد على حمل المعالج. FSR + Frame Gen يساعد. AAA الأقدم/الأخفّ: نعم. |
| 1440p AAA | 40–60 FPS في معظم المنافذ؛ لدى GPU فائض هنا. أفضل دقة من حيث القيمة. |
| 4K AAA | 30–50 FPS مع FSR في المنافذ جيدة التحسين/الكونسول (Forza، Witcher 3، KCD2). |
| تتبّع الأشعة | فقط عند الحد الأدنى، FPS منخفض (Cyberpunk ~36 @ 1440p RT-min). ليس قوة اللوحة. |
| 60 مقفلة في كل مكان | لا. العناوين المحدودة بالمعالج وكثيفة الفيزياء ستهبط/تتلعثم بغض النظر عن الإعدادات. |
| منافذ PS من الطرف الأول | المنطقة المثالية — هذا ما تجيده اللوحة أكثر. |

---

## المصادر

- اختبار محدود بالمعالج (38 FPS، 36.5 % GPU) — https://t.me/c/2424231195/136242
- جدول اختبار VRAM/التردد الكبير (Wukong، Tomb Raider، Dying Light 2، Cyberpunk، Guardians) — https://t.me/c/2424231195/81203
- Wukong 1080p High FSR+FG، متوسط 96 — https://t.me/c/2424231195/10069
- Indiana Jones Great Circle، متعدد الدقة — https://t.me/c/2424231195/36931
- Forza Horizon 5 4K — https://t.me/c/2424231195/81891 · Witcher 3 4K — https://t.me/c/2424231195/81894 · KCD2 4K — https://t.me/c/2424231195/81893
- نتائج فتح 40 CU (Doom Dark Ages 60 FPS) — https://t.me/c/2424231195/141193 · إصلاح Doom — https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/
- TLOU II 1080p — https://t.me/c/2424231195/94237 · Resident Evil Requiem — https://t.me/c/2424231195/121772 · تلعثم Gothic Remake — https://t.me/c/2424231195/142708
- قائمة منافذ الطرف الأول — https://t.me/c/2424231195/99563
- جولة المحاكاة — https://t.me/c/2424231195/78988
- تشغيل مقارنة RX 6600 dGPU — https://t.me/c/2424231195/116494
- توافق ألعاب elektricM (إعدادات/FPS لكل لعبة، الألعاب المشكِلة، جدول RT، Proton وخيارات الإطلاق، مكاسب FSR) — https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/
- التقاطات FPS من YouTube (تعليق توضيحي تلقائي / ASR — الأرقام تقريبية): ETA Prime (Spider-Man 2، Forza H5، Left 4 Dead 2) — https://youtu.be/q_CxcbS5HI8 · "Temps Shocked Me" (Helldivers 2، Arc Raiders) — https://youtu.be/d7Hwqxn9yg8 · مراجعة RU (Stalker 2، Metro Exodus) — https://youtu.be/19l03qneKJ4 · Pixels & Power (Palworld، RDR2، Elden Ring 30 FPS) — https://youtu.be/4S0DvIpqm0E
- حجب صارم لشيدرات الميش / VRS العتادي (FF7 Rebirth، Doom: The Dark Ages Update 2) — [محادثة r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- **حل بديل لـ VRS في Doom: The Dark Ages — `bangstk/Vulkan_NullVRS`** (طبقة Vulkan تُبطل `vkCmdSetFragmentShadingRateKHR`) — https://github.com/bangstk/Vulkan_NullVRS
- **توليد إطارات LSFG على Linux — `lsfg-vk`** (طبقة Vulkan) — https://github.com/PancakeTAS/lsfg-vk
- **FSR 4 / XeSS عبر DP4a (INT8) على RDNA2** — بناء OptiScaler لـ FSR4 INT8: [VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/) · [ويكي توافق OptiScaler FSR4](https://github.com/optiscaler/OptiScaler/wiki/FSR4-Compatibility-List)
- **FSR 4 الرسمي من AMD لـ RDNA2 (~أوائل 2027) / RDNA3 (يوليو 2026)** — [Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals)
- **نتائج ألعاب أبلغ عنها المجتمع (r/BC250Gaming)** — Tekken 8، Street Fighter 6، Stellar Blade، RE Requiem Frame-Gen، Doom Eternal RT، Switch (Mario Kart / TOTK)، قفل GPU عند 1000 MHz في RPCS3، إصلاحات شعر RE Requiem / Spider-Man 2 / AC Shadows — https://www.reddit.com/r/BC250Gaming/
- ورقة اختبار ألعاب مجتمعية — https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing

> الترددات وفتح الـ 40 CU في [09-overclock-undervolt.md](09-overclock-undervolt.md)؛ نفّذ تعديل [04-cooling.md](04-cooling.md) قبل تشغيل 2000 MHz.
