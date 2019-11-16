# my configuration files

## 1. vim
I use the [vim-plug](https://github.com/junegunn/vim-plug) plugin manager.
To download and install it, execute ```install-vim-plug.sh```:

```bash
./install-vim-plug.sh
```

### how I use 'vimrc'
I have this single line in ```~/.vimrc```:

```vim
source "~/dotfiles/vimrc"
```

## 2. tmux
### how I use 'tmux.conf'
I have this line in ~/.tmux.conf:

```
source-file ~/dotfiles/tmux.conf
```
