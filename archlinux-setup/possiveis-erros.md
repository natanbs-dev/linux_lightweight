## iwctl, erro quanto ao powered da placa
iwctl
device wlan5 set-property Powered on
adapter phy5 set-property Powered on

station wlan5 scan
station wlan5 get-networks

## se ainda persistir o erro, use rfkill
rfkill list
rfkill unblock wifi