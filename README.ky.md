🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · **Кыргызча** · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — AMD BC-250 үчүн жаңы келгендердин библиясы" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> **AMD BC-250** үчүн жаңы келгендердин библиясы — PlayStation 5'тин негизинде жасалган APU-тактасы (Cyan Skillfish / Oberon, 16 GB GDDR6), арзан Linux оюн жана AI кутусу катары кайра колдонулган.

**Кутудагы тактадан оюн ишке киргенге чейин** керектүү бардык нерсе — BC-250 коомчулугунун 125 миңден ашык билдирүүсүнөн тандалып, адамдар чындап жактырган жана бекиткен нерселер боюнча иргелип, долбоордун расмий репозиторийлери менен текшерилген.

🌍 Тилдер: [English](README.md) (негизги) · **Кыргызча**

---

## ⚡ Ушундан башта

Жаңы такта, эч нерсе билбейсизби? Алтын жолду тартиби менен ээрчиңиз:

**[docs/ky/00-start-here.md](docs/ky/00-start-here.md)** — Сатып ал → Кубаттандыр → Сууткуч кой → ОС орнот → Драйверлер → Овершклоктоо → Ойно.

---

## 📚 Колдонмо

| # | Бөлүм | Эмне үчүн |
|---|---------|-----|
| 01 | [BC-250 деген эмне](docs/en/01-what-is-bc250.md) | мүнөздөмөлөр, өлчөмдөр, пиноут, күтүүлөр |
| 02 | [Сатып алуу боюнча колдонмо](docs/en/02-buying.md) | кайдан, баасы, тобокелдиктер, биргелешип сатып алуу |
| 03 | [Кубат булагы](docs/en/03-power-supply.md) | LOP / Flex ATX, 8-pin пиноут, зымдоо |
| 04 | [Сууткуч](docs/en/04-cooling.md) | радиатор, желдеткич кожуху, тест ыкмасы |
| 05 | [Корпустар жана 3D басып чыгаруу](docs/en/05-case.md) | басып чыгаруучу корпустардын каталогу (STL) |
| 06 | [Linux драйверлери жана орнотуу](docs/en/06-linux.md) | дистрибутив тандоо, amdgpu, орнотуу |
| 07 | [Windows драйверлери жана орнотуу](docs/en/07-windows.md) | драйвердин абалы, кантип жасоо |
| 08 | [BIOS жана «кирпич»ти калыбына келтирүү](docs/en/08-bios.md) | мод BIOS, прошивкалоо, «кирпич»тен чыгаруу |
| 09 | [Овершклоктоо жана андервольттоо](docs/en/09-overclock-undervolt.md) | governor, SMU, 40CU ачуу |
| 10 | [WiFi жана Bluetooth донглдары](docs/en/10-wifi-bt.md) | чындап иштеген донглдар |
| 11 | [Оюн натыйжалары жана жөндөөлөр](docs/en/11-gaming.md) | бенчмарктар, ар бир оюн боюнча жөндөө |
| 12 | [BC-250'де AI / LLM](docs/en/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/en/13-macos.md) | абалы |
| 14 | [Дисплей жана чыгаруу](docs/en/14-display.md) | DisplayPort, DP→HDMI адаптерлери, кош экран |
| 15 | [Эмуляция](docs/en/15-emulation.md) | ар бир консоль/платформа, реалдуу абалы |
| 16 | [USB, хабдар жана сактагыч](docs/en/16-usb-peripherals.md) | хабдар, 5V мод, M.2 / SATA адаптерлери |
| ❓ | [FAQ](docs/ky/faq.md) · [Ката издөө](docs/ky/troubleshooting.md) | кеңири таралган маселелер |

---

## 🔗 Сонун ресурстар

Коомчулук көп шилтеме кылган негизги долбоорлор, шилтеме жыштыгы боюнча иргелген.

### Документация
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) — аппараттык бөлүк боюнча негизги маалымдама (reverse-engineering)
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [сайт](https://elektricm.github.io/amd-bc250-docs/) — коомчулуктун толук документациясы (пиноуттар, ар бир дистрибутив, ката издөө)
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — уюмдун документациясы
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — курулмалар жана скрипттер

### Овершклок / Андервольт / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — көпчүлүк курулмалар колдонгон governor (жыштык/чыңалууну коёт)
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — GUI'си бар oberon-governor форку (Linux)
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [bc250-collective форку](https://github.com/bc250-collective/cyan-skillfish-governor)
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — бардык 40 CU'ну ачуу
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Драйверлер
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — Windows GPU драйвери (эксперименталдык, 2026-жылдын башында толук ылдамдатуу жок)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — PSP/GPU драйвери боюнча иш
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — Linux ядросу

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — эң көп шилтеме кылынган BIOS образдары жана моддору
- Прошивкалоо жана «кирпич»тен калыбына келтирүү үчүн [docs/ky/08-bios.md](docs/en/08-bios.md) кара

### WiFi / BT донглдары
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### AI / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Корпустар / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables жана MakerWorld — [docs/ky/05-case.md](docs/en/05-case.md) кара

---

## 🤝 Салым кошуу

Бул — **жандуу** репозиторий. Билим коомчулуктун чатынан кайталануучу конвейер аркылуу алынат (карагыла: [CONTRIBUTING.md](CONTRIBUTING.md)) жана жаңы экспорттордо кайра иштетилет. Оңдоолор, жаңы донглдар, жаңы корпустар, текшерилген буйруктар менен PR'лар кубаттала турат.

## 📄 Лицензия

Документация: [CC-BY-SA-4.0](LICENSE). `assets/scripts/` алдындагы скрипттер: MIT. Көчүрмөлөнгөн үчүнчү тараптын firmware/драйверлери өздөрүнүн баштапкы укуктарын сактайт — [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md) кара.

## 🙏 Ыраазычылык

Бүткүл BC-250 коомчулугуна — бул колдонмону мүмкүн кылган мыкты салым кошуучулар үчүн **[CREDITS](CREDITS.md)** кара. Булак: *AMD BC-250 коомчулугунун чаты*. Долбоор авторлору жогоруда репозиторий аттары менен белгиленген.
