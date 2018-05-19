#!/bin/bash

set -Cuex

HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for d in ".tmux.conf"; do
  ln -snfv ${HERE}/$d ${HOME}/$d
done

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

# for c in "imgcat"; do
#   ln -snfv ${HERE}/$c ${HOME}/bin/$c
# done
