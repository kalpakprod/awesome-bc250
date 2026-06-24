> 🌐 Tłumaczenie społecznościowe. Wersja angielska jest źródłem prawdy i może być nowsza. Znalazłeś błąd? Zgłoś to w [zgłoszeniu (issue)](https://github.com/lildebil0/awesome-bc250/issues). ([oryginał angielski](../en/13-macos.md))

# macOS / Hackintosh

> **W skrócie** — **Nie rób tego.** Prawdopodobnie da się uruchomić macOS na CPU BC-250 (to układ Zen 2 od AMD, i generyczne hackintoszowe sztuczki AMD-OSX się stosują), ale **GPU nie będzie akcelerować** i nie ma realistycznej drogi, żeby to zmienić. macOS wspiera GPU po zakodowanym na sztywno ID urządzenia; GPU BC-250 (Cyan Skillfish / Oberon, okrojona część z PS5) **nie ma natywnie wspieranego bliźniaka na pulpicie, pod który można by się podszyć**, a stos Apple *nigdy* nie został zmuszony do obsługi zintegrowanej grafiki żadnego APU od AMD. Dostałbyś więc wolnego, renderowanego programowo Maca bez Metala. Na rok 2026 nikt w społeczności nie zgłosił działającego akcelerowanego wyniku. Zamiast tego użyj Linuksa — zobacz [06-linux.md](06-linux.md).

To **niszowa ciekawostka**, a nie realne zastosowanie. Uczciwa odpowiedź to cała ta sekcja.

---

## Dlaczego akceleracja GPU jest ścianą

Dwa posty techniczne z największą liczbą reakcji w tym temacie dochodzą do tego samego wniosku i jasno tłumaczą mechanizm.

macOS nie ma otwartego modelu sterowników jak Linux. Dostarcza zamknięte sterowniki, które wiążą się z konkretnymi GPU **po ID urządzenia**, a jedyne miejsce, gdzie można ingerować, to bootloader **OpenCore** *zanim* system się załaduje — OpenCore podaje macOS-owi wstępnie przygotowane dane, nie potrafi załatać zamkniętego systemu od środka ([src](https://t.me/c/2424231195/103173)).

OpenCore *potrafi* spoofować ID urządzenia GPU, ale tylko **w obrębie jednej rodziny architektonicznej** — np. przedstawić niewspieraną RX 6950 XT jako wspieraną RX 6900 XT, bo to *ten sam* krzem. Ta sztuczka zajęła deweloperom OpenCore **ponad rok** i zadziałała tylko dlatego, że te karty Navi są architektonicznie identyczne z tymi, które Apple już wspierało ([src](https://t.me/c/2424231195/53321)).

BC-250 łamie to na dwa sposoby:

1. **Brak bliźniaka do spoofowania.** Jej GPU to okrojona część wywodząca się z PS5 (`gfx1013`). **Nie ma pulpitowej karty AMD o tej samej architekturze, którą macOS wspiera natywnie**, więc nie ma pod co się podszyć. Żeby BC-250 zadziałała, stos Apple musiałby nauczyć się tego ID urządzenia od zera — co dzieje się tylko, jeśli deweloperzy OpenCore wezmą ten układ na warsztat, a nie ma ku temu komercyjnego powodu ([src](https://t.me/c/2424231195/53321)).
2. **To APU, a APU nigdy nie zadziałały.** Nawet zintegrowana grafika Ryzen o architekturze pulpitowej (iGPU Vega / Navi) **nigdy** nie została podniesiona w macOS, mimo dzielenia mikroarchitektury ze wspieranymi kartami dyskretnymi. Autor „nie widział ani jednego działającego przypadku" iGPU Ryzena w macOS ([src](https://t.me/c/2424231195/103173)). BC-250 jest w tym samym koszyku APU.

Bezceremonialne podsumowanie tego samego współautora: *jeśli nawet sterowniki dla tego układu pod Windows nie są dopięte, o macOS nie warto marzyć* ([src](https://t.me/c/2424231195/53321)). (Sytuację ze sterownikami pod Windows opisuje [07-windows.md](07-windows.md).)

---

## Co ludzie faktycznie próbowali

- Ktoś przygotował i udostępnił na początku pakiet **macOS Monterey recovery + OpenCore** (`Monterey recovery + OpenCore.zip`, plus wcześniejszy `Архив.zip`), więc przynajmniej jedna osoba zabrała się za jego instalację ([src](https://t.me/c/2424231195/53590)). Nigdy nie zgłoszono żadnego sukcesu z akcelerowanym GPU.
- Narzędzia, na które ludzie wskazują, to standardowy zestaw hackintoszowy AMD: fałszowanie ID urządzenia przez [RehabMan/OS-X-Fake-PCI-ID](https://github.com/RehabMan/OS-X-Fake-PCI-ID), [poradnik zakupowy GPU AMD od Dortanii](https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series) co do tego, co jest faktycznie wspierane, oraz — najbliższe wsparciu grafiki APU — **[ChefKissInc/NootedRed](https://github.com/ChefKissInc/NootedRed)**, kext dla iGPU APU od AMD. NootedRed celuje w APU klasy Vega/Renoir i **nie** obejmuje krzemu BC-250, więc tej płyty nie ratuje.
- Późniejszy link do forum o [uruchamianiu macOS na AMD Ryzen przez VMware/OpenCore](https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/) ([src](https://t.me/c/2424231195/107779)) to **generyczny hackintosh AMD**, a nie coś specyficznego dla BC-250 — a VM i tak oznacza brak passthrough GPU / Metala.

> ⚠ **Nie myl żartów z wynikami.** W temacie jest lekka przekomarzanka „świetnie, potężny hackintosh tu rządzi" ([src](https://t.me/c/2424231195/85166)) i reakcje pochwalne, które *nie* są raportami z działającej kompilacji macOS. Nic w dowodach nie pokazuje akcelerowanego macOS na BC-250.

---

## Więc czy warto?

**Nie, do żadnego praktycznego celu.** Najlepszy realistyczny wynik to macOS wyłącznie na CPU, który renderuje UI programowo — bez Metala, bez obliczeń na GPU, bezużyteczny do zadań grania/AI, dla których tę płytę się kupuje. Konsensus społeczności, datowany i niezmienny od **2025-06** do **2026-03**, jest taki, że wsparcie GPU jest praktycznie niemożliwe bez tego, by deweloperzy OpenCore konkretnie zaadoptowali ten układ, co się nie wydarzyło i nie jest oczekiwane.

Jeśli chcesz, żeby ta płyta *coś* robiła, zainstaluj Linuksa ([06-linux.md](06-linux.md)), gdzie GPU jest rzeczywiście wspierane przez Mesa/RADV. Windows to odległa druga opcja ([07-windows.md](07-windows.md)). macOS jest ostatni i w praktyce to ślepy zaułek.

---

## Źródła

- GPU-po-ID-urządzenia + roczna historia spoofowania Navi — https://t.me/c/2424231195/53321
- Ograniczenia OpenCore i „żaden iGPU Ryzena nigdy nie zadziałał" — https://t.me/c/2424231195/103173
- Pakiet Monterey + OpenCore, który ktoś przygotował — https://t.me/c/2424231195/53590
- Generyczny wątek na forum o hackintoshu AMD-Ryzen (nie specyficzny dla BC-250) — https://t.me/c/2424231195/107779 · [wątek amd-osx.com](https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/)
- Wymieniane narzędzia — [RehabMan/OS-X-Fake-PCI-ID](https://github.com/RehabMan/OS-X-Fake-PCI-ID) · [ChefKissInc/NootedRed](https://github.com/ChefKissInc/NootedRed) (kext iGPU APU od AMD; nie obejmuje tego krzemu) · [poradnik GPU AMD od Dortanii](https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series)
- Tożsamość układu (Cyan Skillfish / Oberon, `gfx1013`) — zobacz [01-what-is-bc250.md](01-what-is-bc250.md)

> **W skrócie:** macOS na BC-250 to przypis z kategorii tech-ciekawostek, a nie cel kompilacji. Idź do [06-linux.md](06-linux.md).
