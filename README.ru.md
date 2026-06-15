<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — библия новичка для AMD BC-250" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> Библия новичка для **AMD BC-250** — платы на базе APU от PlayStation 5 (Cyan Skillfish / Oberon, 16 ГБ GDDR6), превращённой в дешёвый Linux-бокс для игр и AI.

Всё, чтобы пройти путь **от платы в коробке до запущенной игры** — выжато из 125k+ сообщений комьюнити BC-250, ранжировано по тому, что люди реально лайкали и закрепляли, и сверено с каноническими репозиториями проекта.

🌍 [English](README.md) · **Русский** · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

---

## ⚡ Начни здесь

Новая плата, ничего не знаешь? Иди по золотому пути по порядку:

**[docs/ru/00-start-here.md](docs/ru/00-start-here.md)** — Купить → Питание → Охлаждение → Поставить ОС → Дрова → Разгон → Играть.

---

## 📚 Хэндбук

| # | Раздел | Для чего |
|---|---------|-----|
| 01 | [Что такое BC-250](docs/ru/01-what-is-bc250.md) | спеки, размеры, пинаут, ожидания |
| 02 | [Гайд по покупке](docs/ru/02-buying.md) | где, цена, риски, групповые заказы |
| 03 | [Блок питания](docs/ru/03-power-supply.md) | LOP / Flex ATX, пинаут 8-pin, провода |
| 04 | [Охлаждение](docs/ru/04-cooling.md) | радиатор, шрауды, метод теста |
| 05 | [Корпуса и 3D-печать](docs/ru/05-case.md) | каталог печатных корпусов (STL) |
| 06 | [Дрова Linux и настройка](docs/ru/06-linux.md) | выбор дистрибутива, amdgpu, установка |
| 07 | [Дрова Windows и настройка](docs/ru/07-windows.md) | статус драйверов, как |
| 08 | [BIOS и восстановление](docs/ru/08-bios.md) | мод-BIOS, прошивка, раскирпичивание |
| 09 | [Разгон и андервольт](docs/ru/09-overclock-undervolt.md) | governor, SMU, разблок 40CU |
| 10 | [WiFi и Bluetooth донглы](docs/ru/10-wifi-bt.md) | донглы, которые реально работают |
| 11 | [Результаты в играх и настройки](docs/ru/11-gaming.md) | бенчмарки, тюнинг под игры |
| 12 | [AI / LLM на BC-250](docs/ru/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/ru/13-macos.md) | статус |
| 14 | [Дисплей и вывод](docs/ru/14-display.md) | DisplayPort, переходники DP→HDMI, 2 экрана |
| 15 | [Эмуляция](docs/ru/15-emulation.md) | все консоли/платформы, реальный статус |
| 16 | [USB, хабы и накопители](docs/ru/16-usb-peripherals.md) | хабы, 5V-мод, M.2 / SATA адаптеры |
| ❓ | [FAQ](docs/ru/faq.md) · [Решение проблем](docs/ru/troubleshooting.md) | частые проблемы |

---

## 🔗 Awesome-ресурсы

Канонические проекты комьюнити, ранжированы по частоте упоминаний.

### Документация
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) — главный референс по железу (реверс-инжиниринг)
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [сайт](https://elektricm.github.io/amd-bc250-docs/) — подробные доки комьюнити (пинауты, по дистрибутивам, troubleshooting)
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — доки организации
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — сборки и скрипты

### Разгон / андервольт / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — губернатор, на котором живёт большинство (частоты/напряжение)
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — форк oberon-governor с GUI (Linux)
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [форк bc250-collective](https://github.com/bc250-collective/cyan-skillfish-governor)
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — разблок всех 40 CU
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Драйверы
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — Windows-драйвер GPU (экспериментальный, без полного ускорения на начало 2026)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — работа над PSP/GPU-драйвером
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — ядро Linux

### BIOS / прошивки
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — самые упоминаемые образы BIOS и моды
- Прошивка и раскирпичивание — см. [docs/ru/08-bios.md](docs/ru/08-bios.md)

### WiFi / BT донглы
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### AI / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Корпуса / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables и MakerWorld — см. [docs/ru/05-case.md](docs/ru/05-case.md)

---

## 🤝 Вклад

Это **живой** репозиторий. Знание извлекается из чата комьюнити переисполняемым пайплайном (см. [CONTRIBUTING.md](CONTRIBUTING.md)) и пересобирается на новых экспортах. PR с фиксами, новыми донглами, корпусами, проверенными командами — велкам.

## 📄 Лицензия

Доки: [CC-BY-SA-4.0](LICENSE). Скрипты в `assets/scripts/`: MIT. Зеркалированные сторонние прошивки/драйверы сохраняют права владельцев — см. [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md).

## 🙏 Благодарности

Всему комьюнити BC-250 — см. **[CREDITS](CREDITS.ru.md)** с топ-контрибьюторами, благодаря которым этот хэндбук есть. Источник: *чат AMD BC-250 community*. Авторы проектов указаны по их репозиториям выше.
