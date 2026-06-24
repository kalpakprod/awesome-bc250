> 🌐 Коомчулук котормосу. Англис тилиндеги нуска — чындыктын булагы жана жаңыраак болушу мүмкүн. Ката таптыңызбы? Issue ачыңыз: [English](../en/11-gaming.md) · [issues](https://github.com/lildebil0/awesome-bc250/issues)

# Оюндагы натыйжалар жана жөндөөлөр

> **Кыскача** — BC-250 деген **кесилген 6 ядролуу Zen2-ге ширетилген PS5-классындагы GPU**. GPU чындап мүмкүнчүлүктүү: реалдуу **2000 MHz** overclock-та ал заманбап AAA оюндарын **40–60 FPS** менен тартат, ал эми жеңилирээк/эскирээк оюндарды 60-тан алда канча жогору. Кыйынчылыгы — **CPU**. APU-нун Zen2 жарымы GPU-га караганда алда канча көп жолу тоскоол болот — коомчулуктун бенчмарктары картанын **CPU тарабынан чектелип, ~36–47 % GPU жүгүндө туруп, ~38 FPS-ке кадалып** турганын кайра-кайра көрсөтөт. Демек: **адегенде overclock жаса** (заводдук ~1500 MHz ~30 % жайыраак), **FSR**-ге жана кадр генерациясына таян, **1080p–1440p**-ке багытта, жана физикага оор же начар жиптелген оюндар чечилишке карабай тоголоп калаарын кабыл ал. Консоль стилиндеги first-party порттор (God of War, Horizon, Last of Us, Spider-Man) — эң жакшы орду.

Бул бөлүм күтүүлөрдү аныктап, коомчулуктун чыныгы, жарыяланган натыйжаларын чогултат — алардын көбү бенчмарк скриншоттору. Сандар тактанын жыштыгына, дистрибутивине, драйверине жана VRAM бөлүштүрүлүшүнө жараша өзгөрөт, ошондуктан ар бир сап өзүнүн булагына байланган.

---

## Адегенде түшүнө турган бир нерсе: ал CPU менен чектелген

BC-250-дин GPU-су — PS5-тен келип чыккан RDNA2 бөлүгү (RADV аны `GFX1013` / NAVI10-классы катары билдирет). Ал көпчүлүк оюндарда *алсыз* шакек эмес. Алсыз шакек — ~3.5 GHz-те иштеген, PS5 стилиндеги кесилген кеш менен жана артык SMT эркиндиги жок **6 ядролуу Zen2 CPU**.

Коомчулуктун **1080p, High, GPU @ 2000 MHz / mem @ 3600 MHz** бенчмарки муну айкын кылат: прогон **"achieved 38 FPS"**, **GPU Limited Percentage болгону 36.5 %** — CPU симуляция жиби тоскоол болду (этап боюнча өлчөгүчтө CPU sim ~70 / CPU render ~43 / GPU ~47). GPU өз кубатынын үчтөн биринде бош турган, ал эми CPU кадр ылдамдыгын төмөн кармаган. ([src](https://t.me/c/2424231195/136242))

Практикалык кесепеттери:

- **Чечилиш көбүнчө "акысыз".** Сиз CPU менен чектелгениңиз үчүн, 1080p-ден 1440p-ке (же атүгүл FSR менен 4K-ке) өтүү көбүнчө аз FPS алат — GPU-нун кандай болсо да артык эркиндиги бар эле. Төмөндөгү бир нече 4K натыйжалар так ушул себептен өздөрүнүн 1080p версияларындай эле дээрлик жакшы көрүнөт.
- **Масштабдоо (upscaling) кадимки ПК-га караганда азыраак жардам берет.** FSR GPU-нун жүгүн жеңилдетет, бирок чектегич CPU болсо, рендер чечилишин түшүрүү FPS-ти анча көтөрбөйт. FSR-ди сүрөт сапаты / температура үчүн колдон, сыйкырдуу FPS баскычы катары эмес.
- **Начар жиптелген же физикага оор оюндар сизди жазалайт.** Тоголоо жана кадр-убакыт чокулары (Gothic Remake, оңдоого чейинки Doom: The Dark Ages) GPU-дан эмес, CPU-дан келип чыгат.
- **GPU-ну баары бир overclock жаса** — оюн *чындап* GPU менен чектелгенде (4K, оор ray tracing, жакшы жиптелген кыймылдаткычтар), 1500 → 2000 MHz болжол менен +30 % FPS берет. Ага кантип жетүүнү [09-overclock-undervolt.md](../en/09-overclock-undervolt.md) кара, жана адегенде [04-cooling.md](../en/04-cooling.md), анткени 2000 MHz үчүн муздатуу моду керек.

---

## Чындап натыйжа берген жөндөөлөр

- **Жыштыктар.** Заводдук GPU ~1500 MHz — жай демейки маани; коомчулук күн сайын **GPU 2000 MHz, mem ~1900–2000 MHz** максатын колдонот, ал эми кээ бирлери **dGPU-классындагы куроодо 2.65 GHz ядро** чейин жетет. Заводдук vs. 2000 MHz GPU менен чектелген сахналарда болжол менен **+30 % FPS**. ([overclock guide](../en/09-overclock-undervolt.md))
- **40 CU ачуу.** Такта CU-лар өчүрүлгөн бойдон келет. Бардык **40 CU**-ну ачуу өлчөнө турган, кеңири жакшырууну берет — бир колдонуучу Doom: The Dark Ages бузуктан **60 FPS High**-ка өткөнүн, бир "007" оюну **60 FPS High**-та иштегенин жана ачылгандан кийин Great Pragmata-да кадр-убакыттар туруктуураак болгонун билдирди. ([src](https://t.me/c/2424231195/141193)) [09-overclock-undervolt.md](../en/09-overclock-undervolt.md) кара.
- **FSR / FSR 4.** GPU-ну жүктөп, температураны төмөн кармоо үчүн 1440p/4K-те Quality же Balanced колдон. Коомчулук **FSR 4**-тү активдүү порттоп жатат (DLL пакеттери темада бөлүшүлгөн). ([FSR4 INT8 discussion src](https://t.me/c/2424231195/136354)) elektricM өлчөгөн FSR пайдалары: **Quality +20–30 %, Balanced +30–40 %, Performance +40–60 %** FPS; **Frame Generation болжол менен эки эсе** кадр ылдамдыгын берет (анча-мынча кечигүү менен). **Optiscaler аркылуу FSR 4** — коомчулук **Balanced жергиликтүү FSR 3.1.5 Quality-ден ашат** деп тапты. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
  - **Чындап кайсы upscaler колдонуу керек:** бул жерде **FSR 1–3 — практикалык тандоо** — ал жетилген, арзан жана жакшы колдоого алынган. **FSR 4 жана XeSS техникалык жактан** бул RDNA2 кремнийинде **DP4a (INT8) жолу** аркылуу *иштей алат* — RDNA2-де dp4a/Rapid Packed Math бар, ошондуктан OptiScaler-дин FSR 4 INT8 куроосу жана GPU-дан көз карандысыз XeSS-DP4a варианты экөө тең жүктөлөт — бирок мынчалык алсыз GPU-да алар **жай жана эксперименталдык**: DP4a резерв жолу жаңыраак карталар колдонгон WMMA жолуна караганда ~10–20 % оорураак, ал эми XeSS-DP4a сүрөт сапаты XMX версиясынан төмөн. FSR 4 / XeSS-ти күн сайынкы курал эмес, эксперимент кылуучу нерсе катары кара. ([OptiScaler FSR4 INT8 on RDNA2 — VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/)) **RDNA2 (RX 6000-классы) үчүн расмий AMD FSR 4 ~2027-нын башында** чыгат; ага чейин бул OptiScaler/моддолгон жол. ([Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals))
- **FSR-ден тышкары кадр генерациясы — LSFG.** **Lossless Scaling Frame-Generation (LSFG)** Linux-та **`lsfg-vk`** Vulkan катмары аркылуу иштейт ([github.com/PancakeTAS/lsfg-vk](https://github.com/PancakeTAS/lsfg-vk)) — ар кандай Vulkan оюнуна илинген оюндан көз карандысыз кадр-ген катмары. Коомчулук аны курулган кадр генерациясы жок оюндарда **FPS-ти болжол менен эки эселөө** үчүн колдонот (мисалы, 30 → 60). Бардык кадр-ген сыяктуу эле ал кечигүүнү кошот жана интерполяциялоо үчүн орундуу реалдуу кадр ылдамдыгын талап кылат, бирок FSR-дин өз FG-си жок болгондо бул чыныгы вариант.
- **VRAM бөлүштүрүү (UMA).** Бул бирдиктүү 16 GB бассейн. Бир кылдат сыноодо (1440p, 1850 MHz) GDDR6 бөлүштүрүү (512 MB vs 8 GB резервделген) **орточо FPS-ти араң өзгөрттү** — бирок өтө кичине же туура эмес UMA жөндөөсү сизди программалык рендерге (`llvmpipe`) түшүрүп же бенчмаркты туруп калтыра алат. Авто / орундуу резерв жетиштүү; ашыкча ойлонбо. ([src](https://t.me/c/2424231195/81203))
- Бенчмарк үчүн **VSync өчүк**; сунулса **кадр генерациясы күйүк** (ал Wukong-дун үч орундуу орточого жетишине жардам берди, төмөндө кара).
- **`mitigations=off`** (ядронун жүктөө желеги) — кеңири таралган твик; VRAM сыноосунда анын FPS-ке таасири анча-мынча, ызы-чуулуу гана болду. Аны кичинекей катары кара. ⚠ **текшер (өлчөмү талаштуу)** — elektricM алда канча чоң пайданы билдирет (**Cyberpunk-та +18 FPS, кеңештеринде "+10–15 %"**). Бул ачык эле оюнга жараша: кээ бир CPU менен чектелген оюндарда чоң, башкаларында болор-болбос. Аны сынап, өлчө; эки сандын бирин тең болжолдобо. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

---

## Адамдар чындап жарыялаган натыйжалар

Булар коомчулук билдирген, өз жөндөөлөрү жана булагы менен сандар. **Бенчмарк упайлары жана FPS — жарыялангандай**; саптардын ортосунда жыштыктар/дистрибутив/драйвер айырмаланат, ошондуктан контекст тилкесин окугула, сокур салыштырбагыла.

| Оюн | Жөндөөлөр (чечилиш / пресет / upscaling) | Натыйжа | HW / жыштыктар | Булак |
|------|--------------------------------------|--------|-------------|--------|
| **Black Myth: Wukong** (bench) | 1080p, High, FSR + Frame Gen күйүк | **орт. 96** (мин 78, макс 113) | BC-250, Windows, RADV NAVI10 | ([src](https://t.me/c/2424231195/10069)) |
| **Black Myth: Wukong** (bench) | 1440p, Medium, FSR жок | **орт. ~48** (макс 56) | BC-250, 1850 MHz, Linux | ([src](https://t.me/c/2424231195/81203)) |
| **Shadow of the Tomb Raider** (bench) | 1440p, Max | **орт. ~70** | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Marvel's Guardians of the Galaxy** (bench) | 1440p, High | **орт. ~70** (89 макс, мин ~3-кө чейин түшөт) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Dying Light 2** (bench) | 1440p, High, VSync жок | **орт. ~48** (макс 62) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Cyberpunk 2077** (bench) | 1440p, Ray Tracing **min** | **орт. ~36** (мин 30) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Indiana Jones and the Great Circle** | 1440p, low, upscaler жок | **45** | BC-250, GPU ~1900 MHz, Vulkan | ([src](https://t.me/c/2424231195/36931)) |
| **Indiana Jones and the Great Circle** | 1440p, medium, upscaler күйүк | **60** | BC-250 | ([src](https://t.me/c/2424231195/36931)) |
| **Forza Horizon 5** | **4K**, High пресет, **FSR жок** | ойноого жарактуу (видео) | BC-250 | ([src](https://t.me/c/2424231195/81891)) |
| **The Witcher 3** | 4K, Medium, FSR Balanced | **~50** | BC-250 | ([src](https://t.me/c/2424231195/81894)) |
| **Kingdom Come: Deliverance II** | 4K, Med/High, FSR Quality | **~30** ("PS5 тажрыйбасы") | BC-250 | ([src](https://t.me/c/2424231195/81893)) |
| **The Last of Us Part II** | 1080p, демейки пресет | ойноого жарактуу (видео) | BC-250 | ([src](https://t.me/c/2424231195/94237)) |
| **Doom: The Dark Ages** | High | **60** (40 CU ачуу + оңдоодон кийин) | BC-250, 40 CU | ([src](https://t.me/c/2424231195/141193)) · [Reddit fix](https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/) · [Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS) |
| **Doom Eternal** | RT күйүк (коомчулук билдирген) | **60 + RT** | BC-250; коомчулук билдирген (r/BC250Gaming) | ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/)) |
| **Tekken 8** | (коомчулук билдирген) | **~60** | BC-250; коомчулук билдирген (r/BC250Gaming) | ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/)) |
| **Street Fighter 6** | (коомчулук билдирген) | **~60** | BC-250; коомчулук билдирген (r/BC250Gaming) | ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/)) |
| **Stellar Blade** | (коомчулук билдирген) | **~70–80** | BC-250; коомчулук билдирген (r/BC250Gaming) | ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | Frame Generation күйүк (коомчулук билдирген) | **60 → 100** (FG) | BC-250; коомчулук билдирген (r/BC250Gaming) | ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | (видео) | ойноого жарактуу | BC-250, CPU заводдук, **GPU 2000** | ([src](https://t.me/c/2424231195/121772)) |
| **Gothic Remake** | Medium | **тоголойт** — "оптимизация жок" | BC-250 | ([src](https://t.me/c/2424231195/142708)) |
| **Hi-Fi Rush** | (видео, OBS тартуу) | жылмакай | BC-250, `mitigations=off` | ([src](https://t.me/c/2424231195/91022)) |
| **Cyberpunk 2077** | 1080p, High, FSR Quality, **RT жок** | **70–90** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Cyberpunk 2077** (bench) | 1080p (заводдук 2000 MHz / 1000 mV) | **57.66** → **60.82** OC (2230 MHz); `mitigations=off` **+18** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **The Last of Us Part I** | 1080p, Medium-High | **60** (туруктуу) | BC-250 — шейдер компиляциясында 90–100 °C; кээде аудио чыкылдоо | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Devil May Cry 5** | 1080p, High | **100** (эң төмөн кечигүү, ~10 ms) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Detroit: Become Human** | 1080p, Medium | **60** (чектелген) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Control** | 1080p, толук **RT** | **40** | BC-250 — баштапкы деңгээлдеги RT үчүн жакшы | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Company of Heroes 3** | 1080p | ойноого жарактуу — **4 GB VRAM бөлүштүрүү керек** (512 MB артефакттар/кырсыктар) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Red Dead Redemption 2** (bench) | `-useMaximumSettings` желегин колдон | **45+** мин | BC-250 — туура эмес GPU адаптерин аныктап коюшу мүмкүн, аны кол менен орнот | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **CS2** / **Rocket League** / **Elden Ring** | 1080p | **100+** / **120+** / **60** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Helldivers 2** | 1080p, low (билдирилген) | **≈82** | BC-250, заводдук, бир Noctua NF-P12 — GPU 73 °C / CPU 76 °C; ⚠ ASR | ([“Temps Shocked Me”](https://youtu.be/d7Hwqxn9yg8) ~5:08) |
| **Stalker 2** | medium (билдирилген) | **≈80** | BC-250 — автор CPU менен чектелген / 8 GB RAM деп белгилейт; ⚠ ASR | ([RU review](https://youtu.be/19l03qneKJ4) ~0:23) |
| **Stalker 2** | QHD (2560×1600), FSR Quality + Frame Gen, patch 1.21 (билдирилген) | **57–70** (1080p, FG жок **≈45**) | BC-250; ⚠ ASR | ([RU review](https://youtu.be/19l03qneKJ4) ~18:52) |
| **Arc Raiders** | 1080p (билдирилген) | **≈56–80** | BC-250, заводдук; ⚠ ASR | ([Temps Shocked Me](https://youtu.be/d7Hwqxn9yg8) ~5:58) |
| **Spider-Man 2** | 1080p, High, FSR Frame Gen (билдирилген) | **≈100** орт. (жергиликтүү sub-60) | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~11:04) |
| **Forza Horizon 5** | 1080p, Medium, FSR жок (билдирилген) | **70–95** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~12:19) |
| **Metro Exodus** | QHD, High (билдирилген) | **≈58** | BC-250; ⚠ ASR | ([RU review](https://youtu.be/19l03qneKJ4) ~14:12) |
| **Palworld** | 1080p, med-high (билдирилген) | **<60** (ойноого жарактуу) | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:04) |
| **Red Dead Redemption 2** | 1080p, med-high, FSR Quality (билдирилген) | **туруктуу 60** | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:19) |
| **Left 4 Dead 2** | 1080p, max (билдирилген) | **>150** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~10:18) |
| _Шилтеме: дискреттик GPU куроосу_ | RE-engine bench, 1080p, High, RT жок | **орт. 67.99** (мин 58, макс 82) | **RX 6600** + Xeon E5-2667v4, Win10 | ([src](https://t.me/c/2424231195/116494)) |

> RX 6600 сабы — **BC-250 натыйжасы эмес** — бул дал ошол корпус/CPU менен дискреттик карта иштеткен мүчө, салыштыруу чекити катары. *CPU* жалгыз эмнени көтөрө аларын көрсөтүү үчүн киргизилген.

> ⚠️ **Elden Ring — натыйжалар ар түрдүү.** Жогорудагы ~60 FPS (elektricM, 1080p) баары үчүн эмес: бир коомчулук куроосу **High-та кулпуланган 30 FPS-ке чектелип, 720p low-та да 60-ка жете алган жок** (CPU менен чектелген). 60-ту эң жакшы учур катары кара, кепилдик катары эмес. ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:50)

### First-party / консоль порттору — эң жакшы орду

Булар жетиштүү жакшы иштегендиктен, бир мүчө аларды жөн гана "иштейт" деп тизмелеген (PS стилиндеги порттор GPU-га таянат жана жакшы оптимизацияланган, бул тактага туура келет):

> Days Gone · Death Stranding · DIRT 5 · Ghost of Tsushima: Director's Cut · God of War (2018) · God of War: Ragnarök · Horizon Forbidden West · Horizon Zero Dawn · The Last of Us Part I · The Last of Us Part II Remastered · Returnal · Uncharted: Legacy of Thieves

([src](https://t.me/c/2424231195/99563))

---

## Белгилүү көйгөйлүү оюндар (иштебейт / айланып өтүү керек)

elektricM биз камтыбаган, **платформада иштебеген же аны менен күрөшкөн** оюндарды көзөмөлдөйт — сатып алуудан мурун текшер:

| Оюн | Көйгөй | Айланып өтүү |
|------|---------|-----------|
| **Fortnite** | Easy Anti-Cheat **Linux-ту колдобойт** | **Эч кандай — Linux BC-250-де иштей албайт** |
| **Valorant** | Ядро деңгээлиндеги анти-чит | Linux-та техникалык көйгөйлөр; иш жүзүндө жок |
| **Magic: The Gathering Arena** | Атайын **Fedora**-да кырсыктайт/тоголойт | **Manjaro / Bazzite**-те жакшыраак иштейт; башка Proton-ду сынап көр |
| **Final Fantasy VII Rebirth** | "DX12 is not supported on your system" (GPU-шайкештик текшерүүсү) | **Азырынча оңдоо жок** |
| **Black Myth: Wukong** (бузуп ачылган) | "CreateProcess() returned 2" (анти-тампер) | **Өзгөртүлбөгөн оюн файлдарын** колдон |

(Анти-чит абалы убакыт менен өзгөрөт — [areweanticheatyet.com](https://areweanticheatyet.com) жана [protondb.com](https://www.protondb.com) менен кайчылаш текшер.) ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

### Жетишпеген GPU мүмкүнчүлүктөрү менен катуу бөгөттөлгөн (оңдолбойт)

Бул — **RDNA 2-классындагы кремний** (GFX1013). Бир ууч жаңыраак оюндар **RDNA 2-де жок GPU мүмкүнчүлүктөрүн катуу талап кылат** — негизинен **mesh shader-лер** жана **аппараттык variable-rate shading (VRS)** — жана иштөөдөн баш тартат. Жетишпеген кремний — **аппараттык чектөө, драйвердин катасы эмес**: эч бир Mesa жаңылоосу, ядро параметри же Proton версиясы өзү бул мүмкүнчүлүктү кошпойт. **Mesh shader-лер** — чыныгы дубал. **VRS** талабы кээде userspace Vulkan катмары айланып өтө ала турган жүктөө учурундагы текшерүү гана болот (төмөндөгү Doom эскертүүсүн кара) — ошондуктан ал ар дайым өлүм эмес. Ырасталган мисалдар ([r/linux_gaming community thread](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)):

| Оюн | BC-250-де жок катуу талап |
|------|------------------------------------|
| **Final Fantasy VII Rebirth** | **Mesh shader-лер** — иштебейт (ошондой эле бул жогорудагы таблицадагы DX12 GPU-шайкештик текшерүүсүн ишке кошкондун себеби) |
| **Doom: The Dark Ages — Update 2** | **Vulkan fragment shading rate** (аппараттык VRS) — Update 2 VRS-ти *жүктөөдө* милдеттүү кылды; GPU-да ал жок, ошондуктан өзгөртүлбөгөн оюн мындан ары башталбайт (Update 2-ге чейинки куроо 40 CU ачуудан кийин 60 FPS менен иштеген, жогоруда). **Айланып өтүү жолу бар** — төмөндөгү эскертүүнү кара. |

> **Doom: The Dark Ages Update 2 — эми айланып өтүү жолу бар.** Оюн VRS-ти жүктөөдө *текшерет* гана; ал чындыгында оюн процесси үчүн эч качан керек эмес. **`bangstk/Vulkan_NullVRS`** Vulkan катмары ([github.com/bangstk/Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS)) `vkCmdSetFragmentShadingRateKHR()`-ди кармап, аны no-op кылат, ошентип жүктөө текшерүүсүн канааттандырып, оюн ичинде эч кандай терс таасирсиз иштейт. Демек, Doom: The Dark Ages — **туруктуу катуу бөгөт эмес**. **Mesh shader-лер башкача** — FF7 Rebirth-тин mesh-shader талабы үчүн эквиваленттик shim жок, ошондуктан ал чындап иштебейт.

> Жап-жаңы AAA оюнун сатып алуудан мурун, ал mesh shader-лерди же аппараттык VRS-ти талап катары тизмелейби текшер. **Mesh shader-лер** — бул жерде чыныгы аппараттык дубал (айланып өтүү жок). **Аппараттык VRS** талабы көбүнчө жүктөө учурундагы дарбаза гана — кээде shim-делет (жогорудагы Doom сыяктуу), кээде жок — ошондуктан кайсынысы экенин болжолдоодон мурун коомчулукту текшер.

## Ray tracing — чындап эмне сыналган

BC-250-де **чыныгы RDNA2 аппараттык RT** бар (программалык эмуляция эмес, Mesa 25.2+ менен). elektricM боюнча сыналган RT оюндары:

| Оюн | Чечилиш | FPS | Эскертүүлөр |
|------|-----|-----|-------|
| Cyberpunk 2077 | 1080p | 50–60 | RT жарык гана, FSR Quality |
| Control | 1080p | 40 | Толук RT |
| Portal 2 RTX | 720p | 40 | Mesa 25.2+ программалык RT жолу |
| Half-Life 2 RTX | 720p | 20–30 | Абдан талапкер |

Бул жерде RT баштапкы деңгээлде — жакшы оптимизацияланган оюндарда *жарык гана* үчүн жакшы, толук path-traced жүктөр үчүн эмес. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

## Proton жана жүктөө параметрлери (Linux)

- **Proton версиясы:** **Proton GE** (эң мыкты шайкештик) же **Proton Experimental** менен башта; оюнга жараша туруктуу **8.0 / 9.0**-го кайт. GE-ни **ProtonUp-Qt** (`protonup-qt`) аркылуу орнот. Кээ бир оюндар белгилүү бир версияда гана иштейт — бирөө иштебесе сынап көр. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- Билиш керек болгон **Steam жүктөө параметрлери**:
  - `mangohud %command%` — FPS/температура оверлейи.
  - `RADV_DEBUG=nohiz %command%` — RADV-ди мажбурлайт / кээ бир бузуктарды оңдойт.
  - `gamemoderun %command%` — сессия үчүн CPU governor-ду performance-ке коёт (бул CPU менен чектелген тактага жардам берет).
  - Бириктирилген: `RADV_DEBUG=nohiz mangohud gamemoderun %command%`.
- **Оюн боюнча VRAM (UMA бөлүштүрүү):** esports/indie **512 MB**-та жакшы; **көпчүлүк оюндар 4 GB каалайт**; AAA/RT ошондой эле кошумча VRAM ядро параметрлерин каалайт (`amdgpu.gttsize=...`, [06-linux.md](../en/06-linux.md) / [08-bios.md](../en/08-bios.md) кара). Өтө кичине бөлүштүрүү артефакттарды, кырсыктарды же программалык рендерге түшүүнү жаратат. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Биринчи жолу иштеткендеги тоголоо** көбүнчө **шейдер компиляциясы** — FPS-ке баа берүүдөн мурун Steam алдын ала компиляцияны бүтүргөнгө уруксат бер; чоңураак шейдер кеши жардам берет. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Оюн боюнча оңдоолор** (коомчулук билдирген, r/BC250Gaming — дал ушул каталарга туш болсоң сынап көр):
  - **Resident Evil Requiem — бузук/глюктуу чач:** жүктөө параметрлерине `RADV_DEBUG=nohiz %command%` кош (жогоруда тизмеленген ошол эле RADV желеги, бул жерде атайын колдонулду). ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/))
  - **Spider-Man 2 / Assassin's Creed Shadows — туруп калуулар:** **zswap** (кысылган swap) күйгүзүү туруп калууларды токтотот деп билдирилет. ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/))

---

## Эмуляция

Эмуляторлор CPU-га оор, ошондуктан натыйжалар ар түрдүү, бирок бир нечеси туруктуу ([src](https://t.me/c/2424231195/78988)):

- **Switch — Eden / Ryujinx:** жакшы жана тез иштейт. Коомчулук билдирген (r/BC250Gaming): **Mario Kart ~60 FPS**; **Tears of the Kingdom ~30–40 FPS**. ✅ ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/))
- **PS4 — shadPS4 (0.9.0+):** Bloodborne түшүүсүз жакшы иштейт; кээ бир оюндар (The Last Guardian) артефакт берет, бирок туруктуу FPS кармайт. ✅
- **PS3 — RPCS3:** иштейт, бирок оюн боюнча тууралоо керек. ⚠️ **Белгилүү өзгөчөлүк** (коомчулук билдирген, r/BC250Gaming): эмулятордун катасы RPCS3 астында **GPU-ну 1000 MHz-те кулпулайт**, ошондуктан GPU жыштыкты көтөрө албайт — айланып өтүү жолу — **жоголгон GPU эркиндигин компенсациялоо үчүн CPU-ну overclock жасоо**. ([Reddit synthesis](https://www.reddit.com/r/BC250Gaming/))
- **Xbox 360 — Xenia Canary:** менюлар жүктөлөт, оюн процесси кара экранга түшөт (дагы эле изилденүүдө). ❌

---

## Иштеп жатканын кайдан көрүү (видео)

Коомчулук көп оюн/бенчмарк видеосун жарыялайт. Темадагы бир нече тартуу жана каналдар:

- BC-250 оюн/бенчмарк клиптери: [youtu.be/CYDv1SfD2Pc](https://youtu.be/CYDv1SfD2Pc) · [youtu.be/g3uWOfqcexA](https://youtu.be/g3uWOfqcexA) · [youtu.be/9fozmRrAouc](https://youtu.be/9fozmRrAouc) · [youtu.be/q64M2XzADjA](https://youtu.be/q64M2XzADjA) · [youtu.be/0LEkOG1yqqw](https://youtu.be/0LEkOG1yqqw)
- Сыналган оюндардын коомчулук көзөмөл барагы (FPS/жөндөөлөр): [Google Sheet](https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing)

---

## Реалдуу күтүүлөр баракчасы

| Сиз каалайсыз… | 2000 MHz, моддолгон BC-250-деги чындык |
|-----------|--------------------------------------|
| 1080p AAA, 60 FPS | Кээде — CPU жүгүнө жараша. FSR + Frame Gen жардам берет. Эскирээк/жеңилирээк AAA: ооба. |
| 1440p AAA | Көпчүлүк портто 40–60 FPS; GPU-нун бул жерде эркиндиги бар. Эң жакшы баалуу чечилиш. |
| 4K AAA | Жакшы оптимизацияланган/консоль портто FSR менен 30–50 FPS (Forza, Witcher 3, KCD2). |
| Ray tracing | Минимумда гана, төмөн FPS (Cyberpunk ~36 @ 1440p RT-min). Тактанын күчтүү жагы эмес. |
| Бардык жерде кулпуланган 60 | Жок. CPU менен чектелген жана физикага оор оюндар жөндөөгө карабай түшөт/тоголойт. |
| First-party PS порттору | Эң жакшы орду — такта эң жакшы кылган нерсе ушул. |

---

## Булактар

- CPU менен чектелген бенчмарк (38 FPS, 36.5 % GPU) — https://t.me/c/2424231195/136242
- Чоң VRAM/жыштык бенчмарк таблицасы (Wukong, Tomb Raider, Dying Light 2, Cyberpunk, Guardians) — https://t.me/c/2424231195/81203
- Wukong 1080p High FSR+FG, орт. 96 — https://t.me/c/2424231195/10069
- Indiana Jones Great Circle, көп чечилиш — https://t.me/c/2424231195/36931
- Forza Horizon 5 4K — https://t.me/c/2424231195/81891 · Witcher 3 4K — https://t.me/c/2424231195/81894 · KCD2 4K — https://t.me/c/2424231195/81893
- 40 CU ачуу натыйжалары (Doom Dark Ages 60 FPS) — https://t.me/c/2424231195/141193 · Doom оңдоо — https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/
- TLOU II 1080p — https://t.me/c/2424231195/94237 · Resident Evil Requiem — https://t.me/c/2424231195/121772 · Gothic Remake тоголоо — https://t.me/c/2424231195/142708
- First-party порттор тизмеси — https://t.me/c/2424231195/99563
- Эмуляция жыйындысы — https://t.me/c/2424231195/78988
- RX 6600 dGPU салыштыруу прогону — https://t.me/c/2424231195/116494
- elektricM оюн шайкештиги (оюн боюнча жөндөөлөр/FPS, көйгөйлүү оюндар, RT таблицасы, Proton жана жүктөө параметрлери, FSR пайдалары) — https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/
- YouTube FPS тартуулары (авто-субтитр / ASR — сандар болжолдуу): ETA Prime (Spider-Man 2, Forza H5, Left 4 Dead 2) — https://youtu.be/q_CxcbS5HI8 · "Temps Shocked Me" (Helldivers 2, Arc Raiders) — https://youtu.be/d7Hwqxn9yg8 · RU review (Stalker 2, Metro Exodus) — https://youtu.be/19l03qneKJ4 · Pixels & Power (Palworld, RDR2, Elden Ring 30 FPS) — https://youtu.be/4S0DvIpqm0E
- Mesh-shader / аппараттык-VRS катуу бөгөттөр (FF7 Rebirth, Doom: The Dark Ages Update 2) — [r/linux_gaming thread](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- **Doom: The Dark Ages VRS айланып өтүү — `bangstk/Vulkan_NullVRS`** (`vkCmdSetFragmentShadingRateKHR` үчүн no-op Vulkan катмары) — https://github.com/bangstk/Vulkan_NullVRS
- **Linux-та LSFG кадр генерациясы — `lsfg-vk`** (Vulkan катмары) — https://github.com/PancakeTAS/lsfg-vk
- **RDNA2-де DP4a (INT8) аркылуу FSR 4 / XeSS** — OptiScaler FSR4 INT8 куроосу: [VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/) · [OptiScaler FSR4 compat wiki](https://github.com/optiscaler/OptiScaler/wiki/FSR4-Compatibility-List)
- **RDNA2 (~2027-нын башы) / RDNA3 (2026-жыл июль) үчүн расмий AMD FSR 4** — [Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals)
- **Коомчулук билдирген оюн натыйжалары (r/BC250Gaming)** — Tekken 8, Street Fighter 6, Stellar Blade, RE Requiem Frame-Gen, Doom Eternal RT, Switch (Mario Kart / TOTK), RPCS3 1000 MHz GPU кулпусу, RE Requiem чач / Spider-Man 2 / AC Shadows оңдоолору — https://www.reddit.com/r/BC250Gaming/
- Коомчулук оюн-сыноо электрондук таблицасы — https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing

> Жыштыктар жана 40 CU ачуу [09-overclock-undervolt.md](../en/09-overclock-undervolt.md)-те жайгашкан; 2000 MHz-те иштетүүдөн мурун [04-cooling.md](../en/04-cooling.md) модун жаса.
