#!/bin/bash

# Editar o sources.list para softwares e drivers mais recentes(unstable | sid):
sudo echo "deb http://ftp.de.debian.org/debian sid main non-free >> /etc/apt/sources.list"

# atualize o sistema seguindo os padrões:
sudo apt update && sudo apt dist-upgrade && sudo apt full-upgrade

## remova possíveis erros que possam ter ocorrido
sudo apt autoremove && sudo apt autoclean 

## [optional] limitando a carga de bateria em notebook
echo 79 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold

## drivers para gpu e cpu da intel:
sudo apt install intel-media-va-driver-non-free mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386

## configurando a governança de energia:
sudo systemctl stop cpupower.service
sudo systemctl mask cpupower.service
sudo apt remove --purge -y linux-cpupower 
sudo apt install power-profiles-daemon
sudo systemctl enable power-profiles-daemon.service 
sudo systemctl start power-profiles-daemon.service 

## configurações de kernel para swappiness 

sudo nano /etc/sysctl.d/99-simple.conf | tee vm.swappiness = 5 
vm.vfs_cache_pressure = 50