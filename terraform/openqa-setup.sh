#!/bin/bash
set -e
sudo apt update
sudo apt install -y openqa openqa-client qemu-system-x86 libvirt-daemon-system
sudo systemctl enable --now openqa-webui openqa-scheduler openqa-worker@1
