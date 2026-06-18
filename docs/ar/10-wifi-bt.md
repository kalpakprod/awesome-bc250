> 🌐 ترجمة مجتمعية. النسخة الإنجليزية هي المرجع الأساسي وقد تكون أحدث. وجدت خطأ؟ افتح issue: [English](../en/10-wifi-bt.md) · https://github.com/lildebil0/awesome-bc250/issues

# دونجلات WiFi وBluetooth

> **باختصار** — لا تملك BC-250 **أي WiFi أو Bluetooth مدمج**، فأنت بحاجة إلى دونجل USB. الخيار الأكثر موثوقية على الإطلاق في الدردشة هو عصا قائمة على **aic8800d80** (مثل *AX90BT / D80MU3*)، مُشغّلة عبر [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) — وهناك وصفة RPM مختبرة على Bazzite. عصيّ **Realtek RTL88xx** (8821au/cu، و8822bu، و8851bu) رخيصة وشائعة لكنها صداع الدردشة رقم 1: تتصل، ثم **تنقطع عشوائيًا تحت الحمل**. يصلح [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) (تعريف معاد نقله/backported) أغلب ذلك لعائلة RTL8821/8822؛ أما عصيّ RTL8851BU/8831BU "AX900 WiFi 6" فتحتاج إلى [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831). إن أردت عصا "تعمل ببساطة" جاهزة، فيُبلّغ المالكون أن سلسلة **Digma DWA-BT5** تفعل ذلك. يتشارك Bluetooth راديو 2.4 GHz، لذا توقّع انخفاض إنتاجية WiFi بينما يكون BT نشطًا.

إن كنت تحتاج الإنترنت للإعداد فقط، فإن **محوّل USB-Ethernet سلكي أو بطاقة الشبكة المدمجة (NIC)** يتجاوز هذه الصفحة بكاملها. لا تلجأ إلى دونجل WiFi/BT إلا حين تحتاج فعلًا إلى لاسلكي أو وحدة تحكّم Bluetooth.

> **عن إيثرنت Realtek RTL8111 المدمج:** إنه مسار المقاومة الأقل، لكن عائلة RTL8111/8168 **غير مستقرة إلى غير موثوقة على Linux** — يُبلَّغ على نطاق واسع أن تعريف `r8169` القياسي يسبّب صعودًا/هبوطًا عشوائيًا للوصلة، وانقطاعات تحت عرض النطاق، وأحيانًا هبوطًا إلى 100 Mbit. التحوّل إلى وحدة `r8168` خارج الشجرة (out-of-tree) هو التخفيف المعتاد. إن أساء المنفذ المدمج التصرّف، فـ**فضّل بطاقة شبكة Intel أو MediaTek بـ USB/PCIe** — فتعريفاتها على Linux أكثر موثوقية بكثير. ([Intel/MediaTek مقابل Realtek فجوة موثوقية قائمة منذ زمن طويل على Linux](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)) ⚠ عدم استقرار RTL8111 نمط عام على Linux، وليس خاصًّا بـ BC-250 — تحقّق على لوحتك.

---

## الشيء الوحيد الذي يجب فهمه أولًا

تقريبًا كل بلاغ "دونجلي يستمر في الانقطاع" على BC-250 يعود إلى **أمرين، لا إلى العلامة على العلبة**:

1. **طقم الرقائق في الداخل.** الملصق (ASUS، أو TP-Link، أو D-Link…) لا معنى له — ما يهم هو رقاقة Realtek/aic/MediaTek تحت الغلاف. ثلاث عصيّ بعلامات مختلفة قد تحمل الرقاقة نفسها بالضبط وتفشل بالطريقة ذاتها. ([src](https://t.me/c/2424231195/16332))
2. **استقرار/طاقة USB تحت الحمل.** يرى عدة مستخدمين عصا تعمل جيدًا في حالة الخمول/التصفّح ثم **تنقطع لحظة ارتفاع حركة البيانات** (تنزيل كبير)، "كأن USB لا يستطيع المواكبة." صمدت عصا ASUS لأحد المستخدمين 17 دقيقة لا أكثر قبل أن تنقطع أثناء التنزيل. ([src](https://t.me/c/2424231195/16331)) · ([src](https://t.me/c/2424231195/17319))

إذن: **اختر بطقم الرقائق**، وطابِقه مع تعريف خارج الشجرة مُصان، وإن استمر الانقطاع، فعامله كمشكلة طاقة/إعادة ضبط (راجع [الانقطاعات](#إصلاح-الانقطاعات-العشوائية) أدناه).

> **كيف تجد طقم الرقائق؟** نادرًا ما تطبعه العلب. قبل الشراء، ابحث عن **FCC ID** الخاص بالعصا (المطبوع على الجهاز/الإعلان) على الإنترنت — يكشف الملف الرقاقة الحقيقية. وبعد أن توصّلها، شغّل **`lsusb`** على Linux لرؤية معرّفات المورّد/المنتج وطقم الرقائق.

---

## دونجلات معروفة الجودة

مدقَّقة مقابل مستودعات التعريفات. تعكس "الملاحظات" ما رصده أعضاء الدردشة فعلًا على BC-250.

| طقم الرقائق | عصيّ مثالية (من الدردشة) | مستودع التعريف | ملاحظات |
|---|---|---|---|
| **aic8800d80** (aic8800) | AX90BT / D80MU3 ("AIC device wlan") | [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) | **الأكثر توصية.** وصفة RPM مختبرة على Bazzite؛ WiFi+BT. يظهر أولًا كـ USB-CDROM ثم ينقلب إلى `aic device wlan` بعد `install_setup.sh`. ([src](https://t.me/c/2424231195/120502)) |
| **RTL8821CU / 8821AU** | "свисток" Realtek عام | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | يعمل، لكنه **عرضة لانقطاعات عشوائية** على التعريف القديم داخل النواة. النقل الخلفي من lwfinger مستقر لأغلب الحالات؛ الإصلاح السليم وصل في النواة 6.13–6.14. ([src](https://t.me/c/2424231195/17321)) |
| **RTL8822BU** | عصا ثنائية النطاق غير مسمّاة | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | أحد المالكين: يتصل، ثم **ينقطع كل 5–10 دقائق**. مدعوم في قائمة USB الخاصة بـ rtw88 لكن الموثوقية على BC-250 متقلّبة. ([src](https://t.me/c/2424231195/138512)) |
| **RTL8851BU / 8831BU** | "AX900 WiFi 6 + BT 5.3 بـ 5 دولارات" | [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) | **لم يعمل جاهزًا** — رقاقة WiFi 6 أحدث من أن يدعمها rtw88. تحتاج إلى تعريف `8851bu` المخصّص. ([src](https://t.me/c/2424231195/17320)) |
| **Digma DWA-BT5-AC600C / AC1300E** | Digma USB WiFi+BT | داخل النواة (Realtek) | يُبلَّغ أنه **يعمل جاهزًا** ("اشتغل من أول محاولة")؛ أكّد ذلك أحد مالكي BC-250 في مراجعات المنتج. ([src](https://t.me/c/2424231195/138520)) |

> **مُبلَّغ أنها لا تعمل / مؤلمة:** **RTL8851BU "AX900"** العامة جاهزةً ([src](https://t.me/c/2424231195/17320))؛ **RTL8821cu/8821au** المجرّدة على تعريفات النواة القياسية تنقطع عشوائيًا ([src](https://t.me/c/2424231195/16330))؛ **RTL8822BU** بلا اسم تنقطع كل بضع دقائق ([src](https://t.me/c/2424231195/138512)). استسلم أحد المستخدمين تمامًا وطلب **Edimax EW-7733UnD** بدلًا منها. ([src](https://t.me/c/2424231195/120503))

---

## المسار A — aic8800d80 (موصى به)

هذه هي الرقاقة ذات أنظف قصّة على BC-250. هناك وصفة RPM كاملة على Bazzite ودليل مصغّر كتبه المجتمع.

### Bazzite (rpm-ostree) — بناء RPM

يبني ملف [`bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) للمشرف حزمة RPM سليمة لتصمد التعريف أمام تحديثات الصورة أفضل من `make` خام. مُتحقَّق منه مقابل المستودع:

```bash
# 1. Build deps (then reboot so the overlay is active)
sudo rpm-ostree install rpm-build rpmdevtools dkms
sudo systemctl reboot

# 2. Set up the rpmbuild tree and grab the spec
cd "$HOME"
rpmdev-setuptree
cd "$HOME/rpmbuild/SPECS"
curl -LO -s https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec

# 3. Fetch sources and build
spectool -g -R "$HOME/rpmbuild/SPECS/aic8800d80.spec"
rpmbuild -bs "$HOME/rpmbuild/SPECS/aic8800d80.spec"
sudo rpm-ostree usroverlay
rpmbuild --define "uname $(uname -r)" -bb "$HOME/rpmbuild/SPECS/aic8800d80.spec"

# 4. Install the built RPM and reboot (filename will match your kernel/fedora ver)
sudo rpm-ostree install "$HOME"/rpmbuild/RPMS/x86_64/aic8800d80-*.rpm
sudo systemctl reboot
```

كتب أحد أعضاء الدردشة ([Nurmukhamed](https://github.com/Nurmukhamed/aic8800d80/tree/15a927286788af46529909bc2c14d16ea4241ec0/bazzite)) شرحًا تفصيليًا لتحزيم RPM شكره عليه المجتمع. ([src](https://t.me/c/2424231195/122580))

### دليل مصغّر من المجتمع (مسار "make" السريع)

إن كنت تريد تشغيله *الآن* فحسب ولا تمانع إعادة تشغيله بعد كل إقلاع، فإليك دليل Aqtilek ([src](https://t.me/c/2424231195/120502)):

```bash
# The stick first appears as a fake CD-ROM. Flip it to WiFi mode (ONE TIME):
sudo sh install_setup.sh         # now shows as "aic device wlan"

# Temporarily lift the read-only root (Bazzite/atomic):
sudo rpm-ostree usroverlay

# Clone and build the driver (use the repo's "method 2"):
git clone https://github.com/shenmintao/aic8800d80.git && cd aic8800d80
# …then follow the repo's second install method.
```

> ⚠ **الصمود بعد الإقلاع:** مع مسار `make` الخام، **يُفقَد التعريف عند كل إقلاع** ويجب إعادة تثبيته — يقترح المؤلف سكربت تشغيل تلقائي صغير. ([src](https://t.me/c/2424231195/120502)) مسار RPM أعلاه هو الإصلاح الدائم.

أرشيف البرنامج الثابت/التعريف الذي استخدمه أحد الأعضاء (*AX90BT(D80MU3)*) شُورِك في الدردشة. ([src](https://t.me/c/2424231195/119991)) يوجد مصدر بديل في الأعلى، [`goecho/aic8800_linux_drvier`](https://github.com/goecho/aic8800_linux_drvier)، لكن أحد مستخدمي CachyOS أمضى 6 ساعات ولم يستطع تصريفه (compile) — فضّل `shenmintao` على BC-250. ([src](https://t.me/c/2424231195/82100)) ⚠ تحقّق على توزيعتك.

> **aic8800d80 تنبيهات (من متتبع مشكلات برنامج التشغيل):**
> - يجب أن يتواجد برنامج الفيرموير `fmacfw_8800d80_u02.bin` في `/lib/firmware/aic8800D80/`؛ حيث يؤدي فشل رفع برنامج الفيرموير إلى بقاء الواجهة عالقة في الحالة `DOWN`. ([aic8800d80 #37](https://github.com/shenmintao/aic8800d80/issues/37) · [#10](https://github.com/shenmintao/aic8800d80/issues/10))
> - **Kernel 7.0 / 7.1:** يفشل بناء برنامج التشغيل 1.0.0 تحت DKMS — حيث تغيرت تواقيع `cfg80211_new_sta` / `cfg80211_del_sta` ويتسبب خطأ `-Wimplicit-fallthrough` في فشل التجميع. ابقَ على kernel أقدم أو قم بترقيع المصدر حتى يقوم الـ upstream بتحديثه. ([aic8800d80 #49](https://github.com/shenmintao/aic8800d80/issues/49))
> - **Debian 13 (kernel 6.12.90):** قد تفشل واجهة Wi-Fi في العمل أو في اكتشاف الشبكات. ([aic8800d80 #58](https://github.com/shenmintao/aic8800d80/issues/58))

---

## المسار B — Realtek RTL8821 / RTL8822 (rtw88)

رخيصة ومنتشرة في كل مكان، لكن التعريف داخل النواة على النوى الأقدم **مليء بالعلل وينقطع عشوائيًا**. الإصلاح هو التعريف المعاد نقله خارج الشجرة من `lwfinger/rtw88`. الأوامر الدقيقة التي استخدمها أحد الأعضاء وأكّد استقرارها ([src](https://t.me/c/2424231195/16326)):

```bash
git clone https://github.com/lwfinger/rtw88
cd rtw88
make
sudo make install
sudo make install_fw
```

على إعداد Secure-Boot / DKMS، يوثّق المستودع أيضًا تدفّق `sudo dkms install $PWD` + `mokutil` — راجع [README المستودع](https://github.com/lwfinger/rtw88).

**لماذا يساعد هذا:** الانقطاعات علّة معروفة في التعريف؛ الإصلاح السليم لم يصل إلى الفرع الرئيسي (mainline) إلا في **النواة 6.13–6.14**، وكثير من صور التوزيعات ما زالت تشحن الإصدار المعطوب. يمنحك النقل الخلفي من lwfinger التعريف المُصلَح الآن. ([src](https://t.me/c/2424231195/17321)) تشمل أجزاء USB المدعومة RTL8811AU/CU، وRTL8812AU/BU/CU، وRTL8814AU، وRTL8821AU/CU، وRTL8822BU/CU (القائمة الكاملة في المستودع).

> تحفّظ صادق: حتى مع rtw88، ما زال أحد المستخدمين على RTL8821cu يرى انقطاعات عرضية ("القبّعة نفسها")، والإنتاجية تنخفض بعض الشيء مقابل التعريف القياسي المعطوب-لكن-الأسرع. ([src](https://t.me/c/2424231195/16333)) إن كانت الموثوقية أهم من السعر، فاذهب إلى aic8800d80 أو Digma مؤكَّدة.

---

## المسار C — Realtek RTL8851BU / RTL8831BU ("AX900 WiFi 6")

العصيّ الرخيصة جدًا "AX900 WiFi 6 + Bluetooth 5.3" تستخدم **RTL8851BU/8831BU**، التي **لا** يغطّيها `rtw88`، فتكون ميتة جاهزةً. ([src](https://t.me/c/2424231195/17320)) استخدم التعريف المخصّص [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831):

```bash
git clone https://github.com/biglinux/rtl8831
cd rtl8831
sudo dkms install .        # or: make && sudo make install
sudo modprobe 8851bu
```

⚠ تحقّق — لم يُعرَض بناء هذا المستودع في الدردشة على BC-250؛ الأوامر من README المستودع.

> **مثال مُسمّى من هذه الفئة — TP-Link Archer TX10UB Nano ("AX900 WiFi 6 + BT 5.3").** هذا منتج حقيقي سهل العثور عليه، و**WiFi خاصته يعمل على Linux** — يحمل رقاقة **RTL8851BU**، فيقع تحت المسار C (ستحتاج إلى تعريف `8851bu`/`biglinux/rtl8831`، لا rtw88 القياسي). **لكن Bluetooth خاصته *غير* مدعوم من المورّد على Linux:** تُدرج مواصفات TP-Link نفسها المحوّل كـ Windows 10/11 فقط، وتقول صراحةً إن **وظيفة Bluetooth غير متوافقة مع Mac أو Linux أو التلفاز** ([صفحة منتج TP-Link](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)). لذا عامله بوصفه **"WiFi يعمل على Linux (عبر تعريف 8851bu)؛ BT غير مدعوم من المورّد على Linux."** قد يُشغّل المجتمع Bluetooth خاصته عبر تعريفات Realtek BT العامة، لكن ذلك غير مُتحقَّق منه — **لا تشترِه متوقعًا دونجل WiFi+BT نظيفًا يعمل فور توصيله على Linux.** تبيع **UGreen** أيضًا عصا "AX900" يُبلِّغ المجتمع أنها بديل، لكنها من عائلة RTL8851BU ذاتها — تحقّق من طقم الرقائق، وينطبق تحفّظ BT نفسه. ⚠ تحقّق.

---

## إصلاح الانقطاعات العشوائية

إن اتصلت عصاتك ثم انقطعت (العَرَض الكلاسيكي لـ Realtek-على-BC-250):

1. **ثبّت التعريف الصحيح خارج الشجرة** (المسار B/C) — هذا يحلّ أغلبية الحالات.
2. **أعِد التثبيت / أعِد التوصيل بعد الإقلاع.** بعض العصيّ لا تُكتشف عند الإقلاع البارد وتحتاج إلى فصل-وإعادة-توصيل واحدة. ([src](https://t.me/c/2424231195/16325))
3. **أعِد ضبط الجهاز برمجيًا بدل فصله** — استخدم `usbreset` (لا حاجة لسحبه فيزيائيًا). ([src](https://t.me/c/2424231195/135895)) · [كيفية ذلك (Superuser)](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
4. **جرّب منفذ USB مختلفًا** (يُفضَّل منفذ خلفي / في الموزّع الجذري) — يبدو العَرَض مرتبطًا بالطاقة/عرض النطاق تحت الحمل. ([src](https://t.me/c/2424231195/17319))
5. **أبقِ الدونجل بعيدًا عن USB 3.0.** منافذ USB 3.0 مصدر موثَّق لـ**تشويش ترددات الراديو (RF) عند 2.4 GHz** — تضيف الإشارات عالية السرعة نحو 20 dB من الضوضاء عريضة النطاق عبر 2.4–2.5 GHz لا يمكن لأي مرشّح إزالتها، مما يُضعف WiFi *و*Bluetooth في عقر دارهما. ورقة Intel البيضاء هي المرجع المعتمد. وصّل دونجلات WiFi/BT في **منفذ USB 2.0**، أو استخدم **كابل تمديد USB قصيرًا** لإبعاد الدونجل بضع بوصات عن موصّلات USB 3.0 وأي كابلات DisplayPort/HDMI. ([Intel: تأثير تشويش USB 3.0 الراديوي على أجهزة 2.4 GHz اللاسلكية](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf))

---

## ملاحظات Bluetooth

- عصيّ WiFi+BT المدمجة تتشارك راديو **2.4 GHz**، لذا **تنخفض إنتاجية WiFi بينما يكون Bluetooth نشطًا**. قاس أحد الأعضاء **~150 Mbit مع تشغيل BT مقابل ~190 Mbit مع إطفائه** — حقيقي، لكنه "ليس بهذه الحدّة." ([src](https://t.me/c/2424231195/123366)) · ([src](https://t.me/c/2424231195/123367))
- تعريف aic8800d80 له **فرع `bluetooth` منفصل** لدعم BT. ([فرع المستودع](https://github.com/shenmintao/aic8800d80/tree/bluetooth?tab=readme-ov-file))

- **إذا لم يظهر البلوتوث مطلقًا، فهذا يعني أن برنامج التشغيل العام `btusb` قد استحوذ على الجهاز أولاً.** يحتاج متحكم البلوتوث aic8800 إلى وحدة `aic_btusb` الخاصة به — ولا يمكن لبرنامج `btusb` المدمج في النواة تهيئته. قم بتبديلهما باستخدام `sudo rmmod btusb && sudo modprobe aic_btusb`، أو اجعل هذا التغيير دائمًا عن طريق إضافة `softdep btusb pre: aic_btusb` إلى `/etc/modprobe.d/aic8800-bt.conf`. ([aic8800d80 #53](https://github.com/shenmintao/aic8800d80/issues/53) · [#44](https://github.com/shenmintao/aic8800d80/issues/44))

---

## قائمة شراء مختصرة

إن أردت المسار الأقل خطرًا، بالترتيب:

1. **عصا aic8800d80** (من فئة AX90BT / D80MU3) + وصفة RPM على Bazzite — الأفضل توثيقًا، WiFi+BT.
2. **Digma DWA-BT5-AC600C / AC1300E** — مُبلَّغ أنها تعمل جاهزةً. ([إعلان Ozon](https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/))
3. **عصا RTL8821CU + lwfinger/rtw88** — الأرخص، تقبّل انقطاعات عرضية.
4. تجنّب **RTL8851BU "AX900"** الأرخص ثمنًا إلا إن كنت مستعدًا للقتال مع `biglinux/rtl8831`.

> لا تثق بقول روبوت دردشة ذكاء اصطناعي "أيوه يا صاح، خيار مثالي" بشأن دونجل — فعل أحد الأعضاء ذلك بالضبط، فحصل على RTL8822BU ينقطع كل 5–10 دقائق، ثم قال الروبوت نفسه إنها لن تعمل. اشترِ بطقم الرقائق، المُتحقَّق منه هنا. ([src](https://t.me/c/2424231195/138512))

---

## المصادر

- aic8800d80 Bazzite RPM — [`shenmintao/aic8800d80` `bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) · spec — https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec
- aic8800d80 mini-guide — https://t.me/c/2424231195/120502 · RPM fork — https://t.me/c/2424231195/122580 · firmware zip — https://t.me/c/2424231195/119991
- aic8800 BT branch — https://github.com/shenmintao/aic8800d80/tree/bluetooth · alt repo — https://github.com/goecho/aic8800_linux_drvier (https://t.me/c/2424231195/82100)
- rtw88 build steps — https://t.me/c/2424231195/16326 · backport rationale — https://t.me/c/2424231195/17321 · driver — [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88)
- RTL8851BU AX900 not working — https://t.me/c/2424231195/17320 · driver — [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831)
- Dropout symptom / by-chip-not-brand — https://t.me/c/2424231195/16330 · https://t.me/c/2424231195/16331 · https://t.me/c/2424231195/16332 · https://t.me/c/2424231195/17319
- Digma works OOB — https://t.me/c/2424231195/138520 · listing — https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/
- AI-recommended RTL8822BU drops — https://t.me/c/2424231195/138512 · Edimax escape — https://t.me/c/2424231195/120503
- BT vs WiFi speed — https://t.me/c/2424231195/123366 · usbreset — https://t.me/c/2424231195/135895 · [Superuser how-to](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
- Onboard RTL8111/8168 flaky on Linux; r8168 mitigation, prefer Intel/MediaTek — [LinuxQuestions r8169 vs r8168](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)
- USB 3.0 interferes with 2.4 GHz WiFi/BT (use USB 2.0 / extension) — [Intel white paper](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf)
- TP-Link Archer TX10UB Nano — WiFi works on Linux (RTL8851BU), BT vendor-listed Windows-only / not Linux — [TP-Link product page](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)
