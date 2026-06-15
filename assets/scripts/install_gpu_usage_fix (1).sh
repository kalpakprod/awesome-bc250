#!/bin/bash
# AMD GPU Usage Fix for Fedora/Bazzite (Steam, MangoHud & CPU-X compatible)

INSTALL_DIR="/var/amd_gpu_usage_fix"
INJECTOR_PATH="$INSTALL_DIR/gpu_injector.py"
SERVICE_PATH="/etc/systemd/system/amd-gpu-usage-fix.service"

echo "1. Creating directory..."
mkdir -p "$INSTALL_DIR"

echo "2. Writing the Python Real-Time Injector..."
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

echo "3. Setting permissions and SELinux context..."
chmod +x "$INJECTOR_PATH"
# Apply security context for Fedora/Bazzite to allow service execution
chcon -t bin_t "$INJECTOR_PATH"

echo "4. Configuring systemd service..."
cat << EOF > "$SERVICE_PATH"
[Unit]
Description=AMD GPU Usage Fix (Binary & Text Injector)
After=multi-user.target

[Service]
Type=simple
User=root
ExecStart=$INJECTOR_PATH
# Failsafe unmounting on service stop
ExecStopPost=-/usr/bin/umount /sys/class/drm/card1/device/gpu_metrics
ExecStopPost=-/usr/bin/umount /sys/class/drm/card1/device/gpu_busy_percent
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

echo "5. Enabling and starting the service..."
systemctl daemon-reload
systemctl enable --now amd-gpu-usage-fix.service

echo "======================================================"
echo "Installation Successful!"
echo "Service Status: $(systemctl is-active amd-gpu-usage-fix.service)"
echo "GPU usage should now be visible in Steam and CPU-X."
echo "======================================================"
