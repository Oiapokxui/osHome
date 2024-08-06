#! /bin/bash

ZSH_HOME=$HOME/.zsh
CONFIG_HOME=$HOME/.config

mkdir -p $ZSH_HOME
mkdir -p $CONFIG_HOME

cp .zshrc $HOME
cp aliases $ZSH_HOME
cp starship.toml $CONFIG_HOME

brew install autojum
brew install zsh-autosuggestions
brew isntall zsh-syntax-highlighting
