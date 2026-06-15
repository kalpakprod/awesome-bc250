#!/usr/bin/env bash

# Автоматический перезапуск с sudo для чтения dmesg и debugfs
if [ "$EUID" -ne 0 ]; then
    exec sudo bash "$0" "$@"
fi

# 1. Пытаемся смонтировать debugfs на всякий случай
if ! mount | grep -q "debugfs"; then
    mount -t debugfs none /sys/kernel/debug/ 2>/dev/null
fi

# 2. Ищем файл amdgpu_cu_info
CU_INFO_PATH=$(find /sys/kernel/debug/dri/ -name "amdgpu_cu_info" | head -n 1)

# Значения по умолчанию для чипа BC-250
shader_engines=2
sh_per_se=2
cu_per_sh=10
total_cu=40
active_cu=24 # Значение по умолчанию, если dmesg тоже не ответит

# Попытка получить точное число активных CU из dmesg
dmesg_active=$(dmesg | grep -i "active_cu_number" | grep -oE "active_cu_number [0-9]+" | awk '{print $2}' | tail -n 1)
if [ -n "$dmesg_active" ]; then
    active_cu=$dmesg_active
fi

fallback_mode=false
if [ -z "$CU_INFO_PATH" ] || [ ! -f "$CU_INFO_PATH" ]; then
    fallback_mode=true
else
    # Если файл найден, берем структуру из него
    parsed_se=$(grep -i "number of shader engines" "$CU_INFO_PATH" | awk '{print $NF}')
    parsed_sh=$(grep -i "number of shader arrays per shader engine" "$CU_INFO_PATH" | awk '{print $NF}')
    parsed_total=$(grep -i "number of cu" "$CU_INFO_PATH" | head -n 1 | awk '{print $NF}')

    [ -n "$parsed_se" ] && shader_engines=$parsed_se
    [ -n "$parsed_sh" ] && sh_per_se=$parsed_sh
    [ -n "$parsed_total" ] && active_cu=$parsed_total
fi

echo "BC-250 CU Map"

# Рассчитываем, сколько CU должно быть активными на один Shader Array (SH)
# Для 24 активных блоков при 4 массивах (2 SE * 2 SH) получается по 6 блоков на массив
cu_per_sh_active=$((active_cu / (shader_engines * sh_per_se)))
[ $cu_per_sh_active -eq 0 ] && cu_per_sh_active=6 # Защита от деления на ноль

# Отрисовка карты блоков
for ((se=0; se<shader_engines; se++)); do
    for ((sh=0; sh<sh_per_se; sh++)); do
        visual_row=""

        if [ "$fallback_mode" = true ]; then
            # Генерируем строку: сначала активные '█', затем отключенные '░'
            for ((i=0; i<cu_per_sh; i++)); do
                if [ $i -lt $cu_per_sh_active ]; then
                    visual_row="${visual_row}█"
                else
                    visual_row="${visual_row}░"
                fi
            done
        else
            # Если debugfs файл есть, читаем битовую маску из ядра
            bitmap_line=$(grep -i "se $se, sh $sh" "$CU_INFO_PATH")
            hex_mask=$(echo "$bitmap_line" | grep -oE "0x[0-9a-fA-F]+")
            hex_val="${hex_mask#0x}"
            [ -z "$hex_val" ] && hex_val="3ff"
            dec_val=$((16#$hex_val))

            for ((i=0; i<cu_per_sh; i++)); do
                bit=$(( (dec_val >> i) & 1 ))
                if [ "$bit" -eq 1 ]; then
                    visual_row="${visual_row}█"
                else
                    visual_row="${visual_row}░"
                fi
            done
        fi

        printf "SE%d SH%d: %s\n" "$se" "$sh" "$visual_row"
    done
done

# Итоговый расчет и вывод
harvested_count=$((40 - active_cu))
[ $harvested_count -lt 0 ] && harvested_count=0

echo "${active_cu}/40 CUs active, ${harvested_count} harvested"
echo ""
