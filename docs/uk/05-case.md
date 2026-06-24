> 🌐 Переклад спільноти. Англійська версія є джерелом істини й може бути новішою. Знайшли помилку? Відкрийте issue: [English](../en/05-case.md) · [issues](https://github.com/lildebil0/awesome-bc250/issues)

# Корпуси та 3D-друк

> **Коротко** — BC-250 постачається голою платою, тож майже всі друкують корпус. Єдиного «правильного» корпусу немає — спільнота випустила **десятки** дизайнів: від мінімального **охолоджувального чохла**, що просто защіпає дві половинки навколо плати, до повноцінних **боксів у стилі консолі** з ручкою для перенесення, переднім екраном і RGB. Що б ви не друкували, корпус має зробити одну роботу, яку штатна плата не може: **притиснути 120-мм вентилятор до ребер радіатора**, щоб повітря йшло *крізь* них (див. [Охолодження](../en/04-cooling.md)). Ця сторінка — каталог: назва → STL → вентилятори → де завантажити. **Зважайте на БЖ**: більшість корпусів спроєктовані під конкретний блок живлення (LOP, Flex/SFX ATX чи серверний блок HP) — обирайте корпус, що пасує до вашого [БЖ](../en/03-power-supply.md).

«Корпус» тут — це від друку на 200 г, що займає 20 хвилин роботи, до багатоскладової консолі, на яку автор витратив тижні. Починайте просто; передрукувати завжди можна.

> **Новачок і не впевнені? Надрукуйте корпус [чохол/оболонка onemorecap](#рівень-1--мінімальний-охолоджувальний-чохол-почніть-звідси) — мінімальний, нічого різати, вміщує один 120-мм вентилятор — і зупиніться на цьому.** Каталог нижче глибокий; читати його, щоб почати, не обов'язково.

> **Потрібен повний список?** elektricM веде **пошуковий, фільтрований каталог із ~143 дизайнів** (фільтр за родиною БЖ, доступністю, платформою) — значно більше за курований набір нижче, включно з багатьма збірками лише з Discord та WIP. Перегляньте його на **[elektricM — Cases & Enclosures](https://elektricm.github.io/amd-bc250-docs/community/cases/)**. Вибірки нижче — це названі, публічно доступні для завантаження, з яких варто почати.

---

## Збірки спільноти

Зразок того, що люди насправді надрукували — від голої відкритої оболонки до повністю тематичних консолей. Та сама плата, шалено різні результати.

<p align="center">
  <img src="../../assets/img/case-shell.jpg" alt="onemorecap Shell Case: відкрита бічна пластина, ручка для перенесення, відкриті мідні ребра, 120-мм вентилятор Arctic" width="60%"><br>
  <sub>Збірка: Дима Ткач · <a href="https://t.me/c/2424231195/22771">джерело</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-frame.jpg" alt="Біла алюмінієва відкрита рама з нутрощами напоказ: два радіатори, центральний білий вентилятор Arctic, БЖ Flex" width="60%"><br>
  <sub>Збірка: Сергей · <a href="https://t.me/c/2424231195/87420">джерело</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-orange.jpg" alt="Помаранчево-біла закрита консоль із перфорованою сітчастою бічною панеллю та формованою ручкою для перенесення" width="60%"><br>
  <sub>Збірка: Alexander Susl · <a href="https://t.me/c/2424231195/122822">джерело</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-arasaka.jpg" alt="Консоль у кіберпанк-стилі ARASAKA: біле обличчя, хромована решітка вентилятора, зелені акценти й ніжки" width="60%"><br>
  <sub>Збірка: Maxim Perelygin · <a href="https://t.me/c/2424231195/98072">джерело</a></sub>
</p>

---

## Як вибрати

Три питання вирішують, який корпус вам пасує:

1. **Який у вас БЖ?** ([Блок живлення](../en/03-power-supply.md)) — Meanwell **LOP-300** малий і живе *всередині* більшості корпусів. БЖ **Flex/SFX ATX** більший і потребує корпусу з виділеним відсіком. Знайдений **серверний блок HP** потребує корпусів «серверний БЖ v3/v4». Це найбільший фільтр.
2. **Який вентилятор(и) ви запустите?** Майже кожен корпус побудований навколо **одного 120-мм вентилятора** над радіатором. Більші збірки додають **другий 120-мм** вентилятор на задню пластину (щоб охолодити пам'ять GDDR6, яка [не має датчика температури](../en/04-cooling.md)) або живити БЖ. Дехто використовує **140-мм** чи **тонкі** вентилятори, де висота обмежена.
3. **Ви вже стоншили ребра?** Більшість корпусів припускають, що ви вже **розпиляли/розшліфували штатні ребра радіатора** (див. [Охолодження, Шлях A](../en/04-cooling.md)). Корпус сам по собі не виправляє штатний кулер — він лише тримає вентилятор у потрібному місці.

> **Жаргон, одноразово:** **STL** = стандартний файл 3D-друкованої сітки, який ви завантажуєте у слайсер. **STEP / 3MF** = редаговані формати CAD (використовуйте їх, якщо хочете змінити дизайн). **Кожух / чохол / адаптер** = друкована лійка, що змушує вентилятор прилягати до ребер, а не пропускати повітря повз них. **Flex / SFX ATX** = блоки живлення ПК малого форм-фактора. **LOP** = промисловий БЖ Meanwell LOP-300, якому надає перевагу спільнота.

> **💡 Надрукуйте отвір доступу до джампера скидання CMOS.** Щоразу, коли ви змінюєте розподіл VRAM/UMA, треба **скинути CMOS** (див. [BIOS](../en/08-bios.md)), тож проєктувати герметичний корпус, що ховає джампер, означає розкривати його раз за разом. Лишіть **отвір доступу ⌀10 мм** над джампером скидання CMOS у будь-якому закритому дизайні — або, краще, виведіть на панель невеликий **3-позиційний перемикач**, щоб скидати без інструментів. ([4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980))

---

## Рівень 1 — Мінімальний «охолоджувальний чохол» (почніть звідси)

Найменше, найшвидше, що можна надрукувати. Це **насправді не корпус** — це друкована «куртка», що насаджується на плату двома половинками на щільну посадку тертям, тримає 120-мм вентилятор біля радіатора й спрямовує повітря. **Нічого різати, жодних гвинтів у плату.** Дима Ткач (один із найперших будівельників проєкту) описує два варіанти — компактний і «з веселішим виглядом» — обидва досягають **~70 °C при 150 W** навантаження, ~210 г / ~170 г пластика кожен, із БЖ, що лишається холодним на турбулентному обдуві ([src](https://t.me/c/2424231195/10743)). Його вердикт: *«це насправді не корпус, радше охолоджувальний чохол, але нічого не треба різати, усе тримається на дуже щільній посадці, половинки накидаються з протилежних боків».*

- **Файли:** `BC-250-FanSleeves.3mf` ([src](https://t.me/c/2424231195/10766)), CAD плати `bc-250-body.step` ([src](https://t.me/c/2424231195/18266))
- **Джерельний репозиторій:** [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) — найбільш рекомендований «перевірений, надрукований, підтверджено робочий» мінімальний дизайн у чаті ([src](https://t.me/c/2424231195/18260))
- **Вентилятор:** 1× 120 mm
- **БЖ:** будь-який — є отвір/виріз для кабелю живлення, тож можна використати LOP *або* зовнішнє джерело ([src](https://t.me/c/2424231195/22950))

---

## Рівень 2 — Відкрита рама / «оболонка» (плата напоказ)

Напівкорпуси, що огортають плату з одного боку й лишають радіатор видимим. Легкі на пластик, прості у збиранні, хороший обдув.

### onemorecap «Shell Case» — еталонна збірка

Найбільш «залайканий» пост про корпус у чаті (❤33): пласка бічна пластина над платою з тисненням **«BC-250»** і візерунком сітки CU, **ручка для перенесення**, відлита у верхній частині, **відкриті стоншені ребра радіатора** посередині та 120-мм вентилятор **Arctic** у власному кожусі, прикрученому до правого краю. Позначено *«BC-250 SHELL CASE BY ONEMORECAP / ASRock × CMG»* ([src](https://t.me/c/2424231195/22771)). Відповідний набір STL було викладено в чат одним пакетом ([src](https://t.me/c/2424231195/81672)), і автор підтвердив, що моделі безкоштовні на Printables та MakerWorld ([src](https://t.me/c/2424231195/24505)).

- **Файли (пакет із чату):** `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl`, плюс кожухи вентиляторів нижче ([src](https://t.me/c/2424231195/81680))
- **Джерело:** [GitHub onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case)
- **Вентилятор:** 1× або 2× 120 mm (через кожух), або 1× 140 mm
- **БЖ:** задня панель `Shell_Back_FLEX_ATX` вирізана під БЖ **Flex ATX**

### Акрилова відкрита рама (Владислав)

Відкрита **алюмінієво-акрилова** рама: дві металеві торцеві пластини з прозорими бічними панелями, плата встановлена вертикально, один вентилятор **Arctic 120 mm** дме прямо крізь стоншений радіатор у центрі, а БЖ Flex/SFX сидить у нижньому відсіку ([src](https://t.me/c/2424231195/114651)). Це той дизайн, що пізніше був перепощений на [r/BC250Gaming як «акриловий корпус»](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/). Друковані кронштейни — це частини, які ви відтворюєте; сама рама лазерно різана/з готових деталей.

- **Вентилятор:** 1× 120 mm (центр) — є місце для додавання вентилятора задньої пластини
- **БЖ:** Flex / SFX ATX у нижньому відсіку

---

## Рівень 3 — Бокси в стилі консолі (повністю закриті)

Закриті корпуси, що мають вигляд ігрової консолі чи малого NAS. Більше пластика й більше часу друку, але готовий продукт із ручкою, кнопкою живлення, вентильованими панелями та інколи екраном.

### «Просто лучший корпус» (Jack Fisher × B1zon) — фаворит спільноти

Викладений під курованим тегом **#BC250body** як *«просто найкращий корпус»*, це повністю готова консоль з опублікованою специфікацією матеріалів: БЖ, вентилятори, конектор, гумові ніжки, кнопка живлення, гвинти + різьбові втулки, PWM-розгалужувач вентиляторів, наліпка «Cyberpunk» і гребінець для вирівнювання радіатора. Деякі деталі зняті з виробництва й мають заміни ([src](https://t.me/c/2424231195/79990)). Авторство дизайну — B1zon, збірка — Jack Fisher.

- **Файли:** `BC250 korpus исправленный.rar` («BC250 корпус, виправлений») ([src](https://t.me/c/2424231195/79989))
- **Вентилятор:** 120 mm (передній) + PWM-розгалужувач для другого вентилятора
- **БЖ:** внутрішній (класу LOP)

### Передня панель із трьома «GPU» (Гослинг)

Консольний бокс, передня панель якого — **фальшивий кожух відеокарти** — три круглі вирізи під вентилятори в ряд із RGB, тож машина має вигляд дискретного GPU. Показано в роботі **Bazzite 42** на BC-250 ([src](https://t.me/c/2424231195/66616)). Три отвори — косметика поверх єдиного робочого вентилятора плюс вдув.

### Біла консоль із панеллю-лабіринтом (Jhonatan)

Високий білий бокс із вражаючою **вентильованою бічною панеллю з візерунком лабіринт/схема**, підсвіченою (зеленою) металевою кнопкою живлення та повновисотною решіткою вдуву на передній грані — одна з більш відшліфованих естетик у чаті ([src](https://t.me/c/2424231195/121274)).

### Міні-башта з сітчастим ґратом (Joglik)

Сіра вертикальна міні-башта з щільним **квадратним сітчастим ґратом** на боці й зверху, прорізом/виїмкою-ручкою у верхньому ребрі та круглим вводом кабелю внизу ззаду. Чистий індустріальний вигляд ([src](https://t.me/c/2424231195/126525)).

### Hi-fi бокс з овальним вікном (a m)

Білий прямокутний корпус, стилізований під фронт hi-fi/мікрохвильовки: велике **сітчасте вікно у формі стадіону** з вентилятором, видимим за круглою сіткою, оточене двома вертикальними сітчастими прорізами ([src](https://t.me/c/2424231195/52955)). Пізніша ітерація автора рухається до «нормального пластика» замість спіненого ПВХ і додає зовнішнє живлення серії XT та RGB ([src](https://t.me/c/2424231195/128048)).

### Компактна консоль (Volodymyr Spyrydonov, «v15»)

Малий сріблясто-чорний консольний бокс із сітчастим бічним вдувом і темним фронтом, що несе емблему в кіберпанк-стилі та RGB-стрічку, показаний поруч із телевізором як машина для вітальні ([src](https://t.me/c/2424231195/135995)). Частина довгої лінії ревізій (зображення джерел v15/v19/v20 ділилися раніше).

### BC250 Vented Edition (MaelremremDotXYZ)

Мінімалістична консоль **FlexATX**, що працює **з відкритими ребрами**, тримає **~67 °C @ 2145 MHz / 1.1 V**, із заднім аварійним вимикачем БЖ. [MakerWorld 2899020](https://makerworld.com/en/models/2899020).

### Stellar 250 (isaacalvex)

Повністю самодостатня консоль із повним **гайдом збірки**: внутрішнє сховище, **WiFi 6** та **дисплей температури ESP32**. [GitHub isaacalvex/AMD-BC-250-Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide).

### Simple Case for the ASRock AMD BC-250

Названий, публічно доступний для завантаження консольний корпус, опублікований автором [українського проходження збірки на YouTube](https://youtu.be/p5Zd86vFe8w) — прямолінійний закритий бокс для тих, хто хоче готовий друк без багатоскладової складності. [MakerWorld 2870270](https://makerworld.com/en/models/2870270).

---

## Рівень 4 — Великі збірки: ATX БЖ, рідинна СВО, екрани

Для тих, хто хоче повнорозмірний БЖ, рідинне охолодження чи інтегрований дисплей.

### Родина NexGen3D «DIY Steam Machine»

**Найбільш згадуваний 3D-проєкт** у спільноті (перепощений 7×). Родина консольних корпусів на Printables, включно з **рідинно-охолоджуваним варіантом «Pro»** та виданням **«Redux»**, що вміщує **внутрішній Pi-екран 1080×480** у передній частині ([Reddit build](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)). Є виділена модель **кріплення AIO** для встановлення 120-мм моноблочного рідинного кулера на кристал.

- [Printables 1499974 — DIY Steam Machine (база)](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite)
- [Printables 1614131 — Pro Liquid-Cooled](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) · [Printables 1649679 — Redux](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) · [Printables 1554003 — AIO mount](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250)
- **Вентилятор/охолодження:** 120-мм повітря **або** 120-мм AIO залежно від варіанту
- **БЖ:** задокументовані версії LOP та ATX

### Еталонна рідинно-охолоджувана збірка «Steam Machine Pro» (Old Lamer)

Високорівнева, повністю рідинно-охолоджувана збірка, задокументована від початку до кінця на відео — корисна як список покупок деталей, якщо йдете ва-банк на машину з AIO ([Old Lamer](https://youtu.be/afYhUQFa-AY)). Опублікована специфікація:

- **AIO:** TEUCER AF 240 (240-мм моноблок) на кристал
- **БЖ:** Mean Well **LOP-600-12** (або **LOP-500-12** як менший варіант) — див. [Блок живлення](../en/03-power-supply.md)
- **Вентилятори:** 2× Arctic **P12 Pro** + 1× Arctic **P8**
- **Дистанційне живлення:** **релейна плата ESP32** для дистанційного ввімкнення/вимкнення машини
- **Софт:** **OpenLinkHub** / **Commander Duo** під Linux для керування помпою AIO та вентиляторами

---

### Steam Cube — параметричний вертикальний корпус, водяне охолодження (у розробці)

**Повністю параметричний** вертикальний корпус у форм-факторі **Xbox Series X**, спроєктований **за принципом «спершу водяне охолодження»** зі змінною холодною стороною: водоблок, **Thermalright AXP90-X47 Full-Copper** чи один **Arctic P12 Max** — усі кріпляться на те саме кріплення. Він виріс зі скетчу **«Xbox Serie X BC-250 Edition» від Sol Diego** ([Printables 1748271](https://www.printables.com/model/1748271)) та точної **моделі плати torassk** ([Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)), потім перемальований як код (build123d), тож кожен розмір — це змінна, яку ви переналаштовуєте, а не фіксована сітка.

**Габарити й логіка за ними** (виведено з перевіреного розміру плати та теплових цілей у [Охолодженні](../en/04-cooling.md)):

- **~180 × 212 × 380 мм** вертикальна башта — достатньо висока, щоб поставити **240-мм радіатор вертикально** поруч із платою (вузол радіатора ~277 мм вміщується в 380 мм висоти).
- **Димарний обдув** — 120-мм вдув знизу, 120-мм витяжка зверху, тож тепло піднімається прямо назовні.
- **Активна задня пластина обов'язкова, а не опціональна** — сторона GDDR6 / VRM [не має датчика температури](../en/04-cooling.md), тож дизайн трактує задню охолодження як обов'язкову частину.
- **Цілі охолодження** (проєктні цілі, **не** виміряні результати): водяний кристал < 60 °C тривало на 40 CU; AXP90 < 75 °C @ 2000 MHz; база P12 ~73–78 °C.

> ⚠️ **Статус: концепт-дизайн, не перевірений друк.** Поточний CAD — це **параметрична просторова модель**: деталі коректно розмірені, орієнтовані й розміщені, і вона експортує 8 STL + STEP — але її **не** друкували, не збирали й не тестували термічно, а водоблок розміщений із габаритного паралелепіпеда плати, а не з виміряної позиції кристала. Сприймайте її як **стартовий CAD для форку**, а не готовий корпус; реальна валідація друку / підгонки / терміки — відкритий наступний крок. Цілі вище — це цілі, а не бенчмарки.

---

### Корпуси з ATX-БЖ (Victor L., V\ad, серверний БЖ v3/v4)

Для повноцінного **ATX** блока живлення: корпус, побудований навколо повного ATX-БЖ ([src](https://t.me/c/2424231195/119293), іде на MakerWorld), ранній прототип новачка в Blender ([src](https://t.me/c/2424231195/105570)) та опублікована лінія **HP/серверний БЖ** на Printables/MakerWorld із компонуванням HDD та USB-хаба.

- [Printables 1580750 — Case v3, HP server PSU + HDD + USB hub](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) · [MakerWorld 2481620 — Case v4, FlexATX & HP-server PSU](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) · [Printables 1550729 — ATX-PSU Bazzite Box](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box)

### Збірки Twin-120 (охолодження пам'яті + БЖ)

Перепроєктована монтажна пластина, що несе **два 120-мм вентилятори** — один спрямований на задню пластину (пам'ять), як і задумав конструктор плати, другий живить БЖ. З вентиляторами Lian Li P28 спереду + Thermalright C12015 автор тримає **2200 MHz при 80 °C в іграх**, де одного переднього вентилятора не вистачало ([src](https://t.me/c/2424231195/120606)). Окремий **`Twin_120mm_Fan_Shroud.stl`** ділиться для цього ([src](https://t.me/c/2424231195/121684)).

### The Lanboy — портативний аркадник / ланч-бокс

Портативна збірка аркадник-ланчбокс: вона керує **16″ ноутбучною панеллю eDP (1920×1200 @ 165 Hz)** через **плату-адаптер eDisplayPort** ([AliExpress](https://www.aliexpress.com/item/1005006351527252.html)), 2× 2″ динаміки на USB-підсилювачі, усе живиться від одного **12 V ATX-брейкауту**. [Printables 1746364](https://www.printables.com/model/1746364). Трюк з eDP-адаптером перевикористовуваний для **будь-якої** збірки з ноутбучною панеллю.

### BC250-HUD (Bloodyly) — внутрішній екран статусу

Застосунок екрана статусу на **Qt5/C++ для Raspberry Pi Zero 2** (використовується у збірках на кшталт NexGen3D Redux): **60 FPS через режим USB-гаджета**, читає FPS/час кадру з MangoHud, відчуває напругу вентилятора, щоб гасити екран у сні, та **включає патч ядра vc4**, який інакше підвішує Pi. Екран: **8.8″ 1920×480 IPS** (Hannstar HSD088IPW1-A). [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD).

---

## Адаптери та кріплення (не повні корпуси)

Малі друковані деталі, що вирішують одну проблему — зазвичай монтаж кулера чи вентилятора на плату.

- **Кожухи вентиляторів** (герметизують вентилятор до ребер): `Fan_Shroud_Single_120mm.stl`, `Fan_Shroud_Dual_120mm.stl`, `Fan_Shroud_Single_120mm_Restricted.stl`, `Fan_Shroud_Single_140mm.stl` ([src](https://t.me/c/2424231195/81673)), `Twin_120mm_Fan_Shroud.stl` ([src](https://t.me/c/2424231195/121684)). Також каталогізовані в [Охолодженні](../en/04-cooling.md).
- **Кріплення вентилятора задньої пластини / пам'яті:** `Backplate.stl` + `backplane-top-fixed.stl` ([src](https://t.me/c/2424231195/133049)); `bottom_fan_mount.stl`, `top_fan_mount.stl`, `Front-Mount.stl`, `Back-Mount.stl` ([src](https://t.me/c/2424231195/131189))
- **Адаптери кулера AM4** (прикрутити стандартний кулер CPU до кристала): `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` ([src](https://t.me/c/2424231195/9949)). Див. також [Printables 1042228 — BC250→AMD CPU-cooler mount](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount).
- **Універсальне кріплення ITX** (majzok): друкується у двох частинах, що защіпаються в рамку — прикрутіть BC-250 у нього, потім прикрутіть рамку в **будь-який корпус зі стандартними отворами материнської плати ITX** (перевірено в DeepCool CH170 PLUS). Вирішує проблему «не існує універсального кріплення ITX». Канонічного посилання на Printables не зафіксовано — шукайте на Printables/MakerWorld за **«BC-250 ITX Mount»**.
- **Адаптер Thermalright AXP90-X53 / AXP120-X67** (низькопрофільний кулер на кристал): друковане кріплення, що потребує різьби M3, із варіантами товщини за тиском кулера/CPU — [Printables 1694793](https://www.printables.com/model/1694793). Також у [Охолодженні](../en/04-cooling.md).
- **Адаптер 120-мм вентилятора:** `BC250_FanAdapter_120mm.step` ([src](https://t.me/c/2424231195/83135)), `cooler adapter v3.0 (1).stl` ([src](https://t.me/c/2424231195/111091))
- **Точні моделі плати** (проєктуйте власний корпус за ними): [Printables 1341336 — accurate BC-250 board](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) ([src](https://t.me/c/2424231195/55496)), [Printables 1103626 — AMD BC250 board](https://www.printables.com/model/1103626-amd-bc250-board)

---

## Таблиця каталогу

Файли, позначені *(chat)*, дзеркаляться під `assets/stl/`; усе інше завантажується зі зв'язаної сторінки Printables / MakerWorld / GitHub.

| Корпус / деталь | Тип | Файли STL / джерело | Вентилятори | Завантаження |
|---|---|---|---|---|
| **onemorecap cooling sleeve** | мінімальний чохол | `BC-250-FanSleeves.3mf` *(chat)* | 1× 120 | [GitHub onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) |
| **onemorecap Shell Case** ⭐ | відкрита оболонка | `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl` *(chat)* | 1–2× 120 / 1× 140 | [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [GitHub](https://github.com/onemorecap/bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case) |
| **Акрилова відкрита рама** (Владислав) | відкрита рама | друковані кронштейни *(chat #114651)* | 1× 120 | [Reddit thread](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) |
| **«Просто лучший корпус»** (Jack Fisher × B1zon) | консоль | `BC250 korpus исправленный.rar` *(chat)* | 120 + PWM-розгалужувач | [chat #79989](https://t.me/c/2424231195/79989) |
| **Мінімальний корпус для Flex БЖ** | малий бокс | `minimal-case-...-model_files.zip` *(chat)* | 1× 120 | [Printables 1423572](https://www.printables.com/model/1423572-minimal-case-for-bc250-and-flex-psu) |
| **forgenam case** | консоль | `forgenam-case-bc250-model_files.zip` *(chat)* | 1× 120 | [Printables 1375929](https://www.printables.com/model/1375929-forgenam-case-bc250) |
| **Minimalist 240** | консоль + ручка | `Minimalist 240 Front/Back/Handle.stl` *(chat)* | 120 | [chat #117404](https://t.me/c/2424231195/117404) |
| **M360** | консоль | `M360 Front.stl`, `M360 Back.stl` *(chat)* | 120 | [chat #126566](https://t.me/c/2424231195/126566) |
| **NexGen3D DIY Steam Machine** ⭐ | консоль | файли Printables | 1× 120 | [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) |
| **NexGen3D Pro (liquid)** | консоль + AIO | файли Printables | 120 AIO | [Printables 1614131](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) |
| **NexGen3D Redux (+screen)** | консоль + екран 1080×480 | файли Printables | 1× 120 | [Printables 1649679](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) |
| **NexGen3D AIO mount** | адаптер | файли Printables | 120 AIO | [Printables 1554003](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250) |
| **Case v3 — HP server PSU** | консоль + HDD/USB | файли Printables | 120 | [Printables 1580750](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) |
| **Case v4 — FlexATX / HP PSU** | консоль | файли MakerWorld | 120 | [MakerWorld 2481620](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) |
| **ATX-PSU Bazzite Box** | бокс full-ATX | файли Printables | 120 | [Printables 1550729](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box) |
| **ivanov-innokentii case** | консоль | джерела GitHub | 120 | [GitHub ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) |
| **rLapchynski enclosure** | корпус | джерела GitHub | 120 | [GitHub rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure) |
| **BC-250 Scooper** | кожух/совок | файли Printables | 120 | [Printables 1282906](https://www.printables.com/model/1282906-bc-250-scooper) |
| **Pitman case** | консоль | файли Printables | 120 | [Printables 1570248](https://www.printables.com/model/1570248-amd-bc-250-pitman-case) |
| **Корпус в індустріальному стилі FlexATX** | консоль | `amd_bc_250_industrial_style_case...zip` *(chat)* | 120 (без штатного кулера) | [chat #144265](https://t.me/c/2424231195/144265) |
| **The Lanboy** | портативний аркадник + 16″ eDP-екран | файли Printables | 12 V ATX-брейкаут | [Printables 1746364](https://www.printables.com/model/1746364) |
| **BC250 Vented Edition** (MaelremremDotXYZ) | консоль FlexATX, відкриті ребра | файли MakerWorld | 120 | [MakerWorld 2899020](https://makerworld.com/en/models/2899020) |
| **Stellar 250** (isaacalvex) | консоль + гайд збірки (WiFi6, ESP32) | гайд GitHub | 120 | [GitHub isaacalvex/...Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide) |
| **Simple Case for the ASRock AMD BC-250** | консоль | файли MakerWorld | 120 | [MakerWorld 2870270](https://makerworld.com/en/models/2870270) |
| **BC250-HUD** (Bloodyly) | внутрішній екран статусу Pi Zero 2 | джерела GitHub | — | [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD) |
| **Універсальне кріплення ITX** (majzok) | адаптер (будь-який корпус ITX) | шукайте Printables/MakerWorld | — | "BC-250 ITX Mount" |
| **Кріплення Thermalright AXP90/AXP120** | адаптер низькопрофільного кулера | файли Printables | низькопрофільна башта | [Printables 1694793](https://www.printables.com/model/1694793) |
| **Монтажна пластина Twin-120** | пластина-адаптер | `Twin_120mm_Fan_Shroud.stl` *(chat)* | 2× 120 | [chat #121684](https://t.me/c/2424231195/121684) |
| **Кожухи вентиляторів (120/140)** | кожух | `Fan_Shroud_Single_120mm.stl`, `_Dual_120mm`, `_Single_140mm`, `_120mm_Restricted` *(chat)* | 120 / 140 | [Printables 1339540](https://www.printables.com/model/1339540-yet-another-bc-250-fan-shroud) · див. [Охолодження](../en/04-cooling.md) |
| **Адаптер кулера AM4** | кріплення | `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` *(chat)* | башта/AIO | [Printables 1042228](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount) |
| **Точна модель плати** | довідковий CAD | `bc-250-body.step` *(chat)* | — | [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) |

⭐ = найбільш «залайканий» / найбільш перепощений у спільноті.

### Більше публічних дизайнів (з каталогу elektricM)

Названі, доступні для завантаження дизайни з [каталогу elektricM на 143 дизайни](https://elektricm.github.io/amd-bc250-docs/community/cases/), яких немає вище — згруповані за БЖ, навколо якого вони побудовані. Перегляньте повний каталог для збірок лише з Discord/WIP та мініатюр.

**MeanWell LOP (внутрішній БЖ):**

| Корпус / деталь | Особливість | Завантаження |
|---|---|---|
| **Steamboat Case** (yannichaboyer) | консоль LOP-300 | [MakerWorld 2431616](https://makerworld.com/en/models/2431616) |
| **Ultra-Thin Custom Case** (MrRoze) | тонкий LOP-300 | [Printables 1626501](https://www.printables.com/model/1626501) |
| **Internal PSU 2×140 mm** (Kacikor) | LOP-400, два 140 | [Printables 1599644](https://www.printables.com/model/1599644) · [MakerWorld 2400574](https://makerworld.com/en/models/2400574) |
| **Push-Pull Internal 12V PSU** (penzoiders) | push-pull | [MakerWorld 2505974](https://makerworld.com/en/models/2505974) |
| **Shell Case + 40 mm SSD fan** (Munkee915) | реміксShell, охолодження SSD | [Printables 1568074](https://www.printables.com/model/1568074) |
| **Noctua Push-Pull Mod** (Janjd) | ремікс Shell | [MakerWorld 2354123](https://makerworld.com/en/models/2354123) |

**MeanWell LRS/UHP (інший поширений серверний блок):**

| Корпус / деталь | Особливість | Завантаження |
|---|---|---|
| **LRS-350-12 PSU Case** (TARGZ) | бокс LRS-350 | [Printables 1543979](https://www.printables.com/model/1543979) |
| **BC250 slim case** (C4kew4lk) | UHP-350-12, тонкий | [Printables 1504664](https://www.printables.com/model/1504664) |

**FlexATX — родина Arthrimus «Console Style»** (ціла лінія реміксів; тонка консоль — стейпл спільноти):

| Корпус / деталь | Особливість | Завантаження |
|---|---|---|
| **Console Style Case v1** (Arthrimus) | оригінал | [Thingiverse 7165679](https://www.thingiverse.com/thing:7165679) · [MakerWorld 2097988](https://makerworld.com/ko/models/2097988-bc250) |
| **Slim Console Style Case** (Arthrimus) | тонкий варіант | [Thingiverse 7172528](https://www.thingiverse.com/thing:7172528) |
| **Slim Console — double-fan mod** (TKXXTH) | подвійний вентилятор | [Thingiverse 7214884](https://www.thingiverse.com/thing:7214884) |
| **Slim Console — On/Off + Apevia** | вимикач живлення | [Thingiverse 7274042](https://www.thingiverse.com/thing:7274042) |

**FlexATX — інше:**

| Корпус / деталь | Особливість | Завантаження |
|---|---|---|
| **Minimal Case (Toolless)** (chriszf) | без гвинтів | [Printables 1423572](https://www.printables.com/model/1423572) |
| **Minimalist BC-250 Case** (SebastienGau/Gadget) | мінімалістичний | [Printables 1581724](https://www.printables.com/model/1581724) |
| **ADT UT3G eGPU-Inspired** (R0mn) | вигляд eGPU | [Printables 1539301](https://www.printables.com/model/1539301) |
| **"Steam Machine" by MrLarva** | консоль | [Printables 1618501](https://www.printables.com/model/1618501) · [MakerWorld 2453965](https://makerworld.com/en/models/2453965) · [Thingiverse 7278235](https://www.thingiverse.com/thing:7278235) |
| **Steam Machine** (Pocket Adventures) | консоль | [MakerWorld 2350219](https://makerworld.com/en/models/2350219) |
| **Steam Machine Slim Console** (MTSquar3D) | тонкий + комплект вентилятора vRAM для OC | [MakerWorld 2232434](https://makerworld.com/en/models/2232434) · [Thingiverse 7271946](https://www.thingiverse.com/thing:7271946) |
| **ASRock Console Case** (songdawgdesigns) | консоль | [Printables 1617023](https://www.printables.com/model/1617023) · [Cults3D](https://cults3d.com/en/3d-model/gadget/asrock-amd-bc-250-console-case-steamos-bazzite-diy-steam-machine-style-build) |
| **AMD BC250 Case** (vitamins) | консоль | [MakerWorld 2219947](https://makerworld.com/en/models/2219947) |
| **E-waste Steam Machine** (Pesen333) | збірка зі вторсировини | [Thingiverse 7245584](https://www.thingiverse.com/thing:7245584) |

**Повний ATX:**

| Корпус / деталь | Особливість | Завантаження |
|---|---|---|
| **Case for Standard ATX** (CatSiewDai) | бокс ATX | [Printables 1553599](https://www.printables.com/model/1553599) |
| **ATX + Fan Duct** (ZMASLO) | з повітропроводом | [Printables 1616167](https://www.printables.com/model/1616167) |
| **Dual Fan ATX Case** (Mateo Fdez) | подвійний вентилятор | [Printables 1579658](https://www.printables.com/model/1579658) |
| **Simple Wooden Case** (suvalle55) | дерево + ATX | [Printables 1595794](https://www.printables.com/model/1595794) |
| **Open Frame + IKEA hack** (GreatApo) | відкрита рама | [Thingiverse 7314188](https://www.thingiverse.com/thing:7314188) |
| **Case for ATX PSU** (matmiak) | бокс ATX | [Thingiverse 7303096](https://www.thingiverse.com/thing:7303096) |

**TFX / VESA / готові:**

| Корпус / деталь | Особливість | Завантаження |
|---|---|---|
| **Case Remix for TFX** (PlayNation) | БЖ TFX-400 | [MakerWorld 2387157](https://makerworld.com/en/models/2387157) |
| **VESA 100/75 Basket** (Oleksii) | кріплення за монітором | [MakerWorld 1844470](https://makerworld.com/en/models/1844470) |
| **3.9L MKII FlexATX + PS5 fan** (FitFormSolutions) | купити готовий комплект | [Etsy](https://www.etsy.com/listing/4405362103/) · [eBay](https://www.ebay.com/itm/127460591552) |
| **Shiny Snake S400** (10.8 L сітчастий ITX) | перевірений готовий хост (кріплення BC-250→AM4 + AIO H60 у відсіку БЖ + кастомна задня панель I/O ATX) | [AliExpress](https://a.aliexpress.com/_EyQdoBU) |
| **SFX-PSU minimalist case** (Methsman) | повний SFX БЖ, магнітні панелі, USB-хаб, AXP120 + Noctua 120 — *файли WIP / ще не випущені* | — |
| **Cults3D ATX/server line** (KABANCHYK, lumstudio, kapa3D) | платні STL | [Cults3D — bc-250](https://cults3d.com/en/3d-model/gadget/bc-250-atx-case) |

---

## Немає принтера? Варіанти, які люди використовують

- **Купити друк.** Продавці є на [Etsy](https://www.etsy.com/listing/1904632447/), eBay та OLX; люди також пропонували друкувати/продавати корпуси в чаті ([src](https://t.me/c/2424231195/55507)).
- **Друк на замовлення:** завантажте STL у сервіс. Будівельники в чаті тримають друкарські ферми (один показує стіну принтерів Flsun/Creality/Bambu, [src](https://t.me/c/2424231195/73481)).
- **Зовсім без корпусу / перепрофілювання.** Багато хто запускає плату на відкритому стенді під час тестування. Інші потрошать наявне залізо: старий моноблочний ПК із вживленою платою та турбіною ([src](https://t.me/c/2424231195/30914)), бокс із вентиляційного короба ([src](https://t.me/c/2424231195/64265)) чи алюмінієві корпуси підсилювачів (потрібне напилювання/свердління, [src](https://t.me/c/2424231195/108907)). Один учасник навіть сховав плату всередину старого VHS-плеєра жартома ([src](https://t.me/c/2424231195/84106)). **Оболонка Xbox One** (JoeyDepDollas): випатрайте зламаний Xbox One і вмістіть повну збірку BC-250 всередину — тримає CPU і GPU під **60 °C** під навантаженням; зламані донорські консолі йдуть **~$15 з доставкою** на eBay і дають перевикористовувані деталі.
- **Лазерно різана фанера** (ContributionRich3242): не 3D-друк — фанера, зігнута пропилами (kerf-bent) навколо кутів, із великою задньою зоною для додаткового охолодження, що досягає **75 °C на 40 CU** (1800 MHz, CPU 3.9 GHz) і тиха як шепіт. (Лазерні файли не випущені.) Її **техніка охолодження задньої пластини** перевикористовувана на будь-якому корпусі: термопластична маса чип→задня пластина, паста задня пластина→задні кулери, та фіксація задніх кулерів щільними шплінтами R-типу в проміжку VRM + каптонова стрічка (~на 20 °C холодніше на 40 CU).

> Гола, добре охолоджена плата перевершує герметичний гарний бокс із поганим обдувом. Спершу зробіть [Охолодження](../en/04-cooling.md) правильно; корпус — це другий крок.

---

## Джерела

- Курований показ **#BC250body** (одна хороша збірка на день) — закріплена ідея [src](https://t.me/c/2424231195/79685)
- Мінімальний чохол, два варіанти — [src](https://t.me/c/2424231195/10743) · моделі на [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) [src](https://t.me/c/2424231195/18260)
- Shell Case (❤33) — [src](https://t.me/c/2424231195/22771) · безкоштовно на Printables/MakerWorld [src](https://t.me/c/2424231195/24505) · пакет STL [src](https://t.me/c/2424231195/81680)
- «Просто лучший корпус» + специфікація — [src](https://t.me/c/2424231195/79990) · файли [src](https://t.me/c/2424231195/79989)
- Акрилова відкрита рама — [src](https://t.me/c/2424231195/114651) · [Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/)
- Монтажна пластина Twin-120, 2200 MHz @ 80 °C — [src](https://t.me/c/2424231195/120606) · кожух [src](https://t.me/c/2424231195/121684)
- Консольні дизайни (фото) — Гослинг/Bazzite [src](https://t.me/c/2424231195/66616) · Jhonatan панель-лабіринт [src](https://t.me/c/2424231195/121274) · Joglik сітчастий ґрат [src](https://t.me/c/2424231195/126525) · a m овальне вікно [src](https://t.me/c/2424231195/52955) · Spyrydonov v15 [src](https://t.me/c/2424231195/135995)
- Родина NexGen3D Steam Machine — [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) · [Redux + Pi-екран (Reddit)](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)
- Довідкова модель плати — [src](https://t.me/c/2424231195/55496) · [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)
- Репозиторії корпусів на GitHub — [onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) · [rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure)
- **Повний каталог корпусів elektricM (~143 дизайни, пошук/фільтр)** — [elektricm.github.io/amd-bc250-docs/community/cases](https://elektricm.github.io/amd-bc250-docs/community/cases/)
- Simple Case (MakerWorld 2870270) + українське проходження збірки — [MakerWorld 2870270](https://makerworld.com/en/models/2870270) · [Old Lamer (YouTube)](https://youtu.be/p5Zd86vFe8w)
- Лайфхак з отвором доступу до скидання CMOS — [4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980)
- Специфікація рідинно-охолоджуваної збірки «Steam Machine Pro» (TEUCER AF 240, Mean Well LOP-600-12, Arctic P12 Pro/P8, реле ESP32, OpenLinkHub/Commander Duo) — [Old Lamer (YouTube)](https://youtu.be/afYhUQFa-AY)

> STL кожухів вентиляторів спільні з [Охолодженням](../en/04-cooling.md). Усі розміщені в чаті файли STL/STEP/3MF дзеркаляться під `assets/stl/`.
