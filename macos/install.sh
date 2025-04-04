#!/bin/bash

mkdir -p $HOME/.config/nvim

if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
  git clone --depth 1 \
    https://github.com/wbthomason/packer.nvim \
    $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

ln -fs $HOME/.confignix/nvim/config/init.vim $HOME/.config/nvim/init.vim
