export PATH=$HOME/local/bin:$HOME/bin:/usr/local/opt/gettext/bin:$PATH

export LD_LIBRARY_PATH=${HOME}/local/lib:$LD_LIBRARY_PATH

export PS1='\[\e[0;36m\]\u@\h (\D{%Y-%m-%dT%H:%M:%S}): \w\n\[\e[0;37m\]\$ '

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

# for jenv
if [ -d ~/.jenv/ ]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

# # for gcloud
# export CLOUDSDK_PYTHON=/Users/thr3a/.pyenv/versions/2.7.12/bin/python
# http://thr3a.hatenablog.com/entry/20180312/1520828533

if [ -f ~/.secret_profile ]; then
  . ~/.secret_profile
fi

# for iterm2
# this setting should be put at end.
if [ -d ~/.iterm2/ ]; then
  source ~/.iterm2_shell_integration.bash
fi

# for airflow
export AIRFLOW_HOME=${HOME}/.airflow

# openssl
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

# poetry
export PATH="$HOME/.poetry/bin:$PATH"

# This should be put the last!
# for bash completion
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

if [ -f ~/.bash_completion.d/complete_alias ]; then
  . ~/.bash_completion.d/complete_alias
fi

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/keisuke.nakata/.pyenv/versions/anaconda3-2020.02/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/keisuke.nakata/.pyenv/versions/anaconda3-2020.02/etc/profile.d/conda.sh" ]; then
#         . "/Users/keisuke.nakata/.pyenv/versions/anaconda3-2020.02/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/keisuke.nakata/.pyenv/versions/anaconda3-2020.02/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<
#

# nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"
