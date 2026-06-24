> 🌐 Topluluk çevirisi. İngilizce sürüm asıl kaynaktır ve daha güncel olabilir. Hata mı buldunuz? Bir [issue açın](https://github.com/lildebil0/awesome-bc250/issues). ([İngilizce orijinali](../en/05-case.md))

# Kasalar ve 3D Baskı

> **Özet** — BC-250 çıplak bir kart olarak gelir, dolayısıyla neredeyse herkes bir muhafaza yazdırır. Tek bir "doğru" kasa yoktur — topluluk, kartın iki yarısını etrafına klipsleyen minimal bir **soğutma kılıfından**, taşıma kulpu, ön ekran ve RGB'li tam **konsol tarzı kutulara** kadar **düzinelerce** tasarım üretti. Ne yazdırırsanız yazdırın, kasanın stok kartın yapamadığı tek bir işi yapması gerekir: **bir 120 mm fanı soğutucu blok kanatçıklarına karşı sızdırmaz hâle getirmek** böylece hava onların *içinden* geçer (bkz. [Soğutma](04-cooling.md)). Bu sayfa katalogdur: ad → STL → fanlar → nereden indirileceği. **PSU'ya dikkat edin**: çoğu kasa belirli bir güç kaynağı etrafında tasarlanmıştır (LOP, Flex/SFX ATX ya da bir HP sunucu brick'i) — sahip olduğunuz [PSU](03-power-supply.md)'ya uyan kasayı seçin.

Buradaki bir "kasa", 20 dakikalık iş alan 200 g'lık bir baskıdan, yazarına haftalar süren çok-parçalı bir konsola kadar değişir. Basit başlayın; her zaman yeniden yazdırabilirsiniz.

> **Yeni ve emin değil misiniz? [onemorecap kılıf/kabuk](#katman-1--minimal-soğutma-kılıfı-buradan-başlayın) kasasını yazdırın — minimal, kesilecek bir şey yok, tek bir 120 mm fana sığar — ve orada durun.** Aşağıdaki katalog derindir; başlamak için onu okumanıza gerek yok.

> **Tam listeyi mi istiyorsunuz?** elektricM, **aranabilir, filtrelenebilir ~143 tasarımlık bir katalog** sürdürür (PSU ailesine, kullanılabilirliğe, platforma göre filtreleyin) — aşağıdaki seçilmiş setten çok daha fazlası, birçok yalnızca-Discord ve WIP build dahil. Şuradan göz atın: **[elektricM — Kasalar ve Muhafazalar](https://elektricm.github.io/amd-bc250-docs/community/cases/)**. Aşağıdaki seçimler, başlamaya değer adıyla anılan, herkese açık şekilde indirilebilir olanlardır.

---

## Topluluk build'leri

İnsanların gerçekte yazdırdığının bir tadı — çıplak bir açık kabuktan tamamen temalı konsollara. Aynı kart, çılgınca farklı sonuçlar.

<p align="center">
  <img src="../../assets/img/case-shell.jpg" alt="onemorecap Shell Case: açık yan-plaka, taşıma kulpu, açıkta bakır kanatçıklar, Arctic 120 mm fan" width="60%"><br>
  <sub>Build: Дима Ткач · <a href="https://t.me/c/2424231195/22771">kaynak</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-frame.jpg" alt="İçi gösterilen beyaz alüminyum açık çerçeve: çift soğutucu, merkezde beyaz Arctic fan, Flex PSU" width="60%"><br>
  <sub>Build: Сергей · <a href="https://t.me/c/2424231195/87420">kaynak</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-orange.jpg" alt="Delikli mesh yan paneli ve kalıplanmış taşıma kulpu olan turuncu-beyaz kapalı konsol" width="60%"><br>
  <sub>Build: Alexander Susl · <a href="https://t.me/c/2424231195/122822">kaynak</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-arasaka.jpg" alt="ARASAKA cyberpunk-temalı konsol: beyaz yüz, krom fan ızgarası, yeşil aksanlar ve ayaklar" width="60%"><br>
  <sub>Build: Maxim Perelygin · <a href="https://t.me/c/2424231195/98072">kaynak</a></sub>
</p>

---

## Nasıl seçilir

Üç soru size hangi kasanın uyduğuna karar verir:

1. **Hangi PSU'yu kullanıyorsunuz?** ([Güç Kaynağı](03-power-supply.md)) — Bir Meanwell **LOP-300** küçüktür ve çoğu kasanın *içinde* yaşar. Bir **Flex/SFX ATX** PSU daha büyüktür ve özel bir yuvaya sahip bir kasa gerektirir. Kurtarılmış bir **HP/sunucu brick'i**, "v3/v4 sunucu PSU" kasalarını gerektirir. Bu, tek en büyük filtredir.
2. **Hangi fanı/fanları çalıştıracaksınız?** Neredeyse her kasa, soğutucunun üzerinde **bir 120 mm fan** etrafında inşa edilmiştir. Daha büyük build'ler, arka plakaya (sıcaklık sensörü [olmayan](04-cooling.md) GDDR6 belleğini soğutmak için) **ikinci bir 120 mm** fan ekler ya da PSU'yu besler. Birkaçı, yüksekliğin kısıtlı olduğu yerlerde **140 mm** ya da **ince** fanlar kullanır.
3. **Kanatçıkları henüz inceltiniz mi?** Çoğu kasa, stok soğutucu blok kanatçıklarını zaten **eğelediğinizi/zımparaladığınızı** varsayar (bkz. [Soğutma, Yol A](04-cooling.md)). Bir kasa tek başına stok soğutucuyu düzeltmez — sadece fanı doğru yerde tutar.

> **Jargon, bir kez:** **STL** = bir dilimleyiciye yüklediğiniz standart 3D-baskı mesh dosyası. **STEP / 3MF** = düzenlenebilir CAD formatları (tasarımı değiştirmek isterseniz bunları kullanın). **Kanal / kılıf / adaptör** = fanın havayı etrafından sızdırmak yerine kanatçıklara karşı sızdırmaz olmasını sağlayan yazdırılmış bir huni. **Flex / SFX ATX** = küçük form-faktörlü PC güç kaynakları. **LOP** = topluluğun tercih ettiği Meanwell LOP-300 endüstriyel PSU.

> **💡 CMOS-temizleme jumper'ına bir erişim deliği yazdırın.** VRAM/UMA bölünmesini her değiştirdiğinizde **CMOS'u temizlemeniz** gerekir (bkz. [BIOS](08-bios.md)), dolayısıyla jumper'ı gömen kapalı bir kasa tasarlamak, onu tekrar tekrar açmak demektir. Herhangi bir kapalı tasarımda clear-CMOS jumper'ının üzerine bir **⌀10 mm erişim deliği** bırakın — ya da daha iyisi, aletsiz resetleyebilmek için panele küçük bir **3 konumlu anahtar** kablolayın. ([4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980))

---

## Katman 1 — Minimal "soğutma kılıfı" (buradan başlayın)

Yazdırabileceğiniz en küçük, en hızlı şey. **Gerçekten bir kasa değildir** — kartın üzerine iki yarım hâlde sıkı bir sürtünme uyumuyla oturan, bir 120 mm fanı soğutucuya karşı tutan ve havayı yönlendiren yazdırılmış bir cekettir. **Kesilecek bir şey yok, karta vida yok.** Дима Ткач (projenin en erken yapımcılarından biri), iki varyant tarif eder — kompakt biri ve "daha eğlenceli görünen" biri — ikisi de **150 W** yükte **~70 °C**'ye ulaşır, her biri ~210 g / ~170 g plastik, türbülanslı hava akışında PSU soğuk kalır ([src](https://t.me/c/2424231195/10743)). Onun kararı: *"bu gerçekten bir kasa değil, daha çok bir soğutma kılıfı, ama hiçbir şeyin kesilmesi gerekmiyor, hepsi çok sıkı bir uyumda tutuyor, yarılar karşıt taraflardan geçiriliyor."*

- **Dosyalar:** `BC-250-FanSleeves.3mf` ([src](https://t.me/c/2424231195/10766)), kart CAD'i `bc-250-body.step` ([src](https://t.me/c/2424231195/18266))
- **Kaynak depo:** [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) — sohbette en çok önerilen "doğrulanmış, yazdırılmış, çalıştığı onaylanmış" minimal tasarım ([src](https://t.me/c/2424231195/18260))
- **Fan:** 1× 120 mm
- **PSU:** herhangi biri — güç kablosu için bir delik/kesik vardır, böylece bir LOP *ya da* harici bir kaynak kullanabilirsiniz ([src](https://t.me/c/2424231195/22950))

---

## Katman 2 — Açık çerçeve / "kabuk" (kart sergide)

Kartı bir taraftan saran ve soğutucuyu görünür bırakan yarı-kasalar. Plastikte hafif, montajı kolay, iyi hava akışı.

### onemorecap "Shell Case" — referans build

Sohbette en çok değer-tepkisi alan kasa gönderisi (❤33): kartın üzerinde **"BC-250"** ve CU-ızgara deseni kabartmalı düz bir yan-plaka, üste kalıplanmış bir **taşıma kulpu**, ortada **açıkta inceltilmiş soğutucu kanatçıkları** ve sağ uca cıvatalanmış kendi kanalı içinde bir 120 mm **Arctic** fan. *"BC-250 SHELL CASE BY ONEMORECAP / ASRock × CMG"* işaretli ([src](https://t.me/c/2424231195/22771)). Eşleşen STL seti tek bir partide sohbete gönderildi ([src](https://t.me/c/2424231195/81672)) ve yazar, modellerin Printables ve MakerWorld'de bedava olduğunu doğruladı ([src](https://t.me/c/2424231195/24505)).

- **Dosyalar (sohbet partisi):** `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl`, artı aşağıdaki fan kanalları ([src](https://t.me/c/2424231195/81680))
- **Kaynak:** [GitHub onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case)
- **Fan:** 1× ya da 2× 120 mm (kanal üzerinden) ya da 1× 140 mm
- **PSU:** `Shell_Back_FLEX_ATX` arka paneli bir **Flex ATX** PSU için kesilmiştir

### Akrilik açık çerçeve (Владислав)

Açık bir **alüminyum-ve-akrilik** çerçeve: berrak yan panelli iki metal uç-plaka, dikey monte edilmiş kart, ortada inceltilmiş soğutucudan doğrudan üfleyen tek bir **Arctic 120 mm** fan ve alt yuvada oturan bir Flex/SFX PSU ([src](https://t.me/c/2424231195/114651)). Bu, daha sonra [r/BC250Gaming'e "akrilik kasa" olarak](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) çapraz gönderilen tasarımdır. Yazdırılmış braketler, yeniden ürettiğiniz parçalardır; çerçevenin kendisi lazer-kesim/hazırdır.

- **Fan:** 1× 120 mm (merkez) — bir arka plaka fanı eklemek için yer var
- **PSU:** alt yuvada Flex / SFX ATX

---

## Katman 3 — Konsol tarzı kutular (tamamen kapalı)

Bir oyun konsoluna ya da küçük bir NAS'a benzeyen kapalı muhafazalar. Daha fazla plastik ve daha fazla baskı süresi ama kulp, güç düğmesi, havalandırmalı paneller ve bazen bir ekranla bitmiş bir ürün.

### "Просто лучший корпус" (Jack Fisher × B1zon) — topluluk favorisi

Seçilmiş **#BC250body** etiketi altında *"basitçe en iyi kasa"* olarak gönderildi, bu, yayınlanmış bir malzeme listesi olan tamamen-bitmiş bir konsoldur: PSU, fanlar, konnektör, lastik ayaklar, güç düğmesi, vidalar + diş eklemeleri, bir fan PWM ayırıcısı, bir "Cyberpunk" çıkartması ve bir soğutucu-düzeltme tarağı. Bazı parçalar üretim dışıdır ve yedekleri vardır ([src](https://t.me/c/2424231195/79990)). Tasarım atfı B1zon'a, montaj Jack Fisher'a.

- **Dosyalar:** `BC250 korpus исправленный.rar` ("BC250 kasa, düzeltilmiş") ([src](https://t.me/c/2424231195/79989))
- **Fan:** 120 mm (ön) + ikinci bir fan için PWM ayırıcısı
- **PSU:** dahili (LOP-sınıfı)

### Üçlü-"GPU" ön (Гослинг)

Ön paneli **sahte bir ekran-kartı kanalı** olan bir konsol kutusu — RGB'li bir sırada üç dairesel fan kesiği, böylece makine ayrık bir GPU gibi görünür. BC-250'de **Bazzite 42** çalıştırırken gösterildi ([src](https://t.me/c/2424231195/66616)). Üç açıklık, tek çalışan fan artı girişin üzerinde kozmetiktir.

### Labirent-panelli beyaz konsol (Jhonatan)

Çarpıcı bir **labirent/devre-deseni havalandırmalı yan paneli**, aydınlatmalı (yeşil) bir metal güç düğmesi ve ön yüzde tam-yükseklikte bir giriş ızgarası olan uzun beyaz bir kutu — sohbetteki daha cilalı estetiklerden biri ([src](https://t.me/c/2424231195/121274)).

### Izgara-mesh mini-kule (Joglik)

Yanında ve üstünde yoğun **kare-ızgara mesh**, üst kenarda bir yuva/kulp çentiği ve alt arkada yuvarlak bir kablo geçişi olan gri dikey bir mini-kule. Temiz endüstriyel görünüm ([src](https://t.me/c/2424231195/126525)).

### Oval-pencereli hi-fi kutusu (a m)

Bir hi-fi/mikrodalga önü gibi tasarlanmış beyaz dikdörtgen bir kasa: dairesel bir mesh ardında fanın görünür olduğu büyük bir **stadyum-şekilli mesh pencere**, iki dikey mesh yuvasıyla çevrili ([src](https://t.me/c/2424231195/52955)). Yazarın sonraki iterasyonu, köpük PVC yerine "düzgün plastiğe" doğru ilerler ve harici XT-serisi güç ve RGB ekler ([src](https://t.me/c/2424231195/128048)).

### Kompakt konsol (Volodymyr Spyrydonov, "v15")

Mesh yan girişi olan küçük gümüş-siyah bir konsol kutusu ve cyberpunk-tarzı bir amblem ile bir RGB şerit taşıyan koyu bir ön, bir oturma-odası makinesi olarak bir TV'nin yanında otururken gösterildi ([src](https://t.me/c/2424231195/135995)). Uzun bir revizyon serisinin parçası (v15/v19/v20 kaynak görselleri erken paylaşıldı).

### BC250 Vented Edition (MaelremremDotXYZ)

**Fins-open** çalışan, **2145 MHz / 1.1 V'ta ~67 °C** tutan, arka bir PSU kapatma anahtarı olan minimalist bir **FlexATX** konsol. [MakerWorld 2899020](https://makerworld.com/en/models/2899020).

### Stellar 250 (isaacalvex)

Tam bir **build rehberi** olan, kendi kendine yeten bir konsol: dahili depolama, **WiFi 6** ve bir **ESP32 sıcaklık ekranı**. [GitHub isaacalvex/AMD-BC-250-Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide).

### ASRock AMD BC-250 için Basit Kasa

[YouTube'daki Ukraynaca build anlatımının](https://youtu.be/p5Zd86vFe8w) yazarı tarafından yayınlanan, adıyla anılan, herkese açık şekilde indirilebilir bir konsol muhafazası — çok-parçalı karmaşıklık olmadan bitmiş bir baskı isteyenler için sade kapalı bir kutu. [MakerWorld 2870270](https://makerworld.com/en/models/2870270).

---

## Katman 4 — Büyük build'ler: ATX PSU, AIO sıvı, ekranlar

Tam boyutlu bir PSU, sıvı soğutma ya da entegre bir ekran isteyenler için.

### NexGen3D "DIY Steam Machine" ailesi

Toplulukta **en çok işaret edilen 3D projesi** (7× yeniden gönderildi). Printables'ta bir konsol kasası ailesi, bir **sıvı-soğutmalı "Pro"** varyantı ve önde bir **dahili 1080×480 Pi ekranı** sığdıran bir **"Redux"** sürümü dahil ([Reddit build'i](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)). Yongaya 120 mm bir all-in-one sıvı soğutucu koymak için özel bir **AIO montaj** modeli var.

- [Printables 1499974 — DIY Steam Machine (taban)](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite)
- [Printables 1614131 — Pro Sıvı-Soğutmalı](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) · [Printables 1649679 — Redux](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) · [Printables 1554003 — AIO montaj](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250)
- **Fan/soğutma:** varyanta göre 120 mm hava **ya da** 120 mm AIO
- **PSU:** LOP sürümü ve ATX sürümleri belgelenmiştir

### "Steam Machine Pro" sıvı-soğutmalı referans build (Old Lamer)

Videoda baştan sona belgelenmiş, üst düzey, tamamen sıvı-soğutmalı bir build — bir AIO makinesine her şeyinizi yatırıyorsanız bir parça alışveriş listesi olarak yararlı ([Old Lamer](https://youtu.be/afYhUQFa-AY)). Yayınlanmış BOM:

- **AIO:** yongada TEUCER AF 240 (240 mm all-in-one)
- **PSU:** Mean Well **LOP-600-12** (ya da daha küçük seçenek olarak **LOP-500-12**) — bkz. [Güç Kaynağı](03-power-supply.md)
- **Fanlar:** 2× Arctic **P12 Pro** + 1× Arctic **P8**
- **Uzaktan güç:** makineyi uzaktan açıp kapamak için bir **ESP32 röle kartı**
- **Yazılım:** AIO pompasını ve fanları sürmek için Linux altında **OpenLinkHub** / **Commander Duo**

---

### Steam Cube — parametrik dikey kasa, su-soğutmalı (geliştirme aşamasında)

**Xbox Series X** form faktöründe, **su-soğutma-öncelikli** tasarlanmış, değiştirilebilir bir soğuk-taraflı **tamamen parametrik** dikey bir kasa: bir su bloğu, bir **Thermalright AXP90-X47 Tam-Bakır** ya da tek bir **Arctic P12 Max**, hepsi aynı montaja cıvatalanır. **Sol Diego'nun "Xbox Serie X BC-250 Edition"** taslağından ([Printables 1748271](https://www.printables.com/model/1748271)) ve hassas **torassk kart modelinden** ([Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)) doğdu, sonra her boyutun, sabit bir mesh değil, yeniden-uyduğunuz bir değişken olması için kod (build123d) olarak yeniden çizildi.

**Zarf ve ardındaki muhakeme** (doğrulanmış kart boyutundan ve [Soğutma](04-cooling.md)'daki termal hedeflerden türetildi):

- **~180 × 212 × 380 mm** dikey kule — bir **240 mm radyatörü dikey olarak** kartın yanında durduracak kadar uzun (~277 mm'lik bir rad montajı 380 mm yükseklik içine sığar).
- **Baca hava akışı** — alçakta 120 mm giriş, yüksekte 120 mm egzoz, böylece ısı düz yukarı çıkar.
- **Aktif arka plaka zorunludur, isteğe bağlı değil** — GDDR6 / VRM tarafının sıcaklık sensörü [yoktur](04-cooling.md), dolayısıyla tasarım, arka soğutmayı gerekli bir parça olarak ele alır.
- **Soğutma hedefleri** (tasarım amaçları, ölçülmüş sonuçlar **değil**): su yongası 40 CU'da sürekli < 60 °C; AXP90 < 75 °C @ 2000 MHz; P12 tabanı ~73–78 °C.

> ⚠️ **Durum: tasarım konsepti, doğrulanmış bir baskı değil.** Mevcut CAD, bir **parametrik uzamsal modeldir** — parçalar doğru şekilde boyutlandırılmış, yönlendirilmiş ve yerleştirilmiştir ve 8 STL + bir STEP dışa aktarır — ama **yazdırılmamış**, monte edilmemiş ya da termal olarak test edilmemiştir ve su bloğu, ölçülmüş bir yonga konumundan ziyade kartın sınırlayıcı kutusundan yerleştirilmiştir. Onu bitmiş bir kasa değil, **fork edilecek bir başlangıç CAD'i** olarak ele alın; gerçek baskı / uyum / termal doğrulama açık bir sonraki adımdır. Yukarıdaki hedefler, kıyaslamalar değil, amaçlardır.

---

### ATX-PSU kasaları (Victor L., V\ad, sunucu-PSU v3/v4)

Tam bir **ATX** güç kaynağı için: tam bir ATX PSU etrafında inşa edilmiş bir kasa ([src](https://t.me/c/2424231195/119293), MakerWorld'e gidiyor), daha erken bir ilk-defa Blender prototipi ([src](https://t.me/c/2424231195/105570)) ve HDD ve USB-hub hükümleriyle Printables/MakerWorld'de yayınlanmış bir **HP/sunucu-PSU** serisi.

- [Printables 1580750 — Kasa v3, HP sunucu PSU + HDD + USB hub](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) · [MakerWorld 2481620 — Kasa v4, FlexATX & HP-sunucu PSU](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) · [Printables 1550729 — ATX-PSU Bazzite Box](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box)

### Çift-120 build'ler (bellek + PSU soğutma)

**İki 120 mm fan** taşıyan yeniden tasarlanmış bir montaj plakası — biri, kartın tasarımcısının amaçladığı gibi arka plakaya (bellek) yönlendirilmiş, ikincisi PSU'yu besliyor. Önde Lian Li P28 fanları + bir Thermalright C12015 ile yazar, tek bir ön fanın yeterli olmadığı yerde **oyunlarda 80 °C'de 2200 MHz** tutar ([src](https://t.me/c/2424231195/120606)). Bunun için bağımsız bir **`Twin_120mm_Fan_Shroud.stl`** paylaşılır ([src](https://t.me/c/2424231195/121684)).

### The Lanboy — taşınabilir arcade / öğle yemeği kutusu

Taşınabilir bir öğle-yemeği-kutusu-arcade build'i: bir **eDisplayPort adaptör kartı** ([AliExpress](https://www.aliexpress.com/item/1005006351527252.html)) üzerinden bir **16″ dizüstü eDP paneli (1920×1200 @ 165 Hz)** sürer, bir USB amfide 2× 2″ hoparlör, hepsi tek bir **12 V ATX breakout**'tan beslenir. [Printables 1746364](https://www.printables.com/model/1746364). eDP-adaptör numarası, **herhangi** bir dizüstü-paneli build'i için yeniden kullanılabilir.

### BC250-HUD (Bloodyly) — dahili durum ekranı

Bir **Raspberry Pi Zero 2 için Qt5/C++ durum-ekranı uygulaması** (NexGen3D Redux gibi build'lerde kullanılır): **USB gadget modu üzerinden 60 FPS**, MangoHud'dan FPS/frametime okur, uykuda ekranı karartmak için fan voltajını algılar ve aksi takdirde Pi'yi donduran **vc4 çekirdek yamasını içerir**. Ekran: **8,8″ 1920×480 IPS** (Hannstar HSD088IPW1-A). [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD).

---

## Adaptörler ve montajlar (tam kasalar değil)

Tek bir sorunu çözen küçük yazdırılmış parçalar — genellikle karta bir soğutucu ya da fan monte etmek.

- **Fan kanalları** (bir fanı kanatçıklara sızdırmaz hâle getirir): `Fan_Shroud_Single_120mm.stl`, `Fan_Shroud_Dual_120mm.stl`, `Fan_Shroud_Single_120mm_Restricted.stl`, `Fan_Shroud_Single_140mm.stl` ([src](https://t.me/c/2424231195/81673)), `Twin_120mm_Fan_Shroud.stl` ([src](https://t.me/c/2424231195/121684)). Ayrıca [Soğutma](04-cooling.md) içinde kataloglanmıştır.
- **Arka plaka / bellek fanı montajları:** `Backplate.stl` + `backplane-top-fixed.stl` ([src](https://t.me/c/2424231195/133049)); `bottom_fan_mount.stl`, `top_fan_mount.stl`, `Front-Mount.stl`, `Back-Mount.stl` ([src](https://t.me/c/2424231195/131189))
- **AM4 soğutucu adaptörleri** (yongaya standart bir CPU soğutucusu cıvatalar): `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` ([src](https://t.me/c/2424231195/9949)). Ayrıca bkz. [Printables 1042228 — BC250→AMD CPU-soğutucu montajı](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount).
- **Genel ITX montajı** (majzok): bir çerçeveye oturan iki parça hâlinde yazdırır — BC-250'yi ona vidalayın, sonra çerçeveyi **standart ITX anakart deliklerine sahip herhangi bir kasaya** vidalayın (bir DeepCool CH170 PLUS'ta test edildi). "Genel ITX montajı yok" sorununu çözer. Yakalanmış kanonik Printables bağlantısı yok — Printables/MakerWorld'de **"BC-250 ITX Mount"** arayın.
- **Thermalright AXP90-X53 / AXP120-X67 adaptörü** (yongada düşük-profilli soğutucu): M3 dişleri gereken, soğutucu/CPU basıncına göre kalınlık varyantları olan yazdırılmış bir montaj — [Printables 1694793](https://www.printables.com/model/1694793). Ayrıca [Soğutma](04-cooling.md) içinde.
- **120 mm fan adaptörü:** `BC250_FanAdapter_120mm.step` ([src](https://t.me/c/2424231195/83135)), `cooler adapter v3.0 (1).stl` ([src](https://t.me/c/2424231195/111091))
- **Hassas kart modelleri** (kendi kasanızı bunlara karşı tasarlayın): [Printables 1341336 — hassas BC-250 kartı](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) ([src](https://t.me/c/2424231195/55496)), [Printables 1103626 — AMD BC250 kartı](https://www.printables.com/model/1103626-amd-bc250-board)

---

## Katalog tablosu

*(sohbet)* olarak işaretli dosyalar `assets/stl/` altında yansıtılmıştır; geri kalan her şey bağlantılı Printables / MakerWorld / GitHub sayfasından indirilir.

| Kasa / parça | Tür | STL / kaynak dosyalar | Fanlar | İndir |
|---|---|---|---|---|
| **onemorecap soğutma kılıfı** | minimal kılıf | `BC-250-FanSleeves.3mf` *(sohbet)* | 1× 120 | [GitHub onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) |
| **onemorecap Shell Case** ⭐ | açık kabuk | `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl` *(sohbet)* | 1–2× 120 / 1× 140 | [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [GitHub](https://github.com/onemorecap/bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case) |
| **Akrilik açık çerçeve** (Владислав) | açık çerçeve | yazdırılmış braketler *(sohbet #114651)* | 1× 120 | [Reddit konusu](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) |
| **"Просто лучший корпус"** (Jack Fisher × B1zon) | konsol | `BC250 korpus исправленный.rar` *(sohbet)* | 120 + PWM ayırıcı | [chat #79989](https://t.me/c/2424231195/79989) |
| **Flex PSU için Minimal kasa** | küçük kutu | `minimal-case-...-model_files.zip` *(sohbet)* | 1× 120 | [Printables 1423572](https://www.printables.com/model/1423572-minimal-case-for-bc250-and-flex-psu) |
| **forgenam kasası** | konsol | `forgenam-case-bc250-model_files.zip` *(sohbet)* | 1× 120 | [Printables 1375929](https://www.printables.com/model/1375929-forgenam-case-bc250) |
| **Minimalist 240** | konsol + kulp | `Minimalist 240 Front/Back/Handle.stl` *(sohbet)* | 120 | [chat #117404](https://t.me/c/2424231195/117404) |
| **M360** | konsol | `M360 Front.stl`, `M360 Back.stl` *(sohbet)* | 120 | [chat #126566](https://t.me/c/2424231195/126566) |
| **NexGen3D DIY Steam Machine** ⭐ | konsol | Printables dosyaları | 1× 120 | [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) |
| **NexGen3D Pro (sıvı)** | konsol + AIO | Printables dosyaları | 120 AIO | [Printables 1614131](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) |
| **NexGen3D Redux (+ekran)** | konsol + 1080×480 ekran | Printables dosyaları | 1× 120 | [Printables 1649679](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) |
| **NexGen3D AIO montaj** | adaptör | Printables dosyaları | 120 AIO | [Printables 1554003](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250) |
| **Kasa v3 — HP sunucu PSU** | konsol + HDD/USB | Printables dosyaları | 120 | [Printables 1580750](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) |
| **Kasa v4 — FlexATX / HP PSU** | konsol | MakerWorld dosyaları | 120 | [MakerWorld 2481620](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) |
| **ATX-PSU Bazzite Box** | tam-ATX kutu | Printables dosyaları | 120 | [Printables 1550729](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box) |
| **ivanov-innokentii kasası** | konsol | GitHub kaynakları | 120 | [GitHub ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) |
| **rLapchynski muhafazası** | muhafaza | GitHub kaynakları | 120 | [GitHub rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure) |
| **BC-250 Scooper** | kanal/kepçe | Printables dosyaları | 120 | [Printables 1282906](https://www.printables.com/model/1282906-bc-250-scooper) |
| **Pitman kasası** | konsol | Printables dosyaları | 120 | [Printables 1570248](https://www.printables.com/model/1570248-amd-bc-250-pitman-case) |
| **Endüstriyel-tarz FlexATX** | konsol | `amd_bc_250_industrial_style_case...zip` *(sohbet)* | 120 (stok soğutucu yok) | [chat #144265](https://t.me/c/2424231195/144265) |
| **The Lanboy** | taşınabilir arcade + 16″ eDP ekran | Printables dosyaları | 12 V ATX breakout | [Printables 1746364](https://www.printables.com/model/1746364) |
| **BC250 Vented Edition** (MaelremremDotXYZ) | FlexATX konsol, fins-open | MakerWorld dosyaları | 120 | [MakerWorld 2899020](https://makerworld.com/en/models/2899020) |
| **Stellar 250** (isaacalvex) | konsol + build rehberi (WiFi6, ESP32) | GitHub rehberi | 120 | [GitHub isaacalvex/...Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide) |
| **ASRock AMD BC-250 için Basit Kasa** | konsol | MakerWorld dosyaları | 120 | [MakerWorld 2870270](https://makerworld.com/en/models/2870270) |
| **BC250-HUD** (Bloodyly) | dahili Pi Zero 2 durum ekranı | GitHub kaynakları | — | [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD) |
| **Genel ITX montajı** (majzok) | adaptör (herhangi ITX kasası) | Printables/MakerWorld'de ara | — | "BC-250 ITX Mount" |
| **Thermalright AXP90/AXP120 montajı** | düşük-profilli soğutucu adaptörü | Printables dosyaları | düşük-profilli kule | [Printables 1694793](https://www.printables.com/model/1694793) |
| **Çift-120 montaj plakası** | adaptör plaka | `Twin_120mm_Fan_Shroud.stl` *(sohbet)* | 2× 120 | [chat #121684](https://t.me/c/2424231195/121684) |
| **Fan kanalları (120/140)** | kanal | `Fan_Shroud_Single_120mm.stl`, `_Dual_120mm`, `_Single_140mm`, `_120mm_Restricted` *(sohbet)* | 120 / 140 | [Printables 1339540](https://www.printables.com/model/1339540-yet-another-bc-250-fan-shroud) · bkz. [Soğutma](04-cooling.md) |
| **AM4 soğutucu adaptörü** | montaj | `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` *(sohbet)* | kule/AIO | [Printables 1042228](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount) |
| **Hassas kart modeli** | referans CAD | `bc-250-body.step` *(sohbet)* | — | [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) |

⭐ = toplulukta en çok değer-tepkisi alan / en çok yeniden gönderilen.

### Daha fazla herkese açık tasarım (elektricM'in kataloğundan)

[elektricM'in 143-tasarımlık kataloğundan](https://elektricm.github.io/amd-bc250-docs/community/cases/) yukarıda listelenmeyen adıyla anılan, indirilebilir tasarımlar — etrafında inşa edildikleri PSU'ya göre gruplanmış. Yalnızca-Discord/WIP build'leri ve küçük resimler için tam kataloğa göz atın.

**MeanWell LOP (dahili PSU):**

| Kasa / parça | Dikkat çeken | İndir |
|---|---|---|
| **Steamboat Case** (yannichaboyer) | LOP-300 konsol | [MakerWorld 2431616](https://makerworld.com/en/models/2431616) |
| **Ultra-Thin Custom Case** (MrRoze) | ince LOP-300 | [Printables 1626501](https://www.printables.com/model/1626501) |
| **Internal PSU 2×140 mm** (Kacikor) | LOP-400, çift 140 | [Printables 1599644](https://www.printables.com/model/1599644) · [MakerWorld 2400574](https://makerworld.com/en/models/2400574) |
| **Push-Pull Internal 12V PSU** (penzoiders) | push-pull | [MakerWorld 2505974](https://makerworld.com/en/models/2505974) |
| **Shell Case + 40 mm SSD fanı** (Munkee915) | Shell remix, SSD soğutma | [Printables 1568074](https://www.printables.com/model/1568074) |
| **Noctua Push-Pull Mod** (Janjd) | Shell remix | [MakerWorld 2354123](https://makerworld.com/en/models/2354123) |

**MeanWell LRS/UHP (diğer yaygın sunucu brick'i):**

| Kasa / parça | Dikkat çeken | İndir |
|---|---|---|
| **LRS-350-12 PSU Case** (TARGZ) | LRS-350 kutu | [Printables 1543979](https://www.printables.com/model/1543979) |
| **BC250 slim case** (C4kew4lk) | UHP-350-12, ince | [Printables 1504664](https://www.printables.com/model/1504664) |

**FlexATX — Arthrimus "Console Style" ailesi** (tüm bir remix soyağacı; ince konsol bir topluluk klasiğidir):

| Kasa / parça | Dikkat çeken | İndir |
|---|---|---|
| **Console Style Case v1** (Arthrimus) | orijinal | [Thingiverse 7165679](https://www.thingiverse.com/thing:7165679) · [MakerWorld 2097988](https://makerworld.com/ko/models/2097988-bc250) |
| **Slim Console Style Case** (Arthrimus) | ince varyant | [Thingiverse 7172528](https://www.thingiverse.com/thing:7172528) |
| **Slim Console — çift-fan modu** (TKXXTH) | çift fan | [Thingiverse 7214884](https://www.thingiverse.com/thing:7214884) |
| **Slim Console — On/Off + Apevia** | güç anahtarı | [Thingiverse 7274042](https://www.thingiverse.com/thing:7274042) |

**FlexATX — diğer:**

| Kasa / parça | Dikkat çeken | İndir |
|---|---|---|
| **Minimal Case (Toolless)** (chriszf) | vidasız | [Printables 1423572](https://www.printables.com/model/1423572) |
| **Minimalist BC-250 Case** (SebastienGau/Gadget) | minimalist | [Printables 1581724](https://www.printables.com/model/1581724) |
| **ADT UT3G eGPU-Inspired** (R0mn) | eGPU görünümü | [Printables 1539301](https://www.printables.com/model/1539301) |
| **"Steam Machine" by MrLarva** | konsol | [Printables 1618501](https://www.printables.com/model/1618501) · [MakerWorld 2453965](https://makerworld.com/en/models/2453965) · [Thingiverse 7278235](https://www.thingiverse.com/thing:7278235) |
| **Steam Machine** (Pocket Adventures) | konsol | [MakerWorld 2350219](https://makerworld.com/en/models/2350219) |
| **Steam Machine Slim Console** (MTSquar3D) | ince + OC vRAM fan kiti | [MakerWorld 2232434](https://makerworld.com/en/models/2232434) · [Thingiverse 7271946](https://www.thingiverse.com/thing:7271946) |
| **ASRock Console Case** (songdawgdesigns) | konsol | [Printables 1617023](https://www.printables.com/model/1617023) · [Cults3D](https://cults3d.com/en/3d-model/gadget/asrock-amd-bc-250-console-case-steamos-bazzite-diy-steam-machine-style-build) |
| **AMD BC250 Case** (vitamins) | konsol | [MakerWorld 2219947](https://makerworld.com/en/models/2219947) |
| **E-waste Steam Machine** (Pesen333) | kurtarma build'i | [Thingiverse 7245584](https://www.thingiverse.com/thing:7245584) |

**Tam ATX:**

| Kasa / parça | Dikkat çeken | İndir |
|---|---|---|
| **Case for Standard ATX** (CatSiewDai) | ATX kutu | [Printables 1553599](https://www.printables.com/model/1553599) |
| **ATX + Fan Duct** (ZMASLO) | kanallı | [Printables 1616167](https://www.printables.com/model/1616167) |
| **Dual Fan ATX Case** (Mateo Fdez) | çift fan | [Printables 1579658](https://www.printables.com/model/1579658) |
| **Simple Wooden Case** (suvalle55) | ahşap + ATX | [Printables 1595794](https://www.printables.com/model/1595794) |
| **Open Frame + IKEA hack** (GreatApo) | açık çerçeve | [Thingiverse 7314188](https://www.thingiverse.com/thing:7314188) |
| **Case for ATX PSU** (matmiak) | ATX kutu | [Thingiverse 7303096](https://www.thingiverse.com/thing:7303096) |

**TFX / VESA / hazır:**

| Kasa / parça | Dikkat çeken | İndir |
|---|---|---|
| **Case Remix for TFX** (PlayNation) | TFX-400 PSU | [MakerWorld 2387157](https://makerworld.com/en/models/2387157) |
| **VESA 100/75 Basket** (Oleksii) | bir monitörün arkasına monte | [MakerWorld 1844470](https://makerworld.com/en/models/1844470) |
| **3.9L MKII FlexATX + PS5 fanı** (FitFormSolutions) | bitmiş bir kit satın al | [Etsy](https://www.etsy.com/listing/4405362103/) · [eBay](https://www.ebay.com/itm/127460591552) |
| **Shiny Snake S400** (10,8 L mesh ITX) | bilinen-iyi hazır host (BC-250→AM4 montaj + PSU yuvasında H60 AIO + özel ATX I/O kalkanı) | [AliExpress](https://a.aliexpress.com/_EyQdoBU) |
| **SFX-PSU minimalist kasa** (Methsman) | tam SFX PSU, mıknatıs paneller, USB hub, AXP120 + Noctua 120 — *dosyalar WIP / henüz yayınlanmadı* | — |
| **Cults3D ATX/sunucu serisi** (KABANCHYK, lumstudio, kapa3D) | ücretli STL'ler | [Cults3D — bc-250](https://cults3d.com/en/3d-model/gadget/bc-250-atx-case) |

---

## Yazıcı yok mu? İnsanların kullandığı seçenekler

- **Bir baskı satın alın.** Satıcılar [Etsy](https://www.etsy.com/listing/1904632447/), eBay ve OLX'te var; insanlar ayrıca sohbet içinde kasa yazdırmayı/satmayı önerdi ([src](https://t.me/c/2424231195/55507)).
- **İstek-üzerine-baskı:** bir servise bir STL yükleyin. Sohbetteki yapımcılar baskı çiftlikleri çalıştırır (biri bir Flsun/Creality/Bambu yazıcı duvarı gösteriyor, [src](https://t.me/c/2424231195/73481)).
- **Hiç kasa yok / yeniden kullanım.** Birçoğu kartı test ederken açık bir tezgahta çalıştırır. Diğerleri mevcut donanımı boşaltır: kart implante edilmiş ve bir blower olan eski bir all-in-one PC ([src](https://t.me/c/2424231195/30914)), bir havalandırma-kanalı kutusu ([src](https://t.me/c/2424231195/64265)) ya da alüminyum amfi muhafazaları (eğeleme/delme gerektirir, [src](https://t.me/c/2424231195/108907)). Bir üye, şaka olarak kartı eski bir VHS oynatıcının içine bile sakladı ([src](https://t.me/c/2424231195/84106)). **Xbox One kabuğu** (JoeyDepDollas): bozuk bir Xbox One'ı boşaltın ve içine tam bir BC-250 build'i sığdırın — CPU ve GPU'yu yük altında **60 °C'nin altında** tutar; bozuk donör konsollar eBay'de **kargo dahil ~15 $** ve yeniden kullanılabilir parçalar verir.
- **Lazer-kesim kontrplak** (ContributionRich3242): 3D-yazdırılmış değil — köşeler etrafında kerf-bükümlü kontrplak, ekstra soğutma için geniş bir arka alanla, **40 CU'da 75 °C**'ye ulaşır (1800 MHz, CPU 3,9 GHz) ve fısıltı kadar sessiz. (Lazer dosyaları yayınlanmadı.) **Arka plaka-soğutma tekniği** herhangi bir kasada yeniden kullanılabilir: termal macun yonga→arka plaka, macun arka plaka→arka soğutucular ve arka soğutucuları VRM boşluğunda sıkı R-tipi gupilyalarla + Kapton bantla sabitleyin (40 CU'da ~20 °C daha soğuk).

> Çıplak, iyi soğutulmuş bir kart, kötü hava akışlı kapalı şık bir kutuyu geride bırakır. Önce [Soğutma](04-cooling.md)'yı doğru yapın; kasa ikinci adımdır.

---

## Kaynaklar

- Seçilmiş **#BC250body** vitrini (günde bir iyi build) — sabitlenmiş fikir [src](https://t.me/c/2424231195/79685)
- Minimal kılıf, iki varyant — [src](https://t.me/c/2424231195/10743) · modeller [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) üzerinde [src](https://t.me/c/2424231195/18260)
- Shell Case (❤33) — [src](https://t.me/c/2424231195/22771) · Printables/MakerWorld'de bedava [src](https://t.me/c/2424231195/24505) · STL partisi [src](https://t.me/c/2424231195/81680)
- "Просто лучший корпус" + BOM — [src](https://t.me/c/2424231195/79990) · dosyalar [src](https://t.me/c/2424231195/79989)
- Akrilik açık çerçeve — [src](https://t.me/c/2424231195/114651) · [Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/)
- Çift-120 montaj plakası, 2200 MHz @ 80 °C — [src](https://t.me/c/2424231195/120606) · kanal [src](https://t.me/c/2424231195/121684)
- Konsol tasarımları (fotoğraflar) — Гослинг/Bazzite [src](https://t.me/c/2424231195/66616) · Jhonatan labirent paneli [src](https://t.me/c/2424231195/121274) · Joglik ızgara mesh [src](https://t.me/c/2424231195/126525) · a m oval pencere [src](https://t.me/c/2424231195/52955) · Spyrydonov v15 [src](https://t.me/c/2424231195/135995)
- NexGen3D Steam Machine ailesi — [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) · [Redux + Pi ekranı (Reddit)](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)
- Kart referans modeli — [src](https://t.me/c/2424231195/55496) · [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)
- GitHub kasa depoları — [onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) · [rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure)
- **elektricM tam kasa kataloğu (~143 tasarım, aranabilir/filtrelenebilir)** — [elektricm.github.io/amd-bc250-docs/community/cases](https://elektricm.github.io/amd-bc250-docs/community/cases/)
- Basit Kasa (MakerWorld 2870270) + Ukraynaca build anlatımı — [MakerWorld 2870270](https://makerworld.com/en/models/2870270) · [Old Lamer (YouTube)](https://youtu.be/p5Zd86vFe8w)
- CMOS-temizleme erişim-deliği lifehack'i — [4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980)
- "Steam Machine Pro" sıvı-soğutmalı build BOM'u (TEUCER AF 240, Mean Well LOP-600-12, Arctic P12 Pro/P8, ESP32 röle, OpenLinkHub/Commander Duo) — [Old Lamer (YouTube)](https://youtu.be/afYhUQFa-AY)

> Fan-kanalı STL'leri [Soğutma](04-cooling.md) ile paylaşılır. Tüm sohbet-barındırmalı STL/STEP/3MF dosyaları `assets/stl/` altında yansıtılmıştır.
