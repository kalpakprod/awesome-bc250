> 🌐 Topluluk çevirisi. İngilizce sürüm asıl kaynaktır ve daha güncel olabilir. Hata mı buldunuz? Bir [issue açın](https://github.com/lildebil0/awesome-bc250/issues). ([İngilizce orijinali](../en/10-wifi-bt.md))

# WiFi ve Bluetooth Dongle'ları

> **Özet** — BC-250'de **yerleşik WiFi veya Bluetooth yoktur**, bu yüzden bir USB dongle gerekir. Sohbetteki tek en güvenilir seçenek, [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) tarafından sürülen bir **aic8800d80** tabanlı çubuktur (ör. *AX90BT / D80MU3*) — test edilmiş bir Bazzite RPM tarifi vardır. **Realtek RTL88xx** çubukları ucuz ve yaygındır ama sohbetin 1 numaralı baş ağrısıdır: bağlanırlar, sonra **yük altında rastgele kopar**. [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) (backport edilmiş sürücü) bunun çoğunu RTL8821/8822 ailesi için düzeltir; RTL8851BU/8831BU "AX900 WiFi 6" çubukları [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) gerektirir. Raftan alır almaz "kutudan çıkar çıkmaz çalışan" bir çubuk istiyorsanız, sahipleri **Digma DWA-BT5** serisinin bunu yaptığını bildiriyor. Bluetooth 2.4 GHz radyoyu paylaşır, bu yüzden BT etkinken WiFi hızının düşmesini bekleyin.

Yalnızca kurulum için internete ihtiyacınız varsa, **kablolu bir USB-Ethernet adaptörü veya yerleşik NIC** bu sayfanın tamamını atlatır. Gerçekten kablosuza veya bir Bluetooth kumandasına ihtiyacınız olduğunda bir WiFi/BT dongle'ına yönelin.

> **Yerleşik Realtek RTL8111 ethernet hakkında:** en az dirençli yoldur ama RTL8111/8168 ailesi **Linux'ta sallantılıdan güvenilmeze** kadar değişir — stok `r8169` sürücüsünün rastgele bağlantı açılıp kapanmasına, bant genişliği altında kopmalara ve bazen 100 Mbit'e düşmeye neden olduğu yaygın olarak bildirilir. Genel hafifletme, ağaç-dışı `r8168` modülüne geçmektir. Yerleşik port kötü davranıyorsa, **bir Intel veya MediaTek USB/PCIe NIC tercih edin** — bunların Linux sürücüleri çok daha güvenilirdir. ([Intel/MediaTek'e karşı Realtek, Linux'ta uzun süredir devam eden bir güvenilirlik açığıdır](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)) ⚠ RTL8111 sallantılılığı BC-250'ye özgü değil, genel bir Linux örüntüsüdür — kendi kartınızda doğrulayın.

---

## Önce anlanması gereken tek şey

BC-250'de "dongle'ım sürekli bağlantıyı kesiyor" diyen neredeyse her bildirimin kökeni **kutunun üzerindeki marka değil, iki şeydir**:

1. **İçindeki yonga seti.** Etiket (ASUS, TP-Link, D-Link…) anlamsızdır — önemli olan kabuğun altındaki Realtek/aic/MediaTek yongasıdır. Farklı markalı üç çubuk tam olarak aynı yongayı taşıyıp aynı şekilde başarısız olabilir. ([src](https://t.me/c/2424231195/16332))
2. **Yük altında USB gücü/kararlılığı.** Birden çok kullanıcı, bir çubuğun boştayken/gezinirken iyi çalıştığını ve sonra trafik aniden arttığında (büyük bir indirme) **"USB yetişemiyormuş gibi" anında koptuğunu** görüyor. Bir kullanıcının ASUS çubuğu indirme sırasında kopmadan önce topu topu 17 dakika dayandı. ([src](https://t.me/c/2424231195/16331)) · ([src](https://t.me/c/2424231195/17319))

Yani: **yonga setine göre seçin**, bunu bakımı yapılan bir ağaç-dışı sürücüyle eşleştirin ve hâlâ kopuyorsa bunu bir güç/sıfırlama sorunu olarak ele alın (aşağıdaki [Bağlantı kesilmeleri](#rastgele-bağlantı-kesilmelerini-düzeltme) bölümüne bakın).

> **Yonga setini nasıl bulursunuz?** Kutular bunu nadiren yazar. Satın almadan önce, çubuğun **FCC ID**'sini (cihazda/ilanda yazılıdır) çevrimiçi olarak araştırın — başvuru gerçek yongayı açığa çıkarır. Taktıktan sonra, satıcı/ürün kimliklerini ve yonga setini görmek için Linux'ta **`lsusb`** çalıştırın.

---

## Bilinen-iyi dongle'lar

Sürücü repolarına karşı çapraz kontrol edildi. "Notlar", sohbet üyelerinin BC-250'de gerçekten gözlemlediklerini yansıtır.

| Yonga seti | Örnek çubuklar (sohbetten) | Sürücü reposu | Notlar |
|---|---|---|---|
| **aic8800d80** (aic8800) | AX90BT / D80MU3 ("AIC device wlan") | [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) | **En çok önerilen.** Test edilmiş Bazzite RPM tarifi; WiFi+BT. Önce bir USB-CDROM olarak görünür, sonra `install_setup.sh` sonrası `aic device wlan` olarak değişir. ([src](https://t.me/c/2424231195/120502)) |
| **RTL8821CU / 8821AU** | jenerik Realtek "свисток" | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Çalışır ama eski çekirdek-içi sürücüde **rastgele kopmalara eğilimlidir**. lwfinger backport'u çoğu için kararlıdır; asıl düzeltme çekirdek 6.13–6.14'te geldi. ([src](https://t.me/c/2424231195/17321)) |
| **RTL8822BU** | adsız çift bantlı çubuk | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Bir sahip: bağlanır, sonra **her 5–10 dakikada bir kopar**. rtw88 USB listesi tarafından destekleniyor ama BC-250'de güvenilirliği şansa kalmış. ([src](https://t.me/c/2424231195/138512)) |
| **RTL8851BU / 8831BU** | "5 dolarlık AX900 WiFi 6 + BT 5.3" | [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) | **Kutudan çıkar çıkmaz çalışmadı** — WiFi 6 yongası rtw88 için fazla yeni. Özel `8851bu` sürücüsünü gerektirir. ([src](https://t.me/c/2424231195/17320)) |
| **Digma DWA-BT5-AC600C / AC1300E** | Digma USB WiFi+BT | çekirdek-içi (Realtek) | **Kutudan çıkar çıkmaz çalıştığı** bildirildi ("ilk denemede başladı"); bir BC-250 sahibi ürün yorumlarında doğruladı. ([src](https://t.me/c/2424231195/138520)) |

> **ÇALIŞMADIĞI / sancılı olduğu bildirilenler:** jenerik **RTL8851BU "AX900"** kutudan çıkar çıkmaz ([src](https://t.me/c/2424231195/17320)); çıplak **RTL8821cu/8821au** stok çekirdek sürücülerinde rastgele kopar ([src](https://t.me/c/2424231195/16330)); markasız bir **RTL8822BU** her birkaç dakikada bir kopar ([src](https://t.me/c/2424231195/138512)). Bir kullanıcı tamamen pes etti ve yerine bir **Edimax EW-7733UnD** sipariş etti. ([src](https://t.me/c/2424231195/120503))

---

## Yol A — aic8800d80 (önerilen)

Bu, en temiz BC-250 hikayesine sahip yongadır. Eksiksiz bir Bazzite RPM tarifi ve topluluk tarafından yazılmış bir mini kılavuz vardır.

### Bazzite (rpm-ostree) — RPM derlemesi

Bakımcının [`bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) dosyası, sürücünün ham bir `make`'ten daha iyi image güncellemelerinde hayatta kalması için düzgün bir RPM derler. Repoya karşı doğrulandı:

```bash
# 1. Build deps (then reboot so the overlay is active)
sudo rpm-ostree install rpm-build rpmdevtools dkms
sudo systemctl reboot

# 2. Set up the rpmbuild tree and grab the spec
cd "$HOME"
rpmdev-setuptree
cd "$HOME/rpmbuild/SPECS"
curl -LO -s https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec

# 3. Fetch sources and build
spectool -g -R "$HOME/rpmbuild/SPECS/aic8800d80.spec"
rpmbuild -bs "$HOME/rpmbuild/SPECS/aic8800d80.spec"
sudo rpm-ostree usroverlay
rpmbuild --define "uname $(uname -r)" -bb "$HOME/rpmbuild/SPECS/aic8800d80.spec"

# 4. Install the built RPM and reboot (filename will match your kernel/fedora ver)
sudo rpm-ostree install "$HOME"/rpmbuild/RPMS/x86_64/aic8800d80-*.rpm
sudo systemctl reboot
```

Bir sohbet üyesi ([Nurmukhamed](https://github.com/Nurmukhamed/aic8800d80/tree/15a927286788af46529909bc2c14d16ea4241ec0/bazzite)) topluluğun kendisine teşekkür ettiği bir RPM-paketleme rehberi yazdı. ([src](https://t.me/c/2424231195/122580))

### Topluluk mini kılavuzu (hızlı "make" yolu)

Sadece *şimdi* çalışır hale getirmek istiyor ve önyüklemelerden sonra yeniden çalıştırmaya aldırmıyorsanız, Aqtilek'in kılavuzu ([src](https://t.me/c/2424231195/120502)):

```bash
# The stick first appears as a fake CD-ROM. Flip it to WiFi mode (ONE TIME):
sudo sh install_setup.sh         # now shows as "aic device wlan"

# Temporarily lift the read-only root (Bazzite/atomic):
sudo rpm-ostree usroverlay

# Clone and build the driver (use the repo's "method 2"):
git clone https://github.com/shenmintao/aic8800d80.git && cd aic8800d80
# …then follow the repo's second install method.
```

> ⚠ **Önyükleme kalıcılığı:** ham `make` yolunda, **sürücü her önyüklemede kaybolur** ve yeniden kurulmalıdır — yazar küçük bir otomatik başlatma betiği öneriyor. ([src](https://t.me/c/2424231195/120502)) Yukarıdaki RPM yolu kalıcı düzeltmedir.

Bir üyenin kullandığı firmware/sürücü arşivi (*AX90BT(D80MU3)*) sohbette paylaşıldı. ([src](https://t.me/c/2424231195/119991)) Alternatif bir üst kaynak, [`goecho/aic8800_linux_drvier`](https://github.com/goecho/aic8800_linux_drvier), mevcut ama bir CachyOS kullanıcısı 6 saat harcadı ve derletemedi — BC-250'de `shenmintao`'yu tercih edin. ([src](https://t.me/c/2424231195/82100)) ⚠ kendi dağıtımınızda doğrulayın.

> **aic8800d80 tuzakları (sürücünün hata takipçisinden):**
> - `fmacfw_8800d80_u02.bin` firmware'i `/lib/firmware/aic8800D80/` dizininde bulunmalıdır; başarısız bir firmware yüklemesi arayüzü `DOWN` durumunda takılı bırakır. ([aic8800d80 #37](https://github.com/shenmintao/aic8800d80/issues/37) · [#10](https://github.com/shenmintao/aic8800d80/issues/10))
> - **Kernel 7.0 / 7.1:** 1.0.0 sürücüsü DKMS altında derlenemiyor — `cfg80211_new_sta` / `cfg80211_del_sta` imzaları değişti ve bir `-Wimplicit-fallthrough` hatası derlemeyi yarıda kesiyor. Üst kaynak (upstream) yetişene kadar daha eski bir çekirdekte kalın veya kaynak kodu yamalayın. ([aic8800d80 #49](https://github.com/shenmintao/aic8800d80/issues/49))
> - **Debian 13 (kernel 6.12.90):** Wi-Fi arayüzü başlatılamayabilir veya ağları algılayamayabilir. ([aic8800d80 #58](https://github.com/shenmintao/aic8800d80/issues/58))

---

## Yol B — Realtek RTL8821 / RTL8822 (rtw88)

Ucuz ve her yerde ama eski çekirdeklerdeki çekirdek-içi sürücü **hatalıdır ve rastgele kopar**. Düzeltme, `lwfinger/rtw88`'den backport edilmiş ağaç-dışı sürücüdür. Bir üyenin kullandığı ve kararlı olduğunu doğruladığı tam komutlar ([src](https://t.me/c/2424231195/16326)):

```bash
git clone https://github.com/lwfinger/rtw88
cd rtw88
make
sudo make install
sudo make install_fw
```

Secure-Boot / DKMS kurulumunda repo ayrıca bir `sudo dkms install $PWD` + `mokutil` akışını da belgeler — [repo README](https://github.com/lwfinger/rtw88) dosyasına bakın.

**Neden işe yarar:** kopmalar bilinen bir sürücü hatasıdır; asıl düzeltme ana hatta yalnızca **çekirdek 6.13–6.14**'te ulaştı ve birçok dağıtım image'i hâlâ bozuk sürümü gönderdi. lwfinger backport'u size düzeltilmiş sürücüyü şimdi verir. ([src](https://t.me/c/2424231195/17321)) Desteklenen USB parçaları arasında RTL8811AU/CU, RTL8812AU/BU/CU, RTL8814AU, RTL8821AU/CU ve RTL8822BU/CU bulunur (tam liste repoda).

> Dürüst uyarı: rtw88 ile bile, RTL8821cu'daki bir kullanıcı yine de ara sıra kopmalar gördü ("aynı şapka") ve hız, bozuk-ama-daha-hızlı stok sürücüye göre biraz düşüyor. ([src](https://t.me/c/2424231195/16333)) Güvenilirlik fiyattan daha önemliyse, aic8800d80'e veya doğrulanmış bir Digma'ya gidin.

---

## Yol C — Realtek RTL8851BU / RTL8831BU ("AX900 WiFi 6")

Çok ucuz "AX900 WiFi 6 + Bluetooth 5.3" çubukları **RTL8851BU/8831BU** kullanır; bunları `rtw88` **kapsamaz**, bu yüzden kutudan çıkar çıkmaz ölüdürler. ([src](https://t.me/c/2424231195/17320)) Özel sürücü [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831)'i kullanın:

```bash
git clone https://github.com/biglinux/rtl8831
cd rtl8831
sudo dkms install .        # or: make && sudo make install
sudo modprobe 8851bu
```

⚠ doğrulayın — bu repo bir BC-250'de sohbette derlenirken gösterilmedi; komutlar repo README'sinden alınmıştır.

> **Bu sınıfın adlandırılmış bir örneği — TP-Link Archer TX10UB Nano ("AX900 WiFi 6 + BT 5.3").** Bu, gerçek ve bulması kolay bir üründür ve **WiFi'si Linux'ta çalışır** — bir **RTL8851BU** yongası taşır, dolayısıyla Yol C kapsamına girer (stok rtw88'i değil, `8851bu`/`biglinux/rtl8831` sürücüsünü gerekecek). **Ama Bluetooth'u Linux'ta üretici tarafından desteklenmez:** TP-Link'in kendi teknik özelliği adaptörü yalnızca Windows 10/11 olarak listeler ve **Bluetooth işlevinin Mac, Linux veya TV ile uyumlu olmadığını** açıkça belirtir ([TP-Link ürün sayfası](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)). Yani bunu **"WiFi Linux'ta çalışır (8851bu sürücüsü ile); BT Linux'ta üretici tarafından desteklenmez."** olarak ele alın. Topluluk BT'sini jenerik Realtek BT sürücüleri üzerinden çalıştırabilir ama bu doğrulanmamıştır — **temiz, tak-çalıştır bir WiFi+BT Linux dongle'ı bekleyerek satın almayın.** **UGreen** de topluluk tarafından bir alternatif olarak bildirilen bir "AX900" çubuğu satıyor ama bu aynı RTL8851BU ailesindendir — yonga setini doğrulayın ve aynı BT uyarısı geçerlidir. ⚠ doğrulayın.

---

## Rastgele bağlantı kesilmelerini düzeltme

Çubuğunuz bağlanıp sonra kopuyorsa (klasik Realtek-on-BC-250 belirtisi):

1. **Doğru ağaç-dışı sürücüyü kurun** (Yol B/C) — bu, vakaların çoğunu çözer.
2. **Önyükleme sonrası yeniden takın / çıkarıp takın.** Bazı çubuklar soğuk önyüklemede algılanmaz ve bir kez çıkarıp takmayı gerektirir. ([src](https://t.me/c/2424231195/16325))
3. **Çıkarmak yerine cihazı yazılımla sıfırlayın** — `usbreset` kullanın (fiziksel olarak çekmeye gerek yok). ([src](https://t.me/c/2424231195/135895)) · [nasıl yapılır (Superuser)](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
4. **Farklı bir USB portu deneyin** (ideal olarak arka/root-hub portu) — belirti yük altında güç/bant genişliğiyle ilgili görünüyor. ([src](https://t.me/c/2424231195/17319))
5. **Dongle'ı USB 3.0'dan uzak tutun.** USB 3.0 portları belgelenmiş bir **2.4 GHz RF paraziti** kaynağıdır — yüksek hızlı sinyalleme, 2.4–2.5 GHz boyunca hiçbir filtrenin kaldıramayacağı ~20 dB geniş bant gürültü ekler ve WiFi *ve* Bluetooth'u tam yaşadıkları yerde bozar. Intel'in teknik raporu standart referanstır. WiFi/BT dongle'larını bir **USB 2.0 portuna** takın veya dongle'ı USB 3.0 konnektörlerinden ve herhangi bir DisplayPort/HDMI kablolamasından birkaç santim uzağa taşımak için **kısa bir USB uzatma kablosu** kullanın. ([Intel: USB 3.0 RF Interference Impact on 2.4 GHz Wireless Devices](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf))

---

## Bluetooth notları

- WiFi+BT kombo çubukları **2.4 GHz** radyoyu paylaşır, bu yüzden **Bluetooth etkinken WiFi hızı düşer**. Bir üye **BT açıkken ~150 Mbit'e karşı BT kapalıyken ~190 Mbit** ölçtü — gerçek ama "o kadar dramatik değil." ([src](https://t.me/c/2424231195/123366)) · ([src](https://t.me/c/2424231195/123367))
- aic8800d80 sürücüsünün BT desteği için **ayrı bir `bluetooth` dalı** vardır. ([repo dalı](https://github.com/shenmintao/aic8800d80/tree/bluetooth?tab=readme-ov-file))

- **Eğer Bluetooth hiçbir şekilde görünmüyorsa, genel `btusb` sürücüsü cihazı önce kapmıştır.** aic8800 BT denetleyicisi kendi `aic_btusb` modülüne ihtiyaç duyar — çekirdek içindeki `btusb` bunu başlatamaz. Bunları `sudo rmmod btusb && sudo modprobe aic_btusb` ile değiştirin veya `/etc/modprobe.d/aic8800-bt.conf` dosyasına `softdep btusb pre: aic_btusb` ekleyerek bunu kalıcı hale getirin. ([aic8800d80 #53](https://github.com/shenmintao/aic8800d80/issues/53) · [#44](https://github.com/shenmintao/aic8800d80/issues/44))

---

## Satın alma kısa listesi

En düşük riskli yolu istiyorsanız, sırasıyla:

1. **aic8800d80 çubuğu** (AX90BT / D80MU3 sınıfı) + Bazzite RPM tarifi — en iyi belgelenmiş, WiFi+BT.
2. **Digma DWA-BT5-AC600C / AC1300E** — kutudan çıkar çıkmaz çalıştığı bildirildi. ([Ozon ilanı](https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/))
3. **RTL8821CU çubuğu + lwfinger/rtw88** — en ucuz, ara sıra kopmaları kabul edin.
4. `biglinux/rtl8831` ile boğuşmaya istekli değilseniz, en ucuz **RTL8851BU "AX900"**'den kaçının.

> Bir dongle konusunda bir yapay zeka sohbet botunun "evet kanka, mükemmel seçim" demesine güvenmeyin — bir üye tam olarak bunu yaptı, her 5–10 dakikada bir kopan bir RTL8822BU aldı ve sonra aynı bot çalışmayacağını söyledi. Burada doğrulanan yonga setine göre satın alın. ([src](https://t.me/c/2424231195/138512))

---

## Kaynaklar

- aic8800d80 Bazzite RPM — [`shenmintao/aic8800d80` `bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) · spec — https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec
- aic8800d80 mini kılavuz — https://t.me/c/2424231195/120502 · RPM fork — https://t.me/c/2424231195/122580 · firmware zip — https://t.me/c/2424231195/119991
- aic8800 BT dalı — https://github.com/shenmintao/aic8800d80/tree/bluetooth · alternatif repo — https://github.com/goecho/aic8800_linux_drvier (https://t.me/c/2424231195/82100)
- rtw88 derleme adımları — https://t.me/c/2424231195/16326 · backport gerekçesi — https://t.me/c/2424231195/17321 · sürücü — [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88)
- RTL8851BU AX900 çalışmıyor — https://t.me/c/2424231195/17320 · sürücü — [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831)
- Kopma belirtisi / markaya-değil-yongaya-göre — https://t.me/c/2424231195/16330 · https://t.me/c/2424231195/16331 · https://t.me/c/2424231195/16332 · https://t.me/c/2424231195/17319
- Digma kutudan çıkar çıkmaz çalışıyor — https://t.me/c/2424231195/138520 · ilan — https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/
- Yapay zeka önerisi RTL8822BU kopuyor — https://t.me/c/2424231195/138512 · Edimax kaçışı — https://t.me/c/2424231195/120503
- BT'ye karşı WiFi hızı — https://t.me/c/2424231195/123366 · usbreset — https://t.me/c/2424231195/135895 · [Superuser nasıl yapılır](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
- Yerleşik RTL8111/8168 Linux'ta sallantılı; r8168 hafifletmesi, Intel/MediaTek tercih edin — [LinuxQuestions r8169 vs r8168](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)
- USB 3.0, 2.4 GHz WiFi/BT ile parazit yapar (USB 2.0 / uzatma kullanın) — [Intel teknik raporu](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf)
- TP-Link Archer TX10UB Nano — WiFi Linux'ta çalışır (RTL8851BU), BT üretici tarafından yalnızca Windows / Linux değil olarak listelenir — [TP-Link ürün sayfası](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)
