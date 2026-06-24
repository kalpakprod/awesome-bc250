> 🌐 ترجمة مجتمعية. النسخة الإنجليزية هي المرجع الأساسي وقد تكون أحدث. وجدت خطأ؟ افتح issue: [English](../en/05-case.md) · https://github.com/lildebil0/awesome-bc250/issues

# العلب والطباعة ثلاثية الأبعاد

> **باختصار** — تُشحَن BC-250 كلوحة عارية، فيطبع الجميع تقريبًا علبة. لا توجد علبة "صحيحة" واحدة — أنتج المجتمع **عشرات** التصاميم، من **جِراب تبريد** أدنى يكتفي بإطباق نصفين حول اللوحة، إلى **صناديق بطراز كونسول** كاملة بمقبض حمل وشاشة أمامية و RGB. أيًا كان ما تطبعه، على العلبة أن تؤدي مهمة لا تستطيعها اللوحة المصنعية: **إحكام مروحة 120 mm على زعانف المشتت الحراري** كي يمر الهواء *عبرها* (راجع [التبريد](04-cooling.md)). هذه الصفحة هي الكتالوج: الاسم → STL → المراوح → أين تحمّل. **انتبه لمصدر الطاقة**: معظم العلب مصممة حول مصدر طاقة معيّن (LOP، أو Flex/SFX ATX، أو لبنة خادم HP) — اختر العلبة التي تطابق [مصدر الطاقة](03-power-supply.md) الذي بحوزتك.

تتراوح "العلبة" هنا من طبعة 200 g تستغرق 20 دقيقة عمل إلى كونسول متعدد القطع استغرق مؤلفه أسابيع. ابدأ بسيطًا؛ يمكنك دائمًا إعادة الطباعة.

> **جديد وغير متأكد؟ اطبع علبة [جِراب/قشرة onemorecap](#المستوى-1--جِراب-تبريد-أدنى-ابدأ-هنا) — أدنى، لا شيء لقطعه، تناسب مروحة 120 mm واحدة — وتوقف هناك.** الكتالوج أدناه عميق؛ لا تحتاج إلى قراءته لتنطلق.

> **تريد القائمة الكاملة؟** يصون elektricM **كتالوجًا قابلًا للبحث والتصفية لـ ~143 تصميمًا** (صفِّ حسب عائلة مصدر الطاقة، التوفر، المنصة) — أكثر بكثير من المجموعة المنسّقة أدناه، بما فيها العديد من تجميعات Discord-فقط وقيد العمل. تصفّحه على **[elektricM — Cases & Enclosures](https://elektricm.github.io/amd-bc250-docs/community/cases/)**. الاختيارات أدناه هي المسماة القابلة للتحميل علنًا والجديرة بالبدء منها.

---

## تجميعات المجتمع

نبذة عما طبعه الناس فعليًا — من قشرة مفتوحة عارية إلى كونسولات كاملة الطابع. اللوحة نفسها، ونتائج مختلفة جذريًا.

<p align="center">
  <img src="../../assets/img/case-shell.jpg" alt="onemorecap Shell Case: لوحة جانبية مفتوحة، مقبض حمل، زعانف نحاسية مكشوفة، مروحة Arctic 120 mm" width="60%"><br>
  <sub>تجميعة Дима Ткач · <a href="https://t.me/c/2424231195/22771">source</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-frame.jpg" alt="إطار ألمنيوم أبيض مفتوح بالداخليات معروضة: مشتتان حراريان، مروحة Arctic بيضاء مركزية، مصدر Flex" width="60%"><br>
  <sub>تجميعة Сергей · <a href="https://t.me/c/2424231195/87420">source</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-orange.jpg" alt="كونسول مغلق برتقالي وأبيض بلوحة جانبية شبكية مثقّبة ومقبض حمل مصبوب" width="60%"><br>
  <sub>تجميعة Alexander Susl · <a href="https://t.me/c/2424231195/122822">source</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-arasaka.jpg" alt="كونسول بطابع ARASAKA السايبربانكي: وجه أبيض، شبكة مروحة كرومية، لمسات وأقدام خضراء" width="60%"><br>
  <sub>تجميعة Maxim Perelygin · <a href="https://t.me/c/2424231195/98072">source</a></sub>
</p>

---

## كيف تختار

ثلاثة أسئلة تحدد أي علبة تناسبك:

1. **أي مصدر طاقة تستخدم؟** ([مصدر الطاقة](03-power-supply.md)) — Meanwell **LOP-300** صغير ويعيش *داخل* معظم العلب. مصدر **Flex/SFX ATX** أكبر ويحتاج علبة بحجرة مخصصة. لبنة **HP/خادم** مستصلَحة تحتاج علب "v3/v4 server PSU". هذا أكبر مرشِّح منفرد.
2. **أي مروحة (مراوح) ستشغّل؟** تقريبًا كل علبة مبنية حول **مروحة 120 mm واحدة** فوق المشتت الحراري. التجميعات الأكبر تضيف **مروحة 120 mm ثانية** على اللوحة الخلفية (لتبريد ذاكرة GDDR6 التي [لا مستشعر حرارة لها](04-cooling.md)) أو لتغذية مصدر الطاقة. قليل منها يستخدم مراوح **140 mm** أو **نحيفة** حيث الارتفاع ضيق.
3. **هل رقّقت الزعانف بعد؟** تفترض معظم العلب أنك **بردت/صنفرت زعانف المشتت الحراري المصنعية** مفتوحةً بالفعل (راجع [التبريد، المسار A](04-cooling.md)). العلبة وحدها لا تصلح المبرّد المصنعي — هي فقط تمسك المروحة في المكان الصحيح.

> **مصطلحات، مرةً واحدة:** **STL** = ملف شبكة الطباعة ثلاثية الأبعاد القياسي الذي تحمّله في المُقطِّع. **STEP / 3MF** = صيغ CAD قابلة للتحرير (استخدمها إن أردت تعديل التصميم). **Shroud / sleeve / adapter** = قمع مطبوع يجعل المروحة تُحكَم على الزعانف بدلًا من تسريب الهواء حولها. **Flex / SFX ATX** = مصادر طاقة حاسوب صغيرة عامل الشكل. **LOP** = مصدر Meanwell LOP-300 الصناعي الذي يفضّله المجتمع.

> **💡 اطبع فتحة وصول إلى مِجسَر مسح CMOS.** في كل مرة تغيّر فيها تقسيم VRAM/UMA عليك **مسح CMOS** (راجع [BIOS](08-bios.md))، فتصميم علبة مغلقة تدفن المجسر يعني فتحها مرارًا. اترك **فتحة وصول ⌀10 mm** فوق مِجسَر مسح CMOS في أي تصميم مغلق — أو، أفضل، أوصل **مفتاحًا بـ 3 أوضاع** صغيرًا إلى اللوحة كي تعيد ضبطه بلا أدوات. ([4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980))

---

## المستوى 1 — "جِراب تبريد" أدنى (ابدأ هنا)

أصغر وأسرع شيء يمكنك طباعته. إنه **ليس علبة حقًا** — إنه كُمّ مطبوع يلتقط على اللوحة في نصفين بتركيب احتكاكي محكم، يمسك مروحة 120 mm على المشتت الحراري، ويوجّه الهواء. **لا شيء لقطعه، لا براغي في اللوحة.** يصف Дима Ткач (أحد أوائل بُناة المشروع) صيغتين — مدمجة وأخرى "أمتع منظرًا" — كلتاهما تبلغ **~70 °C عند حمل 150 W**، ~210 g / ~170 g بلاستيك لكل منهما، مع بقاء مصدر الطاقة باردًا على تدفق هواء مضطرب ([src](https://t.me/c/2424231195/10743)). حكمه: *"هذه ليست علبة حقًا، بل أقرب إلى جِراب تبريد، لكن لا شيء يحتاج إلى قطع، كله يثبت بتركيب محكم جدًا، النصفان يُسقَطان من الجهتين المتقابلتين."*

- **الملفات:** `BC-250-FanSleeves.3mf` ([src](https://t.me/c/2424231195/10766))، CAD اللوحة `bc-250-body.step` ([src](https://t.me/c/2424231195/18266))
- **مستودع المصدر:** [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) — أكثر تصميم أدنى موصى به "مُحقَّق، مطبوع، مؤكد العمل" في الدردشة ([src](https://t.me/c/2424231195/18260))
- **المروحة:** 1× 120 mm
- **مصدر الطاقة:** أي — هناك فتحة/قَطع لسلك الطاقة فيمكنك استخدام LOP *أو* مصدر خارجي ([src](https://t.me/c/2424231195/22950))

---

## المستوى 2 — إطار مفتوح / "قشرة" (اللوحة معروضة)

أنصاف علب تلتف حول اللوحة من جانب واحد وتترك المشتت الحراري مرئيًا. خفيفة على البلاستيك، سهلة التركيب، تدفق هواء جيد.

### onemorecap "Shell Case" — البناء المرجعي

أكثر منشور علبة تفاعلًا قيميًا في الدردشة (❤33): لوحة جانبية مسطحة فوق اللوحة منقوش عليها **"BC-250"** ونمط شبكة CU، **مقبض حمل** مصبوب في الأعلى، **زعانف المشتت الحراري المرقّقة مكشوفة** في الوسط، ومروحة **Arctic** 120 mm في غطائها الموجِّه الخاص مثبّتة بالبراغي إلى الطرف الأيمن. موسومة *"BC-250 SHELL CASE BY ONEMORECAP / ASRock × CMG"* ([src](https://t.me/c/2424231195/22771)). نُشرت مجموعة STL المطابقة إلى الدردشة دفعةً واحدة ([src](https://t.me/c/2424231195/81672)) وأكّد المؤلف أن النماذج مجانية على Printables و MakerWorld ([src](https://t.me/c/2424231195/24505)).

- **الملفات (دفعة الدردشة):** `Shell_Front.stl`، `Shell_Back_FLEX_ATX.stl`، `Front_Panel.stl`، `USB_Bracket.stl`، إضافةً إلى الأغطية الموجِّهة أدناه ([src](https://t.me/c/2424231195/81680))
- **المصدر:** [GitHub onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case)
- **المروحة:** 1× أو 2× 120 mm (عبر غطاء موجِّه)، أو 1× 140 mm
- **مصدر الطاقة:** لوحة `Shell_Back_FLEX_ATX` الخلفية مقطوعة لمصدر **Flex ATX**

### إطار مفتوح أكريليكي (Владислав)

إطار **ألمنيوم وأكريليك** مفتوح: لوحتان معدنيتان طرفيتان بألواح جانبية شفافة، اللوحة مركّبة عموديًا، مروحة **Arctic 120 mm** واحدة تنفخ مباشرةً عبر المشتت الحراري المرقّق في الوسط، ومصدر Flex/SFX يجلس في الحجرة السفلية ([src](https://t.me/c/2424231195/114651)). هذا هو التصميم الذي نُشر لاحقًا في [r/BC250Gaming بوصفه "العلبة الأكريليكية"](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/). الحوامل المطبوعة هي القطع التي تعيد إنتاجها؛ الإطار نفسه مقطوع بالليزر/جاهز.

- **المروحة:** 1× 120 mm (الوسط) — مكان لإضافة مروحة لوحة خلفية
- **مصدر الطاقة:** Flex / SFX ATX في الحجرة السفلية

---

## المستوى 3 — صناديق بطراز كونسول (مغلقة بالكامل)

علب مغلقة تبدو كأنها كونسول ألعاب أو NAS صغير. بلاستيك أكثر ووقت طباعة أكثر، لكن منتج نهائي بمقبض وزر طاقة ولوحات مهواة وأحيانًا شاشة.

### "Просто лучший корпус" (Jack Fisher × B1zon) — مفضّل المجتمع

نُشرت تحت وسم **#BC250body** المنسّق بوصفها *"simply the best case"*، وهي كونسول كامل الإنهاء بقائمة مواد منشورة: مصدر طاقة، مراوح، موصّل، أقدام مطاطية، زر طاقة، براغي + أطراف لولبية مدخَلة، مقسّم PWM للمروحة، ملصق "Cyberpunk" ومشط لتقويم المشتت الحراري. بعض القطع خارج الإنتاج ولها بدائل ([src](https://t.me/c/2424231195/79990)). الفضل في التصميم لـ B1zon، والتجميع لـ Jack Fisher.

- **الملفات:** `BC250 korpus исправленный.rar` ("علبة BC250، مصحَّحة") ([src](https://t.me/c/2424231195/79989))
- **المروحة:** 120 mm (أمامية) + مقسّم PWM لمروحة ثانية
- **مصدر الطاقة:** داخلي (فئة LOP)

### واجهة "GPU" ثلاثية (Гослинг)

صندوق كونسول لوحته الأمامية **غطاء بطاقة رسوميات مزيف** — ثلاثة قطوع مروحة دائرية في صف مع RGB، فتبدو الآلة كوحدة GPU منفصلة. مُظهَر يشغّل **Bazzite 42** على BC-250 ([src](https://t.me/c/2424231195/66616)). الفتحات الثلاث تجميلية فوق المروحة العاملة الوحيدة إضافةً إلى المدخل.

### كونسول أبيض بلوحة متاهة (Jhonatan)

صندوق أبيض طويل بلوحة جانبية مهواة بنمط **متاهة/دارة** لافت، زر طاقة معدني مضاء (أخضر)، وشبكة مدخل بكامل الارتفاع على الوجه الأمامي — أحد أكثر الجماليات صقلًا في الدردشة ([src](https://t.me/c/2424231195/121274)).

### برج صغير بشبكة مربعة (Joglik)

برج صغير عمودي رمادي بـ **شبكة مربعات كثيفة** على الجانب والأعلى، شَقّ/مقبض في الحافة العلوية، وممر كابل دائري في أسفل الخلف. مظهر صناعي نظيف ([src](https://t.me/c/2424231195/126525)).

### صندوق هاي-فاي بنافذة بيضاوية (a m)

علبة مستطيلة بيضاء بطراز واجهة هاي-فاي/ميكروويف: **نافذة شبكية بشكل ملعب** كبيرة مع المروحة مرئية خلف شبكة دائرية، يكتنفها شَقّان شبكيان عموديان ([src](https://t.me/c/2424231195/52955)). صيغة المؤلف اللاحقة تتجه نحو "بلاستيك سليم" بدلًا من PVC المرغّى وتضيف طاقة XT خارجية و RGB ([src](https://t.me/c/2424231195/128048)).

### كونسول مدمج (Volodymyr Spyrydonov، "v15")

صندوق كونسول فضي وأسود صغير بمدخل جانبي شبكي وواجهة داكنة تحمل شعارًا بطراز سايبربانك وشريط RGB، مُظهَر جالسًا بجانب تلفاز كآلة غرفة معيشة ([src](https://t.me/c/2424231195/135995)). جزء من سلسلة طويلة من الإصدارات (صور مصدر v15/v19/v20 شُورِكت مبكرًا).

### BC250 Vented Edition (MaelremremDotXYZ)

كونسول **FlexATX** بسيط يعمل **بزعانف مفتوحة**، يثبت عند **~67 °C @ 2145 MHz / 1.1 V**، بمفتاح قطع لمصدر الطاقة في الخلف. [MakerWorld 2899020](https://makerworld.com/en/models/2899020).

### Stellar 250 (isaacalvex)

كونسول قائم بذاته كامل بـ **دليل بناء** كامل: تخزين داخلي، **WiFi 6**، و**شاشة حرارة ESP32**. [GitHub isaacalvex/AMD-BC-250-Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide).

### Simple Case for the ASRock AMD BC-250

علبة كونسول مسماة قابلة للتحميل علنًا نشرها مؤلف [دليل البناء الأوكراني على YouTube](https://youtu.be/p5Zd86vFe8w) — صندوق مغلق مباشر لمن يريد طبعة نهائية دون تعقيد متعدد القطع. [MakerWorld 2870270](https://makerworld.com/en/models/2870270).

---

## المستوى 4 — تجميعات كبيرة: مصدر طاقة ATX، تبريد سائل AIO، شاشات

لمن يريد مصدر طاقة بحجم كامل، أو تبريدًا سائلًا، أو شاشة مدمجة.

### عائلة NexGen3D "DIY Steam Machine"

**أكثر مشروع 3D يُشار إليه** في المجتمع (أُعيد نشره 7×). عائلة علب كونسول على Printables، تشمل صيغة **"Pro" مبرّدة بالسائل** وإصدار **"Redux"** يناسب **شاشة Pi داخلية 1080×480** في الواجهة ([بناء Reddit](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)). يوجد نموذج **مثبت AIO** مخصص لوضع مبرّد سائل متكامل 120 mm على النواة.

- [Printables 1499974 — DIY Steam Machine (الأساس)](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite)
- [Printables 1614131 — Pro مبرّد بالسائل](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) · [Printables 1649679 — Redux](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) · [Printables 1554003 — مثبت AIO](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250)
- **المروحة/التبريد:** هواء 120 mm **أو** AIO 120 mm حسب الصيغة
- **مصدر الطاقة:** صيغة LOP وصيغ ATX موثّقة

### بناء "Steam Machine Pro" المرجعي المبرّد بالسائل (Old Lamer)

بناء راقٍ مبرّد بالسائل بالكامل موثّق من البداية إلى النهاية على الفيديو — مفيد كقائمة تسوّق قطع إن كنت تذهب كليًا نحو آلة AIO ([Old Lamer](https://youtu.be/afYhUQFa-AY)). قائمة المواد المنشورة:

- **AIO:** TEUCER AF 240 (متكامل 240 mm) على النواة
- **مصدر الطاقة:** Mean Well **LOP-600-12** (أو **LOP-500-12** كخيار أصغر) — راجع [مصدر الطاقة](03-power-supply.md)
- **المراوح:** 2× Arctic **P12 Pro** + 1× Arctic **P8**
- **طاقة عن بُعد:** لوحة مرحّل **ESP32** لتشغيل/إطفاء الآلة عن بُعد
- **البرمجيات:** **OpenLinkHub** / **Commander Duo** تحت Linux لقيادة مضخة AIO والمراوح

---

### Steam Cube — علبة عمودية بارامترية، مبرّدة بالماء (قيد التطوير)

علبة عمودية **بارامترية بالكامل** بعامل شكل **Xbox Series X**، مصممة **بأولوية التبريد المائي** بجانب بارد قابل للتبديل: كتلة ماء، أو **Thermalright AXP90-X47 Full-Copper**، أو **Arctic P12 Max** واحدة، كلها تُربَط بالبراغي إلى المثبت نفسه. نشأت من رسمة **Sol Diego "Xbox Serie X BC-250 Edition"** ([Printables 1748271](https://www.printables.com/model/1748271)) ونموذج اللوحة الدقيق **torassk** ([Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board))، ثم أُعيد رسمها كشيفرة (build123d) فصار كل بُعد متغيّرًا تعيد ملاءمته، لا شبكة ثابتة.

**المغلِّف والمنطق وراءه** (مُشتق من حجم اللوحة المُحقَّق والأهداف الحرارية في [التبريد](04-cooling.md)):

- برج عمودي **~180 × 212 × 380 mm** — طويل بما يكفي لإيقاف **مشعّ 240 mm عموديًا** بجانب اللوحة (تجمّع مشعّ بطول ~277 mm يناسب داخل 380 mm من الارتفاع).
- **تدفق هواء بتأثير المدخنة** — مدخل 120 mm منخفض، مخرج 120 mm مرتفع، فترتفع الحرارة مباشرةً للخارج.
- **اللوحة الخلفية النشطة إلزامية، لا اختيارية** — جانب GDDR6 / VRM [لا مستشعر حرارة له](04-cooling.md)، فيعامل التصميم التبريد الخلفي كجزء مطلوب.
- **أهداف التبريد** (أهداف تصميمية، **لا** نتائج مقاسة): ماء النواة < 60 °C مستدامًا عند 40 CU؛ AXP90 < 75 °C @ 2000 MHz؛ قاعدة P12 ~73–78 °C.

> ⚠️ **الحالة: مفهوم تصميمي، لا طبعة مُحقَّقة.** الـ CAD الحالي هو **نموذج مكاني بارامتري** — القطع مُحجَّمة وموجَّهة وموضوعة بشكل صحيح، ويصدّر 8 STL + ملف STEP — لكنه **لم يُطبع أو يُجمَّع أو يُختبَر حراريًا**، وكتلة الماء موضوعة من صندوق إحاطة اللوحة لا من موضع نواة مقاس. عامِله كـ **CAD بداية للتفريع**، لا علبة نهائية؛ التحقق الحقيقي من الطباعة / الملاءمة / الحرارة هو الخطوة التالية المفتوحة. الأهداف أعلاه أهداف، لا قياسات مرجعية.

---

### علب مصدر طاقة ATX (Victor L.، V\ad، خادم-PSU v3/v4)

لمصدر طاقة **ATX** كامل: علبة مبنية حول مصدر ATX كامل ([src](https://t.me/c/2424231195/119293)، متجهة إلى MakerWorld)، نموذج Blender أبكر لمبتدئ ([src](https://t.me/c/2424231195/105570))، وخط **HP/خادم-PSU** منشور على Printables/MakerWorld مع توفير HDD ومحور USB.

- [Printables 1580750 — Case v3، HP server PSU + HDD + USB hub](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) · [MakerWorld 2481620 — Case v4، FlexATX & HP-server PSU](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) · [Printables 1550729 — ATX-PSU Bazzite Box](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box)

### تجميعات Twin-120 (تبريد الذاكرة + مصدر الطاقة)

لوحة تركيب معاد تصميمها تحمل **مروحتي 120 mm** — واحدة موجَّهة إلى اللوحة الخلفية (الذاكرة) كما قصد مصمم اللوحة، والثانية تغذّي مصدر الطاقة. بمروحتي Lian Li P28 أمامًا + Thermalright C12015، يثبت المؤلف عند **2200 MHz عند 80 °C في الألعاب**، حيث لم تكن مروحة أمامية واحدة كافية ([src](https://t.me/c/2424231195/120606)). يُشارَك **`Twin_120mm_Fan_Shroud.stl`** قائمًا بذاته لهذا ([src](https://t.me/c/2424231195/121684)).

### The Lanboy — أركيد محمول / صندوق غداء

بناء أركيد-صندوق-غداء محمول: يقود **لوحة eDP لحاسوب محمول 16″ (1920×1200 @ 165 Hz)** عبر **لوحة محوّل eDisplayPort** ([AliExpress](https://www.aliexpress.com/item/1005006351527252.html))، مكبرَا صوت 2″ على مضخّم USB، كله يُغذّى من **مخرج 12 V ATX** واحد. [Printables 1746364](https://www.printables.com/model/1746364). حيلة محوّل eDP قابلة لإعادة الاستخدام لأي بناء بلوحة حاسوب محمول.

### BC250-HUD (Bloodyly) — شاشة حالة داخلية

تطبيق **شاشة حالة Qt5/C++ لـ Raspberry Pi Zero 2** (مستخدَم في تجميعات مثل NexGen3D Redux): **60 FPS عبر وضع gadget في USB**، يقرأ FPS/زمن الإطار من MangoHud، يستشعر جهد المروحة لتعتيم الشاشة عند النوم، و**يتضمن رقعة نواة vc4** التي تجمّد الـ Pi لولاها. الشاشة: **8.8″ 1920×480 IPS** (Hannstar HSD088IPW1-A). [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD).

---

## المحوّلات والمثبتات (ليست علبًا كاملة)

قطع مطبوعة صغيرة تحل مشكلة واحدة — عادةً تثبيت مبرّد أو مروحة على اللوحة.

- **الأغطية الموجِّهة للمراوح** (إحكام مروحة على الزعانف): `Fan_Shroud_Single_120mm.stl`، `Fan_Shroud_Dual_120mm.stl`، `Fan_Shroud_Single_120mm_Restricted.stl`، `Fan_Shroud_Single_140mm.stl` ([src](https://t.me/c/2424231195/81673))، `Twin_120mm_Fan_Shroud.stl` ([src](https://t.me/c/2424231195/121684)). مُفهرَسة أيضًا في [التبريد](04-cooling.md).
- **مثبتات اللوحة الخلفية / مروحة الذاكرة:** `Backplate.stl` + `backplane-top-fixed.stl` ([src](https://t.me/c/2424231195/133049))؛ `bottom_fan_mount.stl`، `top_fan_mount.stl`، `Front-Mount.stl`، `Back-Mount.stl` ([src](https://t.me/c/2424231195/131189))
- **محوّلات مبرّد AM4** (تثبيت مبرّد معالج قياسي بالبراغي على النواة): `bc250 am4 adapter polished.stl`، `bc250 cooler mount.stl` ([src](https://t.me/c/2424231195/9949)). راجع أيضًا [Printables 1042228 — BC250→AMD CPU-cooler mount](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount).
- **مثبت ITX عام** (majzok): يُطبَع في قطعتين تلتقطان في إطار — اربط BC-250 فيه بالبراغي، ثم اربط الإطار بالبراغي في **أي علبة بثقوب لوحة أم ITX قياسية** (مختبَر في DeepCool CH170 PLUS). يحل مشكلة "لا وجود لمثبت ITX عام". لا رابط Printables أساسي مُلتقط — ابحث في Printables/MakerWorld عن **"BC-250 ITX Mount"**.
- **محوّل Thermalright AXP90-X53 / AXP120-X67** (مبرّد منخفض المظهر على النواة): مثبت مطبوع يحتاج أسنان M3، بصيغ سُمك حسب ضغط المبرّد/المعالج — [Printables 1694793](https://www.printables.com/model/1694793). أيضًا في [التبريد](04-cooling.md).
- **محوّل مروحة 120 mm:** `BC250_FanAdapter_120mm.step` ([src](https://t.me/c/2424231195/83135))، `cooler adapter v3.0 (1).stl` ([src](https://t.me/c/2424231195/111091))
- **نماذج لوحة دقيقة** (صمّم علبتك مقابلها): [Printables 1341336 — لوحة BC-250 دقيقة](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) ([src](https://t.me/c/2424231195/55496))، [Printables 1103626 — AMD BC250 board](https://www.printables.com/model/1103626-amd-bc250-board)

---

## جدول الكتالوج

الملفات الموسومة *(chat)* مُرآة تحت `assets/stl/`؛ كل ما عداها يُحمَّل من صفحة Printables / MakerWorld / GitHub المرتبطة.

| العلبة / القطعة | النوع | ملفات STL / المصدر | المراوح | التحميل |
|---|---|---|---|---|
| **onemorecap cooling sleeve** | جِراب أدنى | `BC-250-FanSleeves.3mf` *(chat)* | 1× 120 | [GitHub onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) |
| **onemorecap Shell Case** ⭐ | قشرة مفتوحة | `Shell_Front.stl`، `Shell_Back_FLEX_ATX.stl`، `Front_Panel.stl`، `USB_Bracket.stl` *(chat)* | 1–2× 120 / 1× 140 | [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [GitHub](https://github.com/onemorecap/bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case) |
| **Acrylic open frame** (Владислав) | إطار مفتوح | حوامل مطبوعة *(chat #114651)* | 1× 120 | [Reddit thread](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) |
| **"Просто лучший корпус"** (Jack Fisher × B1zon) | كونسول | `BC250 korpus исправленный.rar` *(chat)* | 120 + مقسّم PWM | [chat #79989](https://t.me/c/2424231195/79989) |
| **Minimal case for Flex PSU** | صندوق صغير | `minimal-case-...-model_files.zip` *(chat)* | 1× 120 | [Printables 1423572](https://www.printables.com/model/1423572-minimal-case-for-bc250-and-flex-psu) |
| **forgenam case** | كونسول | `forgenam-case-bc250-model_files.zip` *(chat)* | 1× 120 | [Printables 1375929](https://www.printables.com/model/1375929-forgenam-case-bc250) |
| **Minimalist 240** | كونسول + مقبض | `Minimalist 240 Front/Back/Handle.stl` *(chat)* | 120 | [chat #117404](https://t.me/c/2424231195/117404) |
| **M360** | كونسول | `M360 Front.stl`، `M360 Back.stl` *(chat)* | 120 | [chat #126566](https://t.me/c/2424231195/126566) |
| **NexGen3D DIY Steam Machine** ⭐ | كونسول | ملفات Printables | 1× 120 | [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) |
| **NexGen3D Pro (سائل)** | كونسول + AIO | ملفات Printables | 120 AIO | [Printables 1614131](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) |
| **NexGen3D Redux (+شاشة)** | كونسول + شاشة 1080×480 | ملفات Printables | 1× 120 | [Printables 1649679](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) |
| **NexGen3D AIO mount** | محوّل | ملفات Printables | 120 AIO | [Printables 1554003](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250) |
| **Case v3 — HP server PSU** | كونسول + HDD/USB | ملفات Printables | 120 | [Printables 1580750](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) |
| **Case v4 — FlexATX / HP PSU** | كونسول | ملفات MakerWorld | 120 | [MakerWorld 2481620](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) |
| **ATX-PSU Bazzite Box** | صندوق ATX كامل | ملفات Printables | 120 | [Printables 1550729](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box) |
| **ivanov-innokentii case** | كونسول | مصادر GitHub | 120 | [GitHub ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) |
| **rLapchynski enclosure** | علبة مغلقة | مصادر GitHub | 120 | [GitHub rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure) |
| **BC-250 Scooper** | غطاء موجِّه/مغرفة | ملفات Printables | 120 | [Printables 1282906](https://www.printables.com/model/1282906-bc-250-scooper) |
| **Pitman case** | كونسول | ملفات Printables | 120 | [Printables 1570248](https://www.printables.com/model/1570248-amd-bc-250-pitman-case) |
| **Industrial-style FlexATX** | كونسول | `amd_bc_250_industrial_style_case...zip` *(chat)* | 120 (بلا مبرّد مصنعي) | [chat #144265](https://t.me/c/2424231195/144265) |
| **The Lanboy** | أركيد محمول + شاشة eDP 16″ | ملفات Printables | مخرج 12 V ATX | [Printables 1746364](https://www.printables.com/model/1746364) |
| **BC250 Vented Edition** (MaelremremDotXYZ) | كونسول FlexATX، زعانف مفتوحة | ملفات MakerWorld | 120 | [MakerWorld 2899020](https://makerworld.com/en/models/2899020) |
| **Stellar 250** (isaacalvex) | كونسول + دليل بناء (WiFi6، ESP32) | دليل GitHub | 120 | [GitHub isaacalvex/...Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide) |
| **Simple Case for the ASRock AMD BC-250** | كونسول | ملفات MakerWorld | 120 | [MakerWorld 2870270](https://makerworld.com/en/models/2870270) |
| **BC250-HUD** (Bloodyly) | شاشة حالة Pi Zero 2 داخلية | مصادر GitHub | — | [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD) |
| **Generic ITX mount** (majzok) | محوّل (أي علبة ITX) | ابحث في Printables/MakerWorld | — | "BC-250 ITX Mount" |
| **Thermalright AXP90/AXP120 mount** | محوّل مبرّد منخفض المظهر | ملفات Printables | برج منخفض المظهر | [Printables 1694793](https://www.printables.com/model/1694793) |
| **Twin-120 mount plate** | لوحة محوّل | `Twin_120mm_Fan_Shroud.stl` *(chat)* | 2× 120 | [chat #121684](https://t.me/c/2424231195/121684) |
| **Fan shrouds (120/140)** | غطاء موجِّه | `Fan_Shroud_Single_120mm.stl`، `_Dual_120mm`، `_Single_140mm`، `_120mm_Restricted` *(chat)* | 120 / 140 | [Printables 1339540](https://www.printables.com/model/1339540-yet-another-bc-250-fan-shroud) · راجع [التبريد](04-cooling.md) |
| **AM4 cooler adapter** | مثبت | `bc250 am4 adapter polished.stl`، `bc250 cooler mount.stl` *(chat)* | برج/AIO | [Printables 1042228](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount) |
| **Accurate board model** | CAD مرجعي | `bc-250-body.step` *(chat)* | — | [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) |

⭐ = أكثر تفاعلًا قيميًا / أكثر إعادة نشر في المجتمع.

### مزيد من التصاميم العامة (من كتالوج elektricM)

تصاميم مسماة قابلة للتحميل من [كتالوج elektricM ذي الـ 143 تصميمًا](https://elektricm.github.io/amd-bc250-docs/community/cases/) غير المدرجة أعلاه — مُجمَّعة حسب مصدر الطاقة المبنية حوله. تصفّح الكتالوج الكامل لتجميعات Discord-فقط/قيد العمل والصور المصغّرة.

**MeanWell LOP (مصدر طاقة داخلي):**

| العلبة / القطعة | الجدير بالذكر | التحميل |
|---|---|---|
| **Steamboat Case** (yannichaboyer) | كونسول LOP-300 | [MakerWorld 2431616](https://makerworld.com/en/models/2431616) |
| **Ultra-Thin Custom Case** (MrRoze) | LOP-300 نحيف | [Printables 1626501](https://www.printables.com/model/1626501) |
| **Internal PSU 2×140 mm** (Kacikor) | LOP-400، مروحتا 140 | [Printables 1599644](https://www.printables.com/model/1599644) · [MakerWorld 2400574](https://makerworld.com/en/models/2400574) |
| **Push-Pull Internal 12V PSU** (penzoiders) | دفع-سحب | [MakerWorld 2505974](https://makerworld.com/en/models/2505974) |
| **Shell Case + 40 mm SSD fan** (Munkee915) | إعادة مزج Shell، تبريد SSD | [Printables 1568074](https://www.printables.com/model/1568074) |
| **Noctua Push-Pull Mod** (Janjd) | إعادة مزج Shell | [MakerWorld 2354123](https://makerworld.com/en/models/2354123) |

**MeanWell LRS/UHP (لبنة الخادم الشائعة الأخرى):**

| العلبة / القطعة | الجدير بالذكر | التحميل |
|---|---|---|
| **LRS-350-12 PSU Case** (TARGZ) | صندوق LRS-350 | [Printables 1543979](https://www.printables.com/model/1543979) |
| **BC250 slim case** (C4kew4lk) | UHP-350-12، نحيف | [Printables 1504664](https://www.printables.com/model/1504664) |

**FlexATX — عائلة Arthrimus "Console Style"** (سلالة إعادة مزج كاملة؛ الكونسول النحيف عنصر مجتمعي أساسي):

| العلبة / القطعة | الجدير بالذكر | التحميل |
|---|---|---|
| **Console Style Case v1** (Arthrimus) | الأصلي | [Thingiverse 7165679](https://www.thingiverse.com/thing:7165679) · [MakerWorld 2097988](https://makerworld.com/ko/models/2097988-bc250) |
| **Slim Console Style Case** (Arthrimus) | صيغة نحيفة | [Thingiverse 7172528](https://www.thingiverse.com/thing:7172528) |
| **Slim Console — double-fan mod** (TKXXTH) | مروحة مزدوجة | [Thingiverse 7214884](https://www.thingiverse.com/thing:7214884) |
| **Slim Console — On/Off + Apevia** | مفتاح طاقة | [Thingiverse 7274042](https://www.thingiverse.com/thing:7274042) |

**FlexATX — أخرى:**

| العلبة / القطعة | الجدير بالذكر | التحميل |
|---|---|---|
| **Minimal Case (Toolless)** (chriszf) | بلا براغي | [Printables 1423572](https://www.printables.com/model/1423572) |
| **Minimalist BC-250 Case** (SebastienGau/Gadget) | بسيط | [Printables 1581724](https://www.printables.com/model/1581724) |
| **ADT UT3G eGPU-Inspired** (R0mn) | مظهر eGPU | [Printables 1539301](https://www.printables.com/model/1539301) |
| **"Steam Machine" by MrLarva** | كونسول | [Printables 1618501](https://www.printables.com/model/1618501) · [MakerWorld 2453965](https://makerworld.com/en/models/2453965) · [Thingiverse 7278235](https://www.thingiverse.com/thing:7278235) |
| **Steam Machine** (Pocket Adventures) | كونسول | [MakerWorld 2350219](https://makerworld.com/en/models/2350219) |
| **Steam Machine Slim Console** (MTSquar3D) | نحيف + طقم مروحة vRAM لكسر السرعة | [MakerWorld 2232434](https://makerworld.com/en/models/2232434) · [Thingiverse 7271946](https://www.thingiverse.com/thing:7271946) |
| **ASRock Console Case** (songdawgdesigns) | كونسول | [Printables 1617023](https://www.printables.com/model/1617023) · [Cults3D](https://cults3d.com/en/3d-model/gadget/asrock-amd-bc-250-console-case-steamos-bazzite-diy-steam-machine-style-build) |
| **AMD BC250 Case** (vitamins) | كونسول | [MakerWorld 2219947](https://makerworld.com/en/models/2219947) |
| **E-waste Steam Machine** (Pesen333) | بناء استصلاح | [Thingiverse 7245584](https://www.thingiverse.com/thing:7245584) |

**ATX كامل:**

| العلبة / القطعة | الجدير بالذكر | التحميل |
|---|---|---|
| **Case for Standard ATX** (CatSiewDai) | صندوق ATX | [Printables 1553599](https://www.printables.com/model/1553599) |
| **ATX + Fan Duct** (ZMASLO) | بمجرى هواء | [Printables 1616167](https://www.printables.com/model/1616167) |
| **Dual Fan ATX Case** (Mateo Fdez) | مروحة مزدوجة | [Printables 1579658](https://www.printables.com/model/1579658) |
| **Simple Wooden Case** (suvalle55) | خشب + ATX | [Printables 1595794](https://www.printables.com/model/1595794) |
| **Open Frame + IKEA hack** (GreatApo) | إطار مفتوح | [Thingiverse 7314188](https://www.thingiverse.com/thing:7314188) |
| **Case for ATX PSU** (matmiak) | صندوق ATX | [Thingiverse 7303096](https://www.thingiverse.com/thing:7303096) |

**TFX / VESA / جاهز:**

| العلبة / القطعة | الجدير بالذكر | التحميل |
|---|---|---|
| **Case Remix for TFX** (PlayNation) | مصدر TFX-400 | [MakerWorld 2387157](https://makerworld.com/en/models/2387157) |
| **VESA 100/75 Basket** (Oleksii) | تثبيت خلف شاشة | [MakerWorld 1844470](https://makerworld.com/en/models/1844470) |
| **3.9L MKII FlexATX + PS5 fan** (FitFormSolutions) | اشترِ طقمًا جاهزًا | [Etsy](https://www.etsy.com/listing/4405362103/) · [eBay](https://www.ebay.com/itm/127460591552) |
| **Shiny Snake S400** (ITX شبكي 10.8 L) | مضيف جاهز معروف الجودة (مثبت BC-250→AM4 + H60 AIO في حجرة مصدر الطاقة + درع I/O مخصص بـ ATX) | [AliExpress](https://a.aliexpress.com/_EyQdoBU) |
| **SFX-PSU minimalist case** (Methsman) | مصدر SFX كامل، ألواح مغناطيسية، محور USB، AXP120 + Noctua 120 — *الملفات قيد العمل / لم تُطلَق بعد* | — |
| **Cults3D ATX/server line** (KABANCHYK، lumstudio، kapa3D) | STL مدفوعة | [Cults3D — bc-250](https://cults3d.com/en/3d-model/gadget/bc-250-atx-case) |

---

## لا طابعة؟ خيارات يستخدمها الناس

- **اشترِ طبعة.** يوجد بائعون على [Etsy](https://www.etsy.com/listing/1904632447/) و eBay و OLX؛ كما عرض أشخاص طباعة/بيع علب في الدردشة ([src](https://t.me/c/2424231195/55507)).
- **الطباعة عند الطلب:** ارفع STL إلى خدمة. يدير بُناة في الدردشة مزارع طباعة (أحدهم يُظهر جدارًا من طابعات Flsun/Creality/Bambu، [src](https://t.me/c/2424231195/73481)).
- **بلا علبة إطلاقًا / إعادة توظيف.** يشغّل كثيرون اللوحة على منضدة مفتوحة أثناء الاختبار. آخرون يفرغون عتادًا قائمًا: حاسوب متكامل قديم بُزرِعت فيه اللوحة مع نافخة ([src](https://t.me/c/2424231195/30914))، صندوق مجرى تهوية ([src](https://t.me/c/2424231195/64265))، أو علب مكبرات ألمنيوم (تحتاج بردًا/ثقبًا، [src](https://t.me/c/2424231195/108907)). حتى أن أحد الأعضاء أخفى اللوحة داخل مشغّل VHS قديم كمزحة ([src](https://t.me/c/2424231195/84106)). **قشرة Xbox One** (JoeyDepDollas): أفرغ Xbox One معطلًا وركّب تجميعة BC-250 كاملة داخله — يبقي المعالج و GPU تحت **60 °C** تحت الحمل؛ الكونسولات المانحة المعطلة تكلف **~$15 مع الشحن** على eBay وتقدّم قطعًا قابلة لإعادة الاستخدام.
- **خشب رقائقي مقطوع بالليزر** (ContributionRich3242): ليس مطبوعًا ثلاثي الأبعاد — خشب رقائقي مثني بشقّ الكيرف حول الزوايا بمساحة خلفية كبيرة لتبريد إضافي، يبلغ **75 °C عند 40 CU** (1800 MHz، المعالج 3.9 GHz) وهادئ كالهمس. (ملفات الليزر لم تُطلَق.) **تقنية تبريد اللوحة الخلفية** الخاصة به قابلة لإعادة الاستخدام على أي علبة: معجون حراري من الشريحة→اللوحة الخلفية، معجون من اللوحة الخلفية→المبرّدات الخلفية، وتأمين المبرّدات الخلفية بمسامير شِق نوع-R محكمة في فجوة VRM + شريط Kapton (~20 °C أبرد عند 40 CU).

> لوحة عارية مبرّدة جيدًا تتفوق على صندوق جميل مغلق بتدفق هواء سيئ. أتقن [التبريد](04-cooling.md) أولًا؛ العلبة هي الخطوة الثانية.

---

## المصادر

- عرض **#BC250body** المنسّق (بناء جيد واحد يوميًا) — فكرة مثبتة [src](https://t.me/c/2424231195/79685)
- الجِراب الأدنى، صيغتان — [src](https://t.me/c/2424231195/10743) · النماذج على [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) [src](https://t.me/c/2424231195/18260)
- Shell Case (❤33) — [src](https://t.me/c/2424231195/22771) · مجاني على Printables/MakerWorld [src](https://t.me/c/2424231195/24505) · دفعة STL [src](https://t.me/c/2424231195/81680)
- "Просто лучший корпус" + قائمة المواد — [src](https://t.me/c/2424231195/79990) · الملفات [src](https://t.me/c/2424231195/79989)
- إطار مفتوح أكريليكي — [src](https://t.me/c/2424231195/114651) · [Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/)
- لوحة تركيب Twin-120، 2200 MHz @ 80 °C — [src](https://t.me/c/2424231195/120606) · الغطاء الموجِّه [src](https://t.me/c/2424231195/121684)
- تصاميم كونسول (صور) — Гослинг/Bazzite [src](https://t.me/c/2424231195/66616) · لوحة متاهة Jhonatan [src](https://t.me/c/2424231195/121274) · شبكة Joglik [src](https://t.me/c/2424231195/126525) · نافذة بيضاوية a m [src](https://t.me/c/2424231195/52955) · Spyrydonov v15 [src](https://t.me/c/2424231195/135995)
- عائلة NexGen3D Steam Machine — [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) · [Redux + شاشة Pi (Reddit)](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)
- نموذج اللوحة المرجعي — [src](https://t.me/c/2424231195/55496) · [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)
- مستودعات علب GitHub — [onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) · [rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure)
- **كتالوج elektricM الكامل للعلب (~143 تصميمًا، قابل للبحث/التصفية)** — [elektricm.github.io/amd-bc250-docs/community/cases](https://elektricm.github.io/amd-bc250-docs/community/cases/)
- Simple Case (MakerWorld 2870270) + دليل البناء الأوكراني — [MakerWorld 2870270](https://makerworld.com/en/models/2870270) · [Old Lamer (YouTube)](https://youtu.be/p5Zd86vFe8w)
- حيلة فتحة وصول مسح CMOS — [4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980)
- قائمة مواد بناء "Steam Machine Pro" المبرّد بالسائل (TEUCER AF 240، Mean Well LOP-600-12، Arctic P12 Pro/P8، مرحّل ESP32، OpenLinkHub/Commander Duo) — [Old Lamer (YouTube)](https://youtu.be/afYhUQFa-AY)

> ملفات STL للأغطية الموجِّهة للمراوح مشتركة مع [التبريد](04-cooling.md). كل ملفات STL/STEP/3MF المستضافة في الدردشة مُرآة تحت `assets/stl/`.
