🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · **العربية** · [हिन्दी](README.hi.md)

<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — إنجيل المبتدئين للوحة AMD BC-250" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> إنجيل المبتدئين للوحة **AMD BC-250** — لوحة APU مشتقة من PlayStation 5 (Cyan Skillfish / Oberon، بذاكرة 16 GB GDDR6) أُعيد توظيفها كصندوق رخيص لألعاب Linux والذكاء الاصطناعي.

كل ما تحتاجه للانتقال **من لوحة داخل علبة إلى تشغيل الألعاب** — منسَّق من أكثر من 125 ألف رسالة من مجتمع BC-250، ومُرتَّب وفق ما صوَّت له الناس فعليًا وثبّتوه، ومراجَع بمقارنته مع المستودعات المرجعية للمشروع.

🌍 اللغات: [English](README.md) (الأساسية) · [Русский](README.ru.md) · **العربية**

---

## ⚡ ابدأ من هنا

لوحة جديدة ولا تعرف شيئًا؟ اتبع المسار الذهبي بالترتيب:

**[docs/ar/00-start-here.md](docs/ar/00-start-here.md)** — اشترِ ← غذِّ بالطاقة ← برِّد ← ثبّت نظام التشغيل ← التعريفات ← كسر السرعة ← العب.

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
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — فتح كل وحدات الحوسبة الأربعين (40 CUs)
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### التعريفات
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — تعريف GPU لـ Windows (تجريبي، بلا تسريع كامل حتى أوائل 2026)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — عمل على تعريف PSP/GPU
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — نواة Linux

### BIOS / البرامج الثابتة
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — صور وتعديلات BIOS الأكثر إشارةً إليها
- راجع [docs/en/08-bios.md](docs/en/08-bios.md) للتحديث واستعادة اللوحة المعطوبة

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
