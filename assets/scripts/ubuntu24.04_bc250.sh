#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "ОШИБКА: Скрипт должен быть запущен с правами sudo."
    echo "Пожалуйста, запустите скрипт снова с командой: sudo $0"
    exit 1
fi

check_error() {
    if [ $? -ne 0 ]; then
        echo "ОШИБКА: $1"
        exit 1
    fi
}

echo "Проверка доступности репозитория..."
git ls-remote --exit-code https://gitlab.com/mothenjoyer69/oberon-governor.git &>/dev/null
if [ $? -ne 0 ]; then
    echo "ОШИБКА: Репозиторий недоступен. Проверьте подключение к интернету или URL репозитория."
    exit 1
else
    echo "Репозиторий доступен."
fi

echo "Установка необходимых пакетов..."
sudo apt update
check_error "Не удалось обновить список пакетов"

echo "Установка инструментов сборки..."
sudo apt install -y git cmake make g++ build-essential
check_error "Не удалось установить инструменты сборки"

echo "Установка зависимостей проекта..."
sudo apt install -y libdrm-dev libdrm2 libdrm-common libpciaccess0 pkg-config
check_error "Не удалось установить зависимости проекта"

for cmd in git cmake make g++; do
    if command -v $cmd &>/dev/null; then
        echo "$cmd: Все пакеты установлены"
    else
        echo "$cmd: Не установлено. Пожалуйста, установите $cmd."
    fi
done

echo "Обновление пакетов..."
sudo apt upgrade -y
check_error "Не удалось обновить пакеты"

echo "Клонирование репозитория..."
if [ -d "oberon-governor" ]; then
    echo "Директория oberon-governor уже существует."
    read -p "Удалить и клонировать заново? (y/n): " answer
    if [ "$answer" = "y" ]; then
        rm -rf oberon-governor
        git clone https://gitlab.com/mothenjoyer69/oberon-governor.git
        check_error "Не удалось клонировать репозиторий"
    fi
else
    git clone https://gitlab.com/mothenjoyer69/oberon-governor.git
    check_error "Не удалось клонировать репозиторий"
fi

cd oberon-governor || { echo "ОШИБКА: Не удалось перейти в директорию oberon-governor"; exit 1; }

mkdir -p build
cd build || { echo "ОШИБКА: Не удалось перейти в директорию build"; exit 1; }

echo "Сборка и установка..."
cmake ..
check_error "Не удалось выполнить cmake"

make -j$(nproc)
check_error "Не удалось выполнить make"

sudo make install
check_error "Не удалось установить проект"

echo "Проверка статуса сервиса oberon-governor..."
sudo systemctl status oberon-governor.service --no-pager

if ! systemctl is-active --quiet oberon-governor.service; then
    echo "Сервис oberon-governor неактивен. Включение и запуск..."
    sudo systemctl enable oberon-governor.service
    sudo systemctl start oberon-governor.service
    
    echo "Проверка статуса после запуска:"
    sudo systemctl status oberon-governor.service --no-pager
fi

echo "Готово! oberon-governor успешно установлен и настроен."

echo "Добавление репозитория Mesa..."
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:ernstp/mesarc
check_error "Не удалось добавить репозиторий Mesa"

echo "Обновление списка пакетов..."
sudo apt update
check_error "Не удалось обновить список пакетов"

echo "Обновление пакетов..."
sudo apt upgrade -y
check_error "Не удалось обновить пакеты"

echo "Установка Mesa..."
sudo apt install -y mesa-utils
check_error "Не удалось установить Mesa"

echo "Проверка версии Mesa:"
glxinfo | grep "OpenGL version"

if glxinfo | grep "OpenGL version" | grep -q "25.1"; then
    echo "Успешно установлена Mesa 25.1!"
else
    echo "ВНИМАНИЕ: Mesa 25.1 не обнаружена. Возможно, потребуется перезагрузка системы."
fi

echo "Все операции завершены!"
