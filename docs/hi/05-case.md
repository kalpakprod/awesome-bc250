> 🌐 सामुदायिक अनुवाद। अंग्रेज़ी संस्करण ही प्रामाणिक स्रोत है और अधिक नया हो सकता है। कोई त्रुटि मिली? issue खोलें: [English](../en/05-case.md) · https://github.com/lildebil0/awesome-bc250/issues

# Cases और 3D Printing

> **संक्षेप में** — BC-250 एक नंगे board के रूप में आता है, इसलिए लगभग हर कोई एक enclosure print करता है। कोई एक "सही" case नहीं है — समुदाय ने **दर्जनों** designs बनाए हैं, एक minimal **cooling sleeve** से जो बस board के चारों ओर दो हिस्सों को clip कर देता है, से लेकर carry handle, front screen और RGB वाले पूरे **console-style boxes** तक। आप जो भी print करें, case को एक काम करना ही होता है जो stock board नहीं कर सकता: **heatsink fins के विरुद्ध एक 120 mm fan को seal करना** ताकि हवा उनके *आर-पार* जाए (देखें [Cooling](04-cooling.md))। यह page एक catalog है: नाम → STL → fans → कहाँ से download करें। **PSU का ध्यान रखें**: ज़्यादातर cases किसी एक विशिष्ट power supply (LOP, Flex/SFX ATX, या एक HP server brick) के आसपास डिज़ाइन किए गए हैं — वह case चुनें जो आपके पास मौजूद [PSU](03-power-supply.md) से मेल खाता हो।

यहाँ एक "case" का दायरा एक 200 g print से, जिसमें 20 मिनट का काम लगता है, एक multi-part console तक है जिसे बनाने में इसके author को हफ्ते लगे। सरल से शुरू करें; आप हमेशा फिर से print कर सकते हैं।

> **नए हैं और अनिश्चित हैं? [onemorecap sleeve/shell](#tier-1--minimal-cooling-sleeve-start-here) case print करें — minimal, कुछ काटने को नहीं, एक अकेले 120 mm fan में फिट — और वहीं रुक जाएँ।** नीचे का catalog गहरा है; शुरू करने के लिए आपको इसे पढ़ने की ज़रूरत नहीं है।

> **पूरी सूची चाहिए?** elektricM एक **searchable, filterable catalog of ~143 designs** रखता है (PSU family, availability, platform से filter करें) — नीचे के curated set से कहीं ज़्यादा, जिसमें कई Discord-only और WIP builds शामिल हैं। इसे यहाँ browse करें: **[elektricM — Cases & Enclosures](https://elektricm.github.io/amd-bc250-docs/community/cases/)**। नीचे के picks नामित, सार्वजनिक रूप से downloadable वाले हैं जिनसे शुरू करना ठीक है।

---

## Community builds

लोगों ने वास्तव में जो print किया है उसकी एक झलक — एक नंगे खुले shell से लेकर पूरी तरह themed consoles तक। एक ही board, बेतहाशा अलग-अलग नतीजे।

<p align="center">
  <img src="../../assets/img/case-shell.jpg" alt="onemorecap Shell Case: खुली side-plate, carry handle, उजागर copper fins, Arctic 120 mm fan" width="60%"><br>
  <sub>Build by Дима Ткач · <a href="https://t.me/c/2424231195/22771">source</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-frame.jpg" alt="सफ़ेद aluminium खुला frame जिसमें internals दिख रहे हैं: twin heatsinks, बीच में सफ़ेद Arctic fan, Flex PSU" width="60%"><br>
  <sub>Build by Сергей · <a href="https://t.me/c/2424231195/87420">source</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-orange.jpg" alt="नारंगी-और-सफ़ेद enclosed console जिसमें perforated mesh side panel और एक moulded carry handle है" width="60%"><br>
  <sub>Build by Alexander Susl · <a href="https://t.me/c/2424231195/122822">source</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-arasaka.jpg" alt="ARASAKA cyberpunk-themed console: सफ़ेद face, chrome fan grille, हरे accents और feet" width="60%"><br>
  <sub>Build by Maxim Perelygin · <a href="https://t.me/c/2424231195/98072">source</a></sub>
</p>

---

## कैसे चुनें

तीन सवाल तय करते हैं कि कौन-सा case आपके लिए फिट है:

1. **आप कौन-सा PSU इस्तेमाल कर रहे हैं?** ([Power Supply](03-power-supply.md)) — एक Meanwell **LOP-300** छोटा है और ज़्यादातर cases के *अंदर* रहता है। एक **Flex/SFX ATX** PSU बड़ा है और इसे एक dedicated bay वाला case चाहिए। एक salvage किया हुआ **HP/server brick** "v3/v4 server PSU" cases माँगता है। यह सबसे बड़ा अकेला filter है।
2. **आप कौन-सा/कौन-से fan(s) चलाएँगे?** लगभग हर case heatsink के ऊपर **एक 120 mm fan** के आसपास बना है। बड़े builds backplate पर एक **दूसरा 120 mm** fan जोड़ते हैं (GDDR6 memory को ठंडा करने के लिए, जिसमें [कोई temperature sensor नहीं](04-cooling.md) है) या PSU को हवा देते हैं। कुछ जहाँ ऊँचाई कम है वहाँ **140 mm** या **slim** fans इस्तेमाल करते हैं।
3. **क्या आपने fins पतले कर लिए हैं?** ज़्यादातर cases मानकर चलते हैं कि आप पहले ही **stock heatsink fins को file/sand करके** खोल चुके हैं (देखें [Cooling, Path A](04-cooling.md))। अकेला case stock cooler को ठीक नहीं करता — यह बस fan को सही जगह पर पकड़ता है।

> **Jargon, एक बार:** **STL** = standard 3D-print mesh file जिसे आप एक slicer में load करते हैं। **STEP / 3MF** = editable CAD formats (इन्हें इस्तेमाल करें अगर आप design को modify करना चाहते हैं)। **Shroud / sleeve / adapter** = एक printed funnel जो fan को fins के विरुद्ध seal कर देता है ताकि हवा उनके इर्द-गिर्द से रिसने के बजाय आर-पार जाए। **Flex / SFX ATX** = small form-factor PC power supplies। **LOP** = Meanwell LOP-300 industrial PSU जिसे समुदाय पसंद करता है।

> **💡 CMOS-clear jumper तक एक access hole print करें।** हर बार जब आप VRAM/UMA split बदलते हैं तो आपको **CMOS clear करना** पड़ता है (देखें [BIOS](08-bios.md)), इसलिए एक sealed case डिज़ाइन करना जो jumper को दबा देता है, मतलब इसे बार-बार खोलना। किसी भी enclosed design में clear-CMOS jumper के ऊपर एक **⌀10 mm access hole** छोड़ें — या, बेहतर, एक छोटा **3-position switch** panel तक wire कर दें ताकि आप इसे बिना tools के reset कर सकें। ([4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980))

---

## Tier 1 — Minimal "cooling sleeve" (start here)

सबसे छोटी, सबसे तेज़ चीज़ जो आप print कर सकते हैं। यह **असल में case नहीं है** — यह एक printed jacket है जो board पर दो हिस्सों में एक tight friction fit पर snap हो जाता है, एक 120 mm fan को heatsink के विरुद्ध पकड़ता है, और हवा को duct करता है। **कुछ काटने को नहीं, board में कोई screws नहीं।** Дима Ткач (project के सबसे शुरुआती builders में से एक) दो variants बताते हैं — एक compact और एक "more fun looking" — दोनों **150 W** load पर **~70 °C** छूते हैं, हर एक में ~210 g / ~170 g plastic, और PSU turbulent airflow पर ठंडा रहता है ([src](https://t.me/c/2424231195/10743))। उनका फ़ैसला: *"यह असल में case नहीं है, बल्कि एक cooling sleeve है, पर कुछ काटने की ज़रूरत नहीं, यह सब एक बहुत tight fit पर टिका रहता है, हिस्से विपरीत तरफ़ों से गिरा दिए जाते हैं।"*

- **Files:** `BC-250-FanSleeves.3mf` ([src](https://t.me/c/2424231195/10766)), board CAD `bc-250-body.step` ([src](https://t.me/c/2424231195/18266))
- **Source repo:** [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) — chat में सबसे ज़्यादा अनुशंसित "verified, printed, confirmed working" minimal design ([src](https://t.me/c/2424231195/18260))
- **Fan:** 1× 120 mm
- **PSU:** कोई भी — power lead के लिए एक hole/cut-out है ताकि आप एक LOP *या* एक external supply इस्तेमाल कर सकें ([src](https://t.me/c/2424231195/22950))

---

## Tier 2 — Open frame / "shell" (board on display)

Half-cases जो board को एक तरफ़ से लपेटते हैं और heatsink को दिखता हुआ छोड़ देते हैं। plastic में हल्के, assemble करने में आसान, अच्छा airflow।

### onemorecap "Shell Case" — reference build

chat में सबसे ज़्यादा value-react किया गया case post (❤33): board के ऊपर एक flat side-plate जिस पर **"BC-250"** और CU-grid pattern उभरा हुआ है, ऊपर में moulded एक **carry handle**, बीच में **पतले heatsink fins उजागर**, और दाएँ छोर पर bolt किया गया अपने ही shroud में एक 120 mm **Arctic** fan। *"BC-250 SHELL CASE BY ONEMORECAP / ASRock × CMG"* से चिह्नित ([src](https://t.me/c/2424231195/22771))। STLs का मेल खाता set chat में एक batch में post किया गया था ([src](https://t.me/c/2424231195/81672)) और author ने पुष्टि की कि models Printables और MakerWorld पर मुफ़्त हैं ([src](https://t.me/c/2424231195/24505))।

- **Files (chat batch):** `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl`, साथ में नीचे दिए fan shrouds ([src](https://t.me/c/2424231195/81680))
- **Source:** [GitHub onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case)
- **Fan:** 1× या 2× 120 mm (shroud के ज़रिए), या 1× 140 mm
- **PSU:** `Shell_Back_FLEX_ATX` back panel एक **Flex ATX** PSU के लिए कटा हुआ है

### Acrylic open frame (Владислав)

एक खुला **aluminium-and-acrylic** frame: दो metal end-plates clear side panels के साथ, board vertically mounted, बीच में पतले heatsink के सीधे आर-पार फेंकता एक अकेला **Arctic 120 mm** fan, और नीचे की bay में बैठा एक Flex/SFX PSU ([src](https://t.me/c/2424231195/114651))। यह वही design है जिसे बाद में [r/BC250Gaming पर "acrylic case" के रूप में](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) cross-post किया गया। printed brackets वे हिस्से हैं जिन्हें आप दोबारा बनाते हैं; frame खुद laser-cut/off-the-shelf है।

- **Fan:** 1× 120 mm (center) — एक backplate fan जोड़ने की जगह
- **PSU:** Flex / SFX ATX निचली bay में

---

## Tier 3 — Console-style boxes (fully enclosed)

बंद enclosures जो एक game console या एक छोटे NAS जैसे दिखते हैं। ज़्यादा plastic और ज़्यादा print time, पर एक तैयार product जिसमें handle, power button, vented panels और कभी-कभी एक screen होती है।

### "Просто лучший корпус" (Jack Fisher × B1zon) — community favourite

curated **#BC250body** tag के तहत *"simply the best case"* के रूप में post किया गया, यह एक पूरी तरह तैयार console है जिसमें एक published bill of materials है: PSU, fans, connector, rubber feet, power button, screws + threaded inserts, एक fan PWM splitter, एक "Cyberpunk" sticker और एक heatsink-straightening comb। कुछ हिस्से production से बाहर हैं और उनके substitutes हैं ([src](https://t.me/c/2424231195/79990))। Design श्रेय B1zon को, assembly Jack Fisher द्वारा।

- **Files:** `BC250 korpus исправленный.rar` ("BC250 case, corrected") ([src](https://t.me/c/2424231195/79989))
- **Fan:** 120 mm (front) + एक दूसरे fan के लिए PWM splitter
- **PSU:** internal (LOP-class)

### Triple-"GPU" front (Гослинг)

एक console box जिसका front panel एक **fake graphics-card shroud** है — एक पंक्ति में तीन गोल fan cut-outs RGB के साथ, ताकि machine एक discrete GPU जैसी दिखे। BC-250 पर **Bazzite 42** चलते हुए दिखाया गया ([src](https://t.me/c/2424231195/66616))। तीन openings अकेले काम करते fan plus intake के ऊपर cosmetic हैं।

### Maze-panel white console (Jhonatan)

एक ऊँचा सफ़ेद box जिसमें एक आकर्षक **maze/circuit-pattern vented side panel**, एक illuminated (हरा) metal power button, और front face पर एक full-height intake grille है — chat के अधिक polished aesthetics में से एक ([src](https://t.me/c/2424231195/121274))।

### Grid-mesh mini-tower (Joglik)

एक grey vertical mini-tower जिसमें side और top पर घना **square-grid mesh**, top edge में एक slot/handle notch, और पीछे नीचे एक गोल cable pass-through है। साफ़-सुथरा industrial look ([src](https://t.me/c/2424231195/126525))।

### Oval-window hi-fi box (a m)

एक सफ़ेद rectangular case जो एक hi-fi/microwave front जैसा styled है: एक बड़ी **stadium-shaped mesh window** जिसके पीछे एक circular mesh के पीछे fan दिखता है, दोनों ओर दो vertical mesh slots ([src](https://t.me/c/2424231195/52955))। author का बाद का iteration foamed PVC के बजाय "proper plastic" की ओर बढ़ता है और external XT-series power और RGB जोड़ता है ([src](https://t.me/c/2424231195/128048))।

### Compact console (Volodymyr Spyrydonov, "v15")

एक छोटा silver-and-black console box जिसमें एक mesh side intake और एक gहरा front है जिस पर एक cyberpunk-style emblem और एक RGB strip है, एक living-room machine के रूप में एक TV के बगल में बैठा दिखाया गया ([src](https://t.me/c/2424231195/135995))। revisions की एक लंबी कतार का हिस्सा (v15/v19/v20 source images शुरू में ही साझा किए गए थे)।

### BC250 Vented Edition (MaelremremDotXYZ)

एक minimalist **FlexATX** console जो **fins-open** चलाया गया, **2145 MHz / 1.1 V** पर **~67 °C** बनाए रखता है, एक rear PSU kill-switch के साथ। [MakerWorld 2899020](https://makerworld.com/en/models/2899020)।

### Stellar 250 (isaacalvex)

एक पूर्ण self-contained console जिसमें एक संपूर्ण **build guide** है: internal storage, **WiFi 6**, और एक **ESP32 temperature display**। [GitHub isaacalvex/AMD-BC-250-Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide)।

### Simple Case for the ASRock AMD BC-250

एक नामित, सार्वजनिक रूप से downloadable console enclosure जिसे [YouTube पर Ukrainian build walkthrough](https://youtu.be/p5Zd86vFe8w) के author ने publish किया — उनके लिए एक सीधा-सादा बंद box जो multi-part जटिलता के बिना एक तैयार print चाहते हैं। [MakerWorld 2870270](https://makerworld.com/en/models/2870270)।

---

## Tier 4 — Big builds: ATX PSU, AIO liquid, screens

उन लोगों के लिए जो एक full-size PSU, liquid cooling, या एक integrated display चाहते हैं।

### NexGen3D "DIY Steam Machine" family

समुदाय में **सबसे ज़्यादा संदर्भित किया गया 3D project** (7× repost)। Printables पर console cases का एक family, जिसमें एक **liquid-cooled "Pro"** variant और एक **"Redux"** edition शामिल है जो front में एक **internal 1080×480 Pi screen** फिट करता है ([Reddit build](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/))। die पर एक 120 mm all-in-one liquid cooler लगाने के लिए एक dedicated **AIO mount** model है।

- [Printables 1499974 — DIY Steam Machine (base)](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite)
- [Printables 1614131 — Pro Liquid-Cooled](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) · [Printables 1649679 — Redux](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) · [Printables 1554003 — AIO mount](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250)
- **Fan/cooling:** variant के अनुसार 120 mm air **या** 120 mm AIO
- **PSU:** LOP version और ATX versions documented

### "Steam Machine Pro" liquid-cooled reference build (Old Lamer)

एक high-end, पूरी तरह liquid-cooled build जो video पर end-to-end documented है — एक AIO machine पर पूरी तरह जाने पर एक parts shopping list के रूप में उपयोगी ([Old Lamer](https://youtu.be/afYhUQFa-AY))। published BOM:

- **AIO:** TEUCER AF 240 (240 mm all-in-one) die पर
- **PSU:** Mean Well **LOP-600-12** (या छोटे विकल्प के रूप में **LOP-500-12**) — देखें [Power Supply](03-power-supply.md)
- **Fans:** 2× Arctic **P12 Pro** + 1× Arctic **P8**
- **Remote power:** machine को remotely on/off switch करने के लिए एक **ESP32 relay board**
- **Software:** AIO pump और fans चलाने के लिए Linux के तहत **OpenLinkHub** / **Commander Duo**

---

### Steam Cube — parametric vertical case, water-cooled (in development)

**Xbox Series X** form factor में एक **fully parametric** vertical case, जो **water-cooling-first** डिज़ाइन किया गया है, एक swappable cold-side के साथ: एक water block, एक **Thermalright AXP90-X47 Full-Copper**, या एक अकेला **Arctic P12 Max** सब एक ही mount पर bolt होते हैं। यह **Sol Diego के "Xbox Serie X BC-250 Edition"** sketch ([Printables 1748271](https://www.printables.com/model/1748271)) और सटीक **torassk board model** ([Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)) से निकला, फिर code (build123d) के रूप में फिर से बनाया गया ताकि हर dimension एक variable हो जिसे आप दोबारा fit करें, न कि एक fixed mesh।

**Envelope और इसके पीछे का तर्क** (परखे हुए board आकार और [Cooling](04-cooling.md) में दिए thermal targets से व्युत्पन्न):

- **~180 × 212 × 380 mm** vertical tower — इतना ऊँचा कि board के बगल में एक **240 mm radiator को vertically** खड़ा किया जा सके (एक ~277 mm rad assembly 380 mm ऊँचाई के अंदर फिट होती है)।
- **Chimney airflow** — 120 mm intake नीचे, 120 mm exhaust ऊपर, ताकि गर्मी सीधे ऊपर निकले।
- **Active backplate अनिवार्य है, optional नहीं** — GDDR6 / VRM side में [कोई temperature sensor नहीं](04-cooling.md) है, इसलिए design rear cooling को एक आवश्यक हिस्सा मानता है।
- **Cooling targets** (design goals, मापे गए नतीजे **नहीं**): water die 40 CU पर sustained < 60 °C; AXP90 < 75 °C @ 2000 MHz; P12 base ~73–78 °C।

> ⚠️ **Status: design concept, एक verified print नहीं।** मौजूदा CAD एक **parametric spatial model** है — हिस्से सही ढंग से sized, oriented और placed हैं, और यह 8 STL + एक STEP export करता है — पर इसे **print, assemble या thermally test नहीं किया गया है**, और water block को मापी गई die position के बजाय board के bounding box से रखा गया है। इसे एक **starting CAD मानें जिसे fork किया जाए**, एक तैयार case नहीं; असल print / fit / thermal validation खुला अगला कदम है। ऊपर के targets goals हैं, benchmarks नहीं।

---

### ATX-PSU cases (Victor L., V\ad, server-PSU v3/v4)

एक full **ATX** power supply के लिए: एक पूरे ATX PSU के आसपास बना एक case ([src](https://t.me/c/2424231195/119293), MakerWorld की ओर जा रहा), एक पहले का first-timer Blender prototype ([src](https://t.me/c/2424231195/105570)), और HDD और USB-hub provisions के साथ Printables/MakerWorld पर एक published **HP/server-PSU** line।

- [Printables 1580750 — Case v3, HP server PSU + HDD + USB hub](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) · [MakerWorld 2481620 — Case v4, FlexATX & HP-server PSU](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) · [Printables 1550729 — ATX-PSU Bazzite Box](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box)

### Twin-120 builds (memory + PSU cooling)

एक redesigned mounting plate जो **दो 120 mm fans** रखता है — एक backplate (memory) तक ducted जैसा board के designer ने चाहा था, दूसरा PSU को हवा देता हुआ। Lian Li P28 fans front + एक Thermalright C12015 के साथ, author **games में 80 °C पर 2200 MHz** बनाए रखता है, जहाँ एक अकेला front fan पर्याप्त नहीं था ([src](https://t.me/c/2424231195/120606))। इसके लिए एक standalone **`Twin_120mm_Fan_Shroud.stl`** साझा किया गया है ([src](https://t.me/c/2424231195/121684))।

### The Lanboy — portable arcade / lunchbox

एक portable lunchbox-arcade build: यह एक **eDisplayPort adapter board** ([AliExpress](https://www.aliexpress.com/item/1005006351527252.html)) के ज़रिए एक **16″ laptop eDP panel (1920×1200 @ 165 Hz)** चलाता है, एक USB amp पर 2× 2″ speakers, सब एक अकेले **12 V ATX breakout** से powered। [Printables 1746364](https://www.printables.com/model/1746364)। eDP-adapter की यह तरकीब **किसी भी** laptop-panel build के लिए दोबारा इस्तेमाल की जा सकती है।

### BC250-HUD (Bloodyly) — internal status screen

एक **Raspberry Pi Zero 2 के लिए Qt5/C++ status-screen app** (NexGen3D Redux जैसे builds में इस्तेमाल): **USB gadget mode पर 60 FPS**, MangoHud से FPS/frametime पढ़ता है, sleep पर screen को dim करने के लिए fan voltage सेंस करता है, और **vc4 kernel patch शामिल करता है** जो वरना Pi को freeze कर देता। Screen: **8.8″ 1920×480 IPS** (Hannstar HSD088IPW1-A)। [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD)।

---

## Adapters और mounts (पूरे cases नहीं)

छोटे printed हिस्से जो एक समस्या हल करते हैं — आमतौर पर board पर एक cooler या fan mount करना।

- **Fan shrouds** (एक fan को fins से seal करते हैं): `Fan_Shroud_Single_120mm.stl`, `Fan_Shroud_Dual_120mm.stl`, `Fan_Shroud_Single_120mm_Restricted.stl`, `Fan_Shroud_Single_140mm.stl` ([src](https://t.me/c/2424231195/81673)), `Twin_120mm_Fan_Shroud.stl` ([src](https://t.me/c/2424231195/121684))। [Cooling](04-cooling.md) में भी catalogued।
- **Backplate / memory fan mounts:** `Backplate.stl` + `backplane-top-fixed.stl` ([src](https://t.me/c/2424231195/133049)); `bottom_fan_mount.stl`, `top_fan_mount.stl`, `Front-Mount.stl`, `Back-Mount.stl` ([src](https://t.me/c/2424231195/131189))
- **AM4 cooler adapters** (एक standard CPU cooler को die पर bolt करें): `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` ([src](https://t.me/c/2424231195/9949))। यह भी देखें [Printables 1042228 — BC250→AMD CPU-cooler mount](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount)।
- **Generic ITX mount** (majzok): दो हिस्सों में print होता है जो एक frame में snap हो जाते हैं — BC-250 को इसमें screw करें, फिर frame को **standard ITX motherboard holes वाले किसी भी case** में screw करें (एक DeepCool CH170 PLUS में परखा गया)। "कोई generic ITX mount मौजूद नहीं है" वाली समस्या हल करता है। कोई canonical Printables link दर्ज नहीं हुआ — Printables/MakerWorld पर **"BC-250 ITX Mount"** खोजें।
- **Thermalright AXP90-X53 / AXP120-X67 adapter** (die पर low-profile cooler): एक printed mount जिसे M3 threads चाहिए, cooler/CPU pressure के अनुसार thickness variants के साथ — [Printables 1694793](https://www.printables.com/model/1694793)। [Cooling](04-cooling.md) में भी।
- **120 mm fan adapter:** `BC250_FanAdapter_120mm.step` ([src](https://t.me/c/2424231195/83135)), `cooler adapter v3.0 (1).stl` ([src](https://t.me/c/2424231195/111091))
- **Accurate board models** (इनके विरुद्ध अपना case डिज़ाइन करें): [Printables 1341336 — accurate BC-250 board](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) ([src](https://t.me/c/2424231195/55496)), [Printables 1103626 — AMD BC250 board](https://www.printables.com/model/1103626-amd-bc250-board)

---

## Catalog table

*(chat)* से चिह्नित files `assets/stl/` के तहत mirror की गई हैं; बाकी सब linked Printables / MakerWorld / GitHub page से download होती हैं।

| Case / part | Type | STL / source files | Fans | Download |
|---|---|---|---|---|
| **onemorecap cooling sleeve** | minimal sleeve | `BC-250-FanSleeves.3mf` *(chat)* | 1× 120 | [GitHub onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) |
| **onemorecap Shell Case** ⭐ | open shell | `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl` *(chat)* | 1–2× 120 / 1× 140 | [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [GitHub](https://github.com/onemorecap/bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case) |
| **Acrylic open frame** (Владислав) | open frame | printed brackets *(chat #114651)* | 1× 120 | [Reddit thread](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) |
| **"Просто лучший корпус"** (Jack Fisher × B1zon) | console | `BC250 korpus исправленный.rar` *(chat)* | 120 + PWM splitter | [chat #79989](https://t.me/c/2424231195/79989) |
| **Minimal case for Flex PSU** | small box | `minimal-case-...-model_files.zip` *(chat)* | 1× 120 | [Printables 1423572](https://www.printables.com/model/1423572-minimal-case-for-bc250-and-flex-psu) |
| **forgenam case** | console | `forgenam-case-bc250-model_files.zip` *(chat)* | 1× 120 | [Printables 1375929](https://www.printables.com/model/1375929-forgenam-case-bc250) |
| **Minimalist 240** | console + handle | `Minimalist 240 Front/Back/Handle.stl` *(chat)* | 120 | [chat #117404](https://t.me/c/2424231195/117404) |
| **M360** | console | `M360 Front.stl`, `M360 Back.stl` *(chat)* | 120 | [chat #126566](https://t.me/c/2424231195/126566) |
| **NexGen3D DIY Steam Machine** ⭐ | console | Printables files | 1× 120 | [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) |
| **NexGen3D Pro (liquid)** | console + AIO | Printables files | 120 AIO | [Printables 1614131](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) |
| **NexGen3D Redux (+screen)** | console + 1080×480 screen | Printables files | 1× 120 | [Printables 1649679](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) |
| **NexGen3D AIO mount** | adapter | Printables files | 120 AIO | [Printables 1554003](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250) |
| **Case v3 — HP server PSU** | console + HDD/USB | Printables files | 120 | [Printables 1580750](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) |
| **Case v4 — FlexATX / HP PSU** | console | MakerWorld files | 120 | [MakerWorld 2481620](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) |
| **ATX-PSU Bazzite Box** | full-ATX box | Printables files | 120 | [Printables 1550729](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box) |
| **ivanov-innokentii case** | console | GitHub sources | 120 | [GitHub ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) |
| **rLapchynski enclosure** | enclosure | GitHub sources | 120 | [GitHub rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure) |
| **BC-250 Scooper** | shroud/scoop | Printables files | 120 | [Printables 1282906](https://www.printables.com/model/1282906-bc-250-scooper) |
| **Pitman case** | console | Printables files | 120 | [Printables 1570248](https://www.printables.com/model/1570248-amd-bc-250-pitman-case) |
| **Industrial-style FlexATX** | console | `amd_bc_250_industrial_style_case...zip` *(chat)* | 120 (no stock cooler) | [chat #144265](https://t.me/c/2424231195/144265) |
| **The Lanboy** | portable arcade + 16″ eDP screen | Printables files | 12 V ATX breakout | [Printables 1746364](https://www.printables.com/model/1746364) |
| **BC250 Vented Edition** (MaelremremDotXYZ) | FlexATX console, fins-open | MakerWorld files | 120 | [MakerWorld 2899020](https://makerworld.com/en/models/2899020) |
| **Stellar 250** (isaacalvex) | console + build guide (WiFi6, ESP32) | GitHub guide | 120 | [GitHub isaacalvex/...Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide) |
| **Simple Case for the ASRock AMD BC-250** | console | MakerWorld files | 120 | [MakerWorld 2870270](https://makerworld.com/en/models/2870270) |
| **BC250-HUD** (Bloodyly) | internal Pi Zero 2 status screen | GitHub sources | — | [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD) |
| **Generic ITX mount** (majzok) | adapter (any ITX case) | search Printables/MakerWorld | — | "BC-250 ITX Mount" |
| **Thermalright AXP90/AXP120 mount** | low-profile cooler adapter | Printables files | low-profile tower | [Printables 1694793](https://www.printables.com/model/1694793) |
| **Twin-120 mount plate** | adapter plate | `Twin_120mm_Fan_Shroud.stl` *(chat)* | 2× 120 | [chat #121684](https://t.me/c/2424231195/121684) |
| **Fan shrouds (120/140)** | shroud | `Fan_Shroud_Single_120mm.stl`, `_Dual_120mm`, `_Single_140mm`, `_120mm_Restricted` *(chat)* | 120 / 140 | [Printables 1339540](https://www.printables.com/model/1339540-yet-another-bc-250-fan-shroud) · देखें [Cooling](04-cooling.md) |
| **AM4 cooler adapter** | mount | `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` *(chat)* | tower/AIO | [Printables 1042228](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount) |
| **Accurate board model** | reference CAD | `bc-250-body.step` *(chat)* | — | [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) |

⭐ = समुदाय में सबसे ज़्यादा value-react / सबसे ज़्यादा repost किया गया।

### और सार्वजनिक designs (elektricM के catalog से)

[elektricM के 143-design catalog](https://elektricm.github.io/amd-bc250-docs/community/cases/) से नामित, downloadable designs जो ऊपर सूचीबद्ध नहीं हैं — जिस PSU के आसपास वे बने हैं उसके अनुसार समूहीकृत। Discord-only/WIP builds और thumbnails के लिए पूरा catalog browse करें।

**MeanWell LOP (internal PSU):**

| Case / part | Notable | Download |
|---|---|---|
| **Steamboat Case** (yannichaboyer) | LOP-300 console | [MakerWorld 2431616](https://makerworld.com/en/models/2431616) |
| **Ultra-Thin Custom Case** (MrRoze) | slim LOP-300 | [Printables 1626501](https://www.printables.com/model/1626501) |
| **Internal PSU 2×140 mm** (Kacikor) | LOP-400, twin 140 | [Printables 1599644](https://www.printables.com/model/1599644) · [MakerWorld 2400574](https://makerworld.com/en/models/2400574) |
| **Push-Pull Internal 12V PSU** (penzoiders) | push-pull | [MakerWorld 2505974](https://makerworld.com/en/models/2505974) |
| **Shell Case + 40 mm SSD fan** (Munkee915) | Shell remix, SSD cooling | [Printables 1568074](https://www.printables.com/model/1568074) |
| **Noctua Push-Pull Mod** (Janjd) | Shell remix | [MakerWorld 2354123](https://makerworld.com/en/models/2354123) |

**MeanWell LRS/UHP (दूसरा आम server brick):**

| Case / part | Notable | Download |
|---|---|---|
| **LRS-350-12 PSU Case** (TARGZ) | LRS-350 box | [Printables 1543979](https://www.printables.com/model/1543979) |
| **BC250 slim case** (C4kew4lk) | UHP-350-12, slim | [Printables 1504664](https://www.printables.com/model/1504664) |

**FlexATX — Arthrimus "Console Style" family** (एक पूरी remix वंशावली; slim console एक community staple है):

| Case / part | Notable | Download |
|---|---|---|
| **Console Style Case v1** (Arthrimus) | the original | [Thingiverse 7165679](https://www.thingiverse.com/thing:7165679) · [MakerWorld 2097988](https://makerworld.com/ko/models/2097988-bc250) |
| **Slim Console Style Case** (Arthrimus) | slim variant | [Thingiverse 7172528](https://www.thingiverse.com/thing:7172528) |
| **Slim Console — double-fan mod** (TKXXTH) | dual fan | [Thingiverse 7214884](https://www.thingiverse.com/thing:7214884) |
| **Slim Console — On/Off + Apevia** | power switch | [Thingiverse 7274042](https://www.thingiverse.com/thing:7274042) |

**FlexATX — अन्य:**

| Case / part | Notable | Download |
|---|---|---|
| **Minimal Case (Toolless)** (chriszf) | no screws | [Printables 1423572](https://www.printables.com/model/1423572) |
| **Minimalist BC-250 Case** (SebastienGau/Gadget) | minimalist | [Printables 1581724](https://www.printables.com/model/1581724) |
| **ADT UT3G eGPU-Inspired** (R0mn) | eGPU look | [Printables 1539301](https://www.printables.com/model/1539301) |
| **"Steam Machine" by MrLarva** | console | [Printables 1618501](https://www.printables.com/model/1618501) · [MakerWorld 2453965](https://makerworld.com/en/models/2453965) · [Thingiverse 7278235](https://www.thingiverse.com/thing:7278235) |
| **Steam Machine** (Pocket Adventures) | console | [MakerWorld 2350219](https://makerworld.com/en/models/2350219) |
| **Steam Machine Slim Console** (MTSquar3D) | slim + OC vRAM fan kit | [MakerWorld 2232434](https://makerworld.com/en/models/2232434) · [Thingiverse 7271946](https://www.thingiverse.com/thing:7271946) |
| **ASRock Console Case** (songdawgdesigns) | console | [Printables 1617023](https://www.printables.com/model/1617023) · [Cults3D](https://cults3d.com/en/3d-model/gadget/asrock-amd-bc-250-console-case-steamos-bazzite-diy-steam-machine-style-build) |
| **AMD BC250 Case** (vitamins) | console | [MakerWorld 2219947](https://makerworld.com/en/models/2219947) |
| **E-waste Steam Machine** (Pesen333) | salvage build | [Thingiverse 7245584](https://www.thingiverse.com/thing:7245584) |

**Full ATX:**

| Case / part | Notable | Download |
|---|---|---|
| **Case for Standard ATX** (CatSiewDai) | ATX box | [Printables 1553599](https://www.printables.com/model/1553599) |
| **ATX + Fan Duct** (ZMASLO) | ducted | [Printables 1616167](https://www.printables.com/model/1616167) |
| **Dual Fan ATX Case** (Mateo Fdez) | dual fan | [Printables 1579658](https://www.printables.com/model/1579658) |
| **Simple Wooden Case** (suvalle55) | wood + ATX | [Printables 1595794](https://www.printables.com/model/1595794) |
| **Open Frame + IKEA hack** (GreatApo) | open frame | [Thingiverse 7314188](https://www.thingiverse.com/thing:7314188) |
| **Case for ATX PSU** (matmiak) | ATX box | [Thingiverse 7303096](https://www.thingiverse.com/thing:7303096) |

**TFX / VESA / off-the-shelf:**

| Case / part | Notable | Download |
|---|---|---|
| **Case Remix for TFX** (PlayNation) | TFX-400 PSU | [MakerWorld 2387157](https://makerworld.com/en/models/2387157) |
| **VESA 100/75 Basket** (Oleksii) | एक monitor के पीछे mount | [MakerWorld 1844470](https://makerworld.com/en/models/1844470) |
| **3.9L MKII FlexATX + PS5 fan** (FitFormSolutions) | एक तैयार kit खरीदें | [Etsy](https://www.etsy.com/listing/4405362103/) · [eBay](https://www.ebay.com/itm/127460591552) |
| **Shiny Snake S400** (10.8 L mesh ITX) | known-good off-the-shelf host (BC-250→AM4 mount + PSU bay में H60 AIO + custom ATX I/O shield) | [AliExpress](https://a.aliexpress.com/_EyQdoBU) |
| **SFX-PSU minimalist case** (Methsman) | full SFX PSU, magnet panels, USB hub, AXP120 + Noctua 120 — *files WIP / अभी released नहीं* | — |
| **Cults3D ATX/server line** (KABANCHYK, lumstudio, kapa3D) | paid STLs | [Cults3D — bc-250](https://cults3d.com/en/3d-model/gadget/bc-250-atx-case) |

---

## कोई printer नहीं? लोग जो विकल्प इस्तेमाल करते हैं

- **एक print खरीदें।** Sellers [Etsy](https://www.etsy.com/listing/1904632447/), eBay और OLX पर मौजूद हैं; लोगों ने chat में cases print/बेचने की भी पेशकश की ([src](https://t.me/c/2424231195/55507))।
- **Print-on-demand:** एक STL को एक service पर upload करें। chat में builders print farms चलाते हैं (एक Flsun/Creality/Bambu printers की दीवार दिखाता है, [src](https://t.me/c/2424231195/73481))।
- **बिल्कुल कोई case नहीं / repurpose।** बहुत-से लोग testing के दौरान board को एक open bench पर चलाते हैं। दूसरे मौजूदा hardware को gut कर देते हैं: एक पुराना all-in-one PC जिसमें board implant किया गया और एक blower ([src](https://t.me/c/2424231195/30914)), एक ventilation-duct box ([src](https://t.me/c/2424231195/64265)), या aluminium amplifier enclosures (filing/drilling चाहिए, [src](https://t.me/c/2424231195/108907))। एक member ने तो मज़ाक में board को एक पुराने VHS player के अंदर छिपा दिया ([src](https://t.me/c/2424231195/84106))। **Xbox One shell** (JoeyDepDollas): एक टूटे Xbox One को gut करें और अंदर एक पूरा BC-250 build फिट करें — load पर CPU और GPU को **60 °C** से नीचे रखता है; टूटे donor consoles eBay पर **~$15 shipped** चलते हैं और दोबारा इस्तेमाल होने वाले parts देते हैं।
- **Laser-cut plywood** (ContributionRich3242): 3D-printed नहीं — कोनों के चारों ओर kerf-bent plywood जिसमें extra cooling के लिए एक बड़ा rear area है, **40 CU पर 75 °C** (1800 MHz, CPU 3.9 GHz) छूता है और बेहद शांत। (Laser files released नहीं हुईं।) इसकी **backplate-cooling technique** किसी भी case पर दोबारा इस्तेमाल योग्य है: thermal putty chip→backplate, paste backplate→rear coolers, और rear coolers को VRM gap में tight R-type cotter pins + Kapton tape से सुरक्षित करें (40 CU पर ~20 °C ठंडा)।

> एक नंगा, अच्छी तरह ठंडा किया गया board एक खराब airflow वाले sealed सुंदर box से बेहतर प्रदर्शन करता है। पहले [Cooling](04-cooling.md) ठीक करें; case दूसरा कदम है।

---

## Sources

- Curated **#BC250body** showcase (प्रति दिन एक अच्छा build) — pinned idea [src](https://t.me/c/2424231195/79685)
- Minimal sleeve, दो variants — [src](https://t.me/c/2424231195/10743) · models on [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) [src](https://t.me/c/2424231195/18260)
- Shell Case (❤33) — [src](https://t.me/c/2424231195/22771) · free on Printables/MakerWorld [src](https://t.me/c/2424231195/24505) · STL batch [src](https://t.me/c/2424231195/81680)
- "Просто лучший корпус" + BOM — [src](https://t.me/c/2424231195/79990) · files [src](https://t.me/c/2424231195/79989)
- Acrylic open frame — [src](https://t.me/c/2424231195/114651) · [Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/)
- Twin-120 mounting plate, 2200 MHz @ 80 °C — [src](https://t.me/c/2424231195/120606) · shroud [src](https://t.me/c/2424231195/121684)
- Console designs (photos) — Гослинг/Bazzite [src](https://t.me/c/2424231195/66616) · Jhonatan maze panel [src](https://t.me/c/2424231195/121274) · Joglik grid mesh [src](https://t.me/c/2424231195/126525) · a m oval window [src](https://t.me/c/2424231195/52955) · Spyrydonov v15 [src](https://t.me/c/2424231195/135995)
- NexGen3D Steam Machine family — [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) · [Redux + Pi screen (Reddit)](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)
- Board reference model — [src](https://t.me/c/2424231195/55496) · [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)
- GitHub case repos — [onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) · [rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure)
- **elektricM full case catalog (~143 designs, searchable/filterable)** — [elektricm.github.io/amd-bc250-docs/community/cases](https://elektricm.github.io/amd-bc250-docs/community/cases/)
- Simple Case (MakerWorld 2870270) + Ukrainian build walkthrough — [MakerWorld 2870270](https://makerworld.com/en/models/2870270) · [Old Lamer (YouTube)](https://youtu.be/p5Zd86vFe8w)
- CMOS-clear access-hole lifehack — [4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980)
- "Steam Machine Pro" liquid-cooled build BOM (TEUCER AF 240, Mean Well LOP-600-12, Arctic P12 Pro/P8, ESP32 relay, OpenLinkHub/Commander Duo) — [Old Lamer (YouTube)](https://youtu.be/afYhUQFa-AY)

> Fan-shroud STLs [Cooling](04-cooling.md) के साथ साझा किए गए हैं। सभी chat-hosted STL/STEP/3MF files `assets/stl/` के तहत mirror की गई हैं।
