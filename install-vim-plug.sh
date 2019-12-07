#!/bin/bash

# DOWNLOAD AND INSTALL VIM-PLUG PLUGIN MANAGER
# https://github.com/junegunn/vim-plug/wiki/tutorial

# Vim (~/.vim/autoload)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Neovim (~/.local/share/nvim/site/autoload)
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
