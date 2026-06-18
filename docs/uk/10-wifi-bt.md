> 🌐 Переклад спільноти. Англійська версія є джерелом істини й може бути новішою. Знайшли помилку? Відкрийте issue: [English](../en/10-wifi-bt.md) · [issues](https://github.com/lildebil0/awesome-bc250/issues)

# WiFi та Bluetooth донгли

> **Коротко** — BC-250 **не має вбудованих WiFi чи Bluetooth**, тож вам потрібен USB-донгл. Найнадійніший вибір у чаті — це свисток на базі **aic8800d80** (наприклад, *AX90BT / D80MU3*), який працює через [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) — є перевірений рецепт RPM для Bazzite. Свистки на **Realtek RTL88xx** (8821au/cu, 8822bu, 8851bu) дешеві й поширені, але це проблема №1 у чаті: вони під'єднуються, а потім **випадково відвалюються під навантаженням**. [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) (бекпортований драйвер) виправляє більшість цього для сімейства RTL8821/8822; свисткам RTL8851BU/8831BU «AX900 WiFi 6» потрібен [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831). Якщо хочете свисток, що «просто працює» з коробки, власники повідомляють, що серія **Digma DWA-BT5** саме така. Bluetooth ділить радіо 2.4 ГГц, тож очікуйте просідання пропускної здатності WiFi, поки активний BT.

Якщо вам потрібен інтернет лише для налаштування, **дротовий USB-Ethernet адаптер або вбудований NIC** дозволяють повністю обійти цю сторінку. Тягніться до WiFi/BT-донгла, коли вам справді потрібен бездротовий зв'язок чи Bluetooth-контролер.

> **Про вбудований Ethernet Realtek RTL8111:** це шлях найменшого опору, але сімейство RTL8111/8168 **ненадійне до глючного на Linux** — стандартний драйвер `r8169` за численними повідомленнями спричиняє випадкові підняття/падіння лінку, відвали під навантаженням, а іноді падіння до 100 Мбіт. Перехід на позадеревний модуль `r8168` — звичайне пом'якшення. Якщо вбудований порт поводиться погано, **надавайте перевагу USB/PCIe NIC від Intel чи MediaTek** — їхні Linux-драйвери значно надійніші. ([Intel/MediaTek проти Realtek — давнє відставання за надійністю на Linux](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)) ⚠ глючність RTL8111 — це загальний патерн Linux, а не специфіка BC-250 — перевірте на своїй платі.

---

## Перше, що варто зрозуміти

Майже кожне повідомлення «мій донгл постійно відключається» на BC-250 зводиться до **двох речей, а не до бренду на коробці**:

1. **Чипсет усередині.** Етикетка (ASUS, TP-Link, D-Link…) нічого не означає — важить чип Realtek/aic/MediaTek під корпусом. Три свистки різних брендів можуть нести точно той самий чип і відмовляти однаково. ([src](https://t.me/c/2424231195/16332))
2. **Живлення/стабільність USB під навантаженням.** Багато користувачів бачать, як свисток працює нормально в простої/під час серфінгу, а потім **відвалюється тієї ж миті, коли трафік підскакує** (велике завантаження), «ніби USB не встигає». Свисток ASUS одного користувача протримався цілих 17 хвилин, перш ніж відпав на завантаженні. ([src](https://t.me/c/2424231195/16331)) · ([src](https://t.me/c/2424231195/17319))

Отже: **обирайте за чипсетом**, підбирайте до нього підтримуваний позадеревний драйвер, а якщо все одно відвалюється — ставтеся до цього як до проблеми живлення/скидання (див. [Відвали](#виправлення-випадкових-відвалів) нижче).

> **Як дізнатися чипсет?** Коробки рідко друкують його. Перед купівлею знайдіть **FCC ID** свистка (надрукований на пристрої/в оголошенні) онлайн — заявка розкриває справжній чип. Після того як він під'єднаний, запустіть **`lsusb`** на Linux, щоб побачити ID виробника/продукту та чипсет.

---

## Перевірені робочі донгли

Звірено з репозиторіями драйверів. «Нотатки» відображають те, що учасники чату справді спостерігали на BC-250.

| Чипсет | Приклади свистків (з чату) | Репозиторій драйвера | Нотатки |
|---|---|---|---|
| **aic8800d80** (aic8800) | AX90BT / D80MU3 («AIC device wlan») | [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) | **Найбільш рекомендований.** Перевірений рецепт RPM для Bazzite; WiFi+BT. Спершу з'являється як USB-CDROM, потім перемикається на `aic device wlan` після `install_setup.sh`. ([src](https://t.me/c/2424231195/120502)) |
| **RTL8821CU / 8821AU** | загальний Realtek «свисток» | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Працює, але **схильний до випадкових відвалів** на старому вбудованому драйвері. Бекпорт lwfinger стабільний для більшості; належне виправлення з'явилося в ядрі 6.13–6.14. ([src](https://t.me/c/2424231195/17321)) |
| **RTL8822BU** | безіменний двосмуговий свисток | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Один власник: під'єднується, потім **відвалюється кожні 5–10 хв**. Підтримується списком USB у rtw88, але надійність на BC-250 — як пощастить. ([src](https://t.me/c/2424231195/138512)) |
| **RTL8851BU / 8831BU** | «$5 AX900 WiFi 6 + BT 5.3» | [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) | **Не запрацював з коробки** — чип WiFi 6 занадто новий для rtw88. Потрібен спеціальний драйвер `8851bu`. ([src](https://t.me/c/2424231195/17320)) |
| **Digma DWA-BT5-AC600C / AC1300E** | Digma USB WiFi+BT | вбудований у ядро (Realtek) | За повідомленнями **працює з коробки** («запустився з першого разу»); власник BC-250 підтвердив у відгуках на товар. ([src](https://t.me/c/2424231195/138520)) |

> **За повідомленнями НЕ працюють / болісні:** загальний **RTL8851BU «AX900»** з коробки ([src](https://t.me/c/2424231195/17320)); голі **RTL8821cu/8821au** на стандартних драйверах ядра випадково відвалюються ([src](https://t.me/c/2424231195/16330)); безіменний **RTL8822BU** відвалюється кожні кілька хвилин ([src](https://t.me/c/2424231195/138512)). Один користувач узагалі здався й замовив натомість **Edimax EW-7733UnD**. ([src](https://t.me/c/2424231195/120503))

---

## Шлях A — aic8800d80 (рекомендований)

Це чип із найчистішою історією на BC-250. Є повноцінний рецепт RPM для Bazzite та написаний спільнотою міні-гайд.

### Bazzite (rpm-ostree) — збірка RPM

[`bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) мейнтейнера збирає повноцінний RPM, щоб драйвер переживав оновлення образу краще, ніж сирий `make`. Звірено з репозиторієм:

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

Учасник чату ([Nurmukhamed](https://github.com/Nurmukhamed/aic8800d80/tree/15a927286788af46529909bc2c14d16ea4241ec0/bazzite)) написав покрокову інструкцію з пакування RPM, за яку спільнота йому подякувала. ([src](https://t.me/c/2424231195/122580))

### Міні-гайд спільноти (швидкий шлях через «make»)

Якщо ви просто хочете підняти його *зараз* і не проти перезапускати після перезавантажень — гайд Aqtilek ([src](https://t.me/c/2424231195/120502)):

```bash
# The stick first appears as a fake CD-ROM. Flip it to WiFi mode (ONE TIME):
sudo sh install_setup.sh         # now shows as "aic device wlan"

# Temporarily lift the read-only root (Bazzite/atomic):
sudo rpm-ostree usroverlay

# Clone and build the driver (use the repo's "method 2"):
git clone https://github.com/shenmintao/aic8800d80.git && cd aic8800d80
# …then follow the repo's second install method.
```

> ⚠ **Стійкість до перезавантаження:** на сирому шляху через `make` **драйвер губиться при кожному перезавантаженні** й має бути перевстановлений — автор пропонує невеликий скрипт автозапуску. ([src](https://t.me/c/2424231195/120502)) Шлях через RPM вище — це довговічне виправлення.

Архів прошивки/драйвера, який використав один учасник (*AX90BT(D80MU3)*), було поширено в чаті. ([src](https://t.me/c/2424231195/119991)) Альтернативний апстрім, [`goecho/aic8800_linux_drvier`](https://github.com/goecho/aic8800_linux_drvier), існує, але один користувач CachyOS витратив 6 год і не зміг його скомпілювати — надавайте перевагу `shenmintao` на BC-250. ([src](https://t.me/c/2424231195/82100)) ⚠ перевірте на своєму дистрибутиві.

> **aic8800d80 підводні камені (з трекера проблем драйвера):**
> - Прошивка `fmacfw_8800d80_u02.bin` повинна знаходитися в `/lib/firmware/aic8800D80/`; через невдале завантаження прошивки інтерфейс зависає в стані `DOWN`. ([aic8800d80 #37](https://github.com/shenmintao/aic8800d80/issues/37) · [#10](https://github.com/shenmintao/aic8800d80/issues/10))
> - **Ядро 7.0 / 7.1:** драйвер 1.0.0 не вдається зібрати під DKMS — сигнатури `cfg80211_new_sta` / `cfg80211_del_sta` змінилися, і помилка `-Wimplicit-fallthrough` перериває компіляцію. Залишайтеся на старішому ядрі або застосуйте патч до вихідного коду, поки upstream не оновиться. ([aic8800d80 #49](https://github.com/shenmintao/aic8800d80/issues/49))
> - **Debian 13 (ядро 6.12.90):** інтерфейс Wi-Fi може не запускатися або не виявляти мережі. ([aic8800d80 #58](https://github.com/shenmintao/aic8800d80/issues/58))

---

## Шлях B — Realtek RTL8821 / RTL8822 (rtw88)

Дешеві й усюди, але вбудований у ядро драйвер на старих ядрах **багований і випадково відвалюється**. Виправлення — бекпортований позадеревний драйвер з `lwfinger/rtw88`. Точні команди, які використав один учасник і підтвердив як стабільні ([src](https://t.me/c/2424231195/16326)):

```bash
git clone https://github.com/lwfinger/rtw88
cd rtw88
make
sudo make install
sudo make install_fw
```

На системі з Secure Boot / DKMS репозиторій також документує процес `sudo dkms install $PWD` + `mokutil` — див. [README репозиторію](https://github.com/lwfinger/rtw88).

**Чому це допомагає:** відвали — це відомий баг драйвера; належне виправлення дійшло до мейнлайну лише в **ядрі 6.13–6.14**, а багато образів дистрибутивів усе ще постачали зламану версію. Бекпорт lwfinger дає вам виправлений драйвер уже зараз. ([src](https://t.me/c/2424231195/17321)) Підтримувані USB-частини включають RTL8811AU/CU, RTL8812AU/BU/CU, RTL8814AU, RTL8821AU/CU та RTL8822BU/CU (повний список у репозиторії).

> Чесне застереження: навіть із rtw88 один користувач на RTL8821cu все ще бачив періодичні відвали («та сама шляпа»), і пропускна здатність дещо просідає проти зламаного-але-швидшого стандартного драйвера. ([src](https://t.me/c/2424231195/16333)) Якщо надійність важливіша за ціну — беріть aic8800d80 або підтверджену Digma.

---

## Шлях C — Realtek RTL8851BU / RTL8831BU («AX900 WiFi 6»)

Дуже дешеві свистки «AX900 WiFi 6 + Bluetooth 5.3» використовують **RTL8851BU/8831BU**, який `rtw88` **не** покриває, тож вони мертві з коробки. ([src](https://t.me/c/2424231195/17320)) Використовуйте спеціальний драйвер [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831):

```bash
git clone https://github.com/biglinux/rtl8831
cd rtl8831
sudo dkms install .        # or: make && sudo make install
sudo modprobe 8851bu
```

⚠ перевірте — цей репозиторій не показували в збірці в чаті на BC-250; команди взято з README репозиторію.

> **Іменований приклад цього класу — TP-Link Archer TX10UB Nano («AX900 WiFi 6 + BT 5.3»).** Це реальний, легкодоступний продукт, і його **WiFi працює на Linux** — він несе чип **RTL8851BU**, тож підпадає під Шлях C (вам знадобиться драйвер `8851bu`/`biglinux/rtl8831`, а не стандартний rtw88). **Але його Bluetooth *не* підтримується виробником на Linux:** власна специфікація TP-Link зазначає адаптер лише для Windows 10/11 і прямо каже, що **функція Bluetooth не сумісна з Mac, Linux чи TV** ([сторінка продукту TP-Link](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)). Тож ставтеся до нього як до **«WiFi працює на Linux (через драйвер 8851bu); BT не підтримується виробником на Linux».** Спільнота може підняти його BT через загальні драйвери Realtek BT, але це неперевірено — **не купуйте його, очікуючи чистого plug-and-play WiFi+BT донгла під Linux.** **UGreen** також продає свисток «AX900», який спільнота повідомляє як альтернативу, але це те саме сімейство RTL8851BU — перевірте чипсет, і застосовується те саме застереження щодо BT. ⚠ перевірте.

---

## Виправлення випадкових відвалів

Якщо ваш свисток під'єднується, а потім відвалюється (класичний симптом Realtek-на-BC-250):

1. **Встановіть правильний позадеревний драйвер** (Шлях B/C) — це розв'язує більшість випадків.
2. **Перевставте / перепідключіть після завантаження.** Деякі свистки не визначаються на холодному завантаженні й потребують одного відключення-підключення. ([src](https://t.me/c/2424231195/16325))
3. **Скиньте пристрій програмно замість фізичного відключення** — використайте `usbreset` (не потрібно фізично його витягувати). ([src](https://t.me/c/2424231195/135895)) · [інструкція (Superuser)](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
4. **Спробуйте інший USB-порт** (бажано задній/порт кореневого хаба) — симптом виглядає пов'язаним із живленням/пропускною здатністю під навантаженням. ([src](https://t.me/c/2424231195/17319))
5. **Тримайте донгл подалі від USB 3.0.** Порти USB 3.0 — задокументоване джерело **радіочастотних завад 2.4 ГГц** — високошвидкісна сигналізація додає ~20 дБ широкосмугового шуму по всьому діапазону 2.4–2.5 ГГц, який жоден фільтр не може прибрати, погіршуючи WiFi *і* Bluetooth саме там, де вони живуть. Біла книга Intel — канонічний довідник. Вмикайте WiFi/BT-донгли в **порт USB 2.0** або використовуйте **короткий USB-подовжувач**, щоб відсунути донгл на кілька дюймів від роз'ємів USB 3.0 та будь-якого кабелювання DisplayPort/HDMI. ([Intel: вплив радіочастотних завад USB 3.0 на бездротові пристрої 2.4 ГГц](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [PDF USB-IF](https://www.usb.org/sites/default/files/327216.pdf))

---

## Нотатки щодо Bluetooth

- Комбіновані свистки WiFi+BT ділять радіо **2.4 ГГц**, тож **пропускна здатність WiFi падає, поки активний Bluetooth**. Один учасник виміряв **~150 Мбіт з увімкненим BT проти ~190 Мбіт із вимкненим** — реально, але «не так уже й драматично». ([src](https://t.me/c/2424231195/123366)) · ([src](https://t.me/c/2424231195/123367))
- Драйвер aic8800d80 має **окрему гілку `bluetooth`** для підтримки BT. ([гілка репозиторію](https://github.com/shenmintao/aic8800d80/tree/bluetooth?tab=readme-ov-file))

- **Якщо Bluetooth взагалі не з'являється, це означає, що універсальний драйвер `btusb` перехопив пристрій першим.** Bluetooth-контролеру aic8800 потрібен власний модуль `aic_btusb` — вбудований у ядро `btusb` не може його ініціалізувати. Замініть їх за допомогою `sudo rmmod btusb && sudo modprobe aic_btusb` або зробіть це постійним, додавши `softdep btusb pre: aic_btusb` до `/etc/modprobe.d/aic8800-bt.conf`. ([aic8800d80 #53](https://github.com/shenmintao/aic8800d80/issues/53) · [#44](https://github.com/shenmintao/aic8800d80/issues/44))

---

## Шорт-лист для купівлі

Якщо хочете шлях найменшого ризику, за порядком:

1. **Свисток aic8800d80** (клас AX90BT / D80MU3) + рецепт RPM для Bazzite — найкраще задокументований, WiFi+BT.
2. **Digma DWA-BT5-AC600C / AC1300E** — за повідомленнями працює з коробки. ([оголошення Ozon](https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/))
3. **Свисток RTL8821CU + lwfinger/rtw88** — найдешевший, прийміть періодичні відвали.
4. Уникайте найдешевших **RTL8851BU «AX900»**, якщо ви не готові воювати з `biglinux/rtl8831`.

> Не довіряйте «так, бро, ідеальний вибір» від ШІ-чатбота щодо донгла — один учасник зробив саме так, отримав RTL8822BU, що відвалюється кожні 5–10 хв, і той самий бот потім сказав, що той не працюватиме. Купуйте за чипсетом, перевіреним тут. ([src](https://t.me/c/2424231195/138512))

---

## Джерела

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
