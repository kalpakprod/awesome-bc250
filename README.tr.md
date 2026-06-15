<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — AMD BC-250 için yeni başlayanların kutsal kitabı" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> **AMD BC-250** için yeni başlayanların kutsal kitabı — PlayStation 5 türevi bir APU kartı (Cyan Skillfish / Oberon, 16 GB GDDR6) olup ucuz bir Linux oyun ve yapay zeka makinesine dönüştürülmüştür.

**Kutudaki bir karttan oyun çalıştırmaya** kadar ihtiyacınız olan her şey — BC-250 topluluğunun 125 binin üzerindeki mesajından derlendi, insanların gerçekten oy verdiği ve sabitlediği içeriklere göre sıralandı ve projenin asıl depolarıyla çapraz kontrol edildi.

🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · **Türkçe** · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · [हिन्दी](README.hi.md)

---

## ⚡ Buradan Başlayın

Yeni kart, hiçbir şey bilmiyor musunuz? Altın yolu sırasıyla takip edin:

**[docs/tr/00-start-here.md](docs/tr/00-start-here.md)** — Satın al → Güç ver → Soğut → İşletim sistemi kur → Sürücüler → Overclock → Oyna.

---

## 📚 El Kitabı

| # | Bölüm | Ne için |
|---|---------|-----|
| 01 | [BC-250 Nedir](docs/en/01-what-is-bc250.md) | teknik özellikler, boyutlar, pinout, beklentiler |
| 02 | [Satın Alma Rehberi](docs/en/02-buying.md) | nereden, fiyat, riskler, toplu alımlar |
| 03 | [Güç Kaynağı](docs/en/03-power-supply.md) | LOP / Flex ATX, 8 pinli pinout, kablolama |
| 04 | [Soğutma](docs/en/04-cooling.md) | soğutucu blok, fan kanalları, test yöntemi |
| 05 | [Kasalar ve 3D Baskı](docs/en/05-case.md) | yazdırılabilir kasa kataloğu (STL) |
| 06 | [Linux Sürücüleri ve Kurulum](docs/en/06-linux.md) | dağıtım seçimi, amdgpu, kurulum |
| 07 | [Windows Sürücüleri ve Kurulum](docs/en/07-windows.md) | sürücü durumu, nasıl yapılır |
| 08 | [BIOS ve Tuğla Kurtarma](docs/en/08-bios.md) | mod BIOS, flashleme, tuğladan kurtarma |
| 09 | [Overclock ve Undervolt](docs/en/09-overclock-undervolt.md) | governor, SMU, 40CU açma |
| 10 | [WiFi ve Bluetooth Dongle'ları](docs/en/10-wifi-bt.md) | gerçekten çalışan dongle'lar |
| 11 | [Oyun Sonuçları ve Ayarları](docs/en/11-gaming.md) | benchmark'lar, oyun başına ayar |
| 12 | [BC-250'de Yapay Zeka / LLM](docs/en/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/en/13-macos.md) | durum |
| 14 | [Ekran ve Çıkış](docs/en/14-display.md) | DisplayPort, DP→HDMI adaptörleri, çift ekran |
| 15 | [Emülasyon](docs/en/15-emulation.md) | her konsol/platform, gerçekçi durum |
| 16 | [USB, Hub'lar ve Depolama](docs/en/16-usb-peripherals.md) | hub'lar, 5V mod, M.2 / SATA adaptörleri |
| ❓ | [SSS](docs/tr/faq.md) · [Sorun Giderme](docs/tr/troubleshooting.md) | yaygın sorunlar |

---

## 🔗 Harika Kaynaklar

Topluluğun ne sıklıkla atıfta bulunduğuna göre sıralanmış, asıl topluluk projeleri.

### Dokümantasyon
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) — ana donanım referansı (tersine mühendislik)
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [site](https://elektricm.github.io/amd-bc250-docs/) — kapsamlı topluluk dokümanları (pinout'lar, dağıtım başına, sorun giderme)
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — kuruluş dokümanları
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — build'ler ve scriptler

### Overclock / Undervolt / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — çoğu build'in çalıştırdığı governor (saat hızlarını/voltajı ayarlar)
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — GUI'li oberon-governor fork'u (Linux)
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [bc250-collective fork](https://github.com/bc250-collective/cyan-skillfish-governor)
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — 40 CU'nun tamamını açar
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Sürücüler
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — Windows GPU sürücüsü (deneysel, 2026 başı itibarıyla tam ivmelendirme yok)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — PSP/GPU sürücü çalışması
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — Linux çekirdeği

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — en çok atıfta bulunulan BIOS imajları ve modları
- Flashleme ve tuğla kurtarma için bkz. [docs/en/08-bios.md](docs/en/08-bios.md)

### WiFi / BT dongle'ları
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### Yapay Zeka / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Kasalar / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables ve MakerWorld — bkz. [docs/en/05-case.md](docs/en/05-case.md)

---

## 🤝 Katkıda Bulunma

Bu **yaşayan** bir depodur. Bilgiler, yeniden üretilebilir bir pipeline ile topluluk sohbetinden çıkarılır (bkz. [CONTRIBUTING.md](CONTRIBUTING.md)) ve yeni dışa aktarımlarda tekrar çalıştırılır. Düzeltmeler, yeni dongle'lar, yeni kasalar ve doğrulanmış komutlar içeren PR'ler memnuniyetle karşılanır.

## 📄 Lisans

Dokümanlar: [CC-BY-SA-4.0](LICENSE). `assets/scripts/` altındaki scriptler: MIT. Yansıtılan üçüncü taraf firmware/sürücüler kendi orijinal haklarını korur — bkz. [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md).

## 🙏 Teşekkürler

Tüm BC-250 topluluğu — bu el kitabını mümkün kılan en iyi katkı sağlayanlar için bkz. **[CREDITS](CREDITS.md)**. Kaynak: *AMD BC-250 topluluk sohbeti*. Proje yazarları yukarıda depo kullanıcı adlarıyla anılmıştır.
