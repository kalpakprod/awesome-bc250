#!/bin/bash

# AMD GPU Metrics Fix for CachyOS (Arch-based) / Fedora / etc

#Some beauty
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[$(date +'%H:%M:%S')]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[!]${NC} $1"
}

error() {
    echo -e "${RED}[ОШИБКА]${NC} $1"
}
allsgood() {
    echo -e "${GREEN}[✓]${NC} $1"
}

# main script

INSTALL_DIR="/var/amd_gpu_usage_fix"
INJECTOR_PATH="$INSTALL_DIR/gpu_injector.py"
SERVICE_PATH="/etc/systemd/system/amd-gpu-usage-fix.service"

log "Создание директории..."
mkdir -p "$INSTALL_DIR" || { error "Не удалось создать директорию"; exit 1; }

log "Запись Python-инжектора..."
cat << 'EOF' > "$INJECTOR_PATH"
#!/usr/bin/env python3
import os, glob, struct, time, subprocess, signal, sys

# Hardware paths
REAL_METRICS = "/sys/class/drm/card1/device/gpu_metrics"
REAL_BUSY = "/sys/class/drm/card1/device/gpu_busy_percent"

# Patched files (temporary storage)
PATCHED_METRICS = "/var/amd_gpu_usage_fix/patched_metrics"
PATCHED_BUSY = "/var/amd_gpu_usage_fix/patched_busy"

USAGE_OFFSET = 0x1C # Byte 28 for AMD GPU metrics table

try:
    real_fd = os.open(REAL_METRICS, os.O_RDONLY)
except Exception as e:
    print(f"Failed to open hardware file: {e}")
    sys.exit(1)

# Create placeholder files for bind-mounting
with open(PATCHED_METRICS, "wb") as f: f.write(b'\x00' * 128)
with open(PATCHED_BUSY, "w") as f: f.write("0\n")

# Perform bind-mounts to override system paths
subprocess.run(["mount", "--bind", PATCHED_METRICS, REAL_METRICS])
subprocess.run(["mount", "--bind", PATCHED_BUSY, REAL_BUSY])

def cleanup(signum, frame):
    """Restore original system files on exit."""
    subprocess.run(["umount", REAL_METRICS], stderr=subprocess.DEVNULL)
    subprocess.run(["umount", REAL_BUSY], stderr=subprocess.DEVNULL)
    sys.exit(0)

signal.signal(signal.SIGTERM, cleanup)
signal.signal(signal.SIGINT, cleanup)

def get_gfx_time():
    """Calculate total GPU active time from fdinfo."""
    gfx_times = {}
    for path in glob.glob('/proc/[0-9]*/fdinfo/*'):
        try:
            with open(path, 'r') as f:
                cid, gfx = None, 0
                for line in f:
                    if line.startswith('drm-client-id:'): cid = line.split()[1]
                    elif line.startswith('drm-engine-gfx:'): gfx = int(line.split()[1])
                if cid is not None and gfx > gfx_times.get(cid, 0): gfx_times[cid] = gfx
        except: pass
    return sum(gfx_times.values())

patched_fd = os.open(PATCHED_METRICS, os.O_WRONLY)

# Main Injection Loop
while True:
    t1 = get_gfx_time()
    time.sleep(1)
    t2 = get_gfx_time()

    usage = max(0, min(100, (t2 - t1) // 10000000))

    # Update Binary Metrics (for MangoHud)
    os.lseek(real_fd, 0, os.SEEK_SET)
    raw_data = bytearray(os.read(real_fd, 128))
    if len(raw_data) >= 30:
        struct.pack_into("<H", raw_data, USAGE_OFFSET, usage)
        os.lseek(patched_fd, 0, os.SEEK_SET)
        os.write(patched_fd, raw_data)

    # Update Text Percent (for Steam & CPU-X)
    with open(PATCHED_BUSY, "w") as f:
        f.write(f"{usage}\n")

EOF

chmod +x "$INJECTOR_PATH" || { error "Не удалось сделать файл исполняемым"; exit 1; }

log "Создание systemd сервиса..."
cat << EOF > "$SERVICE_PATH"
[Unit]
Description=AMD GPU Metrics Injector (CachyOS)
After=multi-user.target

[Service]
Type=simple
ExecStart=/usr/bin/python3 $INJECTOR_PATH

User=root
CapabilityBoundingSet=CAP_SYS_ADMIN CAP_DAC_OVERRIDE
AmbientCapabilities=CAP_SYS_ADMIN

Restart=always
RestartSec=2

ExecStopPost=/usr/bin/umount /sys/class/drm/card1/device/gpu_metrics

[Install]
WantedBy=multi-user.target
EOF

log "Перезагрузка systemd..."
systemctl daemon-reload || { error "systemd daemon-reload failed"; exit 1; }

log "Запуск сервиса..."
systemctl enable --now amd-gpu-usage-fix.service || { error "Не удалось запустить сервис"; exit 1; }

STATUS=$(systemctl is-active amd-gpu-usage-fix.service)

if [[ "$STATUS" == "active" ]]; then
allsgood "GPU Metrics Injection активен"
else
warn "Сервис не активен (status: $STATUS)"
fi
