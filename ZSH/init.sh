#! /bin/bash

ZSH_HOME=$HOME/.zsh
CONFIG_HOME=$HOME/.config

mkdir -p $ZSH_HOME
mkdir -p $CONFIG_HOME

cp .zshrc $HOME
cp aliases $ZSH_HOME
cp starship.toml $CONFIG_HOME

git clone https://github.com/wting/autojump.git $zsh_home/autojump
git clone https://github.com/zsh-users/zsh-autosuggestions.git $zsh_home/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $zsh_home/zsh-syntax-highlighting
