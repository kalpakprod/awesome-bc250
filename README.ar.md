<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — إنجيل المبتدئين للوحة AMD BC-250" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> إنجيل المبتدئين للوحة **ASRock AMD BC-250** — لوحة APU مشتقة من PlayStation 5 (Cyan Skillfish / Oberon، 6 أنوية Zen 2 + RDNA 2، بذاكرة 16 GB GDDR6) أُعيد توظيفها كمبيوتر مصغّر رخيص لألعاب Linux والذكاء الاصطناعي — آلة Steam منزلية اقتصادية للتركيب الذاتي.

كل ما تحتاجه للانتقال **من لوحة داخل علبة إلى تشغيل الألعاب** — منسَّق من أكثر من 130 ألف رسالة من مجتمع BC-250، ومُرتَّب وفق ما صوّت عليه الناس وثبّتوه، ومدقَّق بمقارنته مع المستودعات المرجعية للمشروع.

🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · **العربية** · [हिन्दी](README.hi.md)

<sub>_مُدار باستمرار · آخر تحديث **أغسطس 2026** · [llms.txt](llms.txt) لوكلاء الذكاء الاصطناعي_</sub>

---

## ❓ إجابات سريعة

- **ما هي لوحة ASRock AMD BC-250؟** لوحة APU مشتقة من PlayStation 5 — 6 أنوية Zen 2 + 24/40 وحدة حوسبة RDNA 2 («Cyan Skillfish»)، بذاكرة 16 GB GDDR6 — تُباع رخيصة كبطاقة تعدين سابقة وأُعيد توظيفها كمبيوتر Linux مصغّر للألعاب والذكاء الاصطناعي، أي آلة Steam منزلية اقتصادية للتركيب الذاتي.
- **كم تكلف؟** حوالي **$60–130** للوحة المجردة؛ والتجميعة الكاملة (مصدر طاقة، مبرّد، SSD) تقترب من **$150–250**. انظر [الشراء](docs/en/02-buying.md).
- **كيف أداؤها في الألعاب؟** تقريبًا **1080p بمعدل 60 FPS** في معظم الألعاب (بمستوى RX 6600) مع FSR / Frame-Gen وكسر سرعة GPU+CPU. انظر [نتائج الألعاب](docs/en/11-gaming.md).
- **أي نظام تشغيل؟** **Linux فقط** لتسريع GPU — Bazzite أو Fedora أو CachyOS أو Arch مع Mesa 25.1+. لا يوجد تعريف GPU لنظام Windows. انظر [إعداد Linux](docs/en/06-linux.md).
- **هل يمكنها تشغيل نماذج LLM؟** نعم — يستخدم llama.cpp / Ollama عبر Vulkan ذاكرة 16 GB GDDR6 كـ VRAM (~30–47 tok/s على النماذج الصغيرة). انظر [الذكاء الاصطناعي / LLM](docs/en/12-ai-llm.md).
- **كيف أبرّدها؟** المبدد الحراري الخادمي الأصلي يخنق الأداء على المكتب؛ رقّق الزعانف وأضف مروحة 120 mm، أو انتقل إلى التبريد المائي. انظر [التبريد](docs/en/04-cooling.md).

---

## ⚡ ابدأ من هنا

لوحة جديدة ولا تعرف شيئًا؟ اتبع المسار الذهبي بالترتيب:

**[docs/ar/00-start-here.md](docs/ar/00-start-here.md)** — اشترِ ← غذِّ بالطاقة ← برِّد ← ثبّت نظام التشغيل ← التعريفات ← كسر السرعة ← العب.

---

## 📈 ماذا يمنحك التعديل فعليًا

كل مقبض في هذه اللوحة يقايض شيئًا. هذه هي الأمور الأربعة المهمة، المستقاة مما قاسه المجتمع — اقرأها قبل أن تومض أي شيء.

<p align="center">
  <img src="assets/diagrams/gpu-clock-tradeoff.svg" width="100%" alt="تردد نواة GPU: مكسب معدل الإطارات (FPS) يرتفع إلى نحو 95% عند 2000 MHz ثم يستوي عندما يحدّه المعالج، بينما يستمر الاستهلاك والحرارة في الصعود إلى 95%. النقطة المثالية حول 2000 MHz، بمكسب إجمالي يقارب +30% FPS.">
</p>

<p align="center">
  <img src="assets/diagrams/undervolt-tradeoff.svg" width="100%" alt="خفض الجهد: ترتفع الكفاءة من 20% إلى 95% مع انخفاض الجهد من 1129 mV إلى 700 mV، بينما يرتفع خطر عدم الاستقرار من 15% إلى 100%. النطاق المستقر للألعاب يتراوح تقريبًا بين 905 و955 mV؛ وتحت 700 mV يقفل GPU نفسه على 1500 MHz.">
</p>

<p align="center">
  <img src="assets/diagrams/cu40-tradeoff.svg" width="100%" alt="فتح 40-CU: ترتفع قوة الحوسبة من 40% إلى 90% بينما ينتقل معدل إطارات الألعاب من 40% إلى 47% فقط، ويصعد الاستهلاك مع عدم الاستقرار من 25% إلى 100%. 38 CU هو الحد الأقصى المستقر النموذجي؛ و40 CU يانصيب يحتاج أكثر من 300 واط وتبريدًا مائيًا متكاملًا (AIO).">
</p>

<p align="center">
  <img src="assets/diagrams/memory-tradeoff.svg" width="100%" alt="ضبط ذاكرة GDDR6: عرض النطاق ومكسب معدل الإطارات لا ينتقلان إلا من 30% إلى 52% بينما يرتفع خطر تعطّل اللوحة نهائيًا من 20% إلى 100%. عند 1950 MHz عادت لوحات وقد تعطّلت نهائيًا.">
</p>

<p align="center">
  <img src="assets/diagrams/power-by-config.svg" width="100%" alt="الاستهلاك المُقاس من الجدار حسب الإعداد: 200 واط عند 38 CU و1200 MHz بجهد 850 mV، و260 واط عند 40 CU و1800 MHz بجهد 860 mV، و310 واط عند 38 CU و1500 MHz، و350 واط عند 40 CU و2000 MHz بجهد 960 mV، مع إضافة 1025 mV واطَين فقط. أفضل نقطة واط/إطار مُبلَّغ عنها هي 40 CU عند 1800 MHz.">
</p>

تلك النقاط الخمس قياسات، لا نموذج: الانتقال من 1800 إلى 2000 MHz يكلف حوالي 90 واط — تقريبًا ما كلفته الـ 600 MHz السابقة — ورفع 960 mV إلى 1025 mV لا يشتري شيئًا سوى 2 واط من الحرارة. عند 350 واط، يفصل مزود طاقة بقدرة 300 واط خلال 30 ثانية، ويحمل خط +12V تيار 26 أمبير.

<details>
<summary>الطاقة في وضع الخمول — لماذا لا يكاد عدّاد الجدار يتحرك</summary>

<p align="center">
  <img src="assets/diagrams/idle-power-tradeoff.svg" width="100%" alt="طاقة الخمول: استهلاك GPU ينخفض من 80 واط إلى 5 واط عبر المنظِّم وخفض الجهد والإيقاف التلقائي، لكن إجمالي الاستهلاك من الجدار ينخفض فقط من 125 واط إلى 110 واط حتى يُسقطه الإيقاف إلى 10 واط.">
</p>

يقلّص المنظِّم وخفض الجهد استهلاك GPU، لكن المعالج وذاكرة GDDR6 يستمران في السحب بغض النظر. وحتى يُفعَّل الإيقاف التلقائي، لا يكاد عدّاد الجدار يلاحظ الأمر. الدفعات عالية التسريب تستقر عند حد أدنى نحو 70–80 واط.

</details>

<sub>بيانات المصدر: [`assets/diagrams/data.json`](assets/diagrams/data.json) · أعد البناء بـ `node assets/diagrams/build.mjs`</sub>

---

## 📚 الدليل

| # | القسم | لأجل |
|---|---------|-----|
| 01 | [ما هي BC-250](docs/en/01-what-is-bc250.md) | المواصفات، الأبعاد، توزيع الأطراف، التوقعات |
| 02 | [دليل الشراء](docs/en/02-buying.md) | أين، السعر، المخاطر، الشراء الجماعي |
| 03 | [مصدر الطاقة](docs/en/03-power-supply.md) | LOP / Flex ATX، توزيع أطراف 8-pin، التوصيل |
| 04 | [التبريد](docs/en/04-cooling.md) | المشتت الحراري، أغطية المروحة، طريقة الاختبار |
| 05 | [العلب والطباعة ثلاثية الأبعاد](docs/en/05-case.md) | كتالوج العلب القابلة للطباعة (STL) |
| 06 | [تعريفات Linux والإعداد](docs/en/06-linux.md) | اختيار التوزيعة، amdgpu، التثبيت |
| 07 | [تعريفات Windows والإعداد](docs/en/07-windows.md) | حالة التعريف، طريقة العمل |
| 08 | [BIOS واستعادة اللوحة المعطوبة](docs/en/08-bios.md) | تعديل BIOS، التحديث، إصلاح العطب |
| 09 | [كسر السرعة وخفض الجهد](docs/en/09-overclock-undervolt.md) | المنظِّم، SMU، فتح 40CU |
| 10 | [دونجلات WiFi وBluetooth](docs/en/10-wifi-bt.md) | الدونجلات التي تعمل فعلًا |
| 11 | [نتائج الألعاب والإعدادات](docs/en/11-gaming.md) | القياسات المرجعية، الضبط لكل لعبة |
| 12 | [الذكاء الاصطناعي / LLM على BC-250](docs/en/12-ai-llm.md) | llama.cpp، ROCm |
| 13 | [macOS / Hackintosh](docs/en/13-macos.md) | الحالة |
| 14 | [العرض والإخراج](docs/en/14-display.md) | DisplayPort، محوّلات DP→HDMI، شاشة مزدوجة |
| 15 | [المحاكاة](docs/en/15-emulation.md) | كل منصة/جهاز، الحالة الواقعية |
| 16 | [USB والموزِّعات والتخزين](docs/en/16-usb-peripherals.md) | الموزِّعات، تعديل 5V، محوّلات M.2 / SATA |
| ❓ | [الأسئلة الشائعة](docs/ar/faq.md) · [استكشاف الأخطاء](docs/ar/troubleshooting.md) | المشكلات الشائعة |

---

## 🔗 موارد رائعة

مشاريع مجتمعية مرجعية، مُرتَّبة وفق كثرة إشارة المجتمع إليها.

### التوثيق
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) — المرجع العتادي الرئيسي (هندسة عكسية)
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [الموقع](https://elektricm.github.io/amd-bc250-docs/) — توثيق مجتمعي شامل (توزيع الأطراف، حسب التوزيعة، استكشاف الأخطاء)
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — توثيق المنظمة
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — التجميعات والسكربتات

### كسر السرعة / خفض الجهد / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — المنظِّم الذي تشغّله معظم التجميعات (يضبط الترددات/الجهد)
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — نسخة معدّلة من oberon-governor مع واجهة رسومية (Linux)
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [نسخة bc250-collective المعدّلة](https://github.com/bc250-collective/cyan-skillfish-governor)
- [rw-r-r-0644/bc250-core-unlock](https://github.com/rw-r-r-0644/bc250-core-unlock) — فتح نواتَي CPU المعطّلتين (القناع الأصلي 0x77؛ وجود قناع 0xB7 يعني نوى تالفة فيزيائيًا — فرضه يؤدي إلى تشوهات وانهيارات)
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — فتح كل وحدات الحوسبة الأربعين (40 CUs)
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### الأدوات والصور الجاهزة
- [redbeard1083/bc250-toolkit](https://github.com/redbeard1083/bc250-toolkit) — إعداد مُدار بالقوائم لـ CachyOS: النواة، منظِّمات CPU/GPU، الـ swap، تحويل ZRAM→ZSWAP، وضبط ACPI والتمهيد
- [62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images](https://github.com/62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images) — صور Bazzite Deck/GNOME/KDE مبنية مسبقًا مع تطبيق تصحيحات BC-250

### التعريفات
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — تعريف GPU لـ Windows (تجريبي، بلا تسريع كامل حتى أوائل 2026)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — تطوير تعريف PSP وGPU
- [DryhoppedIPA/bc250-gfx1013-fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix) — تصحيحات kernel وMesa/RADV لصف حوسبة GPU المعطوب (async compute)؛ ويصلح أيضًا مسار FSR 4 / XeSS 3 INT8
- [MastaG/linux-cachyos-bc250](https://github.com/MastaG/linux-cachyos-bc250) — نواة CachyOS مع انتقاءات (cherry-picks) خاصة بـ BC-250
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — نواة Linux

### BIOS / البرامج الثابتة
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — صور وتعديلات BIOS الأكثر إشارةً إليها
- [TheRetroWeb — قاعدة بيانات BIOS الخاصة بـ BC-250](https://theretroweb.com/bios?itemsPerPage=24&chipsetIds%5B%5D=1990) — نسخ BIOS أصلية، تصفّح/نزّل حسب الإصدار
- [Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script](https://github.com/Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script) — نسخ احتياطي للبرامج الثابتة وتوميض برامج ثابتة مخصصة عبر قوائم
- راجع [docs/en/08-bios.md](docs/en/08-bios.md) للتوميض واستعادة اللوحة المعطوبة

### دونجلات WiFi / BT
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### الذكاء الاصطناعي / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### العلب / الطباعة ثلاثية الأبعاد
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables وMakerWorld — راجع [docs/en/05-case.md](docs/en/05-case.md)

---

## 🤝 المساهمة

هذا مستودع **حيّ**. تُستخرَج المعرفة من دردشة المجتمع عبر خطّ معالجة قابل لإعادة الإنتاج (راجع [CONTRIBUTING.md](CONTRIBUTING.md)) ويُعاد تشغيله على التصديرات الجديدة. طلبات الدمج (PRs) بالتصحيحات والدونجلات الجديدة والعلب الجديدة والأوامر المُتحقَّق منها مُرحَّب بها.

## 📄 الترخيص

التوثيق: [CC-BY-SA-4.0](LICENSE). السكربتات ضمن `assets/scripts/`: MIT. البرامج الثابتة/التعريفات الخارجية المنسوخة تحتفظ بحقوقها الأصلية — راجع [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md).

## 🙏 شكر وتقدير

مجتمع BC-250 بأكمله — راجع **[CREDITS](CREDITS.md)** لأبرز المساهمين الذين جعلوا هذا الدليل ممكنًا. المصدر: *دردشة مجتمع AMD BC-250*. مؤلفو المشروع منسوبون بأسماء مستودعاتهم أعلاه.
