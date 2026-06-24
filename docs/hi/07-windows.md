> 🌐 सामुदायिक अनुवाद। अंग्रेज़ी संस्करण ही प्रामाणिक स्रोत है और अधिक नया हो सकता है। कोई त्रुटि मिली? issue खोलें: [English](../en/07-windows.md) · https://github.com/lildebil0/awesome-bc250/issues

# Windows Drivers और Setup

> **संक्षेप में** — **2026 की शुरुआत तक BC-250 के लिए कोई काम करने वाला Windows GPU driver नहीं है।** Windows install होता है और boot होता है, पर GPU **Code 43** के साथ बैठा रहता है और शून्य 3D acceleration देता है — हर off-the-shelf AMD driver (Adrenalin, Pro, W5700 `.inf` trick) को hardware अस्वीकार कर देता है। समुदाय इसे **शून्य से reverse-engineer कर रहा है**, और ईमानदार स्थिति यह है कि "शुरुआती plumbing काम करती है, अभी तक games कुछ भी render नहीं करते।" यदि आप इस board का आज वास्तव में *उपयोग* करना चाहते हैं, तो **Linux install करें** ([06-linux.md](06-linux.md)) — काम करने वाला driver वहीं रहता है। इस पृष्ठ पर हर चीज़ को संदेह से देखें और भरोसा करने से पहले repo के commit dates जाँचें।

नए लोगों के लिए 2025 से pinned, लंबे समय से चली आ रही समुदाय की राय: *"यहाँ प्रवेश करने वाले सभी, आशा त्याग दो। Windows drivers 99.5% संभावना से नहीं होंगे। एक driver के बिना यह board लगभग पूरी तरह बेकार है। Linux driver मौजूद है — यदि आप उस OS के लिए तैयार नहीं हैं, तो आपको इस board की ज़रूरत नहीं है।"* ([src](https://t.me/c/2424231195/28109))

यह एक साल से अधिक समय तक सहमति थी। 2026 में इसे **आख़िरकार चुनौती दी जा रही है** — पर धीरे-धीरे, और ईमानदार उत्तर अभी भी है: अभी नहीं।

---

## यहाँ Windows कठिन क्यों है (Code 43 की दीवार)

BC-250 APU ("Cyan Skillfish" / Oberon, GFX10.1.3) खुद को OS के सामने एक **unknown device** के रूप में प्रस्तुत करता है — PCI ID `1002:13FE` — जिसे कोई shipping AMD driver नहीं पहचानता। लोगों ने सब कुछ आज़माया है:

- **Device Manager को एक official `.inf` ज़बरदस्ती खिलाना**: एकमात्र driver जो Windows "compatible" के रूप में पेश करता है वह है **Radeon Pro W5700**। यह install होता है, फिर **Error 43** पर अटक जाता है, बिलकुल हर दूसरे आज़माए गए driver की तरह। ([src](https://t.me/c/2424231195/57123))
- **`.inf` को edit करना / device IDs बदलना** (gfx1013, 1014, Navi 21/22/23 "Dragonball", legacy entries), driver signature enforcement को disable करना, यहाँ तक कि USB से Windows 10 boot करना और एक Steam Deck driver आज़माना — **सब मृत-अंत**। legacy entries बिना error के दिखती हैं केवल एक display bug के कारण, इसलिए नहीं कि वे काम करती हैं। ([src](https://t.me/c/2424231195/94029))
- **BIOS को mod करना** ताकि device ID बदले, इससे भी मदद नहीं मिली — iGPU अभी भी `1002:13FE` रिपोर्ट करता है। Dev ID **APU में वेल्ड किया हुआ** लगता है, केवल BIOS में नहीं, इसलिए एक स्थान को patch करना पर्याप्त नहीं है। ([src](https://t.me/c/2424231195/57123))

Linux क्यों काम करता है और Windows क्यों नहीं? Linux पर open-source **amdgpu/Mesa** stack को समुदाय ने इस ठीक चिप को पहचानने के लिए patch किया (और आंशिक रूप से upstream किया); Windows पर patch करने के लिए कोई open driver नहीं है — AMD ने इस mining/server part के लिए कभी कोई Windows driver नहीं भेजा, और closed Adrenalin/Pro stack unknown ID को अस्वीकार करता है। ([src](https://t.me/c/2424231195/13210)) "BC-250 drivers" पर AMD का अपना forum thread कहीं नहीं पहुँचा। ([community.amd.com](https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692))

> **कोई GPU passthrough escape hatch भी नहीं है।** BC-250 को pass-through करके एक VM में Windows चलाना काम नहीं करता: इस board पर IOMMU passthrough path टूटा हुआ है, और यह एक *APU* है (एक discrete card नहीं जिसे host साफ़-सुथरे ढंग से सौंप सके), और चिप को शुरू से ही एक unknown device के रूप में गलत-पहचाना जाता है। ([src](https://t.me/c/2424231195/64772))

---

## वर्तमान driver स्थिति — वास्तव में क्या मौजूद है (2026 की शुरुआत तक)

2025 के अंत में समुदाय ने AMD का इंतज़ार करना बंद कर दिया और hardware को reverse-engineer करके **शून्य से एक Windows driver बनाना** शुरू कर दिया। दो प्रयास महत्त्वपूर्ण हैं; दोनों **experimental, WIP हैं, और अभी तक games render नहीं करते।**

### Keshas-dev — शून्य-से WDDM driver (सबसे सक्रिय)

companion kernel-mode drivers की एक जोड़ी, सबसे सक्रिय रूप से विकसित Windows प्रयास (इस लेखन तक **अकेले PSP driver के ~56 commits हैं**):

- **[Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver)** — **PSP** (Platform Security Processor) के लिए एक low-level driver। **क्या काम करता है:** यह load होता है, **SOS firmware** boot करता है, BAR5 MMIO पर hardware registers पढ़ता/लिखता है (GC, MMHUB, HDP, NBIO, DF blocks), NBIO unlock करता है, और GPU driver के लिए एक register proxy के रूप में काम करता है। **क्या नहीं करता:** GPCOM ring creation (SOS firmware TOS ring protocol का समर्थन नहीं करता), ring buffer के माध्यम से GPU-firmware loading, और Trusted Memory Region init। दूसरे शब्दों में: यह चिप से बात कर सकता है, पर **अभी तक graphics engine को चालू नहीं कर सकता।** ([repo](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver/commits/main/))
- **[Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver)** — companion GPU driver। PSP driver के समान certificate/test-signing infrastructure साझा करता है और इसे एक register bridge के रूप में उपयोग करता है। अभी भी शुरुआती; कोई उपयोग करने योग्य 3D output नहीं। ([repo](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver/commits/main/))

जीवन का पहला सार्वजनिक संकेत अक्टूबर 2025 में एक member द्वारा **"मेरा पहला काम करने वाला driver (OpenGL 1.1)"** की रिपोर्ट थी ([src](https://t.me/c/2424231195/83320)) — ठीक इसलिए मनाया गया क्योंकि एक मुश्किल से काम करने वाले driver का भी *install और run होना* Code 43 के एक साल बाद एक असली मील का पत्थर था: *"यदि यह driver सचमुच install हुआ और काम करता है (भले ही ख़राब) — तो यह एक बहुत बड़ा कदम है।"* ([src](https://t.me/c/2424231195/83332)) उस लहर से एक driver dump, `AMD Radeon BC-250 (Cyan Skillfish) driver 00.00.01.7z`, chat में साझा/pinned किया गया था। ([src](https://t.me/c/2424231195/83322)) **ऐसे किसी भी शुरुआती dump को experimental मानें — version `00.00.01` ठीक उतना ही कच्चा है जितना सुनाई देता है।**

### ZEROAESQUERDA — WDDM 2.0 reference implementation

**[ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest)** — एक अलग प्रयास ("Portuguese आदमी ने कुछ शुरू किया"), मार्च 2026 में chat में pinned किया गया इस संकेत के रूप में कि बर्फ़ टूट रही थी। ([src](https://t.me/c/2424231195/123644)) इसे सबसे अच्छा एक **reference/शैक्षिक WDDM 2.0 implementation** के रूप में समझा जाता है, एक उपयोग करने योग्य driver के रूप में नहीं:

- केवल **Direct3D 9 DDI** लागू करता है; **D3D11, D3D12, और Vulkan लागू नहीं हैं।**
- **RDNA2 (GFX10.1 ISA) के लिए Shader compilation कार्यशील नहीं है** — यह shader submissions स्वीकार करता है पर उन्हें असली hardware के लिए compile नहीं कर सकता, इसलिए कुछ भी render नहीं होता।
- Command Processor microcode **load नहीं** करता (BIOS-loaded firmware पर निर्भर करता है); **VCN video encode/decode असमर्थित**; केवल single DisplayPort output।
- **test-signing mode** की ज़रूरत है (कोई WHQL signature नहीं)। main पर केवल ~2 commits।

समय खर्च करने से पहले project का अपना **[Known Limitations](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas)** अनुभाग देखें।

> ⚠ **Repo-नाम सुधार।** मुख्य repo सूची "Drivers → Windows" के तहत `ZEROAESQUERDA/PS5GPU-BC250` की ओर इशारा करती है। जाँच पर वह repo एक **Linux GPU governor** है (एक GUI वाला Oberon-governor fork), एक Windows driver **नहीं**। इस लेखक का असली Windows code **`BC250-windowsDriverTest`** है।

### एक नज़र में स्थिति

| Project | प्रकार | क्या काम करता है | क्या नहीं करता | आज इसे उपयोग करें? |
|---|---|---|---|---|
| Keshas-dev/AMD-BC-250-PSP-Driver | PSP kernel driver (WIP) | SOS firmware boot, BAR5 register R/W, NBIO unlock, register proxy | GPU ring creation, FW load, TMR init | नहीं — केवल plumbing |
| Keshas-dev/AMD-BC-250-Windows-Driver | GPU driver (WIP) | PSP driver के साथ load होता है | कोई उपयोग करने योग्य 3D नहीं | नहीं |
| ZEROAESQUERDA/BC250-windowsDriverTest | WDDM 2.0 reference | Driver model scaffolding, D3D9 DDI मौजूद | Shader compile, D3D11/12, Vulkan, VCN | नहीं — शैक्षिक |
| Adrenalin / Pro / W5700 `.inf` | Official AMD | — | **Code 43**, कुछ नहीं | नहीं |

**निष्कर्ष:** आज कोई भी BC-250 पर Windows पर games नहीं खेल रहा है। काम असली है और तेज़ हो रहा है, पर यह "क्या हम GPU को बिल्कुल भी initialize कर सकते हैं" चरण पर है, "मेरा Cyberpunk FPS क्या है" चरण पर नहीं।

---

## यदि आप अभी भी WIP drivers आज़माना चाहते हैं

यह उन tinkerers के लिए है जो **टेस्ट में मदद करना** चाहते हैं, एक काम करने वाला desktop पाने के लिए नहीं। आपको चाहिए होगा:

- **Windows 10 (build 1607+) या Windows 11, x64।**
- **Test signing enabled** और **Secure Boot disabled** (ये drivers unsigned/test-signed हैं):
  ```
  bcdedit /set testsigning on
  ```
  Reboot करें। ⚠ verify — सटीक steps प्रत्येक repo के README का पालन करते हैं; यहाँ के commands मानक WDK test-sign flow हैं, किसी project script से copy नहीं किए गए।
- repo की प्रदान की गई **PowerShell script** (जैसे `Install-Driver.ps1`) के माध्यम से या `pnputil` के साथ manually install करें। इस पृष्ठ का नहीं, **repo README** का पालन करें — ये projects तेज़ी से बदलते हैं और install steps उनके साथ चलते हैं।

अपेक्षा करें: सबसे अच्छे में device enumerate होता है और शुरुआती init logs दिखाई देते हैं; सबसे बुरे में कुछ नहीं बदलता या आपको एक अलग error code मिलता है। **जिस किसी चीज़ की आप परवाह करते हैं उसका backup लें और मान लें कि यह render नहीं करेगा।**

### ⚠ अपुष्ट अफ़वाह: "drivers leak करने से board brick हो जाता है"

2025 की शुरुआती beta-test चरण के दौरान, एक member ने चेतावनी दी कि **pre-release drivers leak करने के लिए BC-250s को remotely brick किया जा रहा था** — Reddit पर bricking, remote device blocks की रिपोर्ट का दावा करते हुए, और कि एक hardware programmer भी उन्हें unlock नहीं कर सका। ([src](https://t.me/c/2424231195/26231)) **हम इसकी पुष्टि नहीं कर सके**, और इसके चारों ओर का पूरा "private beta" ढाँचा संदिग्ध है (अगला अनुभाग देखें)। पूर्णता के लिए उल्लेख किया गया; इसे स्थापित तथ्य के रूप में न लें। यदि आप असंबंधित कारणों से एक board brick करते हैं, तो recovery के लिए [08-bios.md](08-bios.md) देखें।

---

## अफ़वाहें, मज़ाक और मृत-अंत — इनके चक्कर में न पड़ें

BC-250 पर Windows-driver hype का **शरारतों और इच्छाधारी सोच** का लंबा इतिहास है। मशहूर वालों को जानें ताकि आप एक सप्ताहांत बर्बाद न करें:

- **"AMD BC-250 के लिए NVIDIA driver।"** एक **April Fools' Day (1 अप्रैल 2026)** मज़ाक — एक चिकना नकली "NVIDIA NEW DRIVER RELEASE … for AMD BC-250" banner जिसने थोड़ी देर के लिए लोगों को पूछने पर मजबूर कर दिया *"क्या NVIDIA ने सचमुच एक BC-250 Windows driver release किया?!"* ([src](https://t.me/c/2424231195/130053)) इसने नहीं किया। NVIDIA एक AMD APU के लिए drivers नहीं बनाता। chat में प्रतिक्रिया थी *"लंबे समय से प्रतीक्षित मज़ाक आ गया है।"* ([src](https://t.me/c/2424231195/130727)) यह भी ध्यान दें कि `whql-amd-software-adrenalin-edition-25.5.1-...-bc250.exe` जैसे नाम वाली एक `.exe` घूम रही थी — filename पर "bc250" चिपका हुआ एक सामान्य Adrenalin installer इसे एक BC-250 driver **नहीं** बना देता। ([src](https://t.me/c/2424231195/73924))
- **"बस एक समान card का driver force-install करें।"** RX 6700 / W5700 / Radeon Pro V340 — हर नए व्यक्ति का पहला विचार, और यह *"हर उस मूर्ख"* को सूझा है जिसने कभी BC-250 पकड़ा है। यह काम नहीं कर सकता, ऐसे कारणों के ढेर के लिए जिन्हें फिर से निकालना सार्थक नहीं: **BC-250 पर कोई Windows drivers नहीं, कोई honor नहीं, और कोई beer नहीं है।** ([src](https://t.me/c/2424231195/29710))
- **channel में Malware।** लोगों ने नकली "drivers" पोस्ट किए हैं जो viruses/zip-bombs/phishers थे। Mods देखते ही ban करते हैं; एक बार `Trojan.txt` नाम की एक फ़ाइल सचमुच दिखाई दी। ([src](https://t.me/c/2424231195/49668)) **केवल नामित GitHub repos से binaries चलाएँ, और code पढ़ें।**

---

## लोग जिस 40-CU unlock script का उल्लेख करते हैं उसका क्या?

`git clone https://github.com/duggasco/bc250-40cu-unlock.git` Windows-topic बातचीत में दिखता है, और master resource list इसे "Windows" के तहत भी tag करती है। **यह एक Linux `amdgpu` kernel patch / script है** (`bc250-enable-40cu.sh`), एक Windows tool नहीं — यह Linux driver पर सभी 40 CUs को unlock करता है। इसे [09-overclock-undervolt.md](09-overclock-undervolt.md) में ठीक से कवर किया गया है; यह Windows के लिए कुछ नहीं करता। ⚠ verify (कोई Command-corpus shell history एक Windows उपयोग की पुष्टि नहीं करती; पकड़ा गया एकमात्र command ऊपर का सादा `git clone` है)।

---

## सिफ़ारिश

| आप चाहते हैं… | यह करें |
|---|---|
| Games खेलना / board का अभी वास्तव में उपयोग करना | **Linux install करें।** देखें [06-linux.md](06-linux.md)। काम करने वाला GPU driver केवल वहीं मौजूद है। |
| Windows प्रयास का अनुसरण / योगदान करना | **Keshas-dev** (PSP + GPU driver) और **ZEROAESQUERDA/BC250-windowsDriverTest** देखें; kernel/WDK काम की अपेक्षा करें, gaming की नहीं। |
| एक जादुई `.inf` या "समान card" driver | ऐसा कोई नहीं है। यहीं रुकें — आप केवल Code 43 से टकराएँगे। |

Windows समर्थन एक **चलता-फिरता लक्ष्य** है: कार्य करने से पहले repo के commit dates और इस अनुभाग की तारीख़ (यह **2026 की शुरुआत** को दर्शाता है) फिर से जाँचें। 2025 की राय "कभी नहीं" थी; 2026 ने इसे "अभी नहीं" तक घटा दिया — असली प्रगति, पर firmware-init परत पर प्रगति, playable-desktop परत पर नहीं।

---

## स्रोत

- Pinned newcomer चेतावनी ("abandon all hope") — https://t.me/c/2424231195/28109
- Code 43 / W5700 `.inf` / BIOS-mod प्रयास — https://t.me/c/2424231195/57123 · https://t.me/c/2424231195/94029
- "No Windows drivers, no honor, no beer" — https://t.me/c/2424231195/29710 · Linux क्यों Windows नहीं — https://t.me/c/2424231195/13210
- VM passthrough काम नहीं करेगा — https://t.me/c/2424231195/64772
- पहला "काम करने वाला" driver (OpenGL 1.1) और प्रतिक्रिया — https://t.me/c/2424231195/83320 · https://t.me/c/2424231195/83332 · driver dump `00.00.01` — https://t.me/c/2424231195/83322
- ZEROAESQUERDA project pinned / "ice breaking" — https://t.me/c/2424231195/123644
- April Fools "NVIDIA driver" — https://t.me/c/2424231195/130053 · https://t.me/c/2424231195/130727 · गलत-label वाली Adrenalin `.exe` — https://t.me/c/2424231195/73924
- Malware-ban नीति — https://t.me/c/2424231195/49668 · brick-on-leak अफ़वाह (अपुष्ट) — https://t.me/c/2424231195/26231
- Repos — [Keshas-dev/AMD-BC-250-PSP-Driver](https://github.com/Keshas-dev/AMD-BC-250-PSP-Driver) · [Keshas-dev/AMD-BC-250-Windows-Driver](https://github.com/Keshas-dev/AMD-BC-250-Windows-Driver) · [ZEROAESQUERDA/BC250-windowsDriverTest](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest) ([known limitations](https://github.com/ZEROAESQUERDA/BC250-windowsDriverTest?tab=readme-ov-file#15-limita%C3%A7%C3%B5es-conhecidas))
- AMD forum thread (कहीं नहीं पहुँचा) — https://community.amd.com/t5/pc-drivers-software/bc-250-drivers/td-p/671692
- 40-CU unlock (Linux, गलत-tagged Windows) — https://github.com/duggasco/bc250-40cu-unlock → देखें [09-overclock-undervolt.md](09-overclock-undervolt.md)

> 40-CU unlock, governor, और Linux driver setup [06-linux.md](06-linux.md) और [09-overclock-undervolt.md](09-overclock-undervolt.md) में रहते हैं। Brick recovery: [08-bios.md](08-bios.md)।
