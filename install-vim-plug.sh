#!/bin/bash

# DOWNLOAD AND INSTALL VIM-PLUG PLUGIN MANAGER

#download vim-plug and put it in the autoload folder
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

