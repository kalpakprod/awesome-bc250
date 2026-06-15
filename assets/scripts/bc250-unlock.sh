#!/bin/bash
# ==============================================================================
#  bc250-unlock.sh — ASRock BC250 AMDGPU 40 CU Unlock Utility for CachyOS
# ==============================================================================
#  Credits & Acknowledgments:
#  - Patch Creator / Researcher: duggasco (https://github.com/duggasco)
#  - Original repository: https://github.com/duggasco/bc250-40cu-unlock
#  - Additional system engineering & automation integration additions
# ==============================================================================
#
#  ██████╗ ██╗███████╗ ██████╗██╗      █████╗ ██╗███╗   ███╗███████╗██████╗
#  ██╔══██╗██║██╔════╝██╔════╝██║     ██╔══██╗██║████╗ ████║██╔════╝██╔══██╗
#  ██║  ██║██║███████╗██║     ██║     ███████║██║██╔████╔██║█████╗  ██████╔╝
#  ██║  ██║██║╚════██║██║     ██║     ██╔══██║██║██║╚██╔╝██║██╔══╝  ██╔══██╗
#  ██████╔╝██║███████║╚██████╗███████╗██║  ██║██║██║ ╚═╝ ██║███████╗██║  ██║
#  ╚═════╝ ╚═╝╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
#
# ==============================================================================

set -euo pipefail

# ------------------------------------------------------------------------------
# CONSTANTS & PATHS
# ------------------------------------------------------------------------------
SCRIPT_VERSION="1.4.0"
SCRIPT_NAME="bc250-unlock"
BASE_DIR="/var/lib/bc250-unlock"
BACKUP_DIR="${BASE_DIR}/backups"
ORIGINAL_BACKUP_DIR="${BACKUP_DIR}/original"
CURRENT_BACKUP_DIR="${BACKUP_DIR}/current"
PATCH_DIR="${BASE_DIR}/patch"
DKMS_MODULE_NAME="amdgpu-bc250"
DKMS_MODULE_VERSION="1.0"
DKMS_SRC_DIR="/usr/src/${DKMS_MODULE_NAME}-${DKMS_MODULE_VERSION}"
HOOK_DIR="/etc/pacman.d/hooks"
HOOK_FILE="${HOOK_DIR}/bc250-amdgpu-repatch.hook"
PATCH_URL="https://raw.githubusercontent.com/duggasco/bc250-40cu-unlock/main/patch/bc250-40cu-amdgpu.patch"
PATCH_FILE="${PATCH_DIR}/bc250-40cu-amdgpu.patch"
LOG_FILE="${BASE_DIR}/bc250-unlock.log"
STATE_FILE="${BASE_DIR}/install.state"
MODPROBE_CONF="/etc/modprobe.d/bc250-amdgpu.conf"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'

# ------------------------------------------------------------------------------
# LOGGING & CORE UTILS
# ------------------------------------------------------------------------------
log() {
    local level="$1"; shift; local msg="$*"
    local ts; ts=$(date '+%Y-%m-%d %H:%M:%S')
    echo "${ts} [${level}] ${msg}" >> "${LOG_FILE}" 2>/dev/null || true
}
info()    { echo -e "${GREEN}[INFO]${NC}  $*";  log "INFO"    "$*"; }
warn()    { echo -e "${YELLOW}[WARN]${NC}  $*";  log "WARN"    "$*"; }
error()   { echo -e "${RED}[ERROR]${NC} $*";  log "ERROR"   "$*"; }
step()    { echo -e "${CYAN}[STEP]${NC}  $*";  log "STEP"    "$*"; }
success() { echo -e "${GREEN}[OK]${NC}    $*";  log "OK"      "$*"; }
header()  { echo -e "\n${BOLD}${BLUE}==> $*${NC}\n"; }

check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo -e "${RED}This script must be run as root.${NC}"
        echo "Please run: sudo bash bc250-unlock.sh"
        exit 1
    fi
}

init_dirs() {
    mkdir -p "${BASE_DIR}" "${BACKUP_DIR}" "${ORIGINAL_BACKUP_DIR}" \
             "${CURRENT_BACKUP_DIR}" "${PATCH_DIR}"
    # SAFETY: Truncate instead of append to prevent log bloating across consecutive menu loads
    : > "${LOG_FILE}"
    log "INFO" "Initialized workspaces. Script version: ${SCRIPT_VERSION}"
}

show_disclaimer() {
    clear
    echo -e "${RED}${BOLD}"
    cat <<'EOF'
╔══════════════════════════════════════════════════════════════════════════════╗
║                    !! SYSTEM REQUIREMENTS & WARNING DISCLAIMER !!            ║
╠══════════════════════════════════════════════════════════════════════════════╣
║  REQUIRED SYSTEM ENVIRONMENT:                                                ║
║  - HARDWARE   : AMD BC-250 (Sony Ariel / PlayStation 5 Mining Rig Hardware)  ║
║  - OS         : CachyOS Linux (Rolling Distribution)                         ║
║  - BOOTLOADER : Limine Bootloader                                            ║
║                                                                              ║
║  WARNING: This utility modifies low-level kernel source components and       ║
║  compiles out-of-tree hardware modules targeting the AMDGPU graphics engine. ║
║  Clearing the hardware harvest mask forces the silicon to attempt execution  ║
║  on Compute Units (CUs) that may have been factory-disabled due to physical  ║
║  silicon defects, instability, or thermal vulnerabilities.                   ║
║                                                                              ║
║  POTENTIAL RISKS INCLUDE:                                                    ║
║  - Hard system locks, kernel panics, or failure to drop into display managers ║
║  - Visual artifacting, compute degradation, or driver crashes under load     ║
║  - Permanent hardware degradation or thermal damage if run without adequate  ║
║    cooling configurations on unstable silicon.                               ║
║                                                                              ║
║  The author(s) and contributors accept ABSOLUTELY NO LIABILITY for broken    ║
║  hardware, data corruption, or down-time resulting from the use of this      ║
║  utility. This software is provided strictly 'AS-IS' with no warranty,       ║
║  expressed or implied.                                                       ║
╚══════════════════════════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
    echo -e "${YELLOW}By continuing, you verify your system meets the specifications above,${NC}"
    echo -e "${YELLOW}acknowledge the risks, and agree to hold the author(s) harmless.${NC}"
    echo -e "${YELLOW}Type ${BOLD}YES${NC}${YELLOW} to accept these conditions and proceed:${NC}"
    read -r response
    if [[ "$response" != "YES" ]]; then
        echo "Disclaimer declined. Exiting safety sequence."
        exit 0
    fi
}

# ------------------------------------------------------------------------------
# KERNEL DETECTION
# ------------------------------------------------------------------------------
detect_kernel() {
    KERNEL_VERSION=$(uname -r)
    log "INFO" "Running kernel: ${KERNEL_VERSION}"

    KERNEL_PKG=""
    KERNEL_HEADERS_PKG=""

    for pkg in $(pacman -Qq 2>/dev/null | grep -E '^linux-cachyos' | grep -v headers | grep -v docs || true); do
        pkg_ver=$(pacman -Q "$pkg" 2>/dev/null | awk '{print $2}' || true)
        if [[ -z "$pkg_ver" ]]; then continue; fi

        pkg_ver_base="${pkg_ver%-*}"
        kernel_base="${KERNEL_VERSION%%-cachyos*}"

        if [[ "$kernel_base" == "${pkg_ver_base%%-*}" ]]; then
            KERNEL_PKG="$pkg"
            KERNEL_HEADERS_PKG="${pkg}-headers"
            break
        fi
    done

    if [[ -z "$KERNEL_PKG" ]]; then
        warn "Could not auto-match package directly. Deriving target definitions..."
        if [[ "$KERNEL_VERSION" == *"cachyos"* ]]; then
            local flavor_suffix
            flavor_suffix=$(echo "$KERNEL_VERSION" | grep -oP 'cachyos[a-zA-Z0-9_-]*' | head -n1 || echo "cachyos")
            KERNEL_PKG="linux-${flavor_suffix}"
        else
            KERNEL_PKG="linux-cachyos"
        fi
        KERNEL_HEADERS_PKG="${KERNEL_PKG}-headers"
    fi

    success "Detected kernel package : ${KERNEL_PKG}"
    success "Kernel headers package  : ${KERNEL_HEADERS_PKG}"
    success "Running kernel version  : ${KERNEL_VERSION}"
}

check_snapper() {
    SNAPPER_AVAILABLE=false
    if findmnt -n -o FSTYPE / | grep -q btrfs 2>/dev/null; then
        if command -v snapper &>/dev/null && snapper -c root list &>/dev/null 2>&1; then
            SNAPPER_AVAILABLE=true
        fi
    fi

    if [[ "$SNAPPER_AVAILABLE" == false ]]; then
        warn "Snapper/Btrfs recovery snapshots are unavailable."
        echo -n "  Continue anyway? [y/N]: "
        read -r yn
        if [[ ! "$yn" =~ ^[Yy]$ ]]; then exit 0; fi
    fi
}

create_snapshot() {
    if [[ "$SNAPPER_AVAILABLE" == true ]]; then
        step "Creating system checkpoint snapshot..."
        local num; num=$(snapper -c root create --type pre --description "pre-bc250-unlock" --print-number 2>/dev/null || echo "")
        if [[ -n "$num" ]]; then
            success "Snapshot #${num} registered successfully."
            echo "$num" > "${BASE_DIR}/last_snapshot_num"
        fi
    fi
}

backup_module() {
    local mode="$1"
    local dest_dir=$([[ "$mode" == "original" ]] && echo "${ORIGINAL_BACKUP_DIR}" || echo "${CURRENT_BACKUP_DIR}")

    # SAFETY: Never allow subsequent install attempts to overwrite the pure factory backup
    if [[ "$mode" == "original" && ( -f "${ORIGINAL_BACKUP_DIR}/amdgpu.ko.zst" || -f "${ORIGINAL_BACKUP_DIR}/amdgpu.ko" ) ]]; then
        log "INFO" "Original factory backup already indexed safely. Skipping overwrite barrier."
        return 0
    fi

    step "Backing up module instances (${mode})..."
    local path; path=$(find "/lib/modules/${KERNEL_VERSION}" -name "amdgpu.ko*" 2>/dev/null | head -n1)

    if [[ -n "$path" ]]; then
        cp -f "$path" "${dest_dir}/amdgpu.ko.zst" 2>/dev/null || cp -f "$path" "${dest_dir}/amdgpu.ko" 2>/dev/null || true
        echo "${KERNEL_VERSION}" > "${dest_dir}/kernel-version.txt"
        echo "$path" > "${dest_dir}/module-path.txt"
        success "Backup safely indexed."
    fi
}

install_dependencies() {
    header "Synchronizing Core Toolchains"
    local pkgs=("dkms" "base-devel" "pahole" "bc" "git" "wget" "python" "libdrm" "clang" "llvm" "lld" "${KERNEL_HEADERS_PKG}")

    step "Refreshing standard pacman repositories..."
    pacman -Sy --noconfirm >>"${LOG_FILE}" 2>&1

    local to_install=()
    for pkg in "${pkgs[@]}"; do
        if ! pacman -Q "$pkg" &>/dev/null; then to_install+=("$pkg"); fi
    done

    if [[ ${#to_install[@]} -gt 0 ]]; then
        pacman -S --noconfirm --needed "${to_install[@]}" 2>&1 | tee -a "${LOG_FILE}"
    fi
    success "Dependencies synced."
}

download_patch() {
    header "Fetching Device Patches"
    if wget -q --show-progress -O "${PATCH_FILE}" "${PATCH_URL}"; then
        success "Patch configuration downloaded."
    else
        error "Failed to retrieve configuration elements from remote repositories."; exit 1
    fi
}

# ------------------------------------------------------------------------------
# STABILIZATION MASK MANAGER
# ------------------------------------------------------------------------------
manage_disabled_cu() {
    header "Mask Unstable CU Pairs"

    local pairs=()
    for i in {0..19}; do pairs[$i]=0; done

    local current_str=""
    if [[ -f "${MODPROBE_CONF}" ]]; then
        current_str=$(grep -oP 'disable_cu=\K[^ ]+' "${MODPROBE_CONF}" || echo "")
    fi

    if [[ -n "${current_str}" ]]; then
        IFS=',' read -r -a elements <<< "${current_str}"
        for elem in "${elements[@]}"; do
            if [[ "$elem" =~ ^([0-1])\.([0-1])\.([0-4])$ ]]; then
                local se=${BASH_REMATCH[1]}
                local sh=${BASH_REMATCH[2]}
                local wgp=${BASH_REMATCH[3]}
                local idx=$(( (se * 10) + (sh * 5) + wgp ))
                if (( idx >= 0 && idx <= 19 )); then pairs[$idx]=1; fi
            fi
        done
    fi

    while true; do
        clear
        echo -e "${BOLD}${BLUE}==> Adjust CU Stabilization Mask${NC}"
        echo -e "${DIM}BC250 maps disable states in WGPs. Selecting an index disables that core pair.${NC}"
        echo ""

        local disabled_count=0
        for val in "${pairs[@]}"; do (( disabled_count += val )) || true; done
        local active_cus=$(( 40 - (disabled_count * 2) ))

        local preview="None" && [[ -n "${current_str}" ]] && preview="${current_str}"
        echo -e "  Current Config: ${CYAN}amdgpu.disable_cu=${preview}${NC} (${BOLD}${active_cus}/40 CUs active${NC})"
        echo ""

        for i in {0..4}; do
            local p0=$i;       local p0_s=" " && [[ "${pairs[$p0]}" -eq 1 ]] && p0_s="■"
            local p1=$((i+5));  local p1_s=" " && [[ "${pairs[$p1]}" -eq 1 ]] && p1_s="■"
            local p2=$((i+10)); local p2_s=" " && [[ "${pairs[$p2]}" -eq 1 ]] && p2_s="■"
            local p3=$((i+15)); local p3_s=" " && [[ "${pairs[$p3]}" -eq 1 ]] && p3_s="■"

            printf "  [%s] P%-2d (SE0.0.%d)   [%s] P%-2d (SE0.1.%d)   [%s] P%-2d (SE1.0.%d)   [%s] P%-2d (SE1.1.%d)\n" \
                "${p0_s}" "$p0" "$i" "${p1_s}" "$p1" "$i" "${p2_s}" "$p2" "$i" "${p3_s}" "$p3" "$i"
        done

        echo ""
        echo -n "  Enter Pair ID (0-19) to toggle, 'S' to Save & Apply, or 'C' to Cancel: "
        read -r choice

        if [[ "${choice,,}" == "c" ]]; then
            info "Adjustments discarded."; return 0
        elif [[ "${choice,,}" == "s" ]]; then
            break
        elif [[ "$choice" =~ ^[0-9]+$ ]] && (( choice >= 0 && choice <= 19 )); then
            pairs[$choice]=$(( 1 - pairs[$choice] ))

            local out_list=()
            for idx in {0..19}; do
                if [[ "${pairs[$idx]}" -eq 1 ]]; then
                    local tse=$(( idx / 10 ))
                    local rem=$(( idx % 10 ))
                    out_list+=("${tse}.$(( rem / 5 )).$(( rem % 5 ))")
                fi
            done
            current_str=$(IFS=,; echo "${out_list[*]}")
        else
            echo -e "${RED}Invalid input.${NC}"; sleep 1
        fi
    done

    step "Writing parameter updates to standard modules definitions..."
    if [[ -z "${current_str}" ]]; then
        echo "options amdgpu bc250_cc_write_mode=3" > "${MODPROBE_CONF}"
    else
        echo "options amdgpu bc250_cc_write_mode=3 disable_cu=${current_str}" > "${MODPROBE_CONF}"
    fi

    success "Modprobe layouts synced."
    if command -v mkinitcpio >/dev/null 2>&1; then
        mkinitcpio -P </dev/null >>"${LOG_FILE}" 2>&1 || true
    fi
    echo -e "${GREEN}${BOLD}Configuration synced! Please cold reboot your system.${NC}"
}

# ------------------------------------------------------------------------------
# DRIVER MODULE COMPILATION
# ------------------------------------------------------------------------------
build_and_install() {
    header "Building Patched amdgpu Module"

    local kernel_build="/lib/modules/${KERNEL_VERSION}/build"
    local build_work="${BASE_DIR}/build"

    # SAFETY: Wipe previous partial build roots every execution to guarantee structural clean slates
    rm -rf "${build_work}"; mkdir -p "${build_work}"

    step "Downloading matching kernel architecture packages..."
    local full_ver
    full_ver=$(echo "${KERNEL_VERSION}" | grep -oP '^[0-9]+\.[0-9]+\.[0-9]+-[0-9]+' || echo "${KERNEL_VERSION%%-cachyos*}")
    local clean_ver=$(echo "${KERNEL_VERSION}" | grep -oP '^[0-9]+\.[0-9]+\.[0-9]+')

    local flavor_suffix
    if [[ "${KERNEL_VERSION}" == *"cachyos"* ]]; then
        flavor_suffix=$(echo "${KERNEL_VERSION}" | grep -oP 'cachyos[a-zA-Z0-9_-]*' | head -n1 || echo "cachyos")
    else
        flavor_suffix="cachyos"
    fi

    local tar_url="https://github.com/CachyOS/linux/releases/download/${flavor_suffix}-${full_ver}/${flavor_suffix}-${full_ver}.tar.gz"
    log "Fetching primary package release path: ${tar_url}"

    if ! curl -sL "$tar_url" -o "${BASE_DIR}/kernel_src.tar.gz"; then
        tar_url="https://github.com/CachyOS/linux/releases/download/${flavor_suffix}-${clean_ver}/${flavor_suffix}-${clean_ver}.tar.gz"
        log "Routing to alternate branch indices: ${tar_url}"
        if ! curl -sL "$tar_url" -o "${BASE_DIR}/kernel_src.tar.gz"; then
            # Universal fallback path for granular handheld variations
            tar_url="https://github.com/CachyOS/linux/releases/download/cachyos-${clean_ver}/cachyos-${clean_ver}.tar.gz"
            log "Routing to last resort common architecture block: ${tar_url}"
            curl -sL "$tar_url" -o "${BASE_DIR}/kernel_src.tar.gz" || {
                error "Could not successfully locate valid upstream reference packs."; exit 1
            }
        fi
    fi

    step "Extracting graphics engine modules..."
    tar -xf "${BASE_DIR}/kernel_src.tar.gz" --wildcards --ignore-case -C "${build_work}" "*/drivers/gpu/drm/amd/*" 2>>"${LOG_FILE}" || true
    rm -f "${BASE_DIR}/kernel_src.tar.gz"

    local true_amd_dir
    true_amd_dir=$(find "${build_work}" -type d -iname "amd" | grep "drivers/gpu/drm/amd$" | head -n1)

    if [[ -z "${true_amd_dir}" ]]; then
        true_amd_dir=$(find "${build_work}" -type d -name "amd" | head -n1)
    fi

    mkdir -p "${build_work}/drivers/gpu/drm"
    mv "${true_amd_dir}" "${build_work}/drivers/gpu/drm/"

    step "Injecting device level patches..."
    patch -p1 -d "${build_work}" < "${PATCH_FILE}" >> "${LOG_FILE}" 2>&1

    if [[ ! -f "${MODPROBE_CONF}" ]]; then
        echo "options amdgpu bc250_cc_write_mode=3" > "${MODPROBE_CONF}"
    fi

    local target_makefile="${build_work}/drivers/gpu/drm/amd/amdgpu/Makefile"
    local amd_base="${build_work}/drivers/gpu/drm/amd"
    local temp_mk="${build_work}/Makefile.tmp"

    # SAFETY: Absolute path definitions for out-of-tree tracing constraints
    {
        echo "subdir-ccflags-y += -I${amd_base}/amdgpu"
        echo "subdir-ccflags-y += -I${amd_base}/amdgpu/display"
        echo "subdir-ccflags-y += -I${amd_base}/amdgpu/display/amdgpu_dm"
        echo "subdir-ccflags-y += -I${amd_base}/include"
        echo "CFLAGS_amdgpu_trace_points.o := -I${amd_base}/amdgpu"
        cat "${target_makefile}"
    } > "${temp_mk}"
    mv "${temp_mk}" "${target_makefile}"

    # CRITICAL FIX: Explicitly enforce an absolute path configuration mapping into the Trace macro
    sed -i "s|#define TRACE_INCLUDE_PATH .*|#define TRACE_INCLUDE_PATH ${amd_base}/amdgpu|" "${amd_base}/amdgpu/amdgpu_trace.h"

    step "Compiling custom driver objects (-j10 compiler mapping)..."
    echo -e "${DIM}-------------------- Compilation Process --------------------${NC}"

    make -C "${kernel_build}" -j10 M="${amd_base}/amdgpu" LLVM=1 LLVM_IAS=1 CC=clang modules >> "${LOG_FILE}" 2>&1 &
    local compile_pid=$!

    local spin_chars="-\|/"
    local start_time=$(date +%s)

    # Hide terminal cursor block using native ANSI sequences
    echo -ne "\033[?25l"

    while kill -0 "$compile_pid" 2>/dev/null; do
        local current_time=$(date +%s)
        local elapsed=$((current_time - start_time))
        local min=$((elapsed / 60))
        local sec=$((elapsed % 60))

        for (( i=0; i<${#spin_chars}; i++ )); do
            if kill -0 "$compile_pid" 2>/dev/null; then
                local log_peek
                log_peek=$(tail -n1 "${LOG_FILE}" | tr -d '\r\n' | cut -c1-40 | sed 's/%/%%/g' || echo "Processing...")

                printf "\r  [%c] Building AMDGPU module... (%02d:%02d) [ %-40s ]" \
                    "${spin_chars:$i:1}" "$min" "$sec" "${log_peek}"
                sleep 0.25
            fi
        done
    done

    # Unhide cursor
    echo -ne "\033[?25h"
    printf "\r                                                                                \r"
    wait "$compile_pid"
    echo -e "${DIM}--------------------------------------------------------------${NC}"

    local built_module="${amd_base}/amdgpu/amdgpu.ko"
    local install_path="/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko.zst"

    if [[ ! -f "${built_module}" ]]; then
        error "Module compilation failed. Check /var/lib/bc250-unlock/bc250-unlock.log for details."; exit 1
    fi

    backup_module "current"
    zstd -f --rm "${built_module}" -o "${built_module}.zst" >>"${LOG_FILE}" 2>&1 || true

    if [[ -f "${built_module}.zst" ]]; then
        install -m 644 "${built_module}.zst" "${install_path}"
    else
        install -m 644 "${built_module}" "/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko"
    fi

    depmod -a "${KERNEL_VERSION}"
    if command -v mkinitcpio >/dev/null 2>&1; then
        mkinitcpio -P </dev/null >>"${LOG_FILE}" 2>&1 || true
    fi

    echo "${KERNEL_VERSION}" > "${STATE_FILE}"
    echo "${KERNEL_PKG}" >> "${STATE_FILE}"
}

# ------------------------------------------------------------------------------
# AUTOMATED PACMAN BACKGROUND TRIGGER HOOKS
# ------------------------------------------------------------------------------
install_hook() {
    header "Installing Universal Pacman Trigger Hooks"
    mkdir -p "${HOOK_DIR}"

    cat > "${HOOK_FILE}" <<EOF
[Trigger]
Operation = Upgrade
Operation = Install
Type = Package
Target = linux-cachyos*

[Action]
Description = BC250: Universal Flavor Rebuild (amdgpu execution targets)...
When = PostTransaction
Exec = /usr/local/bin/bc250-repatch.sh
NeedsTargets
EOF

    cat > /usr/local/bin/bc250-repatch.sh <<'REPATCH'
#!/bin/bash
set -euo pipefail

BASE_DIR="/var/lib/bc250-unlock"
LOG_FILE="${BASE_DIR}/bc250-unlock.log"
STATE_FILE="${BASE_DIR}/install.state"
PATCH_FILE="${BASE_DIR}/patch/bc250-40cu-amdgpu.patch"

log() { echo "$(date '+%Y-%m-%d %H:%M:%S') [HOOK] $*" >> "${LOG_FILE}" 2>/dev/null || true; }

NEW_KERNEL=$(ls /usr/lib/modules/ | sort -V | tail -n1)
KERNEL_BUILD="/lib/modules/${NEW_KERNEL}/build"

echo "==> BC250 Universal Hook: Preparing for ${NEW_KERNEL}..."

# Attempt to locate or clone source
BUILD_WORK="${BASE_DIR}/build_hook"
rm -rf "${BUILD_WORK}"
mkdir -p "${BUILD_WORK}/drivers/gpu/drm/amd"

echo "    -> Attempting to resolve kernel source tree..."
GIT_WORK="${BASE_DIR}/cachyos_git"
rm -rf "${GIT_WORK}"

# We try to clone the repo. If the network is down or the repo is inaccessible,
# we catch the failure here.
if ! git clone --depth 1 https://github.com/CachyOS/linux.git "${GIT_WORK}" >> "${LOG_FILE}" 2>&1; then
    echo "    ERROR: Unable to fetch kernel source from CachyOS repository."
    echo "    -> Skipping driver rebuild for this kernel."
    exit 0
fi

cp -rf "${GIT_WORK}/drivers/gpu/drm/amd/." "${BUILD_WORK}/drivers/gpu/drm/amd/"
rm -rf "${GIT_WORK}"

# Verify the source is actually usable
if [[ ! -f "${BUILD_WORK}/drivers/gpu/drm/amd/amdgpu/Makefile" ]]; then
    echo "    ERROR: Kernel source tree invalid or incomplete."
    echo "    -> Skipping driver rebuild for this kernel."
    exit 0
fi

# Apply patch or fallback
if patch -p1 -d "${BUILD_WORK}" < "${PATCH_FILE}" >/dev/null 2>&1; then
    log "Standard diff patch applied cleanly."
else
    DRV_SRC="${BUILD_WORK}/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c"
    KMS_SRC="${BUILD_WORK}/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c"
    [[ -f "$DRV_SRC" ]] && sed -i 's/int amdgpu_bc250_cc_write_mode = .*/int amdgpu_bc250_cc_write_mode = 3;/g' "$DRV_SRC" || true
    [[ -f "$KMS_SRC" ]] && sed -i 's/adev->harvest_bitmask = .*/adev->harvest_bitmask = 0;/g' "$KMS_SRC" || true
fi

AMD_BASE="${BUILD_WORK}/drivers/gpu/drm/amd"
TARGET_MK="${AMD_BASE}/amdgpu/Makefile"

{
    echo "subdir-ccflags-y += -I${AMD_BASE}/amdgpu -I${AMD_BASE}/amdgpu/display -I${AMD_BASE}/amdgpu/display/amdgpu_dm -I${AMD_BASE}/include"
    echo "CFLAGS_amdgpu_trace_points.o := -I${AMD_BASE}/amdgpu"
    cat "${TARGET_MK}"
} > "${BUILD_WORK}/Makefile.tmp"
mv "${BUILD_WORK}/Makefile.tmp" "${TARGET_MK}"
sed -i "s|#define TRACE_INCLUDE_PATH .*|#define TRACE_INCLUDE_PATH ${AMD_BASE}/amdgpu|" "${AMD_BASE}/amdgpu/amdgpu_trace.h"

echo "    -> Compiling custom driver extensions..."
if ! make -C "${KERNEL_BUILD}" -j10 M="${AMD_BASE}/amdgpu" CC=gcc KCFLAGS="-Wno-error" modules >> "${LOG_FILE}" 2>&1; then
    echo "    ERROR: Compilation failed for ${NEW_KERNEL}."
    echo "    -> Skipping driver rebuild."
    exit 0
fi

# Install logic
BUILT="${AMD_BASE}/amdgpu/amdgpu.ko"
INSTALL_PATH="/lib/modules/${NEW_KERNEL}/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko.zst"
zstd -f --rm "${BUILT}" -o "${BUILT}.zst" >/dev/null 2>&1 || true
install -m 644 "${BUILT}.zst" "${INSTALL_PATH}"

depmod -a "${NEW_KERNEL}"

# Ramdisk update
echo "    -> Updating system ramdisk..."
if command -v mkinitcpio >/dev/null 2>&1 && ls /etc/mkinitcpio.d/*.preset >/dev/null 2>&1; then
    mkinitcpio -P >> "${LOG_FILE}" 2>&1 || true
else
    FLAVOR_DIR=$(find /boot -type d -name "*${NEW_KERNEL#linux-}*" -o -name "*${NEW_KERNEL}*" 2>/dev/null | head -n1)
    [[ -z "${FLAVOR_DIR}" ]] && MACHINE_ID=$(cat /etc/machine-id 2>/dev/null || echo "") && [[ -n "${MACHINE_ID}" ]] && FLAVOR_DIR=$(find /boot -type d -name "${MACHINE_ID}" 2>/dev/null | head -n1)
    if [[ -n "${FLAVOR_DIR}" ]]; then
        TARGET_IMG=$(find "${FLAVOR_DIR}" -type f -name "initramfs*" | head -n1)
        [[ -n "${TARGET_IMG}" ]] && mkinitcpio -k "${NEW_KERNEL}" -g "${TARGET_IMG}" >> "${LOG_FILE}" 2>&1 || true
    fi
fi

echo "${NEW_KERNEL}" > "${STATE_FILE}"
echo "    Compilation pipeline finalized successfully."
REPATCH

    chmod +x /usr/local/bin/bc250-repatch.sh
    success "Flavor-Aware Hook structures deployed."
}
# ------------------------------------------------------------------------------
# REPORTING TOOL (4-COLUMN COORDINATE DISPLAY)
# ------------------------------------------------------------------------------
do_cu_map() {
    header "CU Map — BC250 Compute Unit Status"

    if ! command -v python3 &>/dev/null; then
        error "python3 missing."; return 1
    fi
    if [[ ! -c /dev/dri/renderD128 ]]; then
        error "renderD128 interface unavailable."; return 1
    fi

    local sys_mask=""
    if [[ -f "/sys/module/amdgpu/parameters/disable_cu" ]]; then
        sys_mask=$(cat /sys/module/amdgpu/parameters/disable_cu 2>/dev/null || echo "")
    fi
    if [[ -z "$sys_mask" && -f "${MODPROBE_CONF}" ]]; then
        sys_mask=$(grep -oP 'disable_cu=\K[^ ]+' "${MODPROBE_CONF}" || echo "")
    fi

    export SYS_DISABLED_CU_MASK="${sys_mask}"

    python3 <<'PYEOF'
import ctypes, struct, os, sys

sys_mask_str = os.environ.get("SYS_DISABLED_CU_MASK", "")
masked_wgps = set()
if sys_mask_str and sys_mask_str != "(null)" and sys_mask_str != "0":
    for elem in sys_mask_str.split(','):
        if elem.strip(): masked_wgps.add(elem.strip())

try:
    libdrm = ctypes.CDLL("libdrm_amdgpu.so.1")
    fd = os.open("/dev/dri/renderD128", os.O_RDWR)
except Exception as e:
    print(f"ERROR: Framework bind failures: {e}"); sys.exit(1)

dev = ctypes.c_void_p()
maj, min_ = ctypes.c_uint32(), ctypes.c_uint32()
libdrm.amdgpu_device_initialize(fd, ctypes.byref(maj), ctypes.byref(min_), ctypes.byref(dev))

buf = (ctypes.c_uint8 * 1024)()
libdrm.amdgpu_query_info(dev, 0x16, 1024, ctypes.byref(buf))
raw = bytes(buf)

num_se = struct.unpack_from('<I', raw, 20)[0]
num_sh = struct.unpack_from('<I', raw, 24)[0]

total_active_cus = 0
total_masked_cus = 0
wgp_status = ["  "] * 20

for se in range(num_se):
    for sh in range(num_sh):
        bm = struct.unpack_from('<I', raw, 56 + (se * 4 + sh) * 4)[0]
        base_idx = (se * 10) + (sh * 5)
        for wgp in range(5):
            idx = base_idx + wgp
            coord_str = f"{se}.{sh}.{wgp}"

            if coord_str in masked_wgps:
                wgp_status[idx] = "☒☒"
                total_masked_cus += 2
            else:
                c1 = "■" if (bm & (1 << (wgp * 2))) else "□"
                c2 = "■" if (bm & (1 << ((wgp * 2) + 1))) else "□"
                wgp_status[idx] = f"{c1}{c2}"
                if (bm & (1 << (wgp * 2))): total_active_cus += 1
                if (bm & (1 << ((wgp * 2) + 1))): total_active_cus += 1

possible_silicon_cus = num_se * num_sh * 10
if total_masked_cus > 0:
    status_str = f"STABILIZED ({total_active_cus}/40 Active, {total_masked_cus} Masked)"
elif total_active_cus == possible_silicon_cus:
    status_str = "FULLY UNLOCKED (40/40 CUs active)"
else:
    status_str = f"LOCKED / STOCK VARIANT ({total_active_cus}/40 CUs active)"

print("┌─────────────────────────────────────────┐")
print("│         BC-250 CU Map Report            │")
print("├─────────────────────────────────────────┤")
print(f"│  Active CUs     : {total_active_cus:<22}│")
print(f"│  Masked Safely  : {total_masked_cus:<22}│")
print(f"│  Status         : {status_str:<22}│")
print("└─────────────────────────────────────────┘\n")
print("CU Bitmap Grid (■ = active, □ = harvested, ☒ = stabilized):")

for i in range(5):
    p0, p1, p2, p3 = i, i + 5, i + 10, i + 15
    print(f"  [{wgp_status[p0]} 0.0.{i}] P{p0:<2}   [{wgp_status[p1]} 0.1.{i}] P{p1:<2}   [{wgp_status[p2]} 1.0.{i}] P{p2:<2}   [{wgp_status[p3]} 1.1.{i}] P{p3:<2}")

libdrm.amdgpu_device_deinitialize(dev)
os.close(fd)
PYEOF
}

# ------------------------------------------------------------------------------
# STATUS CHECKER
# ------------------------------------------------------------------------------
do_status() {
    header "Patch Status"
    detect_kernel
    echo -e "${BOLD}System:${NC}"
    echo "  Running kernel : ${KERNEL_VERSION}"

    if [[ -f "$STATE_FILE" ]]; then
        local inst_k; inst_k=$(head -n1 "${STATE_FILE}")
        if [[ "$inst_k" == "$KERNEL_VERSION" ]]; then
            echo -e "  Install state  : ${GREEN}Patched for current kernel${NC}"
        else
            echo -e "  Install state  : ${YELLOW}Kernel Mismatch (Installed for: ${inst_k})${NC}"
        fi
    else
        echo -e "  Install state  : ${RED}No installation record found${NC}"
    fi

    echo -e "\n${BOLD}Modprobe Config (${MODPROBE_CONF}):${NC}"
    if [[ -f "$MODPROBE_CONF" ]]; then
        cat "${MODPROBE_CONF}" | sed 's/^/  /'
    else
        echo -e "  ${RED}Not found.${NC}"
    fi

    echo -e "\n${BOLD}Kernel Parameter Interfaces:${NC}"
    local p_path="/sys/module/amdgpu/parameters/bc250_cc_write_mode"
    if [[ -f "$p_path" ]]; then
        echo -e "  Live active mode: ${GREEN}$(cat $p_path)${NC}"
    else
        echo -e "  Live active mode: ${RED}Module modifications aren't active yet.${NC}"
    fi

    do_cu_map
}

# ------------------------------------------------------------------------------
# UNINSTALL / RESTORATION
# ------------------------------------------------------------------------------
do_uninstall() {
    header "Uninstall / Full System Restoration"
    detect_kernel

    echo -e "${YELLOW}${BOLD}!!! WARNING: This will remove all custom BC250 patches and restore the stock driver !!!${NC}"
    echo -n "    Are you sure you want to proceed? [y/N]: "
    read -r confirm
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        info "Uninstall aborted."
        return 0
    fi

    step "Removing modprobe, configuration hooks, and automation engines..."
    rm -f "${MODPROBE_CONF}"
    rm -f "${HOOK_FILE}"
    rm -f /usr/local/bin/bc250-repatch.sh

    local backup_path="${ORIGINAL_BACKUP_DIR}/amdgpu.ko.zst"
    local backup_raw="${ORIGINAL_BACKUP_DIR}/amdgpu.ko"
    local target_meta="${ORIGINAL_BACKUP_DIR}/module-path.txt"

    if [[ -f "$target_meta" ]]; then
        local original_destination; original_destination=$(cat "$target_meta" 2>/dev/null || echo "")

        if [[ -n "$original_destination" ]]; then
            step "Restoring stock factory AMDGPU driver module..."
            mkdir -p "$(dirname "$original_destination")"

            if [[ -f "$backup_path" ]]; then
                cp -f "$backup_path" "$original_destination"
                success "Restored stock driver from compressed archive backup."
            elif [[ -f "$backup_raw" ]]; then
                if [[ "$original_destination" == *.zst ]]; then
                    zstd -f -q --rm "$backup_raw" -o "$original_destination"
                else
                    cp -f "$backup_raw" "$original_destination"
                fi
                success "Restored stock driver from uncompressed backup."
            else
                warn "Driver backup archives missing. Reinstalling core kernel package modules..."
                pacman -S --noconfirm "${KERNEL_PKG}" >>"${LOG_FILE}" 2>&1 || true
            fi
        fi
    else
        # SAFETY: If running uninstall multiple times without any records, pacman sync handles it cleanly
        warn "No module backup metadata found. Overwriting changes via core package validation..."
        pacman -S --noconfirm "${KERNEL_PKG}" >>"${LOG_FILE}" 2>&1 || true
    fi

    step "Clearing application execution states..."
    rm -f "${STATE_FILE}"
    rm -f "${BASE_DIR}/last_snapshot_num"
    rm -rf "${BASE_DIR}/build" "${BASE_DIR}/build_hook"

    step "Re-indexing kernel dependency pointers..."
    depmod -a "${KERNEL_VERSION}" >>"${LOG_FILE}" 2>&1 || true

    step "Regenerating system-wide initramfs boot images..."
    if command -v mkinitcpio >/dev/null 2>&1; then
        mkinitcpio -P </dev/null >>"${LOG_FILE}" 2>&1 || true
    fi

    echo ""
    echo -e "${GREEN}${BOLD}Uninstall complete! Everything has been safely reverted.${NC}"
    echo -e "${YELLOW}Please complete a cold reboot to return the GPU to factory stock settings.${NC}"
}

do_install() {
    header "Install — Universal BC250 CU Unlock Sequence"
    detect_kernel
    check_snapper
    create_snapshot
    install_dependencies
    download_patch
    if [[ ! -f "${ORIGINAL_BACKUP_DIR}/kernel-version.txt" ]]; then backup_module "original"; fi
    build_and_install
    install_hook

    echo -e "\n${GREEN}${BOLD}Setup Completed Successfully!${NC}"
    echo -e "${CYAN}Please reboot your machine to apply settings.${NC}"
}

# ------------------------------------------------------------------------------
# CORE CONTROLLER MENU
# ------------------------------------------------------------------------------
main_menu() {
    while true; do
        clear
        echo -e "${BOLD}${BLUE}  ╔═══════════════════════════════════════════════════════════╗"
        echo "  ║       ASRock BC250 AMDGPU Universal Unlock Tool          ║"
        echo -e "  ╚═══════════════════════════════════════════════════════════╝${NC}"
        echo -e "  ${DIM}Script version: ${SCRIPT_VERSION}${NC}\n"
        echo -e "  ${BOLD}1)${NC} Run Full Driver Patch / Installation"
        echo -e "  ${BOLD}2)${NC} Uninstall Utility Framework"
        echo -e "  ${BOLD}3)${NC} Manage Stabilization Exclusion Mask (disable_cu)"
        echo -e "  ${BOLD}4)${NC} Inspect Live CU Maps & Patch Status"
        echo -e "  ${BOLD}5)${NC} Exit"
        echo ""
        echo -n "  Select an option [1-5]: "
        read -r opt

        case "$opt" in
            1) do_install ;;
            2) do_uninstall ;;
            3) manage_disabled_cu ;;
            4) do_status ;;
            5) echo "Exiting."; exit 0 ;;
            *) echo -e "${RED}Invalid selection.${NC}"; sleep 1 ;;
        esac
        echo -e "\n${DIM}Press Enter to continue...${NC}"; read -r
    done
}

check_root
init_dirs
show_disclaimer
main_menu
