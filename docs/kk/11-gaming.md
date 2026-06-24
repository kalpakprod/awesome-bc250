> 🌐 Қауымдастық аудармасы. Ағылшын нұсқасы — шындық көзі әрі жаңарақ болуы мүмкін. Қате таптыңыз ба? Issue ашыңыз: [English](../en/11-gaming.md) · [issues](https://github.com/lildebil0/awesome-bc250/issues)

# Ойын нәтижелері мен баптаулары

> **TL;DR** — BC-250 — бұл **қысқартылған 6-ядролы Zen2-ге бұрандаланған PS5 класындағы GPU**. GPU шынымен қабілетті: нақты өмірдегі **2000 MHz** оверклокта ол заманауи AAA тайтлдарын **40–60 FPS**-те, ал жеңілдеу/ескілеу ойындарды 60-тан әлдеқайда жоғары жүргізеді. Ілмек — **CPU**-да. APU-дың Zen2 жартысы GPU-ға қарағанда әлдеқайда жиі бөгет (bottleneck) болады — қауымдастық бенчмарктары картаның **~38 FPS-ке бекітіліп тұрғанда GPU жүктемесінің ~36–47 %** деңгейінде отыратынын, яғни CPU-мен шектелгенін қайта-қайта көрсетеді. Сондықтан: **алдымен оверклок жасаңыз** (стоктық ~1500 MHz шамамен 30 % баяу), **FSR** мен кадр генерациясына сүйеніңіз, **1080p–1440p** мақсат етіңіз әрі физикаға ауыр немесе нашар көп ағынды (badly-threaded) ойындар ажыратымдылыққа қарамастан қататынын қабылдаңыз. Консоль стиліндегі бірінші тараптық порттар (God of War, Horizon, Last of Us, Spider-Man) — ең тиімді тұс.

Бұл бөлім күтулерді белгілейді әрі қауымдастықтың нақты, жарияланған нәтижелерін жинайды — олардың көбі бенчмарк скриншоттары. Сандар жиілікке, дистрибутивке, драйверге және VRAM бөлінісіне қарай өзгереді, сондықтан әр жол өз көзіне байланған.

---

## Алдымен түсінетін жалғыз нәрсе: ол CPU-мен шектелген

BC-250-дің GPU-ы — PS5-тен туындаған RDNA2 бөлшегі (RADV оны `GFX1013` / NAVI10-класс деп хабарлайды). Көп ойында **ол** — әлсіз буын емес. Әлсіз буын — PS5 стиліндегі қысқартылған кэшпен әрі қор ретінде артық SMT-сыз ~3.5 GHz-те жұмыс істейтін **6-ядролы Zen2 CPU**.

**1080p, High, GPU @ 2000 MHz / mem @ 3600 MHz** баптауларындағы қауымдастық бенчмаркы мұны нақтылайды: прогон **«38 FPS-ке жетті»**, бірақ **GPU Limited Percentage небәрі 36.5 %** болды — CPU симуляция ағыны қақпа болды (кезеңге бөлінген өлшегіште CPU sim ~70 / CPU render ~43 / GPU ~47). CPU кадр жиілігін төмен ұстап тұрғанда GPU өз қуатының үштен бірінде бос отырды. ([src](https://t.me/c/2424231195/136242))

Практикалық салдары:

- **Ажыратымдылық көбіне «тегін».** Сіз CPU-мен шектелгендіктен, 1080p-тен 1440p-ке (тіпті FSR-мен 4K-ға) көшу жиі FPS-ке аз ғана шығын әкеледі — GPU-да бәрібір артық қор болған. Төмендегі бірнеше 4K нәтижесі дәл осы себептен өздерінің 1080p баламаларымен бірдей дерлік жақсы көрінеді.
- **Масштабтау қарапайым ПК-ге қарағанда аз көмектеседі.** FSR GPU-ды жеңілдетеді, бірақ егер CPU шектегіш болса, рендер ажыратымдылығын түсіру FPS-іңізді көп көтермейді. FSR-ді сурет сапасы / температура үшін қолданыңыз, сиқырлы FPS түймесі ретінде емес.
- **Нашар көп ағынды немесе физикаға ауыр ойындар жазалайды.** Қату мен кадр уақытының секірістері (Gothic Remake, Doom: The Dark Ages түзетулерге дейін) GPU-дан емес, CPU-дан туындайды.
- **GPU-ды бәрібір оверклок жасаңыз** — ойын *шынымен* GPU-мен шектелгенде (4K, ауыр ray tracing, жақсы көп ағынды қозғалтқыштар), 1500 → 2000 MHz шамамен +30 % FPS береді. Оған қалай жетуді [09-overclock-undervolt.md](09-overclock-undervolt.md), әрі алдымен [04-cooling.md](04-cooling.md) бөлімінен қараңыз, өйткені 2000 MHz салқындату модын талап етеді.

---

## Шынымен нәтиже беретін баптаулар

- **Жиіліктер.** Стоктық GPU ~1500 MHz — баяу әдепкі; қауымдастық күнделікті мақсат ретінде **GPU 2000 MHz, mem ~1900–2000 MHz** жүргізеді, кейбіреулері **dGPU класындағы құрастыруда 2.65 GHz ядро** дейін итереді. Стоктық пен 2000 MHz арасы GPU-мен шектелген сценалардағы шамамен **+30 % FPS**. ([оверклок нұсқаулығы](09-overclock-undervolt.md))
- **40 CU ашу.** Тақта CU-лары өшірілген күйде жеткізіледі. Барлық **40 CU**-ды ашу өлшеуге келетін, кең көтерілім береді — бір қолданушы Doom: The Dark Ages-тің бұзылған күйден **60 FPS High**-қа өткенін, бір «007» тайтлдың **60 FPS High** болғанын, әрі ашудан кейін Great Pragmata-да кадр уақыттары тұрақтанғанын хабарлады. ([src](https://t.me/c/2424231195/141193)) [09-overclock-undervolt.md](09-overclock-undervolt.md) қараңыз.
- **FSR / FSR 4.** GPU-ды жүктеулі ұстау әрі температураны төмендету үшін 1440p/4K-да Quality немесе Balanced қолданыңыз. Қауымдастық **FSR 4**-ті белсенді порттап жатыр (DLL пакеттері тред ішінде бөлісілген). ([FSR4 INT8 талқылау src](https://t.me/c/2424231195/136354)) elektricM өлшеген FSR көтерілімдері: **Quality +20–30 %, Balanced +30–40 %, Performance +40–60 %** FPS; **Frame Generation кадр жиілігін шамамен екі есе** көбейте алады (шамалы кідіріс). **Optiscaler арқылы FSR 4** — қауымдастық **Balanced нативтік FSR 3.1.5 Quality-ден жақсырақ** екенін табады. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
  - **Қай масштабтауышты шынымен қолдану керек:** мұнда **FSR 1–3 — практикалық таңдау** — ол жетілген, арзан әрі жақсы қолдау көрсетіледі. **FSR 4 мен XeSS техникалық тұрғыдан** осы RDNA2 кремнийінде **DP4a (INT8) жолы** арқылы *жұмыс істей алады* — RDNA2-де dp4a/Rapid Packed Math бар, сондықтан OptiScaler-дің FSR 4 INT8 құрастыруы да, GPU-агностик XeSS-DP4a нұсқасы да жүктеледі — бірақ мұндай әлсіз GPU-да олар **баяу әрі эксперименттік**: DP4a fallback жаңарақ карталар қолданатын WMMA жолынан шамамен 10–20 % ауырлау, ал XeSS-DP4a сурет сапасы XMX нұсқасынан төмен. FSR 4 / XeSS-ті күнделікті құрал ретінде емес, эксперимент жасайтын нәрсе ретінде қараңыз. ([OptiScaler FSR4 INT8 on RDNA2 — VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/)) **RDNA2 (RX 6000-класс) үшін ресми AMD FSR 4 ~2027 басында** келеді; оған дейін бұл — OptiScaler/модталған жол. ([Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals))
- **FSR-ден тыс кадр генерациясы — LSFG.** **Lossless Scaling Frame-Generation (LSFG)** Linux-та **`lsfg-vk`** Vulkan қабаты арқылы жұмыс істейді ([github.com/PancakeTAS/lsfg-vk](https://github.com/PancakeTAS/lsfg-vk)) — кез келген Vulkan тайтлды ілетін ойын-агностик кадр-ген қабаты. Қауымдастық оны кірістірілген кадр генерациясы жоқ ойындарда **FPS-ті шамамен екі есе** көбейтуге қолданады (мысалы, 30 → 60). Барлық кадр-ген сияқты ол кідіріс қосады әрі интерполяциялау үшін орынды нақты кадр жиілігін қалайды, бірақ FSR-дің өз FG-сі қолжетімді болмағанда бұл — шынайы нұсқа.
- **VRAM бөлінісі (UMA).** Бұл — біріктірілген 16 GB пул. Бір мұқият сканерде (1440p, 1850 MHz) GDDR6 бөлінісі (512 MB-қа қарсы 8 GB резервтелген) **орташа FPS-ті әрең өзгертті** — бірақ тым кіші немесе қате UMA баптауы сізді бағдарламалық рендерге (`llvmpipe`) түсіруі немесе бенчмаркты қатырып тастауы мүмкін. Auto / орынды резерв жеткілікті; артық ойланбаңыз. ([src](https://t.me/c/2424231195/81203))
- **VSync өшірулі** — бенчмаркинг үшін; ұсынылған жерде **кадр генерациясы қосулы** (ол Wukong-қа үш таңбалы орташа сандарға жетуге көмектесті, төменнен қараңыз).
- **`mitigations=off`** (ядро жүктеу жалаушасы) — кең тараған түзету; VRAM сканерінде оның FPS-ке тек шамалы, шулы әсері болды. Оны кіші деп қараңыз. ⚠ **тексеру (шамасы дауланады)** — elektricM әлдеқайда үлкен көтерілімді хабарлайды (өз кеңестерінде **Cyberpunk-та +18 FPS, «+10–15 %»**). Ол анық ойынға тәуелді: кейбір CPU-мен шектелген тайтлдарда үлкен, басқаларында болмашы. Оны сынап, өлшеңіз; екі санның бірін де жорамалдамаңыз. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

---

## Адамдар шынымен жариялаған нәтижелер

Бұлар — баптаулары мен көзі бар, қауымдастық хабарлаған цифрлар. **Бенчмарк ұпайлары мен FPS — жарияланғандай**; жолдар арасында жиілік/дистрибутив/драйвер ерекшеленеді, сондықтан контекст бағанын оқыңыз, соқыр салыстырмаңыз.

| Ойын | Баптаулар (ажыр. / пресет / масштабтау) | Нәтиже | Аппарат / жиіліктер | Көз |
|------|--------------------------------------|--------|-------------|--------|
| **Black Myth: Wukong** (бенч) | 1080p, High, FSR + Frame Gen қосулы | **орт. 96** (мин 78, макс 113) | BC-250, Windows, RADV NAVI10 | ([src](https://t.me/c/2424231195/10069)) |
| **Black Myth: Wukong** (бенч) | 1440p, Medium, FSR жоқ | **орт. ~48** (макс 56) | BC-250, 1850 MHz, Linux | ([src](https://t.me/c/2424231195/81203)) |
| **Shadow of the Tomb Raider** (бенч) | 1440p, Max | **орт. ~70** | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Marvel's Guardians of the Galaxy** (бенч) | 1440p, High | **орт. ~70** (89 макс, мин ~3-ке дейін түседі) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Dying Light 2** (бенч) | 1440p, High, VSync жоқ | **орт. ~48** (макс 62) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Cyberpunk 2077** (бенч) | 1440p, Ray Tracing **min** | **орт. ~36** (мин 30) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Indiana Jones and the Great Circle** | 1440p, low, масштабтауышсыз | **45** | BC-250, GPU ~1900 MHz, Vulkan | ([src](https://t.me/c/2424231195/36931)) |
| **Indiana Jones and the Great Circle** | 1440p, medium, масштабтауыш қосулы | **60** | BC-250 | ([src](https://t.me/c/2424231195/36931)) |
| **Forza Horizon 5** | **4K**, High пресет, **FSR жоқ** | ойналады (видео) | BC-250 | ([src](https://t.me/c/2424231195/81891)) |
| **The Witcher 3** | 4K, Medium, FSR Balanced | **~50** | BC-250 | ([src](https://t.me/c/2424231195/81894)) |
| **Kingdom Come: Deliverance II** | 4K, Med/High, FSR Quality | **~30** («PS5 тәжірибесі») | BC-250 | ([src](https://t.me/c/2424231195/81893)) |
| **The Last of Us Part II** | 1080p, әдепкі пресет | ойналады (видео) | BC-250 | ([src](https://t.me/c/2424231195/94237)) |
| **Doom: The Dark Ages** | High | **60** (40 CU ашудан + түзетуден кейін) | BC-250, 40 CU | ([src](https://t.me/c/2424231195/141193)) · [Reddit fix](https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/) · [Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS) |
| **Doom Eternal** | RT қосулы (қауымдастық хабарлаған) | **60 + RT** | BC-250; қауымдастық хабарлаған (r/BC250Gaming) | ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/)) |
| **Tekken 8** | (қауымдастық хабарлаған) | **~60** | BC-250; қауымдастық хабарлаған (r/BC250Gaming) | ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/)) |
| **Street Fighter 6** | (қауымдастық хабарлаған) | **~60** | BC-250; қауымдастық хабарлаған (r/BC250Gaming) | ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/)) |
| **Stellar Blade** | (қауымдастық хабарлаған) | **~70–80** | BC-250; қауымдастық хабарлаған (r/BC250Gaming) | ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | Frame Generation қосулы (қауымдастық хабарлаған) | **60 → 100** (FG) | BC-250; қауымдастық хабарлаған (r/BC250Gaming) | ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | (видео) | ойналады | BC-250, CPU стоктық, **GPU 2000** | ([src](https://t.me/c/2424231195/121772)) |
| **Gothic Remake** | Medium | **қатады** — «оптимизация жоқ» | BC-250 | ([src](https://t.me/c/2424231195/142708)) |
| **Hi-Fi Rush** | (видео, OBS түсірілім) | тегіс | BC-250, `mitigations=off` | ([src](https://t.me/c/2424231195/91022)) |
| **Cyberpunk 2077** | 1080p, High, FSR Quality, **RT жоқ** | **70–90** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Cyberpunk 2077** (бенч) | 1080p (стоктық 2000 MHz / 1000 mV) | **57.66** → **60.82** OC (2230 MHz); `mitigations=off` **+18** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **The Last of Us Part I** | 1080p, Medium-High | **60** (тұрақты) | BC-250 — шейдер компиляциясы кезінде 90–100 °C; біраз аудио шертіл | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Devil May Cry 5** | 1080p, High | **100** (ең төмен кідіріс, ~10 ms) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Detroit: Become Human** | 1080p, Medium | **60** (шектелген) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Control** | 1080p, толық **RT** | **40** | BC-250 — бастапқы деңгейлі RT үшін жақсы | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Company of Heroes 3** | 1080p | ойналады — **4 GB VRAM бөлінісін қажет етеді** (512 MB артефакт/крэш) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Red Dead Redemption 2** (бенч) | `-useMaximumSettings` жалаушасын қолданыңыз | **45+** мин | BC-250 — қате GPU адаптерін анықтауы мүмкін, оны қолмен орнатыңыз | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **CS2** / **Rocket League** / **Elden Ring** | 1080p | **100+** / **120+** / **60** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Helldivers 2** | 1080p, low (хабарланған) | **≈82** | BC-250, стоктық, жалғыз Noctua NF-P12 — GPU 73 °C / CPU 76 °C; ⚠ ASR | ([«Temps Shocked Me»](https://youtu.be/d7Hwqxn9yg8) ~5:08) |
| **Stalker 2** | medium (хабарланған) | **≈80** | BC-250 — автор CPU-мен шектелген / 8 GB RAM деп белгілейді; ⚠ ASR | ([RU review](https://youtu.be/19l03qneKJ4) ~0:23) |
| **Stalker 2** | QHD (2560×1600), FSR Quality + Frame Gen, patch 1.21 (хабарланған) | **57–70** (1080p, FG жоқ **≈45**) | BC-250; ⚠ ASR | ([RU review](https://youtu.be/19l03qneKJ4) ~18:52) |
| **Arc Raiders** | 1080p (хабарланған) | **≈56–80** | BC-250, стоктық; ⚠ ASR | ([Temps Shocked Me](https://youtu.be/d7Hwqxn9yg8) ~5:58) |
| **Spider-Man 2** | 1080p, High, FSR Frame Gen (хабарланған) | **≈100** орт. (нативте 60-тан төмен) | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~11:04) |
| **Forza Horizon 5** | 1080p, Medium, FSR жоқ (хабарланған) | **70–95** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~12:19) |
| **Metro Exodus** | QHD, High (хабарланған) | **≈58** | BC-250; ⚠ ASR | ([RU review](https://youtu.be/19l03qneKJ4) ~14:12) |
| **Palworld** | 1080p, med-high (хабарланған) | **<60** (ойналады) | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:04) |
| **Red Dead Redemption 2** | 1080p, med-high, FSR Quality (хабарланған) | **тұрақты 60** | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:19) |
| **Left 4 Dead 2** | 1080p, max (хабарланған) | **>150** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~10:18) |
| _Анықтама: дискретті GPU құрастыруы_ | RE-engine бенч, 1080p, High, RT жоқ | **орт. 67.99** (мин 58, макс 82) | **RX 6600** + Xeon E5-2667v4, Win10 | ([src](https://t.me/c/2424231195/116494)) |

> RX 6600 жолы — **BC-250 нәтижесі емес** — бұл салыстыру нүктесі ретінде сол шасси/CPU-да дискретті картаны жүргізіп отырған мүше. *CPU* жалғыз өзі нені ұстай алатынын көрсету үшін енгізілген.

> ⚠️ **Elden Ring — нәтижелер әртүрлі.** Жоғарыдағы ~60 FPS (elektricM, 1080p) — әмбебап емес: бір қауымдастық құрастыруы **High-та бекітілген 30 FPS-ке шектелді әрі тіпті 720p low-та да 60-қа жете алмады** (CPU-мен шектелген). 60-ты кепілдік емес, ең жақсы жағдай ретінде қараңыз. ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:50)

### Бірінші тараптық / консоль порттары — ең тиімді тұс

Бұлар жеткілікті жақсы жүргені сонша, бір мүше оларды жай ғана «жұмыс істейді» деп тізіп берді (PS стиліндегі порттар GPU-ға сүйенеді әрі жақсы оптимизацияланған, бұл осы тақтаға сай):

> Days Gone · Death Stranding · DIRT 5 · Ghost of Tsushima: Director's Cut · God of War (2018) · God of War: Ragnarök · Horizon Forbidden West · Horizon Zero Dawn · The Last of Us Part I · The Last of Us Part II Remastered · Returnal · Uncharted: Legacy of Thieves

([src](https://t.me/c/2424231195/99563))

---

## Белгілі проблемалы ойындар (жұмыс істемейді / айналып өту керек)

elektricM біз қамтымаған, **платформада сәтсіздікке ұшырайтын немесе онымен күресетін** тайтлдарды қадағалайды — сатып алмас бұрын тексеріңіз:

| Ойын | Проблема | Айналып өту |
|------|---------|-----------|
| **Fortnite** | Easy Anti-Cheat **Linux-ты қолдамайды** | **Жоқ — Linux BC-250-де жұмыс істей алмайды** |
| **Valorant** | Ядро деңгейіндегі анти-чит | Linux-та техникалық мәселелер; іс жүзінде жоқ |
| **Magic: The Gathering Arena** | Дәл **Fedora**-да крэш/қату | **Manjaro / Bazzite**-те жақсырақ; басқа Proton-ды сынаңыз |
| **Final Fantasy VII Rebirth** | «DX12 is not supported on your system» (GPU-сәйкестік тексеруі) | **Әзірге түзету жоқ** |
| **Black Myth: Wukong** (бұзылған) | «CreateProcess() returned 2» (анти-тампер) | **Өзгертілмеген ойын файлдарын** қолданыңыз |

(Анти-чит мәртебесі уақыт өте өзгереді — [areweanticheatyet.com](https://areweanticheatyet.com) және [protondb.com](https://www.protondb.com) арқылы салыстырып тексеріңіз.) ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

### Жетіспейтін GPU мүмкіндіктерімен қатты бөгелген (түзетілмейді)

Бұл — **RDNA 2-класс кремнийі** (GFX1013). Бірқатар жаңарақ тайтлдар **RDNA 2-де жоқ GPU мүмкіндіктерін қатты талап етеді** — негізінен **mesh shaders** мен **аппараттық variable-rate shading (VRS)** — әрі жұмыс істеуден бас тартады. Жетіспейтін кремний — **аппараттық шектеу, драйвер қатесі емес**: ешқандай Mesa жаңартуы, ядро параметрі немесе Proton нұсқасы мүмкіндіктің өзін қоспайды. **Mesh shaders** — нағыз қабырға. **VRS** талабы кейде тек userspace Vulkan қабаты заглушка ете алатын іске қосу кезіндегі тексеру ғана (төмендегі Doom ескертпесін қараңыз) — сондықтан ол әрдайым өлімші емес. Расталған мысалдар ([r/linux_gaming қауымдастық тред](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)):

| Ойын | BC-250-де жетіспейтін қатты талап |
|------|------------------------------------|
| **Final Fantasy VII Rebirth** | **Mesh shaders** — жұмыс істемейді (бұл — жоғарыдағы кестедегі DX12 GPU-сәйкестік тексеруінен сүрінуінің де себебі) |
| **Doom: The Dark Ages — Update 2** | **Vulkan fragment shading rate** (аппараттық VRS) — Update 2 VRS-ті *іске қосуда* міндетті етті; GPU-да ол жоқ, сондықтан өзгертілмеген ойын енді іске қосылмайды (Update 2-ге дейінгі құрастыру 40 CU ашудан кейін 60 FPS-те жүрді, жоғарыда). **Айналып өту бар** — төмендегі ескертпені қараңыз. |

> **Doom: The Dark Ages Update 2 — енді айналып өту бар.** Ойын VRS-ті іске қосуда тек *тексереді*; ол оны геймплей үшін ешқашан шынымен қажет етпейді. **`bangstk/Vulkan_NullVRS`** Vulkan қабаты ([github.com/bangstk/Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS)) `vkCmdSetFragmentShadingRateKHR()`-ды ұстап, оны no-op қылады, осылайша іске қосу тексеруін қанағаттандырады да, ойын ешқандай ойын ішілік қосалқы әсерсіз жүреді. Сондықтан Doom: The Dark Ages — тұрақты қатты бөгет **емес**. **Mesh shaders басқаша** — FF7 Rebirth-тің mesh-shader талабына балама shim жоқ, сондықтан ол шынымен жұмыс істемейді.

> Жап-жаңа AAA тайтлды сатып алмас бұрын, ол mesh shaders немесе аппараттық VRS-ті талап ретінде тізіп тұр ма, тексеріңіз. **Mesh shaders** — мұнда нағыз аппараттық қабырға (айналып өту жоқ). **Аппараттық VRS** талабы көбіне тек іске қосу кезіндегі қақпа — кейде заглушка етуге болады (жоғарыдағы Doom сияқты), кейде жоқ — сондықтан екі жағын да жорамалдамас бұрын қауымдастықтан тексеріңіз.

## Ray tracing — шынымен не сыналған

BC-250-де **нақты RDNA2 аппараттық RT** бар (Mesa 25.2+ болғанда, бағдарламалық эмуляция емес). elektricM бойынша сыналған RT тайтлдары:

| Ойын | Ажыр. | FPS | Ескертпелер |
|------|-----|-----|-------|
| Cyberpunk 2077 | 1080p | 50–60 | Тек RT жарықтандыру, FSR Quality |
| Control | 1080p | 40 | Толық RT |
| Portal 2 RTX | 720p | 40 | Mesa 25.2+-тегі бағдарламалық RT жолы |
| Half-Life 2 RTX | 720p | 20–30 | Өте талапшыл |

RT мұнда бастапқы деңгейлі — жақсы оптимизацияланған ойындарда *тек жарықтандыру* үшін жарайды, толық path-traced жүктемелер үшін емес. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

## Proton және іске қосу опциялары (Linux)

- **Proton нұсқасы:** **Proton GE** (ең жақсы үйлесімділік) немесе **Proton Experimental**-дан бастаңыз; ойынға қарай тұрақты **8.0 / 9.0**-ге қайтыңыз. GE-ні **ProtonUp-Qt** (`protonup-qt`) арқылы орнатыңыз. Кейбір тайтлдар тек белгілі бір нұсқада жұмыс істейді — біреуі сәтсіз болса, сынаңыз. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Білуге тұрарлық Steam іске қосу опциялары:**
  - `mangohud %command%` — FPS/температура қабаты.
  - `RADV_DEBUG=nohiz %command%` — RADV-ды мәжбүрлейді / кейбір ақаулықтарды түзетеді.
  - `gamemoderun %command%` — сессияға CPU governor-ын performance-қа қояды (осы CPU-мен шектелген тақтаға көмектеседі).
  - Біріктірілген: `RADV_DEBUG=nohiz mangohud gamemoderun %command%`.
- **Ойынға VRAM (UMA бөлінісі):** киберспорт/инди **512 MB**-та жақсы; **көп ойын 4 GB қалайды**; AAA/RT-ге қосымша-VRAM ядро параметрлері де керек (`amdgpu.gttsize=...`, [06-linux.md](06-linux.md) / [08-bios.md](08-bios.md) қараңыз). Тым кіші бөлініс артефакт, крэш немесе бағдарламалық рендерге түсуді тудырады. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Бірінші прогондағы қату** — әдетте **шейдер компиляциясы** — FPS-ке баға бермес бұрын Steam-нің алдын ала компиляциялауын аяқтауын күтіңіз; үлкенірек шейдер кэші көмектеседі. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Ойынға арналған түзетулер** (қауымдастық хабарлаған, r/BC250Gaming — дәл осы қателерге тап болсаңыз сынаңыз):
  - **Resident Evil Requiem — бұзылған/ақаулы шаш:** іске қосу опцияларына `RADV_DEBUG=nohiz %command%` қосыңыз (жоғарыда тізілген сол RADV жалаушасы, мұнда нақты қолданылды). ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/))
  - **Spider-Man 2 / Assassin's Creed Shadows — қатулар:** **zswap** (қысылған своп) қосу қатуларды тоқтатады деп хабарланады. ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/))

---

## Эмуляция

Эмуляторлар CPU-ға ауыр, сондықтан нәтижелер аралас, бірақ бірнешеуі мықты ([src](https://t.me/c/2424231195/78988)):

- **Switch — Eden / Ryujinx:** жақсы әрі жылдам жұмыс істейді. Қауымдастық хабарлаған (r/BC250Gaming): **Mario Kart ~60 FPS**; **Tears of the Kingdom ~30–40 FPS**. ✅ ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/))
- **PS4 — shadPS4 (0.9.0+):** Bloodborne түсуссіз жақсы жүреді; кейбір тайтлдар (The Last Guardian) артефакт береді, бірақ тұрақты FPS ұстайды. ✅
- **PS3 — RPCS3:** жұмыс істейді, бірақ ойынға қарай баптауды қажет етеді. ⚠️ **Белгілі ерекшелік** (қауымдастық хабарлаған, r/BC250Gaming): эмулятор қатесі RPCS3 кезінде **GPU-ды 1000 MHz-те бекітеді**, сондықтан GPU жоғары жиілікке шыға алмайды — айналып өту жолы — жоғалған GPU қорын өтеу үшін **CPU-ды оверклок жасау**. ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/))
- **Xbox 360 — Xenia Canary:** мәзірлер жүктеледі, геймплей қара экранға түседі (әлі зерттелуде). ❌

---

## Оның жұмыс істеп тұрғанын қайдан көруге болады (видео)

Қауымдастық көп геймплей/бенчмарк видеосын жариялайды. Бірнеше тред ішілік түсірілім мен арналар:

- BC-250 геймплей/бенчмарк клиптері: [youtu.be/CYDv1SfD2Pc](https://youtu.be/CYDv1SfD2Pc) · [youtu.be/g3uWOfqcexA](https://youtu.be/g3uWOfqcexA) · [youtu.be/9fozmRrAouc](https://youtu.be/9fozmRrAouc) · [youtu.be/q64M2XzADjA](https://youtu.be/q64M2XzADjA) · [youtu.be/0LEkOG1yqqw](https://youtu.be/0LEkOG1yqqw)
- Сыналған ойындардың қауымдастық қадағалау кестесі (FPS/баптаулар): [Google Sheet](https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing)

---

## Шынайы күтулер шпаргалкасы

| Сіз қалайсыз… | 2000 MHz, модталған BC-250-дегі шындық |
|-----------|--------------------------------------|
| 1080p AAA, 60 FPS | Кейде — CPU жүктемесіне байланысты. FSR + Frame Gen көмектеседі. Ескілеу/жеңілдеу AAA: иә. |
| 1440p AAA | Көп портта 40–60 FPS; мұнда GPU-да қор бар. Ең тиімді ажыратымдылық. |
| 4K AAA | Жақсы оптимизацияланған/консоль порттарында FSR-мен 30–50 FPS (Forza, Witcher 3, KCD2). |
| Ray tracing | Тек минимумда, төмен FPS (Cyberpunk ~36 @ 1440p RT-min). Тақтаның күшті жағы емес. |
| Барлық жерде бекітілген 60 | Жоқ. CPU-мен шектелген әрі физикаға ауыр тайтлдар баптауларға қарамастан түсіп/қатады. |
| Бірінші тараптық PS порттары | Ең тиімді тұс — бұл тақта дәл осыны ең жақсы істейді. |

---

## Көздер

- CPU-мен шектелген бенчмарк (38 FPS, 36.5 % GPU) — https://t.me/c/2424231195/136242
- Үлкен VRAM/жиілік бенчмарк кестесі (Wukong, Tomb Raider, Dying Light 2, Cyberpunk, Guardians) — https://t.me/c/2424231195/81203
- Wukong 1080p High FSR+FG, орт. 96 — https://t.me/c/2424231195/10069
- Indiana Jones Great Circle, көп ажыратымдылық — https://t.me/c/2424231195/36931
- Forza Horizon 5 4K — https://t.me/c/2424231195/81891 · Witcher 3 4K — https://t.me/c/2424231195/81894 · KCD2 4K — https://t.me/c/2424231195/81893
- 40 CU ашу нәтижелері (Doom Dark Ages 60 FPS) — https://t.me/c/2424231195/141193 · Doom түзетуі — https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/
- TLOU II 1080p — https://t.me/c/2424231195/94237 · Resident Evil Requiem — https://t.me/c/2424231195/121772 · Gothic Remake қату — https://t.me/c/2424231195/142708
- Бірінші тараптық порттар тізімі — https://t.me/c/2424231195/99563
- Эмуляция шолуы — https://t.me/c/2424231195/78988
- RX 6600 dGPU салыстыру прогоны — https://t.me/c/2424231195/116494
- elektricM ойын үйлесімділігі (ойынға баптаулар/FPS, проблемалы ойындар, RT кестесі, Proton және іске қосу опциялары, FSR көтерілімдері) — https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/
- YouTube FPS түсірілімдері (авто-субтитр / ASR — цифрлар жуықталған): ETA Prime (Spider-Man 2, Forza H5, Left 4 Dead 2) — https://youtu.be/q_CxcbS5HI8 · «Temps Shocked Me» (Helldivers 2, Arc Raiders) — https://youtu.be/d7Hwqxn9yg8 · RU review (Stalker 2, Metro Exodus) — https://youtu.be/19l03qneKJ4 · Pixels & Power (Palworld, RDR2, Elden Ring 30 FPS) — https://youtu.be/4S0DvIpqm0E
- Mesh-shader / аппараттық-VRS қатты бөгеттер (FF7 Rebirth, Doom: The Dark Ages Update 2) — [r/linux_gaming тред](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- **Doom: The Dark Ages VRS айналып өту — `bangstk/Vulkan_NullVRS`** (`vkCmdSetFragmentShadingRateKHR` үшін no-op Vulkan қабаты) — https://github.com/bangstk/Vulkan_NullVRS
- **Linux-тағы LSFG кадр генерациясы — `lsfg-vk`** (Vulkan қабаты) — https://github.com/PancakeTAS/lsfg-vk
- **RDNA2-де DP4a (INT8) арқылы FSR 4 / XeSS** — OptiScaler FSR4 INT8 құрастыруы: [VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/) · [OptiScaler FSR4 compat wiki](https://github.com/optiscaler/OptiScaler/wiki/FSR4-Compatibility-List)
- **RDNA2 (~2027 басы) / RDNA3 (2026 шілде) үшін ресми AMD FSR 4** — [Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals)
- **Қауымдастық хабарлаған ойын нәтижелері (r/BC250Gaming)** — Tekken 8, Street Fighter 6, Stellar Blade, RE Requiem Frame-Gen, Doom Eternal RT, Switch (Mario Kart / TOTK), RPCS3 1000 MHz GPU құлпы, RE Requiem шашы / Spider-Man 2 / AC Shadows түзетулері — https://www.reddit.com/r/BC250Gaming/
- Қауымдастық ойын-тест кестесі — https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing

> Жиіліктер мен 40 CU ашу [09-overclock-undervolt.md](09-overclock-undervolt.md) ішінде; 2000 MHz жүргізбес бұрын [04-cooling.md](04-cooling.md) модын жасаңыз.
