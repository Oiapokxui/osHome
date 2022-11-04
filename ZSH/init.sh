#! /bin/bash

ZSH_HOME=$HOME/.zsh
CONFIG_HOME=$HOME/.config

mkdir -p $ZSH_HOME
mkdir -p $CONFIG_HOME

cp .zshrc $HOME
cp aliases $ZSH_HOME
cp starship.toml $CONFIG_HOME

git clone https://github.com/wting/autojump.git $ZSH_HOME/autojump
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_HOME/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_HOME/zsh-syntax-highlighting
