> 🌐 Коомчулук котормосу. Англис тилиндеги нуска — чындыктын булагы жана жаңыраак болушу мүмкүн. Ката таптыңызбы? Issue ачыңыз: [English](../en/10-wifi-bt.md) · [issues](https://github.com/lildebil0/awesome-bc250/issues)

# WiFi жана Bluetooth донглдары

> **Кыскача** — BC-250'де **тактада орнотулган WiFi же Bluetooth жок**, ошондуктан сизге USB донгл керек. Чаттагы эң ишенимдүү жалгыз тандоо — **aic8800d80** негизиндеги свисток (мисалы, *AX90BT / D80MU3*), аны [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) айдайт — текшерилген Bazzite RPM рецепти бар. **Realtek RTL88xx** свистоктору (8821au/cu, 8822bu, 8851bu) арзан жана кеңири таралган, бирок чаттын №1 баш оорусу: алар туташат, анан **жүктөмдө кокустан үзүлөт**. [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) (бэкпорттолгон драйвер) RTL8821/8822 үй-бүлөсүндө мунун көбүн оңдойт; RTL8851BU/8831BU "AX900 WiFi 6" свистокторуна [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) керек. Эгер "кутудан эле иштеген" свисток кааласаңыз, ээлеринин айтуусунча, **Digma DWA-BT5** сериясы ушундай иштейт. Bluetooth 2.4 GHz радиосун WiFi менен бөлүшөт, ошондуктан BT иштеп турганда WiFi өткөрүү жөндөмдүүлүгү төмөндөшүн күтүңүз.

Эгер сизге орнотуу үчүн гана интернет керек болсо, **зымдуу USB-Ethernet адаптери же тактадагы NIC** бул бүт баракты айланып өтөт. WiFi/BT донглга чындап зымсыз байланыш же Bluetooth контроллери керек болгондо кайрылыңыз.

> **Тактадагы Realtek RTL8111 ethernet жөнүндө:** бул эң аз каршылык көрсөткөн жол, бирок RTL8111/8168 үй-бүлөсү **Linux'те туруксуздан ишенимсизге чейин** — стандарттык `r8169` драйвери кокустан байланыш ачылып/жабылышын, өткөрүү жөндөмдүүлүгүндө үзүлүүлөрдү, кээде 100 Mbit'ке түшүүнү жаратат деп кеңири билдирилет. Дарактан тышкаркы `r8168` модулуна өтүү — кадимки чечим. Эгер тактадагы порт туура иштебесе, **Intel же MediaTek USB/PCIe NIC'ти артык көрүңүз** — алардын Linux драйверлери алда канча ишенимдүү. ([Intel/MediaTek vs Realtek — Linux ишенимдүүлүгүндө эзелтен келе жаткан ажырым](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)) ⚠ RTL8111 туруксуздугу — жалпы Linux үлгүсү, BC-250'ге гана таандык эмес — өз тактаңызда текшериңиз.

---

## Биринчи түшүнө турган жалгыз нерсе

BC-250'деги дээрлик ар бир "менин донглум туташуудан тынбай үзүлүп жатат" билдирүүсү **эки нерсеге барып такалат, кутудагы бренджге эмес**:

1. **Ичиндеги чипсет.** Жарлык (ASUS, TP-Link, D-Link…) маанисиз — маанилүүсү — кабыктын астындагы Realtek/aic/MediaTek чиби. Үч башка брендждеги свисток так ушул эле чипти алып жүрүп, бирдей иштебей калышы мүмкүн. ([src](https://t.me/c/2424231195/16332))
2. **Жүктөмдө USB кубаты/туруктуулугу.** Көптөгөн колдонуучулар свисток бош турганда/серфинг жасаганда жакшы иштеп, анан **трафик секирген учурда** (чоң жүктөө) **үзүлүп калганын** көрүшөт ("USB жетишпей жаткандай"). Бир колдонуучунун ASUS свистогу жүктөөдө үзүлгөнгө чейин болгону 17 минут чыдады. ([src](https://t.me/c/2424231195/16331)) · ([src](https://t.me/c/2424231195/17319))

Демек: **чипсет боюнча тандаңыз**, аны колдоого алынган дарактан тышкаркы драйверге дал келтириңиз, эгер дагы деле үзүлүп жатса, аны кубат/баштапкы абалга келтирүү маселеси катары кароңуз (төмөндө [Үзүлүүлөр](#кокустан-үзүлүүлөрдү-оңдоо) бөлүгүн караңыз).

> **Чипсетти кантип табасыз?** Куту аны сейрек басат. Сатып алуудан мурда свистоктун **FCC ID**'син (түзмөктө/тизмеде басылган) онлайн издеңиз — каттоо чыныгы чипти ачып берет. Аны сайып койгондон кийин, Linux'те **`lsusb`** иштетип, вендор/продукт ID'лерин жана чипсетти көрүңүз.

---

## Иштээри белгилүү донглдар

Драйвер реполоруна каршы кайчылаш текшерилген. "Эскертүүлөр" — чаттын мүчөлөрү BC-250'де чындап байкаган нерсе.

| Чипсет | Мисал свистоктор (чаттан) | Драйвер репо | Эскертүүлөр |
|---|---|---|---|
| **aic8800d80** (aic8800) | AX90BT / D80MU3 ("AIC device wlan") | [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) | **Эң сунушталган.** Текшерилген Bazzite RPM рецепти; WiFi+BT. Адегенде USB-CDROM катары көрүнөт, анан `install_setup.sh`'тан кийин `aic device wlan`'га өтөт. ([src](https://t.me/c/2424231195/120502)) |
| **RTL8821CU / 8821AU** | жалпы Realtek "свисток" | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Иштейт, бирок эски ядро ичиндеги драйверде **кокустан үзүлүүгө бейим**. lwfinger бэкпорту көпчүлүк үчүн туруктуу; чыныгы оңдоо 6.13–6.14 ядросунда чыкты. ([src](https://t.me/c/2424231195/17321)) |
| **RTL8822BU** | аты жок кош диапазондуу свисток | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Бир ээси: туташат, анан **ар 5–10 мүнөт сайын үзүлөт**. rtw88 USB тизмесинде колдоого алынган, бирок BC-250'деги ишенимдүүлүк туруксуз. ([src](https://t.me/c/2424231195/138512)) |
| **RTL8851BU / 8831BU** | "$5 AX900 WiFi 6 + BT 5.3" | [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) | **Кутудан иштеген жок** — WiFi 6 чиби rtw88 үчүн өтө жаңы. Атайын `8851bu` драйвери керек. ([src](https://t.me/c/2424231195/17320)) |
| **Digma DWA-BT5-AC600C / AC1300E** | Digma USB WiFi+BT | ядро ичинде (Realtek) | **Кутудан иштейт** деп билдирилген ("биринчи аракетте эле иштеди"); BC-250 ээси продукт сын-пикирлеринде ырастаган. ([src](https://t.me/c/2424231195/138520)) |

> **Иштебейт / кыйын деп билдирилгендер:** жалпы **RTL8851BU "AX900"** кутудан ([src](https://t.me/c/2424231195/17320)); стандарттык ядро драйверлеринде жылаңач **RTL8821cu/8821au** кокустан үзүлөт ([src](https://t.me/c/2424231195/16330)); атсыз **RTL8822BU** бир нече мүнөт сайын үзүлөт ([src](https://t.me/c/2424231195/138512)). Бир колдонуучу таптакыр баш тартып, анын ордуна **Edimax EW-7733UnD** буюрткан. ([src](https://t.me/c/2424231195/120503))

---

## A жолу — aic8800d80 (сунушталат)

Бул — BC-250 тарыхы эң таза болгон чип. Толук Bazzite RPM рецепти жана коомчулук жазган чакан колдонмо бар.

### Bazzite (rpm-ostree) — RPM курулушу

Тейлөөчүнүн [`bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) толук RPM курат, ошондуктан драйвер сүрөт жаңыртууларынан жылаңач `make`'ке караганда жакшыраак аман калат. Репого каршы текшерилген:

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

Чаттын мүчөсү ([Nurmukhamed](https://github.com/Nurmukhamed/aic8800d80/tree/15a927286788af46529909bc2c14d16ea4241ec0/bazzite)) RPM таңгактоо боюнча кадам-кадам колдонмо жазган, аны үчүн коомчулук ага ыраазычылык билдирген. ([src](https://t.me/c/2424231195/122580))

### Коомчулуктун чакан колдонмосу ("make" аркылуу тез жол)

Эгер аны жөн гана *азыр* иштетип, кайра жүктөөдөн кийин кайра иштетүүгө каршы болбосоңуз, Aqtilek'тин колдонмосу ([src](https://t.me/c/2424231195/120502)):

```bash
# The stick first appears as a fake CD-ROM. Flip it to WiFi mode (ONE TIME):
sudo sh install_setup.sh         # now shows as "aic device wlan"

# Temporarily lift the read-only root (Bazzite/atomic):
sudo rpm-ostree usroverlay

# Clone and build the driver (use the repo's "method 2"):
git clone https://github.com/shenmintao/aic8800d80.git && cd aic8800d80
# …then follow the repo's second install method.
```

> ⚠ **Кайра жүктөөдө сакталышы:** жылаңач `make` жолу менен **драйвер ар бир кайра жүктөөдө жоголот** жана кайра орнотулушу керек — автор кичинекей автостарт скриптин сунуштайт. ([src](https://t.me/c/2424231195/120502)) Жогорудагы RPM жолу — туруктуу чечим.

Бир мүчө колдонгон firmware/драйвер архиви (*AX90BT(D80MU3)*) чатта бөлүшүлгөн. ([src](https://t.me/c/2424231195/119991)) Альтернативдик upstream, [`goecho/aic8800_linux_drvier`](https://github.com/goecho/aic8800_linux_drvier), бар, бирок бир CachyOS колдонуучусу 6 саат коротуп, аны компиляциялай алган жок — BC-250'де `shenmintao`'ну артык көрүңүз. ([src](https://t.me/c/2424231195/82100)) ⚠ өз дистрибутивиңизде текшериңиз.

> **aic8800d80 күтүлбөгөн маселелери (драйвердин маселелерди көзөмөлдөөчүсүнөн):**
> - `fmacfw_8800d80_u02.bin` микропрограммасы `/lib/firmware/aic8800D80/` каталогунда болушу керек; микропрограмманы жүктөө ийгиликсиз болсо, интерфейс `DOWN` абалында туруп калат. ([aic8800d80 #37](https://github.com/shenmintao/aic8800d80/issues/37) · [#10](https://github.com/shenmintao/aic8800d80/issues/10))
> - **Kernel 7.0 / 7.1:** 1.0.0 драйвери DKMS тутумунда куралбай калат — `cfg80211_new_sta` / `cfg80211_del_sta` колтамгалары өзгөргөн жана `-Wimplicit-fallthrough` катасы компиляцияны үзгүлтүккө учуратат. Апстрим муну чечкенге чейин эскирээк ядродо калыңыз же баштапкы кодду патчтаңыз. ([aic8800d80 #49](https://github.com/shenmintao/aic8800d80/issues/49))
> - **Debian 13 (kernel 6.12.90):** Wi-Fi интерфейси ишке кирбей калышы же тармактарды аныктай албай калышы мүмкүн. ([aic8800d80 #58](https://github.com/shenmintao/aic8800d80/issues/58))

---

## B жолу — Realtek RTL8821 / RTL8822 (rtw88)

Арзан жана баш-аягы, бирок эски ядролордогу ядро ичиндеги драйвер **каталуу жана кокустан үзүлөт**. Чечим — `lwfinger/rtw88`'тен бэкпорттолгон дарактан тышкаркы драйвер. Бир мүчө колдонуп, туруктуу деп ырастаган так буйруктар ([src](https://t.me/c/2424231195/16326)):

```bash
git clone https://github.com/lwfinger/rtw88
cd rtw88
make
sudo make install
sudo make install_fw
```

Secure-Boot / DKMS орнотуусунда репо `sudo dkms install $PWD` + `mokutil` агымын да документтейт — [репо README](https://github.com/lwfinger/rtw88)'ди караңыз.

**Бул эмне үчүн жардам берет:** үзүлүүлөр — белгилүү драйвер катасы; чыныгы оңдоо негизги тармакка болгону **6.13–6.14 ядросунда** жетти, ал эми көптөгөн дистрибутив сүрөттөрү дагы эле бузук версияны жеткирип жатат. lwfinger бэкпорту сизге оңдолгон драйверди азыр берет. ([src](https://t.me/c/2424231195/17321)) Колдоого алынган USB бөлүктөрүнө RTL8811AU/CU, RTL8812AU/BU/CU, RTL8814AU, RTL8821AU/CU жана RTL8822BU/CU кирет (толук тизме реподо).

> Чынчыл эскертүү: rtw88 менен да, RTL8821cu'дагы бир колдонуучу дагы деле кээ-кээде үзүлүүлөрдү көргөн ("ошол эле баш"), жана өткөрүү жөндөмдүүлүгү бузук-бирок-ылдамыраак стандарттык драйверге салыштырмалуу бир аз төмөндөйт. ([src](https://t.me/c/2424231195/16333)) Эгер ишенимдүүлүк баадан маанилүүраак болсо, aic8800d80 же ырасталган Digma'га өтүңүз.

---

## C жолу — Realtek RTL8851BU / RTL8831BU ("AX900 WiFi 6")

Эң арзан "AX900 WiFi 6 + Bluetooth 5.3" свистоктору **RTL8851BU/8831BU** колдонот, аны `rtw88` **камтыбайт**, ошондуктан алар кутудан өлүк. ([src](https://t.me/c/2424231195/17320)) Атайын драйверди [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) колдонуңуз:

```bash
git clone https://github.com/biglinux/rtl8831
cd rtl8831
sudo dkms install .        # or: make && sudo make install
sudo modprobe 8851bu
```

⚠ текшериңиз — бул репо чатта BC-250'де курулуп жатканы көрсөтүлгөн эмес; буйруктар репо README'синен.

> **Бул класстын аталган мисалы — TP-Link Archer TX10UB Nano ("AX900 WiFi 6 + BT 5.3").** Бул — чыныгы, табуу оңой продукт, жана анын **WiFi'и Linux'те иштейт** — ал **RTL8851BU** чибин алып жүрөт, ошондуктан C жолуна кирет (сизге стандарттык rtw88 эмес, `8851bu`/`biglinux/rtl8831` драйвери керек болот). **Бирок анын Bluetooth'у Linux'те вендор тарабынан колдоого алынбайт:** TP-Link'тин өзүнүн спецификациясы адаптерди Windows 10/11 гана деп тизмелейт жана **Bluetooth функциясы Mac, Linux же TV менен шайкеш келбейт** деп ачык айтат ([TP-Link продукт барагы](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)). Ошондуктан аны **"WiFi Linux'те иштейт (8851bu драйвери аркылуу); BT Linux'те вендор тарабынан колдоого алынбайт"** деп кароңуз. Коомчулук анын BT'син жалпы Realtek BT драйверлери аркылуу иштетиши мүмкүн, бирок бул текшерилген эмес — **аны таза plug-and-play WiFi+BT Linux донгл деп күтүп сатып албаңыз.** **UGreen** да "AX900" свистогун сатат, аны коомчулук альтернатива катары билдирет, бирок бул ошол эле RTL8851BU үй-бүлөсү — чипсетти текшериңиз жана ошол эле BT эскертүүсү колдонулат. ⚠ текшериңиз.

---

## Кокустан үзүлүүлөрдү оңдоо

Эгер сиздин свистогуңуз туташып, анан үзүлсө (классикалык Realtek-BC-250 симптому):

1. **Туура дарактан тышкаркы драйверди орнотуңуз** (B/C жолу) — бул учурлардын көпчүлүгүн чечет.
2. **Жүктөөдөн кийин кайра отургузуңуз / кайра сайыңыз.** Кээ бир свистоктор муздак жүктөөдө аныкталбайт жана бир жолу чыгарып-сайууну талап кылат. ([src](https://t.me/c/2424231195/16325))
3. **Чыгаруунун ордуна түзмөктү программалык жол менен баштапкы абалга келтириңиз** — `usbreset` колдонуңуз (аны физикалык түрдө сууруунун кереги жок). ([src](https://t.me/c/2424231195/135895)) · [кантип (Superuser)](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
4. **Башка USB портун сынап көрүңүз** (артыкчылык — арткы/root-hub порту) — симптом жүктөмдө кубат/өткөрүү жөндөмдүүлүгүнө байланыштуу көрүнөт. ([src](https://t.me/c/2424231195/17319))
5. **Донглду USB 3.0'дон алыс кармаңыз.** USB 3.0 порттору **2.4 GHz РЖ тоскоолдугунун** документтелген булагы — жогорку ылдамдыктагы сигнализация 2.4–2.5 GHz боюнча ~20 dB кеңжолоктуу шуу кошот, аны эч кандай чыпка алып салбайт, WiFi *жана* Bluetooth'ту так алар жашаган жерде начарлатат. Intel'дин ак китеби — канондук маалымат булагы. WiFi/BT донглдарын **USB 2.0 портуна** сайыңыз, же **кыска USB узарткыч кабелин** колдонуп, донглду USB 3.0 туташтыргычтарынан жана кандай гана DisplayPort/HDMI кабелинен бир нече дюйм алыс жылдырыңыз. ([Intel: USB 3.0 RF Interference Impact on 2.4 GHz Wireless Devices](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf))

---

## Bluetooth эскертүүлөрү

- WiFi+BT айкалышкан свистоктор **2.4 GHz** радиосун бөлүшөт, ошондуктан **Bluetooth иштеп турганда WiFi өткөрүү жөндөмдүүлүгү төмөндөйт**. Бир мүчө **BT күйгүзүлгөндө ~150 Mbit, өчүрүлгөндө ~190 Mbit** өлчөгөн — чыныгы, бирок "анчалык драмалуу эмес". ([src](https://t.me/c/2424231195/123366)) · ([src](https://t.me/c/2424231195/123367))
- aic8800d80 драйверинин BT колдоосу үчүн **өзүнчө `bluetooth` бутагы** бар. ([репо бутагы](https://github.com/shenmintao/aic8800d80/tree/bluetooth?tab=readme-ov-file))

- **Эгер Bluetooth эч качан пайда болбосо, универсалдуу `btusb` драйвери түзмөктү биринчи ээлеп алган.** aic8800 BT контроллерине өзүнүн `aic_btusb` модулу керек — ядродогу `btusb` аны инициализациялай албайт. Аларды `sudo rmmod btusb && sudo modprobe aic_btusb` аркылуу алмаштырыңыз же бул жөндөөнү туруктуу кылуу үчүн `/etc/modprobe.d/aic8800-bt.conf` файлына `softdep btusb pre: aic_btusb` кошуңуз. ([aic8800d80 #53](https://github.com/shenmintao/aic8800d80/issues/53) · [#44](https://github.com/shenmintao/aic8800d80/issues/44))

---

## Сатып алуу кыска тизмеси

Эгер эң аз тобокелдүү жолду кааласаңыз, тартиби боюнча:

1. **aic8800d80 свистогу** (AX90BT / D80MU3 классы) + Bazzite RPM рецепти — эң жакшы документтелген, WiFi+BT.
2. **Digma DWA-BT5-AC600C / AC1300E** — кутудан иштейт деп билдирилген. ([Ozon тизмеси](https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/))
3. **RTL8821CU свистогу + lwfinger/rtw88** — эң арзаны, кээ-кээде үзүлүүлөрдү кабыл алыңыз.
4. `biglinux/rtl8831` менен күрөшүүгө даяр болмоюнча, эң арзан **RTL8851BU "AX900"**'дон качыңыз.

> Донгл боюнча AI чатботтун "ооба бро, мыкты тандоо" дегенине ишенбеңиз — бир мүчө так ушундай кылып, ар 5–10 мүнөт сайын үзүлгөн RTL8822BU алган, анан ошол эле бот ал иштебейт деп айткан. Чипсет боюнча, бул жерде ырасталгандай сатып алыңыз. ([src](https://t.me/c/2424231195/138512))

---

## Булактар

- aic8800d80 Bazzite RPM — [`shenmintao/aic8800d80` `bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) · spec — https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec
- aic8800d80 чакан колдонмо — https://t.me/c/2424231195/120502 · RPM форк — https://t.me/c/2424231195/122580 · firmware zip — https://t.me/c/2424231195/119991
- aic8800 BT бутагы — https://github.com/shenmintao/aic8800d80/tree/bluetooth · альт репо — https://github.com/goecho/aic8800_linux_drvier (https://t.me/c/2424231195/82100)
- rtw88 куруу кадамдары — https://t.me/c/2424231195/16326 · бэкпорттун негиздемеси — https://t.me/c/2424231195/17321 · драйвер — [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88)
- RTL8851BU AX900 иштебейт — https://t.me/c/2424231195/17320 · драйвер — [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831)
- Үзүлүү симптому / бренджге эмес чипке карап — https://t.me/c/2424231195/16330 · https://t.me/c/2424231195/16331 · https://t.me/c/2424231195/16332 · https://t.me/c/2424231195/17319
- Digma кутудан иштейт — https://t.me/c/2424231195/138520 · тизме — https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/
- AI сунуштаган RTL8822BU үзүлөт — https://t.me/c/2424231195/138512 · Edimax качуу — https://t.me/c/2424231195/120503
- BT vs WiFi ылдамдыгы — https://t.me/c/2424231195/123366 · usbreset — https://t.me/c/2424231195/135895 · [Superuser кантип](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
- Тактадагы RTL8111/8168 Linux'те туруксуз; r8168 жеңилдетүү, Intel/MediaTek артык — [LinuxQuestions r8169 vs r8168](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)
- USB 3.0 2.4 GHz WiFi/BT менен тоскоолдук кылат (USB 2.0 / узарткыч колдонуңуз) — [Intel ак китеби](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf)
- TP-Link Archer TX10UB Nano — WiFi Linux'те иштейт (RTL8851BU), BT вендор тарабынан Windows гана / Linux эмес деп тизмеленген — [TP-Link продукт барагы](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)
