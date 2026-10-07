<p align="center">
  <img src="assets/readme/bc250-hero.svg" alt="Awesome BC-250 — довідник про плату ASRock AMD BC-250 з посиланнями на джерела: Zen 2, RDNA 2 та 16 ГБ GDDR6 як контекст плати, а не заява про продуктивність." width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> Проєкти, документація, апаратні модифікації та дослідження **ASRock AMD BC-250**, разом із повноцінним посібником зі збирання й використання. BC-250 — APU-плата на базі PlayStation 5 (Cyan Skillfish / Oberon; Zen 2, RDNA 2 та 16 ГБ GDDR6).

<sub>_Каталог розширено **в жовтні 2026** · знімок проєктів **за вересень 2026** · [llms.txt](llms.txt) для ШІ-агентів_</sub>

[English](README.md) · [Русский](README.ru.md) · **Українська**

---

## Зміст

- [Каталог проєктів](#catalog).
- [Швидкий старт](#швидкий-старт).
- [Що це за плата](#що-це-за-плата).
- [Повний посібник](#довідник).
- [Початкові посилання на ресурси](#початкові-посилання-на-ресурси).
- [Охоплення дослідження](#обсяг-і-статус-дослідження).

<a id="catalog"></a>
## Каталог проєктів

- **[Відкрити каталог](catalog/uk/README.md)** — 316 окремо названих ресурсів, включно з експериментами й історичними розробками; записи мають призначення, джерело й доступну документацію.
- **Документація та прошивки:** [Посібники й збірки](catalog/uk/README.md#documentation) · [BIOS, UEFI та відновлення](catalog/uk/README.md#firmware) · [Ядра CPU, SMU та ACPI](catalog/uk/README.md#cpu).
- **Графіка та системи:** [Говернори GPU, CU/WGP та памʼять](catalog/uk/README.md#gpu) · [Образи й встановлення Linux](catalog/uk/README.md#linux) · [Графічні драйвери та інші ОС](catalog/uk/README.md#drivers).
- **Керування та залізо:** [Утиліти й ігровий режим](catalog/uk/README.md#control) · [Телеметрія, вентилятори й екрани](catalog/uk/README.md#monitoring) · [Адаптери й контролери живлення](catalog/uk/README.md#power) · [Корпуси, CAD та охолодження](catalog/uk/README.md#cases).
- **Завдання та периферія:** [Відеокодеки, VCN та звук](catalog/uk/README.md#video) · [AI, обчислення й кластери](catalog/uk/README.md#ai) · [Ігри, тести та емуляція](catalog/uk/README.md#gaming) · [WiFi та Bluetooth](catalog/uk/README.md#peripherals).
- **[Тематична бібліографія](catalog/uk/topics.md)** — 702 різні зовнішні посилання з 19 розділів: документація, моделі, відео, обговорення й повідомлення-джерела; окремо зібрані [посилання на спільноти](catalog/uk/topics.md#communities).
- **[Пошуковий індекс](catalog/discovery.md)** — усі 971 збіг із датованого пошуку, включно з форками й проєктами без зірок. Випадкові й ще не розібрані збіги збережені, але не видані за рекомендації BC-250.
- **Каталог і посібник.** Запис зберігає місце проєкту в екосистемі, а не рекомендує встановлення. Посібник нижче пояснює процедури; каталог також включає альтернативи й історичні спроби.

---

## Швидкий старт

- **Новий власник.** Ідіть по порядку за [docs/uk/00-start-here.md](docs/uk/00-start-here.md): купівля, живлення, охолодження, встановлення операційної системи, тюнінг, гра. Кожен крок описано в довіднику нижче.
- **Гравець.** Почніть із [результатів в іграх](docs/uk/11-gaming.md) та [емуляції](docs/uk/15-emulation.md). Перш ніж змінювати частоти чи напругу, прочитайте [розгін і андервольтинг](docs/uk/09-overclock-undervolt.md).
- **Дослідник.** Почніть із [каталогу проєктів](catalog/uk/README.md) та [тематичної бібліографії](catalog/uk/topics.md). [SOURCE_STATUS](SOURCE_STATUS.uk.md) пояснює охоплення джерел на конкретну дату; [BIOS та відновлення](docs/uk/08-bios.md) і [ШІ / LLM](docs/uk/12-ai-llm.md) розкривають практичні теми.

---

## Що це за плата

- **Плата.** Колишня майнінгова APU-плата із сімейства PlayStation 5: 6-ядерний Zen 2, 24 або 40 **обчислювальних блоків** RDNA 2 (CU — базовий блок виконання GPU) та 16 ГБ пам'яті GDDR6.
- **Ціна.** За повідомленнями спільноти, гола плата коштує близько **$60–130**, а повна збірка з блоком живлення, охолодженням і SSD — близько **$150–250**. Це повідомлення, а не комерційна пропозиція.
- **Операційна система.** Прискорення GPU працює в Linux: Bazzite, Fedora, CachyOS або Arch із Mesa 25.1 чи новішою. Драйвер GPU для Windows експериментальний; цей посібник не подає його як штатний шлях.
- **Дисплей, мережа, накопичувачі.** Виведення зображення йде через DisplayPort. Для WiFi та Bluetooth потрібен перевірений USB-донгл. Накопичувачі підключаються через адаптер M.2 або SATA.
- **Охолодження та живлення.** Спільнота описує додатковий обдув штатного радіатора й різні схеми підключення живлення. Перевірте контакти своїх роз’ємів і добирайте блок за виміряним навантаженням; див. [охолодження](docs/uk/04-cooling.md) та [блок живлення](docs/uk/03-power-supply.md).
- **Дані про налаштування.** Спільнота порівнює частоти GPU, напругу, швидкість GDDR6 і кількість CU; результат залежить від конкретної плати. [Вихідні дані](assets/diagrams/data.json) не задають універсально безпечних налаштувань і не замінюють випробування.
- **Застереження щодо доказів.** Ця сторінка збирає посилання та повідомлення спільноти. Запис у README, збіг у коді чи успішна збірка не є випробуванням плати. [SOURCE_STATUS](SOURCE_STATUS.uk.md) відокремлює перевірене від відкритого.

---

## Довідник

- **[Почніть звідси](docs/uk/00-start-here.md)** — повний шлях від голої плати до запущеної гри.
- **Основи збірки:** [Що таке BC-250](docs/uk/01-what-is-bc250.md) · [Купівля](docs/uk/02-buying.md) · [Блок живлення](docs/uk/03-power-supply.md) · [Охолодження](docs/uk/04-cooling.md) · [Корпуси та 3D-друк](docs/uk/05-case.md).
- **Програмна частина:** [Драйвери та налаштування Linux](docs/uk/06-linux.md) · [Драйвери та налаштування Windows](docs/uk/07-windows.md) · [macOS / Hackintosh](docs/uk/13-macos.md).
- **Тюнінг і прошивки:** [Розгін та андервольтинг](docs/uk/09-overclock-undervolt.md) · [BIOS та відновлення](docs/uk/08-bios.md).
- **Периферія та вивід:** [WiFi- та Bluetooth-донгли](docs/uk/10-wifi-bt.md) · [Дисплей та вивід](docs/uk/14-display.md) · [USB, хаби та периферія](docs/uk/16-usb-peripherals.md).
- **Навантаження:** [Результати в іграх та налаштування](docs/uk/11-gaming.md) · [ШІ / LLM](docs/uk/12-ai-llm.md) · [Емуляція](docs/uk/15-emulation.md).
- **Допомога:** [FAQ](docs/uk/faq.md) · [Усунення проблем](docs/uk/troubleshooting.md).

---

## Початкові посилання на ресурси

- **Повний список:** [каталог проєктів](catalog/uk/README.md) включає альтернативи й дослідження поза цими початковими посиланнями.


### Документація
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) — головний апаратний довідник (зворотна розробка)
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [сайт](https://elektricm.github.io/amd-bc250-docs/) — вичерпна документація спільноти (розпіновки, по дистрибутивах, усунення проблем)
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — документація організації
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — збірки та скрипти

### Розгін / андервольтинг / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — governor для частот і напруги GPU; перед використанням перевірте вимоги проєкту
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — форк oberon-governor із GUI для Linux
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [форк bc250-collective](https://github.com/bc250-collective/cyan-skillfish-governor)
- [rw-r-r-0644/bc250-core-unlock](https://github.com/rw-r-r-0644/bc250-core-unlock) — проєкт увімкнення вимкнених ядер CPU; сама маска не доводить справність ядра, а примусове ввімкнення може спричинити зависання
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — проєкт розблокування до 40 CU; результат залежить від плати й тут не перевірений
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Інструментарій та готові образи
- [redbeard1083/bc250-toolkit](https://github.com/redbeard1083/bc250-toolkit) — меню-орієнтоване налаштування для CachyOS: ядро, CPU/GPU governor, swap, ZRAM→ZSWAP, ACPI та твіки завантаження
- [movacx/bc250-control-center](https://github.com/movacx/bc250-control-center) — проєкт Linux-панелі для моніторингу та налаштування BC-250; у ньому є й привілейовані операції з прошивкою, тому перед їх використанням вивчіть вимоги та процедуру відновлення
- [62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images](https://github.com/62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images) — готові образи Bazzite Deck/GNOME/KDE із застосованими патчами BC-250

### Драйвери
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — драйвер GPU для Windows (експериментальний, без повного апаратного прискорення станом на початок 2026)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — робота над драйвером PSP/GPU
- [DryhoppedIPA/bc250-gfx1013-fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix) — патчі ядра та Mesa/RADV для зламаної черги обчислень GPU (async compute); також виправляє шлях FSR 4 / XeSS 3 INT8
- [MastaG/linux-cachyos-bc250](https://github.com/MastaG/linux-cachyos-bc250) — ядро CachyOS із чері-піками BC-250
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — ядро Linux

### BIOS / Прошивка
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — образи BIOS та модифікації спільноти
- [TheRetroWeb — база даних BIOS BC-250](https://theretroweb.com/bios?itemsPerPage=24&chipsetIds%5B%5D=1990) — стокові дампи BIOS, перегляд/завантаження за версією
- [Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script](https://github.com/Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script) — керований через меню скрипт резервного копіювання прошивки та прошивання кастомної прошивки
- Прошивку та відновлення з «цеглини» див. у [docs/uk/08-bios.md](docs/uk/08-bios.md)

### WiFi- / BT-донгли
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### ШІ / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Корпуси / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables та MakerWorld — див. [docs/uk/05-case.md](docs/uk/05-case.md)

---

## Обсяг і статус дослідження

<p align="center">
  <img src="assets/readme/evidence-flow.uk.svg" alt="Потік доказів: код і повідомлення спільноти закріплюються на ревізіях, порівнюються, потім зводяться в довідник фактів і відкритих питань; звіт про джерело не є випробуванням плати." width="100%">
</p>

- **Обсяг.** [SOURCE_STATUS](SOURCE_STATUS.uk.md) описує датований огляд джерел станом на 2026-09-29, а не всю інформацію про BC-250. Обсяг обмежено набором джерел, зазначеним там.
- **Що було проінвентаризовано.** Пошук за назвами репозиторіїв знайшов 971 публічний репозиторій GitHub; відомі джерела Discord містять 338 589 ID повідомлень; три списки Reddit дали 1 441 ID публікацій. Це підрахунок ідентифікаторів.
- **Що залишається відкритим.** Архівні гілки форумів, видалені та приватні повідомлення, вміст вкладень і багато репозиторіїв поза набором назв не охоплено. Суперечки, наприклад про те, чи доходить `I2C_HEADER1` до живої PMBus, залишаються невирішеними.
- **Примітка про переклад.** Докладні українські сторінки довідника можуть відставати від фактичних оновлень англійською та російською. Сам README перекладено всіма трьома мовами.
- **Як читати числа.** Підрахунок ідентифікаторів показує охоплення списку джерел; він не підтверджує роботу якогось проєкту на платі.

---

## Внесок і безпека

- **Внесок.** Знання тут витягуються з чату спільноти відтворюваним пайплайном; див. [CONTRIBUTING.md](CONTRIBUTING.md). Правки, нові донгли, нові корпуси та перевірені команди вітаються.
- **Безпека.** Зміна прошивки та BIOS несе ризик «цеглини». Перед прошиванням збережіть повний дамп і перевірений шлях відновлення; див. [BIOS та відновлення](docs/uk/08-bios.md).
- **Заявлений ризик.** За повідомленнями спільноти, розблокування 40 CU та розгін пам'яті повертали плати «цеглиною». Надавайте перевагу мінімальній поетапній зміні та тримайте стоковий контроль.
- **Без гарантій.** Ніщо тут не перевірено на платі, якщо про це не сказано в конкретному тесті. Не вважайте злитий файл чи успішну збірку підтвердженням роботи заліза.
- **Ліцензія.** Документація поширюється за [CC-BY-SA-4.0](LICENSE); скрипти в `assets/scripts/` — за MIT.
- **Права та учасники.** Дзеркальні копії прошивок і драйверів зберігають права власників; див. [застереження про прошивки](assets/firmware/DISCLAIMER.md). Учасників перелічено в [CREDITS](CREDITS.md).
