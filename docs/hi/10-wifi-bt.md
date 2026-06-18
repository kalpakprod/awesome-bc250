> 🌐 सामुदायिक अनुवाद। अंग्रेज़ी संस्करण ही प्रामाणिक स्रोत है और अधिक नया हो सकता है। कोई त्रुटि मिली? issue खोलें: [English](../en/10-wifi-bt.md) · https://github.com/lildebil0/awesome-bc250/issues

# WiFi और Bluetooth Dongles

> **संक्षेप में** — BC-250 में **कोई onboard WiFi या Bluetooth नहीं** है, इसलिए आपको एक USB dongle चाहिए। chat में सबसे भरोसेमंद एकल विकल्प एक **aic8800d80**-आधारित stick है (जैसे *AX90BT / D80MU3*), जो [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) से चलता है — एक परखी हुई Bazzite RPM recipe है। **Realtek RTL88xx** sticks सस्ते और आम हैं पर chat के #1 सिरदर्द हैं: वे connect होते हैं, फिर load में **अचानक drop** हो जाते हैं। [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) (backported driver) RTL8821/8822 परिवार के लिए इसका अधिकांश ठीक कर देता है; RTL8851BU/8831BU "AX900 WiFi 6" sticks को [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) चाहिए। यदि आप एक ऐसा stick चाहते हैं जो डिब्बे से ही "बस काम करे," तो मालिक रिपोर्ट करते हैं कि **Digma DWA-BT5** श्रृंखला करती है। Bluetooth 2.4 GHz radio साझा करता है, इसलिए BT active रहते हुए WiFi throughput गिरने की अपेक्षा करें।

यदि आपको केवल setup के लिए internet चाहिए, तो एक **wired USB-Ethernet adapter या onboard NIC** इस पूरे पृष्ठ को बायपास कर देता है। WiFi/BT dongle तभी उठाएँ जब आपको वास्तव में wireless या एक Bluetooth controller चाहिए।

> **onboard Realtek RTL8111 ethernet के बारे में:** यह सबसे कम प्रतिरोध का रास्ता है, पर RTL8111/8168 परिवार Linux पर **अस्थिर-से-अविश्वसनीय** है — stock `r8169` driver के बारे में व्यापक रूप से रिपोर्ट है कि यह यादृच्छिक link up/down, bandwidth में dropouts, और कभी-कभी 100 Mbit तक गिरावट का कारण बनता है। out-of-tree `r8168` module पर switch करना सामान्य उपाय है। यदि onboard port गलत व्यवहार करे, तो **एक Intel या MediaTek USB/PCIe NIC को प्राथमिकता दें** — उनके Linux drivers कहीं अधिक भरोसेमंद हैं। ([Intel/MediaTek बनाम Realtek एक पुराना Linux reliability अंतर है](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)) ⚠ RTL8111 की अस्थिरता एक सामान्य-Linux पैटर्न है, BC-250-विशिष्ट नहीं — अपने board पर verify करें।

---

## पहले समझने की एक चीज़

BC-250 पर लगभग हर "मेरा dongle disconnect होता रहता है" रिपोर्ट **दो चीज़ों** से जुड़ती है, डिब्बे पर लिखे brand से नहीं:

1. **अंदर का chipset।** label (ASUS, TP-Link, D-Link…) अर्थहीन है — जो मायने रखता है वह है खोल के नीचे का Realtek/aic/MediaTek chip। तीन अलग-brand sticks बिल्कुल एक ही chip ले जा सकती हैं और एक जैसे fail हो सकती हैं। ([src](https://t.me/c/2424231195/16332))
2. **Load में USB power/stability।** कई users देखते हैं कि एक stick idle/surfing में ठीक चलती है और फिर **जैसे ही traffic बढ़ता है drop** हो जाती है (एक बड़ा download), "मानो USB साथ नहीं दे पा रहा।" एक user की ASUS stick download पर drop होने से पहले कुल 17 मिनट चली। ([src](https://t.me/c/2424231195/16331)) · ([src](https://t.me/c/2424231195/17319))

तो: **chipset से चुनें**, इसे एक maintained out-of-tree driver से मिलाएँ, और यदि फिर भी drop हो, तो इसे power/reset समस्या मानें (नीचे [Dropouts](#random-dropouts-ठीक-करना) देखें)।

> **chipset कैसे ढूँढें?** डिब्बे शायद ही कभी इसे छापते हैं। खरीदने से पहले, stick का **FCC ID** (device/listing पर छपा) online देखें — filing असली chip का खुलासा करती है। plug-in करने के बाद, vendor/product IDs और chipset देखने के लिए Linux पर **`lsusb`** चलाएँ।

---

## ज्ञात-अच्छे dongles

driver repos के विरुद्ध cross-check किया गया। "Notes" वह दर्शाते हैं जो chat सदस्यों ने वास्तव में BC-250 पर देखा।

| Chipset | उदाहरण sticks (chat से) | Driver repo | Notes |
|---|---|---|---|
| **aic8800d80** (aic8800) | AX90BT / D80MU3 ("AIC device wlan") | [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) | **सबसे अनुशंसित।** परखी हुई Bazzite RPM recipe; WiFi+BT। पहले USB-CDROM के रूप में दिखता है, फिर `install_setup.sh` के बाद `aic device wlan` में बदल जाता है। ([src](https://t.me/c/2424231195/120502)) |
| **RTL8821CU / 8821AU** | generic Realtek "свисток" | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | काम करता है, पर पुराने in-kernel driver पर **यादृच्छिक drops की प्रवृत्ति**। lwfinger backport अधिकांश के लिए स्थिर है; उचित fix kernel 6.13–6.14 में आया। ([src](https://t.me/c/2424231195/17321)) |
| **RTL8822BU** | unnamed dual-band stick | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | एक मालिक: connect होता है, फिर **हर 5–10 मिनट में drop**। rtw88 USB सूची द्वारा supported पर BC-250 पर reliability अनिश्चित है। ([src](https://t.me/c/2424231195/138512)) |
| **RTL8851BU / 8831BU** | "$5 AX900 WiFi 6 + BT 5.3" | [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) | **डिब्बे से काम नहीं किया** — WiFi 6 chip rtw88 के लिए बहुत नया। समर्पित `8851bu` driver चाहिए। ([src](https://t.me/c/2424231195/17320)) |
| **Digma DWA-BT5-AC600C / AC1300E** | Digma USB WiFi+BT | in-kernel (Realtek) | **डिब्बे से काम करता** रिपोर्ट किया गया ("पहली बार में चालू हो गया"); एक BC-250 मालिक ने product reviews में पुष्टि की। ([src](https://t.me/c/2424231195/138520)) |

> **रिपोर्ट किया गया काम न करने वाला / कष्टदायक:** generic **RTL8851BU "AX900"** डिब्बे से ([src](https://t.me/c/2424231195/17320)); stock kernel drivers पर नंगे **RTL8821cu/8821au** यादृच्छिक रूप से drop होते हैं ([src](https://t.me/c/2424231195/16330)); एक बेनाम **RTL8822BU** हर कुछ मिनट में drop होता है ([src](https://t.me/c/2424231195/138512))। एक user ने पूरी तरह हार मान ली और इसके बजाय एक **Edimax EW-7733UnD** order किया। ([src](https://t.me/c/2424231195/120503))

---

## Path A — aic8800d80 (अनुशंसित)

यह सबसे साफ़ BC-250 कहानी वाला chip है। एक पूरी Bazzite RPM recipe और एक समुदाय-लिखित mini-guide है।

### Bazzite (rpm-ostree) — RPM build

maintainer की [`bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) एक उचित RPM बनाती है ताकि driver image updates में raw `make` से बेहतर बचे रहे। repo के विरुद्ध verified:

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

एक chat सदस्य ([Nurmukhamed](https://github.com/Nurmukhamed/aic8800d80/tree/15a927286788af46529909bc2c14d16ea4241ec0/bazzite)) ने एक RPM-packaging walkthrough लिखा जिसके लिए समुदाय ने उसका धन्यवाद किया। ([src](https://t.me/c/2424231195/122580))

### समुदाय mini-guide ("make" वाला त्वरित रास्ता)

यदि आप बस इसे *अभी* चालू करना चाहते हैं और reboots के बाद इसे फिर से चलाने में कोई आपत्ति नहीं, तो Aqtilek की guide ([src](https://t.me/c/2424231195/120502)):

```bash
# The stick first appears as a fake CD-ROM. Flip it to WiFi mode (ONE TIME):
sudo sh install_setup.sh         # now shows as "aic device wlan"

# Temporarily lift the read-only root (Bazzite/atomic):
sudo rpm-ostree usroverlay

# Clone and build the driver (use the repo's "method 2"):
git clone https://github.com/shenmintao/aic8800d80.git && cd aic8800d80
# …then follow the repo's second install method.
```

> ⚠ **Reboot persistence:** raw `make` रास्ते के साथ, **हर reboot पर driver खो जाता है** और इसे फिर से install करना पड़ता है — लेखक एक छोटा autostart script सुझाते हैं। ([src](https://t.me/c/2424231195/120502)) ऊपर का RPM रास्ता टिकाऊ fix है।

एक सदस्य द्वारा उपयोग किया गया firmware/driver archive (*AX90BT(D80MU3)*) chat में साझा किया गया था। ([src](https://t.me/c/2424231195/119991)) एक वैकल्पिक upstream, [`goecho/aic8800_linux_drvier`](https://github.com/goecho/aic8800_linux_drvier), मौजूद है पर एक CachyOS user ने 6 घंटे लगाए और इसे compile नहीं करा पाया — BC-250 पर `shenmintao` को प्राथमिकता दें। ([src](https://t.me/c/2424231195/82100)) ⚠ अपने distro पर verify करें।

> **aic8800d80 gotchas (ड्राइवर के इश्यू ट्रैकर से):**
> - फ़र्मवेयर `fmacfw_8800d80_u02.bin` का `/lib/firmware/aic8800D80/` में होना आवश्यक है; फ़र्मवेयर अपलोड विफल होने पर इंटरफ़ेस `DOWN` पर ही अटका रह जाता है। ([aic8800d80 #37](https://github.com/shenmintao/aic8800d80/issues/37) · [#10](https://github.com/shenmintao/aic8800d80/issues/10))
> - **Kernel 7.0 / 7.1:** 1.0.0 ड्राइवर DKMS के तहत बिल्ड होने में विफल रहता है — `cfg80211_new_sta` / `cfg80211_del_sta` के सिग्नेचर बदल गए हैं और एक `-Wimplicit-fallthrough` एरर कंपाइल प्रक्रिया को बाधित करता है। किसी पुराने कर्नल का उपयोग करें या सोर्स को तब तक पैच करें जब तक कि अपस्ट्रीम अपडेट न हो जाए। ([aic8800d80 #49](https://github.com/shenmintao/aic8800d80/issues/49))
> - **Debian 13 (kernel 6.12.90):** वाई-फाई इंटरफ़ेस शुरू होने या नेटवर्क का पता लगाने में विफल हो सकता है। ([aic8800d80 #58](https://github.com/shenmintao/aic8800d80/issues/58))

---

## Path B — Realtek RTL8821 / RTL8822 (rtw88)

सस्ता और हर जगह, पर पुराने kernels पर in-kernel driver **buggy है और यादृच्छिक रूप से drop होता है**। fix है `lwfinger/rtw88` से backported out-of-tree driver। एक सदस्य द्वारा उपयोग किए गए और स्थिर पुष्टि किए गए सटीक commands ([src](https://t.me/c/2424231195/16326)):

```bash
git clone https://github.com/lwfinger/rtw88
cd rtw88
make
sudo make install
sudo make install_fw
```

एक Secure-Boot / DKMS setup पर repo एक `sudo dkms install $PWD` + `mokutil` flow भी documents करता है — देखें [repo README](https://github.com/lwfinger/rtw88)।

**यह क्यों मदद करता है:** dropouts एक ज्ञात driver bug हैं; उचित fix mainline में केवल **kernel 6.13–6.14** में पहुँचा, और कई distro images अभी भी टूटा संस्करण शिप करते थे। lwfinger backport आपको अभी fixed driver देता है। ([src](https://t.me/c/2424231195/17321)) समर्थित USB parts में RTL8811AU/CU, RTL8812AU/BU/CU, RTL8814AU, RTL8821AU/CU और RTL8822BU/CU शामिल हैं (पूरी सूची repo में)।

> ईमानदार चेतावनी: rtw88 के साथ भी, RTL8821cu पर एक user ने अब भी कभी-कभी drops देखे ("same hat"), और throughput टूटे-पर-तेज़ stock driver की तुलना में कुछ गिर जाता है। ([src](https://t.me/c/2424231195/16333)) यदि reliability कीमत से अधिक मायने रखती है, तो aic8800d80 या एक पुष्ट Digma लें।

---

## Path C — Realtek RTL8851BU / RTL8831BU ("AX900 WiFi 6")

बहुत सस्ते "AX900 WiFi 6 + Bluetooth 5.3" sticks **RTL8851BU/8831BU** उपयोग करते हैं, जिन्हें `rtw88` **cover नहीं** करता, इसलिए वे डिब्बे से मृत हैं। ([src](https://t.me/c/2424231195/17320)) समर्पित driver [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) उपयोग करें:

```bash
git clone https://github.com/biglinux/rtl8831
cd rtl8831
sudo dkms install .        # or: make && sudo make install
sudo modprobe 8851bu
```

⚠ verify — यह repo chat में किसी BC-250 पर build होते नहीं दिखाया गया; commands repo README से हैं।

> **इस वर्ग का एक नामित उदाहरण — TP-Link Archer TX10UB Nano ("AX900 WiFi 6 + BT 5.3")।** यह एक वास्तविक, आसानी से मिलने वाला product है, और इसका **WiFi Linux पर काम करता है** — इसमें एक **RTL8851BU** chip है, इसलिए यह Path C के अंतर्गत आता है (आपको `8851bu`/`biglinux/rtl8831` driver चाहिए, stock rtw88 नहीं)। **पर इसका Bluetooth Linux पर vendor-supported *नहीं* है:** TP-Link का अपना spec adapter को Windows 10/11 only बताता है और स्पष्ट रूप से कहता है कि **Bluetooth function Mac, Linux, या TV के साथ compatible नहीं है** ([TP-Link product page](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/))। तो इसे **"WiFi Linux पर काम करता है (8851bu driver के ज़रिए); BT Linux पर vendor-supported नहीं"** के रूप में मानें। समुदाय generic Realtek BT drivers के ज़रिए इसका BT चालू कर सकता है, पर वह unverified है — **इसे एक साफ़ plug-and-play WiFi+BT Linux dongle की उम्मीद से न खरीदें।** **UGreen** भी एक "AX900" stick बेचता है जो समुदाय-रिपोर्ट किया गया विकल्प है, पर यह वही RTL8851BU परिवार है — chipset verify करें और वही BT चेतावनी लागू होती है। ⚠ verify।

---

## Random dropouts ठीक करना

यदि आपकी stick connect होती है और फिर drop हो जाती है (classic Realtek-on-BC-250 लक्षण):

1. **सही out-of-tree driver install करें** (Path B/C) — यह अधिकांश मामलों को सुलझाता है।
2. **boot के बाद re-seat / re-plug करें।** कुछ sticks cold boot पर detect नहीं होतीं और एक unplug-replug की ज़रूरत होती है। ([src](https://t.me/c/2424231195/16325))
3. **unplug करने के बजाय device को software में reset करें** — `usbreset` उपयोग करें (इसे भौतिक रूप से खींचने की ज़रूरत नहीं)। ([src](https://t.me/c/2424231195/135895)) · [how-to (Superuser)](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
4. **एक अलग USB port आज़माएँ** (आदर्श रूप से एक rear/root-hub port) — लक्षण load में power/bandwidth-संबंधी दिखता है। ([src](https://t.me/c/2424231195/17319))
5. **dongle को USB 3.0 से दूर रखें।** USB 3.0 ports **2.4 GHz RF interference** का एक documented स्रोत हैं — high-speed signaling 2.4–2.5 GHz के पार ~20 dB broadband noise जोड़ता है जिसे कोई filter हटा नहीं सकता, जो WiFi *और* Bluetooth को ठीक वहीं ख़राब करता है जहाँ वे रहते हैं। Intel का white paper canonical संदर्भ है। WiFi/BT dongles को एक **USB 2.0 port** में लगाएँ, या dongle को USB 3.0 connectors और किसी भी DisplayPort/HDMI cabling से कुछ इंच दूर ले जाने के लिए एक **छोटा USB extension cable** उपयोग करें। ([Intel: USB 3.0 RF Interference Impact on 2.4 GHz Wireless Devices](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf))

---

## Bluetooth नोट्स

- WiFi+BT combo sticks **2.4 GHz** radio साझा करती हैं, इसलिए **Bluetooth active रहते हुए WiFi throughput गिरता है**। एक सदस्य ने **BT on के साथ ~150 Mbit बनाम off के साथ ~190 Mbit** मापा — वास्तविक, पर "इतना नाटकीय नहीं।" ([src](https://t.me/c/2424231195/123366)) · ([src](https://t.me/c/2424231195/123367))
- aic8800d80 driver में BT support के लिए एक **अलग `bluetooth` branch** है। ([repo branch](https://github.com/shenmintao/aic8800d80/tree/bluetooth?tab=readme-ov-file))

- **अगर ब्लूटूथ कभी दिखाई नहीं देता है, तो जेनेरिक `btusb` ड्राइवर ने डिवाइस को पहले ही पकड़ लिया था।** aic8800 BT कंट्रोलर को अपने स्वयं के `aic_btusb` मॉड्यूल की आवश्यकता होती है — इन-कर्नेल `btusb` इसे इनिशियलाइज़ नहीं कर सकता है। इन्हें `sudo rmmod btusb && sudo modprobe aic_btusb` से बदलें, या `/etc/modprobe.d/aic8800-bt.conf` में `softdep btusb pre: aic_btusb` जोड़कर इसे स्थायी बनाएं। ([aic8800d80 #53](https://github.com/shenmintao/aic8800d80/issues/53) · [#44](https://github.com/shenmintao/aic8800d80/issues/44))

---

## खरीदारी shortlist

यदि आप सबसे कम-जोखिम वाला रास्ता चाहते हैं, क्रम में:

1. **aic8800d80 stick** (AX90BT / D80MU3 वर्ग) + Bazzite RPM recipe — सबसे अच्छा-documented, WiFi+BT।
2. **Digma DWA-BT5-AC600C / AC1300E** — डिब्बे से काम करता रिपोर्ट किया गया। ([Ozon listing](https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/))
3. **RTL8821CU stick + lwfinger/rtw88** — सबसे सस्ता, कभी-कभार drops स्वीकारें।
4. सबसे सस्ती **RTL8851BU "AX900"** से बचें जब तक आप `biglinux/rtl8831` से जूझने को तैयार न हों।

> dongle पर किसी AI chatbot के "हाँ भाई, परफेक्ट choice" पर भरोसा न करें — एक सदस्य ने ठीक यही किया, एक RTL8822BU मिला जो हर 5–10 मिनट में drop होता है, और फिर उसी bot ने कहा कि यह काम नहीं करेगा। chipset से खरीदें, यहाँ verified। ([src](https://t.me/c/2424231195/138512))

---

## स्रोत

- aic8800d80 Bazzite RPM — [`shenmintao/aic8800d80` `bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) · spec — https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec
- aic8800d80 mini-guide — https://t.me/c/2424231195/120502 · RPM fork — https://t.me/c/2424231195/122580 · firmware zip — https://t.me/c/2424231195/119991
- aic8800 BT branch — https://github.com/shenmintao/aic8800d80/tree/bluetooth · alt repo — https://github.com/goecho/aic8800_linux_drvier (https://t.me/c/2424231195/82100)
- rtw88 build steps — https://t.me/c/2424231195/16326 · backport rationale — https://t.me/c/2424231195/17321 · driver — [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88)
- RTL8851BU AX900 not working — https://t.me/c/2424231195/17320 · driver — [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831)
- Dropout symptom / by-chip-not-brand — https://t.me/c/2424231195/16330 · https://t.me/c/2424231195/16331 · https://t.me/c/2424231195/16332 · https://t.me/c/2424231195/17319
- Digma works OOB — https://t.me/c/2424231195/138520 · listing — https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/
- AI-recommended RTL8822BU drops — https://t.me/c/2424231195/138512 · Edimax escape — https://t.me/c/2424231195/120503
- BT vs WiFi speed — https://t.me/c/2424231195/123366 · usbreset — https://t.me/c/2424231195/135895 · [Superuser how-to](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
- Onboard RTL8111/8168 flaky on Linux; r8168 mitigation, prefer Intel/MediaTek — [LinuxQuestions r8169 vs r8168](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)
- USB 3.0 interferes with 2.4 GHz WiFi/BT (use USB 2.0 / extension) — [Intel white paper](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf)
- TP-Link Archer TX10UB Nano — WiFi works on Linux (RTL8851BU), BT vendor-listed Windows-only / not Linux — [TP-Link product page](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)
