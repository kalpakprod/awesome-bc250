🌍 [English](README.md) · [Русский](README.ru.md) · [Українська](README.uk.md) · [Қазақша](README.kk.md) · [Кыргызча](README.ky.md) · [Español](README.es.md) · [Português (BR)](README.pt-BR.md) · [Français](README.fr.md) · [Deutsch](README.de.md) · [Polski](README.pl.md) · [Türkçe](README.tr.md) · [中文](README.zh.md) · [日本語](README.ja.md) · [العربية](README.ar.md) · **हिन्दी**

<p align="center">
  <img src="assets/img/hero.jpg" alt="awesome-bc250 — AMD BC-250 के नए उपयोगकर्ता के लिए बाइबल" width="100%">
</p>

# Awesome BC-250 [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> **AMD BC-250** के नए उपयोगकर्ता के लिए बाइबल — एक PlayStation 5-व्युत्पन्न APU board (Cyan Skillfish / Oberon, 16 GB GDDR6) जिसे एक सस्ते Linux gaming व AI box के रूप में फिर से उपयोग में लाया गया है।

**डिब्बे में पड़े एक board से लेकर games चलाने तक** आपको जो कुछ चाहिए वह सब — BC-250 समुदाय के 125k+ संदेशों से चुना गया, इस आधार पर क्रमबद्ध किया गया कि लोगों ने वास्तव में किसे upvote और pin किया, और प्रामाणिक project repos के विरुद्ध जाँचा गया।

🌍 भाषाएँ: [English](README.md) (मुख्य) · [Русский](README.ru.md) · **हिन्दी**

---

## ⚡ यहाँ से शुरू करें

नया board, कुछ नहीं जानते? क्रम से इस सुनहरे रास्ते पर चलें:

**[docs/hi/00-start-here.md](docs/hi/00-start-here.md)** — खरीदें → Power → ठंडा करें → OS install करें → Drivers → Overclock → खेलें।

---

## 📚 हैंडबुक

| # | अनुभाग | किसके लिए |
|---|---------|-----|
| 01 | [BC-250 क्या है](docs/en/01-what-is-bc250.md) | specs, आकार, pinout, अपेक्षाएँ |
| 02 | [खरीदारी गाइड](docs/en/02-buying.md) | कहाँ, कीमत, जोखिम, group buys |
| 03 | [Power Supply](docs/en/03-power-supply.md) | LOP / Flex ATX, 8-pin pinout, wiring |
| 04 | [Cooling](docs/en/04-cooling.md) | heatsink, fan shrouds, परीक्षण विधि |
| 05 | [Cases और 3D Printing](docs/en/05-case.md) | प्रिंट करने योग्य cases की सूची (STL) |
| 06 | [Linux Drivers और Setup](docs/en/06-linux.md) | distro चुनाव, amdgpu, install |
| 07 | [Windows Drivers और Setup](docs/en/07-windows.md) | driver स्थिति, कैसे करें |
| 08 | [BIOS और Brick Recovery](docs/en/08-bios.md) | mod BIOS, flashing, un-brick |
| 09 | [Overclocking और Undervolting](docs/en/09-overclock-undervolt.md) | governor, SMU, 40CU unlock |
| 10 | [WiFi और Bluetooth Dongles](docs/en/10-wifi-bt.md) | dongles जो वास्तव में काम करते हैं |
| 11 | [Gaming परिणाम और Settings](docs/en/11-gaming.md) | benchmarks, प्रति-game tuning |
| 12 | [BC-250 पर AI / LLM](docs/en/12-ai-llm.md) | llama.cpp, ROCm |
| 13 | [macOS / Hackintosh](docs/en/13-macos.md) | स्थिति |
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
- [AMD-BC-250/documentation](https://github.com/AMD-BC-250/documentation) — org docs
- [kenavru/BC-250](https://github.com/kenavru/BC-250) — builds और scripts

### Overclock / Undervolt / SMU
- [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) — वह governor जिसे अधिकांश builds चलाते हैं (clocks/voltage सेट करता है)
- [ZEROAESQUERDA/PS5GPU-BC250](https://github.com/ZEROAESQUERDA/PS5GPU-BC250) — GUI के साथ oberon-governor fork (Linux)
- [bc250-collective/amd_smu_reverse_engineering](https://github.com/bc250-collective/amd_smu_reverse_engineering)
- [bc250-collective/bc250_smu_oc](https://github.com/bc250-collective/bc250_smu_oc)
- [filippor/cyan-skillfish-governor](https://github.com/filippor/cyan-skillfish-governor) · [bc250-collective fork](https://github.com/bc250-collective/cyan-skillfish-governor)
- [duggasco/bc250-40cu-unlock](https://github.com/duggasco/bc250-40cu-unlock) — सभी 40 CUs unlock करें
- [WinnieLV/bc250-cu-live-manager](https://github.com/WinnieLV/bc250-cu-live-manager)
- [alexghow903/oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)

### Drivers
- [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) — Windows GPU driver (प्रायोगिक, 2026 की शुरुआत तक कोई पूर्ण accel नहीं)
- [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) — PSP/GPU driver कार्य
- [AMD-BC-250/kernel.opensuse](https://github.com/AMD-BC-250/kernel.opensuse) — Linux kernel

### BIOS / Firmware
- [TuxThePenguin0/bc250-bios](https://gitlab.com/TuxThePenguin0/bc250-bios) — सबसे अधिक उल्लेखित BIOS images और mods
- flashing और brick recovery के लिए देखें [docs/en/08-bios.md](docs/en/08-bios.md)

### WiFi / BT dongles
- [shenmintao/aic8800d80](https://github.com/shenmintao/aic8800d80) · [lwfinger/rtw88](https://github.com/lwfinger/rtw88) · [biglinux/rtl8831](https://github.com/biglinux/rtl8831)

### AI / LLM
- [ggml-org/llama.cpp](https://github.com/ggml-org/llama.cpp) · [ROCm/ROCm](https://github.com/ROCm/ROCm)

### Cases / 3D
- [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) · [bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case)
- Printables और MakerWorld — देखें [docs/en/05-case.md](docs/en/05-case.md)

---

## 🤝 योगदान

यह एक **जीवंत** repo है। ज्ञान को सामुदायिक chat से एक पुनरुत्पादनीय pipeline द्वारा निकाला जाता है (देखें [CONTRIBUTING.md](CONTRIBUTING.md)) और नए exports पर फिर से चलाया जाता है। सुधारों, नए dongles, नए cases, सत्यापित commands वाले PRs का स्वागत है।

## 📄 License

Docs: [CC-BY-SA-4.0](LICENSE)। `assets/scripts/` के अंतर्गत Scripts: MIT। Mirror किए गए third-party firmware/drivers अपने मूल अधिकार बनाए रखते हैं — देखें [assets/firmware/DISCLAIMER.md](assets/firmware/DISCLAIMER.md)।

## 🙏 आभार

संपूर्ण BC-250 समुदाय — इस हैंडबुक को संभव बनाने वाले शीर्ष योगदानकर्ताओं के लिए देखें **[CREDITS](CREDITS.md)**। स्रोत: *чат AMD BC-250 community*। Project लेखकों को ऊपर उनके repo handle से श्रेय दिया गया है।
