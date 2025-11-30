#!/bin/bash
set -e

echo "=== Установка openQA ==="

# Обновление системы
apt update && apt upgrade -y

# Установка openQA (официальный репозиторий)
echo 'deb http://download.opensuse.org/repositories/home:/kraih:/openQA/xUbuntu_22.04/ /' > /etc/apt/sources.list.d/openqa.list
wget -qO - https://download.opensuse.org/repositories/home:/kraih:/openQA/xUbuntu_22.04/Release.key | apt-key add -
apt update
apt install -y openqa openqa-client

# Включение KVM
apt install -y qemu-kvm libvirt-daemon-system virtinst

# Запуск сервисов
systemctl enable --now openqa-webui openqa-scheduler openqa-worker@1

# Добавление себя в группу libvirt (опционально)
usermod -aG libvirt-kvm www-data

echo "=== openQA готов! ==="
echo "Web UI: http://$(hostname -I | awk '{print $1}')"
echo "По умолчанию: логин/пароль не требуются в локальной сети"
