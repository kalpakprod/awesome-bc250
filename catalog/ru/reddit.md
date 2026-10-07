# Проекты BC250, найденные через Reddit

Сбор **2026-10-07** через OpenTabs в браузере владельца, только чтение. Основные ссылки ведут на проекты и модели, а не на пересказы Reddit; проекты без опубликованных файлов сохранены отдельно. Включение не означает рекомендацию или локальное испытание платы.

[Каталог проектов](README.md) · [Тематическая библиография](topics.md) · [EN](../en/reddit.md) · **[RU](reddit.md)** · [UK](../uk/reddit.md)

## Охват и ограничения

Получено **1275 разных карточек постов**, включая поиск вне r/BC250Gaming. Выбрано 209 обсуждений; получены **187 веток и 3613 комментария**. 22 выбранные ветки остались недоступны после одной повторной попытки. Лента новых постов закончилась на 1000 карточках, поиск ограничен индексом и выдачей Reddit; это не полный архив Reddit.

**141 отобранная запись в 11 разделах**: 28 основных проектов уже есть в исходном именном каталоге; 113 дополнительных записей включают страницы моделей, программные проекты и сборки без опубликованных файлов. Это не 141 новый репозиторий. Зеркала объединены, содержательные версии и продолжения сохранены.

Ссылки на модели ведут на страницы из постов и комментариев, а не на скачанные и проверенные STL. Проверяй актуальные файлы, лицензию, размеры БП и компоновку охлаждения. Опубликованный рендер не доказывает, что корпус напечатан.

Авторство GitHub определяется репозиторием, а не предполагаемым совпадением ника Reddit с разработчиком. Числа производительности и рассказы о совместимости не превращены в проверенные результаты.

- [JSON](../reddit-resources.json).

- [Корпуса и модели для печати](#cases).
- [Крепления, воздуховоды и CAD платы](#parts).
- [Отдельные сборки и незавершённые проекты](#builds).
- [FSR4, HelixSR на основе DLSS и генерация кадров](#upscaling).
- [Утилиты, дистрибутивы и управление системой](#software).
- [Драйверы, BIOS и исследования CPU](#drivers).
- [Стриминг, программное декодирование и compute-кодирование](#streaming).
- [Контроллеры БП и включение от геймпада](#power).
- [Датчики, LED-панели и экраны состояния](#monitoring).
- [Геймпады, USB-звук, сеть и накопители](#peripherals).
- [Кластеры LLM и стойки](#compute).

<a id="cases"></a>
## Корпуса и модели для печати

- [BC-250 Minimal Case](https://makerworld.com/en/models/2265796-bc-250-minimal-case) — Корпус под Flex-ATX. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1qgq5cy/bc250_minimal_case_print/).
- [Hrumque industrial case v3](https://makerworld.com/pl/models/2326706-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) — Компоновка с серверным БП HP, HDD и USB-хабом; историческая версия. Связанные файлы / версия: [printables.com/1580750](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub). [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1r985ck/bc250_industrial_case/).
- [Hrumque industrial case v4](https://makerworld.com/de/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu) — Продолжение для Flex-ATX и серверных БП HP. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wiqr0v/3d_print_case_hp_server_psu/pachwda/).
- [Hrumque industrial case v4.2](https://makerworld.com/pl/models/3010895-bc-250-case-v4-2-for-hpserverpsu-dual-12cm-fans) — Серверный БП HP и два вентилятора 120 мм; сохранена история исправления STL/3MF. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1un9bul/bc250_case_v42_for_hp_server_psu/).
- [ASRock BC250 Steam Machine Case](https://makerworld.com/en/models/2350219-asrock-amd-bc-250-steam-machine-case) — Печатный корпус из отчёта о сборке с двумя вентиляторами 120 мм. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1w7owpv/throttling_after_installing_ptm7950/).
- [MK Ultra Uno](https://makerworld.com/fr/models/2749412-bc-250-gaming-pc-case-mk-ultra-uno) — Исходный корпус, на котором основаны ремиксы MKUU. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1uvjcic/what_do_you_need_for_a_bc250_project/).
- [MKUU case by dderps](https://makerworld.com/en/models/3021754-bc250-case-mkuu-fsp-apevia-metalfish-psu) — Варианты под Flex-ATX, охлаждение тыльной стороны, профили для небольших принтеров и сменные панели. Связанные файлы / версия: [printables.com/1835961](https://www.printables.com/model/1835961-bc250-case-mkuu-fsp-apevia-metalfish-psu). [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1ws1z2e/selling_my_bc_250_completed_build_not_sure_if/).
- [Universal Flex-ATX MKUU remix](https://makerworld.com/en/models/3199391-universal-fit-flexatx-for-bc250-case-mkuu) — Продолжение MKUU с поддержкой БП длиной менее 180 мм. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wavxdj/the_biggest_update_yet_to_my_case/).
- [Industrial Style Compute Case v1.0](https://makerworld.com/en/models/2780951-amd-bc-250-industrial-style-compute-case-v1-0) — Корпус и руководство сборки с БП Mean Well. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wc4yza/anyone_have_experience_with_this_industrial_style/).
- [Nexus case](https://makerworld.com/models/2941435) — Печатный корпус из сборки Girly Case. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1vwqwgi/update_girly_case/p5j5vs1/).
- [Minimalistic SFX Case](https://makerworld.com/es/models/3112334-bc-250-minimalistic-case-sfx-psu) — БП SFX, магнитные панели и внутренний USB-хаб. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wr1fgv/another_bc250_case_feedback_needed/pc9ubk1/).
- [Cub Ice BC250 AIO Case](https://makerworld.com/en/models/3147502-cub-ice-bc250-aio-case) — Корпус семейства Animal Technology с жидкостным охлаждением. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wu87jm/these_things_are_great_fun_my_first_build/pd11hlo/).
- [Animal Technology Cub Ice 240](https://makerworld.com/en/models/3171320-animal-technology-cub-ice-240) — Корпус под AIO 240 мм из завершённой сборки. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wh7nle/most_recent_build_with_animal_technologies_cub/).
- [Animal Technology Cub Evo](https://makerworld.com/en/models/3185152-animal-technology-cub-evo-case) — Другой корпус семейства Cub. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wdu2tk/bc250_auto_tuner_mcp_for_better_performance/p99ni3c/).
- [Detachable-panel BC250 case](https://makerworld.com/models/3239776) — Съёмные магнитные панели с пользовательским оформлением. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1w2l7hy/ive_given_it_a_go_as_well_with_detachable_panels/).
- [ONE BC250 Case v2](https://makerworld.com/en/models/3341353-one-bc-250-case-ver-2-0) — Обновлённый корпус с совместимыми панелями; сохранена исходная версия. Связанные файлы / версия: [makerworld.com/3162439](https://makerworld.com/en/models/3162439-one-bc-250-case). [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wmz2al/i_finished_the_redesign_on_my_original_case/).
- [SFX PSU case with toggle switch](https://makerworld.com/models/3352182) — Опубликованный корпус для БП SFX. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wn6ziq/my_sfxpsu_case_kinda_big_but_it_has_fancy_tumbler/).
- [MG3DPrints Monolithic Custom Case](https://makerworld.com/en/models/3361205-bc250-monolithic-custom-case) — Магнитные панели, варианты БП/охлаждения и вертикальная подставка. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wyn368/build_underway/).
- [Cub Ice compact variant](https://makerworld.com/models/3373641) — Опубликованный компактный вариант, для которого заявлена печать на A1 Mini. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wtlpav/cub_ice_comp/).
- [Minimal Case for BC250 and Flex PSU](https://www.printables.com/model/1423572-minimal-case-for-bc250-and-flex-psu) — Корпус под Flex-БП из запроса на печать. [Обсуждение](https://www.reddit.com/r/3Dprintmything/comments/1qc1w2l/usca_custom_case_for_bc250/).
- [NexGen3D DIY Steam Machine](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) — Исходный корпус с воздушным охлаждением; сохранён рядом с Redux. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wg6y08/us_125_all_in_one_case_would_people_be_interested/p9ukjun/).
- [NexGen3D Redux](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) — Продолжение исходного корпуса DIY Steam Machine. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1w870ln/case_advice/p80lny0/).
- [NexGen3D Steam Machine Pro](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) — Ранняя версия корпуса Pro с жидкостным охлаждением. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1v2cc14/liquidcooled_amd_bc250_build_on_cachyos_need/).
- [NexGen3D Steam Machine Pro v2](https://www.printables.com/model/1793043-nexgen3d-diy-steam-machine-pro-v2-liquid-cooled-bc) — Продолжение Pro с жидкостным охлаждением и общей документацией на GitHub. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wlckfe/bios_just_flashed_but_now_there_is_no_boot_and_a/).
- [ATX PSU Bazzite Box](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box) — Корпус с полноразмерным БП ATX. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1ue60l7/joining_the_fold_took_over_the_project_from_a/).
- [ATX PSU Fan-Duct Case](https://www.printables.com/model/1616167-amd-bc-250-case-atx-psu-fan-duct) — Корпус с воздуховодом, сохраняющий штатный радиатор в указанной сборке. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1v7ptxz/bc250_double_fan_shroud_no_heatsink_mod_build/).
- [Minimalist BC250 Case](https://www.printables.com/model/1581724-minimalist-bc-250-case) — Компактный корпус с боковым вентилятором для тыльной стороны по обсуждению. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1w870ln/case_advice/).
- [Kacikor internal-PSU dual-140 mm case](https://www.printables.com/model/1599644-bc-250-case-internal-psu-2x-140mm-fans) — Основа тематического ремикса Avatar/RDA со встроенным БП и двумя вентиляторами 140 мм. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wl4ann/avatar_rda_inspired_case_almost_finished/).
- [MrLarva Steam Machine Case](https://www.printables.com/model/1618501-asrock-bc-250-case-steam-machine-by-mrlarva) — Печатный корпус со своим перечнем деталей и сборкой. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1u2wtk9/newcomer_to_this_diy_steam_machine/).
- [Ultra-thin BC250 Case](https://www.printables.com/model/1626501-ultra-thin-amd-bc-250-custom-case) — Исторический бета-проект; автор ремикса сообщил о недостаточном охлаждении двумя маленькими вентиляторами. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1uoimdp/slim_case/).
- [Quiet Case with Tower Cooler](https://www.printables.com/model/1652979-bc-250-quiet-case-tower-cooler) — Корпус для сборки с башенным кулером. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1vdl44f/bc250_tower_cooler_setup_pa120_se_am4am5_brackets/p1b52y9/).
- [nyacom Industrial Style Flex-ATX Case](https://www.printables.com/model/1737913-nyacoms-amd-bc-250-industrial-style-case-for-flexa) — Корпус в промышленном стиле; есть завершённые сборки и обсуждения проблем с температурами. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wyq4bi/150_steam_gaming_pc_the_steam_engine_asrock_bc250/).
- [The Lanboy](https://www.printables.com/model/1746364-the-lanboy-a-bc250-portable-arcade-machine) — Портативный аркадный корпус с экраном ноутбука, динамиками и списком деталей. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1ut4ubl/my_bc250_build_with_tower_cooler/).
- [Xbox Series X BC250 Edition](https://www.printables.com/model/1748271-xbox-serie-x-bc-250-edition) — Корпус в форме консоли с несколькими запланированными конфигурациями. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1u47ody/xbox_series_x_bc250_edition/).
- [BC250 meets DeepCool CH160 Plus](https://www.printables.com/model/1771269-bc250-meets-deepcool-ch160-plus) — Печатные детали установки в серийный корпус CH160 Plus. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wqnlir/i_have_finally_ascended_bros/).
- [The GabeTube](https://www.printables.com/model/1773763-bc250-case-the-gabetube) — Корпус под SFX для тумбы глубиной 40 см, связан с контроллером питания ESP32. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1uoxbp8/the_gabetube_a_case_for_performance_and_looks/).
- [MakerBeam XL BC250 Case](https://www.printables.com/model/1797470-bc250-makerbeam-xl-case) — Сборка с жидкостным охлаждением на профильной раме, печатные панели и список деталей. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wf5bnw/my_bc250_build/).
- [Three-P12 HP PSU Case](https://www.printables.com/model/1806883-bc250-case-for-three-p12-fans-and-hp-flex-slot-or) — Корпус с тремя P12 под варианты БП HP Common Slot и Flex Slot. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wj5guu/a_few_questions_as_i_begin_my_build/pafzgmt/).
- [BC250 Case 1810935](https://www.printables.com/model/1810935-bc-250-case) — Опубликованный печатный корпус, объявленный на Reddit. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1vpmhfh/case_released/).
- [Mean Well LRS-350-12 Chassis](https://www.printables.com/model/1826452-bc-250-meanwell-lrs-350-12-chassis) — Незавершённый корпус; конфигурация охлаждения ещё разрабатывалась. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1w23uw9/wip_chassis_for_bc250_and_meanwell_lps35012/).
- [Compact 6.5 L / 5.4 L Cases](https://www.printables.com/model/1829356-asrock-amd-bc-250-cases-65l-54l) — Два компактных варианта корпуса с общим руководством. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wk04wh/is_this_build_worth_it_and_is_it_missing_anything/).
- [Old Lamer Steam Box 5](https://www.printables.com/model/1831900-steam-box-5-by-old-lamer-vertical-case-for-amd-bc) — Вертикальный корпус, предложенный как альтернативная компоновка. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wn9ism/i_just_bought_a_bc250_its_coming_in_the_mail_soon/pbd8zjd/).
- [Tower Case with 280 mm AIO and ATX PSU](https://www.printables.com/model/1832699-bc250-tower-case-xbox-series-x-ch270-inspired-atx) — На момент объявления — ещё не напечатанный концепт; рендеры не являются проверенной сборкой. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wgk4p0/concept_stacked_case_for_the_bc250_and_atx_psu/pa1o58w/).
- [Horizontal Clamshell Case](https://www.printables.com/model/1832744-amd-bc250-case-clamshellhorizontal-style-with-inte) — Связанный горизонтальный концепт с опубликованной моделью. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1w77ws6/vertical_case_project_another_case_design/).
- [Modular Panel Case 7.17 L / 8.65 L](https://www.printables.com/model/1852640-717-litre-or-865-litre-modular-panel-case-for-bc-2) — Корпус со сменными панелями под Thermalright AXP120-X67; обсуждаются варианты под более крупные кулеры. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1woqg1e/bc250_case_vans_shoes_box_theme/pbtvk1h/).
- [JF13K Case](https://www.printables.com/model/1865220-bc-250-jf13k-case) — Корпус и сборочное руководство, связанные с креплением AM5 и контроллером ESP32. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wx7ljs/my_build_is_now_complete/).
- [5 L HP Server PSU Case](https://cults3d.com/en/3d-model/gadget/amd-bc250-case-5l-hp-server-psu-case) — Одновентиляторный корпус под БП HP HSTNS и тыльный радиатор. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1vo1xzu/bc250_case/).
- [ATX Steam Machine Case](https://cults3d.com/en/3d-model/gadget/bc-250-atx-case-steam-machine) — Модель под ATX из обсуждения планируемой сборки. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1vzwl5r/need_some_guidance_for_my_build/).
- [Kapa3D Gamer Case](https://cults3d.com/en/3d-model/tool/amd-bc-250-gamer-case) — Платная модель; в обсуждении запрашивается опыт сборки. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1viuua0/anyone_tried_this_kapa3d_case/).
- [BC250 Steam Case (Cults 4890589)](https://cults3d.com/:4890589) — Модель корпуса, объявленная в r/cults3d. [Обсуждение](https://www.reddit.com/r/cults3d/comments/1wiseaq/bc250_steam_case/).
- [Arthrimus BC250 Case](https://www.thingiverse.com/thing:7172528) — Печатный корпус; в отчёте есть проблемы с совпадением размеров БП. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1vhgi9m/problems_with_my_bc250_build/).
- [BC250 Case 7201620](https://www.thingiverse.com/thing:7201620) — Основа сборки Alien Machine с двумя P12. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wa66be/alien_machine/).
- [BC250 Case 7245584](https://www.thingiverse.com/thing:7245584) — Компоновка с одним или двумя вентиляторами и тыльным воздуховодом из обсуждения. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1w870ln/case_advice/).
- [BC250 Case 7262228](https://www.thingiverse.com/thing:7262228) — Корпус из вопроса о совместимости с серверным БП HP; соответствие размеров не установлено. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wiqr0v/3d_print_case_hp_server_psu/).
- [NexGen-3D-Printing/SteamMachine](https://github.com/NexGen-3D-Printing/SteamMachine) — Общие исходники, сборочные руководства и обсуждения семейства корпусов и креплений NexGen3D, включая разные поколения Pro и Redux. [Версия на дату проверки](https://github.com/NexGen-3D-Printing/SteamMachine/tree/c6ae5d4aef42927a7e126f2c24051fc35d94d5fa).

<a id="parts"></a>
## Крепления, воздуховоды и CAD платы

- [ITX Mount](https://makerworld.com/en/models/2533826-amd-bc-250-itx-mount) — Адаптер установки в корпуса ITX. [Обсуждение](https://www.reddit.com/r/3DDruck/comments/1wv1tcf/kennt_jemand_einen_sehr_günstigen_3d_druck/).
- [AM4/AM5 Cooler Mount](https://makerworld.com/pl/models/2596083-bc-250-am4-5-cpu-cooler-mount) — Крепление кулера с исходником FreeCAD. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1woy8kf/metalfish_t60_aio_build/).
- [Isaac Alves Open Test Bench](https://makerworld.com/models/2665910) — Открытая подставка и тестовый стенд для платы. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1w2vcxt/got_modded_bios_and_bazzite_installed_now_i_need/p6vnltp/).
- [Tool-less Micro-Fit Bracket v2](https://makerworld.com/en/models/3370801-microfit-3-0-bracket-ver-2-0-tool-less) — Фиксатор без термовставок; сохранена ссылка на первую версию. Связанные файлы / версия: [makerworld.com/3149892](https://makerworld.com/en/models/3149892-microfit-3-0-bracket-for-bc-250). [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wt1bj9/i_updated_my_microfit_30_bracket_now_its_tool_less/).
- [BC250 to AMD CPU Cooler Mount](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount) — Ранний адаптер крепления кулера AMD. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1vp39dy/am4_mounting_bracket/).
- [DeepCool AG/AK Bracket Adapter](https://www.printables.com/model/1544540-bc250-deepcool-ag-ak-bracket-adapter) — Адаптер башенного кулера из сборки CH160 Plus. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wqnlir/i_have_finally_ascended_bros/).
- [NexGen3D AIO Mount](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250) — Исходное крепление AIO, сохранённое рядом с продолжением v2. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wdc7c5/watercooled_bc250_options_jonsbo_z20_case/).
- [NexGen3D AIO Mount v2](https://www.printables.com/model/1782473-nexgen3d-version-2-aio-mount-for-the-bc-250) — Крепление второго поколения с печатными файлами и перечнем деталей. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1vl3u9k/nexgen3d_aio_mount_installation_guide/p30d7df/).
- [BC250 CPU Cooler Mount 1574416](https://www.printables.com/model/1574416-amd-bc-250-with-cpu-cooler) — Модель крепления, связанная с белой версией JF13K. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1w81ug9/jf13k_heads_up_brackets_are_different_between/).
- [Gadget BC250-to-ATX Case Adapter](https://www.printables.com/model/1743485-bc250-to-atx-case-adapter) — Адаптер установки платы в серийные корпуса. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1whdos5/reviving_an_old_case_with_a_bc250/).
- [Micro-Fit Holder/Clip](https://www.printables.com/model/1760393-bc250-microfit-holderclip) — Фиксатор разъёмов питания платы. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wma8i3/microfit_connectors_and_clips/).
- [Arctic Liquid Freezer III Mount](https://www.printables.com/model/1763936-artic-liquid-freezer-mount-for-bc250) — Крепление помпы; в источнике указаны ABS/ASA, вставки и винты. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1w755cn/help_finding_a_3d_printable_case_for_a1_dual_240mm/p7te550/).
- [Blower Fan Shroud](https://www.printables.com/model/1778769-blower-fan-shroud-for-bc250) — Воздуховод для центробежного вентилятора, предложенный для сборки BC250. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wavxdj/the_biggest_update_yet_to_my_case/p8lbtfo/).
- [NexGen3D Micro-Fit BMI Retainer](https://www.printables.com/model/1785063-nexgen3d-micro-fit-bmi-retainer-for-the-bc-250) — Печатный держатель стыкуемых разъёмов питания Micro-Fit. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wtz1c6/made_30_sets_of_custom_bc250_power_cables_sharing/).
- [Dual-120 mm Blower Support](https://www.printables.com/model/1800002-bc250-cooling-with-two-12cm-blowers) — Опубликованная STEP-подставка для эксперимента с двумя центробежными вентиляторами. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1vfdryu/new_casecooling_idea_for_extreme_performance/p1o89c6/).
- [Intel-block AIO Adapter](https://www.printables.com/model/1812674-bc-250-watercooler-aio-mount-intel-block-adapter) — Адаптер крепления блоков AIO в стиле Intel. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1vzaqxp/any_aio_adapter_work_with_thermalright_elite_v6/).
- [BC250 Test Bench](https://www.printables.com/model/1822419-bc250-test-bench) — Открытая подставка с вариантами задней панели под ATX и Flex-ATX. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1vxuanq/a_test_bench_for_the_bc250/).
- [AM5 CPU Cooler Mount](https://www.printables.com/model/1826539-am5-cpu-cooler-mount-for-the-bc250) — Крепление, использованное с чёрным JF13K; кронштейны чёрной и белой версии различаются. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wx7ljs/my_build_is_now_complete/).
- [Complete-ish BC250 CAD Model](https://www.printables.com/model/1828755-asrock-bc250-complete-ish-cad-model) — Модель платы, ключевых компонентов и радиатора; автор не заявляет точное соответствие 1:1. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1w96ok9/bc250_more_detailed_cad_model/).
- [JF13K Mount with VRM Airflow Guides](https://www.printables.com/model/1837210-bc-250-mount-for-jiushark-jf13k-vrm-airflow-direct) — Незавершённое крепление; автор просит сообщество проверить печать и посадку. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wbfn1e/need_help_bc250_mount_for_jiushark_jf13k_with_vrm/).
- [SickBC250 Simple Bench Support](https://www.printables.com/model/1850840-sickbc250) — Простая печатная подставка для открытой сборки BC250. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wn5d9y/amd_bc_250_simple_bench_support/).
- [Arthrimus Rear-Fan Modification](https://www.thingiverse.com/thing:7271946) — Модификация корпуса Arthrimus для отдельного вентилятора памяти сзади. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wnjsc7/arthrimus_case_single_vs_dual_fan_shroud/pbgnqi6/).
- [Simple BC250 I/O Shield](https://www.thingiverse.com/thing:7402167) — Печатная заглушка панели разъёмов. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1w1noj8/heres_my_simple_io_shield/).
- [Black-JF13K Mount Remix](https://www.thingiverse.com/thing:7402291) — Ремикс крепления AM5 с изменёнными опорами и отверстиями под термовставки. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1w81ug9/jf13k_heads_up_brackets_are_different_between/).

<a id="builds"></a>
## Отдельные сборки и незавершённые проекты

- [mosfet.party Case 1 prototype](https://www.reddit.com/r/BC250Gaming/comments/1w9gc9f/case_1_by_mosfetparty_prototype_reveal/) — Прототип на профильной раме с магнитными панелями, FSP500 и встроенным питанием. CAD/STL в просмотренном обсуждении не опубликованы.
- [Project Steampipe](https://www.reddit.com/r/BC250Gaming/comments/1wmdp9e/steam_pipe_vertical_case_updatefinal/) — Завершённый вертикальный цилиндрический корпус; автор предлагает поделиться STL, но публичная ссылка в обсуждении не найдена.
- [Sheet-metal / printed-backbone concept](https://www.reddit.com/r/BC250Gaming/comments/1wuqf7c/case_design/) — Авторский CAD-концепт с выбором между листовым металлом и полностью печатным корпусом; рендеры с помощью AI не доказывают готовую сборку.
- [HL2/Cyberpunk-inspired frame](https://www.reddit.com/r/BC250Gaming/comments/1wr1fgv/another_bc250_case_feedback_needed/) — Концепт рамы под Mean Well UHP-350-12; публикация CAD обещана, но ссылка в обсуждении отсутствует.
- [Avatar/RDA themed build](https://www.reddit.com/r/BC250Gaming/comments/1wl4ann/avatar_rda_inspired_case_almost_finished/) — Индивидуальный ремикс корпуса Kacikor с магнитными аксессуарами и экраном состояния; исходная модель указана отдельно. Связанные файлы / версия: [Base case](https://www.printables.com/model/1599644-bc-250-case-internal-psu-2x-140mm-fans).
- [Xbox One S Fan-Shroud Reuse](https://www.reddit.com/r/BC250Gaming/comments/1wgo0pq/xbox_one_s_cpu_fan_shroud_is_almost_perfect/) — Переделка физического воздуховода Xbox One S; полярность и распиновка отличаются, это не скачиваемая 3D-модель.

<a id="upscaling"></a>
## FSR4, HelixSR на основе DLSS и генерация кадров

- [lonewolf0622/HelixSR](https://github.com/lonewolf0622/HelixSR) — Неофициальная реконструкция DLSS Model E через интерфейс FSR 3.1 и вычисления D3D12, в том числе Proton. Это не нативная поддержка NVIDIA DLSS; исходники апскейлера не опубликованы. [Версия на дату проверки](https://github.com/lonewolf0622/HelixSR/tree/a635fa92b08022426702a45255042e62a778c130).
- [daniel-h-0/bc250-fsr4-fork](https://github.com/daniel-h-0/bc250-fsr4-fork) — Продолжение dmorazasanchez/bc250-fsr4: оптимизации INT8 перенесены в переносимую DLL FidelityFX; есть установщик на основе OptiScaler Client для BC250. [Версия на дату проверки](https://github.com/daniel-h-0/bc250-fsr4-fork/tree/528f13b17e48bfba5b153f17ec4ebdfb3afa5bcb).
- [dmorazasanchez/bc250-fsr4](https://github.com/dmorazasanchez/bc250-fsr4) — Экспериментальная работа с графическим путём FSR4/INT8 на BC-250. [Версия на дату проверки](https://github.com/dmorazasanchez/bc250-fsr4/tree/fd4e9dc760241f61e5fe5c77b1cd5ef862b82134).
- [Schaka/fsr4-gfx803](https://github.com/Schaka/fsr4-gfx803) — Смежная работа по прореживанию модели FSR4 для Polaris/gfx803, основанная на продолжении BC250 FSR4; не утверждение поддержки BC250. [Версия на дату проверки](https://github.com/Schaka/fsr4-gfx803/tree/407d67cfab54c2b641f329c844683f197fa13f72).
- [blackbearreloaded/ps5-fsr4](https://github.com/blackbearreloaded/ps5-fsr4) — Демонстрация и SDK FSR4 для PS5 на основе проектов BC250. Смежное продолжение, а не мод для внедрения в обычные игры PS5. [Версия на дату проверки](https://github.com/blackbearreloaded/ps5-fsr4/tree/7fe9ec2273629e8ac1938a58249b1983a19fff3f).
- [optiscaler/OptiScaler](https://github.com/optiscaler/OptiScaler) — Игровой адаптер, перенаправляющий входные данные DLSS, XeSS и FSR в другие апскейлеры; отдельный от настольного Client и самой модели реконструкции.
- [PancakeTAS/lsfg-vk](https://github.com/PancakeTAS/lsfg-vk) — Интеграция генерации кадров Lossless Scaling в Linux через Vulkan; в обсуждении BC250 рассматривается использование с Decky.
- [OptiScaler Client](https://github.com/Optiscaler-Client/Optiscaler-Client) — Исходный настольный менеджер, используемый установщиком BC250 FSR4; отдельный проект, не игровой адаптер OptiScaler.
- [OptiPatcher](https://github.com/optiscaler/OptiPatcher) — Плагин совместимости входных данных, указанный в продолжении BC250 FSR4.
- [Lossless Scaling](https://store.steampowered.com/app/993090/Lossless_Scaling/) — Коммерческая программа масштабирования и генерации кадров, обсуждаемая для BC250; lsfg-vk — отдельный проект интеграции в Linux. [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1vh2dkc/lossless_scaling_on_steam/).

<a id="software"></a>
## Утилиты, дистрибутивы и управление системой

- [MTSistemi/SkillFishOS](https://github.com/MTSistemi/SkillFishOS) — Проект дистрибутива и образов с поддержкой BC250 для игр. Его настройки следует отличать от исходного Bazzite и других дистрибутивов. [Версия на дату проверки](https://github.com/MTSistemi/SkillFishOS/tree/4d7604765aa311467d6aa081539323122a075f53).
- [movacx/bc250-control-center](https://github.com/movacx/bc250-control-center) — GUI Linux для мониторинга, настройки SMU/CPU, PWM вентиляторов и работы с CU.
- [redbeard1083/bc250-toolkit](https://github.com/redbeard1083/bc250-toolkit) — Меню установки и настройки BC250 в Linux, упомянутое в обсуждениях сборок CachyOS и SteamOS.
- [rpf16rj/bc250-steamos-real-toolkit](https://github.com/rpf16rj/bc250-steamos-real-toolkit) — Установка и интеграция утилит SteamOS.
- [keyboardspecialist/bc250-steamos](https://github.com/keyboardspecialist/bc250-steamos) — Установка и интеграция утилит SteamOS.
- [tmghd272/bc250-batocera-tools](https://github.com/tmghd272/bc250-batocera-tools) — Утилиты настройки Batocera на BC-250.
- [TesseractCat/bc250-nixos](https://github.com/TesseractCat/bc250-nixos) — Конфигурация NixOS или Nix flake для поддержки BC-250.
- [62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images](https://github.com/62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images) — Проект готовых образов Bazzite Deck/GNOME/KDE с интеграцией патчей BC-250.
- [bandlayash/bc250-autotune](https://github.com/bandlayash/bc250-autotune) — Интерфейс MCP для телеметрии и настройки с механизмом watchdog загрузки.
- [lethevimlet/lethe-bc250](https://github.com/lethevimlet/lethe-bc250) — Проект управления питанием и настройками с Decky и веб-приложением, включая программное выключение и псевдосон.

<a id="drivers"></a>
## Драйверы, BIOS и исследования CPU

- [amethyst8118/MetalCyan](https://github.com/amethyst8118/MetalCyan) — Плагин Lilu с патчами драйверов Apple для Metal на BC250; рассчитан на macOS Tahoe 26.7.1/MacPro7,1. В README описаны ограничения видео/звука, выключения и восстановления GPU. [Версия на дату проверки](https://github.com/amethyst8118/MetalCyan/tree/4382dfa9daad77c6b83bcae0ae658a0e1015071d).
- [mendesrr/bc250-acpi-fix-updated-8c](https://github.com/mendesrr/bc250-acpi-fix-updated-8c) — Адаптация таблиц ACPI для восьми ядер, упомянутая в обсуждениях настройки. Запись не означает обязательность для всех ОС или исправность разблокированных ядер. [Версия на дату проверки](https://github.com/mendesrr/bc250-acpi-fix-updated-8c/tree/83686c4670f29316bc4c396a9bda75281327a5e3).
- [jao-marcello/bc250-core-unlock-0x7E](https://github.com/jao-marcello/bc250-core-unlock-0x7E) — Адаптация скрипта разблокировки CPU для маски 0x7E; автор отдельно отмечает, что отключённые ядра могут оказаться неисправными. [Версия на дату проверки](https://github.com/jao-marcello/bc250-core-unlock-0x7E/tree/b765ae542e7f6d1bed8e650b5e399055725dd0a0).
- [ProcessorAutomaticUtility](https://gitlab.com/gmb8281-linux/ProcessorAutomaticUtility) — Утилита разблокировки CPU BC250 после загрузки, опубликованная на GitLab; основание включения — объявление проекта, а не локальный тест платы.
- [Dream-Cypher/bc250-memory-timing-boot-fix](https://github.com/Dream-Cypher/bc250-memory-timing-boot-fix) — Эксперимент настройки таймингов памяти при загрузке для периодического отсутствия POST.
- [DryhoppedIPA/bc250-gfx1013-fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix) — Набор патчей очередей вычислений ядра и Mesa/RADV, включая работу с INT8.
- [tri3gubki-ops/bc250-async-compute-bazzite](https://github.com/tri3gubki-ops/bc250-async-compute-bazzite) — Развёртывание отдельного патченного драйвера RADV на Fedora atomic/Bazzite.
- [vogar345/Bc250-radeon-patch](https://github.com/vogar345/Bc250-radeon-patch) — Исследование совместимости и графические патчи Final Fantasy VII Rebirth.
- [bangstk/Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS) — Обёртка Vulkan для обхода требований variable rate shading в Doom: The Dark Ages на BC250.
- [Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script](https://github.com/Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script) — Скрипт меню резервного копирования и прошивки на основе модифицированного P3.00.
- [coderredlab/bc250-8core-unlock](https://github.com/coderredlab/bc250-8core-unlock) — Образ разблокировки восьми ядер для плат с P3.00, с контрольными суммами и откатом по источнику; исправность ядер зависит от платы.
- [Expired-Pasta/AMD_BC250_BIOS_Reprogramming_MX25L12872F](https://github.com/Expired-Pasta/AMD_BC250_BIOS_Reprogramming_MX25L12872F) — Восстановление и перепрограммирование BIOS на микросхеме MX25L12872F.

<a id="streaming"></a>
## Стриминг, программное декодирование и compute-кодирование

- [grykom/moonlight-qt-bc250](https://github.com/grykom/moonlight-qt-bc250) — Форк клиента Moonlight с выбором числа потоков программного декодирования и экспериментальным пакетом Arch/CachyOS. Не включает аппаратный декодер VCN. [Версия на дату проверки](https://github.com/grykom/moonlight-qt-bc250/tree/ceb67ce0dde619054d513706c829f8715ce1b6a3).
- [Shalasere/bc250-vulkan-encode-stopgap](https://github.com/Shalasere/bc250-vulkan-encode-stopgap) — Кодировщик VA-API на Vulkan compute и CPU, отдельно исправляет тактирование звука. Описаны конкуренция с игрой за GPU и незавершённые пути HEVC; это не включение VCN. [Версия на дату проверки](https://github.com/Shalasere/bc250-vulkan-encode-stopgap/tree/732dfb57dda4e08c4b31d95039e99dc232d0a809).
- [simpmix/bc250-encoding-decoding-fix](https://github.com/simpmix/bc250-encoding-decoding-fix) — Работа над VA-API кодеками на CPU/compute; общие файлы не дают независимого подтверждения состояния VCN.
- [Themaister/pyrowave](https://github.com/Themaister/pyrowave) — Универсальный видеокодек на Vulkan compute, обсуждаемый как альтернативный путь стриминга. Пост не доказывает готовую интеграцию или совместимость BC250 со всеми клиентами. [Версия на дату проверки](https://github.com/Themaister/pyrowave/tree/c0b997f84ced7bd827ca737aa5145f4ec811de8d).

<a id="power"></a>
## Контроллеры БП и включение от геймпада

- [GreatApo/BC250_ESP32_ATX_PSU](https://github.com/GreatApo/BC250_ESP32_ATX_PSU) — Контроллер питания ATX на ESP32 с включением по BLE/Bluetooth, веб-интерфейсом и HTTP API; включение зависит от поведения геймпада. [Версия на дату проверки](https://github.com/GreatApo/BC250_ESP32_ATX_PSU/tree/61405267a2b2852f8c5607aa7dcd6dd4658bd4dc).
- [Arduino Pro Micro ATX switch](https://gist.github.com/mkarr/f1f077d6a651d971e3b63fd3caf9c6fb) — Контроллер БП с кнопкой без фиксации, сигналом состояния платы и отслеживанием программного выключения; исходник опубликован в Gist.
- [ChokunPlayZ/BC-250-Ctrl](https://github.com/ChokunPlayZ/BC-250-Ctrl) — Прошивка контроллера питания ESP32 с назначением GPIO, телеметрией БП HP и интеграцией Zigbee, описанными в сборке.
- [christianbemerson/bc250-bluetooth-controller](https://github.com/christianbemerson/bc250-bluetooth-controller) — Контроллер включения по BLE на ESP32-C3 с дежурным питанием и сигналом состояния платы; требуется подходящий режим объявления геймпада.
- [aleksejspopovs/bc250-power](https://github.com/aleksejspopovs/bc250-power) — Плата управления питанием на Pico с HDMI-CEC и включением от Steam Controller через переключение USB.
- [Thunkar/bc250-esp32-switch](https://github.com/Thunkar/bc250-esp32-switch) — Контроллер БП и включения по Bluetooth на ESP32-C3, связанный с корпусом The GabeTube.
- [tfabris/BC-250](https://github.com/tfabris/BC-250) — Консольная сборка Bazzite/Steam с печатными деталями, кодом и ссылками.
- [PS250 direct-PSU Pico bridge](https://www.reddit.com/r/BC250Gaming/comments/1wtlfmr/ps250_a_small_but_powerfull_device_that_unlocks_a/) — Прототип Pico 2 с включением от геймпада и прямым управлением ATX на основе SundayMoments/DS5_Bridge. В объявлении нет ссылки на опубликованный собственный форк. Связанные файлы / версия: [Upstream bridge](https://github.com/SundayMoments/DS5_Bridge).

<a id="monitoring"></a>
## Датчики, LED-панели и экраны состояния

- [rpf16rj/steamos-led-bar-release](https://github.com/rpf16rj/steamos-led-bar-release) — Внешняя LED-панель ESP8266/WS2812, связанная с персонализацией игрового режима; отдельный проект, не шкала прогресса загрузок. [Версия на дату проверки](https://github.com/rpf16rj/steamos-led-bar-release/tree/1be0b79f77ef2bd6c43606e3662997cae3dd0ae8).
- [mathoudebine/turing-smart-screen-python](https://github.com/mathoudebine/turing-smart-screen-python) — Универсальное ПО для USB-экрана состояния, использованное в сборке BC250; совместимость зависит от конкретного экрана и ОС. [Версия на дату проверки](https://github.com/mathoudebine/turing-smart-screen-python/tree/2b33ab4f00a096916dd6a1174441a53a7ec33b03).
- [AkPuLk0/BC250---Led-Progress](https://github.com/AkPuLk0/BC250---Led-Progress) — Светодиодный индикатор загрузок и передачи файлов через контроллер Corsair Commander.

<a id="peripherals"></a>
## Геймпады, USB-звук, сеть и накопители

- [awalol/DS5Dongle](https://github.com/awalol/DS5Dongle) — Проект донгла DualSense, применённый в сборке BC250 для геймпада, тачпада и звука. [Версия на дату проверки](https://github.com/awalol/DS5Dongle/tree/c67c7f685fe8d8cc44f519d27710c5a639a1be7d).
- [kungaa/DS5-Linux-Bridge](https://github.com/kungaa/DS5-Linux-Bridge) — Linux-версия моста DualSense с Decky, звуком, тактильной отдачей и функциями включения. Её способ включения отличается от прямого управления БП. [Версия на дату проверки](https://github.com/kungaa/DS5-Linux-Bridge/tree/1e15ea2d47d302437580c3b13850ec937cbc1c88).
- [SundayMoments/DS5_Bridge](https://github.com/SundayMoments/DS5_Bridge) — Исходный мост DualSense, названный основой PS250. Эта ссылка не является самим ещё не опубликованным форком PS250. [Версия на дату проверки](https://github.com/SundayMoments/DS5_Bridge/tree/5ee08e0984085c99eac5afe14c05f572b6e9dc59).
- [dlugi152/OGX-Mini-2026](https://github.com/dlugi152/OGX-Mini-2026) — Универсальная прошивка Pico для контроллеров и донгла, предложенная в обсуждении BC250; смежная альтернатива, а не проверенный способ включения BC250. [Версия на дату проверки](https://github.com/dlugi152/OGX-Mini-2026/tree/86a6273d50354f51ef821a4620d49d945b787c78).
- [rpf16rj/usb_sound_card_with_pico-master](https://github.com/rpf16rj/usb_sound_card_with_pico-master) — Проект USB-звуковой карты, использованный вместо звука DP/HDMI в сборке BC250 со SteamOS. [Версия на дату проверки](https://github.com/rpf16rj/usb_sound_card_with_pico-master/tree/704ed6e8c507cdb076836bb62ce59277cecfa7aa).
- [morrownr/USB-WiFi](https://github.com/morrownr/USB-WiFi) — Списки USB WiFi и Bluetooth с драйверами в ядре Linux из отчёта о настройке BC250; не рекомендация безымянного донгла. [Версия на дату проверки](https://github.com/morrownr/USB-WiFi/tree/8bd0207d19dfdf1365400ffd0af0639d7a973d66).
- [NVMe + SATA M.2 adapter proposal](https://www.reddit.com/r/BC250Gaming/comments/1w24oip/m2_dual_ssd_mod_simultaneous_nvme_sata/) — Адаптер CRImier для двух SSD рассматривается для BC250; в обсуждении задаётся вопрос о совместимости, а не подтверждается установка. Связанные файлы / версия: [Adapter PCB files](https://github.com/CRImier/MyKiCad/tree/master/Laptop%20mods/nvme_to_dual_ssd_hack).

<a id="compute"></a>
## Кластеры LLM и стойки

- [4claps/bc250-llama-cluster](https://github.com/4claps/bc250-llama-cluster) — Развёртывание распределённого llama.cpp RPC на нескольких BC-250 через Ansible.
- [LabRax Mini dual-BC250 rack](https://www.reddit.com/r/BC250Gaming/comments/1wf018l/labrax_mini_rack_for_dual_bc250_llm_rig/) — Незавершённая стойка на две платы для кластера llama.cpp RPC; код кластера доступен, но ссылка на CAD стойки не найдена. Связанные файлы / версия: [Cluster project](https://github.com/4claps/bc250-llama-cluster).

## Смежные ссылки и неразобранные кандидаты

Не включены в число отдельных проектов BC250. Две безымянные ссылки Cults предложены как варианты корпусов, но модели ещё не идентифицированы. Остальные — универсальные детали оформления и охлаждения, действительно упомянутые в сборках BC250, а также недоступная историческая ссылка на патч mesh shaders. Переделки БП остаются работой с электрикой, не инструкцией по установке.

- [cults3d.com/:4382063](https://cults3d.com/:4382063) · [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1w870ln/case_advice/).
- [cults3d.com/:4780379](https://cults3d.com/:4780379) · [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1w870ln/case_advice/).
- [printables.com/367734](https://www.printables.com/model/367734-120mm-angular-louvre-fan-grill) · [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1w23uw9/wip_chassis_for_bc250_and_meanwell_lps35012/).
- [printables.com/664926](https://www.printables.com/model/664926-mean-well-lrs-350-lid-for-120mm-fan) · [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1vrph6h/meanwell_12v_350w_unbearable_noisy/).
- [thingiverse.com/thing:4503364](https://www.thingiverse.com/thing:4503364) · [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1vrph6h/meanwell_12v_350w_unbearable_noisy/).
- [makerworld.com/1492898](https://makerworld.com/en/models/1492898-wood-grain-modifier-add-wood-grain-to-any-models) · [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wavxdj/the_biggest_update_yet_to_my_case/).
- [makerworld.com/460913](https://makerworld.com/en/models/460913-tanjiro-kamado-demon-slayer-hueforge) · [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wavxdj/the_biggest_update_yet_to_my_case/).
- [makerworld.com/3149496](https://makerworld.com/en/models/3149496-cyberpunk-edgerunners) · [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1wavxdj/the_biggest_update_yet_to_my_case/).
- [Historical mesh-shader driconf link](https://github.com/lonewolf0622/BC-250-Mesh-Shader-Patch---driconf-Edition-opt-in-per-application-) · [Обсуждение](https://www.reddit.com/r/BC250Gaming/comments/1va5p14/cpu_core_unlock_spotted_in_the_wild/).
