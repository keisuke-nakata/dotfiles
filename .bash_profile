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

# for pyenv
if [ -d ~/.pyenv/ ]; then
    export PATH="/Users/keisuke.nakata/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# # for gcloud
# export CLOUDSDK_PYTHON=/Users/thr3a/.pyenv/versions/2.7.12/bin/python
# http://thr3a.hatenablog.com/entry/20180312/1520828533

# for iterm2
# this setting should be put at end.
if [ -d ~/.iterm2/ ]; then
    source ~/.iterm2_shell_integration.bash
fi

if [ -f ~/.secret_profile ]; then
    . ~/.secret_profile
fi
