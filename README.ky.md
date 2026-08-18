<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — AMD BC-250 үчүн жаңы келгендердин библиясы" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> **ASRock AMD BC-250** үчүн жаңы келгендердин библиясы — PlayStation 5'тин негизинде жасалган APU-тактасы (Cyan Skillfish / Oberon, 6 ядролуу Zen 2 + RDNA 2, 16 GB GDDR6) арзан **Linux оюн жана AI кутусу** катары кайра колдонулган — өз колуң менен жасалган бюджеттик Steam Machine.

**Кутудагы тактадан оюн ишке киргенге чейин** керектүү бардык нерсе — BC-250 коомчулугунун 130k+ билдирүүсүнөн тандалып, адамдар чындап жактырган жана бекиткен нерселер боюнча иргелип, канондук долбоор репозиторийлери менен текшерилген.

🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · **Кыргызча** · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<sub>_Көмөк көрсөтүлөт · акыркы жаңыртуу **2026-жыл, август** · [llms.txt](llms.txt) AI агенттери үчүн_</sub>

---

## ❓ Тез жооптор

- **ASRock AMD BC-250 деген эмне?** PlayStation 5'тин негизинде жасалган APU-такта — 6 ядролуу Zen 2 + 24/40 RDNA 2 CU ("Cyan Skillfish"), 16 GB GDDR6 — мурунку майнинг картасы катары арзан сатылып, Linux оюн жана AI кутусуна, өз колуң менен жасалган бюджеттик Steam Machine'ге айландырылган.
- **Канча турат?** Жалаң такта болжол менен **$60–130**; толук курулма (Кубат булагы, сууткуч, SSD) **$150–250** тегерегинде. [Сатып алуу](docs/ky/02-buying.md) кара.
- **Оюндарда кандай?** FSR / Frame-Gen жана GPU+CPU овершклогу менен көпчүлүк оюндарда болжол менен **1080p 60 FPS** (RX 6600 классындай). [Оюн натыйжалары](docs/ky/11-gaming.md) кара.
- **Кайсы ОС?** GPU ылдамдатуусу үчүн **тек Linux** — Mesa 25.1+ менен Bazzite, Fedora, CachyOS же Arch. Windows GPU драйвери жок. [Linux орнотуу](docs/ky/06-linux.md) кара.
- **LLM'дерди иштете алабы?** Ооба — Vulkan аркылуу llama.cpp / Ollama 16 GB GDDR6'ны VRAM катары колдонот (чакан моделдерде ~30–47 tok/s). [AI / LLM](docs/en/12-ai-llm.md) кара.
- **Кантип суутам?** Заводдук сервер радиатору столдо троттлинг кылат; канаттарды ичкерип, 120 мм желдеткич кошуңуз, же суу муздатууга өтүңүз. [Сууткуч](docs/ky/04-cooling.md) кара.

---

## ⚡ Ушундан башта

Жаңы такта, эч нерсе билбейсизби? Алтын жолду тартиби менен ээрчиңиз:

**[docs/ky/00-start-here.md](docs/ky/00-start-here.md)** — Сатып ал → Кубаттандыр → Сууткуч кой → ОС орнот → Драйверлер → Овершклоктоо → Ойно.

---

## 📈 Тюнинг чынында эмне берет

Бул тактадагы ар бир бурама белгилүү бир нерсенин эсебинен келет. Маанилүүлөрү төртөө — алар коомчулук өлчөгөн маалыматтардан алынган; эч нерсени прошивкалаганга чейин окуп чыгыңыз.

<p align="center">
  <img src="assets/diagrams/gpu-clock-tradeoff.svg" width="100%" alt="GPU ядро жыштыгы: FPS өсүшү 2000 MHz'ке чейин болжол менен 95%ке жетип, андан кийин CPU аны чектегендиктен тегизделет, ал эми кубат жана жылуулук 95%ке чейин көтөрүлө берет. Эң ыңгайлуу чекит 2000 MHz тегереги, болжол менен +30% FPS.">
</p>

<p align="center">
  <img src="assets/diagrams/undervolt-tradeoff.svg" width="100%" alt="Андервольт: чыңалуу 1129 mV'тен 700 mV'ке түшкөндө эффективдүүлүк 20%тен 95%ке көтөрүлөт, ал эми туруксуздук коркунучу 15%тен 100%ке көтөрүлөт. Оюндар үчүн туруктуу диапазон болжол менен 905 mV'тен 955 mV'ке чейин; 700 mV'тен төмөн GPU өзүн 1500 MHz'ке бекитет.">
</p>

<p align="center">
  <img src="assets/diagrams/cu40-tradeoff.svg" width="100%" alt="40-CU ачуу: эсептөө күчү 40%тен 90%ке көтөрүлөт, ал эми оюн FPS'и 40%тен 47%ке гана өзгөрөт, кубат туруксуздук менен 25%тен 100%ке көтөрүлөт. 38 CU — адаттагы туруктуу максимум; 40 CU — 300 W'тан ашык жана AIO талап кылган лотерея.">
</p>

<p align="center">
  <img src="assets/diagrams/memory-tradeoff.svg" width="100%" alt="GDDR6 эс тутумун жөндөө: өткөрүү жөндөмдүүлүгү жана FPS өсүшү 30%тен 52%ке гана өзгөрөт, ал эми «кирпич» болуу коркунучу 20%тен 100%ке көтөрүлөт. 1950 MHz — такталар «кирпич» болуп кайткан чекит.">
</p>

<p align="center">
  <img src="assets/diagrams/power-by-config.svg" width="100%" alt="Конфигурация боюнча розеткадан тартылган кубат: 850 mV'те 38 CU жана 1200 MHz — 200 W, 860 mV'те 40 CU жана 1800 MHz — 260 W, 38 CU жана 1500 MHz — 310 W, 960 mV'те 40 CU жана 2000 MHz — 350 W, ал эми 1025 mV болгону 2 W кошот. Билдирилген эң мыкты ватт/кадр чекити — 1800 MHz'те 40 CU.">
</p>

Ал беш чекит — модель эмес, өлчөөлөр: 1800'дөн 2000 MHz'ке өтүү болжол менен 90 W турат — бул мурунку 600 MHz канча турса, болжол менен ошончо — ал эми 960 mV'ти 1025 mV'ке көтөрүү 2 W жылуулуктан башка эч нерсе бербейт. 350 W болгондо 300 W кубат булагы 30 секунд ичинде өчөт, ал эми +12V шинасы 26 A ток өткөрүп жатат.

<details>
<summary>Бош тургандагы кубат — эмне үчүн розетка эсептегичи араң кыймылдайт</summary>

<p align="center">
  <img src="assets/diagrams/idle-power-tradeoff.svg" width="100%" alt="Бош тургандагы кубат: governor, андервольт жана автоматтык күтүү режиминде GPU тартуусу 80 W'тан 5 W'ка түшөт, бирок жалпы розеткадан тартуу күтүү режими аны 10 W'ка түшүргөнгө чейин 125 W'тан 110 W'ка гана түшөт.">
</p>

Governor жана андервольт GPU'ну кыскартат, бирок CPU менен GDDR6 баары бир тартыла берет. Автоматтык күтүү режими иштеткиче розетка эсептегичи аны араң байкайт. Жогорку агып кетүүчү партиялар болжол менен 70–80 W'та токтойт.

</details>

<sub>Булак маалыматтар: [`assets/diagrams/data.json`](assets/diagrams/data.json) · `node assets/diagrams/build.mjs` менен кайра куруу</sub>

---

## 📚 Колдонмо

| # | Бөлүм | Эмне үчүн |
|---|---------|-----|
| 01 | [BC-250 деген эмне](docs/ky/01-what-is-bc250.md) | мүнөздөмөлөр, өлчөмдөр, пиноут, күтүүлөр |
| 02 | [Сатып алуу боюнча колдонмо](docs/ky/02-buying.md) | кайдан, баасы, тобокелдиктер, биргелешип сатып алуу |
| 03 | [Кубат булагы](docs/ky/03-power-supply.md) | LOP / Flex ATX, 8-pin пиноут, зымдоо |
| 04 | [Сууткуч](docs/ky/04-cooling.md) | радиатор, желдеткич кожуху, тест ыкмасы |
| 05 | [Корпустар жана 3D басып чыгаруу](docs/ky/05-case.md) | басып чыгаруучу корпустардын каталогу (STL) |
| 06 | [Linux драйверлери жана орнотуу](docs/ky/06-linux.md) | дистрибутив тандоо, amdgpu, орнотуу |
| 07 | [Windows драйверлери жана орнотуу](docs/ky/07-windows.md) | драйвердин абалы, кантип жасоо |
| 08 | [BIOS жана «кирпич»ти калыбына келтирүү](docs/ky/08-bios.md) | мод BIOS, прошивкалоо, «кирпич»тен чыгаруу |
| 09 | [Овершклоктоо жана андервольттоо](docs/ky/09-overclock-undervolt.md) | governor, SMU, 40CU ачуу |
| 10 | [WiFi жана Bluetooth донглдары](docs/ky/10-wifi-bt.md) | чындап иштеген донглдар |
| 11 | [Оюн натыйжалары жана жөндөөлөр](docs/ky/11-gaming.md) | бенчмарктар, ар бир оюн боюнча жөндөө |
| 12 | [BC-250'де AI / LLM](docs/en/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/ky/13-macos.md) | абалы |
| 14 | [Дисплей жана чыгаруу](docs/ky/14-display.md) | DisplayPort, DP→HDMI адаптерлери, кош экран |
| 15 | [Эмуляция](docs/en/15-emulation.md) | ар бир консоль/платформа, реалдуу абалы |
| 16 | [USB, хабдар жана сактагыч](docs/en/16-usb-peripherals.md) | хабдар, 5V мод, M.2 / SATA адаптерлери |
| ❓ | [FAQ](docs/ky/faq.md) · [Ката издөө](docs/ky/troubleshooting.md) | кеңири таралган маселелер |

---

## 🔗 Сонун ресурстар

Канондук коомчулук долбоорлору, коомчулук аларга канчалык көп шилтеме кылгандыгына жараша иргелген.

### Документация
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) — аппараттык бөлүк боюнча негизги маалымдама (reverse-engineering)
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [сайт](https://elektricm.github.io/amd-bc250-docs/) — коомчулуктун толук документациясы (пиноуттар, ар бир дистрибутив, ката издөө)
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — уюмдун документациясы
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — курулмалар жана скрипттер

### Овершклок / Андервольт / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — көпчүлүк курулмалар колдонгон governor (жыштыкты жана чыңалууну коёт)
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — Linux GUI'си бар oberon-governor форку
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [bc250-collective форку](https://github.com/bc250-collective/cyan-skillfish-governor)
- [rw-r-r-0644/bc250-core-unlock](https://github.com/rw-r-r-0644/bc250-core-unlock) — өчүрүлгөн 2 CPU ядросун ачуу (заводдук маска 0x77; 0xB7 маска физикалык жактан бузулган ядролорду билдирет — мажбурлоо артефакттарды жана крэштерди берет)
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — бардык 40 CU'ну ачуу
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Куралдар жана даяр образдор
- [redbeard1083/bc250-toolkit](https://github.com/redbeard1083/bc250-toolkit) — CachyOS үчүн меню менен башкарылуучу орнотуу: ядро, CPU/GPU governor'лору, swap, ZRAM→ZSWAP, ACPI жана boot тууралоолору
- [62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images](https://github.com/62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images) — BC-250 патчтары колдонулган даяр Bazzite Deck/GNOME/KDE образдоры

### Драйверлер
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — Windows GPU драйвери (эксперименталдык, 2026-жылдын башында толук ылдамдатуу жок)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — PSP жана GPU драйверлерин иштеп чыгуу
- [DryhoppedIPA/bc250-gfx1013-fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix) — бузулган GPU compute кезеги (async compute) үчүн ядро + Mesa/RADV патчтары; ошондой эле FSR 4 / XeSS 3 INT8 жолун оңдойт
- [MastaG/linux-cachyos-bc250](https://github.com/MastaG/linux-cachyos-bc250) — BC-250 cherry-pick'тери менен CachyOS ядросу
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — Linux ядросу

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — эң көп шилтеме кылынган BIOS образдары жана моддору
- [TheRetroWeb — BC-250 BIOS базасы](https://theretroweb.com/bios?itemsPerPage=24&chipsetIds%5B%5D=1990) — заводдук BIOS дамптары, версия боюнча карап/жүктөө
- [Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script](https://github.com/Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script) — меню менен башкарылуучу firmware резервдик көчүрмөсү жана ыңгайлаштырылган firmware прошивкалоо
- Прошивкалоо жана «кирпич»тен калыбына келтирүү үчүн [docs/ky/08-bios.md](docs/ky/08-bios.md) кара

### WiFi / BT донглдары
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### AI / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Корпустар / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables жана MakerWorld — [docs/ky/05-case.md](docs/ky/05-case.md) кара

---

## 🤝 Салым кошуу

Бул — **жандуу** репозиторий. Билим коомчулуктун чатынан кайталануучу конвейер аркылуу алынат (карагыла: [CONTRIBUTING.md](CONTRIBUTING.md)) жана жаңы экспорттордо кайра иштетилет. Оңдоолор, жаңы донглдар, жаңы корпустар, текшерилген буйруктар менен PR'лар кубаттала турат.

## 📄 Лицензия

Документация: [CC-BY-SA-4.0](LICENSE). `assets/scripts/` алдындагы скрипттер: MIT. Көчүрмөлөнгөн үчүнчү тараптын firmware/драйверлери өздөрүнүн баштапкы укуктарын сактайт — [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md) кара.

## 🙏 Ыраазычылык

Бүткүл BC-250 коомчулугуна — бул колдонмону мүмкүн кылган мыкты салым кошуучулар үчүн **[CREDITS](CREDITS.md)** кара. Булак: *AMD BC-250 коомчулугунун чаты*. Долбоор авторлору жогоруда репозиторий аттары менен белгиленген.
