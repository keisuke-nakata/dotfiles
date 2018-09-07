export PATH=$HOME/local/bin:$HOME/bin:$PATH

export LD_LIBRARY_PATH=${HOME}/local/lib:$LD_LIBRARY_PATH

export PS1='\[\e[0;36m\]\u@\h: \w\n\[\e[0;37m\]\$ '

# for history
export HISTTIMEFORMAT='%F %T '
export HISTFILESIZE=100000

# for bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
