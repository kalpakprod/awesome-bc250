> 🌐 Topluluk çevirisi. İngilizce sürüm asıl kaynaktır ve daha güncel olabilir. Hata mı buldunuz? Bir [issue açın](https://github.com/lildebil0/awesome-bc250/issues). ([İngilizce orijinali](../en/faq.md))

# SSS

> **Özet** — Yeni başlayanların ilk hafta sorduğu sorular, kısa doğru yanıtlar ve her biri için ilgili tam bölüme bir bağlantı ile. Bir yanıt çok kısa geliyorsa, bu kasıtlıdır — derinlik bağlantılı el kitabı sayfasında yer alır.

Bu bir hızlı referanstır. Rehberli "kutudaki kart → çalışan oyunlar" yolu için [00-start-here.md](00-start-here.md) ile başlayın.

---

## Donanım ve ne satın aldım

**BC-250 gerçekte nedir?**
Bir kripto madenciliği/sunucu kartı üzerinde PlayStation 5 türevi bir APU (AMD **Cyan Skillfish** / Oberon): **6 çekirdekli/12 iş parçacıklı Zen 2 CPU + 24 CU RDNA 2 GPU + 16 GB lehimli GDDR6**. Bir ekran kartı değildir ve normal bir PC değildir — PCIe yuvası yok, 24 pinli ATX yok, tanıdık bir BIOS yok. Bkz. [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Tak-çalıştır mı? Satın almalı mıydım?**
Hayır. Sürücü çalışması, bir soğutma modu ve garip güç gerektirir — bir kurcalayıcı kartıdır. Bir veteranın deyişiyle: "belirli beceriler, çaba ve akıl gerektirir." Sıfır uğraş istiyorsanız iade edin; projeleri seviyorsanız bu seviyedeki en ucuz Linux oyun / yerel yapay zeka makinesidir. Bkz. [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Daha fazla RAM ekleyebilir miyim?**
Hayır. 16 GB GDDR6 lehimlidir ve CPU ile GPU arasında paylaşılır; DIMM yuvası yoktur. Yalnızca GPU'nun havuzdan ne kadarını rezerve ettiğini seçersiniz (UMA), bu da modlanmış bir BIOS'ta ayarlanır. Bkz. [01-what-is-bc250.md](../en/01-what-is-bc250.md) ve [08-bios.md](../en/08-bios.md).

**Bir güç düğmesi var mı?**
Hayır. 12 V geldiği anda açılır — PSU'nun kendi anahtarı sizin güç düğmenizdir. Bkz. [03-power-supply.md](../en/03-power-supply.md).

**Kartım POST yapmıyor / kutudan siyah ekran çıkıyor — ölü mü?**
Genellikle değil. Birçok kart POST yapmadan önce bir **BIOS/CMOS resetine** ihtiyaç duyar şekilde gelir ve bazıları soğutucu blok montajından dolayı hafifçe **bükülmüş** halde gelir — bir sahip, açılmama sorununu kartı kağıtla düz şekilde besleyerek (shim) çözdü. Ölü olduğunu ilan etmeden önce bunları deneyin. Bkz. [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**GPU ile oyun kaydedebilir/yayınlayabilir miyim?**
Donanımsal olarak hayır. Video kodlama bloğu (VCN) kullanılamaz, bu yüzden OBS/yayın bir **yazılım (CPU) kodlayıcıya** geri döner — çalışır (insanlar Sunshine/Moonlight kullanıyor) ama CPU'ya ve kaliteye mal olur. Bkz. [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**Arka plaka modu için termal ped kalınlıkları nedir?**
Topluluk tarafından bildirilen: **bellek 2 mm, yonga seti 1,5 mm** ([src](https://t.me/c/2424231195/22442)). Arka GDDR6'nın sıcaklık sensörü yoktur, bu yüzden onu kör soğutursunuz. Bkz. [04-cooling.md](../en/04-cooling.md).

## Güç

**Hangi güç kaynağına ihtiyacım var?**
Bir **PCIe 8 pin (6+2)** konnektörüne **≥300 W** sağlayan **tek raylı 12 V** bir kaynak. Üç yaygın yol: normal bir ATX/SFX PSU (sadece PCIe kablosunu takın — en kolayı), ucuz kullanılmış bir HP Flex 500 W sunucu PSU'su veya bir Mean Well endüstriyel brick. Bkz. [03-power-supply.md](../en/03-power-supply.md).

**PSU'mdaki CPU/EPS 8 pinini kullanabilir miyim?**
**Hayır — kartı yakabilir.** PCIe ve CPU/EPS 8 pinleri neredeyse aynı görünür ama **ters polariteye** sahiptir. Kartın bir kontrol mekanizması yoktur; **PCIe** kablosunu kullanın ve emin değilseniz multimetre ile doğrulayın. Bkz. [03-power-supply.md](../en/03-power-supply.md).

**Eski 750 W PSU'mun bol watt'ı var — neden zorlanıyor?**
Eski üniteler genellikle **12 V'u birden çok zayıf raya böler** ve hiçbir tek ray kartın çektiği ~235 W'ı karşılayamaz. Modern tek raylı / DC-DC bir PSU ya da büyük bir başlık (headroom) payı olanı tercih edin. Bkz. [03-power-supply.md](../en/03-power-supply.md).

**Güç kablom ısındı / duman çıkardı. Neden?**
Neredeyse kesinlikle **sahte bakır** — bakır kaplı çelik veya alüminyum kablo, gerçek bakırın birçok katı dirence sahiptir ve yük altında aşırı ısınır (bir üyenin hazır PCIe çoklayıcısı tam anlamıyla duman çıkardı) ([src](https://t.me/c/2424231195/97202)). Bir mıknatısla test edin: çeliğe yapışır, bakıra yapışmaz. Gerçek bakır kullanın, **16 AWG veya daha kalın**. Bkz. [03-power-supply.md](../en/03-power-supply.md).

## Soğutma

**Neden kutudan çıktığı gibi aşırı ısınıyor / throttle yapıyor?**
Stok soğutucu blok **pasiftir**, bir madencilik rack'inin zorlamalı hava tüneli için yapılmıştır. Hava akışı olmayan bir masada ısıyı emer ve throttle yapar. Throttling ~**85 °C**'de başlar, sert reset ~**90 °C**'de olur. Bkz. [04-cooling.md](../en/04-cooling.md).

**Gerçekten işe yarayan en ucuz soğutma çözümü nedir?**
**Yoğun stok kanatçıkları inceltin** (orbital zımpara en hızlısıdır) ve yazdırılmış bir kanal aracılığıyla içlerinden hava üfleyen bir **120 mm yüksek statik basınçlı fanı** cıvatalayın. Referans sonuçlar: Noctua NF-P12 → Furmark'ta ~73 °C, oyunlarda 63–65 °C ([src](https://t.me/c/2424231195/42843)); Arctic P12 Max ~75 °C tutar ([src](https://t.me/c/2424231195/58869)). Bkz. [04-cooling.md](../en/04-cooling.md).

**Neden yüksek hava akışlı bir "kasa fanı" değil de yüksek statik basınçlı bir fan?**
Yoğun kanatçıklar yüksek dirençli bir yüktür — yüksek hava akışlı bir kasa fanı onlara karşı sadece durur, oysa yüksek statik basınçlı bir fan (Noctua/Arctic P12) havayı gerçekten içlerinden *iter*. Çok yoğun kanatçıklar için iki fanı yan yana değil, **push-pull (seri)** şeklinde kullanın. Bkz. [04-cooling.md](../en/04-cooling.md).

**Soğutmamın yeterli olduğunu nasıl anlarım?**
**GPU ve CPU'yu birlikte** zorlayın (tek bir soğutucu bloğu paylaşırlar) — Furmark VK artı bir CPU yükü — **overclock'unuz altında** (stok değil, 2000 MHz) ve yükü ~85 °C'nin altında tutun. Sabitlenmiş bir test prosedürü var. Bkz. [04-cooling.md](../en/04-cooling.md).

## Linux

**Hangi dağıtımı kurmalıyım?**
"Sadece oyun oyna" için **Bazzite** flashleyin ve **`bazzite-bc250`** imajına rebase yapın — GPU düzeltmeleri içine işlenmiştir. Makineyi öğrenmek için: **Fedora** (COPR + kurulum scripti) veya **CachyOS/EndeavourOS** (Arch). Bkz. [06-linux.md](../en/06-linux.md).

**Linux kurdum ve her şey yavaş / tek haneli FPS. Neden?**
GPU ivmelendirilmiyor — yazılım (LLVMpipe) render'ı kullanıyorsunuz. Bir **güncel Mesa (25.1+)**, **`cyan_skillfish` firmware sembolik bağlantısı** (veya yamalı bir paket) ve doğru çekirdek parametreleri gerekir. `vulkaninfo | grep deviceName` ile doğrulayın (`llvmpipe` *yazmaması* gerekir). Bkz. [06-linux.md](../en/06-linux.md).

**Çekirdek güncellemesinden sonra siyah ekran — nasıl düzeltirim?**
Çoğu dağıtımda düzeltme, amdgpu'nun yüklenebilmesi için firmware sembolik bağlantısıdır:
```bash
sudo ln -s /lib/firmware/amdgpu/navi10_gpu_info.bin.zst \
           /lib/firmware/amdgpu/cyan_skillfish_gpu_info.bin.zst
```
Bu, çekirdek güncellemelerinde kalıcıdır (ama Bazzite'ta **değil** ve bir firmware/amdgpu güncellemesi onu silebilir) ([src](https://t.me/c/2424231195/98882)). Aksi takdirde daha eski/LTS bir çekirdek önyükleyin ve bozuk olanı sürüm kilidiyle sabitleyin. Bkz. [06-linux.md](../en/06-linux.md).

**Uygulamaları Flatpak olarak kurmalı mıyım?**
Grafiksel hiçbir şey için onlardan kaçının. Flatpak'ler **kendi Mesa'larını** içlerinde taşır ve kartın yamalı olanını geçersiz kılar, bu yüzden **donanım ivmelendirmesi olmadan** çalışırlar. Örneğin PortProton, Flatpak yerine terminal aracılığıyla kurulmalıdır ([src](https://t.me/c/2424231195/17949), [src](https://t.me/c/2424231195/47092)). Bkz. [06-linux.md](../en/06-linux.md).

**CPU'm zayıf hissettiriyor — hızlı kazanımlar var mı?**
İki çekirdek ayarı: **`mitigations=off`** (CPU güvenlik açığı azaltmalarını devre dışı bırakır) ([src](https://t.me/c/2424231195/23359)) ve **`nosmt=force`** (SMT'yi devre dışı bırakır — hafif iş parçacıklı oyunlarda +%15–25 FPS, ama yüksek bit hızında OBS gibi yoğun çoklu görevlere zarar verir) ([src](https://t.me/c/2424231195/61332)). İkisi de güvenlik/verim takaslarıdır. Bkz. [06-linux.md](../en/06-linux.md).

**Wayland'de GNOME/KDE bozuk çalışıyor — ne yapayım?**
Bilinen bir sorun. Üyeler, Wayland oturumlarının (genellikle GNOME/KDE) bu kartta hatalı davrandığını bildiriyor; bunun yerine **X11 oturumunu kullanın** ([src](https://t.me/c/2424231195/19623)). Bkz. [06-linux.md](../en/06-linux.md).

**RAM'im çabuk doluyor — daha fazla swap alabilir miyim?**
Evet, **zRAM** swap'ını (sıkıştırılmış RAM swap'ı) büyütün — topluluk tarifi onu 32 GB'a çıkarır ve `/etc/systemd/zram-generator.conf` içinde kalıcı hale getirir ([src](https://t.me/c/2424231195/38703)). Gerçek bellek eklemez ama ani yükselmeleri emer. Bkz. [06-linux.md](../en/06-linux.md).

**Bir çekirdek güncellemesi bir şeyleri bozdu — nasıl geri alırım?**
Sistem son birkaç çekirdeği saklar. Fedora'da bunları `grubby` ile listeleyin ve `grubby --set-default /boot/vmlinuz-…` yapın, ardından yeniden başlatın ([src](https://t.me/c/2424231195/39393)). Şüphedeyseniz bir **LTS çekirdek** çalıştırın. Bkz. [06-linux.md](../en/06-linux.md).

## Windows

**Henüz bir Windows sürücüsü var mı?**
Hayır — 2026 başı itibarıyla **çalışan bir Windows GPU sürücüsü yok**. Windows önyüklenir ama GPU 3D olmadan **Code 43**'te kalır. Sıfırdan iki tersine mühendislik çabası mevcut (Keshas-dev, ZEROAESQUERDA) ama bunlar "GPU başlatılabilir mi" aşamasında, oyun aşamasında değil. Bkz. [07-windows.md](../en/07-windows.md).

**Bir RX 6700 / W5700 sürücüsünü zorla kuramaz mıyım?**
Hayır. Her resmi `.inf` (Windows'un "uyumlu" olarak sunduğu W5700 dahil) kurulur sonra Code 43'te takılır — `1002:13FE` aygıt kimliği APU'ya kaynaklanmıştır. Bu, her yeni başlayanın ilk fikridir ve işe yaramaz. Bkz. [07-windows.md](../en/07-windows.md).

**GPU passthrough'lu bir Windows VM'i ne olacak?**
İşe yaramaz — IOMMU passthrough bu kartta bozuktur, bu bir APU'dur (devretmek için temiz bir ayrık kart değil) ve yonga zaten yanlış tespit edilir. Bkz. [07-windows.md](../en/07-windows.md).

**Bir "BC-250 için NVIDIA sürücüsü" / bir `…bc250.exe` gördüm — gerçek mi?**
Hayır. "NVIDIA sürücüsü" bir **1 Nisan şakasıydı** ve dosya adına "bc250" eklenmiş bir Adrenalin yükleyicisi hâlâ sadece normal bir Adrenalin yükleyicisidir. Yalnızca adı geçen GitHub depolarından gelen ikili dosyaları çalıştırın ve kodu okuyun — sahte "sürücüler" zararlı yazılım olmuştur. Bkz. [07-windows.md](../en/07-windows.md).

## BIOS ve kurtarma

**Modlanmış bir BIOS flashlemeli miyim?**
Yalnızca overclock/zamanlamalar/iGPU-VRAM açmak istiyorsanız **ve** kurtarma donanımınız hazırsa. Yanlış bir ayar kartı **tamamen tuğlaya çevirebilir** ve bu kartta bir **CMOS temizliği onu her zaman kurtarmaz**. Güncel 5.00 tabanlı modu kullanın, SHA-256'yı doğrulayın ve asla Integrated Graphics'i devre dışı bırakmayın (tek ekranınız odur). Bkz. [08-bios.md](../en/08-bios.md).

**Tuğlaya çevirdim — tuğladan kurtarabilir miyim?**
Genellikle evet, ama yalnızca donanımla: 16 MB yongayı yeniden flashlemek için kartın **J4004 başlığına** bağlanmış bir **CH341A sınıfı SPI programlayıcısı** (SOIC klipsi burada işe yaramaz). CH341A 3,3 V veri hattı tuzağına dikkat edin. Bkz. [08-bios.md](../en/08-bios.md).

**VRAM bölüşümünü değiştirdim ama işletim sistemi hâlâ eski miktarı gösteriyor.**
Flashledikten/UMA'yı değiştirdikten sonra **CMOS'u temizleyin** — CR2032'yi 60+ saniye çıkarın veya CMOS jumper'ını kısa devre yapın. Bazı ayarlar (özellikle VRAM/UMA) bunu yapana kadar uygulanmaz ([src](https://t.me/c/2424231195/97290)). Bkz. [08-bios.md](../en/08-bios.md).

## Overclock ve undervolt

**Nasıl overclock yaparım? Buna değer mi?**
Bir **governor** çalıştırın (çoğu build **oberon-governor** kullanır) ve GPU'yu **2000 MHz**'e doğru yükseltin (~+%30 FPS *GPU sınırlıyken*). Daha yeni `bc250_smu_oc` ayrıca CPU'yu overclock yapar (~4 GHz @ 1275 mV). **Önce kartı soğutun** — ~90 °C üzerinde OC onu resetler. Bkz. [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**40 CU açma nedir?**
Yonga fiziksel olarak **40 CU**'ya sahiptir ama firmware yalnızca **24**'ünü aktif bırakır. Yamalı bir amdgpu + `amdgpu.bc250_cc_write_mode=3` 40'ının tamamını yeniden etkinleştirir — saat hızlarından daha büyük bir GPU kazanımı (bir Superposition koşusu 4647 → 6863'e çıktı). Çekirdek modülünü yeniden derlemeyi gerektirir ve yalnızca Linux'a özgüdür. Bkz. [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**Hangi voltajı ayarlamalıyım?**
Her yonga farklıdır (silikon piyangosu). Yaygın oyun-kararlı noktalar: **2000 MHz ≈ 955 mV** (~75 °C). Sadece kararsızlığı gizleyen Furmark'ta değil, **gerçek oyunlar + alt-tab/menüler** ile doğrulayın. Sert CPU sınırı: **1,325 V Vid'i asla aşmayın**. Bkz. [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

**Çok agresif bir undervolt tehlikeli mi?**
Hayır — en kötü ihtimalle kart düşer veya M.2 yuvasını devre dışı bırakır ve OC BIOS'ta saklanmadığı için birkaç saniye içinde temizlenir. CPU'yu aşırı *voltlamak* tehlikeli yöndür. Bkz. [09-overclock-undervolt.md](../en/09-overclock-undervolt.md).

## Ekran, WiFi ve Bluetooth

**HDMI üzerinden görüntü yok mu?**
Kart **DisplayPort** üzerinden çıkış verir; HDMI/TV için bir **DP→HDMI adaptörü veya kablosu** kullanın (iyi bir tanesi BIOS'ta da çalışır ve 4K yapar) ([src](https://t.me/c/2424231195/24107)). Ucuz pasif bir adaptör yerine gerçek bir **DP→HDMI kablosu** tercih edin — kötü bir adaptör bir üye için siyah ekranlara neden oldu ([src](https://t.me/c/2424231195/96416)).

**DisplayPort üzerinden ses bozuk.**
Linux'ta bilinen bir sorun. Basit çözüm, temiz ses taşıyan bir **DP→HDMI** adaptörü üzerinden çıkış vermektir ([src](https://t.me/c/2424231195/17953)). Bkz. [01-what-is-bc250.md](../en/01-what-is-bc250.md).

**WiFi/Bluetooth'u var mı?**
Yerleşik kablosuz yok — **markaya göre değil, yongaya göre** seçilmiş bir **USB dongle**'a ihtiyacınız var. En iyi belgelenmiş olanı bir **aic8800d80** çubuğudur; ucuz Realtek RTL8821/8822 çubukları `lwfinger/rtw88` ile çalışır ama yük altında kopar. Kurulum için kablolu bir USB-Ethernet adaptörü tüm sorunu atlatır. Bkz. [10-wifi-bt.md](../en/10-wifi-bt.md).

**WiFi dongle'ım sürekli bağlantı kesiyor.**
Klasik Realtek-on-BC-250 belirtisi: doğru harici (out-of-tree) sürücüyü kurun (rtw88 / rtl8831), arka bir USB portu deneyin ve fişi çekmek yerine `usbreset` ile resetleyin. Güvenilirlik fiyattan daha önemliyse aic8800d80'a veya doğrulanmış bir Digma çubuğuna geçin. Bkz. [10-wifi-bt.md](../en/10-wifi-bt.md).

## Oyun ve Yapay Zeka

**Hangi FPS'i bekleyebilirim?**
Gerçek bir **2000 MHz** OC'de: modern AAA **40–60 FPS**, daha hafif/eski oyunlar 60'ın üzerinde. En iyi **1080p–1440p**'de FSR ile. Kart genellikle **CPU sınırlıdır**, bu yüzden çözünürlük çoğu zaman "bedavadır" ama fizik ağırlıklı/kötü iş parçacıklı oyunlar yine de takılır. Bkz. [11-gaming.md](../en/11-gaming.md).

**Hangi oyunlar en iyi çalışır?**
**Birinci taraf PlayStation portları** (God of War, Horizon, The Last of Us, Spider-Man, Ghost of Tsushima) — GPU'ya yaslanırlar ve iyi optimize edilmiştir. Emülasyon: Switch (Eden) ve PS4 (shadPS4) sağlamdır; Xbox 360 (Xenia) değildir. Bkz. [11-gaming.md](../en/11-gaming.md).

**GPU'm neden ~%40 yükte ama FPS düşük?**
**CPU sınırlısınız** — darboğaz GPU değil, 6 çekirdekli Zen 2'dir. Bu durumda ölçekleme (upscaling) FPS'i pek yükseltmez; `nosmt=force`/`mitigations=off` deneyin ve bazı başlıkların CPU sınırlı olduğunu kabul edin. Bkz. [11-gaming.md](../en/11-gaming.md).

**Üzerinde yerel LLM'ler / yapay zeka çalıştırabilir miyim?**
Evet — 16 GB GDDR6, **Vulkan** arka ucunda `llama.cpp`/Jan aracılığıyla orta boy modelleri barındırır; önce BIOS'u GPU'ya ~12 GB ayıracak şekilde ayarlayın. Bkz. [12-ai-llm.md](../en/12-ai-llm.md).

## Satın Alma

**Adil bir fiyat nedir ve nereden satın alırım?**
Fiyatlar ve kaynaklar hızla değişir ve bölgeye özeldir (eBay, AliExpress, BDT'de Ozon/Avito) — son raporlar 100 doların altından ~13 bin ₽ civarında kümeleniyor. Bkz. [02-buying.md](../en/02-buying.md).

**Bir tane satın almanın riskleri nelerdir?**
Bu kullanılmış madencilik/sunucu donanımıdır: kartlar bir BIOS resetine ihtiyaç duyarak, hafifçe bükülmüş veya bazen arızalı olarak gelebilir ve satıcı desteği yoktur — topluluk sizin desteğinizdir. Sadece para değil, zaman da ayırın. Bkz. [01-what-is-bc250.md](../en/01-what-is-bc250.md) ve [02-buying.md](../en/02-buying.md).

**Üzerinde macOS çalıştırabilir miyim?**
Çalıştırmayın. CPU önyüklenebilir ama **GPU asla ivmelendirilmeyecektir** (taklit edilecek desteklenen bir ikiz yok ve hiçbir AMD APU iGPU'su macOS'ta hiç çalışmadı). Linux kullanın. Bkz. [13-macos.md](../en/13-macos.md).

---

## Kaynaklar

- Kaynak sohbet: *AMD BC-250 community* (Telegram). Çoğu yanıt tam bir el kitabı bölümünü özetler — altta yatan atıflar için bölüm bağlantısını takip edin.
- Termal ped kalınlıkları — https://t.me/c/2424231195/22442
- Arctic P12 Max ~75 °C — https://t.me/c/2424231195/58869 · Noctua P12 ~73 °C — https://t.me/c/2424231195/42843
- Çekirdek sonrası siyah ekran firmware sembolik bağlantı düzeltmesi (Bazzite değil) — https://t.me/c/2424231195/98882
- Flatpak donanım ivmelendirmesini bozar — https://t.me/c/2424231195/17949 · Terminal aracılığıyla PortProton — https://t.me/c/2424231195/47092
- Zayıf CPU için `mitigations=off` — https://t.me/c/2424231195/23359 · `nosmt=force` FPS kazancı — https://t.me/c/2424231195/61332
- Wayland bozulmaları, X11 kullanın — https://t.me/c/2424231195/19623
- zRAM swap artışı — https://t.me/c/2424231195/38703 · çekirdek seçimi/geri alma — https://t.me/c/2424231195/39393
- Güç çoklayıcısı aşırı ısındı/duman çıkardı (sahte bakır) — https://t.me/c/2424231195/97202
- VRAM değişiminden sonra CMOS temizliği gerekli — https://t.me/c/2424231195/97290
- DP→HDMI adaptörü (4K/TV, BIOS'ta çalışır) — https://t.me/c/2424231195/24107 · kötü adaptör → siyah ekran — https://t.me/c/2424231195/96416 · DP ses bozulması düzeltmesi — https://t.me/c/2424231195/17953

> Bu SSS bir haritadır, arazinin kendisi değil — her yanıt detayı ve birincil kaynakları taşıyan bölüme işaret eder. Düzeltmeler PR aracılığıyla memnuniyetle karşılanır (bkz. [CONTRIBUTING.md](../../CONTRIBUTING.md)).
