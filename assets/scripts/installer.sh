#!/bin/bash

set -e  # Выход при ошибке

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'
BLUE='\033[0;34m'

# Функции для вывода сообщений
log() {
    echo -e "${GREEN}[$(date +'%H:%M:%S')]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[!]${NC} $1"
}

error() {
    echo -e "${RED}[ОШИБКА]${NC} $1"
}
confirm() {
    echo
    while true; do
        echo
        printf "${BLUE}Продолжить? (y/n): ${NC}"
        read choice
        case "$choice" in
            y|Y|д|Д )
                return 0
                ;;
            n|N|н|Н )
                echo -e "${RED}Установка отменена${NC}"
                exit 0
                ;;
            * )
                error "Введите y (да) или n (нет)"
                ;;
        esac
    done
}


# Проверка наличия yay
if ! command -v yay &> /dev/null; then
    error "yay не установлен! Сначала установите yay."
    exit 1
fi

log "Начинаем установку приложений..."

# Пакеты из официальных репозиториев
OFFICIAL_PACKAGES=(
    "steam"
    "ktorrent" 
    "partitionmanager"
    "cpu-x"
    "filelight"
    "krita"
    "kolourpaint"
    "occt"
    "ntfs-3g"
    "mangojuice"
)

# Пакеты AUR (через yay)
AUR_PACKAGES=(
    "elyprismlauncher-bin"
    "nekoray-qt6"
    "furmark"
    "portproton"
)

# Функция проверки установленности пакета
is_installed() {
    if pacman -Qi "$1" &> /dev/null || yay -Qi "$1" &> /dev/null; then
        return 0
    else
        return 1
    fi
}

# Функция установки пакетов из официальных репозиториев
install_official() {
    log "Устанавливаем пакеты из официальных репозиториев..."
    
    local to_install=()
    for package in "${OFFICIAL_PACKAGES[@]}"; do
        if is_installed "$package"; then
            warn "$package уже установлен"
        else
            to_install+=("$package")
        fi
    done
    
    if [ ${#to_install[@]} -gt 0 ]; then
        log "Устанавливаем: ${to_install[*]}"
        sudo pacman -S --noconfirm --needed "${to_install[@]}"
    else
        log "Все официальные пакеты уже установлены"
    fi
}

# Функция установленности пакетов из AUR
install_aur() {
    log "Устанавливаем пакеты из AUR..."
    
    local to_install=()
    for package in "${AUR_PACKAGES[@]}"; do
        if is_installed "$package"; then
            warn "$package уже установлен"
        else
            to_install+=("$package")
        fi
    done
    
    if [ ${#to_install[@]} -gt 0 ]; then
        log "Устанавливаем: ${to_install[*]}"
        yay -S --noconfirm --needed "${to_install[@]}"
    else
        log "Все AUR пакеты уже установлены"
    fi
}

# Основной процесс установки
main() {
    log "=== Установка начата ==="

    log "${YELLOW}[Этот скрипт установит следующие приложения:]${NC}"
    echo "--- Игры ---"
    echo "  Steam, Furmark, PortProton, Mangojuice, Elyprism"
    echo "--- Сети ---"
    echo "  NekoRay, KTorrent"
    echo "--- Системные утилиты ---"
    echo "  PartitionManager, CPU-X, FileLight, NTFS-3G, OCCT"
    echo "--- Графика ---"
    echo "  Krita, KolourPaint"

    # Пауза перед началом
    confirm

    # Обновление системы
    # log "Обновляем систему..."
    # sudo pacman -Syu --noconfirm
    
    install_official
    install_aur
    
    log "=== Установка завершена ==="
}

# Запуск главной функции
main
