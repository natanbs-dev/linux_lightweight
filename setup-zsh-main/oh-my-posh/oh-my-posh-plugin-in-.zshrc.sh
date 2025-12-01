#!/bin/bash

# adicione as seguintes linhas ao final do arquivo .zshrc para melhor funcionamento


export PATH=$PATH:~/.local/bin

eval "$(oh-my-posh init zsh)"

eval "$(oh-my-posh init zsh --config ~/.poshthemes/sonicboom_dark.omp.json)"

#themes-oh-my-posh:
        #plague.omp.json
        #jblab_2021.omp.json
        #night-owl.omp.json
        #sonicboom_dark.omp.json

