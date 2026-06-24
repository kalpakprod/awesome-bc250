> 🌐 Topluluk çevirisi. İngilizce sürüm asıl kaynaktır ve daha güncel olabilir. Hata mı buldunuz? Bir [issue açın](https://github.com/lildebil0/awesome-bc250/issues). ([İngilizce orijinali](../en/11-gaming.md))

# Oyun Sonuçları ve Ayarları

> **Özet** — BC-250, **kırpılmış 6 çekirdekli bir Zen2'ye cıvatalanmış PS5 sınıfı bir GPU**'dur. GPU gerçekten yeteneklidir: gerçek dünyada **2000 MHz** overclock ile modern AAA oyunlarını **40–60 FPS**'te, daha hafif/eski oyunları ise 60'ın çok ötesinde çalıştırır. Püf noktası **CPU**'dur. APU'nun Zen2 yarısı, GPU'dan çok daha sık darboğazdır — topluluk benchmark'ları kartın tekrar tekrar **~%36–47 GPU yükünde otururken ~38 FPS'e sabitlendiğini**, yani CPU-sınırlı olduğunu gösterir. Yani: **önce overclock yapın** (stok ~1500 MHz yaklaşık %30 daha yavaştır), **FSR**'ye ve frame generation'a yaslanın, **1080p–1440p** hedefleyin ve fizik-yoğun ya da kötü thread'lenmiş oyunların çözünürlük ne olursa olsun takılacağını kabul edin. Konsol tarzı first-party port'lar (God of War, Horizon, Last of Us, Spider-Man) en tatlı noktadır.

Bu bölüm beklentileri belirler ve topluluğun gerçek, yayınlanmış sonuçlarını toplar — çoğu benchmark ekran görüntüsüdür. Sayılar saat hızı, dağıtım, sürücü ve VRAM bölüşümüne göre değişir, bu yüzden her satır kendi kaynağına bağlıdır.

---

## Önce anlamanız gereken tek şey: CPU-sınırlıdır

BC-250'nin GPU'su PS5 türevi bir RDNA2 parçasıdır (RADV onu `GFX1013` / NAVI10 sınıfı olarak bildirir). Çoğu oyunda zayıf halka *o değildir*. Zayıf halka, ~3.5 GHz'de çalışan, PS5 tarzı kırpılmış cache'li ve harcayacak SMT alanı olmayan **6 çekirdekli Zen2 CPU**'dur.

**1080p, High, GPU @ 2000 MHz / mem @ 3600 MHz**'de bir topluluk benchmark'ı bunu somutlaştırır: koşu **"38 FPS elde etti"** ve **GPU Limited Percentage yalnızca %36.5**'ti — CPU simülasyon thread'i geçit görevi gördü (aşama başına ölçerde CPU sim ~70 / CPU render ~43 / GPU ~47). GPU, CPU frame hızını aşağıda tutarken kapasitesinin üçte birinde boşta bekliyordu. ([src](https://t.me/c/2424231195/136242))

Pratik sonuçlar:

- **Çözünürlük çoğu zaman "bedava"dır.** CPU-sınırlı olduğunuz için 1080p'den 1440p'ye (hatta FSR ile 4K'ya) geçmek sık sık az FPS'e mal olur — GPU zaten boşta alana sahipti. Aşağıdaki birkaç 4K sonucu, tam olarak bu nedenle 1080p muadilleri kadar iyi görünür.
- **Upscaling, normal bir PC'dekinden daha az yardım eder.** FSR, GPU'yu rahatlatır, ama sınırlayıcı CPU ise render çözünürlüğünü düşürmek FPS'inizi pek yükseltmez. FSR'yi sihirli bir FPS düğmesi olarak değil, görüntü kalitesi / termaller için kullanın.
- **Kötü thread'lenmiş ya da fizik-yoğun oyunlar sizi cezalandırır.** Takılma ve frame-time sıçramaları (Gothic Remake, düzeltmelerden önce Doom: The Dark Ages) GPU'dan değil, CPU'dan gelir.
- **GPU'yu yine de overclock edin** — bir oyun *gerçekten* GPU-sınırlı olduğunda (4K, ağır ray tracing, iyi thread'lenmiş motorlar), 1500 → 2000 MHz yaklaşık +%30 FPS demektir. Oraya nasıl gidileceği için [09-overclock-undervolt.md](09-overclock-undervolt.md)'ye, ve önce [04-cooling.md](04-cooling.md)'ye bakın, çünkü 2000 MHz soğutma modunu gerektirir.

---

## İğneyi gerçekten oynatan ayarlar

- **Saat hızları.** Stok GPU ~1500 MHz yavaş varsayılandır; topluluk günlük hedef olarak **GPU 2000 MHz, mem ~1900–2000 MHz** çalıştırır, bazıları **dGPU sınıfı bir kurulumda 2.65 GHz çekirdek** zorlar. Stok ile 2000 MHz arası, GPU-sınırlı sahnelerde kabaca **+%30 FPS**'tir. ([overclock kılavuzu](09-overclock-undervolt.md))
- **40 CU kilidi açma.** Kart, CU'lar devre dışı olarak gelir. Tüm **40 CU**'yu açmak ölçülebilir, geniş bir kazanç verir — bir kullanıcı kilidi açtıktan sonra Doom: The Dark Ages'ın bozuktan **60 FPS High**'a geçtiğini, bir "007" oyununun **60 FPS High**'ta çalıştığını ve Great Pragmata'da daha kararlı frame-time'lar bildirdi. ([src](https://t.me/c/2424231195/141193)) Bkz. [09-overclock-undervolt.md](09-overclock-undervolt.md).
- **FSR / FSR 4.** GPU'yu beslemek ve sıcaklıkları düşürmek için 1440p/4K'da Quality ya da Balanced kullanın. Topluluk aktif olarak **FSR 4**'ü port'luyor (DLL paketleri thread içinde paylaşılıyor). ([FSR4 INT8 tartışma src](https://t.me/c/2424231195/136354)) elektricM'in ölçtüğü FSR kazanımları: **Quality +%20–30, Balanced +%30–40, Performance +%40–60** FPS; **Frame Generation frame hızını kabaca iki katına çıkarabilir** (hafif gecikme). **Optiscaler üzerinden FSR 4** — topluluk **Balanced'ın native FSR 3.1.5 Quality'yi yendiğini** buluyor. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
  - **Gerçekten hangi upscaler'ı kullanmalı:** Burada **FSR 1–3 pratik tercihtir** — olgun, ucuz ve iyi desteklenir. **FSR 4 ve XeSS** teknik olarak bu RDNA2 silikonunda **DP4a (INT8) yolu** üzerinden *çalışabilir* — RDNA2'de dp4a/Rapid Packed Math vardır, dolayısıyla OptiScaler'ın FSR 4 INT8 derlemesi ve GPU'dan bağımsız XeSS-DP4a varyantının ikisi de yüklenir — ama bu kadar zayıf bir GPU'da **yavaş ve deneyseldir**: DP4a fallback'i, daha yeni kartların kullandığı WMMA yolundan ~%10–20 daha ağırdır ve XeSS-DP4a'da görüntü kalitesi XMX sürümünün altındadır. FSR 4 / XeSS'i günlük sürücünüz olarak değil, denenecek bir şey olarak görün. ([RDNA2'de OptiScaler FSR4 INT8 — VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/)) **RDNA2 için resmi AMD FSR 4 (RX 6000 sınıfı) ~2027 başında** gelir; o zamana kadar OptiScaler/modlu yol geçerlidir. ([Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals))
- **FSR'nin ötesinde frame generation — LSFG.** **Lossless Scaling Frame-Generation (LSFG)**, Linux'ta **`lsfg-vk`** Vulkan katmanı üzerinden çalışır ([github.com/PancakeTAS/lsfg-vk](https://github.com/PancakeTAS/lsfg-vk)) — herhangi bir Vulkan oyununa kancalanan, oyundan bağımsız bir frame-gen katmanı. Topluluk bunu, dahili frame generation'ı olmayan oyunlarda **FPS'i kabaca iki katına çıkarmak** için kullanır (ör. 30 → 60). Tüm frame-gen'ler gibi gecikme ekler ve interpolasyon yapacak makul bir gerçek frame hızı ister, ama FSR'nin kendi FG'si yokken gerçek bir seçenektir.
- **VRAM bölüşümü (UMA).** Birleşik 16 GB havuzdur. Dikkatli bir taramada (1440p, 1850 MHz), GDDR6 bölüşümü (512 MB ile 8 GB ayrılmış) **ortalama FPS'i neredeyse hiç değiştirmedi** — ama çok küçük ya da yanlış bir UMA ayarı sizi yazılım render'ına (`llvmpipe`) düşürebilir ya da bir benchmark'ı kilitleyebilir. Auto / makul bir rezerv yeterlidir; fazla düşünmeyin. ([src](https://t.me/c/2424231195/81203))
- **Benchmark için VSync off**; sunulduğunda **frame generation on** (Wukong'un üç haneli ortalamalara ulaşmasına yardım etti, aşağıya bakın).
- **`mitigations=off`** (çekirdek önyükleme bayrağı) yaygın bir ince ayardır; VRAM taramasında FPS üzerinde yalnızca küçük, gürültülü etkileri oldu. Onu küçük kabul edin. ⚠ **doğrulayın (büyüklük tartışmalı)** — elektricM çok daha büyük bir kazanç bildiriyor (ipuçlarında **Cyberpunk'ta +18 FPS, "+%10–15"**). Açıkça oyuna bağlıdır: bazı CPU-sınırlı oyunlarda büyük, diğerlerinde ihmal edilebilir. Deneyin ve ölçün; iki sayıyı da varsaymayın. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

---

## İnsanların gerçekten paylaştığı sonuçlar

Bunlar, ayarları ve kaynağıyla birlikte topluluk tarafından bildirilen rakamlardır. **Benchmark skorları ve FPS yayınlandığı gibidir** — saat hızları/dağıtım/sürücü satırlar arasında farklıdır, bu yüzden bağlam sütununu okuyun, körü körüne karşılaştırmayın.

| Oyun | Ayarlar (çöz. / preset / upscaling) | Sonuç | HW / saat hızları | Kaynak |
|------|--------------------------------------|--------|-------------|--------|
| **Black Myth: Wukong** (bench) | 1080p, High, FSR + Frame Gen on | **ort 96** (min 78, maks 113) | BC-250, Windows, RADV NAVI10 | ([src](https://t.me/c/2424231195/10069)) |
| **Black Myth: Wukong** (bench) | 1440p, Medium, FSR yok | **ort ~48** (maks 56) | BC-250, 1850 MHz, Linux | ([src](https://t.me/c/2424231195/81203)) |
| **Shadow of the Tomb Raider** (bench) | 1440p, Max | **ort ~70** | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Marvel's Guardians of the Galaxy** (bench) | 1440p, High | **ort ~70** (89 maks, min ~3'e düşer) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Dying Light 2** (bench) | 1440p, High, VSync yok | **ort ~48** (maks 62) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Cyberpunk 2077** (bench) | 1440p, Ray Tracing **min** | **ort ~36** (min 30) | BC-250, 1850 MHz | ([src](https://t.me/c/2424231195/81203)) |
| **Indiana Jones and the Great Circle** | 1440p, low, upscaler yok | **45** | BC-250, GPU ~1900 MHz, Vulkan | ([src](https://t.me/c/2424231195/36931)) |
| **Indiana Jones and the Great Circle** | 1440p, medium, upscaler on | **60** | BC-250 | ([src](https://t.me/c/2424231195/36931)) |
| **Forza Horizon 5** | **4K**, High preset, **FSR yok** | oynanabilir (video) | BC-250 | ([src](https://t.me/c/2424231195/81891)) |
| **The Witcher 3** | 4K, Medium, FSR Balanced | **~50** | BC-250 | ([src](https://t.me/c/2424231195/81894)) |
| **Kingdom Come: Deliverance II** | 4K, Med/High, FSR Quality | **~30** ("PS5 deneyimi") | BC-250 | ([src](https://t.me/c/2424231195/81893)) |
| **The Last of Us Part II** | 1080p, varsayılan preset | oynanabilir (video) | BC-250 | ([src](https://t.me/c/2424231195/94237)) |
| **Doom: The Dark Ages** | High | **60** (40 CU kilidi + düzeltme sonrası) | BC-250, 40 CU | ([src](https://t.me/c/2424231195/141193)) · [Reddit düzeltme](https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/) · [Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS) |
| **Doom Eternal** | RT on (topluluk-bildirimi) | **60 + RT** | BC-250; topluluk-bildirimi (r/BC250Gaming) | ([Reddit sentezi](https://www.reddit.com/r/BC250Gaming/)) |
| **Tekken 8** | (topluluk-bildirimi) | **~60** | BC-250; topluluk-bildirimi (r/BC250Gaming) | ([Reddit sentezi](https://www.reddit.com/r/BC250Gaming/)) |
| **Street Fighter 6** | (topluluk-bildirimi) | **~60** | BC-250; topluluk-bildirimi (r/BC250Gaming) | ([Reddit sentezi](https://www.reddit.com/r/BC250Gaming/)) |
| **Stellar Blade** | (topluluk-bildirimi) | **~70–80** | BC-250; topluluk-bildirimi (r/BC250Gaming) | ([Reddit sentezi](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | Frame Generation on (topluluk-bildirimi) | **60 → 100** (FG) | BC-250; topluluk-bildirimi (r/BC250Gaming) | ([Reddit sentezi](https://www.reddit.com/r/BC250Gaming/)) |
| **Resident Evil Requiem** | (video) | oynanabilir | BC-250, CPU stok, **GPU 2000** | ([src](https://t.me/c/2424231195/121772)) |
| **Gothic Remake** | Medium | **takılır** — "optimizasyon yok" | BC-250 | ([src](https://t.me/c/2424231195/142708)) |
| **Hi-Fi Rush** | (video, OBS yakalama) | akıcı | BC-250, `mitigations=off` | ([src](https://t.me/c/2424231195/91022)) |
| **Cyberpunk 2077** | 1080p, High, FSR Quality, **RT yok** | **70–90** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Cyberpunk 2077** (bench) | 1080p (stok 2000 MHz / 1000 mV) | **57.66** → **60.82** OC (2230 MHz); `mitigations=off` **+18** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **The Last of Us Part I** | 1080p, Medium-High | **60** (kararlı) | BC-250 — shader derlemesi sırasında 90–100 °C; bir miktar ses çıtırtısı | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Devil May Cry 5** | 1080p, High | **100** (en düşük gecikme, ~10 ms) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Detroit: Become Human** | 1080p, Medium | **60** (sınırlı) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Control** | 1080p, tam **RT** | **40** | BC-250 — giriş seviyesi RT için iyi | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Company of Heroes 3** | 1080p | oynanabilir — **4 GB VRAM bölüşümü gerekir** (512 MB artefakt/çökme) | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Red Dead Redemption 2** (bench) | `-useMaximumSettings` bayrağını kullanın | **45+** min | BC-250 — yanlış GPU adaptörü algılayabilir, manuel ayarlayın | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **CS2** / **Rocket League** / **Elden Ring** | 1080p | **100+** / **120+** / **60** | BC-250 | [elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/) |
| **Helldivers 2** | 1080p, low (bildirilen) | **≈82** | BC-250, stok, tek Noctua NF-P12 — GPU 73 °C / CPU 76 °C; ⚠ ASR | ([“Temps Shocked Me”](https://youtu.be/d7Hwqxn9yg8) ~5:08) |
| **Stalker 2** | medium (bildirilen) | **≈80** | BC-250 — yazar CPU-sınırlı / 8 GB RAM olduğunu belirtiyor; ⚠ ASR | ([RU inceleme](https://youtu.be/19l03qneKJ4) ~0:23) |
| **Stalker 2** | QHD (2560×1600), FSR Quality + Frame Gen, yama 1.21 (bildirilen) | **57–70** (1080p, FG yok **≈45**) | BC-250; ⚠ ASR | ([RU inceleme](https://youtu.be/19l03qneKJ4) ~18:52) |
| **Arc Raiders** | 1080p (bildirilen) | **≈56–80** | BC-250, stok; ⚠ ASR | ([Temps Shocked Me](https://youtu.be/d7Hwqxn9yg8) ~5:58) |
| **Spider-Man 2** | 1080p, High, FSR Frame Gen (bildirilen) | **≈100** ort (native sub-60) | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~11:04) |
| **Forza Horizon 5** | 1080p, Medium, FSR yok (bildirilen) | **70–95** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~12:19) |
| **Metro Exodus** | QHD, High (bildirilen) | **≈58** | BC-250; ⚠ ASR | ([RU inceleme](https://youtu.be/19l03qneKJ4) ~14:12) |
| **Palworld** | 1080p, med-high (bildirilen) | **<60** (oynanabilir) | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:04) |
| **Red Dead Redemption 2** | 1080p, med-high, FSR Quality (bildirilen) | **sağlam 60** | BC-250; ⚠ ASR | ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:19) |
| **Left 4 Dead 2** | 1080p, maks (bildirilen) | **>150** | BC-250; ⚠ ASR | ([ETA Prime](https://youtu.be/q_CxcbS5HI8) ~10:18) |
| _Referans: ayrık GPU kurulumu_ | RE-engine bench, 1080p, High, RT yok | **ort 67.99** (min 58, maks 82) | **RX 6600** + Xeon E5-2667v4, Win10 | ([src](https://t.me/c/2424231195/116494)) |

> RX 6600 satırı **bir BC-250 sonucu değildir** — karşılaştırma noktası olarak aynı şasi/CPU üzerinde ayrık bir kart çalıştıran bir üyedir. *CPU*'nun tek başına neyi sürdürebileceğini göstermek için dahil edildi.

> ⚠️ **Elden Ring — sonuçlar değişir.** Yukarıdaki ~60 FPS (elektricM, 1080p) evrensel değildir: bir topluluk kurulumu **High'da sabit 30 FPS'e sınırlandı ve 720p low'da bile 60'a ulaşamadı** (CPU-sınırlı). 60'ı bir garanti değil, en iyi durum olarak kabul edin. ([Pixels & Power](https://youtu.be/4S0DvIpqm0E) ~21:50)

### First-party / konsol port'ları — tatlı nokta

Bunlar yeterince iyi çalıştı ki bir üye onları basitçe "çalışıyor" olarak listeledi (PS tarzı port'lar GPU'ya yaslanır ve iyi optimize edilmiştir, ki bu da bu karta uygundur):

> Days Gone · Death Stranding · DIRT 5 · Ghost of Tsushima: Director's Cut · God of War (2018) · God of War: Ragnarök · Horizon Forbidden West · Horizon Zero Dawn · The Last of Us Part I · The Last of Us Part II Remastered · Returnal · Uncharted: Legacy of Thieves

([src](https://t.me/c/2424231195/99563))

---

## Bilinen sorunlu oyunlar (çalışmaz / geçici çözüm gerekir)

elektricM, bizim ele almadığımız ve **platformda başarısız olan ya da onunla boğuşan** oyunları takip ediyor — satın almadan önce kontrol edin:

| Oyun | Sorun | Geçici çözüm |
|------|---------|-----------|
| **Fortnite** | Easy Anti-Cheat **Linux'u desteklemez** | **Yok — bir Linux BC-250'de çalışamaz** |
| **Valorant** | Çekirdek seviyesi anti-cheat | Linux'ta teknik sorunlar; fiilen hayır |
| **Magic: The Gathering Arena** | Özellikle **Fedora**'da çökme/donma | **Manjaro / Bazzite**'te daha iyi çalışır; başka Proton deneyin |
| **Final Fantasy VII Rebirth** | "DX12 is not supported on your system" (GPU-uyumluluk kontrolü) | **Henüz düzeltme yok** |
| **Black Myth: Wukong** (cracked) | "CreateProcess() returned 2" (anti-tamper) | **Değiştirilmemiş oyun dosyaları** kullanın |

(Anti-cheat durumu zamanla değişir — [areweanticheatyet.com](https://areweanticheatyet.com) ve [protondb.com](https://www.protondb.com) ile çapraz kontrol edin.) ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

### Eksik GPU özellikleri tarafından sert engellenenler (düzeltilemez)

Bu **RDNA 2 sınıfı silikondur** (GFX1013). Bir avuç yeni oyun **RDNA 2'de olmayan GPU özelliklerini sert şart koşar** — başlıca **mesh shader'lar** ve **donanımsal değişken oranlı shading (VRS)** — ve çalışmayı reddeder. Eksik silikon bir **donanım sınırlamasıdır, bir sürücü hatası değil**: hiçbir Mesa güncellemesi, çekirdek parametresi ya da Proton sürümü özelliğin kendisini eklemez. **Mesh shader'lar** gerçek bir duvardır. Bir **VRS** şartı bazen yalnızca, kullanıcı alanı bir Vulkan katmanının taklit edebileceği (stub) bir başlatma anı kontrolüdür (aşağıdaki Doom notuna bakın) — yani her zaman ölümcül değildir. Doğrulanmış örnekler ([r/linux_gaming topluluk thread'i](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)):

| Oyun | BC-250'nin sahip olmadığı sert şart |
|------|------------------------------------|
| **Final Fantasy VII Rebirth** | **Mesh shader'lar** — çalışmaz (yukarıdaki tablodaki DX12 GPU-uyumluluk kontrolünü de bu yüzden tetikler) |
| **Doom: The Dark Ages — Update 2** | **Vulkan fragment shading rate** (donanımsal VRS) — Update 2, VRS'i *başlatmada* zorunlu kıldı; GPU'da yok, dolayısıyla değiştirilmemiş oyun artık başlamıyor (Update 2 öncesi derleme, yukarıda, 40 CU kilidi açıldıktan sonra 60 FPS'te çalışıyordu). **Geçici çözüm var** — aşağıdaki nota bakın. |

> **Doom: The Dark Ages Update 2 — artık bir geçici çözüm var.** Oyun, VRS'i yalnızca başlatmada *kontrol eder*; oynanış için ona asla gerçekten ihtiyaç duymaz. **`bangstk/Vulkan_NullVRS`** Vulkan katmanı ([github.com/bangstk/Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS)), `vkCmdSetFragmentShadingRateKHR()`'yi yakalayıp no-op yapar, böylece başlatma kontrolünü karşılar ve oyun oyun-içi yan etki olmadan çalışır. Yani Doom: The Dark Ages kalıcı bir sert engel **değildir**. **Mesh shader'lar farklıdır** — FF7 Rebirth'ün mesh-shader şartı için eşdeğer bir shim yoktur, dolayısıyla o gerçekten çalışmaz.

> Yepyeni bir AAA oyunu satın almadan önce, mesh shader'ları ya da donanımsal VRS'i şart olarak listeleyip listelemediğini kontrol edin. **Mesh shader'lar** burada gerçek bir donanım duvarıdır (geçici çözüm yok). Bir **donanım-VRS** şartı genellikle yalnızca bir başlatma anı geçididir — bazen shim'lenebilir (yukarıdaki Doom gibi), bazen değil — bu yüzden iki türlü de varsaymadan önce topluluğu kontrol edin.

## Ray tracing — gerçekten test edilenler

BC-250'de **gerçek RDNA2 donanımsal RT** vardır (Mesa 25.2+ verildiğinde, yazılım emülasyonu değil). elektricM'e göre test edilen RT oyunları:

| Oyun | Çöz. | FPS | Notlar |
|------|-----|-----|-------|
| Cyberpunk 2077 | 1080p | 50–60 | Yalnızca RT aydınlatma, FSR Quality |
| Control | 1080p | 40 | Tam RT |
| Portal 2 RTX | 720p | 40 | Mesa 25.2+'de yazılım RT yolu |
| Half-Life 2 RTX | 720p | 20–30 | Çok talepkâr |

RT burada giriş seviyesidir — iyi optimize edilmiş oyunlarda *yalnızca aydınlatma* için iyidir, tam path-traced yükler için değil. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))

## Proton ve başlatma seçenekleri (Linux)

- **Proton sürümü:** **Proton GE** (en iyi uyumluluk) ya da **Proton Experimental** ile başlayın; oyuna göre kararlı **8.0 / 9.0**'a geri dönün. GE'yi **ProtonUp-Qt** (`protonup-qt`) üzerinden kurun. Bazı oyunlar yalnızca belirli bir sürümde çalışır — biri başarısız olursa test edin. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Bilinmesi gereken Steam başlatma seçenekleri**:
  - `mangohud %command%` — FPS/sıcaklık overlay'i.
  - `RADV_DEBUG=nohiz %command%` — RADV'yi zorlar / bazı glitch'leri düzeltir.
  - `gamemoderun %command%` — oturum için CPU governor'ını performance'a alır (bu CPU-sınırlı karta yardım eder).
  - Birleşik: `RADV_DEBUG=nohiz mangohud gamemoderun %command%`.
- **Oyun başına VRAM (UMA bölüşümü):** esports/indie **512 MB**'ta sorunsuzdur; **çoğu oyun 4 GB ister**; AAA/RT ayrıca ekstra-VRAM çekirdek parametrelerini ister (`amdgpu.gttsize=...`, bkz. [06-linux.md](06-linux.md) / [08-bios.md](08-bios.md)). Çok küçük bir bölüşüm artefaktlara, çökmelere ya da yazılım render'ına düşmeye neden olur. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **İlk çalıştırmada takılma** genellikle **shader derlemesidir** — FPS'i yargılamadan önce Steam'in ön-derlemeyi bitirmesine izin verin; daha büyük bir shader cache'i yardım eder. ([elektricM](https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/))
- **Oyun başına düzeltmeler** (topluluk-bildirimi, r/BC250Gaming — tam bu hatalara denk gelirseniz deneyin):
  - **Resident Evil Requiem — bozuk/glitch'li saç:** başlatma seçeneklerine `RADV_DEBUG=nohiz %command%` ekleyin (yukarıda listelenen aynı RADV bayrağı, burada özel olarak uygulanır). ([Reddit sentezi](https://www.reddit.com/r/BC250Gaming/))
  - **Spider-Man 2 / Assassin's Creed Shadows — donmalar:** **zswap** (sıkıştırılmış swap) etkinleştirmenin donmaları durdurduğu bildiriliyor. ([Reddit sentezi](https://www.reddit.com/r/BC250Gaming/))

---

## Emülasyon

Emülatörler CPU-yoğundur, bu yüzden sonuçlar karışıktır ama birkaçı sağlamdır ([src](https://t.me/c/2424231195/78988)):

- **Switch — Eden / Ryujinx:** iyi ve hızlı çalışır. Topluluk-bildirimi (r/BC250Gaming): **Mario Kart ~60 FPS**; **Tears of the Kingdom ~30–40 FPS**. ✅ ([Reddit sentezi](https://www.reddit.com/r/BC250Gaming/))
- **PS4 — shadPS4 (0.9.0+):** Bloodborne düşüş olmadan iyi çalışır; bazı oyunlar (The Last Guardian) artefakt yapar ama kararlı FPS tutar. ✅
- **PS3 — RPCS3:** çalışır, ama oyun başına ince ayar gerekir. ⚠️ **Bilinen tuhaflık** (topluluk-bildirimi, r/BC250Gaming): bir emülatör hatası RPCS3 altında **GPU'yu 1000 MHz'de kilitler**, dolayısıyla GPU saat hızını yükseltemez — geçici çözüm, kaybedilen GPU alanını telafi etmek için **CPU'yu overclock etmektir**. ([Reddit sentezi](https://www.reddit.com/r/BC250Gaming/))
- **Xbox 360 — Xenia Canary:** menüler yüklenir, oyun bir siyah ekrana düşer (hâlâ araştırılıyor). ❌

---

## Çalışırken nerede görülür (video)

Topluluk çok sayıda oyun/benchmark videosu paylaşıyor. Thread içi birkaç yakalama ve kanal:

- BC-250 oyun/benchmark klipleri: [youtu.be/CYDv1SfD2Pc](https://youtu.be/CYDv1SfD2Pc) · [youtu.be/g3uWOfqcexA](https://youtu.be/g3uWOfqcexA) · [youtu.be/9fozmRrAouc](https://youtu.be/9fozmRrAouc) · [youtu.be/q64M2XzADjA](https://youtu.be/q64M2XzADjA) · [youtu.be/0LEkOG1yqqw](https://youtu.be/0LEkOG1yqqw)
- Test edilen oyunların topluluk takip tablosu (FPS/ayarlar): [Google Sheet](https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing)

---

## Gerçekçi beklentiler kopya kâğıdı

| İstediğiniz… | 2000 MHz, modlanmış bir BC-250'de gerçeklik |
|-----------|--------------------------------------|
| 1080p AAA, 60 FPS | Bazen — CPU yüküne bağlı. FSR + Frame Gen yardım eder. Eski/hafif AAA: evet. |
| 1440p AAA | Çoğu port'ta 40–60 FPS; GPU'nun burada alanı var. En iyi değer çözünürlüğü. |
| 4K AAA | İyi optimize edilmiş/konsol port'larında FSR ile 30–50 FPS (Forza, Witcher 3, KCD2). |
| Ray tracing | Yalnızca minimumda, düşük FPS (Cyberpunk ~36 @ 1440p RT-min). Kartın güçlü yanı değil. |
| Her yerde sabit 60 | Hayır. CPU-sınırlı ve fizik-yoğun oyunlar ayarlardan bağımsız düşer/takılır. |
| First-party PS port'ları | Tatlı nokta — kartın en iyi yaptığı şeyler bunlar. |

---

## Kaynaklar

- CPU-sınırlı benchmark (38 FPS, %36.5 GPU) — https://t.me/c/2424231195/136242
- Büyük VRAM/saat hızı benchmark tablosu (Wukong, Tomb Raider, Dying Light 2, Cyberpunk, Guardians) — https://t.me/c/2424231195/81203
- Wukong 1080p High FSR+FG, ort 96 — https://t.me/c/2424231195/10069
- Indiana Jones Great Circle, çoklu-çöz. — https://t.me/c/2424231195/36931
- Forza Horizon 5 4K — https://t.me/c/2424231195/81891 · Witcher 3 4K — https://t.me/c/2424231195/81894 · KCD2 4K — https://t.me/c/2424231195/81893
- 40 CU kilit açma sonuçları (Doom Dark Ages 60 FPS) — https://t.me/c/2424231195/141193 · Doom düzeltme — https://www.reddit.com/r/BC250Gaming/comments/1rqw0v6/a_solution_to_get_doom_the_dark_ages_running/
- TLOU II 1080p — https://t.me/c/2424231195/94237 · Resident Evil Requiem — https://t.me/c/2424231195/121772 · Gothic Remake takılma — https://t.me/c/2424231195/142708
- First-party port'lar listesi — https://t.me/c/2424231195/99563
- Emülasyon derlemesi — https://t.me/c/2424231195/78988
- RX 6600 dGPU karşılaştırma koşusu — https://t.me/c/2424231195/116494
- elektricM oyun uyumluluğu (oyun başına ayarlar/FPS, sorunlu oyunlar, RT tablosu, Proton ve başlatma seçenekleri, FSR kazanımları) — https://elektricm.github.io/amd-bc250-docs/gaming/compatibility/
- YouTube FPS yakalamaları (oto-altyazı / ASR — rakamlar yaklaşık): ETA Prime (Spider-Man 2, Forza H5, Left 4 Dead 2) — https://youtu.be/q_CxcbS5HI8 · "Temps Shocked Me" (Helldivers 2, Arc Raiders) — https://youtu.be/d7Hwqxn9yg8 · RU inceleme (Stalker 2, Metro Exodus) — https://youtu.be/19l03qneKJ4 · Pixels & Power (Palworld, RDR2, Elden Ring 30 FPS) — https://youtu.be/4S0DvIpqm0E
- Mesh-shader / donanımsal-VRS sert engeller (FF7 Rebirth, Doom: The Dark Ages Update 2) — [r/linux_gaming thread'i](https://www.reddit.com/r/linux_gaming/comments/1nvsgji/)
- **Doom: The Dark Ages VRS geçici çözümü — `bangstk/Vulkan_NullVRS`** (`vkCmdSetFragmentShadingRateKHR` için no-op Vulkan katmanı) — https://github.com/bangstk/Vulkan_NullVRS
- **Linux'ta LSFG frame generation — `lsfg-vk`** (Vulkan katmanı) — https://github.com/PancakeTAS/lsfg-vk
- **RDNA2'de DP4a (INT8) üzerinden FSR 4 / XeSS** — OptiScaler FSR4 INT8 derlemesi: [VideoCardz](https://videocardz.com/newz/optiscaler-update-brings-fsr-4-int8-support-to-rdna-2-on-newer-radeon-drivers) · [PC Gamer](https://www.pcgamer.com/hardware/graphics-cards/optiscaler-updated-to-support-fsr-4-on-older-amd-rx-6000-gpus-without-the-need-for-driver-mods/) · [OptiScaler FSR4 uyumluluk wiki'si](https://github.com/optiscaler/OptiScaler/wiki/FSR4-Compatibility-List)
- **RDNA2 için resmi AMD FSR 4 (~2027 başı) / RDNA3 (Temmuz 2026)** — [Tom's Hardware](https://www.tomshardware.com/pc-components/gpu-drivers/amd-makes-fsr-4-upscaling-official-for-radeon-rx-7000-and-6000-series-cards-rdna-3-and-rdna-2-chips-will-soon-enjoy-improved-visuals)
- **Topluluk-bildirimi oyun sonuçları (r/BC250Gaming)** — Tekken 8, Street Fighter 6, Stellar Blade, RE Requiem Frame-Gen, Doom Eternal RT, Switch (Mario Kart / TOTK), RPCS3 1000 MHz GPU kilidi, RE Requiem saç / Spider-Man 2 / AC Shadows düzeltmeleri — https://www.reddit.com/r/BC250Gaming/
- Topluluk oyun-testi tablosu — https://docs.google.com/spreadsheets/d/1kJleOY5k-YREGak1pQhVWIGckA9YA3OWJyCbybZbk00/edit?usp=sharing

> Saat hızları ve 40 CU kilidi açma [09-overclock-undervolt.md](09-overclock-undervolt.md)'de yaşar; 2000 MHz çalıştırmadan önce [04-cooling.md](04-cooling.md) modunu yapın.
