> 🌐 सामुदायिक अनुवाद। अंग्रेज़ी संस्करण ही प्रामाणिक स्रोत है और अधिक नया हो सकता है। कोई त्रुटि मिली? issue खोलें: [English](../en/faq.md) · https://github.com/lildebil0/awesome-bc250/issues

# FAQ

> **संक्षेप में** — वे प्रश्न जो नए उपयोगकर्ता पहले सप्ताह में पूछते हैं, संक्षिप्त सही उत्तरों और प्रत्येक के लिए पूरे अनुभाग के एक link के साथ। यदि कोई उत्तर बहुत छोटा लगे, तो यह जान-बूझकर है — गहराई जुड़े हुए हैंडबुक पृष्ठ में रहती है।

यह एक त्वरित संदर्भ है। निर्देशित "डिब्बे में पड़ा एक board → चलते हुए games" रास्ते के लिए, [00-start-here.md](00-start-here.md) से शुरू करें।

---

## Hardware और मैंने क्या खरीदा

**BC-250 वास्तव में क्या है?**
एक crypto-mining/server board पर एक PlayStation 5-व्युत्पन्न APU (AMD **Cyan Skillfish** / Oberon): **6-core/12-thread Zen 2 CPU + 24-CU RDNA 2 GPU + 16 GB soldered GDDR6**। यह एक graphics card नहीं है और एक सामान्य PC नहीं है — कोई PCIe slot नहीं, कोई 24-pin ATX नहीं, कोई परिचित BIOS नहीं। देखें [01-what-is-bc250.md](../en/01-what-is-bc250.md)।

**क्या यह plug-and-play है? क्या मुझे इसे खरीदना चाहिए था?**
नहीं। इसे driver कार्य, एक cooling mod और अजीब power चाहिए — यह एक tinkerer का board है। एक अनुभवी की बात: इसके लिए "कुछ कौशल, मेहनत और दिमाग चाहिए।" यदि आप शून्य झंझट चाहते हैं, तो इसे लौटा दें; यदि आपको projects पसंद हैं, तो यह इस स्तर पर सबसे सस्ता Linux gaming / local-AI box है। देखें [01-what-is-bc250.md](../en/01-what-is-bc250.md)।

**क्या मैं और RAM जोड़ सकता हूँ?**
नहीं। 16 GB GDDR6 soldered है और CPU व GPU के बीच साझा है; कोई DIMM slots नहीं हैं। आप केवल यह चुनते हैं कि GPU pool का कितना हिस्सा reserve करता है (UMA), जो एक modded BIOS में सेट होता है। देखें [01-what-is-bc250.md](../en/01-what-is-bc250.md) और [08-bios.md](../en/08-bios.md)।

**क्या इसमें एक power button है?**
नहीं। जैसे ही 12 V आता है यह तुरंत चालू हो जाता है — PSU का अपना switch आपका power button है। देखें [03-power-supply.md](../en/03-power-supply.md)।

**मेरा board POST नहीं करता / डिब्बे से ही काली screen — मरा हुआ?**
अक्सर नहीं। कई boards POST करने से पहले एक **BIOS/CMOS reset** की ज़रूरत के साथ आते हैं, और कुछ heatsink mount से थोड़े **मुड़े हुए** आते हैं — एक मालिक ने board को कागज़ से समतल shim करके एक no-boot ठीक किया। इसे मरा हुआ घोषित करने से पहले वे आज़माएँ। देखें [01-what-is-bc250.md](../en/01-what-is-bc250.md)।

**क्या यह GPU से games record/stream कर सकता है?**
hardware में नहीं। video-encode block (VCN) अनुपलब्ध है, इसलिए OBS/streaming एक **software (CPU) encoder** पर वापस आ जाता है — यह काम करता है (लोग Sunshine/Moonlight उपयोग करते हैं) पर CPU और quality की कीमत पर। देखें [01-what-is-bc250.md](../en/01-what-is-bc250.md)।

**backplate mod के लिए thermal-pad की मोटाई क्या हैं?**
समुदाय-रिपोर्ट किए गए: **memory 2 mm, chipset 1.5 mm** ([src](https://t.me/c/2424231195/22442))। पीछे का GDDR6 कोई temperature sensor नहीं रखता, इसलिए आप उसे अंधेरे में ठंडा करते हैं। देखें [04-cooling.md](../en/04-cooling.md)।

## Power

**मुझे किस power supply की ज़रूरत है?**
एक **single-rail 12 V** स्रोत जो एक **PCIe 8-pin (6+2)** connector में **≥300 W** देता है। तीन आम रास्ते: एक सामान्य ATX/SFX PSU (बस इसका PCIe cable plug करें — सबसे आसान), एक सस्ता used HP Flex 500 W server PSU, या एक Mean Well औद्योगिक brick। देखें [03-power-supply.md](../en/03-power-supply.md)।

**क्या मैं अपने PSU से CPU/EPS 8-pin उपयोग कर सकता हूँ?**
**नहीं — यह board को जला सकता है।** PCIe और CPU/EPS 8-pins लगभग एक जैसे दिखते हैं पर **उलटी polarity** रखते हैं। board के पास कोई sense-check नहीं है; **PCIe** cable उपयोग करें, और अनिश्चित हों तो एक multimeter से सत्यापित करें। देखें [03-power-supply.md](../en/03-power-supply.md)।

**मेरे पुराने 750 W PSU में बहुत watts हैं — फिर यह क्यों संघर्ष करता है?**
पुराने units अक्सर **12 V को कई कमज़ोर rails में बाँट देते हैं**, और कोई एक rail ~235 W को कवर नहीं करता जो board खींचता है। एक आधुनिक single-rail / DC-DC PSU पसंद करें, या बड़े headroom वाला कोई। देखें [03-power-supply.md](../en/03-power-supply.md)।

**मेरा power cable गर्म हो गया / धुआँ निकला। क्यों?**
लगभग निश्चित रूप से **नकली तांबा** — copper-clad steel या aluminium wire, जिसमें असली तांबे से कई गुना प्रतिरोध है और load के तहत ज़्यादा गर्म होता है (एक सदस्य के पहले से बने PCIe splitter से सचमुच धुआँ निकला) ([src](https://t.me/c/2424231195/97202))। एक magnet से test करें: यह steel से चिपकता है, तांबे से नहीं। असली तांबा उपयोग करें, **16 AWG या मोटा**। देखें [03-power-supply.md](../en/03-power-supply.md)।

## Cooling

**यह डिब्बे से ही ज़्यादा गर्म / throttle क्यों होता है?**
stock heatsink **passive** है, एक mining rack की forced-air tunnel के लिए बना। बिना airflow वाले एक desk पर यह heat-soak और throttle होता है। Throttling ~**85 °C** पर शुरू होती है, hard reset ~**90 °C** पर। देखें [04-cooling.md](../en/04-cooling.md)।

**सबसे सस्ता cooling fix क्या है जो वास्तव में काम करता है?**
**dense stock fins को पतला करें** (orbital sander सबसे तेज़ है) और एक **120 mm high-static-pressure fan** को एक प्रिंट किए हुए shroud के माध्यम से उनसे होकर हवा फूँकते हुए bolt करें। संदर्भ परिणाम: Noctua NF-P12 → ~73 °C Furmark, games में 63–65 °C ([src](https://t.me/c/2424231195/42843)); Arctic P12 Max ~75 °C बनाए रखता है ([src](https://t.me/c/2424231195/58869))। देखें [04-cooling.md](../en/04-cooling.md)।

**high-static-pressure fan क्यों, high-airflow "case fan" क्यों नहीं?**
Dense fins एक high-resistance load हैं — एक high-airflow case fan बस उनके विरुद्ध रुक जाता है, जबकि एक high-static-pressure fan (Noctua/Arctic P12) वास्तव में हवा को *होकर* धकेलता है। बहुत dense fins के लिए, दो fans **push–pull (series) में**, side-by-side नहीं। देखें [04-cooling.md](../en/04-cooling.md)।

**मैं कैसे जानूँ कि मेरा cooling पर्याप्त है?**
**GPU और CPU पर एक साथ** दबाव डालें (वे एक heatsink साझा करते हैं) — Furmark VK साथ में एक CPU load — **अपने overclock के तहत** (2000 MHz, stock नहीं), और load को ~85 °C के नीचे रखें। एक pinned test procedure है। देखें [04-cooling.md](../en/04-cooling.md)।

## Linux

**मुझे कौन सा distro install करना चाहिए?**
"बस games खेलें" के लिए, **Bazzite** flash करें और **`bazzite-bc250`** image पर rebase करें — GPU fixes अंदर ही पके हुए हैं। मशीन सीखने के लिए: **Fedora** (COPR + setup script) या **CachyOS/EndeavourOS** (Arch)। देखें [06-linux.md](../en/06-linux.md)।

**मैंने Linux install किया और सब कुछ धीमा है / single-digit FPS। क्यों?**
GPU accelerate नहीं हो रहा — आप software (LLVMpipe) rendering पर हैं। आपको एक **ताज़ा Mesa (25.1+)**, **`cyan_skillfish` firmware symlink** (या एक patched package), और सही kernel params चाहिए। `vulkaninfo | grep deviceName` से पुष्टि करें (इसे `llvmpipe` *नहीं* कहना चाहिए)। देखें [06-linux.md](../en/06-linux.md)।

**एक kernel update के बाद काली screen — मैं इसे कैसे ठीक करूँ?**
अधिकांश distros पर fix है firmware symlink ताकि amdgpu load हो सके:
```bash
sudo ln -s /lib/firmware/amdgpu/navi10_gpu_info.bin.zst \
           /lib/firmware/amdgpu/cyan_skillfish_gpu_info.bin.zst
```
यह kernel updates से बच जाता है (पर Bazzite पर **नहीं**, और एक firmware/amdgpu update इसे मिटा सकता है) ([src](https://t.me/c/2424231195/98882))। अन्यथा एक पुराना/LTS kernel boot करें और खराब वाले को version-lock करें। देखें [06-linux.md](../en/06-linux.md)।

**क्या मुझे apps को Flatpaks के रूप में install करना चाहिए?**
किसी भी graphical चीज़ के लिए उनसे बचें। Flatpaks अपना **खुद का Mesa** bundle करते हैं, board के patched वाले को override करते हुए, इसलिए वे **hardware acceleration के बिना** चलते हैं। PortProton, उदाहरण के लिए, terminal के माध्यम से install होना चाहिए, Flatpak से नहीं ([src](https://t.me/c/2424231195/17949), [src](https://t.me/c/2424231195/47092))। देखें [06-linux.md](../en/06-linux.md)।

**मेरा CPU कमज़ोर लगता है — कोई त्वरित लाभ?**
दो kernel tweaks: **`mitigations=off`** (CPU vulnerability mitigations disable करता है) ([src](https://t.me/c/2424231195/23359)) और **`nosmt=force`** (SMT disable करता है — हल्के-threaded games में +15–25 % FPS, पर high bitrate पर OBS जैसे भारी multitasking को नुकसान पहुँचाता है) ([src](https://t.me/c/2424231195/61332))। दोनों security/throughput trade-offs हैं। देखें [06-linux.md](../en/06-linux.md)।

**Wayland पर GNOME/KDE glitchy है — मैं क्या करूँ?**
ज्ञात समस्या। सदस्य रिपोर्ट करते हैं कि Wayland sessions (आमतौर पर GNOME/KDE) इस board पर ठीक से व्यवहार नहीं करते; इसके बजाय **X11 session उपयोग करें** ([src](https://t.me/c/2424231195/19623))। देखें [06-linux.md](../en/06-linux.md)।

**मेरी RAM जल्दी भर जाती है — क्या मुझे और swap मिल सकता है?**
हाँ, **zRAM** swap (compressed RAM swap) बढ़ाएँ — सामुदायिक recipe इसे 32 GB तक बढ़ाता है और `/etc/systemd/zram-generator.conf` में इसे persistent बनाता है ([src](https://t.me/c/2424231195/38703))। यह असली memory नहीं जोड़ता पर spikes को सोख लेता है। देखें [06-linux.md](../en/06-linux.md)।

**एक kernel update ने चीज़ें तोड़ दीं — मैं कैसे roll back करूँ?**
system पिछले कुछ kernels रखता है। Fedora पर, उन्हें `grubby` से सूचीबद्ध करें और `grubby --set-default /boot/vmlinuz-…`, फिर reboot करें ([src](https://t.me/c/2424231195/39393))। संदेह हो तो एक **LTS kernel** चलाएँ। देखें [06-linux.md](../en/06-linux.md)।

## Windows

**क्या अभी तक कोई Windows driver है?**
नहीं — 2026 की शुरुआत तक **कोई काम करने वाला Windows GPU driver नहीं** है। Windows boot होता है पर GPU बिना 3D के **Code 43** पर बैठता है। दो शुरू-से reverse-engineering प्रयास मौजूद हैं (Keshas-dev, ZEROAESQUERDA) पर वे "क्या GPU बिल्कुल initialize हो सकता है" अवस्था में हैं, gaming नहीं। देखें [07-windows.md](../en/07-windows.md)।

**क्या मैं बस एक RX 6700 / W5700 driver force-install नहीं कर सकता?**
नहीं। हर official `.inf` (उस W5700 सहित जिसे Windows "compatible" के रूप में पेश करता है) install होता है फिर Code 43 पर hang हो जाता है — device ID `1002:13FE` APU से वेल्डेड है। यह हर नए उपयोगकर्ता का पहला विचार है और यह काम नहीं कर सकता। देखें [07-windows.md](../en/07-windows.md)।

**GPU passthrough वाले एक Windows VM के बारे में क्या?**
काम नहीं करता — इस board पर IOMMU passthrough टूटा हुआ है, यह एक APU है (सौंपने के लिए एक साफ़ discrete card नहीं), और chip वैसे भी गलत detect होता है। देखें [07-windows.md](../en/07-windows.md)।

**मैंने एक "BC-250 के लिए NVIDIA driver" / एक `…bc250.exe` देखा — असली?**
नहीं। "NVIDIA driver" एक **April Fools' मज़ाक** था, और filename पर "bc250" चिपकाए गए एक Adrenalin installer अब भी बस एक सामान्य Adrenalin installer है। केवल नामित GitHub repos से binaries चलाएँ, और code पढ़ें — नकली "drivers" malware रहे हैं। देखें [07-windows.md](../en/07-windows.md)।

## BIOS और recovery

**क्या मुझे एक modded BIOS flash करना चाहिए?**
केवल यदि आप overclock/timings/iGPU-VRAM unlock करना चाहते हैं **और** आपके पास recovery hardware तैयार है। एक गलत setting board को **पूरी तरह brick** कर सकती है, और इस board पर एक **CMOS clear हमेशा इसे recover नहीं करता**। वर्तमान 5.00-आधारित mod उपयोग करें, SHA-256 सत्यापित करें, और कभी Integrated Graphics disable न करें (यह आपका एकमात्र display है)। देखें [08-bios.md](../en/08-bios.md)।

**मैंने इसे brick कर दिया — क्या मैं इसे un-brick कर सकता हूँ?**
आमतौर पर हाँ, पर केवल hardware के साथ: एक **CH341A-श्रेणी का SPI programmer** जो board के **J4004 header** से जुड़ा हो (SOIC clip यहाँ काम *नहीं* करता) ताकि 16 MB chip को फिर से flash किया जा सके। CH341A 3.3 V data-line trap का ध्यान रखें। देखें [08-bios.md](../en/08-bios.md)।

**मैंने VRAM split बदला पर OS अब भी पुरानी मात्रा दिखाता है।**
flashing/UMA बदलने के बाद **CMOS clear करें** — CR2032 को 60+ s के लिए हटाएँ या CMOS jumper short करें। कुछ settings (विशेष रूप से VRAM/UMA) तब तक लागू नहीं होतीं जब तक आप ऐसा न करें ([src](https://t.me/c/2424231195/97290))। देखें [08-bios.md](../en/08-bios.md)।

## Overclock और undervolt

**मैं overclock कैसे करूँ? क्या यह सार्थक है?**
एक **governor** चलाएँ (अधिकांश builds **oberon-governor** उपयोग करते हैं) और GPU को **2000 MHz** की ओर बढ़ाएँ (~+30 % FPS *जब GPU-bound हो*)। नया `bc250_smu_oc` CPU को भी overclock करता है (~4 GHz @ 1275 mV)। **पहले board को ठंडा करें** — ~90 °C से ऊपर OC इसे reset करता है। देखें [09-overclock-undervolt.md](../en/09-overclock-undervolt.md)।

**40-CU unlock क्या है?**
die में भौतिक रूप से **40 CUs** हैं पर firmware केवल **24** सक्रिय छोड़ता है। एक patched amdgpu + `amdgpu.bc250_cc_write_mode=3` सभी 40 को फिर से सक्षम करता है — clocks से बड़ी GPU जीत (एक Superposition run 4647 → 6863 गया)। इसे kernel module को फिर से build करना पड़ता है और यह केवल-Linux है। देखें [09-overclock-undervolt.md](../en/09-overclock-undervolt.md)।

**मुझे कौन सा voltage सेट करना चाहिए?**
हर chip अलग होती है (silicon lottery)। आम game-stable बिंदु: **2000 MHz ≈ 955 mV** (~75 °C)। **असली games + alt-tab/menus** में validate करें, केवल Furmark में नहीं, जो instability छुपाता है। Hard CPU limit: **1.325 V Vid कभी पार न करें**। देखें [09-overclock-undervolt.md](../en/09-overclock-undervolt.md)।

**क्या बहुत आक्रामक undervolt खतरनाक है?**
नहीं — सबसे बुरी स्थिति में board बंद हो जाता है या M.2 slot disable कर देता है, और यह कुछ ही सेकंड में clear हो जाता है क्योंकि OC BIOS में store नहीं होता। CPU को over-*volt* करना खतरनाक दिशा है। देखें [09-overclock-undervolt.md](../en/09-overclock-undervolt.md)।

## Display, WiFi और Bluetooth

**HDMI पर कोई picture नहीं?**
board **DisplayPort** पर output करता है; HDMI/TV के लिए एक **DP→HDMI adapter या cable** उपयोग करें (एक अच्छा वाला BIOS में भी काम करता है और 4K करता है) ([src](https://t.me/c/2424231195/24107))। एक सस्ते passive adapter के बजाय एक असली **DP→HDMI cable** पसंद करें — एक खराब adapter ने एक सदस्य के लिए काली screens का कारण बना ([src](https://t.me/c/2424231195/96416))।

**DisplayPort पर audio विकृत है।**
Linux पर एक ज्ञात समस्या। सरल fix है एक **DP→HDMI** adapter के माध्यम से output करना, जो साफ़ audio ले जाता है ([src](https://t.me/c/2424231195/17953))। देखें [01-what-is-bc250.md](../en/01-what-is-bc250.md)।

**क्या इसमें WiFi/Bluetooth है?**
कोई onboard wireless नहीं — आपको एक **USB dongle** चाहिए, जिसे **chipset से चुना जाए, brand से नहीं**। सबसे अच्छी तरह से documented एक **aic8800d80** stick है; सस्ती Realtek RTL8821/8822 sticks `lwfinger/rtw88` के साथ काम करती हैं पर load के तहत drop होती हैं। setup के लिए, एक wired USB-Ethernet adapter पूरी समस्या को टाल देता है। देखें [10-wifi-bt.md](../en/10-wifi-bt.md)।

**मेरा WiFi dongle बार-बार disconnect होता रहता है।**
classic Realtek-on-BC-250 लक्षण: सही out-of-tree driver install करें (rtw88 / rtl8831), एक पिछला USB port आज़माएँ, और unplug करने के बजाय `usbreset` से reset करें। यदि कीमत से अधिक विश्वसनीयता मायने रखती है, तो aic8800d80 या एक पुष्ट Digma stick पर switch करें। देखें [10-wifi-bt.md](../en/10-wifi-bt.md)।

## Gaming और AI

**मैं किस FPS की अपेक्षा कर सकता हूँ?**
एक असली **2000 MHz** OC पर: आधुनिक AAA **40–60 FPS** पर, हल्के/पुराने games 60 से ऊपर। FSR के साथ **1080p–1440p** पर सर्वोत्तम। board आमतौर पर **CPU-bound** होता है, इसलिए resolution अक्सर "मुफ़्त" होता है पर physics-भारी/खराब-threaded games फिर भी stutter करते हैं। देखें [11-gaming.md](../en/11-gaming.md)।

**कौन से games सबसे अच्छे चलते हैं?**
**First-party PlayStation ports** (God of War, Horizon, The Last of Us, Spider-Man, Ghost of Tsushima) — वे GPU पर निर्भर करते हैं और अच्छी तरह optimize हैं। Emulation: Switch (Eden) और PS4 (shadPS4) ठोस हैं; Xbox 360 (Xenia) नहीं है। देखें [11-gaming.md](../en/11-gaming.md)।

**मेरा GPU ~40 % load पर है पर FPS कम है, क्यों?**
आप **CPU-bound** हैं — 6-core Zen 2 bottleneck है, GPU नहीं। उस स्थिति में Upscaling FPS को ज़्यादा नहीं बढ़ाएगा; `nosmt=force`/`mitigations=off` आज़माएँ और स्वीकार करें कि कुछ titles CPU-limited हैं। देखें [11-gaming.md](../en/11-gaming.md)।

**क्या मैं इस पर स्थानीय LLMs / AI चला सकता हूँ?**
हाँ — 16 GB GDDR6 **Vulkan** backend पर `llama.cpp`/Jan के माध्यम से मध्यम-आकार के models रखता है; पहले BIOS को GPU को ~12 GB allocate करने के लिए सेट करें। देखें [12-ai-llm.md](../en/12-ai-llm.md)।

## खरीदारी

**उचित कीमत क्या है, और मैं कहाँ खरीदूँ?**
कीमतें और स्रोत तेज़ी से बदलते हैं और क्षेत्र-विशिष्ट हैं (eBay, AliExpress, CIS में Ozon/Avito) — हाल की रिपोर्टें निम्न-$100s से ~13k₽ के आसपास इकट्ठा होती हैं। देखें [02-buying.md](../en/02-buying.md)।

**एक खरीदने के जोखिम क्या हैं?**
यह used mining/server hardware है: boards एक BIOS reset की ज़रूरत के साथ, थोड़े मुड़े हुए, या कभी-कभी faulty आ सकते हैं, और कोई vendor support नहीं है — समुदाय आपका support है। पैसा ही नहीं, समय भी रखें। देखें [01-what-is-bc250.md](../en/01-what-is-bc250.md) और [02-buying.md](../en/02-buying.md)।

**क्या मैं इस पर macOS चला सकता हूँ?**
मत चलाएँ। CPU boot हो सकता है, पर **GPU कभी accelerate नहीं होगा** (spoof करने के लिए कोई supported जुड़वाँ नहीं, और किसी भी AMD APU iGPU ने macOS में कभी काम नहीं किया)। Linux उपयोग करें। देखें [13-macos.md](../en/13-macos.md)।

---

## स्रोत

- स्रोत chat: *AMD BC-250 community* (Telegram)। अधिकांश उत्तर एक पूरे हैंडबुक अनुभाग का सारांश देते हैं — अंतर्निहित citations के लिए अनुभाग link का अनुसरण करें।
- Thermal-pad की मोटाई — https://t.me/c/2424231195/22442
- Arctic P12 Max ~75 °C — https://t.me/c/2424231195/58869 · Noctua P12 ~73 °C — https://t.me/c/2424231195/42843
- Kernel के बाद काली-screen firmware symlink fix (Bazzite नहीं) — https://t.me/c/2424231195/98882
- Flatpak hardware accel तोड़ता है — https://t.me/c/2424231195/17949 · PortProton terminal के माध्यम से — https://t.me/c/2424231195/47092
- कमज़ोर CPU के लिए `mitigations=off` — https://t.me/c/2424231195/23359 · `nosmt=force` FPS लाभ — https://t.me/c/2424231195/61332
- Wayland glitches, X11 उपयोग करें — https://t.me/c/2424231195/19623
- zRAM swap वृद्धि — https://t.me/c/2424231195/38703 · kernel चयन/rollback — https://t.me/c/2424231195/39393
- Power splitter ज़्यादा गर्म/धुआँ (नकली तांबा) — https://t.me/c/2424231195/97202
- VRAM बदलने के बाद CMOS clear ज़रूरी — https://t.me/c/2424231195/97290
- DP→HDMI adapter (4K/TV, BIOS में काम करता है) — https://t.me/c/2424231195/24107 · खराब adapter → काली screen — https://t.me/c/2424231195/96416 · DP audio distortion fix — https://t.me/c/2424231195/17953

> यह FAQ एक नक्शा है, क्षेत्र नहीं — हर उत्तर उस अनुभाग की ओर इशारा करता है जो विवरण और प्राथमिक स्रोत रखता है। सुधारों का PR के माध्यम से स्वागत है (देखें [CONTRIBUTING.md](../../CONTRIBUTING.md))।
