> 🌐 Tłumaczenie społecznościowe. Wersja angielska jest źródłem prawdy i może być nowsza. Znalazłeś błąd? Zgłoś to w [zgłoszeniu (issue)](https://github.com/lildebil0/awesome-bc250/issues). ([oryginał angielski](../en/10-wifi-bt.md))

# Dongle WiFi i Bluetooth

> **W skrócie** — BC-250 **nie ma wbudowanego WiFi ani Bluetooth**, więc potrzebujesz dongle na USB. Najpewniejszy pojedynczy wybór na czacie to karta oparta na **aic8800d80** (np. *AX90BT / D80MU3*), obsługiwana przez [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) — istnieje przetestowany przepis na RPM dla Bazzite. Karty **Realtek RTL88xx** (8821au/cu, 8822bu, 8851bu) są tanie i powszechne, ale to ból głowy nr 1 na czacie: łączą się, a potem **losowo rozłączają się pod obciążeniem**. [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) (sterownik z backportem) naprawia większość tego dla rodziny RTL8821/8822; karty RTL8851BU/8831BU „AX900 WiFi 6" potrzebują [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831). Jeśli chcesz kartę, która „po prostu działa" prosto z pudełka, właściciele donoszą, że robi to seria **Digma DWA-BT5**. Bluetooth dzieli radio 2.4 GHz, więc spodziewaj się spadku przepustowości WiFi, gdy BT jest aktywne.

Jeśli internet jest ci potrzebny tylko do konfiguracji, **przewodowy adapter USB-Ethernet lub wbudowana karta sieciowa (NIC)** pozwala całkowicie ominąć tę stronę. Po dongle WiFi/BT sięgnij wtedy, gdy faktycznie potrzebujesz łączności bezprzewodowej albo kontrolera Bluetooth.

> **O wbudowanym ethernecie Realtek RTL8111:** to ścieżka najmniejszego oporu, ale rodzina RTL8111/8168 jest **kapryśna-do-zawodnej na Linuksie** — standardowy sterownik `r8169` jest powszechnie zgłaszany jako przyczyna losowego podnoszenia/opadania łącza, rozłączeń pod obciążeniem pasma i czasem spadku do 100 Mbit. Zwykłym sposobem na złagodzenie tego jest przejście na moduł `r8168` spoza drzewa jądra. Jeśli wbudowany port źle się zachowuje, **lepiej wybierz kartę sieciową USB/PCIe od Intela lub MediaTeka** — ich sterowniki na Linuksa są znacznie bardziej niezawodne. ([Intel/MediaTek vs Realtek to długotrwała luka niezawodności na Linuksie](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)) ⚠ kapryśność RTL8111 to ogólny wzorzec na Linuksie, nie coś charakterystycznego dla BC-250 — zweryfikuj to na swojej płycie.

---

## Pierwsza rzecz do zrozumienia

Niemal każde zgłoszenie „mój dongle ciągle się rozłącza" na BC-250 sprowadza się do **dwóch rzeczy, a nie marki na pudełku**:

1. **Chipset w środku.** Etykieta (ASUS, TP-Link, D-Link…) nic nie znaczy — liczy się układ Realtek/aic/MediaTek pod obudową. Trzy karty różnych marek mogą nieść dokładnie ten sam układ i zawodzić identycznie. ([src](https://t.me/c/2424231195/16332))
2. **Zasilanie/stabilność USB pod obciążeniem.** Wielu użytkowników widzi, że karta działa dobrze, gdy jest bezczynna/przy przeglądaniu, a potem **rozłącza się w momencie, gdy ruch skacze** (duże pobieranie), „jak gdyby USB nie nadążało". Karta ASUS jednego użytkownika wytrzymała ledwie 17 minut, zanim rozłączyła się przy pobieraniu. ([src](https://t.me/c/2424231195/16331)) · ([src](https://t.me/c/2424231195/17319))

Więc: **wybieraj według chipsetu**, dopasuj go do utrzymywanego sterownika spoza drzewa jądra, a jeśli nadal się rozłącza, potraktuj to jako problem z zasilaniem/resetem (zobacz [Rozłączenia](#naprawianie-losowych-rozłączeń) poniżej).

> **Jak znaleźć chipset?** Pudełka rzadko go drukują. Przed zakupem wyszukaj online **FCC ID** karty (wydrukowane na urządzeniu/ogłoszeniu) — zgłoszenie ujawnia prawdziwy układ. Gdy już ją podłączysz, uruchom **`lsusb`** na Linuksie, aby zobaczyć identyfikatory vendor/product i chipset.

---

## Sprawdzone dongle

Skonfrontowane z repozytoriami sterowników. „Uwagi" odzwierciedlają to, co członkowie czatu rzeczywiście zaobserwowali na BC-250.

| Chipset | Przykładowe karty (z czatu) | Repo sterownika | Uwagi |
|---|---|---|---|
| **aic8800d80** (aic8800) | AX90BT / D80MU3 („AIC device wlan") | [`shenmintao/aic8800d80`](https://github.com/shenmintao/aic8800d80) | **Najbardziej polecane.** Przetestowany przepis na RPM dla Bazzite; WiFi+BT. Pokazuje się najpierw jako USB-CDROM, a potem przełącza się na `aic device wlan` po `install_setup.sh`. ([src](https://t.me/c/2424231195/120502)) |
| **RTL8821CU / 8821AU** | generyczny Realtek „свисток" | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Działa, ale **podatny na losowe rozłączenia** na starym sterowniku w jądrze. Backport lwfingera jest stabilny dla większości; właściwa poprawka trafiła do jądra 6.13–6.14. ([src](https://t.me/c/2424231195/17321)) |
| **RTL8822BU** | nienazwana karta dwuzakresowa | [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88) | Jeden właściciel: łączy się, a potem **rozłącza się co 5–10 min**. Obsługiwany na liście USB rtw88, ale niezawodność na BC-250 jest niepewna. ([src](https://t.me/c/2424231195/138512)) |
| **RTL8851BU / 8831BU** | „AX900 WiFi 6 + BT 5.3 za $5" | [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831) | **Nie zadziałało od razu** — układ WiFi 6 zbyt nowy dla rtw88. Potrzebuje dedykowanego sterownika `8851bu`. ([src](https://t.me/c/2424231195/17320)) |
| **Digma DWA-BT5-AC600C / AC1300E** | Digma USB WiFi+BT | w jądrze (Realtek) | Zgłoszone jako **działające od razu** („uruchomiło się za pierwszym razem"); właściciel BC-250 potwierdził w recenzjach produktu. ([src](https://t.me/c/2424231195/138520)) |

> **Zgłoszone jako NIE działające / uciążliwe:** generyczny **RTL8851BU „AX900"** prosto z pudełka ([src](https://t.me/c/2424231195/17320)); goły **RTL8821cu/8821au** na standardowych sterownikach jądra rozłącza się losowo ([src](https://t.me/c/2424231195/16330)); bezimienny **RTL8822BU** rozłącza się co kilka minut ([src](https://t.me/c/2424231195/138512)). Jeden użytkownik całkowicie się poddał i zamówił zamiast tego **Edimax EW-7733UnD**. ([src](https://t.me/c/2424231195/120503))

---

## Ścieżka A — aic8800d80 (zalecana)

To układ z najczystszą historią na BC-250. Istnieje pełny przepis na RPM dla Bazzite oraz napisany przez społeczność mini-przewodnik.

### Bazzite (rpm-ostree) — budowa RPM

[`bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) opiekuna buduje porządny RPM, dzięki czemu sterownik lepiej przetrwa aktualizacje obrazu niż samo `make`. Zweryfikowane względem repozytorium:

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

Członek czatu ([Nurmukhamed](https://github.com/Nurmukhamed/aic8800d80/tree/15a927286788af46529909bc2c14d16ea4241ec0/bazzite)) napisał przewodnik po pakowaniu RPM, za który społeczność mu podziękowała. ([src](https://t.me/c/2424231195/122580))

### Społecznościowy mini-przewodnik (szybka ścieżka „make")

Jeśli chcesz to mieć działające *teraz* i nie przeszkadza ci ponowne uruchamianie tego po restartach, przewodnik Aqtileka ([src](https://t.me/c/2424231195/120502)):

```bash
# The stick first appears as a fake CD-ROM. Flip it to WiFi mode (ONE TIME):
sudo sh install_setup.sh         # now shows as "aic device wlan"

# Temporarily lift the read-only root (Bazzite/atomic):
sudo rpm-ostree usroverlay

# Clone and build the driver (use the repo's "method 2"):
git clone https://github.com/shenmintao/aic8800d80.git && cd aic8800d80
# …then follow the repo's second install method.
```

> ⚠ **Trwałość po restarcie:** przy surowej ścieżce `make` **sterownik jest tracony po każdym restarcie** i trzeba go zainstalować ponownie — autor sugeruje mały skrypt autostartu. ([src](https://t.me/c/2424231195/120502)) Ścieżka RPM powyżej jest trwałą naprawą.

Archiwum firmware/sterownika, którego użył jeden z członków (*AX90BT(D80MU3)*), zostało udostępnione na czacie. ([src](https://t.me/c/2424231195/119991)) Istnieje alternatywne źródło upstream, [`goecho/aic8800_linux_drvier`](https://github.com/goecho/aic8800_linux_drvier), ale jeden użytkownik CachyOS spędził 6 h i nie zdołał go skompilować — na BC-250 lepiej wybrać `shenmintao`. ([src](https://t.me/c/2424231195/82100)) ⚠ zweryfikuj na swojej dystrybucji.

> **aic8800d80 - pułapki (z systemu śledzenia błędów sterownika):**
> - Oprogramowanie układowe `fmacfw_8800d80_u02.bin` musi znajdować się w `/lib/firmware/aic8800D80/`; nieudane załadowanie oprogramowania układowego pozostawia interfejs zablokowany w stanie `DOWN`. ([aic8800d80 #37](https://github.com/shenmintao/aic8800d80/issues/37) · [#10](https://github.com/shenmintao/aic8800d80/issues/10))
> - **Kernel 7.0 / 7.1:** sterownik 1.0.0 nie kompiluje się pod DKMS — sygnatury `cfg80211_new_sta` / `cfg80211_del_sta` uległy zmianie, a błąd `-Wimplicit-fallthrough` przerywa kompilację. Pozostań przy starszym jądrze lub nałóż łatkę na kod źródłowy, dopóki upstream nie nadrobi zaległości. ([aic8800d80 #49](https://github.com/shenmintao/aic8800d80/issues/49))
> - **Debian 13 (kernel 6.12.90):** interfejs Wi-Fi może nie uruchomić się lub nie wykrywać sieci. ([aic8800d80 #58](https://github.com/shenmintao/aic8800d80/issues/58))

---

## Ścieżka B — Realtek RTL8821 / RTL8822 (rtw88)

Tanie i wszędzie, ale sterownik w jądrze na starszych jądrach jest **wadliwy i rozłącza się losowo**. Naprawą jest sterownik spoza drzewa jądra (out-of-tree) z backportem z `lwfinger/rtw88`. Dokładne polecenia, których użył i potwierdził jako stabilne jeden z członków ([src](https://t.me/c/2424231195/16326)):

```bash
git clone https://github.com/lwfinger/rtw88
cd rtw88
make
sudo make install
sudo make install_fw
```

W konfiguracji z Secure Boot / DKMS repozytorium dokumentuje też przepływ `sudo dkms install $PWD` + `mokutil` — zobacz [README repozytorium](https://github.com/lwfinger/rtw88).

**Dlaczego to pomaga:** rozłączenia to znany błąd sterownika; właściwa poprawka trafiła do głównej gałęzi dopiero w **jądrze 6.13–6.14**, a wiele obrazów dystrybucji nadal dostarczało zepsutą wersję. Backport lwfingera daje ci naprawiony sterownik już teraz. ([src](https://t.me/c/2424231195/17321)) Obsługiwane układy USB obejmują RTL8811AU/CU, RTL8812AU/BU/CU, RTL8814AU, RTL8821AU/CU oraz RTL8822BU/CU (pełna lista w repozytorium).

> Uczciwe zastrzeżenie: nawet z rtw88 jeden użytkownik na RTL8821cu nadal widywał sporadyczne rozłączenia („ta sama bida"), a przepustowość nieco spada w porównaniu z zepsutym-ale-szybszym standardowym sterownikiem. ([src](https://t.me/c/2424231195/16333)) Jeśli niezawodność liczy się dla ciebie bardziej niż cena, wybierz aic8800d80 albo potwierdzoną Digmę.

---

## Ścieżka C — Realtek RTL8851BU / RTL8831BU („AX900 WiFi 6")

Bardzo tanie karty „AX900 WiFi 6 + Bluetooth 5.3" używają **RTL8851BU/8831BU**, którego `rtw88` **nie** obsługuje, więc są martwe prosto z pudełka. ([src](https://t.me/c/2424231195/17320)) Użyj dedykowanego sterownika [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831):

```bash
git clone https://github.com/biglinux/rtl8831
cd rtl8831
sudo dkms install .        # or: make && sudo make install
sudo modprobe 8851bu
```

⚠ zweryfikuj — to repozytorium nie było pokazywane podczas budowania na czacie na BC-250; polecenia pochodzą z README repozytorium.

> **Nazwany przykład tej klasy — TP-Link Archer TX10UB Nano („AX900 WiFi 6 + BT 5.3").** To prawdziwy, łatwy do znalezienia produkt, a jego **WiFi działa na Linuksie** — nosi układ **RTL8851BU**, więc podpada pod Ścieżkę C (będziesz potrzebować sterownika `8851bu`/`biglinux/rtl8831`, a nie standardowego rtw88). **Ale jego Bluetooth *nie* jest wspierany przez producenta na Linuksie:** własna specyfikacja TP-Link wymienia adapter jako tylko dla Windows 10/11 i wprost mówi, że **funkcja Bluetooth nie jest kompatybilna z Mac, Linux ani TV** ([strona produktu TP-Link](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)). Traktuj go więc jako **„WiFi działa na Linuksie (przez sterownik 8851bu); BT nie jest wspierane przez producenta na Linuksie".** Społeczność może uruchomić jego BT przez generyczne sterowniki Realtek BT, ale to niezweryfikowane — **nie kupuj go, licząc na czysty, plug-and-play dongle WiFi+BT na Linuksa.** **UGreen** sprzedaje też kartę „AX900", zgłaszaną przez społeczność jako alternatywa, ale to ta sama rodzina RTL8851BU — zweryfikuj chipset i obowiązuje to samo zastrzeżenie co do BT. ⚠ zweryfikuj.

---

## Naprawianie losowych rozłączeń

Jeśli twoja karta łączy się, a potem rozłącza (klasyczny objaw Realteka na BC-250):

1. **Zainstaluj właściwy sterownik spoza drzewa jądra** (Ścieżka B/C) — to rozwiązuje większość przypadków.
2. **Przepnij / wyjmij i włóż ponownie po starcie.** Niektóre karty nie są wykrywane przy zimnym starcie i wymagają jednego wyjęcia-włożenia. ([src](https://t.me/c/2424231195/16325))
3. **Zresetuj urządzenie programowo zamiast je wypinać** — użyj `usbreset` (bez potrzeby fizycznego wyciągania). ([src](https://t.me/c/2424231195/135895)) · [poradnik (Superuser)](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
4. **Wypróbuj inny port USB** (najlepiej tylny port na root-hubie) — objaw wygląda na związany z zasilaniem/pasmem pod obciążeniem. ([src](https://t.me/c/2424231195/17319))
5. **Trzymaj dongle z dala od USB 3.0.** Porty USB 3.0 to udokumentowane źródło **zakłóceń RF na 2.4 GHz** — szybka sygnalizacja dodaje ~20 dB szerokopasmowego szumu w paśmie 2.4–2.5 GHz, którego żaden filtr nie usunie, pogarszając WiFi *i* Bluetooth dokładnie tam, gdzie pracują. Kanonicznym źródłem jest white paper Intela. Podłączaj dongle WiFi/BT do **portu USB 2.0** albo użyj **krótkiego przedłużacza USB**, aby odsunąć dongle o kilka centymetrów od złączy USB 3.0 oraz od okablowania DisplayPort/HDMI. ([Intel: USB 3.0 RF Interference Impact on 2.4 GHz Wireless Devices](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf))

---

## Uwagi o Bluetooth

- Karty combo WiFi+BT dzielą radio **2.4 GHz**, więc **przepustowość WiFi spada, gdy Bluetooth jest aktywne**. Jeden członek zmierzył **~150 Mbit przy włączonym BT vs ~190 Mbit przy wyłączonym** — realne, ale „nie aż tak dramatyczne". ([src](https://t.me/c/2424231195/123366)) · ([src](https://t.me/c/2424231195/123367))
- Sterownik aic8800d80 ma **osobną gałąź `bluetooth`** do obsługi BT. ([gałąź repozytorium](https://github.com/shenmintao/aic8800d80/tree/bluetooth?tab=readme-ov-file))

- **Jeśli Bluetooth nigdy się nie pojawia, ogólny sterownik `btusb` przejął urządzenie jako pierwszy.** Kontroler BT aic8800 wymaga własnego modułu `aic_btusb` — wbudowany w jądro `btusb` nie potrafi go zainicjalizować. Zamień je za pomocą `sudo rmmod btusb && sudo modprobe aic_btusb` lub spraw, aby ta zmiana była trwała, dodając `softdep btusb pre: aic_btusb` do `/etc/modprobe.d/aic8800-bt.conf`. ([aic8800d80 #53](https://github.com/shenmintao/aic8800d80/issues/53) · [#44](https://github.com/shenmintao/aic8800d80/issues/44))

---

## Lista zakupowa

Jeśli chcesz ścieżkę najniższego ryzyka, w kolejności:

1. **Karta aic8800d80** (klasa AX90BT / D80MU3) + przepis na RPM dla Bazzite — najlepiej udokumentowana, WiFi+BT.
2. **Digma DWA-BT5-AC600C / AC1300E** — zgłoszona jako działająca od razu. ([ogłoszenie Ozon](https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/))
3. **Karta RTL8821CU + lwfinger/rtw88** — najtańsza, zaakceptuj sporadyczne rozłączenia.
4. Unikaj najtańszego **RTL8851BU „AX900"**, chyba że jesteś gotów walczyć z `biglinux/rtl8831`.

> Nie ufaj „jasne ziom, idealny wybór" od chatbota AI w sprawie dongla — pewien członek zrobił dokładnie to, dostał RTL8822BU, który rozłącza się co 5–10 min, a ten sam bot stwierdził potem, że to nie zadziała. Kupuj według chipsetu, zweryfikowanego tutaj. ([src](https://t.me/c/2424231195/138512))

---

## Źródła

- aic8800d80 Bazzite RPM — [`shenmintao/aic8800d80` `bazzite/README.md`](https://github.com/shenmintao/aic8800d80/blob/main/bazzite/README.md) · spec — https://raw.githubusercontent.com/shenmintao/aic8800d80/refs/heads/main/bazzite/aic8800d80.spec
- aic8800d80 mini-przewodnik — https://t.me/c/2424231195/120502 · fork RPM — https://t.me/c/2424231195/122580 · zip firmware — https://t.me/c/2424231195/119991
- aic8800 gałąź BT — https://github.com/shenmintao/aic8800d80/tree/bluetooth · alt repo — https://github.com/goecho/aic8800_linux_drvier (https://t.me/c/2424231195/82100)
- kroki budowy rtw88 — https://t.me/c/2424231195/16326 · uzasadnienie backportu — https://t.me/c/2424231195/17321 · sterownik — [`lwfinger/rtw88`](https://github.com/lwfinger/rtw88)
- RTL8851BU AX900 nie działa — https://t.me/c/2424231195/17320 · sterownik — [`biglinux/rtl8831`](https://github.com/biglinux/rtl8831)
- Objaw rozłączeń / według układu, nie marki — https://t.me/c/2424231195/16330 · https://t.me/c/2424231195/16331 · https://t.me/c/2424231195/16332 · https://t.me/c/2424231195/17319
- Digma działa OOB — https://t.me/c/2424231195/138520 · ogłoszenie — https://www.ozon.ru/product/setevoy-adapter-wifi-bluetooth-digma-dwa-bt5-ac600c-dvuhdiapazonnyy-1689608277/
- Rekomendowany przez AI RTL8822BU się rozłącza — https://t.me/c/2424231195/138512 · ucieczka do Edimax — https://t.me/c/2424231195/120503
- BT vs prędkość WiFi — https://t.me/c/2424231195/123366 · usbreset — https://t.me/c/2424231195/135895 · [poradnik Superuser](https://superuser.com/questions/141908/how-do-i-reset-an-usb-device-without-unplugging-it-in-linux)
- Wbudowany RTL8111/8168 kapryśny na Linuksie; złagodzenie przez r8168, lepiej Intel/MediaTek — [LinuxQuestions r8169 vs r8168](https://www.linuxquestions.org/questions/linux-hardware-18/realtek-rtl8111-8168-8411-ethernet-controller-r8168-driver-install-r8169-driver-doesn't-work-4175641982/)
- USB 3.0 zakłóca WiFi/BT na 2.4 GHz (użyj USB 2.0 / przedłużacza) — [white paper Intela](https://www.intel.com/content/www/us/en/content-details/841692/usb-3-0-radio-frequency-interference-impact-on-2-4-ghz-wireless-devices-white-paper.html) · [USB-IF PDF](https://www.usb.org/sites/default/files/327216.pdf)
- TP-Link Archer TX10UB Nano — WiFi działa na Linuksie (RTL8851BU), BT wg producenta tylko Windows / nie Linux — [strona produktu TP-Link](https://www.tp-link.com/us/home-networking/usb-adapter/archer-tx10ub-nano/)
