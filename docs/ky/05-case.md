🌐 Коомчулук котормосу. Англис тилиндеги нуска — чындыктын булагы жана жаңыраак болушу мүмкүн. Ката таптыңызбы? Issue ачыңыз: [English](../en/05-case.md) · [issues](https://github.com/lildebil0/awesome-bc250/issues)

# Корпустар жана 3D басып чыгаруу

> **TL;DR** — BC-250 жылаңач такта катары жөнөтүлөт, ошондуктан дээрлик ар бир адам корпус басып чыгарат. Бирден-бир «туура» корпус жок — коомчулук **ондогон** дизайн чыгарган: тактанын эки жагынан кысып бекитилген минималдуу **муздатуу кожухунан** тартып, көтөрүүчү туткасы, алдыңкы экраны жана RGB менен толук **консоль стилиндеги кутуларга** чейин. Эмнени басып чыгарбаңыз, корпус заводдук такта аткара албаган бир ишти аткарышы керек: **120 mm желдеткичти радиатордун кырларына карай тыгыздоо**, аба алар *аркылуу* өтсүн ([Муздатуу](../en/04-cooling.md) кара). Бул барак — каталог: аты → STL → желдеткичтер → кайдан жүктөө. **Кубат булагын эске ал**: көпчүлүк корпустар белгилүү бир кубат булагын (LOP, Flex/SFX ATX же HP сервер блогу) айланасында долбоорлонгон — өзүңүздө бар [кубат булагына](../en/03-power-supply.md) дал келген корпусту танда.

Бул жердеги «корпус» 20 мүнөттүк иштин ичинде басылган 200 g принттен, авторунан жумалап убакыт талап кылган көп бөлүктүү консолго чейин болот. Жөнөкөйдөн башта; ар дайым кайра басып чыгарсаңыз болот.

> **Жаңымысыз жана ишене албай жатасызбы? [onemorecap кожух/каптал](#tier-1--минималдуу-муздатуу-кожугу-ушундан-башта) корпусун басып чыгар — минималдуу, кесүүчү эч нерсе жок, бир 120 mm желдеткичке туура келет — ошону менен токто.** Төмөнкү каталог терең; иштеп баштоо үчүн аны окуунун кереги жок.

> **Толук тизмени каалайсызбы?** elektricM **~143 дизайндын издөөгө/чыпкалоого болоор каталогун** жүргүзөт (кубат булагынын үй-бүлөсү, жеткиликтүүлүгү, платформасы боюнча чыпкалоо) — төмөндөгү тандалган топтомдон алда канча көп, көптөгөн Discord-эле жана WIP курулмаларын кошкондо. Аны бул жерден кара: **[elektricM — Cases & Enclosures](https://elektricm.github.io/amd-bc250-docs/community/cases/)**. Төмөндөгү тандоолор — баштоого арзыган аталган, ачык жүктөлүүчүлөр.

---

## Коомчулуктун курулмалары

Адамдар чындап эмне басып чыгарганынын даамы — жылаңач ачык капталдан тартып, толук темалуу консолдорго чейин. Бирдей такта, кескин ар башка натыйжалар.

<p align="center">
  <img src="../../assets/img/case-shell.jpg" alt="onemorecap Shell Case: ачык каптал-плита, көтөрүүчү тутка, ачылган жез кырлары, Arctic 120 mm желдеткич" width="60%"><br>
  <sub>Курулма: Дима Ткач · <a href="https://t.me/c/2424231195/22771">булак</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-frame.jpg" alt="Ак алюминий ачык каркас, ичи көрүнүп турат: эки радиатор, борбордогу ак Arctic желдеткич, Flex кубат булагы" width="60%"><br>
  <sub>Курулма: Сергей · <a href="https://t.me/c/2424231195/87420">булак</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-orange.jpg" alt="Кызгылт сары жана ак жабык консоль: тешиктүү тор каптал панели жана куюлган көтөрүүчү тутка" width="60%"><br>
  <sub>Курулма: Alexander Susl · <a href="https://t.me/c/2424231195/122822">булак</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-arasaka.jpg" alt="ARASAKA киберпанк темасындагы консоль: ак бет, хром желдеткич торчосу, жашыл акценттер жана буттар" width="60%"><br>
  <sub>Курулма: Maxim Perelygin · <a href="https://t.me/c/2424231195/98072">булак</a></sub>
</p>

---

## Кантип тандоо керек

Сизге кайсы корпус туура келээрин үч суроо чечет:

1. **Кандай кубат булагын колдоносуз?** ([Кубат булагы](../en/03-power-supply.md)) — Meanwell **LOP-300** кичинекей жана көпчүлүк корпустардын *ичинде* жайгашат. **Flex/SFX ATX** кубат булагы чоңураак жана өзүнчө бөлүмгө ээ корпусту талап кылат. Куткарылган **HP/сервер блогуна** «v3/v4 server PSU» корпустары керек. Бул — эң чоң чыпка.
2. **Кандай желдеткич(тер) иштетесиз?** Дээрлик ар бир корпус радиатордун үстүндө **бир 120 mm желдеткичтин** айланасында курулган. Чоңураак курулмалар арткы плитага **экинчи 120 mm** желдеткич кошот (GDDR6 эстутумун муздатуу үчүн, анда [температура сенсору жок](../en/04-cooling.md)) же кубат булагын азыктандырат. Бир нечеси бийиктик тар жерде **140 mm** же **жука** желдеткичтерди колдонот.
3. **Кырларды жукарттыңыз беле?** Көпчүлүк корпустар сиз заводдук **радиатордун кырларын мурунтан эле сүрүп/жонуп** ачканыңызды болжойт ([Муздатуу, Жол A](../en/04-cooling.md) кара). Корпус өзү заводдук муздаткычты оңдобойт — ал желдеткичти жөн гана туура жерде кармап турат.

> **Жаргон, бир жолу:** **STL** = слайсерге жүктөгөн стандарттык 3D-принт тор файлы. **STEP / 3MF** = түзөтүүгө болоор CAD форматтары (дизайнды өзгөрткүңүз келсе ушуларды колдонуңуз). **Кожух / каптал / адаптер** = желдеткичти кырлардан абаны айланта чыгарбай, кырларга тыгыздаган басылган воронка. **Flex / SFX ATX** = кичине форм-факторлуу ПК кубат булактары. **LOP** = коомчулук жактырган Meanwell LOP-300 өнөр жай кубат булагы.

> **💡 CMOS-clear джемперине жетүү тешигин басып чыгар.** VRAM/UMA бөлүштүрүүсүн ар өзгөрткөн сайын **CMOS тазалоо** керек ([BIOS](../en/08-bios.md) кара), ошондуктан джемперди көмгөн жабык корпус долбоорлоо аны кайра-кайра ачууну түшүндүрөт. Кандай гана жабык дизайн болбосун, clear-CMOS джемперинин үстүнө **⌀10 mm жетүү тешигин** калтыр — же, андан да жакшысы, аны куралсыз баштапкы абалга келтирүү үчүн панелге чыккан кичинекей **3-абалдуу которгучту** туташтыр. ([4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980))

---

## Tier 1 — Минималдуу «муздатуу кожугу» (ушундан башта)

Басып чыгара алган эң кичине, эң тез нерсе. Бул **чындыгында корпус эмес** — катуу үйкөлүш менен тактага эки жарымы кысылып отуруучу басылган куртка, 120 mm желдеткичти радиаторго карай кармайт жана абаны багыттайт. **Кесүүчү эч нерсе жок, тактага бурама эмес.** Дима Ткач (долбоордун эң алгачкы курулмачыларынын бири) эки варианты сүрөттөйт — компакттуу жана «кызыгыраак көрүнгөн» — экөө тең **150 W** жүктөмдө **~70 °C** ге жетет, ар бири ~210 g / ~170 g пластик, ал эми кубат булагы туруксуз аба агымында муздак бойдон калат ([булак](https://t.me/c/2424231195/10743)). Анын чечими: *«бул чындыгында корпус эмес, көбүрөөк муздатуу кожугу, бирок эч нерсени кесүүнүн кереги жок, баары абдан катуу отурушта кармалат, жарымдары карама-каршы жактардан салынат.»*

- **Файлдар:** `BC-250-FanSleeves.3mf` ([булак](https://t.me/c/2424231195/10766)), тактанын CAD `bc-250-body.step` ([булак](https://t.me/c/2424231195/18266))
- **Булак репо:** [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) — чатта эң көп сунушталган «текшерилген, басылган, иштеши тастыкталган» минималдуу дизайн ([булак](https://t.me/c/2424231195/18260))
- **Желдеткич:** 1× 120 mm
- **Кубат булагы:** каалаганы — кубат зымы үчүн тешик/кесик бар, ошондуктан LOP *же* тышкы булакты колдонсоңуз болот ([булак](https://t.me/c/2424231195/22950))

---

## Tier 2 — Ачык каркас / «каптал» (такта көрүнүүдө)

Тактаны бир жагынан ороп, радиаторду көрүнгөн калтырган жарым корпустар. Пластикка жеңил, чогултууга оңой, аба агымы жакшы.

### onemorecap «Shell Case» — эталондук курулма

Чаттагы эң көп баалуу реакция алган корпус посту (❤33): тактанын үстүндө **«BC-250»** жана CU-тор үлгүсү менен басылган жалпак каптал-плита, үстү жагына куюлган **көтөрүүчү тутка**, ортодо **жукартылган радиатордун кырлары ачылган**, оң жагына бурамаланган өз кожугундагы 120 mm **Arctic** желдеткич. *«BC-250 SHELL CASE BY ONEMORECAP / ASRock × CMG»* деп белгиленген ([булак](https://t.me/c/2424231195/22771)). Тиешелүү STL топтому чатка бир дамбада жайгаштырылган ([булак](https://t.me/c/2424231195/81672)) жана автор моделдер Printables менен MakerWorld'до акысыз экенин тастыктаган ([булак](https://t.me/c/2424231195/24505)).

- **Файлдар (чат дамбасы):** `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl`, плюс төмөндөгү желдеткич кожухтары ([булак](https://t.me/c/2424231195/81680))
- **Булак:** [GitHub onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case)
- **Желдеткич:** 1× же 2× 120 mm (кожух аркылуу), же 1× 140 mm
- **Кубат булагы:** `Shell_Back_FLEX_ATX` арткы панели **Flex ATX** кубат булагы үчүн кесилген

### Акрил ачык каркас (Владислав)

Ачык **алюминий-жана-акрил** каркас: тунук каптал панелдери менен эки металл учтук-плита, такта тигинен орнотулган, борбордо жукартылган радиатор аркылуу түз үйлөгөн жалгыз **Arctic 120 mm** желдеткич жана ылдыйкы бөлүмдө отурган Flex/SFX кубат булагы ([булак](https://t.me/c/2424231195/114651)). Бул кийинчерээк [r/BC250Gaming'ге «acrylic case» катары](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) кайра жарыяланган дизайн. Сиз кайталай турган бөлүктөр — басылган бекиткичтер; каркастын өзү лазер менен кесилет/даяр сатылат.

- **Желдеткич:** 1× 120 mm (борбор) — арткы плита желдеткичин кошууга орун бар
- **Кубат булагы:** ылдыйкы бөлүмдө Flex / SFX ATX

---

## Tier 3 — Консоль стилиндеги кутулар (толук жабык)

Оюн консоль же кичине NAS өңдүү жабык корпустар. Көбүрөөк пластик жана көбүрөөк басып чыгаруу убактысы, бирок тутка, кубат баскычы, желдетилген панелдер жана кээде экран менен бүткөн продукт.

### «Просто лучший корпус» (Jack Fisher × B1zon) — коомчулуктун сүйүктүүсү

Тандалган **#BC250body** теги астында *«жөн эле эң мыкты корпус»* катары жайгаштырылган, бул материалдардын жарыяланган тизмеси менен толук бүткөн консоль: кубат булагы, желдеткичтер, туташтыргыч, резина буттар, кубат баскычы, бурамалар + бурамалуу салмалар, желдеткич PWM бөлгүчү, «Cyberpunk» стикери жана радиаторду түздөөчү тарак. Кээ бир бөлүктөр чыгарылбай калган жана алмаштыргычтары бар ([булак](https://t.me/c/2424231195/79990)). Дизайн B1zon'дуку, чогултуу Jack Fisher'дики.

- **Файлдар:** `BC250 korpus исправленный.rar` («BC250 корпус, оңдолгон») ([булак](https://t.me/c/2424231195/79989))
- **Желдеткич:** 120 mm (алды) + экинчи желдеткич үчүн PWM бөлгүч
- **Кубат булагы:** ички (LOP-классы)

### Үчтүк-«GPU» алды (Гослинг)

Алдыңкы панели **жасалма видеокарта кожугу** болгон консоль кутусу — RGB менен катар үч тегерек желдеткич кесиги, ошондуктан машина дискреттик GPU өңдүү көрүнөт. BC-250'де **Bazzite 42** иштеп жатканы көрсөтүлгөн ([булак](https://t.me/c/2424231195/66616)). Үч тешик — бир иштеп жаткан желдеткич плюс соруу үстүндөгү косметика.

### Лабиринт-панелдүү ак консоль (Jhonatan)

Кызыктуу **лабиринт/схема үлгүсүндөгү желдетилген каптал панели**, жарык берүүчү (жашыл) металл кубат баскычы жана алдыңкы бетинде толук бийиктиктеги соруу торчосу бар бийик ак куту — чаттагы эң жылмаланган эстетиканын бири ([булак](https://t.me/c/2424231195/121274)).

### Тор-торчолуу мини-мунара (Joglik)

Каптал жана үстүндө тыгыз **чарчы-тор торчосу**, үстүнкү кырында слот/тутка оюгу жана арткы ылдый жагында тегерек зым өткөрүүчү тешиги бар боз тигинен турган мини-мунара. Таза өнөр жай көрүнүшү ([булак](https://t.me/c/2424231195/126525)).

### Овал-терезелүү hi-fi кутусу (a m)

Hi-fi/микротолкундуу мештин алды өңдүү жасалган ак тик бурчтуу корпус: тегерек тор артында желдеткич көрүнгөн чоң **стадион формасындагы тор терезеси**, эки жагында эки тик тор слоту ([булак](https://t.me/c/2424231195/52955)). Автордун кийинки итерациясы көбүктөлгөн PVC ордуна «нагыз пластикка» жылып, тышкы XT-серия кубаты жана RGB кошот ([булак](https://t.me/c/2424231195/128048)).

### Компакттуу консоль (Volodymyr Spyrydonov, «v15»)

Тор каптал соруусу жана киберпанк стилиндеги эмблема менен RGB тилкеси көтөргөн караңгы алды бар кичинекей күмүш-кара консоль кутусу, конок бөлмөсүндөгү машина катары телевизордун жанында отурганы көрсөтүлгөн ([булак](https://t.me/c/2424231195/135995)). Узун ревизиялар тизмесинин бөлүгү (v15/v19/v20 булак сүрөттөрү алгач бөлүшүлгөн).

### BC250 Vented Edition (MaelremremDotXYZ)

**Кырлары ачык** иштетилген минималисттик **FlexATX** консоль, **2145 MHz / 1.1 V** да **~67 °C** кармайт, арткы кубат булагынын өчүргүчү менен. [MakerWorld 2899020](https://makerworld.com/en/models/2899020).

### Stellar 250 (isaacalvex)

Толук **курулма колдонмосу** менен өз алдынча толук консоль: ички сактагыч, **WiFi 6** жана **ESP32 температура дисплейи**. [GitHub isaacalvex/AMD-BC-250-Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide).

### Simple Case for the ASRock AMD BC-250

[YouTube'дагы украин курулма колдонмосунун](https://youtu.be/p5Zd86vFe8w) автору жарыялаган аталган, ачык жүктөлүүчү консоль корпусу — көп бөлүктүү татаалдыксыз бүткөн принтти каалагандар үчүн түз жабык куту. [MakerWorld 2870270](https://makerworld.com/en/models/2870270).

---

## Tier 4 — Чоң курулмалар: ATX кубат булагы, AIO суюк муздатуу, экрандар

Толук өлчөмдүү кубат булагын, суюк муздатууну же интеграцияланган дисплейди каалагандар үчүн.

### NexGen3D «DIY Steam Machine» үй-бүлөсү

Коомчулуктагы **эң көп көрсөтүлгөн 3D долбоору** (7× кайра жарыяланган). Printables'тагы консоль корпустарынын үй-бүлөсү, анын ичинде **суюк муздатылган «Pro»** варианты жана алдына **ички 1080×480 Pi экранын** батырган **«Redux»** басылышы ([Reddit курулма](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)). Кристаллга 120 mm баары-бирде суюк муздаткычты коюу үчүн атайын **AIO бекиткич** модели бар.

- [Printables 1499974 — DIY Steam Machine (база)](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite)
- [Printables 1614131 — Pro суюк муздатылган](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) · [Printables 1649679 — Redux](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) · [Printables 1554003 — AIO бекиткич](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250)
- **Желдеткич/муздатуу:** вариантка жараша 120 mm аба **же** 120 mm AIO
- **Кубат булагы:** LOP версиясы жана ATX версиялары документтештирилген

### «Steam Machine Pro» суюк муздатылган эталондук курулма (Old Lamer)

Видеодо башынан аягына чейин документтештирилген жогорку класстагы, толук суюк муздатылган курулма — эгер AIO машинага толук кеткиңиз келсе, бөлүктөрдү сатып алуу тизмеси катары пайдалуу ([Old Lamer](https://youtu.be/afYhUQFa-AY)). Жарыяланган BOM:

- **AIO:** кристаллда TEUCER AF 240 (240 mm баары-бирде)
- **Кубат булагы:** Mean Well **LOP-600-12** (же кичинерээк вариант катары **LOP-500-12**) — [Кубат булагы](../en/03-power-supply.md) кара
- **Желдеткичтер:** 2× Arctic **P12 Pro** + 1× Arctic **P8**
- **Алыстан кубат:** машинаны алыстан күйгүзүү/өчүрүү үчүн **ESP32 реле тактасы**
- **Программа:** AIO насосун жана желдеткичтерди башкаруу үчүн Linux астында **OpenLinkHub** / **Commander Duo**

---

### Steam Cube — параметрлик тигинен корпус, суу менен муздатылган (иштелип жатат)

**Xbox Series X** форм-факторундагы **толук параметрлик** тигинен корпус, алмаштырылуучу муздак тарап менен **суу-муздатуу-биринчи** долбоорлонгон: суу блогу, **Thermalright AXP90-X47 Full-Copper** же жалгыз **Arctic P12 Max** бирдей бекиткичке бурамаланат. Ал **Sol Diego'нун «Xbox Serie X BC-250 Edition»** эскизинен ([Printables 1748271](https://www.printables.com/model/1748271)) жана так **torassk такта моделинен** ([Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)) өсүп чыккан, андан кийин код катары (build123d) кайра тартылган, ошондуктан ар бир өлчөм — туруктуу тор эмес, сиз кайра дал келтире турган өзгөрмө.

**Габарит жана анын себеби** (текшерилген такта өлчөмүнөн жана [Муздатуудагы](../en/04-cooling.md) жылуулук максаттарынан алынган):

- **~180 × 212 × 380 mm** тигинен мунара — тактанын жанында **240 mm радиаторду тигинен** тургузууга жетишерлик бийик (~277 mm радиатор куралмасы 380 mm бийиктиктин ичине батат).
- **Мор аба агымы** — 120 mm соруу ылдыйда, 120 mm чыгаруу жогоруда, ошондуктан жылуулук түз өйдө чыгат.
- **Активдүү арткы плита милдеттүү, эрктүү эмес** — GDDR6 / VRM тарабында [температура сенсору жок](../en/04-cooling.md), ошондуктан дизайн арткы муздатууну милдеттүү бөлүк катары карайт.
- **Муздатуу максаттары** (дизайн максаттары, ченелген натыйжалар **эмес**): суу кристаллы 40 CU да туруктуу < 60 °C; AXP90 < 75 °C @ 2000 MHz; P12 базасы ~73–78 °C.

> ⚠️ **Статус: дизайн концепциясы, текшерилген принт эмес.** Учурдагы CAD — **параметрлик мейкиндик модели** — бөлүктөр туура өлчөмдө, багытталган жана жайгаштырылган, ал 8 STL + бир STEP экспорттойт — бирок ал **басылган, чогултулган же жылуулук жагынан сыналган эмес**, жана суу блогу ченелген кристалл абалынан эмес, тактанын кутучасынан коюлган. Аны бүткөн корпус эмес, **форк кылуу үчүн баштапкы CAD** катары кара; нагыз принт / дал келүү / жылуулук текшерүүсү — ачык кийинки кадам. Жогорудагы максаттар — максаттар, бенчмарктар эмес.

---

### ATX-кубат булагы корпустары (Victor L., V\ad, server-PSU v3/v4)

Толук **ATX** кубат булагы үчүн: толук ATX кубат булагынын айланасында курулган корпус ([булак](https://t.me/c/2424231195/119293), MakerWorld'ге багытталган), мурунку алгачкы Blender прототиби ([булак](https://t.me/c/2424231195/105570)), жана HDD менен USB-хаб орундары бар Printables/MakerWorld'до жарыяланган **HP/сервер-PSU** линиясы.

- [Printables 1580750 — Case v3, HP server PSU + HDD + USB hub](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) · [MakerWorld 2481620 — Case v4, FlexATX & HP-server PSU](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) · [Printables 1550729 — ATX-PSU Bazzite Box](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box)

### Эки-120 курулмалары (эстутум + кубат булагын муздатуу)

**Эки 120 mm желдеткич** көтөргөн кайра долбоорлонгон бекитүү плитасы — бири тактанын дизайнери ойлогондой арткы плитага (эстутум) багытталган, экинчиси кубат булагын азыктандырат. Алды менен Lian Li P28 желдеткичтери плюс Thermalright C12015 менен автор **оюндарда 80 °C та 2200 MHz** кармайт, ал жерде жалгыз алдыңкы желдеткич жетишсиз болгон ([булак](https://t.me/c/2424231195/120606)). Бул үчүн өзүнчө **`Twin_120mm_Fan_Shroud.stl`** бөлүшүлгөн ([булак](https://t.me/c/2424231195/121684)).

### The Lanboy — алып жүрүүчү аркада / тамак кутусу

Алып жүрүүчү тамак-кутусу-аркада курулмасы: ал **eDisplayPort адаптер тактасы** аркылуу **16″ ноутбук eDP панелин (1920×1200 @ 165 Hz)** иштетет ([AliExpress](https://www.aliexpress.com/item/1005006351527252.html)), USB күчөткүчтө 2× 2″ динамик, баары жалгыз **12 V ATX breakout'тан** азыктанат. [Printables 1746364](https://www.printables.com/model/1746364). eDP-адаптер ыкмасы **каалаган** ноутбук-панел курулмасы үчүн кайра колдонулат.

### BC250-HUD (Bloodyly) — ички статус экраны

**Raspberry Pi Zero 2 үчүн** Qt5/C++ **статус-экран колдомосу** (NexGen3D Redux сыяктуу курулмаларда колдонулат): **USB gadget режиминде 60 FPS**, MangoHud'дан FPS/frametime окуйт, уйку учурунда экранды күңүрттөтүү үчүн желдеткич чыңалуусун сезет жана болбосо Pi'ди тоңдуруп койгон **vc4 kernel патчын камтыйт**. Экран: **8.8″ 1920×480 IPS** (Hannstar HSD088IPW1-A). [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD).

---

## Адаптерлер жана бекиткичтер (толук корпустар эмес)

Бир маселени чечкен кичине басылган бөлүктөр — көбүнчө тактага муздаткыч же желдеткич бекитүү.

- **Желдеткич кожухтары** (желдеткичти кырларга тыгыздайт): `Fan_Shroud_Single_120mm.stl`, `Fan_Shroud_Dual_120mm.stl`, `Fan_Shroud_Single_120mm_Restricted.stl`, `Fan_Shroud_Single_140mm.stl` ([булак](https://t.me/c/2424231195/81673)), `Twin_120mm_Fan_Shroud.stl` ([булак](https://t.me/c/2424231195/121684)). [Муздатуу](../en/04-cooling.md) бөлүмүндө да каталогдоштурулган.
- **Арткы плита / эстутум желдеткич бекиткичтери:** `Backplate.stl` + `backplane-top-fixed.stl` ([булак](https://t.me/c/2424231195/133049)); `bottom_fan_mount.stl`, `top_fan_mount.stl`, `Front-Mount.stl`, `Back-Mount.stl` ([булак](https://t.me/c/2424231195/131189))
- **AM4 муздаткыч адаптерлери** (кристаллга стандарттык CPU муздаткычын бурамалаңыз): `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` ([булак](https://t.me/c/2424231195/9949)). Ошондой эле [Printables 1042228 — BC250→AMD CPU-cooler mount](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount) кара.
- **Жалпы ITX бекиткич** (majzok): каркаска отуруучу эки бөлүктө басылат — BC-250'ни ага бурамалаңыз, андан кийин каркасты **стандарттык ITX аналык такта тешиктери бар каалаган корпуска** бурамалаңыз (DeepCool CH170 PLUS'та сыналган). «Жалпы ITX бекиткич жок» маселесин чечет. Канондук Printables шилтемеси жок — Printables/MakerWorld'дон **«BC-250 ITX Mount»** деп издеңиз.
- **Thermalright AXP90-X53 / AXP120-X67 адаптери** (кристаллда төмөн профилдүү муздаткыч): M3 жиптерин талап кылган басылган бекиткич, муздаткыч/CPU басымы боюнча калыңдык варианттары менен — [Printables 1694793](https://www.printables.com/model/1694793). Ошондой эле [Муздатуу](../en/04-cooling.md) бөлүмүндө.
- **120 mm желдеткич адаптери:** `BC250_FanAdapter_120mm.step` ([булак](https://t.me/c/2424231195/83135)), `cooler adapter v3.0 (1).stl` ([булак](https://t.me/c/2424231195/111091))
- **Так такта моделдери** (ушуларга карай өз корпусуңузду долбоорлоңуз): [Printables 1341336 — так BC-250 такта](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) ([булак](https://t.me/c/2424231195/55496)), [Printables 1103626 — AMD BC250 board](https://www.printables.com/model/1103626-amd-bc250-board)

---

## Каталог таблицасы

*(chat)* деп белгиленген файлдар `assets/stl/` астында чагылдырылган; калгандарынын баары шилтемеленген Printables / MakerWorld / GitHub барагынан жүктөлөт.

| Корпус / бөлүк | Түрү | STL / булак файлдары | Желдеткичтер | Жүктөө |
|---|---|---|---|---|
| **onemorecap муздатуу кожугу** | минималдуу кожух | `BC-250-FanSleeves.3mf` *(chat)* | 1× 120 | [GitHub onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) |
| **onemorecap Shell Case** ⭐ | ачык каптал | `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl` *(chat)* | 1–2× 120 / 1× 140 | [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [GitHub](https://github.com/onemorecap/bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case) |
| **Акрил ачык каркас** (Владислав) | ачык каркас | басылган бекиткичтер *(chat #114651)* | 1× 120 | [Reddit жип](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) |
| **«Просто лучший корпус»** (Jack Fisher × B1zon) | консоль | `BC250 korpus исправленный.rar` *(chat)* | 120 + PWM бөлгүч | [chat #79989](https://t.me/c/2424231195/79989) |
| **Flex кубат булагы үчүн минималдуу корпус** | кичине куту | `minimal-case-...-model_files.zip` *(chat)* | 1× 120 | [Printables 1423572](https://www.printables.com/model/1423572-minimal-case-for-bc250-and-flex-psu) |
| **forgenam корпусу** | консоль | `forgenam-case-bc250-model_files.zip` *(chat)* | 1× 120 | [Printables 1375929](https://www.printables.com/model/1375929-forgenam-case-bc250) |
| **Minimalist 240** | консоль + тутка | `Minimalist 240 Front/Back/Handle.stl` *(chat)* | 120 | [chat #117404](https://t.me/c/2424231195/117404) |
| **M360** | консоль | `M360 Front.stl`, `M360 Back.stl` *(chat)* | 120 | [chat #126566](https://t.me/c/2424231195/126566) |
| **NexGen3D DIY Steam Machine** ⭐ | консоль | Printables файлдары | 1× 120 | [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) |
| **NexGen3D Pro (суюк)** | консоль + AIO | Printables файлдары | 120 AIO | [Printables 1614131](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) |
| **NexGen3D Redux (+экран)** | консоль + 1080×480 экран | Printables файлдары | 1× 120 | [Printables 1649679](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) |
| **NexGen3D AIO бекиткич** | адаптер | Printables файлдары | 120 AIO | [Printables 1554003](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250) |
| **Case v3 — HP server PSU** | консоль + HDD/USB | Printables файлдары | 120 | [Printables 1580750](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) |
| **Case v4 — FlexATX / HP PSU** | консоль | MakerWorld файлдары | 120 | [MakerWorld 2481620](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) |
| **ATX-PSU Bazzite Box** | толук-ATX куту | Printables файлдары | 120 | [Printables 1550729](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box) |
| **ivanov-innokentii корпусу** | консоль | GitHub булактары | 120 | [GitHub ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) |
| **rLapchynski корпусу** | корпус | GitHub булактары | 120 | [GitHub rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure) |
| **BC-250 Scooper** | кожух/чөмүч | Printables файлдары | 120 | [Printables 1282906](https://www.printables.com/model/1282906-bc-250-scooper) |
| **Pitman корпусу** | консоль | Printables файлдары | 120 | [Printables 1570248](https://www.printables.com/model/1570248-amd-bc-250-pitman-case) |
| **Өнөр жай стилиндеги FlexATX** | консоль | `amd_bc_250_industrial_style_case...zip` *(chat)* | 120 (заводдук муздаткыч жок) | [chat #144265](https://t.me/c/2424231195/144265) |
| **The Lanboy** | алып жүрүүчү аркада + 16″ eDP экран | Printables файлдары | 12 V ATX breakout | [Printables 1746364](https://www.printables.com/model/1746364) |
| **BC250 Vented Edition** (MaelremremDotXYZ) | FlexATX консоль, кырлары ачык | MakerWorld файлдары | 120 | [MakerWorld 2899020](https://makerworld.com/en/models/2899020) |
| **Stellar 250** (isaacalvex) | консоль + курулма колдонмосу (WiFi6, ESP32) | GitHub колдонмосу | 120 | [GitHub isaacalvex/...Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide) |
| **Simple Case for the ASRock AMD BC-250** | консоль | MakerWorld файлдары | 120 | [MakerWorld 2870270](https://makerworld.com/en/models/2870270) |
| **BC250-HUD** (Bloodyly) | ички Pi Zero 2 статус экраны | GitHub булактары | — | [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD) |
| **Жалпы ITX бекиткич** (majzok) | адаптер (каалаган ITX корпус) | Printables/MakerWorld'дон изде | — | "BC-250 ITX Mount" |
| **Thermalright AXP90/AXP120 бекиткич** | төмөн профилдүү муздаткыч адаптери | Printables файлдары | төмөн профилдүү мунара | [Printables 1694793](https://www.printables.com/model/1694793) |
| **Эки-120 бекитүү плитасы** | адаптер плитасы | `Twin_120mm_Fan_Shroud.stl` *(chat)* | 2× 120 | [chat #121684](https://t.me/c/2424231195/121684) |
| **Желдеткич кожухтары (120/140)** | кожух | `Fan_Shroud_Single_120mm.stl`, `_Dual_120mm`, `_Single_140mm`, `_120mm_Restricted` *(chat)* | 120 / 140 | [Printables 1339540](https://www.printables.com/model/1339540-yet-another-bc-250-fan-shroud) · [Муздатуу](../en/04-cooling.md) кара |
| **AM4 муздаткыч адаптери** | бекиткич | `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` *(chat)* | мунара/AIO | [Printables 1042228](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount) |
| **Так такта модели** | эталондук CAD | `bc-250-body.step` *(chat)* | — | [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) |

⭐ = коомчулукта эң көп баалуу реакция алган / эң көп кайра жарыяланган.

### Дагы ачык дизайндар (elektricM'дин каталогунан)

Жогоруда тизмеленбеген [elektricM'дин 143-дизайн каталогунан](https://elektricm.github.io/amd-bc250-docs/community/cases/) аталган, жүктөлүүчү дизайндар — алар курулган кубат булагы боюнча топтоштурулган. Discord-эле/WIP курулмалары жана эскиздери үчүн толук каталогду карап чыгыңыз.

**MeanWell LOP (ички кубат булагы):**

| Корпус / бөлүк | Көрүнүктүү | Жүктөө |
|---|---|---|
| **Steamboat Case** (yannichaboyer) | LOP-300 консоль | [MakerWorld 2431616](https://makerworld.com/en/models/2431616) |
| **Ultra-Thin Custom Case** (MrRoze) | жука LOP-300 | [Printables 1626501](https://www.printables.com/model/1626501) |
| **Internal PSU 2×140 mm** (Kacikor) | LOP-400, эки 140 | [Printables 1599644](https://www.printables.com/model/1599644) · [MakerWorld 2400574](https://makerworld.com/en/models/2400574) |
| **Push-Pull Internal 12V PSU** (penzoiders) | push-pull | [MakerWorld 2505974](https://makerworld.com/en/models/2505974) |
| **Shell Case + 40 mm SSD fan** (Munkee915) | Shell remix, SSD муздатуу | [Printables 1568074](https://www.printables.com/model/1568074) |
| **Noctua Push-Pull Mod** (Janjd) | Shell remix | [MakerWorld 2354123](https://makerworld.com/en/models/2354123) |

**MeanWell LRS/UHP (башка кеңири таралган сервер блогу):**

| Корпус / бөлүк | Көрүнүктүү | Жүктөө |
|---|---|---|
| **LRS-350-12 PSU Case** (TARGZ) | LRS-350 куту | [Printables 1543979](https://www.printables.com/model/1543979) |
| **BC250 slim case** (C4kew4lk) | UHP-350-12, жука | [Printables 1504664](https://www.printables.com/model/1504664) |

**FlexATX — Arthrimus «Console Style» үй-бүлөсү** (бүтүндөй remix тукуму; жука консоль — коомчулуктун негизги бөлүгү):

| Корпус / бөлүк | Көрүнүктүү | Жүктөө |
|---|---|---|
| **Console Style Case v1** (Arthrimus) | түпнускасы | [Thingiverse 7165679](https://www.thingiverse.com/thing:7165679) · [MakerWorld 2097988](https://makerworld.com/ko/models/2097988-bc250) |
| **Slim Console Style Case** (Arthrimus) | жука варианты | [Thingiverse 7172528](https://www.thingiverse.com/thing:7172528) |
| **Slim Console — double-fan mod** (TKXXTH) | эки желдеткич | [Thingiverse 7214884](https://www.thingiverse.com/thing:7214884) |
| **Slim Console — On/Off + Apevia** | кубат которгучу | [Thingiverse 7274042](https://www.thingiverse.com/thing:7274042) |

**FlexATX — башка:**

| Корпус / бөлүк | Көрүнүктүү | Жүктөө |
|---|---|---|
| **Minimal Case (Toolless)** (chriszf) | бурамасыз | [Printables 1423572](https://www.printables.com/model/1423572) |
| **Minimalist BC-250 Case** (SebastienGau/Gadget) | минималисттик | [Printables 1581724](https://www.printables.com/model/1581724) |
| **ADT UT3G eGPU-Inspired** (R0mn) | eGPU көрүнүшү | [Printables 1539301](https://www.printables.com/model/1539301) |
| **«Steam Machine» by MrLarva** | консоль | [Printables 1618501](https://www.printables.com/model/1618501) · [MakerWorld 2453965](https://makerworld.com/en/models/2453965) · [Thingiverse 7278235](https://www.thingiverse.com/thing:7278235) |
| **Steam Machine** (Pocket Adventures) | консоль | [MakerWorld 2350219](https://makerworld.com/en/models/2350219) |
| **Steam Machine Slim Console** (MTSquar3D) | жука + OC vRAM желдеткич топтому | [MakerWorld 2232434](https://makerworld.com/en/models/2232434) · [Thingiverse 7271946](https://www.thingiverse.com/thing:7271946) |
| **ASRock Console Case** (songdawgdesigns) | консоль | [Printables 1617023](https://www.printables.com/model/1617023) · [Cults3D](https://cults3d.com/en/3d-model/gadget/asrock-amd-bc-250-console-case-steamos-bazzite-diy-steam-machine-style-build) |
| **AMD BC250 Case** (vitamins) | консоль | [MakerWorld 2219947](https://makerworld.com/en/models/2219947) |
| **E-waste Steam Machine** (Pesen333) | куткаруу курулмасы | [Thingiverse 7245584](https://www.thingiverse.com/thing:7245584) |

**Толук ATX:**

| Корпус / бөлүк | Көрүнүктүү | Жүктөө |
|---|---|---|
| **Case for Standard ATX** (CatSiewDai) | ATX куту | [Printables 1553599](https://www.printables.com/model/1553599) |
| **ATX + Fan Duct** (ZMASLO) | каналдуу | [Printables 1616167](https://www.printables.com/model/1616167) |
| **Dual Fan ATX Case** (Mateo Fdez) | эки желдеткич | [Printables 1579658](https://www.printables.com/model/1579658) |
| **Simple Wooden Case** (suvalle55) | жыгач + ATX | [Printables 1595794](https://www.printables.com/model/1595794) |
| **Open Frame + IKEA hack** (GreatApo) | ачык каркас | [Thingiverse 7314188](https://www.thingiverse.com/thing:7314188) |
| **Case for ATX PSU** (matmiak) | ATX куту | [Thingiverse 7303096](https://www.thingiverse.com/thing:7303096) |

**TFX / VESA / даяр сатылган:**

| Корпус / бөлүк | Көрүнүктүү | Жүктөө |
|---|---|---|
| **Case Remix for TFX** (PlayNation) | TFX-400 кубат булагы | [MakerWorld 2387157](https://makerworld.com/en/models/2387157) |
| **VESA 100/75 Basket** (Oleksii) | монитордун артына бекитүү | [MakerWorld 1844470](https://makerworld.com/en/models/1844470) |
| **3.9L MKII FlexATX + PS5 fan** (FitFormSolutions) | бүткөн топтом сатып ал | [Etsy](https://www.etsy.com/listing/4405362103/) · [eBay](https://www.ebay.com/itm/127460591552) |
| **Shiny Snake S400** (10.8 L тор ITX) | белгилүү-жакшы даяр сатылган хост (BC-250→AM4 бекиткич + кубат булагы бөлүмүндө H60 AIO + ыңгайлаштырылган ATX I/O калканы) | [AliExpress](https://a.aliexpress.com/_EyQdoBU) |
| **SFX-PSU минималисттик корпус** (Methsman) | толук SFX кубат булагы, магнит панелдери, USB хаб, AXP120 + Noctua 120 — *файлдар WIP / али чыга элек* | — |
| **Cults3D ATX/server линиясы** (KABANCHYK, lumstudio, kapa3D) | акылуу STL'дер | [Cults3D — bc-250](https://cults3d.com/en/3d-model/gadget/bc-250-atx-case) |

---

## Принтер жокпу? Адамдар колдонгон варианттар

- **Принт сатып ал.** Сатуучулар [Etsy](https://www.etsy.com/listing/1904632447/), eBay жана OLX'те бар; адамдар чатта да корпус басып чыгарууну/сатууну сунуш кылган ([булак](https://t.me/c/2424231195/55507)).
- **Талап боюнча басып чыгаруу:** STL'ди кызматка жүктө. Чаттагы курулмачылар принт фермаларын иштетет (бирөө Flsun/Creality/Bambu принтерлеринин дубалын көрсөтөт, [булак](https://t.me/c/2424231195/73481)).
- **Эч корпус жок / кайра колдонуу.** Көпчүлүк сыноо учурунда тактаны ачык стендде иштетет. Башкалары даяр аппаратты бузат: тактасы орнотулган жана үрлөгүчү бар эски баары-бирде ПК ([булак](https://t.me/c/2424231195/30914)), желдетүү-канал кутусу ([булак](https://t.me/c/2424231195/64265)) же алюминий күчөткүч корпустары (сүрүү/тешүү керек, [булак](https://t.me/c/2424231195/108907)). Бир мүчө тактаны тамаша катары эски VHS ойноткучтун ичине жашырган ([булак](https://t.me/c/2424231195/84106)). **Xbox One каптал** (JoeyDepDollas): бузук Xbox One'ду бузуп, ичине толук BC-250 курулмасын батыр — жүктөмдө CPU & GPU **60 °C** төмөн кармайт; бузук донор консолдор eBay'де **~$15 жеткирүү менен** жана кайра колдонулуучу бөлүктөрдү берет.
- **Лазер менен кесилген фанера** (ContributionRich3242): 3D-басылган эмес — бурчтардан керф-ийилген фанера, кошумча муздатуу үчүн чоң арткы аянты менен, **40 CU да 75 °C** (1800 MHz, CPU 3.9 GHz) жетет жана күбүрөгөндөй тынч. (Лазер файлдары чыгарылган эмес.) Анын **арткы плита-муздатуу ыкмасы** каалаган корпуста кайра колдонулат: жылуулук замазкасы чип→арткы плита, паста арткы плита→арткы муздаткычтар, жана арткы муздаткычтарды VRM боштугуна катуу R-түрдөгү шплинттер + Kapton лента менен бекит (40 CU да ~20 °C муздагыраак).

> Жакшы муздатылган жылаңач такта аба агымы начар жабык кооз кутудан мыкты иштейт. Адегенде [Муздатууну](../en/04-cooling.md) туура жаса; корпус — экинчи кадам.

---

## Булактар

- Тандалган **#BC250body** көргөзмөсү (күнүнө бир жакшы курулма) — бекитилген идея [булак](https://t.me/c/2424231195/79685)
- Минималдуу кожух, эки вариант — [булак](https://t.me/c/2424231195/10743) · моделдер [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) [булак](https://t.me/c/2424231195/18260)
- Shell Case (❤33) — [булак](https://t.me/c/2424231195/22771) · Printables/MakerWorld'до акысыз [булак](https://t.me/c/2424231195/24505) · STL дамбасы [булак](https://t.me/c/2424231195/81680)
- «Просто лучший корпус» + BOM — [булак](https://t.me/c/2424231195/79990) · файлдар [булак](https://t.me/c/2424231195/79989)
- Акрил ачык каркас — [булак](https://t.me/c/2424231195/114651) · [Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/)
- Эки-120 бекитүү плитасы, 2200 MHz @ 80 °C — [булак](https://t.me/c/2424231195/120606) · кожух [булак](https://t.me/c/2424231195/121684)
- Консоль дизайндары (сүрөттөр) — Гослинг/Bazzite [булак](https://t.me/c/2424231195/66616) · Jhonatan лабиринт панели [булак](https://t.me/c/2424231195/121274) · Joglik тор торчосу [булак](https://t.me/c/2424231195/126525) · a m овал терезеси [булак](https://t.me/c/2424231195/52955) · Spyrydonov v15 [булак](https://t.me/c/2424231195/135995)
- NexGen3D Steam Machine үй-бүлөсү — [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) · [Redux + Pi экран (Reddit)](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)
- Такта эталондук модели — [булак](https://t.me/c/2424231195/55496) · [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)
- GitHub корпус репозиторийлери — [onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) · [rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure)
- **elektricM толук корпус каталогу (~143 дизайн, издөөгө/чыпкалоого болот)** — [elektricm.github.io/amd-bc250-docs/community/cases](https://elektricm.github.io/amd-bc250-docs/community/cases/)
- Simple Case (MakerWorld 2870270) + украин курулма колдонмосу — [MakerWorld 2870270](https://makerworld.com/en/models/2870270) · [Old Lamer (YouTube)](https://youtu.be/p5Zd86vFe8w)
- CMOS-clear жетүү-тешик лайфхагы — [4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980)
- «Steam Machine Pro» суюк муздатылган курулма BOM (TEUCER AF 240, Mean Well LOP-600-12, Arctic P12 Pro/P8, ESP32 реле, OpenLinkHub/Commander Duo) — [Old Lamer (YouTube)](https://youtu.be/afYhUQFa-AY)

> Желдеткич-кожух STL'дери [Муздатуу](../en/04-cooling.md) менен бөлүшүлгөн. Бардык чатта жайгашкан STL/STEP/3MF файлдары `assets/stl/` астында чагылдырылган.
