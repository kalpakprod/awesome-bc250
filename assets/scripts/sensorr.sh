#!/bin/bash

# ---------- CPU LOAD INIT ----------
read cpu user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat
PREV_IDLE=$((idle + iowait))
PREV_TOTAL=$((user + nice + system + idle + iowait + irq + softirq + steal))

# ---------- GPU PIPE ----------
amdgpu_top --json -s 300 -n 0 | jq -c '.devices[0]' | while read GPU; do

    # ---------- GPU LOAD (FIXED) ----------
    GPU_LOAD=$(echo "$GPU" | jq '
        if .gpu_activity.GFX.value != null then
            .gpu_activity.GFX.value
        else
            .GRBM["Graphics Pipe"].value
        end
    ')

    GPU_LOAD=${GPU_LOAD%.*}   # int

    # ---------- GPU TEMP ----------
    GPU_TEMP=$(echo "$GPU" | jq '.Sensors["Edge Temperature"].value // 0')
    GPU_TEMP=${GPU_TEMP%.*}

    # ---------- VRAM LOAD ----------
    VRAM_USED=$(echo "$GPU" | jq '.VRAM["Total VRAM Usage"].value // 0')
    VRAM_TOTAL=$(echo "$GPU" | jq '.VRAM["Total VRAM"].value // 1')
    VRAM_LOAD=$(( VRAM_USED * 100 / VRAM_TOTAL ))

    # ---------- CPU TEMP ----------
    CPU_TEMP=$(sensors | awk '/Tctl/ {gsub(/[+°C]/,"",$2); print int($2); exit}')

    # ---------- CPU LOAD ----------
    read cpu user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat
    IDLE=$((idle + iowait))
    TOTAL=$((user + nice + system + idle + iowait + irq + softirq + steal))

    DIFF_IDLE=$((IDLE - PREV_IDLE))
    DIFF_TOTAL=$((TOTAL - PREV_TOTAL))

    CPU_LOAD=$(( (100 * (DIFF_TOTAL - DIFF_IDLE)) / DIFF_TOTAL ))

    PREV_IDLE=$IDLE
    PREV_TOTAL=$TOTAL

    # ---------- RAM LOAD ----------
    MEM_TOTAL=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
    MEM_AVAIL=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
    RAM_LOAD=$(( (MEM_TOTAL - MEM_AVAIL) * 100 / MEM_TOTAL ))

    # ---------- OUTPUT ----------
    printf "CPU:%s°C %s%% | RAM:%s%% | GPU:%s°C %s%% | VRAM:%s%%\n" \
        "$CPU_TEMP" "$CPU_LOAD" "$RAM_LOAD" \
        "$GPU_TEMP" "$GPU_LOAD" "$VRAM_LOAD"

done
