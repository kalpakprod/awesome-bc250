<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — біблія новачка для AMD BC-250" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> Біблія новачка для **ASRock AMD BC-250** — APU-плати на базі PlayStation 5 (Cyan Skillfish / Oberon, 6-ядерний Zen 2 + 24/40 CU RDNA 2, 16 ГБ GDDR6), переробленої на дешевий **Linux-міні-ПК для ігор та ШІ** — саморобну бюджетну Steam Machine.

Усе, що потрібно, щоб пройти шлях **від плати в коробці до запущених ігор** — зібрано з 130 тис.+ повідомлень спільноти BC-250, відсортовано за тим, що люди реально вподобали та закріплювали, і звірено з канонічними репозиторіями проєкту.

🌍 [English](README.md) · [Русский](README.ru.md) · **Українська** · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<sub>_Підтримується · востаннє оновлено **серпень 2026** · [llms.txt](llms.txt) для AI-агентів_</sub>

---

## ❓ Швидкі відповіді

- **Що таке ASRock AMD BC-250?** APU-плата на базі PlayStation 5 — 6-ядерний Zen 2 + 24/40 CU RDNA 2 («Cyan Skillfish»), 16 ГБ GDDR6 — продається дешево як колишня майнінг-карта і переробляється на ігровий Linux-міні-ПК та платформу для ШІ, саморобну бюджетну Steam Machine.
- **Скільки це коштує?** Приблизно **$60–130** за саму плату; повна збірка (БЖ, охолодження, SSD) виходить близько **$150–250**. Див. [Гайд із купівлі](docs/en/02-buying.md).
- **Наскільки добре він грає?** Приблизно **1080p 60 FPS** у більшості ігор (клас RX 6600) із FSR / Frame-Gen та розгоном GPU+CPU. Див. [Результати в іграх](docs/en/11-gaming.md).
- **Яка ОС?** **Тільки Linux** для апаратного прискорення GPU — Bazzite, Fedora, CachyOS або Arch із Mesa 25.1+. Драйвера GPU для Windows немає. Див. [Налаштування Linux](docs/en/06-linux.md).
- **Чи може він запускати LLM?** Так — llama.cpp / Ollama через Vulkan використовують 16 ГБ GDDR6 як VRAM (~30–47 tok/s на малих моделях). Див. [ШІ / LLM](docs/en/12-ai-llm.md).
- **Як його охолоджувати?** Штатний серверний радіатор на столі троттлить; стоншіть ребра та додайте вентилятор 120 мм або переходьте на воду. Див. [Охолодження](docs/en/04-cooling.md).

---

## ⚡ Почніть звідси

Нова плата, нічого не знаєте? Пройдіть золотий шлях по порядку:

**[docs/uk/00-start-here.md](docs/uk/00-start-here.md)** — Купівля → Живлення → Охолодження → Встановлення ОС → Драйвери → Розгін → Гра.

---

## 📈 Що насправді дає тюнінг

Кожен параметр на цій платі чимось поступається. Ось чотири найважливіші, засновані на вимірах спільноти — прочитайте їх, перш ніж щось прошивати.

<p align="center">
  <img src="assets/diagrams/gpu-clock-tradeoff.svg" width="100%" alt="Частота ядра GPU: приріст FPS зростає до приблизно 95% на 2000 MHz, а потім вирівнюється, оскільки його обмежує CPU, тоді як споживання та нагрів продовжують зростати до 95%. Оптимальна точка близько 2000 MHz, приблизно +30% FPS.">
</p>

<p align="center">
  <img src="assets/diagrams/undervolt-tradeoff.svg" width="100%" alt="Андервольтинг: ефективність зростає з 20% до 95%, коли напруга падає з 1129 mV до 700 mV, тоді як ризик нестабільності зростає з 15% до 100%. Діапазон, стабільний для ігор, — приблизно 905–955 mV; нижче 700 mV GPU сам блокується на 1500 MHz.">
</p>

<p align="center">
  <img src="assets/diagrams/cu40-tradeoff.svg" width="100%" alt="Розблокування 40 CU: обчислювальна потужність зростає з 40% до 90%, тоді як ігровий FPS рухається лише з 40% до 47%, а споживання та нестабільність зростають з 25% до 100%. 38 CU — типовий стабільний максимум; 40 CU — лотерея, що потребує понад 300 Вт та AIO.">
</p>

<p align="center">
  <img src="assets/diagrams/memory-tradeoff.svg" width="100%" alt="Тюнінг пам'яті GDDR6: пропускна здатність і приріст FPS змінюються лише з 30% до 52%, тоді як ризик перетворити плату на «цеглину» зростає з 20% до 100%. 1950 MHz — точка, де плати поверталися «цеглою».">
</p>

<p align="center">
  <img src="assets/diagrams/power-by-config.svg" width="100%" alt="Виміряне споживання від розетки за конфігураціями: 200 Вт при 38 CU і 1200 MHz на 850 mV, 260 Вт при 40 CU і 1800 MHz на 860 mV, 310 Вт при 38 CU і 1500 MHz та 350 Вт при 40 CU і 2000 MHz на 960 mV, причому 1025 mV додає лише 2 Вт. Найкраща заявлена точка «ват на кадр» — 40 CU на 1800 MHz.">
</p>

Ці п'ять точок — це вимірювання, а не модель: перехід із 1800 на 2000 MHz коштує близько 90 Вт — приблизно стільки ж, скільки коштували попередні 600 MHz, — а підняття напруги з 960 mV до 1025 mV не дає нічого, окрім 2 Вт тепла. За 350 Вт блок живлення на 300 Вт вимикається протягом 30 секунд, а лінія +12V несе 26 А.

<details>
<summary>Споживання в простої — чому лічильник від розетки майже не рухається</summary>

<p align="center">
  <img src="assets/diagrams/idle-power-tradeoff.svg" width="100%" alt="Споживання в простої: споживання GPU падає з 80 Вт до 5 Вт завдяки governor, андервольтингу та авто-сну, але загальне споживання від розетки падає лише з 125 Вт до 110 Вт, поки сон не знизить його до 10 Вт.">
</p>

Governor та андервольтинг знижують споживання GPU, але CPU та GDDR6 продовжують споживати незалежно. Поки не спрацює авто-сон, лічильник від розетки майже нічого не помічає. Партії з високим струмом витоку впираються в мінімум близько 70–80 Вт.

</details>

<sub>Джерело даних: [`assets/diagrams/data.json`](assets/diagrams/data.json) · перебудувати командою `node assets/diagrams/build.mjs`</sub>

---

## 📚 Довідник

| # | Розділ | Для чого |
|---|---------|-----|
| 01 | [Що таке BC-250](docs/en/01-what-is-bc250.md) | характеристики, розміри, розпіновка, очікування |
| 02 | [Гайд із купівлі](docs/en/02-buying.md) | де, ціна, ризики, групові закупівлі |
| 03 | [Блок живлення](docs/en/03-power-supply.md) | LOP / Flex ATX, розпіновка 8-pin, монтаж проводки |
| 04 | [Охолодження](docs/en/04-cooling.md) | радіатор, кожухи для вентиляторів, методика тесту |
| 05 | [Корпуси та 3D-друк](docs/en/05-case.md) | каталог друкованих корпусів (STL) |
| 06 | [Драйвери та налаштування Linux](docs/en/06-linux.md) | вибір дистрибутива, amdgpu, встановлення |
| 07 | [Драйвери та налаштування Windows](docs/en/07-windows.md) | стан драйверів, інструкція |
| 08 | [BIOS та відновлення з «цеглини»](docs/en/08-bios.md) | модифікований BIOS, прошивка, оживлення |
| 09 | [Розгін та андервольтинг](docs/en/09-overclock-undervolt.md) | governor, SMU, розблокування 40CU |
| 10 | [WiFi- та Bluetooth-донгли](docs/en/10-wifi-bt.md) | донгли, які реально працюють |
| 11 | [Результати в іграх та налаштування](docs/en/11-gaming.md) | бенчмарки, тюнінг для кожної гри |
| 12 | [ШІ / LLM на BC-250](docs/en/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/en/13-macos.md) | стан |
| 14 | [Дисплей та вивід](docs/en/14-display.md) | DisplayPort, адаптери DP→HDMI, два екрани |
| 15 | [Емуляція](docs/en/15-emulation.md) | кожна консоль/платформа, реалістичний стан |
| 16 | [USB, хаби та накопичувачі](docs/en/16-usb-peripherals.md) | хаби, мод 5 В, адаптери M.2 / SATA |
| ❓ | [FAQ](docs/uk/faq.md) · [Усунення проблем](docs/uk/troubleshooting.md) | поширені проблеми |

---

## 🔗 Awesome-ресурси

Канонічні проєкти спільноти, відсортовані за тим, як часто на них посилалися.

### Документація
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) — головний апаратний довідник (зворотна розробка)
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [сайт](https://elektricm.github.io/amd-bc250-docs/) — вичерпна документація спільноти (розпіновки, по дистрибутивах, усунення проблем)
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — документація організації
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — збірки та скрипти

### Розгін / Андервольтинг / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — governor, на якому працює більшість збірок (задає частоти/напругу)
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — форк oberon-governor з графічним інтерфейсом (Linux)
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [форк bc250-collective](https://github.com/bc250-collective/cyan-skillfish-governor)
- [rw-r-r-0644/bc250-core-unlock](https://github.com/rw-r-r-0644/bc250-core-unlock) — розблокування 2 вимкнених ядер CPU (штатна маска 0x77; маска 0xB7 означає фізично дефектні ядра — примусове ввімкнення дає артефакти та краші)
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — розблокування всіх 40 CU
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Інструментарій та готові образи
- [redbeard1083/bc250-toolkit](https://github.com/redbeard1083/bc250-toolkit) — меню-орієнтоване налаштування для CachyOS: ядро, CPU/GPU governors, swap, ZRAM→ZSWAP, ACPI та твіки завантаження
- [62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images](https://github.com/62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images) — готові образи Bazzite Deck/GNOME/KDE із застосованими патчами BC-250

### Драйвери
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — драйвер GPU для Windows (експериментальний, без повного апаратного прискорення станом на початок 2026)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — робота над драйвером PSP/GPU
- [DryhoppedIPA/bc250-gfx1013-fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix) — патчі ядра та Mesa/RADV для зламаної черги обчислень GPU (async compute); також виправляє шлях FSR 4 / XeSS 3 INT8
- [MastaG/linux-cachyos-bc250](https://github.com/MastaG/linux-cachyos-bc250) — ядро CachyOS із чері-піками BC-250
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — ядро Linux

### BIOS / Прошивка
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — найчастіше згадувані образи BIOS та моди
- [TheRetroWeb — база даних BIOS BC-250](https://theretroweb.com/bios?itemsPerPage=24&chipsetIds%5B%5D=1990) — стокові дампи BIOS, перегляд/завантаження за версією
- [Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script](https://github.com/Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script) — керований через меню скрипт резервного копіювання прошивки та прошивки кастомної прошивки
- Прошивку та відновлення з «цеглини» див. у [docs/uk/08-bios.md](docs/en/08-bios.md)

### WiFi- / BT-донгли
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### ШІ / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Корпуси / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables та MakerWorld — див. [docs/en/05-case.md](docs/en/05-case.md)

---

## 🤝 Внесок

Це **живий** репозиторій. Знання витягуються з чату спільноти відтворюваним конвеєром (див. [CONTRIBUTING.md](CONTRIBUTING.md)) і повторно проганяються на нових експортах. Вітаються PR із виправленнями, новими донглами, новими корпусами та перевіреними командами.

## 📄 Ліцензія

Документація: [CC-BY-SA-4.0](LICENSE). Скрипти в `assets/scripts/`: MIT. Дзеркала стороннього firmware/драйверів зберігають оригінальні права — див. [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md).

## 🙏 Подяки

Усій спільноті BC-250 — див. **[CREDITS](CREDITS.md)** з переліком головних учасників, які зробили цей довідник можливим. Джерело: *чат AMD BC-250 community*. Автори проєктів зазначені за іменами їхніх репозиторіїв вище.
