#!/bin/bash

# cachyos configuração automatizada

# 1. Configurar limite de carga da bateria
echo "Definindo limite de carga da bateria para 80%..."
echo 80 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold

# 2. Configurar perfil de desempenho
echo "Configurando perfil de desempenho para 'performance'..."
sudo powerprofilesctl set performance

# 3. Swappiness
#echo "Definindo vm.swappiness para 10..."
#sudo sysctl vm.swappiness=

echo "ativando as configurações do sysctl --system"
sudo sysctl --system

echo "Configuração concluída com sucesso!"
