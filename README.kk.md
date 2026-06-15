🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · **Қазақша** · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — AMD BC-250 жаңадан келгендердің кітабы" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> **AMD BC-250** жаңадан келгендердің кітабы — PlayStation 5 негізіндегі APU тақтасы (Cyan Skillfish / Oberon, 16 GB GDDR6), арзан Linux ойын және AI машинасы ретінде қайта пайдаланылады.

Қораптағы тақтадан ойын қосуға дейінгі бәрі осында — BC-250 қауымдастығының 125 мыңнан астам хабарламасынан сұрыпталып, адамдар нақты лайк басып, бекіткені бойынша рейтингтелген әрі жобаның канондық репозиторийлерімен салыстырылған.

🌍 Languages: [English](README.md) (негізгі) · **Қазақша**

---

## ⚡ Осыдан бастаңыз

Жаңа тақта, ештеңе білмейсіз бе? Алтын жолды ретімен жүріп өтіңіз:

**[docs/kk/00-start-here.md](docs/kk/00-start-here.md)** — Сатып алу → Қуат → Салқындату → ОЖ орнату → Драйверлер → Оверклок → Ойнау.

---

## 📚 Анықтамалық

| # | Бөлім | Не үшін |
|---|---------|-----|
| 01 | [BC-250 деген не](docs/en/01-what-is-bc250.md) | сипаттамалар, өлшемдер, пинаут, күтілетіні |
| 02 | [Сатып алу нұсқаулығы](docs/en/02-buying.md) | қайдан, баға, тәуекелдер, бірлескен сатып алу |
| 03 | [Қуат көзі](docs/en/03-power-supply.md) | LOP / Flex ATX, 8-пинді пинаут, сым тарту |
| 04 | [Салқындату](docs/en/04-cooling.md) | радиатор, желдеткіш қаптамалары, сынау әдісі |
| 05 | [Корпустар және 3D басып шығару](docs/en/05-case.md) | басып шығарылатын корпустар каталогы (STL) |
| 06 | [Linux драйверлері және орнату](docs/en/06-linux.md) | дистрибутив таңдау, amdgpu, орнату |
| 07 | [Windows драйверлері және орнату](docs/en/07-windows.md) | драйвер күйі, нұсқаулық |
| 08 | [BIOS және «кірпіштен» қалпына келтіру](docs/en/08-bios.md) | мод BIOS, прошивка, «кірпіштен» шығару |
| 09 | [Оверклок және андервольт](docs/en/09-overclock-undervolt.md) | governor, SMU, 40CU ашу |
| 10 | [WiFi және Bluetooth донглдары](docs/en/10-wifi-bt.md) | шынымен жұмыс істейтін донглдар |
| 11 | [Ойын нәтижелері және баптаулары](docs/en/11-gaming.md) | бенчмарктар, ойынға қарай баптау |
| 12 | [BC-250-де AI / LLM](docs/en/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/en/13-macos.md) | күйі |
| 14 | [Дисплей және шығыс](docs/en/14-display.md) | DisplayPort, DP→HDMI адаптерлер, қос экран |
| 15 | [Эмуляция](docs/en/15-emulation.md) | әрбір консоль/платформа, нақты күйі |
| 16 | [USB, хабтар және сақтау](docs/en/16-usb-peripherals.md) | хабтар, 5V мод, M.2 / SATA адаптерлер |
| ❓ | [FAQ](docs/kk/faq.md) · [Ақаулықтарды жою](docs/kk/troubleshooting.md) | жиі кездесетін мәселелер |

---

## 🔗 Пайдалы ресурстар

Қауымдастық қаншалықты жиі сілтегеніне қарай рейтингтелген канондық жобалар.

### Құжаттама
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) — басты аппараттық анықтамалық (кері инженерия)
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [сайт](https://elektricm.github.io/amd-bc250-docs/) — толық қауымдастық құжаттамасы (пинауттар, дистрибутивтер бойынша, ақаулықтарды жою)
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — ұйым құжаттамасы
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — құрастырулар және скрипттер

### Оверклок / Андервольт / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — көпшілік құрастыруда жұмыс істейтін governor (жиілік/кернеу орнатады)
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — графикалық интерфейсі бар oberon-governor форкы (Linux)
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [bc250-collective форкы](https://github.com/bc250-collective/cyan-skillfish-governor)
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — барлық 40 CU-ды ашу
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Драйверлер
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — Windows GPU драйвері (эксперименттік, 2026 басы бойынша толық акселерация жоқ)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — PSP/GPU драйвер жұмысы
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — Linux ядросы

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — ең жиі сілтенетін BIOS образдары және модтары
- Прошивка және «кірпіштен» қалпына келтіру үшін [docs/kk/00-start-here.md](docs/kk/00-start-here.md) және [docs/en/08-bios.md](docs/en/08-bios.md) қараңыз

### WiFi / BT донглдары
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### AI / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Корпустар / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables және MakerWorld — [docs/en/05-case.md](docs/en/05-case.md) қараңыз

---

## 🤝 Үлес қосу

Бұл — **тірі** репозиторий. Білім қауымдастық чатынан қайталанатын конвейер арқылы алынады (қараңыз [CONTRIBUTING.md](CONTRIBUTING.md)) және жаңа экспорттарда қайта іске қосылады. Түзетулері, жаңа донглдары, жаңа корпустары, тексерілген командалары бар PR-ларды қош көреміз.

## 📄 Лицензия

Құжаттама: [CC-BY-SA-4.0](LICENSE). `assets/scripts/` ішіндегі скрипттер: MIT. Айналған үшінші тарап firmware/драйверлері өзінің бастапқы құқықтарын сақтайды — [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md) қараңыз.

## 🙏 Алғыс

Бүкіл BC-250 қауымдастығына — осы анықтамалықты мүмкін еткен үздік үлес қосушылар үшін **[CREDITS](CREDITS.md)** қараңыз. Дереккөз: *AMD BC-250 community чаты*. Жоба авторлары жоғарыдағы репозиторий ныкнеймі бойынша атап өтілген.
