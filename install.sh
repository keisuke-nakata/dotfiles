#!/bin/bash

set -Cuex

HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sym link dotfiles
for d in ".tmux.conf" ".nanorc" ".nano" ".bash_profile" ".bash_aliases" ".pfn_aliases"; do
read -r -p "Sym-link ${d}? (may overwrite existing) [y/N] " response
case "$response" in
  [yY][eE][sS]|[yY])
    ln -snfv ${HERE}/${d} ${HOME}/${d}
    ;;
  *)
    echo "skip sym-linking ${d}"
    ;;
esac

mkdir $HOME/bin

# install pbcopy
read -r -p "Install pbcopy? (Do not install it on OSX) [y/N] " response
case "$response" in
  [yY][eE][sS]|[yY])
    wget https://raw.githubusercontent.com/skaji/remote-pbcopy-iterm2/master/pbcopy
    chmod +x pbcopy
    mv pbcopy $HOME/bin
    ;;
  *)
    echo "skip installing pbcpy"
    ;;
esac

# set timezone
sudo timedatectl set-timezone Asia/Tokyo

for c in $(ls bin/); do
  ln -snfv ${HERE}/bin/$c ${HOME}/bin/$c
done

echo "you must put .bashrc manually".
