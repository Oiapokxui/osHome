#! /bin/bash

ZSH_HOME=$HOME/.zsh
CONFIG_HOME=$HOME/.config

mkdir -p $ZSH_HOME
mkdir -p $CONFIG_HOME

brew install starship
brew install eza
brew install autojump
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

cp .zshrc $HOME
cp aliases $ZSH_HOME
cp starship.toml $CONFIG_HOME
