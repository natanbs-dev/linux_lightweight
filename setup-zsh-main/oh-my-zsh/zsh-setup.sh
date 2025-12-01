#!/bin/bash
# Script para configurar o oh-my-zsh em distros linux.
# Este script:
#  • Atualiza os repositórios e instala o zsh (se necessário)
#  • Instala as dependências necessárias para setup
#  • Instala e configura o oh-my-zsh

echo "dependencias para a instalação"
sudo apt install -y curl git wget vim

echo "curl do repositorio oficial do zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


