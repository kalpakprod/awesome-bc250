🌍 [English](README.md) · [Русский](README.ru.md) · **Українська** · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — біблія новачка для AMD BC-250" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> Біблія новачка для **AMD BC-250** — APU-плати на базі PlayStation 5 (Cyan Skillfish / Oberon, 16 ГБ GDDR6), переробленої на дешевий бокс для ігор та ШІ під Linux.

Усе, що потрібно, щоб пройти шлях **від плати в коробці до запущених ігор** — зібрано з 125 тис.+ повідомлень спільноти BC-250, відсортовано за тим, що люди реально вподобали та закріплювали, і звірено з канонічними репозиторіями проєкту.

🌍 Languages: [English](README.md) (основна) · **Українська**

---

## ⚡ Почніть звідси

Нова плата, нічого не знаєте? Пройдіть золотий шлях по порядку:

**[docs/uk/00-start-here.md](docs/uk/00-start-here.md)** — Купівля → Живлення → Охолодження → Встановлення ОС → Драйвери → Розгін → Гра.

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
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — розблокування всіх 40 CU
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Драйвери
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — драйвер GPU для Windows (експериментальний, без повного апаратного прискорення станом на початок 2026)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — робота над драйвером PSP/GPU
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — ядро Linux

### BIOS / Прошивка
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — найчастіше згадувані образи BIOS та моди
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
