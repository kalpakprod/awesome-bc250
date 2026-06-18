> 🌐 Қауымдастық аудармасы. Ағылшын нұсқасы — шындық көзі әрі жаңарақ болуы мүмкін. Қате таптыңыз ба? Issue ашыңыз: [English](../en/10-wifi-bt.md) · [issues](https://github.com/lildebil0/awesome-bc250/issues)

# WiFi және Bluetooth донглдары

> **TL;DR** — BC-250-де **бортта WiFi немесе Bluetooth жоқ**, сондықтан сізге USB донгл қажет. Чаттағы ең сенімді жалғыз таңдау — **aic8800d80** негізіндегі стик (мысалы, *AX90BT / D80MU3*), [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) драйверімен басқарылады — тексерілген Bazzite RPM рецепті бар. **Realtek RTL88xx** стиктері (8821au/cu, 8822bu, 8851bu) арзан әрі кең таралған, бірақ олар — чаттың №1 бас ауруы: олар қосылады, содан кейін **жүктеме кезінде кездейсоқ үзіледі**. [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) (бэкпортталған драйвер) RTL8821/8822 тұқымдасы үшін оның көбін түзетеді; RTL8851BU/8831BU "AX900 WiFi 6" стиктеріне [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) қажет. Қораптан "жай жұмыс істейтін" стик қаласаңыз, иелері **Digma DWA-BT5** сериясы осылай дейді. Bluetooth 2.4 GHz радиосын бөліседі, сондықтан BT белсенді кезде WiFi өткізу қабілеті төмендейді деп күтіңіз.

Егер сізге тек баптау үшін интернет керек болса, **сымды USB-Ethernet адаптері немесе борттағы NIC** осы парақты түгел айналып өтеді. Шынымен сымсыз байланыс немесе Bluetooth контроллері қажет болғанда WiFi/BT донглға қол созыңыз.

> **Борттағы Realtek RTL8111 ethernet туралы:** бұл — ең аз қарсылық жолы, бірақ RTL8111/8168 тұқымдасы **Linux-та сенімсіздеу** — стандартты `r8169` драйвері кездейсоқ байланыс қосылуы/үзілуіне, өткізу қабілеті жоғары кезде үзілістерге, кейде 100 Mbit-ке дейін түсуге себеп болады деп кеңінен хабарланады. Бұған әдеттегі шешім — ағаштан тыс `r8168` модуліне ауысу. Егер борттағы порт дұрыс жұмыс істемесе, **Intel немесе MediaTek USB/PCIe NIC-ті артық көріңіз** — олардың Linux драйверлері әлдеқайда сенімді. ([Intel/MediaTek vs Realtek — Linux сенімділігінде ұзақ уақыттан бергі алшақтық](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)) ⚠ RTL8111 сенімсіздігі — жалпы-Linux үлгісі, BC-250-ге тән емес — өз тақтаңызда тексеріңіз.

---

## Алдымен түсінетін бір нәрсе

BC-250-дегі "менің донглым үнемі ажырайды" дегеннің барлығы дерлік **қораптағы брендке емес, екі нәрсеге** байланысты:

1. **Ішіндегі чипсет.** Жапсырманың (ASUS, TP-Link, D-Link…) мәні жоқ — маңыздысы — қабықтың астындағы Realtek/aic/MediaTek чипі. Үш әртүрлі брендті стик дәл сол чипті алып жүріп, бірдей істен шығуы мүмкін. ([src](https://t.me/c/2424231195/16332))
2. **Жүктеме кезіндегі USB қуат/тұрақтылық.** Бірнеше қолданушы стик бос/серфинг кезінде жақсы жұмыс істеп, содан кейін **трафик секірген сәтте (үлкен жүктеп алу)** "USB үлгере алмағандай" **үзілетінін** көреді. Бір қолданушының ASUS стигі жүктеп алу кезінде үзілгенше бар-жоғы 17 минут шыдады. ([src](https://t.me/c/2424231195/16331)) · ([src](https://t.me/c/2424231195/17319))

Сонымен: **чипсет бойынша таңдаңыз**, оны жүргізілетін ағаштан тыс драйверге сәйкестендіріңіз, ал ол әлі үзілсе, оны қуат/қайта орнату мәселесі ретінде қарастырыңыз (төмендегі [Үзілістер](#%D0%BA%D0%B5%D0%B7%D0%B4%D0%B5%D0%B9%D1%81%D0%BE%D2%9B-%D2%AF%D0%B7%D1%96%D0%BB%D1%96%D1%81%D1%82%D0%B5%D1%80%D0%B4%D1%96-%D1%82%D2%AF%D0%B7%D0%B5%D1%82%D1%83) қараңыз).

> **Чипсетті қалай табуға болады?** Қораптар оны сирек басады. Сатып алмас бұрын, стиктің **FCC ID**-ін (құрылғыда/жарнамада басылған) онлайн іздеңіз — өтінім нақты чипті ашады. Оны қосқаннан кейін, вендор/өнім ID-лері мен чипсетті көру үшін Linux-та **`lsusb`** іске қосыңыз.

---

## Белгілі-жарамды донглдар

Драйвер репозиторийлерімен өзара тексерілген. "Ескертпелер" чат мүшелері BC-250-де шынымен байқағанын көрсетеді.

| Чипсет | Стик мысалдары (чаттан) | Драйвер репозиторийі | Ескертпелер |
|---|---|---|---|
| **aic8800d80** (aic8800) | AX90BT / D80MU3 ("AIC device wlan") | [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) | **Ең ұсынылатын.** Тексерілген Bazzite RPM рецепті; WiFi+BT. Алдымен USB-CDROM ретінде көрінеді, содан кейін `install_setup.sh`-тан кейін `aic device wlan`-ға ауысады. ([src](https://t.me/c/2424231195/120502)) |
| **RTL8821CU / 8821AU** | жалпы Realtek "свисток" | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Жұмыс істейді, бірақ ескі ядро ішіндегі драйверде **кездейсоқ үзілуге бейім**. lwfinger бэкпорты көпшілік үшін тұрақты; дұрыс түзету 6.13–6.14 ядросында пайда болды. ([src](https://t.me/c/2424231195/17321)) |
| **RTL8822BU** | аты жоқ қос-диапазонды стик | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Бір иесі: қосылады, содан кейін **әр 5–10 мин сайын үзіледі**. rtw88 USB тізімінде қолдау көрсетіледі, бірақ BC-250-дегі сенімділік әртүрлі. ([src](https://t.me/c/2424231195/138512)) |
| **RTL8851BU / 8831BU** | "$5 AX900 WiFi 6 + BT 5.3" | [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) | **Қораптан жұмыс істемеді** — WiFi 6 чипі rtw88 үшін тым жаңа. Арнайы `8851bu` драйвері қажет. ([src](https://t.me/c/2424231195/17320)) |
| **Digma DWA-BT5-AC600C / AC1300E** | Digma USB WiFi+BT | ядро ішінде (Realtek) | **Қораптан жұмыс істейді** деп хабарланды ("бірінші реттен іске қосылды"); BC-250 иесі өнім пікірлерінде растады. ([src](https://t.me/c/2424231195/138520)) |

> **ЖҰМЫС ІСТЕМЕЙТІН / қиын деп хабарланғандар:** жалпы **RTL8851BU "AX900"** қораптан ([src](https://t.me/c/2424231195/17320)); жалаңаш **RTL8821cu/8821au** стандартты ядро драйверлерінде кездейсоқ үзіледі ([src](https://t.me/c/2424231195/16330)); атаусыз **RTL8822BU** әр бірнеше минут сайын үзіледі ([src](https://t.me/c/2424231195/138512)). Бір қолданушы мүлдем бас тартып, оның орнына **Edimax EW-7733UnD** тапсырыс берді. ([src](https://t.me/c/2424231195/120503))

---

## Path A — aic8800d80 (ұсынылады)

Бұл — BC-250 тарихы ең таза чип. Толық Bazzite RPM рецепті мен қауымдастық жазған мини-нұсқаулық бар.

### Bazzite (rpm-ostree) — RPM билд

Қолдаушының [`bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) дұрыс RPM құрады, осылайша драйвер жалаңаш `make`-ке қарағанда образ жаңартуларынан жақсырақ аман қалады. Репозиторийге қарсы тексерілген:

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

Чат мүшесі ([Nurmukhamed](https://github.com/Nurmukhamed/aic8800d80/tree/15a927286788af46529909bc2c14d16ea4241ec0/bazzite)) RPM-пакеттеу бойынша нұсқаулық жазды, қауымдастық оған алғыс білдірді. ([src](https://t.me/c/2424231195/122580))

### Қауымдастық мини-нұсқаулығы (жылдам "make" жолы)

Егер сіз оны тек *қазір* іске қосқыңыз келсе әрі қайта жүктеулерден кейін оны қайта іске қосуға қарсы болмасаңыз, Aqtilek нұсқаулығы ([src](https://t.me/c/2424231195/120502)):

```bash
# The stick first appears as a fake CD-ROM. Flip it to WiFi mode (ONE TIME):
sudo sh install_setup.sh         # now shows as "aic device wlan"

# Temporarily lift the read-only root (Bazzite/atomic):
sudo rpm-ostree usroverlay

# Clone and build the driver (use the repo's "method 2"):
git clone https://github.com/shenmintao/aic8800d80.git && cd aic8800d80
# …then follow the repo's second install method.
```

> ⚠ **Қайта жүктеуден кейінгі тұрақтылық:** жалаңаш `make` жолымен **драйвер әр қайта жүктеуде жоғалады** әрі қайта орнатылуы керек — автор шағын автоқосу сценарийін ұсынады. ([src](https://t.me/c/2424231195/120502)) Жоғарыдағы RPM жолы — берік шешім.

Бір мүше қолданған firmware/драйвер архиві (*AX90BT(D80MU3)*) чатта бөлісілді. ([src](https://t.me/c/2424231195/119991)) Балама жоғары ағын, [`goecho/aic8800_linux_drvier`](https://github.com/goecho/aic8800_linux_drvier), бар, бірақ бір CachyOS қолданушысы 6 сағат жұмсап, оны компиляциялай алмады — BC-250-де `shenmintao`-ны артық көріңіз. ([src](https://t.me/c/2424231195/82100)) ⚠ өз дистрибутивіңізде тексеріңіз.

> **aic8800d80 қиындықтары (драйвердің мәселелерді қадағалау жүйесінен):**
> - \`fmacfw_8800d80_u02.bin\` микробағдарламасы \`/lib/firmware/aic8800D80/\` ішінде орналасуы керек; микробағдарламаны сәтсіз жүктеу интерфейсті \`DOWN\` күйінде қалдырады. ([aic8800d80 #37](https://github.com/shenmintao/aic8800d80/issues/37) · [#10](https://github.com/shenmintao/aic8800d80/issues/10))
> - **Kernel 7.0 / 7.1:** 1.0.0 драйвері DKMS арқылы жиналмайды — \`cfg80211_new_sta\` / \`cfg80211_del_sta\` қолтаңбалары өзгерді және \`-Wimplicit-fallthrough\` қатесі компиляцияны бұзады. Негізгі тармақ (upstream) жаңартылғанша, ескірек ядроны пайдаланыңыз немесе бастапқы кодқа патч қолданыңыз. ([aic8800d80 #49](https://github.com/shenmintao/aic8800d80/issues/49))
> - **Debian 13 (kernel 6.12.90):** Wi-Fi интерфейсі іске қосылмауы немесе желілерді анықтамауы мүмкін. ([aic8800d80 #58](https://github.com/shenmintao/aic8800d80/issues/58))

---

## Path B — Realtek RTL8821 / RTL8822 (rtw88)

Арзан әрі барлық жерде, бірақ ескі ядролардағы ядро ішіндегі драйвер **қателі әрі кездейсоқ үзіледі**. Шешім — `lwfinger/rtw88`-тен бэкпортталған ағаштан тыс драйвер. Бір мүше қолданған әрі тұрақты деп растаған дәл командалар ([src](https://t.me/c/2424231195/16326)):

```bash
git clone https://github.com/lwfinger/rtw88
cd rtw88
make
sudo make install
sudo make install_fw
```

Secure-Boot / DKMS орнатуында репозиторий `sudo dkms install $PWD` + `mokutil` ағынын да құжаттайды — [репозиторий README](https://github.com/lwfinger/rtw88) қараңыз.

**Бұл неге көмектеседі:** үзілістер — белгілі драйвер қатесі; дұрыс түзету тек **6.13–6.14 ядросында** негізгі тармаққа жетті, ал көптеген дистрибутив образдары әлі бұзылған нұсқаны жеткізді. lwfinger бэкпорты сізге түзетілген драйверді қазір береді. ([src](https://t.me/c/2424231195/17321)) Қолдау көрсетілетін USB бөлшектеріне RTL8811AU/CU, RTL8812AU/BU/CU, RTL8814AU, RTL8821AU/CU және RTL8822BU/CU кіреді (толық тізім репозиторийде).

> Адал ескерту: rtw88-пен де бір қолданушы RTL8821cu-да анда-санда үзілістерді көрді ("сол қалпақ"), әрі өткізу қабілеті бұзылған-бірақ-жылдамырақ стандартты драйвермен салыстырғанда біршама төмендейді. ([src](https://t.me/c/2424231195/16333)) Егер сенімділік бағадан маңыздырақ болса, aic8800d80 немесе расталған Digma алыңыз.

---

## Path C — Realtek RTL8851BU / RTL8831BU ("AX900 WiFi 6")

Өте арзан "AX900 WiFi 6 + Bluetooth 5.3" стиктері **RTL8851BU/8831BU**-ды қолданады, ал `rtw88` оны **қамтымайды**, сондықтан олар қораптан өлі. ([src](https://t.me/c/2424231195/17320)) Арнайы [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) драйверін қолданыңыз:

```bash
git clone https://github.com/biglinux/rtl8831
cd rtl8831
sudo dkms install .        # or: make && sudo make install
sudo modprobe 8851bu
```

⚠ тексеріңіз — бұл репозиторий чатта BC-250-де құрастырылып көрсетілмеді; командалар репозиторий README-інен.

> **Бұл кластың аталған мысалы — TP-Link Archer TX10UB Nano ("AX900 WiFi 6 + BT 5.3").** Бұл — нақты, табуы оңай өнім, әрі оның **WiFi-ы Linux-та жұмыс істейді** — ол **RTL8851BU** чипін алып жүреді, сондықтан Path C-ге жатады (сізге стандартты rtw88 емес, `8851bu`/`biglinux/rtl8831` драйвері қажет болады). **Бірақ оның Bluetooth-ы Linux-та вендормен қолдау *көрсетілмейді*:** TP-Link-тің өз сипаттамасы адаптерді тек Windows 10/11 деп тізеді әрі **Bluetooth функциясы Mac, Linux немесе TV-мен үйлесімді емес** деп ашық айтады ([TP-Link өнім беті](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)). Сондықтан оны **"WiFi Linux-та жұмыс істейді (8851bu драйвері арқылы); BT Linux-та вендормен қолдау көрсетілмейді"** деп қарастырыңыз. Қауымдастық оның BT-ын жалпы Realtek BT драйверлері арқылы іске қосуы мүмкін, бірақ бұл тексерілмеген — **оны таза plug-and-play WiFi+BT Linux донглы деп күтіп сатып алмаңыз.** **UGreen** де "AX900" стигін сатады, ол қауымдастықпен балама ретінде хабарланады, бірақ ол сол RTL8851BU тұқымдасы — чипсетті тексеріңіз әрі сол BT ескертпесі қолданылады. ⚠ тексеріңіз.

---

## Кездейсоқ үзілістерді түзету

Егер стигіңіз қосылып, содан кейін үзілсе (классикалық Realtek-BC-250-де симптомы):

1. **Дұрыс ағаштан тыс драйверді орнатыңыз** (Path B/C) — бұл жағдайлардың көпшілігін шешеді.
2. **Жүктеуден кейін қайта орнатыңыз / қайта қосыңыз.** Кейбір стиктер суық жүктеуде анықталмайды әрі бір рет ажыратып-қайта қосуды қажет етеді. ([src](https://t.me/c/2424231195/16325))
3. **Ажыратудың орнына құрылғыны бағдарламалық қайта орнатыңыз** — `usbreset` қолданыңыз (оны физикалық суырудың қажеті жоқ). ([src](https://t.me/c/2424231195/135895)) · [қалай (Superuser)](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
4. **Басқа USB портын байқап көріңіз** (тиімдісі — артқы/түбірлік-хаб порты) — симптом жүктеме кезінде қуат/өткізу қабілетіне байланысты көрінеді. ([src](https://t.me/c/2424231195/17319))
5. **Донглды USB 3.0-ден аулақ ұстаңыз.** USB 3.0 порттары — **2.4 GHz РЖ кедергісінің** құжатталған көзі — жоғары жылдамдықты сигнал беру 2.4–2.5 GHz бойынша ешбір сүзгі кетіре алмайтын ~20 dB кең жолақты шу қосады, WiFi-ды *әрі* Bluetooth-ты дәл олар тұрған жерде нашарлатады. Intel-дің ақ қағазы — канондық сілтеме. WiFi/BT донглдарын **USB 2.0 портына** қосыңыз немесе донглды USB 3.0 қосқыштарынан және кез келген DisplayPort/HDMI кабелінен бірнеше дюйм алыс жылжыту үшін **қысқа USB ұзартқыш кабельді** қолданыңыз. ([Intel: USB 3.0 RF Interference Impact on 2.4 GHz Wireless Devices](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf))

---

## Bluetooth ескертпелері

- WiFi+BT құрама стиктер **2.4 GHz** радиосын бөліседі, сондықтан **Bluetooth белсенді кезде WiFi өткізу қабілеті төмендейді**. Бір мүше **BT қосулы кезде ~150 Mbit, өшірулі кезде ~190 Mbit** өлшеді — нақты, бірақ "соншалықты ауыр емес." ([src](https://t.me/c/2424231195/123366)) · ([src](https://t.me/c/2424231195/123367))
- aic8800d80 драйверінде BT қолдауы үшін **бөлек `bluetooth` тармағы** бар. ([репозиторий тармағы](https://github.com/shenmintao/aic8800d80/tree/bluetooth?tab=readme-ov-file))

- **Егер Bluetooth мүлдем көрсетілмесе, әмбебап `btusb` драйвері құрылғыны бірінші болып иемденіп алған.** aic8800 BT контроллеріне өзінің `aic_btusb` модулі қажет — ядродағы `btusb` оны инициализациялай алмайды. Оларды `sudo rmmod btusb && sudo modprobe aic_btusb` пәрменімен ауыстырыңыз немесе `/etc/modprobe.d/aic8800-bt.conf` файлына `softdep btusb pre: aic_btusb` параметрін қосу арқылы оны тұрақты етіңіз. ([aic8800d80 #53](https://github.com/shenmintao/aic8800d80/issues/53) · [#44](https://github.com/shenmintao/aic8800d80/issues/44))

---

## Сатып алу қысқа тізімі

Ең аз тәуекелді жол қаласаңыз, реті бойынша:

1. **aic8800d80 стик** (AX90BT / D80MU3 класы) + Bazzite RPM рецепті — ең жақсы құжатталған, WiFi+BT.
2. **Digma DWA-BT5-AC600C / AC1300E** — қораптан жұмыс істейді деп хабарланды. ([Ozon жарнамасы](https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/))
3. **RTL8821CU стик + lwfinger/rtw88** — ең арзаны, анда-санда үзілістерді қабылдаңыз.
4. `biglinux/rtl8831`-мен күресуге дайын болмасаңыз, түбіне-арзан **RTL8851BU "AX900"**-ден аулақ болыңыз.

> Донгл туралы AI чатботтың "иә бро, мінсіз таңдау" дегеніне сенбеңіз — бір мүше дәл солай істеп, әр 5–10 мин сайын үзілетін RTL8822BU алды, содан кейін сол бот оның жұмыс істемейтінін айтты. Чипсет бойынша сатып алыңыз, осында тексерілген. ([src](https://t.me/c/2424231195/138512))

---

## Көздер

- aic8800d80 Bazzite RPM — [`shenmintao/aic8800d80` `bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) · spec — https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec
- aic8800d80 мини-нұсқаулық — https://t.me/c/2424231195/120502 · RPM форк — https://t.me/c/2424231195/122580 · firmware zip — https://t.me/c/2424231195/119991
- aic8800 BT тармағы — https://github.com/shenmintao/aic8800d80/tree/bluetooth · балама репозиторий — https://github.com/goecho/aic8800_linux_drvier (https://t.me/c/2424231195/82100)
- rtw88 құрастыру қадамдары — https://t.me/c/2424231195/16326 · бэкпорт негіздемесі — https://t.me/c/2424231195/17321 · драйвер — [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88)
- RTL8851BU AX900 жұмыс істемейді — https://t.me/c/2424231195/17320 · драйвер — [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831)
- Үзіліс симптомы / бренд емес чип бойынша — https://t.me/c/2424231195/16330 · https://t.me/c/2424231195/16331 · https://t.me/c/2424231195/16332 · https://t.me/c/2424231195/17319
- Digma қораптан жұмыс істейді — https://t.me/c/2424231195/138520 · жарнама — https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/
- AI ұсынған RTL8822BU үзіледі — https://t.me/c/2424231195/138512 · Edimax-қа қашу — https://t.me/c/2424231195/120503
- BT vs WiFi жылдамдығы — https://t.me/c/2424231195/123366 · usbreset — https://t.me/c/2424231195/135895 · [Superuser қалай](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
- Борттағы RTL8111/8168 Linux-та сенімсіз; r8168 жеңілдету, Intel/MediaTek артық көріңіз — [LinuxQuestions r8169 vs r8168](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)
- USB 3.0 2.4 GHz WiFi/BT-ге кедергі келтіреді (USB 2.0 / ұзартқыш қолданыңыз) — [Intel ақ қағазы](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf)
- TP-Link Archer TX10UB Nano — WiFi Linux-та жұмыс істейді (RTL8851BU), BT вендормен тек-Windows деп тізілген / Linux емес — [TP-Link өнім беті](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)
