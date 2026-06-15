# Драйверы и установка Linux

> **Коротко** — Большинство гоняет BC-250 на Linux, и работает отлично — *после починки GPU*. Из коробки `amdgpu` не распознаёт чип, и ты получаешь рендер на CPU и однозначный FPS. Реальную скорость дают две вещи: **свежее ядро + свежая Mesa (25.1+)** и **фикс `amdgpu`** — симлинк прошивки, чтобы драйвер завёлся (`navi10_gpu_info.bin` → `cyan_skillfish_gpu_info.bin`), плюс параметры ядра (`amdgpu.sg_display=0`, `mitigations=off`, на новых ядрах `amdgpu.bc250_cc_write_mode=3`). Самый простой путь новичку: накатить **[Bazzite](https://bazzite.gg/)** и сделать rebase на специальный образ **`bazzite-bc250`** — фиксы уже внутри. Хочешь разобраться в железе — **Fedora** или **CachyOS/EndeavourOS (Arch)** с одноразовым скриптом настройки.

Это раздел, который превращает «плату в коробке» в рабочий десктоп. Сначала сделай [охлаждение](04-cooling.md) и [питание](03-power-supply.md) — потом это.

> **Никогда не пользовался Linux? Памятка на 60 секунд.**
> - **Открыть терминал:** найди в меню приложение *Terminal* / *Konsole* (KDE) / *Console* или нажми `Ctrl-Alt-T`.
> - **`sudo`** перед командой запускает её с правами администратора. Спросит пароль — и **пока ты его печатаешь, на экране ничего не появляется** (ни точек, ни звёздочек). Это норма: набери и нажми Enter.
> - **`nano /etc/...`** открывает простой текстовый редактор прямо в терминале. Сохранить и выйти: **Ctrl-O**, потом **Enter**, потом **Ctrl-X**.
> - **Вставка** в терминал обычно по **Ctrl-Shift-V** (не Ctrl-V).
> - Многие шаги срабатывают только после **перезагрузки** (`systemctl reboot`). Если шаг говорит «перезагрузись» — реально перезагрузись, прежде чем судить, заработало ли.

---

## Главное, что нужно понять

GPU у BC-250 — это **Cyan Skillfish / Oberon** (RDNA2-чип, производный от PlayStation 5). У mainline `amdgpu` исторически **не было блоба прошивки с таким именем**, поэтому на стоковой установке ядро не может инициализировать GPU, и десктоп откатывается на программный рендер (LLVMpipe) — всё тормозит, а `vulkaninfo` не показывает реального устройства. Один пользователь несколько дней воевал с «битыми драйверами», пока не понял, что система просто грузила ядро, не умеющее загрузить прошивку GPU ([src](https://t.me/c/2424231195/98466)).

Поэтому любая рабочая конфигурация в той или иной форме делает одно и то же:

1. **Ставит достаточно свежие ядро + Mesa.** Upstream-поддержка BC-250 в Mesa появилась в **25.1** (с тех пор патчи не нужны) — ([Mesa MR !33116](https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33116), [src](https://t.me/c/2424231195/20891)). Датчики температуры приехали в **ядро 6.15** ([src](https://t.me/c/2424231195/23542)).
2. **Даёт `amdgpu` нужную прошивку** — симлинк `cyan_skillfish_gpu_info.bin` (Arch-установки) или патченый пакет mesa/ядра (Fedora COPR), который делает это сам.
3. **Передаёт правильные параметры ядра** и пересобирает initramfs + загрузчик.

Всё ниже — это лишь *как именно* каждый дистрибутив делает эти три вещи.

---

## Какой дистрибутив? (фавориты опроса комьюнити)

Чат снова и снова возвращается к четырём. Единственно «правильного» ответа нет — это размен между *нулевыми усилиями* и *пониманием своего железа*.

| Дистрибутив | База | Усилия | Фикс GPU | Кому |
|--------|------|--------|---------|------|
| **Bazzite** (образ `bazzite-bc250`) | Fedora atomic | **Минимум** — фиксы вшиты | Уже в образе | Новичкам, «просто играть» |
| **Fedora** (Workstation / KDE) | Fedora | Низкие | COPR `mixaill/amd-bc-250` + скрипт | Учить Linux, держаться ближе к upstream |
| **CachyOS** | Arch | Средние | `mesa-tkg-git` / AUR + ручной симлинк | Тюнерам производительности |
| **EndeavourOS** | Arch | Средние | chaotic-aur `mesa-tkg-git` + ручной симлинк | Arch без боли при установке |

Заметки из чата:
- **Bazzite — самый простой**, и у него есть **отдельный образ под BC-250** с уже применёнными фиксом прошивки, параметрами ядра, oberon-governor и патчем 40-CU/частот. Ищи на artifacthub: [`bazzite-bc250`](https://artifacthub.io/packages/container/bazzite-bc250/bazzite_bc250). Несколько человек перешли на него именно чтобы перестать патчить руками ([src](https://t.me/c/2424231195/121246)).
- **Не хватай вслепую «геймерские» дистрибутивы.** В одном развёрнутом разборе аргументируется, что чистая **Fedora (Workstation/KDE)** или ванильный **Arch с LTS-ядром + свежей Mesa** — это безболезненная золотая середина, а тяжёлые тюненые форки порой *ломают* Steam/FSR/vsync, а не помогают ([src](https://t.me/c/2424231195/102834)). Считай это советом «на конец 2025-го» — образ Bazzite с тех пор повзрослел.
- **Версия ядра важнее дистрибутива.** Избегай заведомо битых ядер (см. блок-предупреждение ниже). Если сомневаешься — **LTS-ядро** безопасный выбор: несколько человек упёрлись в стену на слишком новом ядре и спаслись переходом на LTS ([src](https://t.me/c/2424231195/56529), [src](https://t.me/c/2424231195/59839)).

> Один ветеран подытожил опыт после трёх месяцев ежедневной жизни с BC-250 на Linux: игры запускаются одним кликом, RTX работает, VR работает — «абсолютно незаметно» — и он перевёл основной десктоп на Linux именно из-за этого ([src](https://t.me/c/2424231195/61870)).

---

## Путь A — Bazzite (рекомендуется новичкам)

Bazzite — это immutable геймерская ОС на базе Fedora (как SteamOS). Комьюнити поддерживает **образ специально под BC-250**, чтобы ты не трогал прошивку и параметры ядра сам.

### A1. Сначала ставим обычный Bazzite
1. Скачай с **[bazzite.gg](https://bazzite.gg/#image-picker)** (выбери десктопный вариант или «Deck»/Gaming-Mode).
2. Запиши на флешку (Ventoy, Rufus или balenaEtcher) и установи как обычно. **Создай не-root пользователя** — Steam отказывается запускаться из-под root ([src](https://t.me/c/2424231195/121246)).

> **Флешка маленькая?** ISO Bazzite весит >9 ГБ. Можно поставить обычную **Fedora** (ISO ≈3 ГБ, например Kinoite/KDE) на маленькую флешку, а потом *сделать rebase* на Bazzite из терминала ([src](https://t.me/c/2424231195/121246)):
> ```bash
> # рабочий стол KDE:
> rpm-ostree rebase ostree-image-signed:docker://ghcr.io/ublue-os/bazzite:stable
> # или с Gaming Mode (как SteamOS):
> rpm-ostree rebase ostree-image-signed:docker://ghcr.io/ublue-os/bazzite-deck:stable
> ```
> Перезагрузка — и ты в Bazzite.

### A2. Rebase на образ под BC-250
Уже в Bazzite переключись на образ BC-250, чтобы применились фиксы GPU. Поддерживаемые образы — это сборки **`vietsman` «Bazzite on Steroids»** (фикс прошивки, параметры ядра, oberon-governor и патч 40-CU уже внутри). Выбери тот рабочий стол, что поставил — **GNOME рекомендуется по умолчанию** — и запусти:
```bash
# GNOME (рекомендуется):
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/vietsman/bazzite-gnome-patched:latest
# KDE:
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/vietsman/bazzite-kde-patched:latest
# Deck / Gaming-Mode (как SteamOS):
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/vietsman/bazzite-deck-patched:latest
systemctl reboot
```
⚠ verify — сверь актуальный образ/тег перед запуском, пути образов меняются. Свежие команды — на [странице Bazzite в документации BC-250](https://elektricm.github.io/amd-bc250-docs/linux/bazzite/) (также числится на artifacthub как [`bazzite-bc250`](https://artifacthub.io/packages/container/bazzite-bc250/bazzite_bc250)).

Дальше обновляйся через хелпер Bazzite:
```bash
ujust update
```

### A3. Готово — проверка
Переходи к разделу **[Проверка ускорения GPU](#проверка-ускорения-gpu)** ниже. На образе BC-250 симлинк прошивки, параметры ядра и oberon-governor уже на месте.

---

## Путь B — Fedora (Workstation / KDE)

Fedora — самый задокументированный неатомарный путь, держится ближе к upstream. Патченый графический стек приходит из **COPR `mixaill/amd-bc-250`**.

### B1. Ставим Fedora
Скачай **Fedora Workstation или KDE** ([fedoraproject.org](https://fedoraproject.org/workstation/download)) и установи как обычно. Подтверждённый рабочий базис из чата: Fedora 41/42, ядро 6.14, GNOME 48, Mesa 25.0.2+ — «полёт хороший» ([src](https://t.me/c/2424231195/29150)). Fedora 41 с Cinnamon назвали «стабильней некуда» на Cyberpunk, Witcher 3 и т.д. ([src](https://t.me/c/2424231195/12756)).

### B2. Скрипт настройки (делает работу за тебя)
Каноничная настройка Fedora автоматизирована скриптом **`fedora-setup.sh`** из `mothenjoyer69/bc250-documentation`. Он включает COPR, ставит патченую mesa, настраивает `amdgpu`, собирает governor и чинит загрузчик. Точные шаги, которые он выполняет (сверено со скриптом):

```bash
# 1. Патченая mesa из COPR
sudo dnf copr enable mixaill/amd-bc-250 -y
sudo dnf upgrade --refresh -y

# 2. Опция модуля amdgpu + модуль датчиков
echo 'options amdgpu sg_display=0'    | sudo tee /etc/modprobe.d/options-amdgpu.conf
echo 'nct6683'                        | sudo tee /etc/modules-load.d/99-sensors.conf
echo 'options nct6683 force=true'     | sudo tee /etc/modprobe.d/options-sensors.conf

# 3. Пересобрать initramfs (в Fedora — dracut)
sudo dracut --regenerate-all --force

# 4. Загрузчик: убрать nomodeset, добавить параметры ядра
sudo sed -i 's/nomodeset//g' /etc/default/grub
sudo grub2-mkconfig -o /etc/grub2.cfg
sudo grubby --update-kernel=ALL --args="amdgpu.sg_display=0"
sudo grubby --update-kernel=ALL --args="mitigations=off"

# 5. OpenCL (опционально, для вычислений/AI)
sudo dnf install mesa-libOpenCL --allowerasing
```
*(Источник: `fedora-setup.sh` в [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation), подтверждено дословно.)*

Чтобы просто запустить скрипт, а не печатать шаги, смотри раздел **«Simple setup script»** в README этого репозитория (он указывает на [`fedora-setup.sh`](https://raw.githubusercontent.com/mothenjoyer69/bc250-documentation/refs/heads/main/fedora-setup.sh)). ⚠ Прочитай скрипт перед тем, как пайпить его в шелл.

### B3. Governor питания (oberon-governor)
Из коробки плата держит плоские 1500 МГц / 1000 мВ; **oberon-governor** масштабирует частоты (простой ↔ ~2000 МГц) и даёт андервольтить. Скрипт Fedora ставит его из исходников; можно и из COPR:
```bash
sudo dnf copr enable g/exotic-soc/oberon-governor   # альтернатива через COPR
sudo dnf install oberon-governor
sudo systemctl enable --now oberon-governor.service
systemctl status oberon-governor.service            # проверь, что работает
```
Конфиг — `/etc/oberon-config.yaml`. Полная настройка — в **[09-overclock-undervolt.md](09-overclock-undervolt.md)**. ⚠ verify — уточни точное имя COPR/пакета под свою версию Fedora.

### B4. Перезагрузка и проверка
Перезагрузись, затем переходи к разделу **[Проверка ускорения GPU](#проверка-ускорения-gpu)**.

---

## Путь C — Семейство Arch (CachyOS / EndeavourOS)

Arch-установки требуют **сделать симлинк прошивки руками** плюс свежую Mesa. Это самый «ручной» путь, но идеи те же три.

### C1. Фикс прошивки amdgpu (критичный симлинк)
`amdgpu` ищет `cyan_skillfish_gpu_info.bin`; на его месте работает блоб **navi10**. Это самая повторяемая команда в чате (5×) ([src](https://t.me/c/2424231195/45453)):

```bash
sudo ln -s /lib/firmware/amdgpu/navi10_gpu_info.bin.zst \
           /lib/firmware/amdgpu/cyan_skillfish_gpu_info.bin.zst
```

> ⚠ **verify — проверь путь на своей системе.** На дистрибутивах с **несжатой** прошивкой убери `.zst` с обоих имён:
> ```bash
> sudo ln -s /lib/firmware/amdgpu/navi10_gpu_info.bin \
>            /lib/firmware/amdgpu/cyan_skillfish_gpu_info.bin
> ```
> **Какой именно у тебя?** Запусти `ls /lib/firmware/amdgpu/ | grep -i navi10` и посмотри на имя исходного файла: если оно заканчивается на `.zst` — бери первую (`.zst`) команду, иначе вторую; имя ссылки должно соответствовать реально существующему файлу. После создания ссылки **обязательно** пересобери initramfs (следующий шаг), чтобы прошивка подхватилась при загрузке.

### C2. Свежая Mesa
На EndeavourOS/CachyOS путь комьюнити — **chaotic-aur** + `mesa-tkg-git`. Сжато из закреплённого мини-гайда по EndeavourOS ([src](https://t.me/c/2424231195/50399)) и гайда по SteamOS ([src](https://t.me/c/2424231195/52411)):

```bash
# Добавляем ключ + mirrorlist chaotic-aur (актуальные ключи — на https://aur.chaotic.cx/docs)
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Добавить в /etc/pacman.conf:
#   [chaotic-aur]
#   Include = /etc/pacman.d/chaotic-mirrorlist
sudo nano /etc/pacman.conf

sudo pacman -Syu
sudo pacman -Sy mesa-tkg-git lib32-mesa-tkg-git   # (или: yay -S mesa-tkg-git lib32-mesa-tkg-git)
sudo pacman -S vulkan-tools                        # для vulkaninfo
```
Есть и готовые пакеты в AUR: [`amdonly-gaming-mesa-git`](https://aur.archlinux.org/packages/amdonly-gaming-mesa-git) и [`mesa-amd-bc250`](https://aur.archlinux.org/packages/mesa-amd-bc250). ⚠ Подписной ключ chaotic-aur может меняться — всегда копируй актуальные ключи с [aur.chaotic.cx/docs](https://aur.chaotic.cx/docs).

> С Mesa **25.1+** на свежем ядре специальная сборка mesa может **вообще не понадобиться** — upstream Mesa уже поддерживает BC-250. Сборки `-tkg`/COPR важны в основном на старых дистрибутивах ([src](https://t.me/c/2424231195/20891)).

### C3. Параметры ядра + пересборка
Добавь параметры ядра BC-250, затем пересобери initramfs и grub. Редактируй `/etc/default/grub` и впиши это в `GRUB_CMDLINE_LINUX_DEFAULT` (каноничный набор по [документации BC-250 от elektricm](https://elektricm.github.io/amd-bc250-docs/linux/kernel/)):

```
amdgpu.sg_display=0 mitigations=off amdgpu.bc250_cc_write_mode=3 ttm.pages_limit=3959290 ttm.page_pool_size=3959290
```

Затем пересобери (Arch использует **mkinitcpio**, потом grub):
```bash
sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
На дистрибутивах с `update-grub` (Debian/Ubuntu/SteamOS) эта обёртка заменяет строку `grub-mkconfig` ([src](https://t.me/c/2424231195/52411)).

### C4. Governor + перезагрузка
Поставь **oberon-governor** с [gitlab.com/mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) (сборка `cmake . && make && sudo make install`), включи службу, перезагрузись и проверяй:
```bash
sudo systemctl enable --now oberon-governor.service
```

---

## Что делает каждый параметр ядра

Сверено с [документацией BC-250 от elektricm](https://elektricm.github.io/amd-bc250-docs/linux/kernel/) и скриптами настройки AMD-BC-250 / mothenjoyer69:

| Параметр | Что делает |
|-----------|--------------|
| `amdgpu.sg_display=0` | Отключает scatter-gather display. Нужен на **ядрах < 6.10**, чтобы не было чёрного экрана; держать безвредно. Самый цитируемый фикс загрузки в чате ([src](https://t.me/c/2424231195/52411)). |
| `mitigations=off` | Выключает CPU-митигации. Доки отмечают **~18 FPS в Cyberpunk 2077** от этого — ценой безопасности. Опционально. |
| `amdgpu.bc250_cc_write_mode=3` | Opt-in **разблок 40 CU** для новых ядер: пишет два HW-регистра, чтобы включить все 40 вычислительных блоков (по умолчанию выкл). См. [09-overclock-undervolt.md](09-overclock-undervolt.md). |
| `ttm.pages_limit=3959290` / `ttm.page_pool_size=3959290` | Дают GPU мапить больше системного RAM — значения из доков mothenjoyer69. |
| `amdgpu.gttsize=14750` | Старый эквивалент `ttm`-лимитов (задаёт размер GTT). Используй один подход, не оба сразу. |

> **Про размер VRAM/буфера:** APU лучше всего работает при **минимальном** выделении кадрового буфера GPU (например, 512 МБ), чтобы динамически делить общий пул 16 ГБ — но для этого нужен **модифицированный BIOS**, см. [08-bios.md](08-bios.md) ([src](https://t.me/c/2424231195/38599)).

---

## Проверка ускорения GPU

После первой перезагрузки убедись, что GPU реально используется (а не программный рендер).

**1. Виден ли девайс для Vulkan?** Должен показаться BC-250 / AMD-устройство, а не только LLVMpipe:
```bash
vulkaninfo | grep deviceName
```
Правильная настройка показывает **два устройства** (iGPU на этой плате всплывает дважды) ([src](https://t.me/c/2424231195/50399)).

**2. Аппаратное декодирование видео (VA-API):**
```bash
vainfo
```

**3. Строка рендерера OpenGL** (должна называть AMD/`radeonsi`, а не `llvmpipe`):
```bash
glxinfo | grep -i "OpenGL renderer"
```

**4. Активные вычислительные блоки** — подтверждает, что `amdgpu` инициализировал GPU, и сколько CU живо:
```bash
sudo dmesg | grep -i active_cu_number
```
Это самый быстрый чек, что прошивка загрузилась и (если выставил `bc250_cc_write_mode=3`) что поднялись все 40 CU. ⚠ verify — точное имя поля в `dmesg` может отличаться по ядру; если пусто, попробуй `dmesg | grep -i amdgpu` и ищи успешную загрузку прошивок, а не ошибки `cyan_skillfish_gpu_info` *failed to load*.

**5. Проверка температур/частот** (нужно ядро 6.15+ для датчиков, [src](https://t.me/c/2424231195/23542)):
```bash
sudo modprobe nct6683        # force=true нужно только на ядрах < 6.15
sensors
```
Здоровый простой — ~1500 МГц SCLK / ~47 °C; под Furmark ~1900 МГц / ~78 °C ([src](https://t.me/c/2424231195/89232)).

Если `vulkaninfo` показывает только `llvmpipe`, а `dmesg` — ошибки загрузки прошивки amdgpu, ты почти наверняка **загрузил битое ядро** или **симлинк прошивки/initramfs** не подхватился — см. ниже.

---

## ⚠ Заведомо битые ядра и подводные камни

История с драйверами сильно менялась за 17 месяцев чата. На конец 2025 / начало 2026:

- **Избегай конкретных сломанных ядер.** `6.14.7` отмечали как ломающее amdgpu у этих пользователей ([предупреждение в r/Fedora](https://www.reddit.com/r/Fedora/comments/1kqyhyf/warning_for_amdgpu_users_dont_update_to_6147_or/)). У одного человека Fedora молча загрузилась на **6.17.8**, которое «полностью ломает» поддержку Cyan Skillfish — amdgpu не смог загрузить прошивку, всё откатилось на CPU. Фикс: загрузиться в старое рабочее ядро (6.14), затем **удалить и зафиксировать версию** битого ([src](https://t.me/c/2424231195/98466)).
- **Застрял — ставь LTS.** Несколько новичков упёрлись в сборку dev-либ/драйверов на bleeding-edge ядре и разблокировались переходом на **LTS-ядро** ([src](https://t.me/c/2424231195/56529)).
- **Звук по HDMI на ядре 6.17+** потребовал костыля (пересборка с `CONFIG_SND_HDA_CODEC_HDMI_ATI=m` / `snd-hda-codec-atihdmi.ko`) — DisplayPort безопаснее как выход ([src](https://t.me/c/2424231195/68051)).
- **`amdgpu.sg_display=0` — для старых ядер (< 6.10).** Он всё ещё в большинстве гайдов, потому что безвреден, но на текущем ядре ничего не делает.
- **Вехи Mesa:** 25.0.1 починила зависание в Avowed ([src](https://t.me/c/2424231195/22019)); 25.1 принесла upstream-поддержку BC-250 с ACO + Rusticl по умолчанию ([src](https://t.me/c/2424231195/48588)). Если у тебя Mesa старше 25.1 — обнови до того, как дебажить что-либо ещё.

---

## Сборка BC-250 от комьюнити

Типичный готовый результат — BC-250 в кастом-корпусе с маленьким статус-LCD (частоты GPU/CPU, температуры, RAM) и бейджем «From E-Waste to Steam Machine», запущенный Steam на Linux ([src](https://t.me/c/2424231195/58037)):

> показания в простое на той сборке: `GPU: 1000 МГц 41 °C` · `CPU: 2036 МГц 41 °C` · `RAM: 2.8 ГБ` — тихо, холодно и играет.

---

## Источники

- **Главные доки:** [mothenjoyer69/bc250-documentation](https://github.com/mothenjoyer69/bc250-documentation) · [`fedora-setup.sh`](https://raw.githubusercontent.com/mothenjoyer69/bc250-documentation/refs/heads/main/fedora-setup.sh)
- **Орг AMD-BC-250:** [installation_fedora.md](https://github.com/AMD-BC-250/documentation/blob/main/installation_fedora.md) · [installation_opensuse_tumbleweed.md](https://github.com/AMD-BC-250/documentation/blob/main/installation_opensuse_tumbleweed.md) · [issues.md](https://github.com/AMD-BC-250/documentation/blob/main/issues.md)
- **Справка по параметрам ядра:** [elektricm.github.io/amd-bc250-docs](https://elektricm.github.io/amd-bc250-docs/linux/kernel/)
- **Bazzite:** [bazzite.gg](https://bazzite.gg/) · [образ `bazzite-bc250`](https://artifacthub.io/packages/container/bazzite-bc250/bazzite_bc250) · [bazzite-setup.sh от buoyantbeaver](https://github.com/buoyantbeaver/bc250-documentation/blob/main/bazzite-setup.sh)
- **Arch:** [pnbarbeito/bc250-arch](https://github.com/pnbarbeito/bc250-arch) · [aur.chaotic.cx/docs](https://aur.chaotic.cx/docs) · AUR [`amdonly-gaming-mesa-git`](https://aur.archlinux.org/packages/amdonly-gaming-mesa-git)
- **Fedora COPR (патченая mesa):** [mixaill/amd-bc-250](https://copr.fedorainfracloud.org/coprs/mixaill/amd-bc-250/package/mesa/)
- **Governor:** [mothenjoyer69/oberon-governor](https://gitlab.com/mothenjoyer69/oberon-governor) · [oberon-governor-atomic](https://github.com/alexghow903/oberon-governor-atomic)
- **Mesa upstream:** [MR !33116](https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33116) · [MR !33962](https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33962)
- **Из чата:** симлинк прошивки — https://t.me/c/2424231195/45453 · гайд EndeavourOS — https://t.me/c/2424231195/50399 · гайд SteamOS — https://t.me/c/2424231195/52411 · rebase Fedora→Bazzite — https://t.me/c/2424231195/121246 · спасение от битого ядра — https://t.me/c/2424231195/98466 · upstream Mesa 25.1 — https://t.me/c/2424231195/20891

> Разгон/андервольт и разблок 40 CU — в [09-overclock-undervolt.md](09-overclock-undervolt.md). Драйверы WiFi/BT-свистков — в [10-wifi-bt.md](10-wifi-bt.md).
