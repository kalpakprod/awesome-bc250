<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — AMD BC-250 के नए उपयोगकर्ता के लिए बाइबल" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> **ASRock AMD BC-250** के नए उपयोगकर्ता के लिए बाइबल — एक PlayStation 5-व्युत्पन्न APU board (Cyan Skillfish / Oberon, 6-core Zen 2 + RDNA 2, 16 GB GDDR6) जिसे एक सस्ते **Linux gaming व AI mini PC** के रूप में फिर से उपयोग में लाया गया है — एक DIY बजट Steam Machine।

**डिब्बे में पड़े एक board से लेकर games चलाने तक** आपको जो कुछ चाहिए वह सब — BC-250 समुदाय के 130k+ संदेशों से चुना गया, इस आधार पर क्रमबद्ध किया गया कि लोगों ने वास्तव में किसे upvote और pin किया, और प्रामाणिक project repos के विरुद्ध जाँचा गया।

🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · **हिन्दी**

<sub>_अनुरक्षित · अंतिम अपडेट **अगस्त 2026** · AI agents के लिए [llms.txt](llms.txt)_</sub>

---

## ❓ त्वरित उत्तर

- **ASRock AMD BC-250 क्या है?** एक PlayStation 5-व्युत्पन्न APU board — 6-core Zen 2 + 24/40 RDNA 2 CUs ("Cyan Skillfish"), 16 GB GDDR6 — जो एक पूर्व mining कार्ड के रूप में सस्ते में बेचा जाता है और Linux gaming व AI mini PC, एक DIY बजट Steam Machine, के रूप में फिर से उपयोग में लाया जाता है।
- **इसकी कीमत कितनी है?** केवल board के लिए लगभग **$60–130**; एक पूरा build (PSU, कूलर, SSD) लगभग **$150–250** में पहुँचता है। देखें [खरीदारी गाइड](docs/hi/02-buying.md)।
- **यह gaming में कितना अच्छा है?** अधिकांश titles में लगभग **1080p 60 FPS** (RX 6600-class) FSR / Frame-Gen और GPU+CPU overclock के साथ। देखें [Gaming परिणाम](docs/en/11-gaming.md)।
- **कौन सा OS?** GPU त्वरण के लिए **केवल Linux** — Bazzite, Fedora, CachyOS या Arch, Mesa 25.1+ के साथ। Windows GPU driver मौजूद नहीं है। देखें [Linux setup](docs/hi/06-linux.md)।
- **क्या यह LLM चला सकता है?** हाँ — llama.cpp / Ollama over Vulkan 16 GB GDDR6 को VRAM के रूप में उपयोग करते हैं (छोटे models पर ~30–47 tok/s)। देखें [AI / LLM](docs/en/12-ai-llm.md)।
- **मैं इसे कैसे ठंडा करूँ?** स्टॉक server heatsink डेस्क पर थ्रॉटल करता है; fins पतली करें और 120 mm fan लगाएँ, या water cooling अपनाएँ। देखें [Cooling](docs/hi/04-cooling.md)।

---

## ⚡ यहाँ से शुरू करें

नया board, कुछ नहीं जानते? क्रम से इस सुनहरे रास्ते पर चलें:

**[docs/hi/00-start-here.md](docs/hi/00-start-here.md)** — खरीदें → Power → ठंडा करें → OS install करें → Drivers → Overclock → खेलें।

---

## 📈 ट्यूनिंग से वास्तव में क्या मिलता है

इस board पर हर नॉब कुछ न कुछ की कीमत पर आता है। ये चार सबसे महत्वपूर्ण हैं, जिन्हें समुदाय द्वारा मापी गई चीज़ों से लिया गया है — कुछ भी flash करने से पहले इन्हें पढ़ें।

<p align="center">
  <img src="assets/diagrams/gpu-clock-tradeoff.svg" width="100%" alt="GPU कोर clock: FPS लाभ 2000 MHz तक लगभग 95% तक बढ़ता है और फिर CPU के सीमित करने के कारण सपाट हो जाता है, जबकि power और heat 95% तक चढ़ते रहते हैं। Sweet spot लगभग 2000 MHz, लगभग +30% FPS।">
</p>

<p align="center">
  <img src="assets/diagrams/undervolt-tradeoff.svg" width="100%" alt="Undervolt: दक्षता 20% से 95% तक बढ़ती है जब voltage 1129 mV से 700 mV तक गिरता है, जबकि अस्थिरता जोखिम 15% से 100% तक बढ़ता है। Game-stable range लगभग 905 से 955 mV है; 700 mV से नीचे GPU स्वयं को 1500 MHz पर लॉक कर लेता है।">
</p>

<p align="center">
  <img src="assets/diagrams/cu40-tradeoff.svg" width="100%" alt="40-CU unlock: compute 40% से 90% तक बढ़ता है जबकि gaming FPS केवल 40% से 47% तक जाता है, और power तथा अस्थिरता 25% से 100% तक चढ़ते हैं। 38 CU सामान्य स्थिर अधिकतम है; 40 CU एक lottery है जिसे 300 W से अधिक और AIO की आवश्यकता होती है।">
</p>

<p align="center">
  <img src="assets/diagrams/memory-tradeoff.svg" width="100%" alt="GDDR6 memory tuning: bandwidth और FPS लाभ केवल 30% से 52% तक जाते हैं जबकि brick जोखिम 20% से 100% तक बढ़ता है। 1950 MHz वह बिंदु है जहाँ boards bricked होकर वापस आए।">
</p>

<p align="center">
  <img src="assets/diagrams/power-by-config.svg" width="100%" alt="कॉन्फ़िगरेशन के अनुसार मापी गई wall draw: 200 W at 38 CU and 1200 MHz on 850 mV, 260 W at 40 CU and 1800 MHz on 860 mV, 310 W at 38 CU and 1500 MHz, और 350 W at 40 CU and 2000 MHz on 960 mV, जिसमें 1025 mV केवल 2 W अधिक जोड़ता है। सबसे अच्छा watts-per-frame point 40 CU at 1800 MHz बताया गया है।">
</p>

वे पाँच बिंदु माप हैं, कोई model नहीं: 1800 से 2000 MHz तक जाने पर लगभग 90 W खर्च होता है — लगभग उतना ही जितना पिछले 600 MHz ने किया था — और 960 mV को 1025 mV तक बढ़ाने से 2 W की गर्मी के अलावा कुछ नहीं मिलता। 350 W पर 300 W की supply 30 सेकंड के भीतर ट्रिप हो जाती है और +12V rail 26 A का भार उठा रही होती है।

<details>
<summary>Idle power — वॉल मीटर मुश्किल से क्यों बदलता है</summary>

<p align="center">
  <img src="assets/diagrams/idle-power-tradeoff.svg" width="100%" alt="Idle power: governor, undervolt और auto-suspend के दौरान GPU खपत 80 W से गिरकर 5 W हो जाती है, लेकिन कुल wall draw तब तक केवल 125 W से 110 W तक गिरती है जब तक suspend इसे 10 W पर नहीं ले आता।">
</p>

Governor और undervolt GPU को काट देते हैं, लेकिन CPU और GDDR6 फिर भी बिजली लेते रहते हैं। जब तक auto-suspend सक्रिय नहीं होता, वॉल मीटर को मुश्किल से फर्क दिखता है। High-leakage batches लगभग 70–80 W पर न्यूनतम स्तर पर पहुँच जाते हैं।

</details>

<sub>स्रोत डेटा: [`assets/diagrams/data.json`](assets/diagrams/data.json) · `node assets/diagrams/build.mjs` से पुनर्निर्माण करें</sub>

---

## 📚 हैंडबुक

| # | अनुभाग | किसके लिए |
|---|---------|-----|
| 01 | [BC-250 क्या है](docs/hi/01-what-is-bc250.md) | specs, आकार, pinout, अपेक्षाएँ |
| 02 | [खरीदारी गाइड](docs/hi/02-buying.md) | कहाँ, कीमत, जोखिम, group buys |
| 03 | [Power Supply](docs/hi/03-power-supply.md) | LOP / Flex ATX, 8-pin pinout, wiring |
| 04 | [Cooling](docs/hi/04-cooling.md) | heatsink, fan shrouds, परीक्षण विधि |
| 05 | [Cases और 3D Printing](docs/hi/05-case.md) | प्रिंट करने योग्य cases की सूची (STL) |
| 06 | [Linux Drivers और Setup](docs/hi/06-linux.md) | distro चुनाव, amdgpu, install |
| 07 | [Windows Drivers और Setup](docs/hi/07-windows.md) | driver स्थिति, कैसे करें |
| 08 | [BIOS और Brick Recovery](docs/hi/08-bios.md) | mod BIOS, flashing, un-brick |
| 09 | [Overclocking और Undervolting](docs/hi/09-overclock-undervolt.md) | governor, SMU, 40CU unlock |
| 10 | [WiFi और Bluetooth Dongles](docs/hi/10-wifi-bt.md) | dongles जो वास्तव में काम करते हैं |
| 11 | [Gaming परिणाम और Settings](docs/en/11-gaming.md) | benchmarks, प्रति-game tuning |
| 12 | [BC-250 पर AI / LLM](docs/en/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/hi/13-macos.md) | स्थिति |
| 14 | [Display और Output](docs/en/14-display.md) | DisplayPort, DP→HDMI adapters, dual screen |
| 15 | [Emulation](docs/en/15-emulation.md) | हर console/platform, वास्तविक स्थिति |
| 16 | [USB, Hubs और Storage](docs/en/16-usb-peripherals.md) | hubs, 5V mod, M.2 / SATA adapters |
| ❓ | [FAQ](docs/hi/faq.md) · [Troubleshooting](docs/hi/troubleshooting.md) | आम समस्याएँ |

---

## 🔗 शानदार संसाधन

प्रामाणिक सामुदायिक projects, इस आधार पर क्रमबद्ध कि समुदाय ने इनकी ओर कितनी बार इशारा किया।

### Documentation
- [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) — मुख्य hardware संदर्भ (reverse-engineering)
- [elektricM/amd-bc250-docs](https://github.com/elektricM/amd-bc250-docs) · [site](https://elektricm.github.io/amd-bc250-docs/) — व्यापक सामुदायिक docs (pinouts, प्रति-distro, troubleshooting)
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — संगठन का documentation
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — builds और scripts

### Overclock / Undervolt / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — वह governor जिसे अधिकांश builds चलाते हैं (clocks/voltage सेट करता है)
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — GUI के साथ oberon-governor fork (Linux)
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [bc250-collective fork](https://github.com/bc250-collective/cyan-skillfish-governor)
- [rw-r-r-0644/bc250-core-unlock](https://github.com/rw-r-r-0644/bc250-core-unlock) — 2 अक्षम CPU cores unlock करें (स्टॉक mask 0x77; 0xB7 mask का अर्थ भौतिक रूप से दोषपूर्ण cores है — इसे जबरन लगाने से artifacts और crashes मिलते हैं)
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — सभी 40 CUs unlock करें
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Toolkits & ready-made images
- [redbeard1083/bc250-toolkit](https://github.com/redbeard1083/bc250-toolkit) — CachyOS के लिए menu-driven setup: kernel, CPU/GPU governors, swap, ZRAM→ZSWAP, ACPI और boot tweaks
- [62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images](https://github.com/62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images) — BC-250 patches लागू किए हुए prebuilt Bazzite Deck/GNOME/KDE images

### Drivers
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — Windows GPU driver (प्रायोगिक, 2026 की शुरुआत तक कोई पूर्ण accel नहीं)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — PSP/GPU driver कार्य
- [DryhoppedIPA/bc250-gfx1013-fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix) — टूटी GPU compute queue (async compute) के लिए kernel + Mesa/RADV patches; यह FSR 4 / XeSS 3 INT8 path को भी ठीक करता है
- [MastaG/linux-cachyos-bc250](https://github.com/MastaG/linux-cachyos-bc250) — BC-250 cherry-picks के साथ CachyOS kernel
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — Linux kernel

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — सबसे अधिक उल्लेखित BIOS images और mods
- [TheRetroWeb — BC-250 BIOS database](https://theretroweb.com/bios?itemsPerPage=24&chipsetIds%5B%5D=1990) — स्टॉक BIOS dumps, version के अनुसार ब्राउज़/डाउनलोड करें
- [Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script](https://github.com/Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script) — menu-driven firmware backup और custom-firmware flashing
- flashing और brick recovery के लिए देखें [docs/hi/08-bios.md](docs/hi/08-bios.md)

### WiFi / BT dongles
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### AI / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Cases / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables और MakerWorld — देखें [docs/hi/05-case.md](docs/hi/05-case.md)

---

## 🤝 योगदान

यह एक **जीवंत** repo है। ज्ञान को सामुदायिक chat से एक पुनरुत्पादनीय pipeline द्वारा निकाला जाता है (देखें [CONTRIBUTING.md](CONTRIBUTING.md)) और नए exports पर फिर से चलाया जाता है। सुधारों, नए dongles, नए cases, सत्यापित commands वाले PRs का स्वागत है।

## 📄 License

Docs: [CC-BY-SA-4.0](LICENSE)। `assets/scripts/` के अंतर्गत Scripts: MIT। Mirror किए गए third-party firmware/drivers अपने मूल अधिकार बनाए रखते हैं — देखें [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md)।

## 🙏 आभार

संपूर्ण BC-250 समुदाय — इस हैंडबुक को संभव बनाने वाले शीर्ष योगदानकर्ताओं के लिए देखें **[CREDITS](CREDITS.md)**। स्रोत: *чат AMD BC-250 community*। Project लेखकों को ऊपर उनके repo handle से श्रेय दिया गया है।
