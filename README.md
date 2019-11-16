# my configuration files

## 1. vim (how I use it)
I use [junegunn/vim-plug](https://github.com/junegunn/vim-plug) plugin manager.
Assuming that ```vim``` is already installed, execute this:

```bash
bash install-vim-plug.sh
```

Put this single line in ```~/.vimrc```:

```vim
source "~/dotfiles/vimrc"
```

Then, the first time you open vim, execute:

```vim
:PlugInstall
```

This ```vim-plug``` command will install all the plugins used by my ```vimrc```
file.

Install is complete. Enjoy!

## 2. tmux (how I use it)
Put this single line in ```~/.tmux.conf```:

```tmux
source-file ~/dotfiles/tmux.conf
```
