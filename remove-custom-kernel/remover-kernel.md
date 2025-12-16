# desinstalar o xanmod kernel

# 1. Verifique os pacotes XanMod instalados:
dpkg -l | grep xanmod

# 2. Remova os pacotes (kernel image, headers etc):
sudo apt remove --purge linux-xanmod-* linux-image-*-xanmod* linux-headers-*-xanmod*

# 3. Remova o repositório e a chave:
sudo rm /etc/apt/sources.list.d/xanmod-release.list
sudo rm /etc/apt/keyrings/xanmod-archive-keyring.gpg

# 4. Atualize o apt e regenere o GRUB:
sudo apt update
sudo update-grub

# 5. Reinicie:
sudo reboot
