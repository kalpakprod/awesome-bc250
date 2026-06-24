> 🌐 Переклад спільноти. Англійська версія є джерелом істини й може бути новішою. Знайшли помилку? Відкрийте issue: [English](../en/11-gaming.md) · [issues](https://github.com/lildebil0/awesome-bc250/issues)

# Результати в іграх і налаштування

> **Коротко** — BC-250 — це **GPU класу PS5, прикручений до врізаного 6-ядерного Zen2**. GPU справді спроможний: на реальному розгоні **2000 MHz** він тягне сучасні AAA-тайтли на **40–60 FPS**, а легші/старіші ігри — далеко за 60. Заковика в **CPU**. Половина APU на Zen2 є вузьким місцем набагато частіше, ніж GPU — бенчмарки спільноти раз за разом показують карту на **~36–47 % завантаження GPU при зафіксованих ~38 FPS**, з обмеженням по CPU. Отже: **спершу розгін** (штатні ~1500 MHz приблизно на 30 % повільніші), покладайтеся на **FSR** і генерацію кадрів, цільтесь у **1080p–1440p** і змиріться, що ігри з важкою фізикою чи поганою багатопотоковістю будуть фризити незалежно від роздільної здатності. Консольні ексклюзивні порти (God of War, Horizon, Last of Us, Spider-Man) — найсолодше місце.

Цей розділ задає очікування й збирає реальні, опубліковані результати спільноти — багато з них є скриншотами бенчмарків. Цифри різняться залежно від частоти, дистрибутива, драйвера й розподілу VRAM, тож кожен рядок прив'язаний до свого джерела.

---

## Перше, що треба зрозуміти: обмеження по CPU

GPU у BC-250 — це частина на RDNA2, похідна від PS5 (RADV рапортує її як `GFX1013` / клас NAVI10). Це *не* слабка ланка в більшості ігор. Слабка ланка — це **6-ядерний CPU на Zen2**, що працює на ~3.5 GHz з урізаним, як у PS5, кешем і без запасу SMT.

Бенчмарк спільноти на **1080p, High, GPU @ 2000 MHz / пам'ять @ 3600 MHz** робить це наочним: прогін **«досяг 38 FPS»** з **GPU Limited Percentage лише 36.5 %** — потік симуляції на CPU був гальмом (CPU sim ~70 / CPU render ~43 / GPU ~47 на постадійному вимірювачі). GPU простоював на третині своєї спроможності, поки CPU тримав частоту кадрів унизу. ([src](https://t.me/c/2424231195/136242))

Практичні наслідки:

- **Роздільна здатність часто «безкоштовна».** Оскільки ви обмежені по CPU, перехід з 1080p на 1440p (чи навіть на 4K із FSR) часто коштує мало FPS — у GPU й так був запас. Кілька результатів на 4K нижче виглядають майже так само добре, як їхні аналоги на 1080p, саме з цієї причини.
- **Апскейлінг допомагає менше, ніж на звичайному ПК.** FSR розвантажує GPU, але якщо обмежувач — це CPU, зниження роздільної здатності рендера не сильно підніме ваш FPS. Використовуйте FSR заради якості зображення / температур, а не як чарівну кнопку FPS.
- **Ігри з поганою багатопотоковістю чи важкою фізикою карають вас.** Фризи й стрибки часу кадру (Gothic Remake, Doom: The Dark Ages до виправлень) походять від CPU, а не від GPU.
- **GPU все одно розженіть** — коли гра *справді* обмежена по GPU (4K, важкий трасинг променів, добре розпаралелені рушії), 1500 → 2000 MHz дає ~+30 % FPS. Див. [09-overclock-undervolt.md](09-overclock-undervolt.md) щодо того, як цього досягти, і спершу [04-cooling.md](04-cooling.md), бо 2000 MHz потребує моду охолодження.

---

## Налаштування, що реально змінюють картину

- **Частоти.** Штатний GPU ~1500 MHz — це повільне значення за замовчуванням; спільнота тримає **GPU 2000 MHz, пам'ять ~1900–2000 MHz** як щоденну ціль, а дехто витискає **2.65 GHz по ядру на збірці класу dGPU**. Штатний проти 2000 MHz — це приблизно **+30 % FPS** у сценах, обмежених по GPU. ([гайд з розгону](09-overclock-undervolt.md))
- **Розблокування 40 CU.** Плата постачається з вимкненими CU. Розблокування всіх **40 CU** дає вимірюваний, широкий приріст — один користувач повідомив, що Doom: The Dark Ages пройшов шлях від непрацездатного до **60 FPS на High**, тайтл «007» — до **60 FPS на High**, а час кадрів у Great Pragmata став стабільнішим після розблокування. ([src](https://t.me/c/2424231195/141193)) Див. [09-overclock-undervolt.md](09-overclock-undervolt.md).
- **FSR / FSR 4.** Використовуйте Quality або Balanced на 1440p/4K, щоб тримати GPU завантаженим, а температури — нижчими. Спільнота активно портує **FSR 4** (пакети DLL поширюють у треді). ([обговорення FSR4 INT8 src](https://t.me/c/2424231195/136354)) Виміряні elektricM прирости від FSR: **Quality +20–30 %, Balanced +30–40 %, Performance +40–60 %** FPS; **Frame Generation може приблизно подвоїти** частоту кадрів (невелика затримка). **FSR 4 через Optiscaler** — спільнота вважає, що **Balanced перевершує рідний FSR 3.1.5 Quality**. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
  - **Який апскейлер реально використовувати:** **FSR 1–3 — практичний вибір** тут — він зрілий, дешевий і добре підтримуваний. **FSR 4 і XeSS *технічно можуть* працювати** на цьому кремнії RDNA2 через шлях **DP4a (INT8)** — RDNA2 має dp4a/Rapid Packed Math, тож і збірка FSR 4 INT8 в OptiScaler, і GPU-агностичний варіант XeSS-DP4a завантажуються — але на настільки слабкому GPU вони **повільні й експериментальні**: запасний шлях DP4a на ~10–20 % важчий за шлях WMMA, який використовують новіші карти, а якість зображення в XeSS-DP4a нижча за версію XMX. Ставтеся до FSR 4 / XeSS як до того, з чим можна поекспериментувати, а не як до щоденного робочого варіанта. ([OptiScaler FSR4 INT8 на RDNA2 — VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/)) **Офіційний AMD FSR 4 для RDNA2 (клас RX 6000) з'явиться ~на початку 2027**; до того часу це шлях через OptiScaler/моди. ([Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals))
- **Генерація кадрів поза FSR — LSFG.** **Lossless Scaling Frame-Generation (LSFG)** працює на Linux через шар Vulkan **`lsfg-vk`** ([github.com/PancakeTAS/lsfg-vk](https://github.com/PancakeTAS/lsfg-vk)) — гра-агностичний шар генерації кадрів, що чіпляється до будь-якого тайтла на Vulkan. Спільнота використовує його, щоб **приблизно подвоїти FPS** (напр. 30 → 60) в іграх без вбудованої генерації кадрів. Як і вся генерація кадрів, він додає затримку й потребує розумної реальної частоти кадрів для інтерполяції, але це справжній варіант, коли власна FG від FSR недоступна.
- **Розподіл VRAM (UMA).** Це єдиний пул на 16 ГБ. В одному ретельному прогоні (1440p, 1850 MHz) розподіл GDDR6 (512 МБ проти 8 ГБ зарезервованих) **майже не змінив середній FPS** — але надто малий чи неправильний параметр UMA може скинути вас у програмний рендеринг (`llvmpipe`) або підвісити бенчмарк. Auto / адекватний резерв — це нормально; не переускладнюйте. ([src](https://t.me/c/2424231195/81203))
- **VSync вимкнено** для бенчмаркінгу; **генерація кадрів увімкнена**, де пропонується (вона допомогла Wukong досягти трицифрових середніх, див. нижче).
- **`mitigations=off`** (завантажувальний прапор ядра) — поширене налаштування; у прогоні з VRAM воно мало лише незначний, шумний вплив на FPS. Ставтеся до нього як до малого. ⚠ **перевірте (величина спірна)** — elektricM повідомляє про набагато більший приріст (**+18 FPS у Cyberpunk, «+10–15 %»** у своїх порадах). Це явно залежить від гри: значне в деяких тайтлах, обмежених по CPU, нехтовно мале в інших. Спробуйте й виміряйте; не припускайте жодну з цифр. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

---

## Результати, які люди реально опублікували

Це повідомлені спільнотою цифри з їхніми налаштуваннями й джерелом. **Бали бенчмарків і FPS — як опубліковано** — частоти/дистрибутив/драйвер різняться між рядками, тож читайте стовпець контексту, не порівнюйте наосліп.

| Гра | Налаштування (роздільна / пресет / апскейлінг) | Результат | Залізо / частоти | Джерело |
|------|--------------------------------------|--------|-------------|--------|
| **Black Myth: Wukong** (бенч) | 1080p, High, FSR + Frame Gen увімкн. | **сер. 96** (мін. 78, макс. 113) | BC-250, Windows, RADV NAVI10 | ([src](https://t.me/c/2424231195/10069)) |
| **Black Myth: Wukong** (бенч) | 1440p, Medium, без FSR | **сер. ~48** (макс. 56) | BC-250, 1850 MHz, Linux | ([src](https://t.me/c/2424231195/81203)) |
| **Shadow of the Tomb Raider** (бенч) | 1440p, Max | **сер. ~70** | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Marvel's Guardians of the Galaxy** (бенч) | 1440p, High | **сер. ~70** (макс. 89, мін. падає до ~3) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Dying Light 2** (бенч) | 1440p, High, без VSync | **сер. ~48** (макс. 62) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Cyberpunk 2077** (бенч) | 1440p, Ray Tracing **min** | **сер. ~36** (мін. 30) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Indiana Jones and the Great Circle** | 1440p, low, без апскейлера | **45** | BC-250, GPU ~1900 MHz, Vulkan | ([src](https://t.me/c/2424231195/36931)) |
| **Indiana Jones and the Great Circle** | 1440p, medium, апскейлер увімкн. | **60** | BC-250 | ([src](https://t.me/c/2424231195/36931)) |
| **Forza Horizon 5** | **4K**, пресет High, **без FSR** | грабельно (відео) | BC-250 | ([src](https://t.me/c/2424231195/81891)) |
| **The Witcher 3** | 4K, Medium, FSR Balanced | **~50** | BC-250 | ([src](https://t.me/c/2424231195/81894)) |
| **Kingdom Come: Deliverance II** | 4K, Med/High, FSR Quality | **~30** («досвід рівня PS5») | BC-250 | ([src](https://t.me/c/2424231195/81893)) |
| **The Last of Us Part II** | 1080p, пресет за замовчуванням | грабельно (відео) | BC-250 | ([src](https://t.me/c/2424231195/94237)) |
| **Doom: The Dark Ages** | High | **60** (після розблокування 40 CU + фікс) | BC-250, 40 CU | ([src](https://t.me/c/2424231195/141193)) · [фікс на Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/) · [Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS) |
| **Doom Eternal** | RT увімкн. (за повідомленням спільноти) | **60 + RT** | BC-250; за повідомленням спільноти (r/BC250Gaming) | ([синтез Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Tekken 8** | (за повідомленням спільноти) | **~60** | BC-250; за повідомленням спільноти (r/BC250Gaming) | ([синтез Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Street Fighter 6** | (за повідомленням спільноти) | **~60** | BC-250; за повідомленням спільноти (r/BC250Gaming) | ([синтез Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Stellar Blade** | (за повідомленням спільноти) | **~70–80** | BC-250; за повідомленням спільноти (r/BC250Gaming) | ([синтез Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | Frame Generation увімкн. (за повідомленням спільноти) | **60 → 100** (FG) | BC-250; за повідомленням спільноти (r/BC250Gaming) | ([синтез Reddit](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | (відео) | грабельно | BC-250, CPU штатний, **GPU 2000** | ([src](https://t.me/c/2424231195/121772)) |
| **Gothic Remake** | Medium | **фризи** — «без оптимізації» | BC-250 | ([src](https://t.me/c/2424231195/142708)) |
| **Hi-Fi Rush** | (відео, захоплення OBS) | плавно | BC-250, `mitigations=off` | ([src](https://t.me/c/2424231195/91022)) |
| **Cyberpunk 2077** | 1080p, High, FSR Quality, **без RT** | **70–90** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Cyberpunk 2077** (бенч) | 1080p (штатні 2000 MHz / 1000 mV) | **57.66** → **60.82** OC (2230 MHz); `mitigations=off` **+18** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **The Last of Us Part I** | 1080p, Medium-High | **60** (стабільно) | BC-250 — 90–100 °C під час компіляції шейдерів; деяке клацання в аудіо | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Devil May Cry 5** | 1080p, High | **100** (найнижча затримка, ~10 ms) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Detroit: Become Human** | 1080p, Medium | **60** (з обмеженням) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Control** | 1080p, повний **RT** | **40** | BC-250 — добре для RT початкового рівня | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Company of Heroes 3** | 1080p | грабельно — **потребує розподілу VRAM 4 ГБ** (512 МБ — артефакти/вильоти) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Red Dead Redemption 2** (бенч) | використовуйте прапор `-useMaximumSettings` | **45+** мін. | BC-250 — може визначати хибний адаптер GPU, задайте вручну | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **CS2** / **Rocket League** / **Elden Ring** | 1080p | **100+** / **120+** / **60** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Helldivers 2** | 1080p, low (за повідомленням) | **≈82** | BC-250, штатний, один Noctua NF-P12 — GPU 73 °C / CPU 76 °C; ⚠ ASR | ([«Temps Shocked Me»](https://youtu.be/d7Hwqxn9yg8) ~5:08) |
| **Stalker 2** | medium (за повідомленням) | **≈80** | BC-250 — автор зазначає обмеження по CPU / 8 ГБ RAM; ⚠ ASR | ([RU-огляд](https://youtu.be/19l03qneKJ4) ~0:23) |
| **Stalker 2** | QHD (2560×1600), FSR Quality + Frame Gen, патч 1.21 (за повідомленням) | **57–70** (1080p, без FG **≈45**) | BC-250; ⚠ ASR | ([RU-огляд](https://youtu.be/19l03qneKJ4) ~18:52) |
| **Arc Raiders** | 1080p (за повідомленням) | **≈56–80** | BC-250, штатний; ⚠ ASR | ([Temps Shocked Me](https://youtu.be/d7Hwqxn9yg8) ~5:58) |
| **Spider-Man 2** | 1080p, High, FSR Frame Gen (за повідомленням) | **≈100** сер. (рідні менш ніж 60) | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~11:04) |
| **Forza Horizon 5** | 1080p, Medium, без FSR (за повідомленням) | **70–95** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~12:19) |
| **Metro Exodus** | QHD, High (за повідомленням) | **≈58** | BC-250; ⚠ ASR | ([RU-огляд](https://youtu.be/19l03qneKJ4) ~14:12) |
| **Palworld** | 1080p, med-high (за повідомленням) | **<60** (грабельно) | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:04) |
| **Red Dead Redemption 2** | 1080p, med-high, FSR Quality (за повідомленням) | **стабільні 60** | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:19) |
| **Left 4 Dead 2** | 1080p, max (за повідомленням) | **>150** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~10:18) |
| _Для довідки: збірка з дискретним GPU_ | бенч RE-engine, 1080p, High, без RT | **сер. 67.99** (мін. 58, макс. 82) | **RX 6600** + Xeon E5-2667v4, Win10 | ([src](https://t.me/c/2424231195/116494)) |

> Рядок RX 6600 — це **не результат BC-250** — це учасник, що запускає дискретну карту на тому самому шасі/CPU як точку порівняння. Включено, щоб показати, що *сам CPU* здатний витримати.

> ⚠️ **Elden Ring — результати різняться.** ~60 FPS вище (elektricM, 1080p) не є універсальними: одна збірка спільноти була **обмежена зафіксованими 30 FPS на High і не могла досягти 60 навіть на 720p low** (обмеження по CPU). Ставтеся до 60 як до найкращого випадку, а не гарантії. ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:50)

### Ексклюзивні / консольні порти — найсолодше місце

Вони працювали достатньо добре, щоб один учасник просто перелічив їх як «працює» (порти в стилі PS покладаються на GPU й добре оптимізовані, що пасує цій платі):

> Days Gone · Death Stranding · DIRT 5 · Ghost of Tsushima: Director's Cut · God of War (2018) · God of War: Ragnarök · Horizon Forbidden West · Horizon Zero Dawn · The Last of Us Part I · The Last of Us Part II Remastered · Returnal · Uncharted: Legacy of Thieves

([src](https://t.me/c/2424231195/99563))

---

## Відомі проблемні ігри (не працюють / потребують обхідного шляху)

elektricM відстежує тайтли, яких ми не охопили й які **не запускаються або борються з платформою** — перевірте перед покупкою:

| Гра | Проблема | Обхідний шлях |
|------|---------|-----------|
| **Fortnite** | Easy Anti-Cheat **не підтримує Linux** | **Жодного — не може працювати** на BC-250 під Linux |
| **Valorant** | Античит на рівні ядра | Технічні проблеми на Linux; фактично ні |
| **Magic: The Gathering Arena** | Вильоти/зависання саме на **Fedora** | Працює краще на **Manjaro / Bazzite**; спробуйте інший Proton |
| **Final Fantasy VII Rebirth** | «DX12 is not supported on your system» (перевірка сумісності GPU) | **Виправлення поки немає** |
| **Black Myth: Wukong** (зламана версія) | «CreateProcess() returned 2» (захист від модифікації) | Використовуйте **немодифіковані файли гри** |

(Статус античитів змінюється з часом — звіряйтеся з [areweanticheatyet.com](https://areweanticheatyet.com) та [protondb.com](https://www.protondb.com).) ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

### Жорстко заблоковані через відсутні функції GPU (невиправно)

Це **кремній класу RDNA 2** (GFX1013). Кілька новіших тайтлів **жорстко вимагають функцій GPU, яких RDNA 2 не має** — головно **mesh-шейдери** і **апаратний variable-rate shading (VRS)** — і відмовляються запускатися. Відсутній кремній — це **апаратне обмеження, а не баг драйвера**: жодне оновлення Mesa, параметр ядра чи версія Proton не додає саму функцію. **Mesh-шейдери** — справжня стіна. Вимога **VRS** іноді є лише перевіркою під час запуску, яку шар Vulkan з простору користувача може заглушити (див. примітку про Doom нижче) — тож вона не завжди фатальна. Підтверджені приклади ([тред спільноти r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)):

| Гра | Жорстка вимога, якої немає в BC-250 |
|------|------------------------------------|
| **Final Fantasy VII Rebirth** | **Mesh-шейдери** — не запуститься (це також причина, чому вона спотикається на перевірці сумісності DX12 GPU в таблиці вище) |
| **Doom: The Dark Ages — Update 2** | **Vulkan fragment shading rate** (апаратний VRS) — Update 2 зробив VRS обов'язковим *під час запуску*; GPU його не має, тож немодифікована гра більше не стартує (збірка до Update 2 працювала на 60 FPS після розблокування 40 CU, вище). **Обхідний шлях існує** — див. примітку нижче. |

> **Doom: The Dark Ages Update 2 — тепер є обхідний шлях.** Гра лише *перевіряє* наявність VRS під час запуску; для геймплея він їй насправді ніколи не потрібен. Шар Vulkan **`bangstk/Vulkan_NullVRS`** ([github.com/bangstk/Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS)) перехоплює `vkCmdSetFragmentShadingRateKHR()` і робить його no-op, задовольняючи перевірку запуску, тож гра працює без побічних ефектів у самій грі. Отже, Doom: The Dark Ages **не** є постійним жорстким блоком. **Mesh-шейдери — це інше** — для вимоги mesh-шейдерів у FF7 Rebirth немає еквівалентного шиму, тож та гра справді не запуститься.

> Перед покупкою новенького AAA-тайтла перевірте, чи зазначає він mesh-шейдери або апаратний VRS як вимогу. **Mesh-шейдери** тут — справжня апаратна стіна (без обхідного шляху). Вимога **апаратного VRS** часто є лише бар'єром під час запуску — іноді її можна обійти шимом (як із Doom вище), іноді ні — тож перевірте у спільноти, перш ніж припускати в будь-який бік.

## Трасинг променів — що реально протестовано

BC-250 має **справжній апаратний RT від RDNA2** (не програмну емуляцію, з огляду на Mesa 25.2+). Протестовані RT-тайтли за elektricM:

| Гра | Роздільна | FPS | Примітки |
|------|-----|-----|-------|
| Cyberpunk 2077 | 1080p | 50–60 | Лише RT-освітлення, FSR Quality |
| Control | 1080p | 40 | Повний RT |
| Portal 2 RTX | 720p | 40 | Шлях програмного RT у Mesa 25.2+ |
| Half-Life 2 RTX | 720p | 20–30 | Дуже вимоглива |

RT тут початкового рівня — нормально для *лише освітлення* в добре оптимізованих іграх, не для повних навантажень з трасуванням шляхів. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

## Proton і параметри запуску (Linux)

- **Версія Proton:** почніть із **Proton GE** (найкраща сумісність) або **Proton Experimental**; за потреби відкочуйтеся до стабільних **8.0 / 9.0** для кожної гри. Встановіть GE через **ProtonUp-Qt** (`protonup-qt`). Деякі тайтли працюють лише на конкретній версії — тестуйте, якщо одна не спрацьовує. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Параметри запуску Steam**, які варто знати:
  - `mangohud %command%` — оверлей FPS/температур.
  - `RADV_DEBUG=nohiz %command%` — примушує RADV / виправляє деякі глюки.
  - `gamemoderun %command%` — переводить регулятор CPU у performance на час сесії (допомагає цій обмеженій по CPU платі).
  - Комбіновано: `RADV_DEBUG=nohiz mangohud gamemoderun %command%`.
- **VRAM на гру (розподіл UMA):** для кіберспорту/інді достатньо **512 МБ**; **більшості ігор потрібно 4 ГБ**; AAA/RT також потребують параметрів ядра для додаткової VRAM (`amdgpu.gttsize=...`, див. [06-linux.md](06-linux.md) / [08-bios.md](08-bios.md)). Надто малий розподіл спричиняє артефакти, вильоти або скидання у програмний рендеринг. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Фризи на першому запуску** — це зазвичай **компіляція шейдерів** — дайте Steam завершити попередню компіляцію, перш ніж судити про FPS; більший кеш шейдерів допомагає. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Фікси для окремих ігор** (за повідомленням спільноти, r/BC250Gaming — спробуйте, якщо натрапите саме на ці баги):
  - **Resident Evil Requiem — зламане/глючне волосся:** додайте `RADV_DEBUG=nohiz %command%` до параметрів запуску (той самий прапор RADV, наведений вище, застосований тут конкретно). ([синтез Reddit](https://www.reddit.com/r/BC250Gaming/))
  - **Spider-Man 2 / Assassin's Creed Shadows — зависання:** увімкнення **zswap** (стиснений swap), за повідомленнями, припиняє зависання. ([синтез Reddit](https://www.reddit.com/r/BC250Gaming/))

---

## Емуляція

Емулятори вимогливі до CPU, тож результати змішані, але кілька надійних ([src](https://t.me/c/2424231195/78988)):

- **Switch — Eden / Ryujinx:** працює добре й швидко. За повідомленням спільноти (r/BC250Gaming): **Mario Kart ~60 FPS**; **Tears of the Kingdom ~30–40 FPS**. ✅ ([синтез Reddit](https://www.reddit.com/r/BC250Gaming/))
- **PS4 — shadPS4 (0.9.0+):** Bloodborne працює добре без просадок; деякі тайтли (The Last Guardian) дають артефакти, але тримають стабільний FPS. ✅
- **PS3 — RPCS3:** працює, але потребує підлаштування під кожну гру. ⚠️ **Відома особливість** (за повідомленням спільноти, r/BC250Gaming): баг емулятора **фіксує GPU на 1000 MHz** під RPCS3, тож GPU не може підняти частоту — обхідний шлях полягає в тому, щоб **розігнати CPU для компенсації** втраченого запасу GPU. ([синтез Reddit](https://www.reddit.com/r/BC250Gaming/))
- **Xbox 360 — Xenia Canary:** меню завантажуються, геймплей зривається в чорний екран (досі досліджується). ❌

---

## Де побачити це в дії (відео)

Спільнота публікує багато відео геймплея/бенчмарків. Кілька захоплень із тредів і каналів:

- Кліпи геймплея/бенчмарків BC-250: [youtu.be/CYDv1SfD2Pc](https://youtu.be/CYDv1SfD2Pc) · [youtu.be/g3uWOfqcexA](https://youtu.be/g3uWOfqcexA) · [youtu.be/9fozmRrAouc](https://youtu.be/9fozmRrAouc) · [youtu.be/q64M2XzADjA](https://youtu.be/q64M2XzADjA) · [youtu.be/0LEkOG1yqqw](https://youtu.be/0LEkOG1yqqw)
- Таблиця спільноти для відстеження протестованих ігор (FPS/налаштування): [Google Sheet](https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing)

---

## Шпаргалка реалістичних очікувань

| Ви хочете… | Реальність на BC-250 з 2000 MHz і модами |
|-----------|--------------------------------------|
| 1080p AAA, 60 FPS | Іноді — залежить від навантаження на CPU. FSR + Frame Gen допомагає. Старіші/легші AAA: так. |
| 1440p AAA | 40–60 FPS у більшості портів; GPU тут має запас. Найвигідніша роздільна здатність. |
| 4K AAA | 30–50 FPS із FSR у добре оптимізованих/консольних портах (Forza, Witcher 3, KCD2). |
| Трасинг променів | Лише на мінімумі, низький FPS (Cyberpunk ~36 @ 1440p RT-min). Не сильна сторона плати. |
| Зафіксовані 60 усюди | Ні. Обмежені по CPU й важкі за фізикою тайтли просідатимуть/фризитимуть незалежно від налаштувань. |
| Ексклюзивні порти PS | Найсолодше місце — це те, що плата робить найкраще. |

---

## Джерела

- Бенчмарк з обмеженням по CPU (38 FPS, 36.5 % GPU) — https://t.me/c/2424231195/136242
- Велика таблиця бенчмарків VRAM/частот (Wukong, Tomb Raider, Dying Light 2, Cyberpunk, Guardians) — https://t.me/c/2424231195/81203
- Wukong 1080p High FSR+FG, сер. 96 — https://t.me/c/2424231195/10069
- Indiana Jones Great Circle, кілька роздільних — https://t.me/c/2424231195/36931
- Forza Horizon 5 4K — https://t.me/c/2424231195/81891 · Witcher 3 4K — https://t.me/c/2424231195/81894 · KCD2 4K — https://t.me/c/2424231195/81893
- Результати розблокування 40 CU (Doom Dark Ages 60 FPS) — https://t.me/c/2424231195/141193 · фікс Doom — https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/
- TLOU II 1080p — https://t.me/c/2424231195/94237 · Resident Evil Requiem — https://t.me/c/2424231195/121772 · фризи Gothic Remake — https://t.me/c/2424231195/142708
- Список ексклюзивних портів — https://t.me/c/2424231195/99563
- Огляд емуляції — https://t.me/c/2424231195/78988
- Порівняльний прогін dGPU RX 6600 — https://t.me/c/2424231195/116494
- Сумісність ігор від elektricM (налаштування/FPS для кожної гри, проблемні ігри, таблиця RT, Proton і параметри запуску, прирости FSR) — https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/
- Захоплення FPS із YouTube (авто-субтитри / ASR — цифри приблизні): ETA Prime (Spider-Man 2, Forza H5, Left 4 Dead 2) — https://youtu.be/q_CxcbS5HI8 · «Temps Shocked Me» (Helldivers 2, Arc Raiders) — https://youtu.be/d7Hwqxn9yg8 · RU-огляд (Stalker 2, Metro Exodus) — https://youtu.be/19l03qneKJ4 · Pixels & Power (Palworld, RDR2, Elden Ring 30 FPS) — https://youtu.be/4S0DvIpqm0E
- Жорсткі блоки mesh-шейдерів / апаратного VRS (FF7 Rebirth, Doom: The Dark Ages Update 2) — [тред r/linux_gaming](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- **Doom: The Dark Ages обхід VRS — `bangstk/Vulkan_NullVRS`** (no-op шар Vulkan для `vkCmdSetFragmentShadingRateKHR`) — https://github.com/bangstk/Vulkan_NullVRS
- **Генерація кадрів LSFG на Linux — `lsfg-vk`** (шар Vulkan) — https://github.com/PancakeTAS/lsfg-vk
- **FSR 4 / XeSS через DP4a (INT8) на RDNA2** — збірка OptiScaler FSR4 INT8: [VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/) · [вікі сумісності OptiScaler FSR4](https://github.com/optiscaler/OptiScaler/wiki/FSR4-Compatibility-List)
- **Офіційний AMD FSR 4 для RDNA2 (~початок 2027) / RDNA3 (липень 2026)** — [Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals)
- **Результати ігор за повідомленням спільноти (r/BC250Gaming)** — Tekken 8, Street Fighter 6, Stellar Blade, RE Requiem Frame-Gen, Doom Eternal RT, Switch (Mario Kart / TOTK), фіксація GPU на 1000 MHz у RPCS3, фікси волосся RE Requiem / Spider-Man 2 / AC Shadows — https://www.reddit.com/r/BC250Gaming/
- Таблиця спільноти з тестами ігор — https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing

> Частоти й розблокування 40 CU живуть у [09-overclock-undervolt.md](09-overclock-undervolt.md); зробіть мод [04-cooling.md](04-cooling.md), перш ніж запускати 2000 MHz.
