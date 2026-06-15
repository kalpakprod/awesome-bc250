#!/bin/bash

echo "BC-250 CPU Core Map"
echo "----------------------------"

active_cores=$(cat /sys/devices/system/cpu/cpu*/topology/core_id | sort -u | xargs)

draw_ccx() {
    local start=$1
    local end=$2
    local row=""
    for ((i=start; i<=end; i++)); do
        if [[ " $active_cores " =~ " $i " ]]; then
            row+="■ "
        else
            row+="□ "
        fi
    done
    echo "$row"
}

echo -n "CCX0: " && draw_ccx 0 3
echo -n "CCX1: " && draw_ccx 4 7

echo "----------------------------"
echo "Active: $(echo $active_cores | wc -w)/8 cores"
