#!/bin/bash

echo "Definindo limite de carga da bateria para 79%..."
echo 79 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold
