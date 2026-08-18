<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — AMD BC-250 жаңадан келгендердің кітабы" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> **ASRock AMD BC-250** жаңадан келгендердің кітабы — PlayStation 5 негізіндегі APU тақтасы (Cyan Skillfish / Oberon, 6 ядролы Zen 2 + RDNA 2, 16 GB GDDR6) арзан **Linux ойын және AI мини-ПК** ретінде қайта пайдаланылған — DIY бюджеттік Steam Machine.

Қораптағы тақтадан ойын қосуға дейінгі бәрі осында — BC-250 қауымдастығының 130 мыңнан астам хабарламасынан сұрыпталып, адамдар лайк басып, бекіткені бойынша рейтингтелген әрі жобаның канондық репозиторийлерімен салыстырылған.

🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · **Қазақша** · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<sub>_Жаңартылып тұрады · соңғы жаңарту **2026 ж. тамыз** · [llms.txt](llms.txt) AI агенттеріне арналған_</sub>

---

## ❓ Жылдам жауаптар

- **ASRock AMD BC-250 деген не?** — PlayStation 5 негізіндегі APU тақтасы: 6 ядролы Zen 2 + 24/40 RDNA 2 CU («Cyan Skillfish»), 16 GB GDDR6 — бұрынғы майнинг картасы ретінде арзан сатылып, Linux ойын және AI мини-ПК-ға, DIY бюджеттік Steam Machine-ке айналдырылған.
- **Қанша тұрады?** Жалаң тақта шамамен **$60–130**; толық құрастыру (қорек көзі, салқындатқыш, SSD) **$150–250** шамасында болады. [Сатып алу](docs/kk/02-buying.md) бөлімін қараңыз.
- **Ойында қалай көрсетеді?** FSR / Frame-Gen және GPU+CPU оверклокымен көптеген ойындарда шамамен **1080p 60 FPS** (RX 6600 деңгейі). [Ойын нәтижелері](docs/kk/11-gaming.md) бөлімін қараңыз.
- **Қандай ОЖ керек?** GPU үдеуі үшін **тек Linux** — Bazzite, Fedora, CachyOS немесе Mesa 25.1+ Arch. Windows GPU драйвері жоқ. [Linux орнату](docs/kk/06-linux.md) бөлімін қараңыз.
- **LLM жүгірте алады ма?** Иә — llama.cpp / Ollama Vulkan арқылы 16 GB GDDR6-ны VRAM ретінде пайдаланады (шағын модельдерде ~30–47 ток/с). [AI / LLM](docs/kk/12-ai-llm.md) бөлімін қараңыз.
- **Қалай салқындату керек?** Жиынтықтағы серверлік радиатор үстелде қолдану кезінде тұншығып (throttle) қалады; қанаттарын жұқартып, 120 мм желдеткіш қосыңыз немесе сумен салқындатуға көшіңіз. [Салқындату](docs/kk/04-cooling.md) бөлімін қараңыз.

---

## ⚡ Осыдан бастаңыз

Жаңа тақта, ештеңе білмейсіз бе? Алтын жолды ретімен жүріп өтіңіз:

**[docs/kk/00-start-here.md](docs/kk/00-start-here.md)** — Сатып алу → Қуат → Салқындату → ОЖ орнату → Драйверлер → Оверклок → Ойнау.

---

## 📈 Баптау іс жүзінде не береді

Бұл тақтадағы әрбір баптау тетігі бір нәрсенің есесіне бір нәрсе береді. Маңыздылары — мына төртеуі; олар қауымдастық өлшеген мәліметтерден алынған — бірдеңені прошивкаламас бұрын оқып шығыңыз.

<p align="center">
  <img src="assets/diagrams/gpu-clock-tradeoff.svg" width="100%" alt="GPU ядро жиілігі: FPS өсімі 2000 МГц-ке қарай шамамен 95%-ке дейін көтеріледі, содан кейін CPU шектегендіктен тегістеледі, ал қуат пен жылу 95%-ке дейін өсе береді. Оңтайлы нүкте — шамамен 2000 МГц, шамамен +30% FPS.">
</p>

<p align="center">
  <img src="assets/diagrams/undervolt-tradeoff.svg" width="100%" alt="Андервольт: кернеу 1129 мВ-тан 700 мВ-қа түскенде тиімділік 20%-тен 95%-ке көтеріледі, ал тұрақсыздық тәуекелі 15%-тен 100%-ке өседі. Ойындарда тұрақты диапазон шамамен 905–955 мВ; 700 мВ-тан төменде GPU өзін 1500 МГц-ке бекітеді.">
</p>

<p align="center">
  <img src="assets/diagrams/cu40-tradeoff.svg" width="100%" alt="40-CU ашу: есептеу қуаты 40%-тен 90%-ке көтеріледі, ал ойын FPS-і тек 40%-тен 47%-ке дейін өзгереді, қуат пен тұрақсыздық 25%-тен 100%-ке өседі. 38 CU — типтік тұрақты максимум; 40 CU — 300 Вт-тан астам қуат пен AIO қажет ететін лотерея.">
</p>

<p align="center">
  <img src="assets/diagrams/memory-tradeoff.svg" width="100%" alt="GDDR6 жадын баптау: өткізу қабілеті мен FPS өсімі тек 30%-тен 52%-ке дейін өзгереді, ал «кірпішке» айналу тәуекелі 20%-тен 100%-ке өседі. 1950 МГц — тақталар «кірпіш» болып қайтқан деңгей.">
</p>

<p align="center">
  <img src="assets/diagrams/power-by-config.svg" width="100%" alt="Конфигурация бойынша розеткадан өлшенген тұтыну: 38 CU және 1200 МГц кезінде 850 мВ-та 200 Вт, 40 CU және 1800 МГц кезінде 860 мВ-та 260 Вт, 38 CU және 1500 МГц кезінде 310 Вт, 40 CU және 2000 МГц кезінде 960 мВ-та 350 Вт; 1025 мВ тек 2 Вт қосады. Хабарланған ең жақсы ватт/кадр көрсеткіші — 40 CU, 1800 МГц.">
</p>

Бұл бес нүкте — модель емес, өлшеулер: 1800-ден 2000 МГц-ке көшу шамамен 90 Вт шығындайды — бұл алдыңғы 600 МГц-тің құнымен шамалас — ал кернеуді 960 мВ-тан 1025 мВ-қа көтеру 2 Вт жылудан басқа ештеңе бермейді. 350 Вт жүктемеде 300 Вт қорек көзі 30 секунд ішінде ажырап қалады, ал +12V шинасы 26 А ток өткізіп тұрады.

<details>
<summary>Бос тұру қуаты — розеткадағы есептегіш неге әрең қозғалады</summary>

<p align="center">
  <img src="assets/diagrams/idle-power-tradeoff.svg" width="100%" alt="Бос тұру қуаты: governor, андервольт және авто-суспенд арқылы GPU тұтынуы 80 Вт-тан 5 Вт-қа төмендейді, бірақ розеткадан жалпы тұтыну тек 125 Вт-тан 110 Вт-қа төмендейді — суспенд оны 10 Вт-қа түсіргенге дейін.">
</p>

Governor мен андервольт GPU тұтынуын қысқартады, бірақ CPU мен GDDR6 бәрібір тұтына береді. Авто-суспенд іске қосылғанға дейін розеткадағы есептегіш мұны әрең байқайды. Ағыны жоғары партиялар шамамен 70–80 Вт-тан төмен түспейді.

</details>

<sub>Деректер көзі: [`assets/diagrams/data.json`](assets/diagrams/data.json) · `node assets/diagrams/build.mjs` арқылы қайта жасалады</sub>

---

## 📚 Анықтамалық

| # | Бөлім | Не үшін |
|---|---------|-----|
| 01 | [BC-250 деген не](docs/kk/01-what-is-bc250.md) | сипаттамалар, өлшемдер, пинаут, күтілетіні |
| 02 | [Сатып алу нұсқаулығы](docs/kk/02-buying.md) | қайдан, баға, тәуекелдер, бірлескен сатып алу |
| 03 | [Қуат көзі](docs/kk/03-power-supply.md) | LOP / Flex ATX, 8-пинді пинаут, сым тарту |
| 04 | [Салқындату](docs/kk/04-cooling.md) | радиатор, желдеткіш қаптамалары, сынау әдісі |
| 05 | [Корпустар және 3D басып шығару](docs/kk/05-case.md) | басып шығарылатын корпустар каталогы (STL) |
| 06 | [Linux драйверлері және орнату](docs/kk/06-linux.md) | дистрибутив таңдау, amdgpu, орнату |
| 07 | [Windows драйверлері және орнату](docs/kk/07-windows.md) | драйвер күйі, нұсқаулық |
| 08 | [BIOS және «кірпіштен» қалпына келтіру](docs/kk/08-bios.md) | мод BIOS, прошивка, «кірпіштен» шығару |
| 09 | [Оверклок және андервольт](docs/en/09-overclock-undervolt.md) | governor, SMU, 40CU ашу |
| 10 | [WiFi және Bluetooth донглдары](docs/kk/10-wifi-bt.md) | шынымен жұмыс істейтін донглдар |
| 11 | [Ойын нәтижелері және баптаулары](docs/kk/11-gaming.md) | бенчмарктар, ойынға қарай баптау |
| 12 | [BC-250-де AI / LLM](docs/kk/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/kk/13-macos.md) | күйі |
| 14 | [Дисплей және шығыс](docs/kk/14-display.md) | DisplayPort, DP→HDMI адаптерлер, қос экран |
| 15 | [Эмуляция](docs/kk/15-emulation.md) | әрбір консоль/платформа, нақты күйі |
| 16 | [USB, хабтар және сақтау](docs/kk/16-usb-peripherals.md) | хабтар, 5V мод, M.2 / SATA адаптерлер |
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
- [rw-r-r-0644/bc250-core-unlock](https://github.com/rw-r-r-0644/bc250-core-unlock) — өшірілген 2 CPU ядросын ашу (стандартты маска 0x77; 0xB7 маскасы физикалық ақаулы ядроларды білдіреді — мәжбүрлеп ашсаңыз, артефактілер мен құлаулар пайда болады)
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — барлық 40 CU-ды ашу
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Toolkits және дайын образдар
- [redbeard1083/bc250-toolkit](https://github.com/redbeard1083/bc250-toolkit) — CachyOS үшін мәзірмен басқарылатын баптау: ядро, CPU/GPU governor-лары, swap, ZRAM→ZSWAP, ACPI және жүктеу твиктері
- [62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images](https://github.com/62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images) — BC-250 патчтері қолданылған дайын Bazzite Deck/GNOME/KDE образдары

### Драйверлер
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — Windows GPU драйвері (эксперименттік, 2026 басы бойынша толық акселерация жоқ)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — PSP/GPU драйвер жұмысы
- [DryhoppedIPA/bc250-gfx1013-fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix) — бұзылған GPU compute кезегіне (async compute) арналған ядро + Mesa/RADV патчтері; сондай-ақ FSR 4 / XeSS 3 INT8 жолын түзетеді
- [MastaG/linux-cachyos-bc250](https://github.com/MastaG/linux-cachyos-bc250) — BC-250 cherry-pick-тері бар CachyOS ядросы
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — Linux ядросы

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — ең жиі сілтенетін BIOS образдары және модтары
- [TheRetroWeb — BC-250 BIOS дерекқоры](https://theretroweb.com/bios?itemsPerPage=24&chipsetIds%5B%5D=1990) — стандартты BIOS дамптары, нұсқасы бойынша қарау/жүктеу
- [Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script](https://github.com/Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script) — мәзірмен басқарылатын firmware сақтық көшірмесі және арнайы firmware прошивкалау
- Прошивка және «кірпіштен» қалпына келтіру үшін [docs/kk/08-bios.md](docs/kk/08-bios.md) қараңыз

### WiFi / BT донглдары
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### AI / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Корпустар / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables және MakerWorld — [docs/kk/05-case.md](docs/kk/05-case.md) қараңыз

---

## 🤝 Үлес қосу

Бұл — **тірі** репозиторий. Білім қауымдастық чатынан қайталанатын конвейер арқылы алынады (қараңыз [CONTRIBUTING.md](CONTRIBUTING.md)) және жаңа экспорттарда қайта іске қосылады. Түзетулері, жаңа донглдары, жаңа корпустары, тексерілген командалары бар PR-ларды қош көреміз.

## 📄 Лицензия

Құжаттама: [CC-BY-SA-4.0](LICENSE). `assets/scripts/` ішіндегі скрипттер: MIT. Айналған үшінші тарап firmware/драйверлері өзінің бастапқы құқықтарын сақтайды — [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md) қараңыз.

## 🙏 Алғыс

Бүкіл BC-250 қауымдастығына — осы анықтамалықты мүмкін еткен үздік үлес қосушылар үшін **[CREDITS](CREDITS.md)** қараңыз. Дереккөз: *AMD BC-250 community чаты*. Жоба авторлары жоғарыдағы репозиторий ныкнеймі бойынша атап өтілген.
