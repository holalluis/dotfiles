#!/bin/bash

# DOWNLOAD AND INSTALL VIM-PLUG PLUGIN MANAGER

#ssl accept insecure requests
export GIT_SSL_NO_VERIFY=true

#create autoload folder
mkdir -p ~/.vim/autoload

#download vim-plug and put it in the autoload folder
url="https://raw.github.com/junegunn/vim-plug/master/plug.vim"
curl --insecure -fLo ~/.vim/autoload/plug.vim "$url"
