> 🌐 Topluluk çevirisi. İngilizce sürüm asıl kaynaktır ve daha güncel olabilir. Hata mı buldunuz? Bir [issue açın](https://github.com/lildebil0/awesome-bc250/issues). ([İngilizce orijinali](../en/13-macos.md))

# macOS / Hackintosh

> **Özet** — **Yapmayın.** macOS'u büyük olasılıkla BC-250'nin CPU'sunda önyükleyebilirsiniz (bu bir Zen 2 AMD yongasıdır ve genel AMD-OSX hackintosh hileleri geçerlidir), ama **GPU ivmelenmeyecek** ve bunu sağlamanın gerçekçi bir yolu yok. macOS, GPU'ları sabit kodlanmış aygıt kimliğine (device ID) göre destekler; BC-250'nin GPU'su (Cyan Skillfish / Oberon, kırpılmış bir PS5 parçası) için **karşısına koyup taklit edebileceğiniz, doğal olarak desteklenen bir masaüstü ikizi yoktur** ve Apple'ın yığını *hiçbir zaman* herhangi bir AMD APU'sunun tümleşik grafiğini sürecek hâle getirilmemiştir. Yani Metal'siz, yavaş, yazılımla render eden bir Mac elde edersiniz. 2026 itibarıyla toplulukta hiç kimse çalışan, ivmelendirilmiş bir sonuç bildirmedi. Bunun yerine Linux kullanın — bkz. [06-linux.md](06-linux.md).

Bu bir **niş merak konusudur**, gerçek bir kullanım senaryosu değil. Dürüst cevap, bölümün tamamıdır.

---

## GPU ivmelenmesi neden duvardır

Konudaki en çok tepki alan iki teknik gönderi de aynı sonuca varıyor ve mekanizmayı açıkça anlatıyorlar.

macOS'ta Linux gibi açık bir sürücü modeli yoktur. Belirli GPU'lara **aygıt kimliğine (device ID) göre** bağlanan kapalı sürücülerle gelir ve müdahale edebileceğiniz tek yer, işletim sistemi yüklenmeden *önce* **OpenCore** önyükleyicisidir — OpenCore, macOS'a önceden pişirilmiş veriyi teslim eder, kapalı sistemi içeriden yamalayamaz ([src](https://t.me/c/2424231195/103173)).

OpenCore bir GPU'nun aygıt kimliğini taklit *edebilir*, ama yalnızca **tek bir mimari aile içinde** — örneğin, desteklenmeyen bir RX 6950 XT'yi desteklenen bir RX 6900 XT olarak gösterebilir, çünkü bunlar *aynı* silikondur. Bu hile OpenCore geliştiricilerinin **bir yıldan fazla** zamanını aldı ve yalnızca o Navi kartları, Apple'ın zaten desteklediği kartlarla mimari olarak özdeş olduğu için işe yaradı ([src](https://t.me/c/2424231195/53321)).

BC-250 bunu iki açıdan bozuyor:

1. **Taklit edilecek ikiz yok.** GPU'su kırpılmış, PS5 türevi bir parçadır (`gfx1013`). **macOS'un doğal olarak desteklediği, aynı mimariye sahip bir masaüstü AMD kartı yoktur**, dolayısıyla kılığına girilecek bir şey de yoktur. BC-250'nin çalışması için Apple'ın yığınının bu aygıt kimliğini sıfırdan öğrenmesi gerekir — ki bu yalnızca OpenCore geliştiricileri yongayı üstlenirse olur ve bunun için ticari bir neden yok ([src](https://t.me/c/2424231195/53321)).
2. **Bu bir APU ve APU'lar hiç çalışmadı.** Desteklenen ayrık kartlarla bir mikromimariyi paylaşmalarına rağmen, masaüstü mimarisine sahip Ryzen tümleşik grafikleri (Vega / Navi iGPU'lar) bile macOS'ta **hiçbir zaman** ayağa kaldırılamadı. Yazar, macOS'ta bir Ryzen iGPU'sunun "çalışan tek bir örneğini bile görmedi" ([src](https://t.me/c/2424231195/103173)). BC-250 de aynı APU kovasındadır.

Aynı katkıcıdan dobra dobra özet: *bu yonganın Windows sürücüleri bile düzene sokulamamışken, macOS hayalini kurmaya değmez* ([src](https://t.me/c/2424231195/53321)). (Windows sürücü durumu için bkz. [07-windows.md](07-windows.md).)

---

## İnsanlar gerçekte ne denedi

- Biri, başlarda bir **macOS Monterey kurtarma + OpenCore** paketi hazırlayıp paylaştı (`Monterey recovery + OpenCore.zip`, ayrıca daha eski bir `Архив.zip`), yani en azından bir kişi onu kurmaya girişti ([src](https://t.me/c/2424231195/53590)). Geri dönüş olarak hiçbir zaman ivmelendirilmiş-GPU başarısı bildirilmedi.
- İnsanların işaret ettiği ilgili araçlar, standart AMD-hackintosh setidir: [RehabMan/OS-X-Fake-PCI-ID](https://github.com/RehabMan/OS-X-Fake-PCI-ID) ile aygıt kimliği sahteciliği, gerçekte neyin desteklendiğine dair [Dortania AMD GPU alıcı kılavuzu](https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series) ve — APU grafik desteğine en yakın şey olan — **[ChefKissInc/NootedRed](https://github.com/ChefKissInc/NootedRed)**, AMD APU iGPU'ları için bir kext. NootedRed, Vega/Renoir sınıfı APU'ları hedefler ve BC-250'nin yongasını **kapsamaz**, dolayısıyla bu kartı kurtarmaz.
- AMD Ryzen üzerinde [VMware/OpenCore aracılığıyla macOS çalıştırma](https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/) hakkındaki daha geç bir forum bağlantısı ([src](https://t.me/c/2424231195/107779)) **genel AMD hackintosh**'tur, BC-250'ye özgü değil — ve bir VM zaten GPU geçişi (passthrough)/Metal olmaması demektir.

> ⚠ **Şakaları sonuçlarla karıştırmayın.** Konuda hafif "harika, ulu hackintosh burada hüküm sürüyor" türü laflar ([src](https://t.me/c/2424231195/85166)) ve övgü tepkileri var, ama bunlar çalışan bir macOS kurulumunun raporu *değil*. Kanıtlardaki hiçbir şey, bir BC-250 üzerinde ivmelendirilmiş macOS göstermiyor.

---

## Peki buna değer mi?

**Hayır, herhangi bir pratik amaç için değer.** En iyi gerçekçi sonuç, kullanıcı arayüzünü yazılımla render eden, yalnızca CPU'lu bir macOS'tur — Metal yok, GPU hesaplama yok, bu kartın satın alındığı oyun/yapay zekâ iş yükleri için kullanılamaz. **2025-06** ile **2026-03** arasında tarihlenmiş ve değişmemiş topluluk fikir birliği, GPU desteğinin, OpenCore geliştiricileri bu yongayı özellikle benimsemedikçe fiilen imkânsız olduğu yönünde — ki bu olmadı ve beklenmiyor.

Bu kartın bir *şey* yapmasını istiyorsanız, GPU'nun Mesa/RADV aracılığıyla gerçekten desteklendiği Linux'u ([06-linux.md](06-linux.md)) kurun. Windows uzak bir ikinci sıradır ([07-windows.md](07-windows.md)). macOS sonuncudur ve pratikte bir çıkmaz sokaktır.

---

## Kaynaklar

- Aygıt kimliğine göre GPU + bir yıllık Navi taklit hikâyesi — https://t.me/c/2424231195/53321
- OpenCore'un sınırları & "hiçbir Ryzen iGPU'su hiç çalışmadı" — https://t.me/c/2424231195/103173
- Birinin hazırladığı Monterey + OpenCore paketi — https://t.me/c/2424231195/53590
- Genel AMD-Ryzen hackintosh forum başlığı (BC-250'ye özgü değil) — https://t.me/c/2424231195/107779 · [amd-osx.com başlığı](https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/)
- Atıf yapılan araçlar — [RehabMan/OS-X-Fake-PCI-ID](https://github.com/RehabMan/OS-X-Fake-PCI-ID) · [ChefKissInc/NootedRed](https://github.com/ChefKissInc/NootedRed) (AMD APU iGPU kext'i; bu yongayı kapsamaz) · [Dortania AMD GPU kılavuzu](https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series)
- Yonga kimliği (Cyan Skillfish / Oberon, `gfx1013`) — bkz. [01-what-is-bc250.md](01-what-is-bc250.md)

> **Sonuç:** BC-250 üzerinde macOS, bir teknoloji-bilgi-yarışması dipnotudur, bir derleme hedefi değil. [06-linux.md](06-linux.md) sayfasına gidin.
