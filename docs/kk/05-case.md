> 🌐 Қауымдастық аудармасы. Ағылшын нұсқасы — шындық көзі әрі жаңарақ болуы мүмкін. Қате таптыңыз ба? Issue ашыңыз: [English](../en/05-case.md) · [issues](https://github.com/lildebil0/awesome-bc250/issues)

# Корпустар және 3D басып шығару

> **TL;DR** — BC-250 жалаңаш тақта түрінде келеді, сондықтан кез келген адам дерлік корпус басып шығарады. Жалғыз «дұрыс» корпус жоқ — қауымдастық **ондаған** дизайн шығарды: тақтаны екі жартысымен қыса салатын минималды **салқындату жеңінен** бастап, тасымалдау тұтқасы, алдыңғы экраны және RGB бар толыққанды **консоль үлгісіндегі қораптарға** дейін. Не басып шығарсаңыз да, корпус стандартты тақта істей алмайтын бір жұмысты атқаруы керек: **120 мм желдеткішті радиатор қабырғаларына нығыздау**, сонда ауа олардың *арасынан* өтеді (қараңыз: [Салқындату](04-cooling.md)). Бұл бет — каталог: атауы → STL → желдеткіштер → қайдан жүктеу. **PSU-ды есте сақтаңыз**: корпустардың көбі нақты бір қуат көзіне (LOP, Flex/SFX ATX немесе HP сервер брикі) арналған — өзіңізде бар [PSU](03-power-supply.md)-ға сай корпусты таңдаңыз.

Мұндағы «корпус» 20 минуттық жұмысты талап ететін 200 г баспадан бастап, авторы апталар бойы жасаған көп бөлікті консольге дейін болуы мүмкін. Қарапайымнан бастаңыз; әрқашан қайта басып шығаруға болады.

> **Жаңасыз әрі сенімсізсіз бе? [onemorecap sleeve/shell](#tier-1--minimal-cooling-sleeve-start-here) корпусын басып шығарыңыз — минималды, кесетін ештеңесі жоқ, бір 120 мм желдеткішке сай — әрі сонымен тоқтаңыз.** Төмендегі каталог терең; бастау үшін оны оқудың қажеті жоқ.

> **Толық тізім керек пе?** elektricM **~143 дизайнның іздеуге әрі сүзгілеуге болатын каталогын** жүргізеді (PSU тұқымдасы, қолжетімділігі, платформасы бойынша сүзіңіз) — төмендегі сұрыпталған жинақтан әлдеқайда мол, оның ішінде көптеген тек-Discord және WIP билдтер. Оны мына жерден қараңыз: **[elektricM — Cases & Enclosures](https://elektricm.github.io/amd-bc250-docs/community/cases/)**. Төмендегі таңдаулылар — бастауға тұрарлық, аты аталған, көпшілікке жүктеуге ашық дизайндар.

---

## Қауымдастық билдтері

Адамдар шынымен басып шығарғанның дәмін татыңыз — жалаңаш ашық қаптамадан бастап толық тақырыпталған консольдерге дейін. Бір тақта, мүлдем әртүрлі нәтижелер.

<p align="center">
  <img src="../../assets/img/case-shell.jpg" alt="onemorecap Shell Case: ашық бүйір тақтасы, тасымалдау тұтқасы, ашық мыс қабырғалар, Arctic 120 мм желдеткіш" width="60%"><br>
  <sub>Билд авторы: Дима Ткач · <a href="https://t.me/c/2424231195/22771">дереккөз</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-frame.jpg" alt="Ішкі бөлшектері көрінетін ақ алюминий ашық қаңқа: қос радиатор, ортада ақ Arctic желдеткіші, Flex PSU" width="60%"><br>
  <sub>Билд авторы: Сергей · <a href="https://t.me/c/2424231195/87420">дереккөз</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-orange.jpg" alt="Тесікті торлы бүйір панелі мен құйма тасымалдау тұтқасы бар қызғылт-сары мен ақ түсті жабық консоль" width="60%"><br>
  <sub>Билд авторы: Alexander Susl · <a href="https://t.me/c/2424231195/122822">дереккөз</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-arasaka.jpg" alt="ARASAKA киберпанк тақырыбындағы консоль: ақ беті, хром желдеткіш торы, жасыл акценттер мен аяқтар" width="60%"><br>
  <sub>Билд авторы: Maxim Perelygin · <a href="https://t.me/c/2424231195/98072">дереккөз</a></sub>
</p>

---

## Қалай таңдау керек

Қай корпус сізге сай келетінін үш сұрақ шешеді:

1. **Қандай PSU қолданасыз?** ([Қуат көзі](03-power-supply.md)) — Meanwell **LOP-300** шағын әрі корпустардың көбінің *ішінде* тұрады. **Flex/SFX ATX** PSU үлкенірек әрі арнайы ұясы бар корпусты қажет етеді. Құтқарып алынған **HP/сервер брикі** «v3/v4 server PSU» корпустарын қажет етеді. Бұл — ең негізгі сүзгі.
2. **Қандай желдеткіш(тер) қосасыз?** Корпустардың барлығы дерлік радиатордың үстіндегі **бір 120 мм желдеткішке** арналған. Үлкенірек билдтер артқы тақтаға **екінші 120 мм** желдеткіш қосады (GDDR6 жадын салқындату үшін, оның [температура сенсоры жоқ](04-cooling.md)) немесе PSU-ды үрлейді. Биіктік тар жерлерде бірнешеуі **140 мм** немесе **жұқа** желдеткіш қолданады.
3. **Қабырғаларды жұқарттыңыз ба?** Корпустардың көбі сіз стандартты радиатор қабырғаларын **аршып/тегістеп** ашқансыз деп болжайды (қараңыз: [Салқындату, А жолы](04-cooling.md)). Корпустың өзі стандартты салқындатқышты түзетпейді — ол тек желдеткішті дұрыс жерде ұстайды.

> **Жаргон, бір рет:** **STL** = слайсерге жүктейтін стандартты 3D-баспа тор файлы. **STEP / 3MF** = өңдеуге болатын CAD форматтары (дизайнды өзгерткіңіз келсе, осыларды қолданыңыз). **Shroud / sleeve / adapter** = желдеткіштен ауаны қабырғалардың айналасынан ағызбай, оларға нығыздайтын басып шығарылған шұңғыма. **Flex / SFX ATX** = шағын форм-факторлы ПК қуат көздері. **LOP** = қауымдастық ұнататын Meanwell LOP-300 өнеркәсіптік PSU.

> **💡 CMOS тазалау джемперіне қол жеткізу тесігін басып шығарыңыз.** VRAM/UMA бөлінісін өзгерткен сайын **CMOS тазалауыңыз** керек (қараңыз: [BIOS](08-bios.md)), сондықтан джемперді көміп тастайтын герметикалық корпус жобаласаңыз, оны қайта-қайта ашуыңызға тура келеді. Кез келген жабық дизайнда CMOS тазалау джемперінің үстінде **⌀10 мм қол жеткізу тесігін** қалдырыңыз — немесе одан да жақсысы, оны құралсыз қайта орнатуыңыз үшін кішкентай **3 позициялы ауыстырып-қосқышты** панельге шығарып сымдаңыз. ([4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980))

---

## 1-деңгей — Минималды «салқындату жеңі» (осыдан бастаңыз)

Басып шығаруға болатын ең кішкентай, ең жылдам нәрсе. Бұл **шынында корпус емес** — тақтаға екі жартысымен тығыз үйкеліспен қысыла салатын, 120 мм желдеткішті радиаторға ұстап тұратын әрі ауаны бағыттайтын басып шығарылған күрте. **Кесетін ештеңесі жоқ, тақтаға бұранда жоқ.** Дима Ткач (жобаның ең алғашқы билдерлерінің бірі) екі нұсқаны сипаттайды — шағынын және «көңілдірек көрінетінін» — екеуі де **150 Вт** жүктемеде **~70 °C**-қа жетіп, әрқайсысы ~210 г / ~170 г пластик жұмсайды, ал PSU турбулентті ауа ағынында салқын күйде қалады ([src](https://t.me/c/2424231195/10743)). Оның тұжырымы: *«бұл шынында корпус емес, салқындату жеңіне көбірек ұқсайды, бірақ ештеңені кесудің қажеті жоқ, бәрі өте тығыз үйкеліспен ұсталады, жартылары қарама-қарсы жақтарынан тасталады.»*

- **Файлдар:** `BC-250-FanSleeves.3mf` ([src](https://t.me/c/2424231195/10766)), тақтаның CAD-ы `bc-250-body.step` ([src](https://t.me/c/2424231195/18266))
- **Бастапқы репозиторий:** [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) — чаттағы ең көп ұсынылатын «тексерілген, басып шығарылған, жұмыс істейтіні расталған» минималды дизайн ([src](https://t.me/c/2424231195/18260))
- **Желдеткіш:** 1× 120 мм
- **PSU:** кез келген — қуат сымына арналған тесік/ойық бар, сондықтан LOP *немесе* сыртқы көзді қолдана аласыз ([src](https://t.me/c/2424231195/22950))

---

## 2-деңгей — Ашық қаңқа / «қаптама» (тақта көрнекте)

Тақтаны бір жағынан орап, радиаторды көрінетіндей қалдыратын жарты корпустар. Пластикке жеңіл, құрастыруға оңай, ауа ағыны жақсы.

### onemorecap «Shell Case» — эталондық билд

Чаттағы ең көп құнды реакция жинаған корпус посты (❤33): тақтаның үстіндегі жалпақ бүйір тақтасына **«BC-250»** мен CU-тор өрнегі бедерленген, жоғарғы жағына **тасымалдау тұтқасы** құйылған, ортасында **жұқартылған радиатор қабырғалары ашық** тұрған әрі оң жақ шетіне өз қаптамасымен бұрандаланған 120 мм **Arctic** желдеткіші бар. *«BC-250 SHELL CASE BY ONEMORECAP / ASRock × CMG»* деп белгіленген ([src](https://t.me/c/2424231195/22771)). Сәйкес STL жинағы чатқа бір топпен жарияланды ([src](https://t.me/c/2424231195/81672)), ал автор модельдер Printables пен MakerWorld-та тегін екенін растады ([src](https://t.me/c/2424231195/24505)).

- **Файлдар (чат тобы):** `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl`, плюс төмендегі желдеткіш қаптамалары ([src](https://t.me/c/2424231195/81680))
- **Дереккөз:** [GitHub onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case)
- **Желдеткіш:** 1× немесе 2× 120 мм (қаптама арқылы), немесе 1× 140 мм
- **PSU:** `Shell_Back_FLEX_ATX` артқы панелі **Flex ATX** PSU-ға арналып кесілген

### Акрил ашық қаңқа (Владислав)

Ашық **алюминий-акрил** қаңқа: екі металл шеткі тақта мен мөлдір бүйір панельдер, тігінен орнатылған тақта, ортадағы жұқартылған радиатор арқылы тура үрлейтін жалғыз **Arctic 120 мм** желдеткіш және төменгі ұяда тұрған Flex/SFX PSU ([src](https://t.me/c/2424231195/114651)). Бұл — кейінірек [r/BC250Gaming-ге «acrylic case» ретінде](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) қайта жарияланған дизайн. Басып шығарылған кронштейндер — сіз қайталайтын бөлшектер; қаңқаның өзі лазермен кесілген/дайын күйде сатылады.

- **Желдеткіш:** 1× 120 мм (орталық) — артқы тақта желдеткішін қосуға орын бар
- **PSU:** төменгі ұяда Flex / SFX ATX

---

## 3-деңгей — Консоль үлгісіндегі қораптар (толық жабық)

Ойын консоліне немесе шағын NAS-қа ұқсайтын жабық қаптамалар. Пластик көбірек әрі баспа уақыты ұзағырақ, бірақ тұтқасы, қуат түймесі, желдетілетін панельдері және кейде экраны бар дайын өнім.

### «Просто лучший корпус» (Jack Fisher × B1zon) — қауымдастық сүйіктісі

Сұрыпталған **#BC250body** тегімен *«ең жақсы корпус»* деп жарияланған бұл — жарияланған материалдар тізімі (BOM) бар толық дайын консоль: PSU, желдеткіштер, қосқыш, резеңке аяқтар, қуат түймесі, бұрандалар мен бұрандалы кірістірмелер, желдеткіш PWM сплиттері, «Cyberpunk» жапсырмасы және радиатор түзететін тарақ. Кейбір бөлшектер өндірістен шыққан әрі алмастырғыштары бар ([src](https://t.me/c/2424231195/79990)). Дизайн авторы — B1zon, құрастыруы — Jack Fisher.

- **Файлдар:** `BC250 korpus исправленный.rar` («BC250 корпусы, түзетілген») ([src](https://t.me/c/2424231195/79989))
- **Желдеткіш:** 120 мм (алдыңғы) + екінші желдеткішке PWM сплиттер
- **PSU:** ішкі (LOP-класы)

### Үштік «GPU» беті (Гослинг)

Алдыңғы панелі **жалған видеокарта қаптамасы** болып келетін консоль қорабы — RGB-мен қатарласқан үш дөңгелек желдеткіш ойығы, сондықтан машина дискретті GPU сияқты көрінеді. BC-250-де **Bazzite 42** жұмыс істеп тұрғаны көрсетілген ([src](https://t.me/c/2424231195/66616)). Үш саңылау — жалғыз жұмыс істейтін желдеткіш пен ауа кірісінің үстіндегі декоративтік нәрсе.

### Лабиринт-панельді ақ консоль (Jhonatan)

Көзге түсетін **лабиринт/схема өрнекті желдетілетін бүйір панелі**, жарықтандырылған (жасыл) металл қуат түймесі және алдыңғы бетінде толық биіктіктегі ауа кірісі торы бар биік ақ қорап — чаттағы әсемірек эстетиканың бірі ([src](https://t.me/c/2424231195/121274)).

### Тор-торлы мини-мұнара (Joglik)

Бүйірі мен үстінде тығыз **шаршы-торлы торы** бар, жоғарғы шетінде ойық/тұтқа кесігі және артқы төменгі жағында дөңгелек кабель өткізгіші бар сұр тік мини-мұнара. Таза индустриалды көрініс ([src](https://t.me/c/2424231195/126525)).

### Сопақ-терезелі hi-fi қорабы (a m)

hi-fi/микротолқынды пеш беті стиліндегі ақ тікбұрышты корпус: дөңгелек тордың артында желдеткіш көрінетін үлкен **стадион пішінді тор терезе**, екі тік тор саңылауымен қапталған ([src](https://t.me/c/2424231195/52955)). Автордың кейінгі итерациясы көбіктенген ПВХ орнына «нағыз пластикке» қарай ауысып, сыртқы XT-сериялы қуат пен RGB қосады ([src](https://t.me/c/2424231195/128048)).

### Шағын консоль (Volodymyr Spyrydonov, «v15»)

Тор бүйір ауа кірісі бар, киберпанк стиліндегі эмблема мен RGB жолағы орналасқан қара алдыңғы беті бар шағын күміс-қара консоль қорабы; теледидар жанында тұрған қонақ бөлмесінің машинасы ретінде көрсетілген ([src](https://t.me/c/2424231195/135995)). Ұзақ редакциялар тізбегінің бөлігі (v15/v19/v20 бастапқы суреттері ертерек бөлісілді).

### BC250 Vented Edition (MaelremremDotXYZ)

**Қабырғалары ашық** күйде жұмыс істейтін, **2145 МГц / 1.1 V**-та **~67 °C** ұстайтын, артында PSU өшіру ауыстырғышы бар минималистік **FlexATX** консолі. [MakerWorld 2899020](https://makerworld.com/en/models/2899020).

### Stellar 250 (isaacalvex)

Толық **құрастыру нұсқаулығы** бар толыққанды дербес консоль: ішкі сақтау, **WiFi 6** және **ESP32 температура дисплейі**. [GitHub isaacalvex/AMD-BC-250-Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide).

### ASRock AMD BC-250-ге арналған Simple Case

[YouTube-тегі украин тіліндегі құрастыру нұсқаулығының](https://youtu.be/p5Zd86vFe8w) авторы жариялаған, аты аталған, көпшілікке жүктеуге ашық консоль қаптамасы — көп бөлікті күрделіліксіз дайын баспа алғысы келетіндерге арналған тура жабық қорап. [MakerWorld 2870270](https://makerworld.com/en/models/2870270).

---

## 4-деңгей — Үлкен билдтер: ATX PSU, AIO сұйық салқындату, экрандар

Толық өлшемді PSU, сұйық салқындату немесе кіріктірілген дисплей қалайтындарға.

### NexGen3D «DIY Steam Machine» тұқымдасы

Қауымдастықтағы **ең көп сілтеме жасалатын 3D жобасы** (7× қайта жарияланған). Printables-тегі консоль корпустарының тұқымдасы, оның ішінде **сұйықпен салқындатылатын «Pro»** нұсқасы мен алдыңғы жағына **ішкі 1080×480 Pi экранын** сыйдыратын **«Redux»** басылымы бар ([Reddit билд](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)). Кристаллға 120 мм құрама сұйық салқындатқыш қоюға арналған арнайы **AIO бекіткіші** моделі бар.

- [Printables 1499974 — DIY Steam Machine (базалық)](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite)
- [Printables 1614131 — Pro Liquid-Cooled](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) · [Printables 1649679 — Redux](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) · [Printables 1554003 — AIO mount](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250)
- **Желдеткіш/салқындату:** нұсқасына қарай 120 мм ауа **немесе** 120 мм AIO
- **PSU:** LOP нұсқасы мен ATX нұсқалары құжатталған

### «Steam Machine Pro» сұйықпен салқындатылған эталондық билд (Old Lamer)

Бейнеде басынан аяғына дейін құжатталған жоғары деңгейлі, толық сұйықпен салқындатылған билд — AIO машинасына толық кіріссеңіз, бөлшектердің сатып алу тізімі ретінде пайдалы ([Old Lamer](https://youtu.be/afYhUQFa-AY)). Жарияланған BOM:

- **AIO:** кристаллда TEUCER AF 240 (240 мм құрама)
- **PSU:** Mean Well **LOP-600-12** (немесе шағынырақ нұсқа ретінде **LOP-500-12**) — қараңыз: [Қуат көзі](03-power-supply.md)
- **Желдеткіштер:** 2× Arctic **P12 Pro** + 1× Arctic **P8**
- **Қашықтан қуат:** машинаны қашықтан қосып/өшіруге арналған **ESP32 реле тақтасы**
- **Бағдарламалық қамтым:** AIO сорғысы мен желдеткіштерін басқаруға Linux-та **OpenLinkHub** / **Commander Duo**

---

### Steam Cube — параметрлік тік корпус, сумен салқындатылатын (әзірленуде)

**Xbox Series X** форм-факторындағы **толық параметрлік** тік корпус, **алдымен сумен салқындатуға** арналып, ауыстырылатын суық жағымен жобаланған: су блогы, **Thermalright AXP90-X47 Full-Copper** немесе жалғыз **Arctic P12 Max** — бәрі бір бекіткішке бұрандаланады. Ол **Sol Diego-ның «Xbox Serie X BC-250 Edition»** нобайынан ([Printables 1748271](https://www.printables.com/model/1748271)) және дәл **torassk тақта моделінен** ([Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)) өсіп шықты, содан кейін код түрінде (build123d) қайта сызылды, сондықтан әр өлшем — қайта баптайтын айнымалы, тіркелген тор емес.

**Габариттер мен олардың артындағы пайымдау** (тексерілген тақта өлшемі мен [Салқындату](04-cooling.md)-дағы термиялық мақсаттардан шығарылған):

- **~180 × 212 × 380 мм** тік мұнара — тақта жанына **240 мм радиаторды тігінен** қоюға жеткілікті биік (~277 мм радиатор жинағы 380 мм биіктікке сыяды).
- **Мұржа ауа ағыны** — 120 мм ауа кірісі төменде, 120 мм шығысы жоғарыда, сонда жылу тура жоғары көтеріледі.
- **Белсенді артқы тақта міндетті, қалаулы емес** — GDDR6 / VRM жағында [температура сенсоры жоқ](04-cooling.md), сондықтан дизайн артқы салқындатуды міндетті бөлік ретінде қарастырады.
- **Салқындату мақсаттары** (жоба мақсаттары, өлшенген нәтиже **емес**): су кристалы 40 CU-да тұрақты < 60 °C; AXP90 < 75 °C @ 2000 МГц; P12 базасы ~73–78 °C.

> ⚠️ **Статус: дизайн концепциясы, тексерілген баспа емес.** Қазіргі CAD — **параметрлік кеңістіктік модель** — бөлшектер дұрыс өлшенген, бағдарланған әрі орналастырылған, ол 8 STL + STEP экспорттайды — бірақ ол **басып шығарылмаған, құрастырылмаған әрі термиялық тексерілмеген**, әрі су блогы өлшенген кристалл орны емес, тақтаның қоршау қорабынан орналастырылған. Оны дайын корпус емес, **форк жасайтын бастапқы CAD** ретінде қабылдаңыз; нақты баспа / орнығу / термиялық валидация — алдағы ашық қадам. Жоғарыдағы мақсаттар — мақсаттар, эталондар емес.

---

### ATX-PSU корпустары (Victor L., V\ad, server-PSU v3/v4)

Толық **ATX** қуат көзіне: толыққанды ATX PSU-ға арналған корпус ([src](https://t.me/c/2424231195/119293), MakerWorld-қа бағытталуда), ертерек жасалған алғашқы Blender прототипі ([src](https://t.me/c/2424231195/105570)) және Printables/MakerWorld-та жарияланған, HDD мен USB-хаб орындары бар **HP/сервер-PSU** желісі.

- [Printables 1580750 — Case v3, HP server PSU + HDD + USB hub](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) · [MakerWorld 2481620 — Case v4, FlexATX & HP-server PSU](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) · [Printables 1550729 — ATX-PSU Bazzite Box](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box)

### Қос-120 билдтер (жад + PSU салқындату)

**Екі 120 мм желдеткіш** көтеретін қайта жобаланған бекіту тақтасы — біреуі тақта жасаушысы ойлағандай артқы тақтаға (жадқа) бағытталған, екіншісі PSU-ды қоректендіреді. Алдыңғы жағында Lian Li P28 желдеткіштері мен Thermalright C12015-пен автор ойындарда **2200 МГц-ті 80 °C-та** ұстайды, ал жалғыз алдыңғы желдеткіш жеткіліксіз болды ([src](https://t.me/c/2424231195/120606)). Бұған дербес **`Twin_120mm_Fan_Shroud.stl`** бөлісілген ([src](https://t.me/c/2424231195/121684)).

### The Lanboy — тасымалданатын аркада / түскі ас қорабы

Тасымалданатын түскі-ас-аркада билді: ол **eDisplayPort адаптер тақтасы** ([AliExpress](https://www.aliexpress.com/item/1005006351527252.html)) арқылы **16″ ноутбук eDP панелін (1920×1200 @ 165 Гц)** басқарады, USB күшейткіштегі 2× 2″ динамиктер, бәрі жалғыз **12 V ATX breakout-тан** қоректенеді. [Printables 1746364](https://www.printables.com/model/1746364). eDP-адаптер айласы **кез келген** ноутбук-панель билдінде қайта қолданылады.

### BC250-HUD (Bloodyly) — ішкі статус экраны

**Raspberry Pi Zero 2-ге** арналған Qt5/C++ **статус-экран қосымшасы** (NexGen3D Redux сияқты билдтерде қолданылады): **USB gadget режимінде 60 FPS**, MangoHud-тан FPS/frametime оқиды, ұйқыда экранды күңгірттеу үшін желдеткіш кернеуін сезеді әрі **vc4 ядро патчын қамтиды**, ол болмаса Pi қатып қалады. Экран: **8.8″ 1920×480 IPS** (Hannstar HSD088IPW1-A). [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD).

---

## Адаптерлер мен бекіткіштер (толық корпус емес)

Бір ғана мәселені шешетін кішкентай басып шығарылған бөлшектер — әдетте салқындатқышты немесе желдеткішті тақтаға бекіту.

- **Желдеткіш қаптамалары** (желдеткішті қабырғаларға нығыздайды): `Fan_Shroud_Single_120mm.stl`, `Fan_Shroud_Dual_120mm.stl`, `Fan_Shroud_Single_120mm_Restricted.stl`, `Fan_Shroud_Single_140mm.stl` ([src](https://t.me/c/2424231195/81673)), `Twin_120mm_Fan_Shroud.stl` ([src](https://t.me/c/2424231195/121684)). [Салқындату](04-cooling.md) тарауында да каталогталған.
- **Артқы тақта / жад желдеткіш бекіткіштері:** `Backplate.stl` + `backplane-top-fixed.stl` ([src](https://t.me/c/2424231195/133049)); `bottom_fan_mount.stl`, `top_fan_mount.stl`, `Front-Mount.stl`, `Back-Mount.stl` ([src](https://t.me/c/2424231195/131189))
- **AM4 салқындатқыш адаптерлері** (стандартты CPU салқындатқышын кристаллға бұрандалайды): `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` ([src](https://t.me/c/2424231195/9949)). Сондай-ақ қараңыз: [Printables 1042228 — BC250→AMD CPU-cooler mount](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount).
- **Әмбебап ITX бекіткіші** (majzok): қаңқаға қысыла салатын екі бөлікпен басып шығарылады — BC-250-ні оған бұрандалаңыз, содан кейін қаңқаны **стандартты ITX аналық тақта тесіктері бар кез келген корпусқа** бұрандалаңыз (DeepCool CH170 PLUS-та сыналған). «Әмбебап ITX бекіткіші жоқ» мәселесін шешеді. Канондық Printables сілтемесі тіркелмеген — Printables/MakerWorld-та **«BC-250 ITX Mount»** деп іздеңіз.
- **Thermalright AXP90-X53 / AXP120-X67 адаптері** (кристаллда төмен профильді салқындатқыш): M3 бұрандаларын қажет ететін басып шығарылған бекіткіш, салқындатқыш/CPU қысымы бойынша қалыңдық нұсқаларымен — [Printables 1694793](https://www.printables.com/model/1694793). [Салқындату](04-cooling.md) тарауында да бар.
- **120 мм желдеткіш адаптері:** `BC250_FanAdapter_120mm.step` ([src](https://t.me/c/2424231195/83135)), `cooler adapter v3.0 (1).stl` ([src](https://t.me/c/2424231195/111091))
- **Дәл тақта модельдері** (осыларға қарсы өз корпусыңызды жобалаңыз): [Printables 1341336 — accurate BC-250 board](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) ([src](https://t.me/c/2424231195/55496)), [Printables 1103626 — AMD BC250 board](https://www.printables.com/model/1103626-amd-bc250-board)

---

## Каталог кестесі

*(chat)* деп белгіленген файлдар `assets/stl/` астында айналанған; қалғаны бәрі сілтемеленген Printables / MakerWorld / GitHub бетінен жүктеледі.

| Корпус / бөлшек | Түрі | STL / бастапқы файлдар | Желдеткіштер | Жүктеу |
|---|---|---|---|---|
| **onemorecap cooling sleeve** | минималды жең | `BC-250-FanSleeves.3mf` *(chat)* | 1× 120 | [GitHub onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) |
| **onemorecap Shell Case** ⭐ | ашық қаптама | `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl` *(chat)* | 1–2× 120 / 1× 140 | [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [GitHub](https://github.com/onemorecap/bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case) |
| **Acrylic open frame** (Владислав) | ашық қаңқа | басып шығарылған бекіткіштер *(chat #114651)* | 1× 120 | [Reddit thread](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) |
| **«Просто лучший корпус»** (Jack Fisher × B1zon) | консоль | `BC250 korpus исправленный.rar` *(chat)* | 120 + PWM сплиттер | [chat #79989](https://t.me/c/2424231195/79989) |
| **Minimal case for Flex PSU** | шағын қорап | `minimal-case-...-model_files.zip` *(chat)* | 1× 120 | [Printables 1423572](https://www.printables.com/model/1423572-minimal-case-for-bc250-and-flex-psu) |
| **forgenam case** | консоль | `forgenam-case-bc250-model_files.zip` *(chat)* | 1× 120 | [Printables 1375929](https://www.printables.com/model/1375929-forgenam-case-bc250) |
| **Minimalist 240** | консоль + тұтқа | `Minimalist 240 Front/Back/Handle.stl` *(chat)* | 120 | [chat #117404](https://t.me/c/2424231195/117404) |
| **M360** | консоль | `M360 Front.stl`, `M360 Back.stl` *(chat)* | 120 | [chat #126566](https://t.me/c/2424231195/126566) |
| **NexGen3D DIY Steam Machine** ⭐ | консоль | Printables файлдары | 1× 120 | [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) |
| **NexGen3D Pro (liquid)** | консоль + AIO | Printables файлдары | 120 AIO | [Printables 1614131](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) |
| **NexGen3D Redux (+экран)** | консоль + 1080×480 экран | Printables файлдары | 1× 120 | [Printables 1649679](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) |
| **NexGen3D AIO mount** | адаптер | Printables файлдары | 120 AIO | [Printables 1554003](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250) |
| **Case v3 — HP server PSU** | консоль + HDD/USB | Printables файлдары | 120 | [Printables 1580750](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) |
| **Case v4 — FlexATX / HP PSU** | консоль | MakerWorld файлдары | 120 | [MakerWorld 2481620](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) |
| **ATX-PSU Bazzite Box** | толық-ATX қорап | Printables файлдары | 120 | [Printables 1550729](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box) |
| **ivanov-innokentii case** | консоль | GitHub бастапқы көздері | 120 | [GitHub ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) |
| **rLapchynski enclosure** | қаптама | GitHub бастапқы көздері | 120 | [GitHub rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure) |
| **BC-250 Scooper** | қаптама/қалақ | Printables файлдары | 120 | [Printables 1282906](https://www.printables.com/model/1282906-bc-250-scooper) |
| **Pitman case** | консоль | Printables файлдары | 120 | [Printables 1570248](https://www.printables.com/model/1570248-amd-bc-250-pitman-case) |
| **Industrial-style FlexATX** | консоль | `amd_bc_250_industrial_style_case...zip` *(chat)* | 120 (стандартты салқындатқышсыз) | [chat #144265](https://t.me/c/2424231195/144265) |
| **The Lanboy** | тасымалданатын аркада + 16″ eDP экран | Printables файлдары | 12 V ATX breakout | [Printables 1746364](https://www.printables.com/model/1746364) |
| **BC250 Vented Edition** (MaelremremDotXYZ) | FlexATX консоль, қабырғалары ашық | MakerWorld файлдары | 120 | [MakerWorld 2899020](https://makerworld.com/en/models/2899020) |
| **Stellar 250** (isaacalvex) | консоль + құрастыру нұсқаулығы (WiFi6, ESP32) | GitHub нұсқаулығы | 120 | [GitHub isaacalvex/...Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide) |
| **Simple Case for the ASRock AMD BC-250** | консоль | MakerWorld файлдары | 120 | [MakerWorld 2870270](https://makerworld.com/en/models/2870270) |
| **BC250-HUD** (Bloodyly) | ішкі Pi Zero 2 статус экраны | GitHub бастапқы көздері | — | [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD) |
| **Generic ITX mount** (majzok) | адаптер (кез келген ITX корпус) | Printables/MakerWorld-та іздеңіз | — | "BC-250 ITX Mount" |
| **Thermalright AXP90/AXP120 mount** | төмен профильді салқындатқыш адаптері | Printables файлдары | төмен профильді мұнара | [Printables 1694793](https://www.printables.com/model/1694793) |
| **Twin-120 mount plate** | адаптер тақтасы | `Twin_120mm_Fan_Shroud.stl` *(chat)* | 2× 120 | [chat #121684](https://t.me/c/2424231195/121684) |
| **Fan shrouds (120/140)** | қаптама | `Fan_Shroud_Single_120mm.stl`, `_Dual_120mm`, `_Single_140mm`, `_120mm_Restricted` *(chat)* | 120 / 140 | [Printables 1339540](https://www.printables.com/model/1339540-yet-another-bc-250-fan-shroud) · қараңыз: [Салқындату](04-cooling.md) |
| **AM4 cooler adapter** | бекіткіш | `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` *(chat)* | мұнара/AIO | [Printables 1042228](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount) |
| **Accurate board model** | анықтамалық CAD | `bc-250-body.step` *(chat)* | — | [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) |

⭐ = қауымдастықта ең көп құнды реакция жинаған / ең көп қайта жарияланған.

### Тағы көпшілікке ашық дизайндар (elektricM каталогынан)

[elektricM-нің 143 дизайндық каталогынан](https://elektricm.github.io/amd-bc250-docs/community/cases/) жоғарыда аталмаған, аты аталған, жүктеуге болатын дизайндар — олар арналған PSU бойынша топталған. Тек-Discord/WIP билдтер мен нобайлар үшін толық каталогты қараңыз.

**MeanWell LOP (ішкі PSU):**

| Корпус / бөлшек | Назар аударарлық | Жүктеу |
|---|---|---|
| **Steamboat Case** (yannichaboyer) | LOP-300 консоль | [MakerWorld 2431616](https://makerworld.com/en/models/2431616) |
| **Ultra-Thin Custom Case** (MrRoze) | жұқа LOP-300 | [Printables 1626501](https://www.printables.com/model/1626501) |
| **Internal PSU 2×140 mm** (Kacikor) | LOP-400, қос 140 | [Printables 1599644](https://www.printables.com/model/1599644) · [MakerWorld 2400574](https://makerworld.com/en/models/2400574) |
| **Push-Pull Internal 12V PSU** (penzoiders) | push-pull | [MakerWorld 2505974](https://makerworld.com/en/models/2505974) |
| **Shell Case + 40 mm SSD fan** (Munkee915) | Shell ремиксі, SSD салқындату | [Printables 1568074](https://www.printables.com/model/1568074) |
| **Noctua Push-Pull Mod** (Janjd) | Shell ремиксі | [MakerWorld 2354123](https://makerworld.com/en/models/2354123) |

**MeanWell LRS/UHP (екінші кең тараған сервер брикі):**

| Корпус / бөлшек | Назар аударарлық | Жүктеу |
|---|---|---|
| **LRS-350-12 PSU Case** (TARGZ) | LRS-350 қорабы | [Printables 1543979](https://www.printables.com/model/1543979) |
| **BC250 slim case** (C4kew4lk) | UHP-350-12, жұқа | [Printables 1504664](https://www.printables.com/model/1504664) |

**FlexATX — Arthrimus «Console Style» тұқымдасы** (тұтас ремикс тегі; жұқа консоль — қауымдастық тұрақтысы):

| Корпус / бөлшек | Назар аударарлық | Жүктеу |
|---|---|---|
| **Console Style Case v1** (Arthrimus) | түпнұсқа | [Thingiverse 7165679](https://www.thingiverse.com/thing:7165679) · [MakerWorld 2097988](https://makerworld.com/ko/models/2097988-bc250) |
| **Slim Console Style Case** (Arthrimus) | жұқа нұсқа | [Thingiverse 7172528](https://www.thingiverse.com/thing:7172528) |
| **Slim Console — double-fan mod** (TKXXTH) | қос желдеткіш | [Thingiverse 7214884](https://www.thingiverse.com/thing:7214884) |
| **Slim Console — On/Off + Apevia** | қуат ауыстырғышы | [Thingiverse 7274042](https://www.thingiverse.com/thing:7274042) |

**FlexATX — басқа:**

| Корпус / бөлшек | Назар аударарлық | Жүктеу |
|---|---|---|
| **Minimal Case (Toolless)** (chriszf) | бұрандасыз | [Printables 1423572](https://www.printables.com/model/1423572) |
| **Minimalist BC-250 Case** (SebastienGau/Gadget) | минималистік | [Printables 1581724](https://www.printables.com/model/1581724) |
| **ADT UT3G eGPU-Inspired** (R0mn) | eGPU көрінісі | [Printables 1539301](https://www.printables.com/model/1539301) |
| **«Steam Machine» by MrLarva** | консоль | [Printables 1618501](https://www.printables.com/model/1618501) · [MakerWorld 2453965](https://makerworld.com/en/models/2453965) · [Thingiverse 7278235](https://www.thingiverse.com/thing:7278235) |
| **Steam Machine** (Pocket Adventures) | консоль | [MakerWorld 2350219](https://makerworld.com/en/models/2350219) |
| **Steam Machine Slim Console** (MTSquar3D) | жұқа + OC vRAM желдеткіш жинағы | [MakerWorld 2232434](https://makerworld.com/en/models/2232434) · [Thingiverse 7271946](https://www.thingiverse.com/thing:7271946) |
| **ASRock Console Case** (songdawgdesigns) | консоль | [Printables 1617023](https://www.printables.com/model/1617023) · [Cults3D](https://cults3d.com/en/3d-model/gadget/asrock-amd-bc-250-console-case-steamos-bazzite-diy-steam-machine-style-build) |
| **AMD BC250 Case** (vitamins) | консоль | [MakerWorld 2219947](https://makerworld.com/en/models/2219947) |
| **E-waste Steam Machine** (Pesen333) | қалдықтан билд | [Thingiverse 7245584](https://www.thingiverse.com/thing:7245584) |

**Толық ATX:**

| Корпус / бөлшек | Назар аударарлық | Жүктеу |
|---|---|---|
| **Case for Standard ATX** (CatSiewDai) | ATX қорабы | [Printables 1553599](https://www.printables.com/model/1553599) |
| **ATX + Fan Duct** (ZMASLO) | бағыттаушы каналмен | [Printables 1616167](https://www.printables.com/model/1616167) |
| **Dual Fan ATX Case** (Mateo Fdez) | қос желдеткіш | [Printables 1579658](https://www.printables.com/model/1579658) |
| **Simple Wooden Case** (suvalle55) | ағаш + ATX | [Printables 1595794](https://www.printables.com/model/1595794) |
| **Open Frame + IKEA hack** (GreatApo) | ашық қаңқа | [Thingiverse 7314188](https://www.thingiverse.com/thing:7314188) |
| **Case for ATX PSU** (matmiak) | ATX қорабы | [Thingiverse 7303096](https://www.thingiverse.com/thing:7303096) |

**TFX / VESA / дайын:**

| Корпус / бөлшек | Назар аударарлық | Жүктеу |
|---|---|---|
| **Case Remix for TFX** (PlayNation) | TFX-400 PSU | [MakerWorld 2387157](https://makerworld.com/en/models/2387157) |
| **VESA 100/75 Basket** (Oleksii) | монитор артына бекіту | [MakerWorld 1844470](https://makerworld.com/en/models/1844470) |
| **3.9L MKII FlexATX + PS5 fan** (FitFormSolutions) | дайын жинақ сатып алу | [Etsy](https://www.etsy.com/listing/4405362103/) · [eBay](https://www.ebay.com/itm/127460591552) |
| **Shiny Snake S400** (10.8 L торлы ITX) | белгілі-жақсы дайын хост (BC-250→AM4 бекіткіші + PSU ұясында H60 AIO + арнайы ATX I/O қалқаны) | [AliExpress](https://a.aliexpress.com/_EyQdoBU) |
| **SFX-PSU minimalist case** (Methsman) | толық SFX PSU, магнит панельдер, USB хаб, AXP120 + Noctua 120 — *файлдар WIP / әлі шықпаған* | — |
| **Cults3D ATX/server line** (KABANCHYK, lumstudio, kapa3D) | ақылы STL-дер | [Cults3D — bc-250](https://cults3d.com/en/3d-model/gadget/bc-250-atx-case) |

---

## Принтер жоқ па? Адамдар қолданатын нұсқалар

- **Баспаны сатып алыңыз.** Сатушылар [Etsy](https://www.etsy.com/listing/1904632447/), eBay және OLX-те бар; адамдар чатта да корпус басып шығаруды/сатуды ұсынды ([src](https://t.me/c/2424231195/55507)).
- **Сұраныс бойынша баспа:** STL-ді қызметке жүктеңіз. Чаттағы билдерлер баспа фермаларын жүргізеді (біреуі Flsun/Creality/Bambu принтерлерінің қабырғасын көрсетеді, [src](https://t.me/c/2424231195/73481)).
- **Корпус мүлдем жоқ / қайта мақсаттау.** Көбісі тестілеу кезінде тақтаны ашық стендте жұмыс істетеді. Басқалары қолда бар құрылғыларды ішінен босатады: тақта имплантталған әрі үрлегіші бар ескі моноблок ПК ([src](https://t.me/c/2424231195/30914)), желдету каналының қорабы ([src](https://t.me/c/2424231195/64265)) немесе алюминий күшейткіш қаптамалары (аршу/бұрғылау қажет, [src](https://t.me/c/2424231195/108907)). Бір қатысушы әзіл ретінде тақтаны ескі VHS ойнатқыштың ішіне де жасырды ([src](https://t.me/c/2424231195/84106)). **Xbox One қабығы** (JoeyDepDollas): сынған Xbox One-ды ішінен босатып, ішіне толыққанды BC-250 билдін орнатыңыз — жүктеме кезінде CPU мен GPU-ды **60 °C**-тан төмен ұстайды; сынған донор консольдер eBay-де **~$15 жеткізумен** жүреді әрі қайта қолданылатын бөлшектер береді.
- **Лазермен кесілген фанера** (ContributionRich3242): 3D-басылмаған — бұрыштарда кертіктеп майыстырылған фанера, артында қосымша салқындатуға арналған үлкен аумақпен, 40 CU-да **75 °C**-қа жетіп (1800 МГц, CPU 3.9 ГГц) әрі сыбырдай тыныш. (Лазер файлдары шықпады.) Оның **артқы тақтаны салқындату техникасы** кез келген корпуста қайта қолданылады: чип→артқы тақта термопаста, артқы тақта→артқы салқындатқыштар паста, әрі артқы салқындатқыштарды VRM саңылауындағы тығыз R-типті серіппелі штифтермен + Kapton таспасымен бекіту (40 CU-да ~20 °C салқынырақ).

> Жалаңаш, жақсы салқындатылған тақта нашар ауа ағыны бар жабық әдемі қораптан асып түседі. Алдымен [Салқындатуды](04-cooling.md) дұрыс жасаңыз; корпус — екінші қадам.

---

## Дереккөздер

- Сұрыпталған **#BC250body** көрме (күніне бір жақсы билд) — бекітілген идея [src](https://t.me/c/2424231195/79685)
- Минималды жең, екі нұсқа — [src](https://t.me/c/2424231195/10743) · модельдер [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) [src](https://t.me/c/2424231195/18260)
- Shell Case (❤33) — [src](https://t.me/c/2424231195/22771) · Printables/MakerWorld-та тегін [src](https://t.me/c/2424231195/24505) · STL тобы [src](https://t.me/c/2424231195/81680)
- «Просто лучший корпус» + BOM — [src](https://t.me/c/2424231195/79990) · файлдар [src](https://t.me/c/2424231195/79989)
- Акрил ашық қаңқа — [src](https://t.me/c/2424231195/114651) · [Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/)
- Қос-120 бекіту тақтасы, 2200 МГц @ 80 °C — [src](https://t.me/c/2424231195/120606) · қаптама [src](https://t.me/c/2424231195/121684)
- Консоль дизайндары (фото) — Гослинг/Bazzite [src](https://t.me/c/2424231195/66616) · Jhonatan лабиринт панелі [src](https://t.me/c/2424231195/121274) · Joglik тор-тор [src](https://t.me/c/2424231195/126525) · a m сопақ терезе [src](https://t.me/c/2424231195/52955) · Spyrydonov v15 [src](https://t.me/c/2424231195/135995)
- NexGen3D Steam Machine тұқымдасы — [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) · [Redux + Pi экраны (Reddit)](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)
- Тақтаның анықтамалық моделі — [src](https://t.me/c/2424231195/55496) · [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)
- GitHub корпус репозиторийлері — [onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) · [rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure)
- **elektricM толық корпус каталогы (~143 дизайн, іздеуге/сүзгілеуге болады)** — [elektricm.github.io/amd-bc250-docs/community/cases](https://elektricm.github.io/amd-bc250-docs/community/cases/)
- Simple Case (MakerWorld 2870270) + украин тіліндегі құрастыру нұсқаулығы — [MakerWorld 2870270](https://makerworld.com/en/models/2870270) · [Old Lamer (YouTube)](https://youtu.be/p5Zd86vFe8w)
- CMOS тазалау қол жеткізу тесігінің лайфхагы — [4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980)
- «Steam Machine Pro» сұйықпен салқындатылған билд BOM (TEUCER AF 240, Mean Well LOP-600-12, Arctic P12 Pro/P8, ESP32 реле, OpenLinkHub/Commander Duo) — [Old Lamer (YouTube)](https://youtu.be/afYhUQFa-AY)

> Желдеткіш қаптамасының STL-дері [Салқындату](04-cooling.md) тарауымен ортақ. Чатта орналасқан барлық STL/STEP/3MF файлдар `assets/stl/` астында айналанған.
