export PATH=$HOME/local/bin:$HOME/bin:$PATH

export LD_LIBRARY_PATH=${HOME}/local/lib:$LD_LIBRARY_PATH

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
