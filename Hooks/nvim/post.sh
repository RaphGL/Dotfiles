#!/bin/sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

pip install pynvim msgpack-python jedi
sudo npm install -g neovim
