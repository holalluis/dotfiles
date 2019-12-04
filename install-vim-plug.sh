#!/bin/bash

# DOWNLOAD AND INSTALL VIM-PLUG PLUGIN MANAGER
# https://github.com/junegunn/vim-plug/wiki/tutorial

# download file and put it in the autoload folder
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
