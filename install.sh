#!/bin/bash

set -Cuex

HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for d in ".tmux.conf"; do
  ln -snfv ${HERE}/$d ${HOME}/$d
done
