#!/bin/bash

set -Cuex

for d in ".tmux.conf"; do
  ln -snfv $d $HOME/$d
done
