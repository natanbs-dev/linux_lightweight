## corregar o formato do teclado portugues
loadkeys br-abnt2

## conectar a internet
iwctl
device list
station [device list wlan5] get-networks
station wlan 5 connect NETWORK.SSID

## verifique se conectou
station wlan5 show