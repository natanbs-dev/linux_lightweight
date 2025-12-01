#!/bin/bash
# Script para configurar o zsh e oh‑my‑posh no Arch Linux
# Este script:
#  • Atualiza os repositórios e instala o zsh (se necessário)
#  • Instala o oh‑my‑posh (baixando o binário para /usr/local/bin)
#  • Define o zsh como shell padrão para o usuário (usando SUDO_USER)
#  • Baixa um tema padrão (devious-diamonds) para oh‑my‑posh e adiciona sua inicialização ao .zshrc

# Este script deve ser executado com sudo.
if [ "$EUID" -ne 0 ]; then
    echo "Por favor, execute este script com sudo."
    exit 1
fi

# Verifica se SUDO_USER está definido (para configurar o usuário não-root)
if [ -z "$SUDO_USER" ]; then
    echo "Variável SUDO_USER não definida. Execute com sudo."
    exit 1
fi

echo "Atualizando os repositórios..."
pacman -Sy --noconfirm

echo "Instalando o zsh..."
pacman -S --noconfirm zsh

echo "Instalando o oh‑my‑posh..."
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d /usr/local/bin

if ! command -v oh-my-posh >/dev/null 2>&1; then
    echo "Falha na instalação do oh‑my‑posh."
    exit 1
fi

echo "Definindo o zsh como shell padrão para o usuário $SUDO_USER..."
chsh -s "$(which zsh)" "$SUDO_USER"

# Define o diretório do usuário e o arquivo de configuração .zshrc
USER_HOME=$(eval echo "~$SUDO_USER")
ZSHRC="$USER_HOME/.zshrc"

# Se já existir um .zshrc, cria um backup
if [ -f "$ZSHRC" ]; then
    echo "Backup do .zshrc existente para .zshrc.bak"
    cp "$ZSHRC" "$ZSHRC.bak"
fi

# Baixa um tema padrão para o oh‑my‑posh
THEME_DIR="$USER_HOME/.poshthemes"
THEME_FILE="$THEME_DIR/atomic.omp.json"
if [ ! -f "$THEME_FILE" ]; then
    echo "Baixando o tema 'atomic' para oh‑my‑posh..."
    mkdir -p "$THEME_DIR"
    curl -s https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/refs/heads/main/themes/devious-diamonds.omp.yaml -o "$THEME_FILE"
fi

# Se o .zshrc não contém a linha de inicialização do oh‑my‑posh, adiciona-a
if ! grep -q "oh-my-posh --init" "$ZSHRC"; then
    echo "Configurando o .zshrc para inicializar o oh‑my‑posh..."
    {
        echo ""
        echo "# Inicializa o oh‑my‑posh"
        echo "eval \"\$(oh-my-posh --init --shell zsh --config \$HOME/.poshthemes/atomic.omp.json)\""
    } >> "$ZSHRC"
fi

echo "Setup concluído! Reinicie o terminal ou execute 'exec zsh' para aplicar as mudanças."
