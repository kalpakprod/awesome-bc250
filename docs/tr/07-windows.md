> 🌐 Topluluk çevirisi. İngilizce sürüm asıl kaynaktır ve daha güncel olabilir. Hata mı buldunuz? Bir [issue açın](https://github.com/lildebil0/awesome-bc250/issues). ([İngilizce orijinali](../en/07-windows.md))

# Windows Sürücüleri ve Kurulum

> **Özet** — **2026 başı itibarıyla BC-250 için çalışan bir Windows GPU sürücüsü yoktur.** Windows kurulur ve önyükler ama GPU **Code 43** ile ve sıfır 3D ivmelendirmeyle oturur — her hazır AMD sürücüsü (Adrenalin, Pro, W5700 `.inf` numarası) donanım tarafından reddedilir. Topluluk **sıfırdan birini tersine mühendislikle inşa ediyor** ve dürüst durum "erken tesisat çalışıyor, henüz hiçbir şey oyun render etmiyor." Bu kartı bugün gerçekten *kullanmak* istiyorsanız, **Linux kurun** ([06-linux.md](06-linux.md)) — çalışan sürücünün yaşadığı yer orasıdır. Bu sayfadaki her şeye şüpheyle yaklaşın ve güvenmeden önce depo commit tarihlerini kontrol edin.

Uzun süredir devam eden topluluk hükmü, 2025'ten beri yeni gelenler için sabitlenmiş: *"Buraya giren herkes, tüm umudunu bırak. Windows sürücüleri %99,5 olasılıkla olmayacak. Bir sürücü olmadan bu kart neredeyse tamamen işe yaramaz. Linux sürücüsü var — o işletim sistemine hazır değilseniz, bu karta ihtiyacınız yok."* ([src](https://t.me/c/2424231195/28109))

Bu, bir yıldan fazla süre fikir birliğiydi. 2026'da **nihayet meydan okunuyor** — ama yavaşça ve dürüst cevap hâlâ: henüz değil.

---

## Windows neden burada zor (Code 43 duvarı)

BC-250 APU'su ("Cyan Skillfish" / Oberon, GFX10.1.3), kendisini işletim sistemine, hiçbir hazır AMD sürücüsünün tanımadığı bir **bilinmeyen cihaz** olarak sunar — PCI ID `1002:13FE`. İnsanlar her şeyi denedi:

- **Device Manager'a resmi bir `.inf` zorla yedirmek**: Windows'un "uyumlu" olarak sunduğu tek sürücü **Radeon Pro W5700**'dür. Kurulur, sonra denenmiş her sürücü gibi **Error 43**'te asılı kalır. ([src](https://t.me/c/2424231195/57123))
- **`.inf`'i düzenlemek / cihaz ID'lerini değiştirmek** (gfx1013, 1014, Navi 21/22/23 "Dragonball", eski girişler), sürücü imza zorlamasını devre dışı bırakmak, hatta USB'den Windows 10 önyükleyip bir Steam Deck sürücüsü denemek — **hepsi çıkmaz sokak**. Eski girişler bir hata olmadan görünür yalnızca çalıştıkları için değil, bir ekran hatası nedeniyle. ([src](https://t.me/c/2424231195/94029))
- **Cihaz ID'sini değiştirmek için BIOS'u modlamak** da yardımcı olmadı — iGPU hâlâ `1002:13FE` bildiriyor. Dev ID, yalnızca BIOS'a değil, **APU'ya kaynaklanmış** gibi görünüyor, dolayısıyla tek bir konumu yamalamak yeterli değil. ([src](https://t.me/c/2424231195/57123))

Neden Linux çalışıyor ve Windows çalışmıyor? Linux'ta, açık kaynak **amdgpu/Mesa** yığını, bu tam çipi tanımak için topluluk tarafından yamalandı (ve kısmen upstream'e alındı); Windows'ta yamalanacak açık bir sürücü yok — AMD bu madencilik/sunucu parçası için hiçbir zaman bir Windows sürücüsü göndermedi ve kapalı Adrenalin/Pro yığını bilinmeyen ID'yi reddediyor. ([src](https://t.me/c/2424231195/13210)) AMD'nin "BC-250 sürücüleri" hakkındaki kendi forum konusu hiçbir yere varmadı. ([community.amd.com](https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692))

> **Bir GPU passthrough kaçış kapısı da yok.** BC-250 passthrough edilmiş bir VM'de Windows çalıştırmak işe yaramaz: IOMMU passthrough yolu bu kartta bozuk ve bu bir *APU* (host'un temiz şekilde devredebileceği ayrık bir kart değil) ve çip en baştan bilinmeyen bir cihaz olarak yanlış algılanıyor. ([src](https://t.me/c/2424231195/64772))

---

## Mevcut sürücü durumu — gerçekte ne var (2026 başı itibarıyla)

2025 sonunda topluluk AMD'yi beklemeyi bıraktı ve donanımı tersine mühendislikle **sıfırdan bir Windows sürücüsü inşa etmeye** başladı. İki çaba önemli; ikisi de **deneysel, WIP ve henüz oyun render etmiyor.**

### Keshas-dev — sıfırdan WDDM sürücüsü (en aktif)

Bir çift tamamlayıcı çekirdek-modu sürücüsü, en aktif geliştirilen Windows çabası (bu yazı itibarıyla **yalnızca PSP sürücüsünün ~56 commit'i var**):

- **[Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver)** — **PSP** (Platform Security Processor) için düşük-seviyeli bir sürücü. **Çalışan:** yüklenir, **SOS firmware'ini** önyükler, BAR5 MMIO üzerinden donanım register'larını okur/yazar (GC, MMHUB, HDP, NBIO, DF blokları), NBIO açmasını yapar ve GPU sürücüsü için bir register proxy'si gibi davranır. **Çalışmayan:** GPCOM ring oluşturma (SOS firmware'i TOS ring protokolünü desteklemez), ring buffer üzerinden GPU-firmware yükleme ve Trusted Memory Region init. Başka bir deyişle: çiple konuşabilir ama **grafik motorunu henüz kaldıramaz.** ([repo](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver/commits/main/))
- **[Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver)** — tamamlayıcı GPU sürücüsü. PSP sürücüsüyle aynı sertifika/test-imzalama altyapısını paylaşır ve onu bir register köprüsü olarak kullanır. Hâlâ erken; kullanılabilir 3D çıkışı yok. ([repo](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver/commits/main/))

İlk genel yaşam işareti, Ekim 2025'te bir üyenin **"ilk çalışan sürücüm (OpenGL 1.1)"** bildirmesiydi ([src](https://t.me/c/2424231195/83320)) — tam olarak kutlanmıştı çünkü zar zor işlevsel bir sürücünün bile *kurulup çalışması*, bir yıllık Code 43'ten sonra gerçek bir kilometre taşıydı: *"bu sürücü gerçekten kurulduysa ve çalışıyorsa (kötü de olsa) — bu çok büyük bir adım."* ([src](https://t.me/c/2424231195/83332)) O dalgadan bir sürücü dökümü, `AMD Radeon BC-250 (Cyan Skillfish) driver 00.00.01.7z`, sohbette paylaşıldı/sabitlendi. ([src](https://t.me/c/2424231195/83322)) **Böyle erken bir dökümü deneysel olarak ele alın — sürüm `00.00.01` tam olarak kulağa geldiği kadar hamdır.**

### ZEROAESQUERDA — WDDM 2.0 referans uygulaması

**[ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest)** — ayrı bir çaba ("Portekizli adam bir şeye başladı"), buzun kırıldığının bir işareti olarak Mart 2026'da sohbette sabitlendi. ([src](https://t.me/c/2424231195/123644)) En iyi, kullanılabilir bir sürücü değil, bir **referans/eğitim WDDM 2.0 uygulaması** olarak anlaşılır:

- Yalnızca **Direct3D 9 DDI**'yı uygular; **D3D11, D3D12 ve Vulkan uygulanmamıştır.**
- **RDNA2 (GFX10.1 ISA) için shader derlemesi işlevsel değildir** — shader gönderimlerini kabul eder ama onları gerçek donanım için derleyemez, dolayısıyla hiçbir şey render etmez.
- Command Processor mikrokodunu **yüklemez** (BIOS-yüklü firmware'e dayanır); **VCN video kodlama/kod çözme desteklenmez**; yalnızca tek DisplayPort çıkışı.
- **Test-imzalama modu** gerektirir (WHQL imzası yok). main'de yalnızca ~2 commit.

Zaman harcamadan önce projenin kendi **[Bilinen Sınırlamalar](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas)** bölümüne bakın.

> ⚠ **Depo-adlandırma düzeltmesi.** Ana depo listesi, "Drivers → Windows" altında `ZEROAESQUERDA/PS5GPU-BC250`'yi işaret eder. İncelendiğinde o depo bir **Linux GPU governor**'dır (bir GUI'li Oberon-governor fork'u), bir Windows sürücüsü **değil**. Bu yazarın gerçek Windows kodu **`BC250-windowsDriverTest`**'tir.

### Bir bakışta durum

| Proje | Tür | Çalışan | Çalışmayan | Bugün kullan? |
|---|---|---|---|---|
| Keshas-dev/AMD-BC-250-PSP-Driver | PSP çekirdek sürücüsü (WIP) | SOS firmware'i önyükler, BAR5 register R/W, NBIO açma, register proxy | GPU ring oluşturma, FW yükleme, TMR init | Hayır — yalnızca tesisat |
| Keshas-dev/AMD-BC-250-Windows-Driver | GPU sürücüsü (WIP) | PSP sürücüsünün yanında yüklenir | Kullanılabilir 3D yok | Hayır |
| ZEROAESQUERDA/BC250-windowsDriverTest | WDDM 2.0 referansı | Sürücü modeli iskeleti, D3D9 DDI mevcut | Shader derleme, D3D11/12, Vulkan, VCN | Hayır — eğitim amaçlı |
| Adrenalin / Pro / W5700 `.inf` | Resmi AMD | — | **Code 43**, hiçbir şey | Hayır |

**Sonuç:** bugün hiç kimse BC-250'de Windows'ta oyun oynamıyor. İş gerçek ve hızlanıyor ama "GPU'yu hiç başlatabilir miyiz" aşamasında, "Cyberpunk FPS'im nedir" aşamasında değil.

---

## Yine de WIP sürücüleri denemek isterseniz

Bu, çalışan bir masaüstü elde etmek için değil, **test etmeye yardım etmek** isteyen kurcalayıcılar içindir. İhtiyacınız olacaklar:

- **Windows 10 (build 1607+) ya da Windows 11, x64.**
- **Test imzalama etkin** ve **Secure Boot devre dışı** (bu sürücüler imzasız/test-imzalı):
  ```
  bcdedit /set testsigning on
  ```
  Yeniden başlatın. ⚠ doğrulayın — kesin adımlar her deponun README'sini izler; buradaki komutlar standart WDK test-imzalama akışıdır, bir proje scriptinden kopyalanmamıştır.
- Deponun sağladığı **PowerShell scripti** (örn. `Install-Driver.ps1`) üzerinden ya da elle `pnputil` ile kurun. Bu sayfayı değil, **depo README'sini** izleyin — bu projeler hızlı değişir ve kurulum adımları onlarla birlikte hareket eder.

Bekleyin: en iyi ihtimalle cihaz numaralandırılır ve erken init logları belirir; en kötüsünde hiçbir şey değişmez ya da farklı bir hata kodu alırsınız. **Önemsediğiniz her şeyi yedekleyin ve render etmeyeceğini varsayın.**

### ⚠ Doğrulanmamış söylenti: "sürücü sızdırmak kartı tuğlaya çevirir"

2025 başı beta-test aşamasında, bir üye, ön-sürüm sürücüleri sızdırdıkları için **BC-250'lerin uzaktan tuğlaya çevrildiğini** uyardı — tuğlaya çevirme, uzaktan cihaz engelleri ve bir donanım programcısının bile onları açamadığına dair Reddit raporları olduğunu iddia etti. ([src](https://t.me/c/2424231195/26231)) **Bunu doğrulayamadık** ve etrafındaki tüm "özel beta" çerçevesi şüpheli (bkz. sonraki bölüm). Bütünlük için bahsedildi; onu yerleşik bir gerçek olarak ele almayın. Bir kartı ilgisiz nedenlerle tuğlaya çevirirseniz, kurtarma için bkz. [08-bios.md](08-bios.md).

---

## Aldatmacalar, şakalar ve çıkmaz sokaklar — bunlara kanmayın

BC-250'de Windows-sürücü hype'ının uzun bir **şaka ve hüsnükuruntu** geçmişi var. Bir hafta sonunu boşa harcamamak için ünlü olanları bilin:

- **"AMD BC-250 için NVIDIA sürücüsü."** Bir **1 Nisan Şakası (1 Nisan 2026)** — insanların kısa süre *"NVIDIA gerçekten bir BC-250 Windows sürücüsü mü çıkardı?!"* diye sormasına neden olan şık, sahte bir "NVIDIA NEW DRIVER RELEASE … for AMD BC-250" afişi. ([src](https://t.me/c/2424231195/130053)) Çıkarmadı. NVIDIA bir AMD APU'su için sürücü yapmaz. Sohbetteki tepki *"uzun beklenen şaka geldi"* oldu. ([src](https://t.me/c/2424231195/130727)) Ayrıca `whql-amd-software-adrenalin-edition-25.5.1-...-bc250.exe` gibi adlandırılmış bir `.exe`'nin dolaştığını unutmayın — dosya adına "bc250" eklenmiş normal bir Adrenalin yükleyicisi, onu bir BC-250 sürücüsü **yapmaz**. ([src](https://t.me/c/2424231195/73924))
- **"Sadece benzer bir kartın sürücüsünü zorla kur."** RX 6700 / W5700 / Radeon Pro V340 — her yeni gelenin ilk fikri ve *"BC-250 tutmuş her ahmağın"* aklına gelmiş. Yeniden türetmeye değmeyecek bir yığın nedenle çalışamaz: **BC-250'de Windows sürücüsü yok, onur yok ve bira yok.** ([src](https://t.me/c/2424231195/29710))
- **Kanaldaki kötü amaçlı yazılım.** İnsanlar virüs/zip-bomba/oltalama olan sahte "sürücüler" gönderdi. Modlar görür görmez banlar; bir dosya tam anlamıyla `Trojan.txt` adıyla bir kez belirdi. ([src](https://t.me/c/2424231195/49668)) **Yalnızca adı geçen GitHub depolarından ikili dosyalar çalıştırın ve kodu okuyun.**

---

## İnsanların bahsettiği 40-CU açma scriptine ne oldu?

`git clone https://github.com/duggasco/bc250-40cu-unlock.git`, Windows-konusu sohbetinde görünür ve ana kaynak listesi onu "Windows" altında bile etiketler. **Bu bir Linux `amdgpu` çekirdek yaması / scriptidir** (`bc250-enable-40cu.sh`), bir Windows aracı değil — Linux sürücüsünde tüm 40 CU'yu açar. [09-overclock-undervolt.md](09-overclock-undervolt.md) içinde düzgünce ele alınmıştır; Windows için hiçbir şey yapmaz. ⚠ doğrulayın (hiçbir Command-corpus kabuk geçmişi bir Windows kullanımını onaylamaz; yakalanan tek komut yukarıdaki sade `git clone`'dur).

---

## Öneri

| İsteğiniz… | Bunu yapın |
|---|---|
| Şimdi oyun oynamak / kartı gerçekten kullanmak | **Linux kurun.** Bkz. [06-linux.md](06-linux.md). Çalışan GPU sürücüsü yalnızca orada var. |
| Windows çabasını takip etmek / katkıda bulunmak | **Keshas-dev** (PSP + GPU sürücüsü) ve **ZEROAESQUERDA/BC250-windowsDriverTest**'i izleyin; oyun değil, çekirdek/WDK işi bekleyin. |
| Sihirli bir `.inf` ya da "benzer kart" sürücüsü | Öyle bir şey yok. Burada durun — yalnızca Code 43'e çarparsınız. |

Windows desteği **hareketli bir hedeftir**: harekete geçmeden önce depo commit tarihlerini ve bu bölümün tarihini (bu, **2026 başını** yansıtır) yeniden kontrol edin. 2025 hükmü "asla"ydı; 2026 bunu "henüz değil"e indirdi — gerçek ilerleme ama oynanabilir-masaüstü katmanında değil, firmware-init katmanında ilerleme.

---

## Kaynaklar

- Sabitlenmiş yeni gelen uyarısı ("tüm umudunu bırak") — https://t.me/c/2424231195/28109
- Code 43 / W5700 `.inf` / BIOS-mod denemeleri — https://t.me/c/2424231195/57123 · https://t.me/c/2424231195/94029
- "Windows sürücüsü yok, onur yok, bira yok" — https://t.me/c/2424231195/29710 · neden Windows değil Linux — https://t.me/c/2424231195/13210
- VM passthrough çalışmaz — https://t.me/c/2424231195/64772
- İlk "çalışan" sürücü (OpenGL 1.1) ve tepki — https://t.me/c/2424231195/83320 · https://t.me/c/2424231195/83332 · sürücü dökümü `00.00.01` — https://t.me/c/2424231195/83322
- ZEROAESQUERDA projesi sabitlendi / "buz kırılıyor" — https://t.me/c/2424231195/123644
- 1 Nisan "NVIDIA sürücüsü" — https://t.me/c/2424231195/130053 · https://t.me/c/2424231195/130727 · yanlış etiketlenmiş Adrenalin `.exe` — https://t.me/c/2424231195/73924
- Kötü amaçlı yazılım-ban politikası — https://t.me/c/2424231195/49668 · sızıntıda-tuğlaya-çevirme söylentisi (doğrulanmamış) — https://t.me/c/2424231195/26231
- Depolar — [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) · [Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver) · [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) ([bilinen sınırlamalar](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas))
- AMD forum konusu (hiçbir yere varmadı) — https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692
- 40-CU açma (Linux, yanlış-etiketli Windows) — https://github.com/duggasco/bc250-40cu-unlock → bkz. [09-overclock-undervolt.md](09-overclock-undervolt.md)

> 40-CU açma, governor ve Linux sürücü kurulumu [06-linux.md](06-linux.md) ve [09-overclock-undervolt.md](09-overclock-undervolt.md) içindedir. Tuğla kurtarma: [08-bios.md](08-bios.md).
