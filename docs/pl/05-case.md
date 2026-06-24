> 🌐 Tłumaczenie społecznościowe. Wersja angielska jest źródłem prawdy i może być nowsza. Znalazłeś błąd? Zgłoś to w [zgłoszeniu (issue)](https://github.com/lildebil0/awesome-bc250/issues). ([oryginał angielski](../en/05-case.md))

# Obudowy i druk 3D

> **W skrócie** — BC-250 dostarczana jest jako goła płytka, więc niemal każdy drukuje obudowę. Nie ma jednej „właściwej" obudowy — społeczność stworzyła **dziesiątki** projektów, od minimalnej **osłony chłodzącej**, która po prostu zatrzaskuje dwie połówki wokół płytki, po pełne **obudowy w stylu konsoli** z uchwytem do przenoszenia, ekranem z przodu i RGB. Cokolwiek wydrukujesz, obudowa musi wykonać jedno zadanie, którego fabryczna płytka nie potrafi: **uszczelnić wentylator 120 mm względem żeber radiatora**, tak aby powietrze przechodziło *przez* nie (zobacz [Chłodzenie](04-cooling.md)). Ta strona to katalog: nazwa → STL → wentylatory → gdzie pobrać. **Uważaj na zasilacz**: większość obudów projektowana jest wokół konkretnego zasilacza (LOP, Flex/SFX ATX lub serwerowa kostka HP) — wybierz obudowę pasującą do [zasilacza](03-power-supply.md), który masz.

„Obudowa" oznacza tu wszystko od wydruku 200 g zajmującego 20 minut pracy po wieloczęściową konsolę, nad którą autor pracował tygodniami. Zacznij prosto; zawsze możesz wydrukować ponownie.

> **Nowy i niepewny? Wydrukuj obudowę [onemorecap sleeve/shell](#poziom-1--minimalna-osłona-chłodząca-zacznij-tutaj) — minimalna, nic do cięcia, mieści jeden wentylator 120 mm — i na tym poprzestań.** Poniższy katalog jest obszerny; nie musisz go czytać, żeby zacząć.

> **Chcesz pełną listę?** elektricM prowadzi **przeszukiwalny, filtrowalny katalog ~143 projektów** (filtruj według rodziny zasilacza, dostępności, platformy) — znacznie więcej niż wyselekcjonowany zestaw poniżej, w tym wiele buildów dostępnych tylko na Discordzie oraz WIP. Przeglądaj go pod adresem **[elektricM — Cases & Enclosures](https://elektricm.github.io/amd-bc250-docs/community/cases/)**. Wybory poniżej to nazwane, publicznie dostępne do pobrania pozycje, od których warto zacząć.

---

## Buildy społeczności

Próbka tego, co ludzie faktycznie wydrukowali — od gołej, otwartej osłony po w pełni tematyzowane konsole. Ta sama płytka, skrajnie różne rezultaty.

<p align="center">
  <img src="../../assets/img/case-shell.jpg" alt="Obudowa onemorecap Shell Case: otwarta płyta boczna, uchwyt do przenoszenia, odsłonięte miedziane żebra, wentylator Arctic 120 mm" width="60%"><br>
  <sub>Wykonanie: Дима Ткач · <a href="https://t.me/c/2424231195/22771">źródło</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-frame.jpg" alt="Biała aluminiowa otwarta rama z odsłoniętymi podzespołami: dwa radiatory, centralny biały wentylator Arctic, zasilacz Flex" width="60%"><br>
  <sub>Wykonanie: Сергей · <a href="https://t.me/c/2424231195/87420">źródło</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-orange.jpg" alt="Pomarańczowo-biała zamknięta konsola z perforowanym, siatkowym panelem bocznym i wyprofilowanym uchwytem do przenoszenia" width="60%"><br>
  <sub>Wykonanie: Alexander Susl · <a href="https://t.me/c/2424231195/122822">źródło</a></sub>
</p>

<p align="center">
  <img src="../../assets/img/case-arasaka.jpg" alt="Konsola w cyberpunkowym stylu ARASAKA: biały front, chromowana kratka wentylatora, zielone akcenty i nóżki" width="60%"><br>
  <sub>Wykonanie: Maxim Perelygin · <a href="https://t.me/c/2424231195/98072">źródło</a></sub>
</p>

---

## Jak wybrać

Trzy pytania decydują o tym, która obudowa do Ciebie pasuje:

1. **Jakiego zasilacza używasz?** ([Zasilacz](03-power-supply.md)) — Meanwell **LOP-300** jest mały i mieści się *wewnątrz* większości obudów. Zasilacz **Flex/SFX ATX** jest większy i wymaga obudowy z dedykowaną zatoką. Odzyskana **kostka HP/serwerowa** wymaga obudów „v3/v4 server PSU". To największy pojedynczy filtr.
2. **Jaki wentylator (jakie wentylatory) zamierzasz uruchomić?** Niemal każda obudowa zbudowana jest wokół **jednego wentylatora 120 mm** nad radiatorem. Większe buildy dodają **drugi wentylator 120 mm** na backplate (do chłodzenia pamięci GDDR6, która jest [bez czujnika temperatury](04-cooling.md)) albo do zasilania zasilacza. Kilka korzysta z wentylatorów **140 mm** lub **slim**, gdy brakuje wysokości.
3. **Czy przerzedziłeś już żebra?** Większość obudów zakłada, że już **rozpiłowałeś/przeszlifowałeś fabryczne żebra radiatora** (zobacz [Chłodzenie, Ścieżka A](04-cooling.md)). Sama obudowa nie naprawia fabrycznego chłodzenia — jedynie utrzymuje wentylator we właściwym miejscu.

> **Żargon, raz:** **STL** = standardowy plik siatki do druku 3D, który ładujesz do slicera. **STEP / 3MF** = edytowalne formaty CAD (użyj ich, jeśli chcesz zmodyfikować projekt). **Shroud / sleeve / adapter** = drukowany lejek, który sprawia, że wentylator uszczelnia się względem żeber zamiast upuszczać powietrze dookoła nich. **Flex / SFX ATX** = zasilacze PC o małym formacie. **LOP** = przemysłowy zasilacz Meanwell LOP-300, który społeczność preferuje.

> **💡 Wydrukuj otwór dostępowy do zworki reset CMOS.** Za każdym razem, gdy zmieniasz podział VRAM/UMA, musisz wykonać **reset CMOS** (zobacz [BIOS](08-bios.md)), więc zaprojektowanie szczelnej obudowy, która zakopie zworkę, oznacza wielokrotne jej rozkręcanie. Pozostaw **otwór dostępowy ⌀10 mm** nad zworką clear-CMOS w każdym zamkniętym projekcie — albo, jeszcze lepiej, wyprowadź mały **3-pozycyjny przełącznik** na panel, abyś mógł zresetować ją bez narzędzi. ([4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980))

---

## Poziom 1 — Minimalna „osłona chłodząca" (zacznij tutaj)

Najmniejsza, najszybsza rzecz, jaką możesz wydrukować. To **nie do końca obudowa** — to drukowany płaszcz, który zatrzaskuje się na płytce w dwóch połówkach na ciasny pasowanie cierne, trzyma wentylator 120 mm przy radiatorze i kanałuje powietrze. **Nic do cięcia, żadnych śrub wkręcanych w płytkę.** Дима Ткач (jeden z najwcześniejszych twórców projektu) opisuje dwa warianty — kompaktowy i „ciekawiej wyglądający" — oba osiągające **~70 °C przy 150 W** obciążenia, ~210 g / ~170 g plastiku każdy, przy zasilaczu pozostającym zimnym na turbulentnym przepływie powietrza ([źródło](https://t.me/c/2424231195/10743)). Jego werdykt: *„to nie do końca obudowa, raczej osłona chłodząca, ale niczego nie trzeba ciąć, wszystko trzyma się na bardzo ciasnym pasowaniu, połówki nakłada się z przeciwnych stron."*

- **Pliki:** `BC-250-FanSleeves.3mf` ([źródło](https://t.me/c/2424231195/10766)), CAD płytki `bc-250-body.step` ([źródło](https://t.me/c/2424231195/18266))
- **Repozytorium źródłowe:** [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) — najczęściej polecany na czacie minimalny projekt „zweryfikowany, wydrukowany, potwierdzony jako działający" ([źródło](https://t.me/c/2424231195/18260))
- **Wentylator:** 1× 120 mm
- **Zasilacz:** dowolny — jest otwór/wycięcie na przewód zasilający, więc możesz użyć LOP *albo* zasilacza zewnętrznego ([źródło](https://t.me/c/2424231195/22950))

---

## Poziom 2 — Otwarta rama / „shell" (płytka na widoku)

Półobudowy, które otaczają płytkę z jednej strony i pozostawiają radiator widoczny. Lekkie pod względem plastiku, łatwe w montażu, dobry przepływ powietrza.

### onemorecap „Shell Case" — referencyjny build

Pojedynczy najwyżej oceniony reakcjami post o obudowie na czacie (❤33): płaska płyta boczna nad płytką z wytłoczonym napisem **„BC-250"** i wzorem siatki CU, **uchwyt do przenoszenia** wyprofilowany w górnej części, **odsłonięte przerzedzone żebra radiatora** pośrodku i wentylator 120 mm **Arctic** we własnej osłonie przykręconej do prawego końca. Oznaczony *„BC-250 SHELL CASE BY ONEMORECAP / ASRock × CMG"* ([źródło](https://t.me/c/2424231195/22771)). Pasujący zestaw plików STL został opublikowany na czacie w jednej paczce ([źródło](https://t.me/c/2424231195/81672)), a autor potwierdził, że modele są darmowe na Printables i MakerWorld ([źródło](https://t.me/c/2424231195/24505)).

- **Pliki (paczka z czatu):** `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl`, plus osłony wentylatorów poniżej ([źródło](https://t.me/c/2424231195/81680))
- **Źródło:** [GitHub onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case)
- **Wentylator:** 1× lub 2× 120 mm (przez osłonę) albo 1× 140 mm
- **Zasilacz:** tylny panel `Shell_Back_FLEX_ATX` jest wycięty pod zasilacz **Flex ATX**

### Akrylowa otwarta rama (Владислав)

Otwarta rama **aluminiowo-akrylowa**: dwie metalowe płyty końcowe z przezroczystymi panelami bocznymi, płytka montowana pionowo, pojedynczy wentylator **Arctic 120 mm** dmuchający prosto przez przerzedzony radiator pośrodku oraz zasilacz Flex/SFX w dolnej zatoce ([źródło](https://t.me/c/2424231195/114651)). To projekt później udostępniony na [r/BC250Gaming jako „acrylic case"](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/). Drukowane uchwyty to części, które odtwarzasz; sama rama jest cięta laserowo / gotowa z półki.

- **Wentylator:** 1× 120 mm (centralny) — jest miejsce na dodanie wentylatora na backplate
- **Zasilacz:** Flex / SFX ATX w dolnej zatoce

---

## Poziom 3 — Obudowy w stylu konsoli (w pełni zamknięte)

Zamknięte obudowy wyglądające jak konsola do gier lub mały NAS. Więcej plastiku i więcej czasu druku, ale gotowy produkt z uchwytem, przyciskiem zasilania, wentylowanymi panelami i czasem ekranem.

### „Просто лучший корпус" (Jack Fisher × B1zon) — ulubieniec społeczności

Opublikowany pod wyselekcjonowanym tagiem **#BC250body** jako *„po prostu najlepsza obudowa"*, to w pełni wykończona konsola z opublikowaną listą materiałów: zasilacz, wentylatory, złącze, gumowe nóżki, przycisk zasilania, śruby + wkładki gwintowane, rozgałęziacz PWM do wentylatorów, naklejka „Cyberpunk" oraz grzebień do prostowania radiatora. Niektóre części nie są już produkowane i mają zamienniki ([źródło](https://t.me/c/2424231195/79990)). Projekt autorstwa B1zon, montaż Jack Fisher.

- **Pliki:** `BC250 korpus исправленный.rar` („BC250 case, corrected") ([źródło](https://t.me/c/2424231195/79989))
- **Wentylator:** 120 mm (przód) + rozgałęziacz PWM na drugi wentylator
- **Zasilacz:** wewnętrzny (klasy LOP)

### Front z potrójnym „GPU" (Гослинг)

Obudowa w stylu konsoli, której panel przedni to **atrapa osłony karty graficznej** — trzy okrągłe wycięcia na wentylatory w rzędzie z RGB, tak że maszyna wygląda jak dedykowane GPU. Pokazana podczas uruchamiania **Bazzite 42** na BC-250 ([źródło](https://t.me/c/2424231195/66616)). Trzy otwory są kosmetyczne ponad pojedynczym działającym wentylatorem plus wlot.

### Biała konsola z panelem-labiryntem (Jhonatan)

Wysoka biała obudowa z efektownym **wentylowanym panelem bocznym o wzorze labiryntu/obwodu**, podświetlanym (zielonym) metalowym przyciskiem zasilania i pełnowymiarową kratką wlotową na froncie — jedna z bardziej dopracowanych estetyk na czacie ([źródło](https://t.me/c/2424231195/121274)).

### Mini-wieża z siatką kratową (Joglik)

Szara pionowa mini-wieża z gęstą **kwadratową siatką kratową** z boku i na górze, szczeliną/wcięciem uchwytu w górnej krawędzi i okrągłym przepustem na kable na dole z tyłu. Czysty, industrialny wygląd ([źródło](https://t.me/c/2424231195/126525)).

### Obudowa hi-fi z owalnym okienkiem (a m)

Biała prostokątna obudowa stylizowana na front hi-fi/kuchenki mikrofalowej: duże **okno siatkowe w kształcie stadionu** z wentylatorem widocznym za okrągłą siatką, otoczone dwiema pionowymi szczelinami siatkowymi ([źródło](https://t.me/c/2424231195/52955)). Późniejsza iteracja autora zmierza w stronę „prawdziwego plastiku" zamiast spienionego PCV i dodaje zewnętrzne zasilanie serii XT oraz RGB ([źródło](https://t.me/c/2424231195/128048)).

### Kompaktowa konsola (Volodymyr Spyrydonov, „v15")

Mała srebrno-czarna obudowa w stylu konsoli z siatkowym wlotem bocznym i ciemnym frontem niosącym emblemat w stylu cyberpunk oraz pasek RGB, pokazana obok telewizora jako maszyna do salonu ([źródło](https://t.me/c/2424231195/135995)). Część długiej linii rewizji (obrazy źródłowe v15/v19/v20 były udostępniane na wczesnym etapie).

### BC250 Vented Edition (MaelremremDotXYZ)

Minimalistyczna konsola **FlexATX** uruchamiana **z otwartymi żebrami**, utrzymująca **~67 °C @ 2145 MHz / 1,1 V**, z tylnym wyłącznikiem zasilacza. [MakerWorld 2899020](https://makerworld.com/en/models/2899020).

### Stellar 250 (isaacalvex)

Pełna, samodzielna konsola z kompletnym **przewodnikiem budowy**: wewnętrzny dysk, **WiFi 6** oraz **wyświetlacz temperatury ESP32**. [GitHub isaacalvex/AMD-BC-250-Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide).

### Simple Case for the ASRock AMD BC-250

Nazwana, publicznie dostępna do pobrania obudowa w stylu konsoli opublikowana przez autora [ukraińskiego poradnika budowy na YouTube](https://youtu.be/p5Zd86vFe8w) — prosta, zamknięta skrzynka dla tych, którzy chcą gotowy wydruk bez wieloczęściowej złożoności. [MakerWorld 2870270](https://makerworld.com/en/models/2870270).

---

## Poziom 4 — Duże buildy: zasilacz ATX, chłodzenie cieczą AIO, ekrany

Dla osób, które chcą pełnowymiarowy zasilacz, chłodzenie cieczą lub zintegrowany wyświetlacz.

### Rodzina NexGen3D „DIY Steam Machine"

**Najczęściej wskazywany projekt 3D** w społeczności (udostępniony ponownie 7×). Rodzina obudów w stylu konsoli na Printables, w tym wariant **chłodzony cieczą „Pro"** oraz edycja **„Redux"**, która mieści **wewnętrzny ekran Pi 1080×480** z przodu ([build na Reddicie](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)). Istnieje dedykowany model **mocowania AIO** do założenia chłodzenia cieczą all-in-one 120 mm na kryształ.

- [Printables 1499974 — DIY Steam Machine (baza)](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite)
- [Printables 1614131 — Pro Liquid-Cooled](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) · [Printables 1649679 — Redux](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) · [Printables 1554003 — AIO mount](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250)
- **Wentylator/chłodzenie:** 120 mm powietrzne **lub** 120 mm AIO w zależności od wariantu
- **Zasilacz:** udokumentowane wersje LOP i ATX

### Referencyjny build „Steam Machine Pro" chłodzony cieczą (Old Lamer)

Wysokiej klasy, w pełni chłodzony cieczą build udokumentowany od początku do końca na wideo — przydatny jako lista zakupów części, jeśli idziesz na całość z maszyną AIO ([Old Lamer](https://youtu.be/afYhUQFa-AY)). Opublikowane BOM:

- **AIO:** TEUCER AF 240 (240 mm all-in-one) na krysztale
- **Zasilacz:** Mean Well **LOP-600-12** (lub **LOP-500-12** jako mniejsza opcja) — zobacz [Zasilacz](03-power-supply.md)
- **Wentylatory:** 2× Arctic **P12 Pro** + 1× Arctic **P8**
- **Zdalne zasilanie:** **płytka przekaźnikowa ESP32** do zdalnego włączania/wyłączania maszyny
- **Oprogramowanie:** **OpenLinkHub** / **Commander Duo** pod Linuksem do sterowania pompą AIO i wentylatorami

---

### Steam Cube — parametryczna pionowa obudowa, chłodzona cieczą (w opracowaniu)

**W pełni parametryczna** pionowa obudowa w formacie **Xbox Series X**, zaprojektowana z myślą **przede wszystkim o chłodzeniu cieczą** z wymienną stroną zimną: blok wodny, **Thermalright AXP90-X47 Full-Copper** lub pojedynczy **Arctic P12 Max** — wszystkie przykręcają się do tego samego mocowania. Wyrosła ze szkicu **„Xbox Serie X BC-250 Edition" Sol Diego** ([Printables 1748271](https://www.printables.com/model/1748271)) oraz dokładnego **modelu płytki torassk** ([Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)), a następnie została narysowana ponownie jako kod (build123d), tak że każdy wymiar jest zmienną, którą ponownie dopasowujesz, a nie stałą siatką.

**Gabaryt i stojące za nim uzasadnienie** (wyprowadzone ze zweryfikowanego rozmiaru płytki i celów termicznych w [Chłodzenie](04-cooling.md)):

- **~180 × 212 × 380 mm** pionowa wieża — wystarczająco wysoka, by ustawić **chłodnicę 240 mm pionowo** obok płytki (zestaw chłodnicy ~277 mm mieści się w 380 mm wysokości).
- **Przepływ kominowy** — wlot 120 mm nisko, wylot 120 mm wysoko, tak aby ciepło unosiło się prosto na zewnątrz.
- **Aktywny backplate jest obowiązkowy, nie opcjonalny** — strona GDDR6 / VRM jest [bez czujnika temperatury](04-cooling.md), więc projekt traktuje chłodzenie tylne jako część wymaganą.
- **Cele chłodzenia** (założenia projektowe, **nie** zmierzone wyniki): kryształ na wodzie < 60 °C w trybie ciągłym przy 40 CU; AXP90 < 75 °C @ 2000 MHz; baza P12 ~73–78 °C.

> ⚠️ **Status: koncepcja projektowa, nie zweryfikowany wydruk.** Obecny CAD to **parametryczny model przestrzenny** — części są poprawnie wymiarowane, zorientowane i rozmieszczone, a eksportuje on 8 STL + STEP — ale **nie został** wydrukowany, zmontowany ani przetestowany termicznie, a blok wodny umieszczono na podstawie obrysu płytki, a nie zmierzonej pozycji kryształu. Traktuj to jako **wyjściowy CAD do sforkowania**, a nie gotową obudowę; rzeczywista walidacja druku / dopasowania / termiki to otwarty kolejny krok. Powyższe cele to założenia, nie benchmarki.

---

### Obudowy z zasilaczem ATX (Victor L., V\ad, server-PSU v3/v4)

Dla pełnego zasilacza **ATX**: obudowa zbudowana wokół kompletnego zasilacza ATX ([źródło](https://t.me/c/2424231195/119293), w drodze na MakerWorld), wcześniejszy debiutancki prototyp w Blenderze ([źródło](https://t.me/c/2424231195/105570)) oraz opublikowana linia **HP/server-PSU** na Printables/MakerWorld z miejscem na HDD i hub USB.

- [Printables 1580750 — Case v3, HP server PSU + HDD + USB hub](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) · [MakerWorld 2481620 — Case v4, FlexATX & HP-server PSU](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) · [Printables 1550729 — ATX-PSU Bazzite Box](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box)

### Buildy z podwójnym 120 (chłodzenie pamięci + zasilacza)

Przeprojektowana płyta montażowa niosąca **dwa wentylatory 120 mm** — jeden skanałowany do backplate (pamięć), zgodnie z zamysłem projektanta płytki, drugi zasilający zasilacz. Z wentylatorami Lian Li P28 z przodu plus Thermalright C12015 autor utrzymuje **2200 MHz przy 80 °C w grach**, gdzie pojedynczy przedni wentylator nie wystarczał ([źródło](https://t.me/c/2424231195/120606)). Udostępniono do tego samodzielny plik **`Twin_120mm_Fan_Shroud.stl`** ([źródło](https://t.me/c/2424231195/121684)).

### The Lanboy — przenośna arkadowa / pudełko śniadaniowe

Przenośny build arkadowy w stylu pudełka śniadaniowego: napędza **16-calowy panel laptopowy eDP (1920×1200 @ 165 Hz)** przez **płytkę adaptera eDisplayPort** ([AliExpress](https://www.aliexpress.com/item/1005006351527252.html)), 2× głośniki 2″ na wzmacniaczu USB, wszystko zasilane z pojedynczego **breakoutu 12 V ATX**. [Printables 1746364](https://www.printables.com/model/1746364). Sztuczka z adapterem eDP nadaje się do ponownego użycia w **dowolnym** buildzie z panelem laptopowym.

### BC250-HUD (Bloodyly) — wewnętrzny ekran statusu

Aplikacja **ekranu statusu w Qt5/C++ na Raspberry Pi Zero 2** (używana w buildach takich jak NexGen3D Redux): **60 FPS przez tryb USB gadget**, odczytuje FPS/frametime z MangoHud, wykrywa napięcie wentylatora, by przyciemnić ekran podczas uśpienia, i **zawiera łatkę jądra vc4**, która w przeciwnym razie zawiesza Pi. Ekran: **8,8″ 1920×480 IPS** (Hannstar HSD088IPW1-A). [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD).

---

## Adaptery i mocowania (nie pełne obudowy)

Małe drukowane części, które rozwiązują jeden problem — zwykle zamocowanie chłodzenia lub wentylatora do płytki.

- **Osłony wentylatorów** (uszczelniają wentylator względem żeber): `Fan_Shroud_Single_120mm.stl`, `Fan_Shroud_Dual_120mm.stl`, `Fan_Shroud_Single_120mm_Restricted.stl`, `Fan_Shroud_Single_140mm.stl` ([źródło](https://t.me/c/2424231195/81673)), `Twin_120mm_Fan_Shroud.stl` ([źródło](https://t.me/c/2424231195/121684)). Skatalogowane także w [Chłodzenie](04-cooling.md).
- **Mocowania backplate / wentylatora pamięci:** `Backplate.stl` + `backplane-top-fixed.stl` ([źródło](https://t.me/c/2424231195/133049)); `bottom_fan_mount.stl`, `top_fan_mount.stl`, `Front-Mount.stl`, `Back-Mount.stl` ([źródło](https://t.me/c/2424231195/131189))
- **Adaptery chłodzenia AM4** (przykręcają standardowe chłodzenie CPU do kryształu): `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` ([źródło](https://t.me/c/2424231195/9949)). Zobacz także [Printables 1042228 — mocowanie BC250→AMD CPU-cooler](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount).
- **Uniwersalne mocowanie ITX** (majzok): drukuje się w dwóch częściach, które zatrzaskują się w ramie — wkręć w nie BC-250, a następnie wkręć ramę w **dowolną obudowę ze standardowymi otworami płyty głównej ITX** (testowane w DeepCool CH170 PLUS). Rozwiązuje problem „nie istnieje uniwersalne mocowanie ITX". Nie zarejestrowano kanonicznego linku Printables — szukaj na Printables/MakerWorld frazy **„BC-250 ITX Mount"**.
- **Adapter Thermalright AXP90-X53 / AXP120-X67** (niskoprofilowe chłodzenie na krysztale): drukowane mocowanie wymagające gwintów M3, z wariantami grubości zależnymi od nacisku chłodzenia/CPU — [Printables 1694793](https://www.printables.com/model/1694793). Także w [Chłodzenie](04-cooling.md).
- **Adapter wentylatora 120 mm:** `BC250_FanAdapter_120mm.step` ([źródło](https://t.me/c/2424231195/83135)), `cooler adapter v3.0 (1).stl` ([źródło](https://t.me/c/2424231195/111091))
- **Dokładne modele płytki** (projektuj własną obudowę na ich podstawie): [Printables 1341336 — dokładna płytka BC-250](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) ([źródło](https://t.me/c/2424231195/55496)), [Printables 1103626 — płytka AMD BC250](https://www.printables.com/model/1103626-amd-bc250-board)

---

## Tabela katalogowa

Pliki oznaczone *(czat)* są zmirrorowane w `assets/stl/`; wszystko inne pobiera się z podlinkowanej strony Printables / MakerWorld / GitHub.

| Obudowa / część | Typ | Pliki STL / źródłowe | Wentylatory | Pobierz |
|---|---|---|---|---|
| **onemorecap cooling sleeve** | minimalna tuleja | `BC-250-FanSleeves.3mf` *(czat)* | 1× 120 | [GitHub onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) |
| **onemorecap Shell Case** ⭐ | otwarty shell | `Shell_Front.stl`, `Shell_Back_FLEX_ATX.stl`, `Front_Panel.stl`, `USB_Bracket.stl` *(czat)* | 1–2× 120 / 1× 140 | [Printables 1228207](https://www.printables.com/model/1228207-asrock-amd-bc-250-shell-case) · [GitHub](https://github.com/onemorecap/bc-250-shell-case) · [MakerWorld 1206445](https://makerworld.com/en/models/1206445-asrock-amd-bc-250-shell-case) |
| **Akrylowa otwarta rama** (Владислав) | otwarta rama | drukowane uchwyty *(czat #114651)* | 1× 120 | [wątek na Reddicie](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/) |
| **„Просто лучший корпус"** (Jack Fisher × B1zon) | konsola | `BC250 korpus исправленный.rar` *(czat)* | 120 + rozgałęziacz PWM | [czat #79989](https://t.me/c/2424231195/79989) |
| **Minimalna obudowa na zasilacz Flex** | mała skrzynka | `minimal-case-...-model_files.zip` *(czat)* | 1× 120 | [Printables 1423572](https://www.printables.com/model/1423572-minimal-case-for-bc250-and-flex-psu) |
| **forgenam case** | konsola | `forgenam-case-bc250-model_files.zip` *(czat)* | 1× 120 | [Printables 1375929](https://www.printables.com/model/1375929-forgenam-case-bc250) |
| **Minimalist 240** | konsola + uchwyt | `Minimalist 240 Front/Back/Handle.stl` *(czat)* | 120 | [czat #117404](https://t.me/c/2424231195/117404) |
| **M360** | konsola | `M360 Front.stl`, `M360 Back.stl` *(czat)* | 120 | [czat #126566](https://t.me/c/2424231195/126566) |
| **NexGen3D DIY Steam Machine** ⭐ | konsola | pliki Printables | 1× 120 | [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) |
| **NexGen3D Pro (liquid)** | konsola + AIO | pliki Printables | 120 AIO | [Printables 1614131](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) |
| **NexGen3D Redux (+ekran)** | konsola + ekran 1080×480 | pliki Printables | 1× 120 | [Printables 1649679](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) |
| **NexGen3D AIO mount** | adapter | pliki Printables | 120 AIO | [Printables 1554003](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250) |
| **Case v3 — HP server PSU** | konsola + HDD/USB | pliki Printables | 120 | [Printables 1580750](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) |
| **Case v4 — FlexATX / HP PSU** | konsola | pliki MakerWorld | 120 | [MakerWorld 2481620](https://makerworld.com/en/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu#profileId-2725989) |
| **ATX-PSU Bazzite Box** | skrzynka full-ATX | pliki Printables | 120 | [Printables 1550729](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box) |
| **ivanov-innokentii case** | konsola | źródła GitHub | 120 | [GitHub ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) |
| **rLapchynski enclosure** | obudowa | źródła GitHub | 120 | [GitHub rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure) |
| **BC-250 Scooper** | osłona/zgarniacz | pliki Printables | 120 | [Printables 1282906](https://www.printables.com/model/1282906-bc-250-scooper) |
| **Pitman case** | konsola | pliki Printables | 120 | [Printables 1570248](https://www.printables.com/model/1570248-amd-bc-250-pitman-case) |
| **Obudowa w stylu industrialnym FlexATX** | konsola | `amd_bc_250_industrial_style_case...zip` *(czat)* | 120 (bez fabrycznego chłodzenia) | [czat #144265](https://t.me/c/2424231195/144265) |
| **The Lanboy** | przenośna arkadowa + ekran 16″ eDP | pliki Printables | breakout 12 V ATX | [Printables 1746364](https://www.printables.com/model/1746364) |
| **BC250 Vented Edition** (MaelremremDotXYZ) | konsola FlexATX, otwarte żebra | pliki MakerWorld | 120 | [MakerWorld 2899020](https://makerworld.com/en/models/2899020) |
| **Stellar 250** (isaacalvex) | konsola + przewodnik budowy (WiFi6, ESP32) | przewodnik GitHub | 120 | [GitHub isaacalvex/...Project-Guide](https://github.com/isaacalvex/AMD-BC-250-Project-Guide) |
| **Simple Case for the ASRock AMD BC-250** | konsola | pliki MakerWorld | 120 | [MakerWorld 2870270](https://makerworld.com/en/models/2870270) |
| **BC250-HUD** (Bloodyly) | wewnętrzny ekran statusu Pi Zero 2 | źródła GitHub | — | [GitHub Bloodyly/BC250-HUD](https://github.com/Bloodyly/BC250-HUD) |
| **Uniwersalne mocowanie ITX** (majzok) | adapter (dowolna obudowa ITX) | szukaj Printables/MakerWorld | — | „BC-250 ITX Mount" |
| **Mocowanie Thermalright AXP90/AXP120** | adapter niskoprofilowego chłodzenia | pliki Printables | niskoprofilowa wieża | [Printables 1694793](https://www.printables.com/model/1694793) |
| **Płyta montażowa Twin-120** | płyta adaptera | `Twin_120mm_Fan_Shroud.stl` *(czat)* | 2× 120 | [czat #121684](https://t.me/c/2424231195/121684) |
| **Osłony wentylatorów (120/140)** | osłona | `Fan_Shroud_Single_120mm.stl`, `_Dual_120mm`, `_Single_140mm`, `_120mm_Restricted` *(czat)* | 120 / 140 | [Printables 1339540](https://www.printables.com/model/1339540-yet-another-bc-250-fan-shroud) · zobacz [Chłodzenie](04-cooling.md) |
| **Adapter chłodzenia AM4** | mocowanie | `bc250 am4 adapter polished.stl`, `bc250 cooler mount.stl` *(czat)* | wieża/AIO | [Printables 1042228](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount) |
| **Dokładny model płytki** | referencyjny CAD | `bc-250-body.step` *(czat)* | — | [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board) |

⭐ = najwyżej oceniane reakcjami / najczęściej udostępniane w społeczności.

### Więcej publicznych projektów (z katalogu elektricM)

Nazwane, dostępne do pobrania projekty z [katalogu 143 projektów elektricM](https://elektricm.github.io/amd-bc250-docs/community/cases/), których nie wymieniono powyżej — pogrupowane według zasilacza, wokół którego są zbudowane. Przeglądaj pełny katalog w poszukiwaniu buildów dostępnych tylko na Discordzie / WIP oraz miniatur.

**MeanWell LOP (zasilacz wewnętrzny):**

| Obudowa / część | Cechy | Pobierz |
|---|---|---|
| **Steamboat Case** (yannichaboyer) | konsola LOP-300 | [MakerWorld 2431616](https://makerworld.com/en/models/2431616) |
| **Ultra-Thin Custom Case** (MrRoze) | smukła LOP-300 | [Printables 1626501](https://www.printables.com/model/1626501) |
| **Internal PSU 2×140 mm** (Kacikor) | LOP-400, podwójny 140 | [Printables 1599644](https://www.printables.com/model/1599644) · [MakerWorld 2400574](https://makerworld.com/en/models/2400574) |
| **Push-Pull Internal 12V PSU** (penzoiders) | push-pull | [MakerWorld 2505974](https://makerworld.com/en/models/2505974) |
| **Shell Case + wentylator SSD 40 mm** (Munkee915) | remiks Shell, chłodzenie SSD | [Printables 1568074](https://www.printables.com/model/1568074) |
| **Noctua Push-Pull Mod** (Janjd) | remiks Shell | [MakerWorld 2354123](https://makerworld.com/en/models/2354123) |

**MeanWell LRS/UHP (druga popularna serwerowa kostka):**

| Obudowa / część | Cechy | Pobierz |
|---|---|---|
| **LRS-350-12 PSU Case** (TARGZ) | skrzynka LRS-350 | [Printables 1543979](https://www.printables.com/model/1543979) |
| **BC250 slim case** (C4kew4lk) | UHP-350-12, slim | [Printables 1504664](https://www.printables.com/model/1504664) |

**FlexATX — rodzina Arthrimus „Console Style"** (cała linia remiksów; smukła konsola to społecznościowy klasyk):

| Obudowa / część | Cechy | Pobierz |
|---|---|---|
| **Console Style Case v1** (Arthrimus) | oryginał | [Thingiverse 7165679](https://www.thingiverse.com/thing:7165679) · [MakerWorld 2097988](https://makerworld.com/ko/models/2097988-bc250) |
| **Slim Console Style Case** (Arthrimus) | wariant slim | [Thingiverse 7172528](https://www.thingiverse.com/thing:7172528) |
| **Slim Console — mod z podwójnym wentylatorem** (TKXXTH) | podwójny wentylator | [Thingiverse 7214884](https://www.thingiverse.com/thing:7214884) |
| **Slim Console — On/Off + Apevia** | przełącznik zasilania | [Thingiverse 7274042](https://www.thingiverse.com/thing:7274042) |

**FlexATX — inne:**

| Obudowa / część | Cechy | Pobierz |
|---|---|---|
| **Minimal Case (Toolless)** (chriszf) | bez śrub | [Printables 1423572](https://www.printables.com/model/1423572) |
| **Minimalist BC-250 Case** (SebastienGau/Gadget) | minimalistyczna | [Printables 1581724](https://www.printables.com/model/1581724) |
| **ADT UT3G eGPU-Inspired** (R0mn) | wygląd eGPU | [Printables 1539301](https://www.printables.com/model/1539301) |
| **„Steam Machine" by MrLarva** | konsola | [Printables 1618501](https://www.printables.com/model/1618501) · [MakerWorld 2453965](https://makerworld.com/en/models/2453965) · [Thingiverse 7278235](https://www.thingiverse.com/thing:7278235) |
| **Steam Machine** (Pocket Adventures) | konsola | [MakerWorld 2350219](https://makerworld.com/en/models/2350219) |
| **Steam Machine Slim Console** (MTSquar3D) | slim + zestaw wentylatora OC vRAM | [MakerWorld 2232434](https://makerworld.com/en/models/2232434) · [Thingiverse 7271946](https://www.thingiverse.com/thing:7271946) |
| **ASRock Console Case** (songdawgdesigns) | konsola | [Printables 1617023](https://www.printables.com/model/1617023) · [Cults3D](https://cults3d.com/en/3d-model/gadget/asrock-amd-bc-250-console-case-steamos-bazzite-diy-steam-machine-style-build) |
| **AMD BC250 Case** (vitamins) | konsola | [MakerWorld 2219947](https://makerworld.com/en/models/2219947) |
| **E-waste Steam Machine** (Pesen333) | build z odzysku | [Thingiverse 7245584](https://www.thingiverse.com/thing:7245584) |

**Pełne ATX:**

| Obudowa / część | Cechy | Pobierz |
|---|---|---|
| **Case for Standard ATX** (CatSiewDai) | skrzynka ATX | [Printables 1553599](https://www.printables.com/model/1553599) |
| **ATX + Fan Duct** (ZMASLO) | z kanałem | [Printables 1616167](https://www.printables.com/model/1616167) |
| **Dual Fan ATX Case** (Mateo Fdez) | podwójny wentylator | [Printables 1579658](https://www.printables.com/model/1579658) |
| **Simple Wooden Case** (suvalle55) | drewno + ATX | [Printables 1595794](https://www.printables.com/model/1595794) |
| **Open Frame + IKEA hack** (GreatApo) | otwarta rama | [Thingiverse 7314188](https://www.thingiverse.com/thing:7314188) |
| **Case for ATX PSU** (matmiak) | skrzynka ATX | [Thingiverse 7303096](https://www.thingiverse.com/thing:7303096) |

**TFX / VESA / gotowe z półki:**

| Obudowa / część | Cechy | Pobierz |
|---|---|---|
| **Case Remix for TFX** (PlayNation) | zasilacz TFX-400 | [MakerWorld 2387157](https://makerworld.com/en/models/2387157) |
| **VESA 100/75 Basket** (Oleksii) | mocowanie za monitorem | [MakerWorld 1844470](https://makerworld.com/en/models/1844470) |
| **3.9L MKII FlexATX + wentylator PS5** (FitFormSolutions) | kup gotowy zestaw | [Etsy](https://www.etsy.com/listing/4405362103/) · [eBay](https://www.ebay.com/itm/127460591552) |
| **Shiny Snake S400** (10,8 L siatkowy ITX) | sprawdzony, gotowy host (mocowanie BC-250→AM4 + H60 AIO w zatoce zasilacza + niestandardowa zaślepka I/O ATX) | [AliExpress](https://a.aliexpress.com/_EyQdoBU) |
| **Minimalistyczna obudowa na zasilacz SFX** (Methsman) | pełny zasilacz SFX, magnetyczne panele, hub USB, AXP120 + Noctua 120 — *pliki WIP / jeszcze nie wydane* | — |
| **Linia Cults3D ATX/server** (KABANCHYK, lumstudio, kapa3D) | płatne STL | [Cults3D — bc-250](https://cults3d.com/en/3d-model/gadget/bc-250-atx-case) |

---

## Brak drukarki? Opcje, z których korzystają ludzie

- **Kup wydruk.** Sprzedawcy istnieją na [Etsy](https://www.etsy.com/listing/1904632447/), eBay i OLX; ludzie oferowali też druk/sprzedaż obudów na czacie ([źródło](https://t.me/c/2424231195/55507)).
- **Druk na żądanie:** prześlij plik STL do usługi. Twórcy na czacie prowadzą farmy druku (jeden pokazuje ścianę drukarek Flsun/Creality/Bambu, [źródło](https://t.me/c/2424231195/73481)).
- **Brak obudowy / przeznaczenie do innego celu.** Wielu uruchamia płytkę na otwartym stole podczas testów. Inni wypatroszają istniejący sprzęt: stary komputer all-in-one z wszczepioną płytką i dmuchawą ([źródło](https://t.me/c/2424231195/30914)), skrzynkę z kanału wentylacyjnego ([źródło](https://t.me/c/2424231195/64265)) lub aluminiowe obudowy wzmacniaczy (wymaga piłowania/wiercenia, [źródło](https://t.me/c/2424231195/108907)). Jeden z członków ukrył nawet płytkę wewnątrz starego magnetowidu VHS dla żartu ([źródło](https://t.me/c/2424231195/84106)). **Obudowa Xbox One** (JoeyDepDollas): wypatrosz zepsuty Xbox One i zmieść w nim pełny build BC-250 — utrzymuje CPU i GPU poniżej **60 °C** pod obciążeniem; zepsute konsole-dawcy kosztują **~15 $ z wysyłką** na eBay i dają części do ponownego użycia.
- **Sklejka cięta laserowo** (ContributionRich3242): nie drukowana w 3D — sklejka wyginana nacięciami (kerf) wokół narożników z dużą przestrzenią z tyłu na dodatkowe chłodzenie, osiągająca **75 °C przy 40 CU** (1800 MHz, CPU 3,9 GHz) i cicha jak szept. (Pliki laserowe nie zostały wydane.) Jej **technika chłodzenia backplate** nadaje się do ponownego użycia w dowolnej obudowie: masa termiczna chip→backplate, pasta backplate→chłodzenie tylne i zamocowanie chłodzenia tylnego ciasnymi zawleczkami typu R w szczelinie VRM + taśma Kapton (~20 °C chłodniej przy 40 CU).

> Goła, dobrze chłodzona płytka przewyższa szczelne, ładne pudełko ze słabym przepływem powietrza. Najpierw zrób dobrze [Chłodzenie](04-cooling.md); obudowa to drugi krok.

---

## Źródła

- Wyselekcjonowana prezentacja **#BC250body** (jeden dobry build dziennie) — przypięty pomysł [źródło](https://t.me/c/2424231195/79685)
- Minimalna tuleja, dwa warianty — [źródło](https://t.me/c/2424231195/10743) · modele na [onemorecap/bc-250-sleeve-adapter](https://github.com/onemorecap/bc-250-sleeve-adapter) [źródło](https://t.me/c/2424231195/18260)
- Shell Case (❤33) — [źródło](https://t.me/c/2424231195/22771) · darmowe na Printables/MakerWorld [źródło](https://t.me/c/2424231195/24505) · paczka STL [źródło](https://t.me/c/2424231195/81680)
- „Просто лучший корпус" + BOM — [źródło](https://t.me/c/2424231195/79990) · pliki [źródło](https://t.me/c/2424231195/79989)
- Akrylowa otwarta rama — [źródło](https://t.me/c/2424231195/114651) · [Reddit](https://www.reddit.com/r/BC250Gaming/comments/1rryw5f/bc250_acrylic_case_designed/)
- Płyta montażowa Twin-120, 2200 MHz @ 80 °C — [źródło](https://t.me/c/2424231195/120606) · osłona [źródło](https://t.me/c/2424231195/121684)
- Projekty w stylu konsoli (zdjęcia) — Гослинг/Bazzite [źródło](https://t.me/c/2424231195/66616) · Jhonatan panel-labirynt [źródło](https://t.me/c/2424231195/121274) · Joglik siatka kratowa [źródło](https://t.me/c/2424231195/126525) · a m owalne okno [źródło](https://t.me/c/2424231195/52955) · Spyrydonov v15 [źródło](https://t.me/c/2424231195/135995)
- Rodzina NexGen3D Steam Machine — [Printables 1499974](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) · [Redux + ekran Pi (Reddit)](https://www.reddit.com/r/Bazzite/comments/1skpxe9/bc250_redux_completed_with_internal_1080x480_pi/)
- Referencyjny model płytki — [źródło](https://t.me/c/2424231195/55496) · [Printables 1341336](https://www.printables.com/model/1341336-accurate-3d-model-of-the-amd-bc-250-board)
- Repozytoria obudów na GitHub — [onemorecap/bc-250-shell-case](https://github.com/onemorecap/bc-250-shell-case) · [ivanov-innokentii/BC250-case](https://github.com/ivanov-innokentii/BC250-case) · [rLapchynski/bc250-enclosure](https://github.com/rLapchynski/bc250-enclosure)
- **Pełny katalog obudów elektricM (~143 projekty, przeszukiwalny/filtrowalny)** — [elektricm.github.io/amd-bc250-docs/community/cases](https://elektricm.github.io/amd-bc250-docs/community/cases/)
- Simple Case (MakerWorld 2870270) + ukraiński poradnik budowy — [MakerWorld 2870270](https://makerworld.com/en/models/2870270) · [Old Lamer (YouTube)](https://youtu.be/p5Zd86vFe8w)
- Lifehack z otworem dostępowym do reset CMOS — [4pda — nix0root](https://4pda.to/forum/index.php?showtopic=1104980)
- BOM buildu „Steam Machine Pro" chłodzonego cieczą (TEUCER AF 240, Mean Well LOP-600-12, Arctic P12 Pro/P8, przekaźnik ESP32, OpenLinkHub/Commander Duo) — [Old Lamer (YouTube)](https://youtu.be/afYhUQFa-AY)

> Pliki STL osłon wentylatorów są współdzielone z [Chłodzenie](04-cooling.md). Wszystkie hostowane na czacie pliki STL/STEP/3MF są zmirrorowane w `assets/stl/`.
