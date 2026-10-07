# macOS / Hackintosh

**Стан на 7 жовтня 2026 року:** є BC250-специфічний проєкт **MetalCyan** із заявленим прискоренням Metal. Попередній висновок посібника «GPU не запрацює, шляху немає» застарів. Для ігрової консолі основний шлях — [Linux](06-linux.md); macOS — окрема експериментальна збірка з конкретною версією ОС.

## Проєкти та їхнє призначення

- [amethyst8118/MetalCyan](https://github.com/amethyst8118/MetalCyan): плагін Lilu, що адаптує драйвери Apple AMDRadeonX6000 до Cyan Skillfish. Це не проста підміна PCI ID; проєкт почався як відгалуження NootedRed.
- [amethyst8118/BC-250-Hackintosh-OpenCore](https://github.com/amethyst8118/BC-250-Hackintosh-OpenCore): окремий проєкт повної EFI-конфігурації.
- [Lilu](https://github.com/acidanthera/Lilu): необхідна залежність, завантажується перед MetalCyan.

## Вимоги

За README MetalCyan, перевіреним 7 жовтня 2026 року:

| Параметр | Вимога |
|---|---|
| macOS | **Tahoe 26.7.1**; інші версії не заявлені підтриманими |
| SMBIOS | **MacPro7,1** |
| OpenCore | **1.0.8** в описаній конфігурації |
| UMA framebuffer | **4 ГБ** у BIOS; з 512 МБ автор повідомляє зависання через брак памʼяті GPU |
| Lilu | **1.7 або новіша**, перед MetalCyan |
| Інші GPU kext | Не поєднувати з WhateverGreen, NootedRed чи NootRX |

Це вимоги конкретного драйвера, не універсальна порада використовувати такий самий розподіл памʼяті в Linux.

## Встановлення

1. Збережи робочу EFI повністю та початкові параметри BIOS, особливо UMA. Залиш окремий завантажувальний носій для відновлення.
2. Підготуй OpenCore/AMD-конфігурацію для зазначеної macOS за EFI-проєктом вище. MetalCyan не замінює завантажувач чи набір CPU-патчів AMD.
3. Встанови в BIOS UMA **4 ГБ**; інші значення не входять до описаної конфігурації автора.
4. Завантаж `MetalCyan-1.0.1-RELEASE.zip` із [релізу MetalCyan](https://github.com/amethyst8118/MetalCyan/releases/tag/v1.0.1), поклади `MetalCyan.kext` у `EFI/OC/Kexts`.
5. Додай його в `Kernel > Add` після Lilu та вимкни інші GPU kext. Для цієї EFI розробник також зазначає `npci=0x3000` у boot-args.
6. Завантаж macOS без експериментальних частот і розблокування; спершу перевір робочий стіл та Metal-застосунок, потім змінюй по одному параметру.

## Перевірка та обмеження

Автор заявляє Metal 3, прискорення WindowServer/Safari/Firefox, 4K60, доступні 4 ГБ VRAM та телеметрію GPU. Це опис конфігурації проєкту, а не наш власний тест фізичної плати.

- **VCN decode/encode недоступний у цьому драйвері**; декодування програмне.
- **DP/HDMI-звук не налаштований.** Safari/TV можуть відмовлятися від відео без пристрою виводу; потрібен окремий аудіовихід чи віртуальний пристрій.
- **Відновлення завислого GPU відсутнє**; потрібне перезавантаження.
- **Вимкнення/перезавантаження:** README описує паніку WindowServer під час завершення, окремо від наступного запуску.
- **Сон не протестований.**

Зміна macOS, SMBIOS чи kext потребує нової перевірки сумісності. Прапорець обходу перевірки версії не доводить підтримку.

## Відкат

`-MCOff` вимикає MetalCyan та повертає firmware framebuffer без прискорення. Для повного відкату поверни збережену EFI та параметри BIOS. Якщо робочий стіл недоступний, завантаж резервний носій. Видалення kext не скасовує змін BIOS чи SMU.

## Історія досліджень

Ранні обговорення Monterey/OpenCore та підміни device ID не давали підтвердженого шляху BC250 Metal. Це історичні джерела, не поточна заборона. NootedRed для інших AMD APU також спростовує попереднє узагальнення «AMD APU ніколи не працювали в macOS»; його підтримка сама по собі не означає підтримки BC250.

[Каталог драйверів та ОС](../../catalog/uk/README.md#drivers) · [Практичні програми та інтеграції](17-projects-and-tools.md).

## Джерела

- https://t.me/c/2424231195/103173
- https://t.me/c/2424231195/53321
- https://t.me/c/2424231195/53590
- https://github.com/RehabMan/OS-X-Fake-PCI-ID
- https://dortania.github.io/GPU-Buyers-Guide/modern-gpus/amd-gpu.html#navi-10-series
- https://github.com/ChefKissInc/NootedRed
- https://forum.amd-osx.com/threads/mac-os-install-on-amd-ryzen-intel-vmware-opencore-improved-performance-works-with-tahoe-sequoia-sonoma-etc.4696/
- https://t.me/c/2424231195/107779
- https://t.me/c/2424231195/85166

- [MetalCyan README](https://github.com/amethyst8118/MetalCyan#readme).
