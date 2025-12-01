#!/bin/bash


echo "quando tiver o erro no terminal de - [oh-my-zsh] zsh-autosuggestions
 is not found - use este comando para consertar"

cd ~/.oh-my-zsh/custom/plugins/
sudo rm -rf /home/barbosa/.oh-my-zsh/custom/plugins/zsh-autosuggestions*
git clone https://github.com/zsh-users/zsh-autosuggestions.git
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

echo "finalizando com a saída do terminal; em muitos casos, caso somente rode
o comando source ~/.zshrc não está consertando, precisa-se sair das sessões
do terminal"

exit 

echo "funcionando também para demais plugins que tiverem o erro de not found"
