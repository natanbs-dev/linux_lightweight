# setup oh-my-zsh && oh-my-posh

## setup no linux

## **oh my zsh setup**

- instale as dependências antes de tudo:

```bash
sudo apt install -y git curl zsh
```

- clone e execute o install.sh oficial do site:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

- instale demais plugins (opcional)

```bash
sudo apt install -y zsh-autosuggestions zsh-common
```

## **oh my posh setup**

```bash
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d /usr/local/bin
```

```bash
oh-my-posh --version
```

**configure o Zsh como shell padrão**

```bash
chsh -s $(which zsh)
```

 **Configure o arquivo de inicialização do Zsh**

O arquivo de configuração do Zsh é o `~/.zshrc`. Edite-o (se não existir, crie-o) e adicione a linha para inicializar o oh‑my‑posh com o tema desejado. Por exemplo, se você baixar o tema “atomic”, faça o seguinte:

1. **Baixe um tema (por exemplo, “atomic”)**  
    Crie uma pasta para os temas (caso ainda não exista):

    ```bash
    mkdir -p ~/.poshthemes
    ```

    Em seguida, baixe o tema “atomic”:

    ```bash
    curl -s https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/atomic.omp.json -o ~/.poshthemes/atomic.omp.json
    ```

2. **Adicione a inicialização do oh‑my‑posh ao .zshrc**  
    Abra o arquivo:

    ```bash
    nano ~/.zshrc
    ```

    E insira, de preferência no final, a seguinte linha:

    ```bash
    # Inicializa o oh‑my‑posh com o tema atomic
    eval "$(oh-my-posh --init --shell zsh --config $HOME/.poshthemes/atomic.omp.json)"
    ```

## temas interessantes

**zsh**

- jonathan
- robbyrussell
- agnoster

**oh my posh:**

- plague
- jblab_2021
- devious-diamonds
- cloud-native-azure
- froczh
