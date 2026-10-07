# Програми, апскейлери та інструменти BC250

Практичний шлях: що вибрати, що встановити, як повʼязані проєкти та як повернутися назад. Основа — документація розробників, перевірена 7 жовтня 2026 року. Основні посилання ведуть на проєкти й релізи, а не файли всередині повідомлень чату.

## З чого почати

1. Налаштуй живлення й охолодження за [посібником для нової плати](00-start-here.md). Спочатку отримай стабільну роботу без розгону й розблокування.
2. Вибери систему в [розділі Linux](06-linux.md): Bazzite Deck для консольного інтерфейсу, CachyOS/Arch для змінюваної системи та налаштування, Fedora для робочого Linux. Це вибір способу роботи, а не універсальний рейтинг FPS.
3. Встанови **BC250 Control Center** для єдиної панелі. Інші toolkit-проєкти залишаються альтернативами; не запускай одночасно кілька говернорів чи автоматичних налаштовувачів одного параметра.
4. Після перевірки звичайної гри вибирай апскейлер. **FSR4 DLL**, **HelixSR** та **lsfg-vk** розвʼязують різні завдання; встановлювати все одразу не потрібно.
5. Для macOS є **MetalCyan**, але з обмеженнями. [Вимоги та встановлення](13-macos.md).

## BC250 Control Center

**Проєкт та автори:** [movacx/bc250-control-center](https://github.com/movacx/bc250-control-center) · [Релізи](https://github.com/movacx/bc250-control-center/releases/latest).

Панель поєднує моніторинг, частоти й напруги GPU/CPU, CU, вентилятори, памʼять, підготовку BIOS та виправлення сумісності. Це інтерфейс над розробками спільноти, а не новий графічний драйвер.

### Встановлення

На Arch/CachyOS із вже налаштованим AUR:

```bash
yay -S bc250-control-center-git
```

Або завантаж пакет релізу для своєї системи:

```bash
# Arch / CachyOS / Manjaro
sudo pacman -U ./bc250-control-center-*-any.pkg.tar.zst
# Fedora / Nobara
sudo dnf install ./bc250-control-center-*.rpm
# Bazzite / Fedora Atomic: встановлення в новий deployment
sudo rpm-ostree install ./bc250-control-center-*.rpm
# Ubuntu / Debian: apt встановить залежності
sudo apt install ./bc250-control-center_*.deb
```

На Bazzite перезавантажся в новий deployment. Оновлення SteamOS може видалити системне встановлення: скористайся **Reinstall BC250 Control Center** у Desktop Mode та знову підготуй залежності. SteamOS не використовує той самий шлях, що встановлення RPM у Bazzite.

### Перший запуск, перевірка та відкат

1. Вибери мову та підготовку залежностей для своєї системи.
2. Перевір статус потрібного модуля: що встановлено, чого бракує, які дії запропоновано.
3. Подивись на датчики й поточну конфігурацію перед змінами частот, вентиляторів чи CU.
4. Змінюй одну групу параметрів за раз. Наявність кнопки не доводить справності всіх вимкнених ядер чи WGP.
5. **Decky Quick Access** встановлюється окремо через Dashboard → Decky, а не автоматично під час звичайної підготовки залежностей.

Перевір, що застосунок бачить плату, працює лише один говернор і звичайна гра не отримала нових зависань. Телеметрія VRM через I2C потребує фізичного підключення.

Поверни змінені параметри **до** видалення застосунку. Видаляй пакет `bc250-control-center` менеджером пакетів своєї системи; це не скасовує встановлені драйвери, сервіси чи BIOS. Для старого встановлення `install-local.sh` передбачено `scripts/uninstall-local.sh`.

### Зовнішні інструменти та автори

| Завдання | Розробки спільноти | Важлива відмінність |
|---|---|---|
| Частоти GPU | [Cyan governor](https://github.com/filippor/cyan-skillfish-governor/tree/smu), [Oberon](https://gitlab.com/mothenjoyer69/oberon-governor) | Альтернативи, не одночасні сервіси |
| CPU та SMU | [bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc), [core-unlock](https://github.com/rw-r-r-0644/bc250-core-unlock), [EFI unlock](https://github.com/Hexxeh/bc250-efi-core-unlock) | Частоти та розблокування — різні операції |
| CU/WGP | [cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager), [40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) | Кількість увімкнених блоків не доводить справності |
| Драйвери | [GFX1013 fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix), [CachyOS kernel](https://github.com/MastaG/linux-cachyos-bc250), [Bazzite async compute](https://github.com/tri3gubki-ops/bc250-async-compute-bazzite) | Пакети мають відповідати системі та ядру |
| Датчики й вентилятори | [BC250-Telemetry](https://github.com/onlinermm/BC250-Telemetry), [температура памʼяті](https://github.com/pan-Rijovich/bc250-memory-temperature), [nct6687d](https://github.com/Fred78290/nct6687d) | Програмний драйвер і апаратна переробка — різні речі |
| UMA та ACPI | [bc250_memcfg](https://github.com/fanoush/bc250_memcfg), [ACPI fix](https://github.com/e-tho/bc250-acpi-fix) | Спершу збережи початкове налаштування |
| FSR4 | [Початковий проєкт](https://github.com/dmorazasanchez/bc250-fsr4), [продовження з DLL](https://github.com/daniel-h-0/bc250-fsr4-fork) | Окрема гра, а не обовʼязкова заміна Mesa |

[Автори та ліцензії інтеграцій](https://github.com/movacx/bc250-control-center#external-tools-and-credits). Інші розробки також є в [спільному каталозі](../../catalog/uk/README.md).

## FSR4: початкова драйверна робота та переносна DLL

**dmorazasanchez/bc250-fsr4** — початкова оптимізація INT8 fallback Mesa/RADV для `gfx1013`. **daniel-h-0/bc250-fsr4-fork** — окреме продовження з оптимізаціями в DLL FidelityFX. Для DLL не потрібна заміна системної Mesa; альтернативний драйверний пакет має окремі вимоги сумісності.

**OptiScaler** адаптує виклики апскейлера всередині гри. **OptiScaler Client** керує встановленнями на диску. Жоден із них не є моделлю реконструкції FSR4.

### Встановлення через Client

1. Закрий гру, збережи початкові DLL, параметри запуску та налаштування модів.
2. Отримай BC250-збірку Client із [проєкту продовження](https://github.com/daniel-h-0/bc250-fsr4-fork).
3. Проскануй бібліотеку, вибери **Install across your games** і почни з однієї гри.
4. Збережи робочі параметри Proton/запуску та пройди зазначену підготовку шейдерів.
5. Перевір вибраний backend в OptiScaler, зображення в русі, час кадру та стабільність.

Сумісні ігри з окремою FidelityFX DLL можуть використовувати пряму заміну; іншим потрібен OptiScaler. Не впроваджуй моди в захищені онлайн-клієнти без дозволу гри.

Відкат — через Update/Restore Client або повернення збережених початкових DLL і параметрів запуску. Не видаляй невідомі файли інших модів. [Документація Client та відновлення](https://github.com/daniel-h-0/bc250-fsr4-fork/blob/main/docs/optiscaler-client.md).

Автор виміряв **3.93 / 5.92 / 12.08 мс на масштабування** RC9 у Quality при виході 1080p / 1440p / 4K, 11 вересня 2026 року. Це час апскейлера, а не повного кадру гри чи гарантований FPS. Менша внутрішня роздільна здатність економить рендер, але реконструкція теж коштує часу. [Методика](https://github.com/daniel-h-0/bc250-fsr4-fork/blob/main/docs/gpu-cost.md).

## HelixSR: реконструкція DLSS Model E на AMD

[Проєкт](https://github.com/lonewolf0622/HelixSR) · [Релізи](https://github.com/lonewolf0622/HelixSR/releases).

Неофіційний апскейлер: інтерфейс FSR 3.1, реконструкція мережею DLSS Model E, звичайні обчислювальні шейдери D3D12. У Linux використовується Proton/vkd3d-proton. Це **не нативна підтримка NVIDIA DLSS**, не нова модель генерації кадрів і не поєднання ваг FSR4 із DLSS. Вихідний код самого апскейлера не опубліковано; setup-скрипти мають окрему ліцензію.

### Встановлення в гру з FSR 3.1 DLL

1. Розпакуй реліз і запусти `./helixsr-setup.sh` у Linux або `helixsr-setup.bat` у Windows. За твоєю згодою setup завантажує DLL NVIDIA та будує `helixsr_weights.bin` і `helixsr_kernels.pak` локально. Ці файли мережі не поширюй.
2. Знайди `amd_fidelityfx_upscaler_dx12.dll` або `amd_fidelityfx_dx12.dll` гри. Збережи її, додавши `.original` перед `.dll`.
3. Скопіюй DLL HelixSR під початковим імʼям файлу гри та поклади поруч обидва файли мережі. Початкова обʼєднана FidelityFX DLL також потрібна для передавання інших ефектів, зокрема FG.
4. Запусти гру та вибери **AMD FSR**. Для гри без окремої FSR 3.1 DLL потрібен OptiScaler із двома шляхами до HelixSR:

```ini
[Upscalers]
Dx12Upscaler=fsr31
[Libraries]
FfxDx12Path=Z:\path\to\HelixSR\amd_fidelityfx_dx12.dll
FfxDx12SRPath=Z:\path\to\HelixSR\amd_fidelityfx_upscaler_dx12.dll
```

Заміни приклад справжнім шляхом, поклади туди обидва імені DLL та файли мережі. У Proton `Z:` відповідає кореню Linux.

Перевір мережу в `helixsr.log` та **FSR HelixSR (3.1.5)** в OptiScaler. Без файлів мережі працює просте масштабування. Лише D3D12: цей шлях не підтримує Vulkan-ігри. Первинні випробування автора — BC250/RADV/Proton, не гарантія будь-якої ОС та гри.

Відкат: прибери лише файли HelixSR, поверни початкове імʼя збереженої DLL та конфігурацію OptiScaler. [Вимоги, налаштування та ліцензії](https://github.com/lonewolf0622/HelixSR#readme).

## Генерація кадрів: Lossless Scaling та lsfg-vk

[Lossless Scaling](https://store.steampowered.com/app/993090/Lossless_Scaling/) — комерційна програма. [PancakeTAS/lsfg-vk](https://github.com/PancakeTAS/lsfg-vk) — окрема інтеграція генерації кадрів у Linux через Vulkan. Це не FSR4 та не HelixSR.

Спочатку отримай рівний **реальний** час кадру. Встанови lsfg-vk за інструкцією для своєї системи, налаштуй одну гру та порівняй затримку керування, артефакти й графік часу кадру. Додаткові кадри не прискорюють логіку гри чи CPU. Для відкату вимкни шар та поверни параметри запуску. Рецепти пакетів і Decky змінюються; не змішуй встановлювачі різних форків.

## Стримінг та кодеки

| Проєкт | Для чого | Встановлення / обмеження |
|---|---|---|
| [Moonlight Qt BC250](https://github.com/grykom/moonlight-qt-bc250) | Клієнт із вибором потоків програмного декодера | Експериментальний Arch/CachyOS-пакет; не вмикає VCN |
| [Vulkan encode stopgap](https://github.com/Shalasere/bc250-vulkan-encode-stopgap) | VA-API кодувальник на GPU compute та CPU | Immutable-системам потрібні setup_bazzite/setup_steamos; ресурси GPU спільні з грою, шляхи HEVC мають обмеження |
| [simpmix encoding/decoding](https://github.com/simpmix/bc250-encoding-decoding-fix) | Інший VA-API/compute-проєкт | Назва не доводить увімкнення апаратного VCN |
| [PyroWave](https://github.com/Themaister/pyrowave) | Кодек на Vulkan compute | Інтеграція залежить від конкретного клієнта/сервера, це не універсальний драйвер VCN |

Перед перенаправленням системного слота VA-API збережи поточний драйвер та конфігурацію сервера. Відкат кодувальника має повертати перенаправлення драйвера й налаштування сервісів, а не лише видаляти GUI. Апаратний VCN, compute-кодування та програмне декодування — три різні шляхи.

## Інші розробки та автори

[Спільний каталог](../../catalog/uk/README.md) зберігає старі версії, форки, корпуси, дослідження та невдалі підходи. Джерело повідомлення лишається підтвердженням у метаданих; вибір програми не потребує знання, у якому чаті її обговорювали.
