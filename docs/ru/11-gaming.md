# Результаты в играх и настройки

> **Коротко** — BC-250 — это **видеоядро уровня PS5, прикрученное к урезанному 6-ядерному Zen2**. GPU по-настоящему способный: на реальном разгоне **2000 МГц** он тянет современные AAA на **40–60 FPS**, а игры полегче/постарше — заметно выше 60. Подвох — в **процессоре**. Zen2-половина APU упирается в потолок гораздо чаще, чем видеоядро: бенчмарки сообщества раз за разом показывают карту на **~36–47 % загрузки GPU при зафиксированных ~38 FPS** — то есть упор в CPU. Поэтому: **сначала разгон** (сток ~1500 МГц медленнее на ~30 %), активно используйте **FSR** и генерацию кадров, целитесь в **1080p–1440p** и примите, что игры с тяжёлой физикой или плохой многопоточностью будут «дёргаться» при любом разрешении. Лучше всего идут консольные порты от первых лиц (God of War, Horizon, Last of Us, Spider-Man).

Этот раздел задаёт реалистичные ожидания и собирает реальные опубликованные результаты сообщества — многие из них это скриншоты бенчмарков. Цифры зависят от частот, дистрибутива, драйвера и разбивки VRAM, поэтому каждая строка привязана к своему источнику.

---

## Главное, что нужно понять: упор в процессор

Видеоядро BC-250 — это часть на базе RDNA2 из PS5 (RADV определяет его как `GFX1013` / класс NAVI10). В большинстве игр оно **не** является слабым звеном. Слабое звено — **6-ядерный Zen2** на ~3,5 ГГц с урезанным по-консольному кэшем и без запаса по многопоточности.

Бенчмарк сообщества на **1080p, High, GPU 2000 МГц / память 3600 МГц** показывает это наглядно: прогон **«achieved 38 FPS»** при **загрузке GPU всего 36,5 %** — ограничивал поток симуляции на CPU (по постадийному счётчику: CPU sim ~70 / CPU render ~43 / GPU ~47). Видеоядро простаивало на треть мощности, пока процессор держал кадры внизу. ([src](https://t.me/c/2424231195/136242))

Практические следствия:

- **Разрешение часто «бесплатное».** Раз вы упираетесь в CPU, переход с 1080p на 1440p (и даже на 4K с FSR) часто почти не стоит FPS — у GPU и так был запас. Несколько 4K-результатов ниже выглядят почти как их 1080p-версии именно по этой причине.
- **Апскейл помогает меньше, чем на обычном ПК.** FSR разгружает GPU, но если ограничивает процессор, снижение рендер-разрешения не сильно поднимет FPS. Используйте FSR ради качества картинки и температур, а не как «кнопку FPS».
- **Плохая многопоточность и тяжёлая физика наказывают.** Статтеры и скачки фреймтайма (Gothic Remake, Doom: The Dark Ages до фиксов) идут от CPU, а не от GPU.
- **GPU всё равно разгоняйте** — когда игра *действительно* упирается в видеоядро (4K, тяжёлый рейтрейсинг, хорошо распараллеленные движки), 1500 → 2000 МГц даёт ~+30 % FPS. Как этого добиться — см. [09-overclock-undervolt.md](09-overclock-undervolt.md), а сначала [04-cooling.md](04-cooling.md), потому что 2000 МГц требует доработки охлаждения.

---

## Настройки, которые реально влияют

- **Частоты.** Сток GPU ~1500 МГц — медленный дефолт; сообщество живёт на **GPU 2000 МГц, память ~1900–2000 МГц** как повседневной цели, некоторые гонят **2,65 ГГц по ядру на сборке уровня дискретки**. Сток против 2000 МГц — примерно **+30 % FPS** в сценах с упором в GPU. ([гайд по разгону](09-overclock-undervolt.md))
- **Разблокировка 40 CU.** Плата поставляется с отключёнными CU. Разблокировка всех **40 CU** даёт заметный широкий прирост — один пользователь сообщил, что Doom: The Dark Ages из «не работает» превратился в **60 FPS на High**, «007»-тайтл выдал **60 FPS на High**, а в Great Pragmata стабилизировался фреймтайм. ([src](https://t.me/c/2424231195/141193)) См. [09-overclock-undervolt.md](09-overclock-undervolt.md).
- **FSR / FSR 4.** На 1440p/4K используйте Quality или Balanced, чтобы кормить GPU и держать температуры. Сообщество активно портирует **FSR 4** (DLL-пакеты выкладывают прямо в ветке). ([обсуждение FSR4 INT8 src](https://t.me/c/2424231195/136354)) Замеренные приросты FSR у elektricM: **Quality +20–30 %, Balanced +30–40 %, Performance +40–60 %** FPS; **Frame Generation примерно удваивает** FPS (небольшая задержка). **FSR 4 через Optiscaler** — сообщество находит, что **Balanced лучше нативного FSR 3.1.5 Quality**. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
  - **Какой апскейлер реально использовать:** **FSR 1–3 — практичный выбор** здесь: он зрелый, дешёвый и хорошо поддержан. **FSR 4 и XeSS технически *могут* работать** на этом кремнии RDNA2 через путь **DP4a (INT8)** — у RDNA2 есть dp4a/Rapid Packed Math, поэтому грузятся и INT8-сборка FSR 4 из OptiScaler, и GPU-агностичный вариант XeSS-DP4a — но на столь слабом GPU они **медленные и экспериментальные**: fallback на DP4a примерно на 10–20 % тяжелее пути WMMA, который используют новые карты, а качество картинки у XeSS-DP4a ниже версии под XMX. Считайте FSR 4 / XeSS тем, с чем можно поэкспериментировать, а не повседневным режимом. ([OptiScaler FSR4 INT8 на RDNA2 — VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/)) **Официальная поддержка FSR 4 для RDNA2 (класс RX 6000) выходит ~в начале 2027**; до этого — только путь OptiScaler/моды. ([Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals))
- **Генерация кадров помимо FSR — LSFG.** **Lossless Scaling Frame-Generation (LSFG)** работает на Linux через Vulkan-слой **`lsfg-vk`** ([github.com/PancakeTAS/lsfg-vk](https://github.com/PancakeTAS/lsfg-vk)) — игронезависимый слой генерации кадров, цепляющийся к любому Vulkan-тайтлу. Сообщество использует его, чтобы **примерно удвоить FPS** (например, 30 → 60) в играх без встроенной генерации кадров. Как и любая генерация кадров, он добавляет задержку и хочет разумного реального FPS для интерполяции, но это настоящая опция, когда собственного FG у FSR нет.
- **Разбивка VRAM (UMA).** Это единый пул 16 ГБ. В одном аккуратном тесте (1440p, 1850 МГц) разбивка GDDR6 (512 МБ против 8 ГБ в резерв) **почти не меняла средний FPS** — но слишком малое или неправильное значение UMA может сбросить вас в программный рендеринг (`llvmpipe`) или повесить бенчмарк. Auto / разумный резерв — нормально, не усложняйте. ([src](https://t.me/c/2424231195/81203))
- **VSync выкл.** для бенчей; **генерацию кадров вкл.** где есть (она помогла Wukong выйти на трёхзначный средний FPS, см. ниже).
- **`mitigations=off`** (флаг загрузки ядра) — частый твик; в тесте VRAM он давал лишь небольшие шумные эффекты на FPS. Считайте влияние малым. ⚠ **verify (величина спорная)** — elektricM сообщает гораздо больший прирост (**+18 FPS в Cyberpunk, «+10–15 %»** в их советах). Явно зависит от игры: много в некоторых CPU-bound тайтлах, ничтожно в других. Попробуйте и замерьте, не верьте ни одной цифре вслепую. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

---

## Что люди реально публиковали

Это заявленные сообществом цифры с настройками и источником. **Очки бенчмарков и FPS — как опубликовано**; частоты/дистрибутив/драйвер отличаются между строками, поэтому смотрите столбец контекста, не сравнивайте вслепую.

| Игра | Настройки (разреш. / пресет / апскейл) | Результат | Железо / частоты | Источник |
|------|----------------------------------------|-----------|------------------|----------|
| **Black Myth: Wukong** (бенч) | 1080p, High, FSR + Frame Gen вкл | **сред. 96** (мин 78, макс 113) | BC-250, Windows, RADV NAVI10 | ([src](https://t.me/c/2424231195/10069)) |
| **Black Myth: Wukong** (бенч) | 1440p, Medium, без FSR | **сред. ~48** (макс 56) | BC-250, 1850 МГц, Linux | ([src](https://t.me/c/2424231195/81203)) |
| **Shadow of the Tomb Raider** (бенч) | 1440p, Max | **сред. ~70** | BC-250, 1850 МГц | ([src](https://t.me/c/2424231195/81203)) |
| **Marvel's Guardians of the Galaxy** (бенч) | 1440p, High | **сред. ~70** (макс 89, мин до ~3) | BC-250, 1850 МГц | ([src](https://t.me/c/2424231195/81203)) |
| **Dying Light 2** (бенч) | 1440p, High, без VSync | **сред. ~48** (макс 62) | BC-250, 1850 МГц | ([src](https://t.me/c/2424231195/81203)) |
| **Cyberpunk 2077** (бенч) | 1440p, рейтрейсинг **мин** | **сред. ~36** (мин 30) | BC-250, 1850 МГц | ([src](https://t.me/c/2424231195/81203)) |
| **Indiana Jones and the Great Circle** | 1440p, низкие, без апскейла | **45** | BC-250, GPU ~1900 МГц, Vulkan | ([src](https://t.me/c/2424231195/36931)) |
| **Indiana Jones and the Great Circle** | 1440p, средние, апскейл вкл | **60** | BC-250 | ([src](https://t.me/c/2424231195/36931)) |
| **Forza Horizon 5** | **4K**, пресет High, **без FSR** | играбельно (видео) | BC-250 | ([src](https://t.me/c/2424231195/81891)) |
| **The Witcher 3** | 4K, Medium, FSR Balanced | **~50** | BC-250 | ([src](https://t.me/c/2424231195/81894)) |
| **Kingdom Come: Deliverance II** | 4K, Med/High, FSR Quality | **~30** («опыт PS5») | BC-250 | ([src](https://t.me/c/2424231195/81893)) |
| **The Last of Us Part II** | 1080p, дефолтный пресет | играбельно (видео) | BC-250 | ([src](https://t.me/c/2424231195/94237)) |
| **Doom: The Dark Ages** | High | **60** (после разблокировки 40 CU + фикс) | BC-250, 40 CU | ([src](https://t.me/c/2424231195/141193)) · [фикс Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/) · [Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS) |
| **Doom Eternal** | RT вкл (по сообщениям сообщества) | **60 + RT** | BC-250; по сообщениям сообщества (r/BC250Gaming) | ([Reddit-синтез](https://www.reddit.com/r/BC250Gaming/)) |
| **Tekken 8** | (по сообщениям сообщества) | **~60** | BC-250; по сообщениям сообщества (r/BC250Gaming) | ([Reddit-синтез](https://www.reddit.com/r/BC250Gaming/)) |
| **Street Fighter 6** | (по сообщениям сообщества) | **~60** | BC-250; по сообщениям сообщества (r/BC250Gaming) | ([Reddit-синтез](https://www.reddit.com/r/BC250Gaming/)) |
| **Stellar Blade** | (по сообщениям сообщества) | **~70–80** | BC-250; по сообщениям сообщества (r/BC250Gaming) | ([Reddit-синтез](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | Frame Generation вкл (по сообщениям сообщества) | **60 → 100** (FG) | BC-250; по сообщениям сообщества (r/BC250Gaming) | ([Reddit-синтез](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | (видео) | играбельно | BC-250, CPU сток, **GPU 2000** | ([src](https://t.me/c/2424231195/121772)) |
| **Gothic Remake** | Medium | **статтерит** — «оптимизацию не завезли» | BC-250 | ([src](https://t.me/c/2424231195/142708)) |
| **Hi-Fi Rush** | (видео, запись OBS) | плавно | BC-250, `mitigations=off` | ([src](https://t.me/c/2424231195/91022)) |
| **Cyberpunk 2077** | 1080p, High, FSR Quality, **без RT** | **70–90** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Cyberpunk 2077** (бенч) | 1080p (сток 2000 МГц / 1000 мВ) | **57.66** → **60.82** OC (2230 МГц); `mitigations=off` **+18** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **The Last of Us Part I** | 1080p, Medium-High | **60** (стабильно) | BC-250 — 90–100 °C при компиляции шейдеров; местами щелчки в звуке | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Devil May Cry 5** | 1080p, High | **100** (наименьшая задержка, ~10 мс) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Detroit: Become Human** | 1080p, Medium | **60** (с лимитом) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Control** | 1080p, полный **RT** | **40** | BC-250 — хорошо для начального RT | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Company of Heroes 3** | 1080p | играбельно — **нужна разбивка VRAM 4 ГБ** (512 МБ = артефакты/краши) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Red Dead Redemption 2** (бенч) | флаг `-useMaximumSettings` | **45+** мин | BC-250 — может определить не тот GPU-адаптер, выстави вручную | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **CS2** / **Rocket League** / **Elden Ring** | 1080p | **100+** / **120+** / **60** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Helldivers 2** | 1080p, низкие (как заявлено) | **≈82** | BC-250, сток, один Noctua NF-P12 — GPU 73 °C / CPU 76 °C; ⚠ ASR | ([«Temps Shocked Me»](https://youtu.be/d7Hwqxn9yg8) ~5:08) |
| **Stalker 2** | средние (как заявлено) | **≈80** | BC-250 — автор отмечает упор в CPU / 8 ГБ ОЗУ; ⚠ ASR | ([RU-обзор](https://youtu.be/19l03qneKJ4) ~0:23) |
| **Stalker 2** | QHD (2560×1600), FSR Quality + Frame Gen, патч 1.21 (как заявлено) | **57–70** (1080p, без FG **≈45**) | BC-250; ⚠ ASR | ([RU-обзор](https://youtu.be/19l03qneKJ4) ~18:52) |
| **Arc Raiders** | 1080p (как заявлено) | **≈56–80** | BC-250, сток; ⚠ ASR | ([Temps Shocked Me](https://youtu.be/d7Hwqxn9yg8) ~5:58) |
| **Spider-Man 2** | 1080p, High, FSR Frame Gen (как заявлено) | **≈100** сред. (нативно <60) | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~11:04) |
| **Forza Horizon 5** | 1080p, Medium, без FSR (как заявлено) | **70–95** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~12:19) |
| **Metro Exodus** | QHD, High (как заявлено) | **≈58** | BC-250; ⚠ ASR | ([RU-обзор](https://youtu.be/19l03qneKJ4) ~14:12) |
| **Palworld** | 1080p, средне-высокие (как заявлено) | **<60** (играбельно) | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:04) |
| **Red Dead Redemption 2** | 1080p, средне-высокие, FSR Quality (как заявлено) | **уверенные 60** | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:19) |
| **Left 4 Dead 2** | 1080p, макс (как заявлено) | **>150** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~10:18) |
| _Для сравнения: сборка с дискреткой_ | бенч RE-движка, 1080p, High, без RT | **сред. 67.99** (мин 58, макс 82) | **RX 6600** + Xeon E5-2667v4, Win10 | ([src](https://t.me/c/2424231195/116494)) |

> Строка с RX 6600 — **это не результат BC-250**: участник запускал дискретную карту на том же корпусе/процессоре для сравнения. Включено, чтобы показать, что способен вытянуть *сам процессор*.

> ⚠️ **Elden Ring — результаты разнятся.** ~60 FPS выше (elektricM, 1080p) не у всех: на одной сборке сообщества частота была **зафиксирована на 30 FPS на High, и 60 не выдавала даже на 720p на низких** (упор в CPU). Считайте 60 лучшим случаем, а не гарантией. ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:50)

### Порты от первых лиц / консольные — золотая середина

Эти шли достаточно хорошо, чтобы один участник просто перечислил их как «работает» (PS-порты опираются на GPU и хорошо оптимизированы, что подходит этой плате):

> Days Gone · Death Stranding · DIRT 5 · Ghost of Tsushima: Director's Cut · God of War (2018) · God of War: Ragnarök · Horizon Forbidden West · Horizon Zero Dawn · The Last of Us Part I · The Last of Us Part II Remastered · Returnal · Uncharted: Legacy of Thieves

([src](https://t.me/c/2424231195/99563))

---

## Проблемные игры (не работают / нужен обход)

elektricM отслеживает тайтлы, которых у нас не было и которые **падают или конфликтуют с платформой** — проверьте до покупки:

| Игра | Проблема | Обход |
|------|----------|-------|
| **Fortnite** | Easy Anti-Cheat **не поддерживает Linux** | **Никак — не запустится** на Linux-BC-250 |
| **Valorant** | Античит уровня ядра | Технические проблемы на Linux; фактически нет |
| **Magic: The Gathering Arena** | Краши/зависания именно на **Fedora** | Лучше на **Manjaro / Bazzite**; попробуйте другой Proton |
| **Final Fantasy VII Rebirth** | «DX12 is not supported on your system» (проверка GPU) | **Фикса пока нет** |
| **Black Myth: Wukong** (репак) | «CreateProcess() returned 2» (анти-тампер) | Используйте **немодифицированные файлы игры** |

(Статус античитов меняется со временем — сверяйтесь с [areweanticheatyet.com](https://areweanticheatyet.com) и [protondb.com](https://www.protondb.com).) ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

### Жёстко заблокированы отсутствующими функциями GPU (не лечится)

Это **кремний класса RDNA 2** (GFX1013). Часть новых тайтлов **жёстко требует функций GPU, которых у RDNA 2 нет** — прежде всего **mesh-шейдеров** и **аппаратного variable-rate shading (VRS)** — и отказывается запускаться. Отсутствие кремния — **ограничение железа, а не баг драйвера**: ни обновление Mesa, ни параметр ядра, ни версия Proton саму функцию не добавят. **Mesh-шейдеры** — настоящая стена. Требование **VRS** иногда лишь проверка при запуске, которую может заглушить пользовательский Vulkan-слой (см. заметку про Doom ниже) — так что оно не всегда фатально. Подтверждённые примеры ([тред сообщества r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)):

| Игра | Жёсткое требование, которого нет у BC-250 |
|------|--------------------------------------------|
| **Final Fantasy VII Rebirth** | **Mesh-шейдеры** — не запустится (поэтому же спотыкается и о проверку DX12-совместимости GPU в таблице выше) |
| **Doom: The Dark Ages — Update 2** | **Vulkan fragment shading rate** (аппаратный VRS) — Update 2 сделал VRS обязательным *при запуске*; у GPU его нет, поэтому немодифицированная игра больше не стартует (сборка до Update 2 шла на 60 FPS после разблокировки 40 CU, выше). **Обход есть** — см. заметку ниже. |

> **Doom: The Dark Ages Update 2 — теперь есть обход.** Игра лишь *проверяет* наличие VRS при запуске; для геймплея он ей не нужен. Vulkan-слой **`bangstk/Vulkan_NullVRS`** ([github.com/bangstk/Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS)) перехватывает `vkCmdSetFragmentShadingRateKHR()` и превращает его в no-op, удовлетворяя проверку запуска, так что игра идёт без побочных эффектов. То есть Doom: The Dark Ages — **не** вечный жёсткий блок. **С mesh-шейдерами иначе** — для требования mesh-шейдеров у FF7 Rebirth аналогичной заглушки нет, так что эта действительно не запустится.

> Перед покупкой свежего AAA-тайтла проверь, не указаны ли в требованиях mesh-шейдеры или аппаратный VRS. **Mesh-шейдеры** здесь настоящая стена железа (обхода нет). Требование **аппаратного VRS** часто лишь проверка при запуске — иногда обходится заглушкой (как с Doom выше), иногда нет — поэтому сверься с сообществом, прежде чем делать выводы в любую сторону.

## Рейтрейсинг — что реально тестировали

У BC-250 **настоящий аппаратный RT RDNA2** (не программная эмуляция, при Mesa 25.2+). Протестированные RT-тайтлы по elektricM:

| Игра | Разреш. | FPS | Заметки |
|------|---------|-----|---------|
| Cyberpunk 2077 | 1080p | 50–60 | Только RT-освещение, FSR Quality |
| Control | 1080p | 40 | Полный RT |
| Portal 2 RTX | 720p | 40 | Программный путь RT в Mesa 25.2+ |
| Half-Life 2 RTX | 720p | 20–30 | Очень тяжёлый |

RT здесь начального уровня — нормально для *только освещения* в хорошо оптимизированных играх, не для полного path tracing. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

## Proton и параметры запуска (Linux)

- **Версия Proton:** начните с **Proton GE** (лучшая совместимость) или **Proton Experimental**; откатывайтесь на стабильные **8.0 / 9.0** по игре. Ставьте GE через **ProtonUp-Qt** (`protonup-qt`). Некоторые тайтлы работают только на конкретной версии — пробуйте, если не запускается. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Параметры запуска Steam**, которые стоит знать:
  - `mangohud %command%` — оверлей FPS/температур.
  - `RADV_DEBUG=nohiz %command%` — форсит RADV / чинит часть глюков.
  - `gamemoderun %command%` — governor CPU в performance на сессию (помогает этой CPU-bound плате).
  - Вместе: `RADV_DEBUG=nohiz mangohud gamemoderun %command%`.
- **VRAM по игре (разбивка UMA):** киберспорт/инди норм на **512 МБ**; **большинству игр нужно 4 ГБ**; AAA/RT хотят ещё и kernel-параметры под доп. VRAM (`amdgpu.gttsize=...`, см. [06-linux.md](06-linux.md) / [08-bios.md](08-bios.md)). Слишком малая разбивка = артефакты, краши или скат в программный рендеринг. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Статтер на первом запуске** — обычно **компиляция шейдеров**; дайте Steam докомпилировать, прежде чем судить о FPS; больший кэш шейдеров помогает. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Пофиксы по конкретным играм** (по сообщениям сообщества, r/BC250Gaming — пробуйте, если ловите именно эти баги):
  - **Resident Evil Requiem — сломанные/глючные волосы:** добавьте `RADV_DEBUG=nohiz %command%` в параметры запуска (тот же флаг RADV, что выше, применённый здесь точечно). ([Reddit-синтез](https://www.reddit.com/r/BC250Gaming/))
  - **Spider-Man 2 / Assassin's Creed Shadows — зависания:** включение **zswap** (сжатый swap), по сообщениям, убирает зависания. ([Reddit-синтез](https://www.reddit.com/r/BC250Gaming/))

---

## Эмуляция

Эмуляторы нагружают CPU, поэтому результаты смешанные, но некоторые крепкие ([src](https://t.me/c/2424231195/78988)):

- **Switch — Eden / Ryujinx:** работает хорошо и шустро. По сообщениям сообщества (r/BC250Gaming): **Mario Kart ~60 FPS**; **Tears of the Kingdom ~30–40 FPS**. ✅ ([Reddit-синтез](https://www.reddit.com/r/BC250Gaming/))
- **PS4 — shadPS4 (0.9.0+):** Bloodborne идёт без просадок; некоторые тайтлы (The Last Guardian) артефачат, но держат стабильный FPS. ✅
- **PS3 — RPCS3:** работает, но требует допила от игры к игре. ⚠️ **Известная особенность** (по сообщениям сообщества, r/BC250Gaming): баг эмулятора **фиксирует GPU на 1000 МГц** под RPCS3, так что видеоядро не может поднять частоту — обход в том, чтобы **разогнать CPU**, компенсируя потерю запаса GPU. ([Reddit-синтез](https://www.reddit.com/r/BC250Gaming/))
- **Xbox 360 — Xenia Canary:** меню грузятся, геймплей уходит в чёрный экран (ещё разбираются). ❌

---

## Где посмотреть это в работе (видео)

Сообщество выкладывает много геймплейного/бенчмарк-видео. Несколько записей из ветки и каналов:

- Геймплей/бенчмарки BC-250: [youtu.be/CYDv1SfD2Pc](https://youtu.be/CYDv1SfD2Pc) · [youtu.be/g3uWOfqcexA](https://youtu.be/g3uWOfqcexA) · [youtu.be/9fozmRrAouc](https://youtu.be/9fozmRrAouc) · [youtu.be/q64M2XzADjA](https://youtu.be/q64M2XzADjA) · [youtu.be/0LEkOG1yqqw](https://youtu.be/0LEkOG1yqqw)
- Сводная таблица протестированных игр (FPS/настройки): [Google-таблица](https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing)

---

## Шпаргалка по реалистичным ожиданиям

| Вы хотите… | Реальность на BC-250 2000 МГц с доработанным охлаждением |
|------------|----------------------------------------------------------|
| 1080p AAA, 60 FPS | Иногда — зависит от нагрузки на CPU. FSR + Frame Gen помогают. AAA постарше/полегче — да. |
| 1440p AAA | 40–60 FPS в большинстве портов; у GPU тут есть запас. Лучшее по соотношению разрешение. |
| 4K AAA | 30–50 FPS с FSR в хорошо оптимизированных/консольных портах (Forza, Witcher 3, KCD2). |
| Рейтрейсинг | Только на минимуме, низкий FPS (Cyberpunk ~36 @ 1440p RT-мин). Не сильная сторона платы. |
| Стабильные 60 везде | Нет. Игры с упором в CPU и тяжёлой физикой будут проседать/дёргаться при любых настройках. |
| Порты PS от первых лиц | Золотая середина — это то, что плата делает лучше всего. |

---

## Источники

- Бенчмарк с упором в CPU (38 FPS, 36,5 % GPU) — https://t.me/c/2424231195/136242
- Большая таблица бенчмарков по VRAM/частотам (Wukong, Tomb Raider, Dying Light 2, Cyberpunk, Guardians) — https://t.me/c/2424231195/81203
- Wukong 1080p High FSR+FG, сред. 96 — https://t.me/c/2424231195/10069
- Indiana Jones Great Circle, разные разрешения — https://t.me/c/2424231195/36931
- Forza Horizon 5 4K — https://t.me/c/2424231195/81891 · Witcher 3 4K — https://t.me/c/2424231195/81894 · KCD2 4K — https://t.me/c/2424231195/81893
- Результаты разблокировки 40 CU (Doom Dark Ages 60 FPS) — https://t.me/c/2424231195/141193 · фикс Doom — https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/
- TLOU II 1080p — https://t.me/c/2424231195/94237 · Resident Evil Requiem — https://t.me/c/2424231195/121772 · статтеры Gothic Remake — https://t.me/c/2424231195/142708
- Список портов от первых лиц — https://t.me/c/2424231195/99563
- Обзор эмуляции — https://t.me/c/2424231195/78988
- Сравнительный прогон с дискреткой RX 6600 — https://t.me/c/2424231195/116494
- Совместимость игр elektricM (настройки/FPS по играм, проблемные игры, таблица RT, Proton и параметры запуска, приросты FSR) — https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/
- YouTube-записи с FPS (авто-субтитры / ASR — цифры приблизительные): ETA Prime (Spider-Man 2, Forza H5, Left 4 Dead 2) — https://youtu.be/q_CxcbS5HI8 · «Temps Shocked Me» (Helldivers 2, Arc Raiders) — https://youtu.be/d7Hwqxn9yg8 · RU-обзор (Stalker 2, Metro Exodus) — https://youtu.be/19l03qneKJ4 · Pixels & Power (Palworld, RDR2, Elden Ring 30 FPS) — https://youtu.be/4S0DvIpqm0E
- Жёсткие блоки по mesh-шейдерам / аппаратному VRS (FF7 Rebirth, Doom: The Dark Ages Update 2) — [тред r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- **Обход VRS для Doom: The Dark Ages — `bangstk/Vulkan_NullVRS`** (no-op Vulkan-слой для `vkCmdSetFragmentShadingRateKHR`) — https://github.com/bangstk/Vulkan_NullVRS
- **Генерация кадров LSFG на Linux — `lsfg-vk`** (Vulkan-слой) — https://github.com/PancakeTAS/lsfg-vk
- **FSR 4 / XeSS через DP4a (INT8) на RDNA2** — INT8-сборка FSR4 из OptiScaler: [VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/) · [вики совместимости FSR4 OptiScaler](https://github.com/optiscaler/OptiScaler/wiki/FSR4-Compatibility-List)
- **Официальная поддержка AMD FSR 4 для RDNA2 (~начало 2027) / RDNA3 (июль 2026)** — [Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals)
- **Результаты по играм по сообщениям сообщества (r/BC250Gaming)** — Tekken 8, Street Fighter 6, Stellar Blade, RE Requiem Frame-Gen, Doom Eternal RT, Switch (Mario Kart / TOTK), фиксация RPCS3 на 1000 МГц, фиксы RE Requiem (волосы) / Spider-Man 2 / AC Shadows — https://www.reddit.com/r/BC250Gaming/
- Таблица тестов игр сообщества — https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing

> Частоты и разблокировка 40 CU — в [09-overclock-undervolt.md](09-overclock-undervolt.md); сделайте доработку из [04-cooling.md](04-cooling.md) до запуска на 2000 МГц.
