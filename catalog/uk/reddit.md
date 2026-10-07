# Проєкти BC250, знайдені через Reddit

Збір **2026-10-07** через OpenTabs у браузері власника, лише читання. Основні посилання ведуть на проєкти й моделі, а не на перекази Reddit; проєкти без опублікованих файлів збережені окремо. Включення не означає рекомендації чи локального випробування плати.

[Каталог проєктів](README.md) · [Тематична бібліографія](topics.md) · [EN](../en/reddit.md) · [RU](../ru/reddit.md) · **[UK](reddit.md)**

## Охоплення та обмеження

Отримано **1275 різних карток дописів**, зокрема пошук поза r/BC250Gaming. Вибрано 209 обговорень; отримані **187 гілок та 3613 коментарів**. 22 вибрані гілки залишилися недоступними після однієї повторної спроби. Стрічка нових дописів завершилася на 1000 картках, пошук обмежений індексом і видачею Reddit; це не повний архів Reddit.

**141 відібраний запис в 11 розділах**: 28 основних проєктів уже є в початковому іменному каталозі; 113 додаткових записів охоплюють сторінки моделей, програмні проєкти та збірки без опублікованих файлів. Це не 141 новий репозиторій. Дзеркала обʼєднані, змістовні версії та продовження збережені.

Посилання на моделі ведуть на сторінки з дописів і коментарів, а не на завантажені та перевірені STL. Перевіряй актуальні файли, ліцензію, розміри БЖ та компонування охолодження. Опублікований рендер не доводить, що корпус надрукований.

Авторство GitHub визначається репозиторієм, а не припущенням про збіг ніка Reddit із розробником. Числа продуктивності та розповіді про сумісність не перетворені на перевірені результати.

- [JSON](../reddit-resources.json).

- [Корпуси та моделі для друку](#cases).
- [Кріплення, повітроводи та CAD плати](#parts).
- [Окремі збірки та незавершені проєкти](#builds).
- [FSR4, HelixSR на основі DLSS та генерація кадрів](#upscaling).
- [Утиліти, дистрибутиви та керування системою](#software).
- [Драйвери, BIOS та дослідження CPU](#drivers).
- [Стримінг, програмне декодування та compute-кодування](#streaming).
- [Контролери БЖ та увімкнення від геймпада](#power).
- [Датчики, LED-панелі та екрани стану](#monitoring).
- [Геймпади, USB-звук, мережа та накопичувачі](#peripherals).
- [Кластери LLM та стійки](#compute).

<a id="cases"></a>
## Корпуси та моделі для друку

- [BC-250 Minimal Case](https://makerworld.com/en/models/2265796-bc-250-minimal-case) — Корпус під Flex-ATX. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1qgq5cy/bc250_minimal_case_print/).
- [Hrumque industrial case v3](https://makerworld.com/pl/models/2326706-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub) — Компонування із серверним БЖ HP, HDD та USB-хабом; історична версія. Повʼязані файли / версія: [printables.com/1580750](https://www.printables.com/model/1580750-bc250-amd-case-v3-hp-server-psu-hdd-usb-hub). [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1r985ck/bc250_industrial_case/).
- [Hrumque industrial case v4](https://makerworld.com/de/models/2481620-bc-250-case-v4-for-flexatx-and-hpserver-psu) — Продовження для Flex-ATX та серверних БЖ HP. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wiqr0v/3d_print_case_hp_server_psu/pachwda/).
- [Hrumque industrial case v4.2](https://makerworld.com/pl/models/3010895-bc-250-case-v4-2-for-hpserverpsu-dual-12cm-fans) — Серверний БЖ HP та два вентилятори 120 мм; збережена історія виправлення STL/3MF. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1un9bul/bc250_case_v42_for_hp_server_psu/).
- [ASRock BC250 Steam Machine Case](https://makerworld.com/en/models/2350219-asrock-amd-bc-250-steam-machine-case) — Друкований корпус зі звіту про збірку з двома вентиляторами 120 мм. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1w7owpv/throttling_after_installing_ptm7950/).
- [MK Ultra Uno](https://makerworld.com/fr/models/2749412-bc-250-gaming-pc-case-mk-ultra-uno) — Початковий корпус, на якому засновано ремікси MKUU. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1uvjcic/what_do_you_need_for_a_bc250_project/).
- [MKUU case by dderps](https://makerworld.com/en/models/3021754-bc250-case-mkuu-fsp-apevia-metalfish-psu) — Варіанти під Flex-ATX, охолодження тильного боку, профілі для невеликих принтерів та змінні панелі. Повʼязані файли / версія: [printables.com/1835961](https://www.printables.com/model/1835961-bc250-case-mkuu-fsp-apevia-metalfish-psu). [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1ws1z2e/selling_my_bc_250_completed_build_not_sure_if/).
- [Universal Flex-ATX MKUU remix](https://makerworld.com/en/models/3199391-universal-fit-flexatx-for-bc250-case-mkuu) — Продовження MKUU з підтримкою БЖ завдовжки менш як 180 мм. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wavxdj/the_biggest_update_yet_to_my_case/).
- [Industrial Style Compute Case v1.0](https://makerworld.com/en/models/2780951-amd-bc-250-industrial-style-compute-case-v1-0) — Корпус та посібник зі збирання з БЖ Mean Well. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wc4yza/anyone_have_experience_with_this_industrial_style/).
- [Nexus case](https://makerworld.com/models/2941435) — Друкований корпус зі збірки Girly Case. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1vwqwgi/update_girly_case/p5j5vs1/).
- [Minimalistic SFX Case](https://makerworld.com/es/models/3112334-bc-250-minimalistic-case-sfx-psu) — БЖ SFX, магнітні панелі та внутрішній USB-хаб. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wr1fgv/another_bc250_case_feedback_needed/pc9ubk1/).
- [Cub Ice BC250 AIO Case](https://makerworld.com/en/models/3147502-cub-ice-bc250-aio-case) — Корпус сімейства Animal Technology з рідинним охолодженням. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wu87jm/these_things_are_great_fun_my_first_build/pd11hlo/).
- [Animal Technology Cub Ice 240](https://makerworld.com/en/models/3171320-animal-technology-cub-ice-240) — Корпус під AIO 240 мм із завершеної збірки. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wh7nle/most_recent_build_with_animal_technologies_cub/).
- [Animal Technology Cub Evo](https://makerworld.com/en/models/3185152-animal-technology-cub-evo-case) — Інший корпус сімейства Cub. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wdu2tk/bc250_auto_tuner_mcp_for_better_performance/p99ni3c/).
- [Detachable-panel BC250 case](https://makerworld.com/models/3239776) — Знімні магнітні панелі з власним оформленням. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1w2l7hy/ive_given_it_a_go_as_well_with_detachable_panels/).
- [ONE BC250 Case v2](https://makerworld.com/en/models/3341353-one-bc-250-case-ver-2-0) — Оновлений корпус із сумісними панелями; збережена початкова версія. Повʼязані файли / версія: [makerworld.com/3162439](https://makerworld.com/en/models/3162439-one-bc-250-case). [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wmz2al/i_finished_the_redesign_on_my_original_case/).
- [SFX PSU case with toggle switch](https://makerworld.com/models/3352182) — Опублікований корпус для БЖ SFX. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wn6ziq/my_sfxpsu_case_kinda_big_but_it_has_fancy_tumbler/).
- [MG3DPrints Monolithic Custom Case](https://makerworld.com/en/models/3361205-bc250-monolithic-custom-case) — Магнітні панелі, варіанти БЖ/охолодження та вертикальна підставка. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wyn368/build_underway/).
- [Cub Ice compact variant](https://makerworld.com/models/3373641) — Опублікований компактний варіант, для якого заявлено друк на A1 Mini. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wtlpav/cub_ice_comp/).
- [Minimal Case for BC250 and Flex PSU](https://www.printables.com/model/1423572-minimal-case-for-bc250-and-flex-psu) — Корпус під Flex-БЖ із запиту на друк. [Обговорення](https://www.reddit.com/r/3Dprintmything/comments/1qc1w2l/usca_custom_case_for_bc250/).
- [NexGen3D DIY Steam Machine](https://www.printables.com/model/1499974-nexgen3d-diy-steam-machine-powered-by-bazzite) — Початковий корпус із повітряним охолодженням; збережений поруч із Redux. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wg6y08/us_125_all_in_one_case_would_people_be_interested/p9ukjun/).
- [NexGen3D Redux](https://www.printables.com/model/1649679-nexgen3d-diy-steam-machine-redux-edition) — Продовження початкового корпусу DIY Steam Machine. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1w870ln/case_advice/p80lny0/).
- [NexGen3D Steam Machine Pro](https://www.printables.com/model/1614131-nexgen3d-diy-steam-machine-pro-liquid-cooled-bc-25) — Рання версія корпусу Pro з рідинним охолодженням. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1v2cc14/liquidcooled_amd_bc250_build_on_cachyos_need/).
- [NexGen3D Steam Machine Pro v2](https://www.printables.com/model/1793043-nexgen3d-diy-steam-machine-pro-v2-liquid-cooled-bc) — Продовження Pro з рідинним охолодженням та спільною документацією на GitHub. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wlckfe/bios_just_flashed_but_now_there_is_no_boot_and_a/).
- [ATX PSU Bazzite Box](https://www.printables.com/model/1550729-bc-250-atx-psu-bazzite-box) — Корпус із повнорозмірним БЖ ATX. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1ue60l7/joining_the_fold_took_over_the_project_from_a/).
- [ATX PSU Fan-Duct Case](https://www.printables.com/model/1616167-amd-bc-250-case-atx-psu-fan-duct) — Корпус із повітроводом, що зберігає штатний радіатор у наведеній збірці. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1v7ptxz/bc250_double_fan_shroud_no_heatsink_mod_build/).
- [Minimalist BC250 Case](https://www.printables.com/model/1581724-minimalist-bc-250-case) — Компактний корпус із боковим вентилятором для тильного боку за обговоренням. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1w870ln/case_advice/).
- [Kacikor internal-PSU dual-140 mm case](https://www.printables.com/model/1599644-bc-250-case-internal-psu-2x-140mm-fans) — Основа тематичного реміксу Avatar/RDA із вбудованим БЖ та двома вентиляторами 140 мм. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wl4ann/avatar_rda_inspired_case_almost_finished/).
- [MrLarva Steam Machine Case](https://www.printables.com/model/1618501-asrock-bc-250-case-steam-machine-by-mrlarva) — Друкований корпус із власним переліком деталей та збиранням. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1u2wtk9/newcomer_to_this_diy_steam_machine/).
- [Ultra-thin BC250 Case](https://www.printables.com/model/1626501-ultra-thin-amd-bc-250-custom-case) — Історичний бета-проєкт; автор реміксу повідомив про недостатнє охолодження двома малими вентиляторами. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1uoimdp/slim_case/).
- [Quiet Case with Tower Cooler](https://www.printables.com/model/1652979-bc-250-quiet-case-tower-cooler) — Корпус для збірки з баштовим кулером. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1vdl44f/bc250_tower_cooler_setup_pa120_se_am4am5_brackets/p1b52y9/).
- [nyacom Industrial Style Flex-ATX Case](https://www.printables.com/model/1737913-nyacoms-amd-bc-250-industrial-style-case-for-flexa) — Корпус у промисловому стилі; є завершені збірки та обговорення проблем із температурами. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wyq4bi/150_steam_gaming_pc_the_steam_engine_asrock_bc250/).
- [The Lanboy](https://www.printables.com/model/1746364-the-lanboy-a-bc250-portable-arcade-machine) — Портативний аркадний корпус з екраном ноутбука, динаміками та списком деталей. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1ut4ubl/my_bc250_build_with_tower_cooler/).
- [Xbox Series X BC250 Edition](https://www.printables.com/model/1748271-xbox-serie-x-bc-250-edition) — Корпус у формі консолі з кількома запланованими конфігураціями. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1u47ody/xbox_series_x_bc250_edition/).
- [BC250 meets DeepCool CH160 Plus](https://www.printables.com/model/1771269-bc250-meets-deepcool-ch160-plus) — Друковані деталі встановлення у серійний корпус CH160 Plus. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wqnlir/i_have_finally_ascended_bros/).
- [The GabeTube](https://www.printables.com/model/1773763-bc250-case-the-gabetube) — Корпус під SFX для тумби завглибшки 40 см, повʼязаний із контролером живлення ESP32. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1uoxbp8/the_gabetube_a_case_for_performance_and_looks/).
- [MakerBeam XL BC250 Case](https://www.printables.com/model/1797470-bc250-makerbeam-xl-case) — Збірка з рідинним охолодженням на профільній рамі, друковані панелі та список деталей. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wf5bnw/my_bc250_build/).
- [Three-P12 HP PSU Case](https://www.printables.com/model/1806883-bc250-case-for-three-p12-fans-and-hp-flex-slot-or) — Корпус із трьома P12 під варіанти БЖ HP Common Slot та Flex Slot. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wj5guu/a_few_questions_as_i_begin_my_build/pafzgmt/).
- [BC250 Case 1810935](https://www.printables.com/model/1810935-bc-250-case) — Опублікований друкований корпус, оголошений на Reddit. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1vpmhfh/case_released/).
- [Mean Well LRS-350-12 Chassis](https://www.printables.com/model/1826452-bc-250-meanwell-lrs-350-12-chassis) — Незавершений корпус; конфігурація охолодження ще розроблялася. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1w23uw9/wip_chassis_for_bc250_and_meanwell_lps35012/).
- [Compact 6.5 L / 5.4 L Cases](https://www.printables.com/model/1829356-asrock-amd-bc-250-cases-65l-54l) — Два компактні варіанти корпусу зі спільним посібником. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wk04wh/is_this_build_worth_it_and_is_it_missing_anything/).
- [Old Lamer Steam Box 5](https://www.printables.com/model/1831900-steam-box-5-by-old-lamer-vertical-case-for-amd-bc) — Вертикальний корпус, запропонований як альтернативне компонування. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wn9ism/i_just_bought_a_bc250_its_coming_in_the_mail_soon/pbd8zjd/).
- [Tower Case with 280 mm AIO and ATX PSU](https://www.printables.com/model/1832699-bc250-tower-case-xbox-series-x-ch270-inspired-atx) — На момент оголошення — ще не надрукований концепт; рендери не є перевіреною збіркою. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wgk4p0/concept_stacked_case_for_the_bc250_and_atx_psu/pa1o58w/).
- [Horizontal Clamshell Case](https://www.printables.com/model/1832744-amd-bc250-case-clamshellhorizontal-style-with-inte) — Повʼязаний горизонтальний концепт з опублікованою моделлю. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1w77ws6/vertical_case_project_another_case_design/).
- [Modular Panel Case 7.17 L / 8.65 L](https://www.printables.com/model/1852640-717-litre-or-865-litre-modular-panel-case-for-bc-2) — Корпус зі змінними панелями під Thermalright AXP120-X67; обговорюються варіанти під більші кулери. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1woqg1e/bc250_case_vans_shoes_box_theme/pbtvk1h/).
- [JF13K Case](https://www.printables.com/model/1865220-bc-250-jf13k-case) — Корпус та складальний посібник, повʼязані з кріпленням AM5 і контролером ESP32. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wx7ljs/my_build_is_now_complete/).
- [5 L HP Server PSU Case](https://cults3d.com/en/3d-model/gadget/amd-bc250-case-5l-hp-server-psu-case) — Одновентиляторний корпус під БЖ HP HSTNS та тильний радіатор. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1vo1xzu/bc250_case/).
- [ATX Steam Machine Case](https://cults3d.com/en/3d-model/gadget/bc-250-atx-case-steam-machine) — Модель під ATX з обговорення запланованої збірки. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1vzwl5r/need_some_guidance_for_my_build/).
- [Kapa3D Gamer Case](https://cults3d.com/en/3d-model/tool/amd-bc-250-gamer-case) — Платна модель; в обговоренні запитується досвід збирання. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1viuua0/anyone_tried_this_kapa3d_case/).
- [BC250 Steam Case (Cults 4890589)](https://cults3d.com/:4890589) — Модель корпусу, оголошена в r/cults3d. [Обговорення](https://www.reddit.com/r/cults3d/comments/1wiseaq/bc250_steam_case/).
- [Arthrimus BC250 Case](https://www.thingiverse.com/thing:7172528) — Друкований корпус; у звіті є проблеми зі збігом розмірів БЖ. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1vhgi9m/problems_with_my_bc250_build/).
- [BC250 Case 7201620](https://www.thingiverse.com/thing:7201620) — Основа збірки Alien Machine із двома P12. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wa66be/alien_machine/).
- [BC250 Case 7245584](https://www.thingiverse.com/thing:7245584) — Компонування з одним або двома вентиляторами та тильним повітроводом з обговорення. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1w870ln/case_advice/).
- [BC250 Case 7262228](https://www.thingiverse.com/thing:7262228) — Корпус із питання про сумісність із серверним БЖ HP; відповідність розмірів не встановлена. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wiqr0v/3d_print_case_hp_server_psu/).
- [NexGen-3D-Printing/SteamMachine](https://github.com/NexGen-3D-Printing/SteamMachine) — Спільні вихідні матеріали, складальні посібники та обговорення сімейства корпусів і кріплень NexGen3D, зокрема різних поколінь Pro та Redux. [Версія на дату перевірки](https://github.com/NexGen-3D-Printing/SteamMachine/tree/c6ae5d4aef42927a7e126f2c24051fc35d94d5fa).

<a id="parts"></a>
## Кріплення, повітроводи та CAD плати

- [ITX Mount](https://makerworld.com/en/models/2533826-amd-bc-250-itx-mount) — Адаптер встановлення в корпуси ITX. [Обговорення](https://www.reddit.com/r/3DDruck/comments/1wv1tcf/kennt_jemand_einen_sehr_günstigen_3d_druck/).
- [AM4/AM5 Cooler Mount](https://makerworld.com/pl/models/2596083-bc-250-am4-5-cpu-cooler-mount) — Кріплення кулера з вихідним файлом FreeCAD. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1woy8kf/metalfish_t60_aio_build/).
- [Isaac Alves Open Test Bench](https://makerworld.com/models/2665910) — Відкрита підставка та тестовий стенд для плати. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1w2vcxt/got_modded_bios_and_bazzite_installed_now_i_need/p6vnltp/).
- [Tool-less Micro-Fit Bracket v2](https://makerworld.com/en/models/3370801-microfit-3-0-bracket-ver-2-0-tool-less) — Фіксатор без термовставок; збережено посилання на першу версію. Повʼязані файли / версія: [makerworld.com/3149892](https://makerworld.com/en/models/3149892-microfit-3-0-bracket-for-bc-250). [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wt1bj9/i_updated_my_microfit_30_bracket_now_its_tool_less/).
- [BC250 to AMD CPU Cooler Mount](https://www.printables.com/model/1042228-bc250-to-amd-cpu-cooler-mount) — Ранній адаптер кріплення кулера AMD. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1vp39dy/am4_mounting_bracket/).
- [DeepCool AG/AK Bracket Adapter](https://www.printables.com/model/1544540-bc250-deepcool-ag-ak-bracket-adapter) — Адаптер баштового кулера зі збірки CH160 Plus. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wqnlir/i_have_finally_ascended_bros/).
- [NexGen3D AIO Mount](https://www.printables.com/model/1554003-nexgen3d-aio-mount-for-the-bc-250) — Початкове кріплення AIO, збережене поруч із продовженням v2. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wdc7c5/watercooled_bc250_options_jonsbo_z20_case/).
- [NexGen3D AIO Mount v2](https://www.printables.com/model/1782473-nexgen3d-version-2-aio-mount-for-the-bc-250) — Кріплення другого покоління з друкованими файлами та переліком деталей. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1vl3u9k/nexgen3d_aio_mount_installation_guide/p30d7df/).
- [BC250 CPU Cooler Mount 1574416](https://www.printables.com/model/1574416-amd-bc-250-with-cpu-cooler) — Модель кріплення, повʼязана з білою версією JF13K. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1w81ug9/jf13k_heads_up_brackets_are_different_between/).
- [Gadget BC250-to-ATX Case Adapter](https://www.printables.com/model/1743485-bc250-to-atx-case-adapter) — Адаптер встановлення плати у серійні корпуси. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1whdos5/reviving_an_old_case_with_a_bc250/).
- [Micro-Fit Holder/Clip](https://www.printables.com/model/1760393-bc250-microfit-holderclip) — Фіксатор розʼємів живлення плати. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wma8i3/microfit_connectors_and_clips/).
- [Arctic Liquid Freezer III Mount](https://www.printables.com/model/1763936-artic-liquid-freezer-mount-for-bc250) — Кріплення помпи; у джерелі зазначені ABS/ASA, вставки та гвинти. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1w755cn/help_finding_a_3d_printable_case_for_a1_dual_240mm/p7te550/).
- [Blower Fan Shroud](https://www.printables.com/model/1778769-blower-fan-shroud-for-bc250) — Повітровід для відцентрового вентилятора, запропонований для збірки BC250. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wavxdj/the_biggest_update_yet_to_my_case/p8lbtfo/).
- [NexGen3D Micro-Fit BMI Retainer](https://www.printables.com/model/1785063-nexgen3d-micro-fit-bmi-retainer-for-the-bc-250) — Друкований тримач стикувальних розʼємів живлення Micro-Fit. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wtz1c6/made_30_sets_of_custom_bc250_power_cables_sharing/).
- [Dual-120 mm Blower Support](https://www.printables.com/model/1800002-bc250-cooling-with-two-12cm-blowers) — Опублікована STEP-підставка для експерименту з двома відцентровими вентиляторами. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1vfdryu/new_casecooling_idea_for_extreme_performance/p1o89c6/).
- [Intel-block AIO Adapter](https://www.printables.com/model/1812674-bc-250-watercooler-aio-mount-intel-block-adapter) — Адаптер кріплення блоків AIO у стилі Intel. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1vzaqxp/any_aio_adapter_work_with_thermalright_elite_v6/).
- [BC250 Test Bench](https://www.printables.com/model/1822419-bc250-test-bench) — Відкрита підставка з варіантами задньої панелі під ATX та Flex-ATX. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1vxuanq/a_test_bench_for_the_bc250/).
- [AM5 CPU Cooler Mount](https://www.printables.com/model/1826539-am5-cpu-cooler-mount-for-the-bc250) — Кріплення, використане з чорним JF13K; кронштейни чорної та білої версій відрізняються. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wx7ljs/my_build_is_now_complete/).
- [Complete-ish BC250 CAD Model](https://www.printables.com/model/1828755-asrock-bc250-complete-ish-cad-model) — Модель плати, ключових компонентів та радіатора; автор не заявляє точної відповідності 1:1. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1w96ok9/bc250_more_detailed_cad_model/).
- [JF13K Mount with VRM Airflow Guides](https://www.printables.com/model/1837210-bc-250-mount-for-jiushark-jf13k-vrm-airflow-direct) — Незавершене кріплення; автор просить спільноту перевірити друк та посадку. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wbfn1e/need_help_bc250_mount_for_jiushark_jf13k_with_vrm/).
- [SickBC250 Simple Bench Support](https://www.printables.com/model/1850840-sickbc250) — Проста друкована підставка для відкритої збірки BC250. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wn5d9y/amd_bc_250_simple_bench_support/).
- [Arthrimus Rear-Fan Modification](https://www.thingiverse.com/thing:7271946) — Модифікація корпусу Arthrimus для окремого вентилятора памʼяті ззаду. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wnjsc7/arthrimus_case_single_vs_dual_fan_shroud/pbgnqi6/).
- [Simple BC250 I/O Shield](https://www.thingiverse.com/thing:7402167) — Друкована заглушка панелі розʼємів. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1w1noj8/heres_my_simple_io_shield/).
- [Black-JF13K Mount Remix](https://www.thingiverse.com/thing:7402291) — Ремікс кріплення AM5 зі зміненими опорами та отворами під термовставки. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1w81ug9/jf13k_heads_up_brackets_are_different_between/).

<a id="builds"></a>
## Окремі збірки та незавершені проєкти

- [mosfet.party Case 1 prototype](https://www.reddit.com/r/BC250Gaming/comments/1w9gc9f/case_1_by_mosfetparty_prototype_reveal/) — Прототип на профільній рамі з магнітними панелями, FSP500 та вбудованим живленням. CAD/STL у переглянутому обговоренні не опубліковані.
- [Project Steampipe](https://www.reddit.com/r/BC250Gaming/comments/1wmdp9e/steam_pipe_vertical_case_updatefinal/) — Завершений вертикальний циліндричний корпус; автор пропонує поділитися STL, але публічного посилання в обговоренні не знайдено.
- [Sheet-metal / printed-backbone concept](https://www.reddit.com/r/BC250Gaming/comments/1wuqf7c/case_design/) — Авторський CAD-концепт із вибором між листовим металом та повністю друкованим корпусом; рендери за допомогою AI не доводять готової збірки.
- [HL2/Cyberpunk-inspired frame](https://www.reddit.com/r/BC250Gaming/comments/1wr1fgv/another_bc250_case_feedback_needed/) — Концепт рами під Mean Well UHP-350-12; публікація CAD обіцяна, але посилання в обговоренні відсутнє.
- [Avatar/RDA themed build](https://www.reddit.com/r/BC250Gaming/comments/1wl4ann/avatar_rda_inspired_case_almost_finished/) — Індивідуальний ремікс корпусу Kacikor із магнітними аксесуарами та екраном стану; початкову модель наведено окремо. Повʼязані файли / версія: [Base case](https://www.printables.com/model/1599644-bc-250-case-internal-psu-2x-140mm-fans).
- [Xbox One S Fan-Shroud Reuse](https://www.reddit.com/r/BC250Gaming/comments/1wgo0pq/xbox_one_s_cpu_fan_shroud_is_almost_perfect/) — Перероблення фізичного повітроводу Xbox One S; полярність та розпіновка відрізняються, це не завантажувана 3D-модель.

<a id="upscaling"></a>
## FSR4, HelixSR на основі DLSS та генерація кадрів

- [lonewolf0622/HelixSR](https://github.com/lonewolf0622/HelixSR) — Неофіційна реконструкція DLSS Model E через інтерфейс FSR 3.1 та обчислення D3D12, зокрема Proton. Це не нативна підтримка NVIDIA DLSS; вихідний код апскейлера не опублікований. [Версія на дату перевірки](https://github.com/lonewolf0622/HelixSR/tree/a635fa92b08022426702a45255042e62a778c130).
- [daniel-h-0/bc250-fsr4-fork](https://github.com/daniel-h-0/bc250-fsr4-fork) — Продовження dmorazasanchez/bc250-fsr4: оптимізації INT8 перенесено в переносну DLL FidelityFX; є встановлювач на основі OptiScaler Client для BC250. [Версія на дату перевірки](https://github.com/daniel-h-0/bc250-fsr4-fork/tree/528f13b17e48bfba5b153f17ec4ebdfb3afa5bcb).
- [dmorazasanchez/bc250-fsr4](https://github.com/dmorazasanchez/bc250-fsr4) — Експериментальна робота з графічним шляхом FSR4/INT8 на BC-250. [Версія на дату перевірки](https://github.com/dmorazasanchez/bc250-fsr4/tree/fd4e9dc760241f61e5fe5c77b1cd5ef862b82134).
- [Schaka/fsr4-gfx803](https://github.com/Schaka/fsr4-gfx803) — Суміжна робота з проріджування моделі FSR4 для Polaris/gfx803, заснована на продовженні BC250 FSR4; не твердження про підтримку BC250. [Версія на дату перевірки](https://github.com/Schaka/fsr4-gfx803/tree/407d67cfab54c2b641f329c844683f197fa13f72).
- [blackbearreloaded/ps5-fsr4](https://github.com/blackbearreloaded/ps5-fsr4) — Демонстрація та SDK FSR4 для PS5 на основі проєктів BC250. Суміжне продовження, а не мод для впровадження у звичайні ігри PS5. [Версія на дату перевірки](https://github.com/blackbearreloaded/ps5-fsr4/tree/7fe9ec2273629e8ac1938a58249b1983a19fff3f).
- [optiscaler/OptiScaler](https://github.com/optiscaler/OptiScaler) — Ігровий адаптер, що перенаправляє вхідні дані DLSS, XeSS та FSR до інших апскейлерів; окремий від настільного Client та самої моделі реконструкції.
- [PancakeTAS/lsfg-vk](https://github.com/PancakeTAS/lsfg-vk) — Інтеграція генерації кадрів Lossless Scaling у Linux через Vulkan; в обговоренні BC250 розглядається використання з Decky.
- [OptiScaler Client](https://github.com/Optiscaler-Client/Optiscaler-Client) — Початковий настільний менеджер, використаний встановлювачем BC250 FSR4; окремий проєкт, не ігровий адаптер OptiScaler.
- [OptiPatcher](https://github.com/optiscaler/OptiPatcher) — Плагін сумісності вхідних даних, зазначений у продовженні BC250 FSR4.
- [Lossless Scaling](https://store.steampowered.com/app/993090/Lossless_Scaling/) — Комерційна програма масштабування та генерації кадрів, обговорювана для BC250; lsfg-vk — окремий проєкт інтеграції в Linux. [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1vh2dkc/lossless_scaling_on_steam/).

<a id="software"></a>
## Утиліти, дистрибутиви та керування системою

- [MTSistemi/SkillFishOS](https://github.com/MTSistemi/SkillFishOS) — Проєкт дистрибутива й образів із підтримкою BC250 для ігор. Його налаштування слід відрізняти від початкового Bazzite та інших дистрибутивів. [Версія на дату перевірки](https://github.com/MTSistemi/SkillFishOS/tree/4d7604765aa311467d6aa081539323122a075f53).
- [movacx/bc250-control-center](https://github.com/movacx/bc250-control-center) — GUI Linux для моніторингу, налаштування SMU/CPU, PWM вентиляторів і роботи з CU.
- [redbeard1083/bc250-toolkit](https://github.com/redbeard1083/bc250-toolkit) — Меню встановлення й налаштування BC250 у Linux, згадане в обговореннях збірок CachyOS та SteamOS.
- [rpf16rj/bc250-steamos-real-toolkit](https://github.com/rpf16rj/bc250-steamos-real-toolkit) — Встановлення й інтеграція утиліт SteamOS.
- [keyboardspecialist/bc250-steamos](https://github.com/keyboardspecialist/bc250-steamos) — Встановлення й інтеграція утиліт SteamOS.
- [tmghd272/bc250-batocera-tools](https://github.com/tmghd272/bc250-batocera-tools) — Утиліти налаштування Batocera на BC-250.
- [TesseractCat/bc250-nixos](https://github.com/TesseractCat/bc250-nixos) — Конфігурація NixOS або Nix flake для підтримки BC-250.
- [62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images](https://github.com/62fixolab/Latest-Bazzite-AMD-BC-250-Patched-Images) — Проєкт готових образів Bazzite Deck/GNOME/KDE з інтеграцією патчів BC-250.
- [bandlayash/bc250-autotune](https://github.com/bandlayash/bc250-autotune) — Інтерфейс MCP для телеметрії й налаштування з механізмом watchdog завантаження.
- [lethevimlet/lethe-bc250](https://github.com/lethevimlet/lethe-bc250) — Проєкт керування живленням та налаштуваннями з Decky й вебзастосунком, зокрема програмним вимкненням та псевдосном.

<a id="drivers"></a>
## Драйвери, BIOS та дослідження CPU

- [amethyst8118/MetalCyan](https://github.com/amethyst8118/MetalCyan) — Плагін Lilu з патчами драйверів Apple для Metal на BC250; розрахований на macOS Tahoe 26.7.1/MacPro7,1. У README описані обмеження відео/звуку, вимкнення та відновлення GPU. [Версія на дату перевірки](https://github.com/amethyst8118/MetalCyan/tree/4382dfa9daad77c6b83bcae0ae658a0e1015071d).
- [mendesrr/bc250-acpi-fix-updated-8c](https://github.com/mendesrr/bc250-acpi-fix-updated-8c) — Адаптація таблиць ACPI для восьми ядер, згадана в обговореннях налаштування. Запис не означає обовʼязковості для всіх ОС чи справності розблокованих ядер. [Версія на дату перевірки](https://github.com/mendesrr/bc250-acpi-fix-updated-8c/tree/83686c4670f29316bc4c396a9bda75281327a5e3).
- [jao-marcello/bc250-core-unlock-0x7E](https://github.com/jao-marcello/bc250-core-unlock-0x7E) — Адаптація скрипту розблокування CPU для маски 0x7E; автор окремо зазначає, що вимкнені ядра можуть бути несправними. [Версія на дату перевірки](https://github.com/jao-marcello/bc250-core-unlock-0x7E/tree/b765ae542e7f6d1bed8e650b5e399055725dd0a0).
- [ProcessorAutomaticUtility](https://gitlab.com/gmb8281-linux/ProcessorAutomaticUtility) — Утиліта розблокування CPU BC250 після завантаження, опублікована на GitLab; підстава включення — оголошення проєкту, а не локальний тест плати.
- [Dream-Cypher/bc250-memory-timing-boot-fix](https://github.com/Dream-Cypher/bc250-memory-timing-boot-fix) — Експеримент налаштування таймінгів памʼяті під час завантаження для періодичної відсутності POST.
- [DryhoppedIPA/bc250-gfx1013-fix](https://github.com/DryhoppedIPA/bc250-gfx1013-fix) — Набір патчів черг обчислень ядра та Mesa/RADV, включно з роботою з INT8.
- [tri3gubki-ops/bc250-async-compute-bazzite](https://github.com/tri3gubki-ops/bc250-async-compute-bazzite) — Розгортання окремого патченого драйвера RADV на Fedora atomic/Bazzite.
- [vogar345/Bc250-radeon-patch](https://github.com/vogar345/Bc250-radeon-patch) — Дослідження сумісності й графічні патчі Final Fantasy VII Rebirth.
- [bangstk/Vulkan_NullVRS](https://github.com/bangstk/Vulkan_NullVRS) — Обгортка Vulkan для обходу вимог variable rate shading у Doom: The Dark Ages на BC250.
- [Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script](https://github.com/Forbidden-Darkness/AMD-BC-250-UEFI-v2.2-Firmware-Menu-Script) — Скрипт меню резервного копіювання й прошивання на основі модифікованого P3.00.
- [coderredlab/bc250-8core-unlock](https://github.com/coderredlab/bc250-8core-unlock) — Образ розблокування восьми ядер для плат із P3.00, із контрольними сумами та відкатом за джерелом; справність ядер залежить від плати.
- [Expired-Pasta/AMD_BC250_BIOS_Reprogramming_MX25L12872F](https://github.com/Expired-Pasta/AMD_BC250_BIOS_Reprogramming_MX25L12872F) — Відновлення й перепрограмування BIOS на мікросхемі MX25L12872F.

<a id="streaming"></a>
## Стримінг, програмне декодування та compute-кодування

- [grykom/moonlight-qt-bc250](https://github.com/grykom/moonlight-qt-bc250) — Форк клієнта Moonlight із вибором кількості потоків програмного декодування та експериментальним пакетом Arch/CachyOS. Не вмикає апаратний декодер VCN. [Версія на дату перевірки](https://github.com/grykom/moonlight-qt-bc250/tree/ceb67ce0dde619054d513706c829f8715ce1b6a3).
- [Shalasere/bc250-vulkan-encode-stopgap](https://github.com/Shalasere/bc250-vulkan-encode-stopgap) — Кодувальник VA-API на Vulkan compute та CPU, окремо виправляє тактування звуку. Описані конкуренція з грою за GPU та незавершені шляхи HEVC; це не ввімкнення VCN. [Версія на дату перевірки](https://github.com/Shalasere/bc250-vulkan-encode-stopgap/tree/732dfb57dda4e08c4b31d95039e99dc232d0a809).
- [simpmix/bc250-encoding-decoding-fix](https://github.com/simpmix/bc250-encoding-decoding-fix) — Робота над VA-API кодеками на CPU/compute; спільні файли не дають незалежного підтвердження стану VCN.
- [Themaister/pyrowave](https://github.com/Themaister/pyrowave) — Універсальний відеокодек на Vulkan compute, обговорюваний як альтернативний шлях стримінгу. Допис не доводить готової інтеграції або сумісності BC250 з усіма клієнтами. [Версія на дату перевірки](https://github.com/Themaister/pyrowave/tree/c0b997f84ced7bd827ca737aa5145f4ec811de8d).

<a id="power"></a>
## Контролери БЖ та увімкнення від геймпада

- [GreatApo/BC250_ESP32_ATX_PSU](https://github.com/GreatApo/BC250_ESP32_ATX_PSU) — Контролер живлення ATX на ESP32 з увімкненням через BLE/Bluetooth, вебінтерфейсом та HTTP API; увімкнення залежить від поведінки геймпада. [Версія на дату перевірки](https://github.com/GreatApo/BC250_ESP32_ATX_PSU/tree/61405267a2b2852f8c5607aa7dcd6dd4658bd4dc).
- [Arduino Pro Micro ATX switch](https://gist.github.com/mkarr/f1f077d6a651d971e3b63fd3caf9c6fb) — Контролер БЖ із кнопкою без фіксації, сигналом стану плати та відстеженням програмного вимкнення; вихідний код опубліковано в Gist.
- [ChokunPlayZ/BC-250-Ctrl](https://github.com/ChokunPlayZ/BC-250-Ctrl) — Прошивка контролера живлення ESP32 із призначенням GPIO, телеметрією БЖ HP та інтеграцією Zigbee, описаними у збірці.
- [christianbemerson/bc250-bluetooth-controller](https://github.com/christianbemerson/bc250-bluetooth-controller) — Контролер увімкнення через BLE на ESP32-C3 із черговим живленням та сигналом стану плати; потрібен відповідний режим оголошення геймпада.
- [aleksejspopovs/bc250-power](https://github.com/aleksejspopovs/bc250-power) — Плата керування живленням на Pico з HDMI-CEC та увімкненням від Steam Controller через перемикання USB.
- [Thunkar/bc250-esp32-switch](https://github.com/Thunkar/bc250-esp32-switch) — Контролер БЖ та увімкнення через Bluetooth на ESP32-C3, повʼязаний із корпусом The GabeTube.
- [tfabris/BC-250](https://github.com/tfabris/BC-250) — Консольна збірка Bazzite/Steam із друкованими деталями, кодом і посиланнями.
- [PS250 direct-PSU Pico bridge](https://www.reddit.com/r/BC250Gaming/comments/1wtlfmr/ps250_a_small_but_powerfull_device_that_unlocks_a/) — Прототип Pico 2 з увімкненням від геймпада та прямим керуванням ATX на основі SundayMoments/DS5_Bridge. В оголошенні немає посилання на опублікований власний форк. Повʼязані файли / версія: [Upstream bridge](https://github.com/SundayMoments/DS5_Bridge).

<a id="monitoring"></a>
## Датчики, LED-панелі та екрани стану

- [rpf16rj/steamos-led-bar-release](https://github.com/rpf16rj/steamos-led-bar-release) — Зовнішня LED-панель ESP8266/WS2812, повʼязана з персоналізацією ігрового режиму; окремий проєкт, не шкала прогресу завантажень. [Версія на дату перевірки](https://github.com/rpf16rj/steamos-led-bar-release/tree/1be0b79f77ef2bd6c43606e3662997cae3dd0ae8).
- [mathoudebine/turing-smart-screen-python](https://github.com/mathoudebine/turing-smart-screen-python) — Універсальне ПЗ для USB-екрана стану, використане у збірці BC250; сумісність залежить від конкретного екрана та ОС. [Версія на дату перевірки](https://github.com/mathoudebine/turing-smart-screen-python/tree/2b33ab4f00a096916dd6a1174441a53a7ec33b03).
- [AkPuLk0/BC250---Led-Progress](https://github.com/AkPuLk0/BC250---Led-Progress) — Світлодіодний індикатор завантажень і передавання файлів через контролер Corsair Commander.

<a id="peripherals"></a>
## Геймпади, USB-звук, мережа та накопичувачі

- [awalol/DS5Dongle](https://github.com/awalol/DS5Dongle) — Проєкт донгла DualSense, застосований у збірці BC250 для геймпада, тачпада та звуку. [Версія на дату перевірки](https://github.com/awalol/DS5Dongle/tree/c67c7f685fe8d8cc44f519d27710c5a639a1be7d).
- [kungaa/DS5-Linux-Bridge](https://github.com/kungaa/DS5-Linux-Bridge) — Linux-версія мосту DualSense з Decky, звуком, тактильною віддачею та функціями ввімкнення. Її спосіб увімкнення відрізняється від прямого керування БЖ. [Версія на дату перевірки](https://github.com/kungaa/DS5-Linux-Bridge/tree/1e15ea2d47d302437580c3b13850ec937cbc1c88).
- [SundayMoments/DS5_Bridge](https://github.com/SundayMoments/DS5_Bridge) — Початковий міст DualSense, названий основою PS250. Це посилання не є самим ще не опублікованим форком PS250. [Версія на дату перевірки](https://github.com/SundayMoments/DS5_Bridge/tree/5ee08e0984085c99eac5afe14c05f572b6e9dc59).
- [dlugi152/OGX-Mini-2026](https://github.com/dlugi152/OGX-Mini-2026) — Універсальна прошивка Pico для контролерів і донгла, запропонована в обговоренні BC250; суміжна альтернатива, а не перевірений спосіб увімкнення BC250. [Версія на дату перевірки](https://github.com/dlugi152/OGX-Mini-2026/tree/86a6273d50354f51ef821a4620d49d945b787c78).
- [rpf16rj/usb_sound_card_with_pico-master](https://github.com/rpf16rj/usb_sound_card_with_pico-master) — Проєкт USB-звукової карти, використаний замість звуку DP/HDMI у збірці BC250 зі SteamOS. [Версія на дату перевірки](https://github.com/rpf16rj/usb_sound_card_with_pico-master/tree/704ed6e8c507cdb076836bb62ce59277cecfa7aa).
- [morrownr/USB-WiFi](https://github.com/morrownr/USB-WiFi) — Списки USB WiFi та Bluetooth із драйверами в ядрі Linux зі звіту про налаштування BC250; не рекомендація безіменного донгла. [Версія на дату перевірки](https://github.com/morrownr/USB-WiFi/tree/8bd0207d19dfdf1365400ffd0af0639d7a973d66).
- [NVMe + SATA M.2 adapter proposal](https://www.reddit.com/r/BC250Gaming/comments/1w24oip/m2_dual_ssd_mod_simultaneous_nvme_sata/) — Адаптер CRImier для двох SSD розглядається для BC250; в обговоренні ставиться питання про сумісність, а не підтверджується встановлення. Повʼязані файли / версія: [Adapter PCB files](https://github.com/CRImier/MyKiCad/tree/master/Laptop%20mods/nvme_to_dual_ssd_hack).

<a id="compute"></a>
## Кластери LLM та стійки

- [4claps/bc250-llama-cluster](https://github.com/4claps/bc250-llama-cluster) — Розгортання розподіленого llama.cpp RPC на кількох BC-250 через Ansible.
- [LabRax Mini dual-BC250 rack](https://www.reddit.com/r/BC250Gaming/comments/1wf018l/labrax_mini_rack_for_dual_bc250_llm_rig/) — Незавершена стійка на дві плати для кластера llama.cpp RPC; код кластера доступний, але посилання на CAD стійки не знайдено. Повʼязані файли / версія: [Cluster project](https://github.com/4claps/bc250-llama-cluster).

## Суміжні посилання та нерозібрані кандидати

Не включені до кількості окремих проєктів BC250. Два безіменні посилання Cults запропоновані як варіанти корпусів, але моделі ще не ідентифіковані. Решта — універсальні деталі оформлення й охолодження, справді згадані у збірках BC250, а також недоступне історичне посилання на патч mesh shaders. Перероблення БЖ залишається роботою з електрикою, а не інструкцією зі встановлення.

- [cults3d.com/:4382063](https://cults3d.com/:4382063) · [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1w870ln/case_advice/).
- [cults3d.com/:4780379](https://cults3d.com/:4780379) · [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1w870ln/case_advice/).
- [printables.com/367734](https://www.printables.com/model/367734-120mm-angular-louvre-fan-grill) · [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1w23uw9/wip_chassis_for_bc250_and_meanwell_lps35012/).
- [printables.com/664926](https://www.printables.com/model/664926-mean-well-lrs-350-lid-for-120mm-fan) · [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1vrph6h/meanwell_12v_350w_unbearable_noisy/).
- [thingiverse.com/thing:4503364](https://www.thingiverse.com/thing:4503364) · [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1vrph6h/meanwell_12v_350w_unbearable_noisy/).
- [makerworld.com/1492898](https://makerworld.com/en/models/1492898-wood-grain-modifier-add-wood-grain-to-any-models) · [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wavxdj/the_biggest_update_yet_to_my_case/).
- [makerworld.com/460913](https://makerworld.com/en/models/460913-tanjiro-kamado-demon-slayer-hueforge) · [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wavxdj/the_biggest_update_yet_to_my_case/).
- [makerworld.com/3149496](https://makerworld.com/en/models/3149496-cyberpunk-edgerunners) · [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1wavxdj/the_biggest_update_yet_to_my_case/).
- [Historical mesh-shader driconf link](https://github.com/lonewolf0622/BC-250-Mesh-Shader-Patch---driconf-Edition-opt-in-per-application-) · [Обговорення](https://www.reddit.com/r/BC250Gaming/comments/1va5p14/cpu_core_unlock_spotted_in_the_wild/).
