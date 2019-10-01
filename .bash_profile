export PATH=$HOME/local/bin:$HOME/bin:/usr/local/opt/gettext/bin:$PATH

export LD_LIBRARY_PATH=${HOME}/local/lib:$LD_LIBRARY_PATH

export PS1='\[\e[0;36m\]\u@\h: \w\n\[\e[0;37m\]\$ '

export EDITOR=nano

# for history
export HISTTIMEFORMAT='%F %T '
export HISTFILESIZE=100000

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

if [ -f ~/.secret_profile ]; then
  . ~/.secret_profile
fi

# for bash completion
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

if [ -f ~/.bash_completion.d/complete_alias ]; then
  . ~/.bash_completion.d/complete_alias
fi

# for iterm2
# this setting should be put at end.
if [ -d ~/.iterm2/ ]; then
  source ~/.iterm2_shell_integration.bash
fi
