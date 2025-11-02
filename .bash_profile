###
# Mac 用に書いているので、Linux 向けには適当に内容を選んで、デフォルトの ~/.bashrc を編集してください
###

shopt -s checkwinsize  # check the window size after each command and, if necessary, update the values of LINES and COLUMNS.

export PATH=$HOME/local/bin:$HOME/bin:/usr/local/opt/gettext/bin:/usr/local/sbin:$PATH
export LD_LIBRARY_PATH=${HOME}/local/lib:$LD_LIBRARY_PATH
export PS1='\[\e[0;36m\]\u@\h (\D{%Y-%m-%dT%H:%M:%S}): \w\n\[\e[0;37m\]\$ '
export EDITOR=nano
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo  # https://gpanders.com/blog/the-definitive-guide-to-using-tmux-256color-on-macos/

###
# history
###
HISTTIMEFORMAT='%F %T '
HISTSIZE=10000  # bash history size
HISTFILESIZE=10000  # HISTFILE save size
HISTCONTROL=ignoreboth  # don't put duplicate lines or lines starting with space in the history. See bash(1) for more options
shopt -s histappend  # append to the history file, don't overwrite it

###
# homebrew
###
eval "$(/opt/homebrew/bin/brew shellenv)"

###
# pyenv (via https://github.com/pyenv/pyenv-installer)
# & python
###
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1  # pyenv-virtualenv: prompt changing will be removed from future release. configure `export PYENV_VIRTUALENV_DISABLE_PROMPT=1' to simulate the behavior.

# update prompt
export BASE_PROMPT=$PS1
function updatePrompt {
  # https://github.com/pyenv/pyenv-virtualenv/issues/135#issuecomment-754414842
  PYENV_VER=$(pyenv version-name)                 # capture version name in variable
  if [[ "${PYENV_VER}" != "$(pyenv global | paste -sd ':' -)" ]]; then
    export PS1="(${PYENV_VER%%:*}) "$BASE_PROMPT  # grab text prior to first ':' character
  else
    export PS1=$BASE_PROMPT
  fi
}
export PROMPT_COMMAND='updatePrompt'

# PYTHONBREAKPOINT=ipdb.set_trace

###
# jenv (via homebrew)
###
if [ -d ~/.jenv/ ]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
  # jenv enable-plugin export
fi

###
# openssl
###
# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

###
# google cloud sdk (gcloud, gsutil, bq)
###
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/google-cloud-sdk/path.bash.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/google-cloud-sdk/completion.bash.inc"; fi

###
# NVM (via homebrew)
###
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

###
# uv & uv tools
###
. "$HOME/.local/bin/env"

###
# pfbuild
###
export PFBUILD_BUILDCTL=$HOME/bin/buildctl

###
# Rancher Desktop
###
export PATH=$HOME/.rd/bin:$PATH

###
# completion (via `brew install bash-completion@2`)
###
# bash completion for brew-installed commands
# `bash-completion@2` requries bash 4.2+. see readme_update_bash.md
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
# alias completion (https://github.com/cykerway/complete-alias)
if [ -f ~/.bash_completion.d/complete_alias ]; then
  . ~/.bash_completion.d/complete_alias
fi
export BASH_COMPLETION_USER_DIR="$HOME/.bash_completion.d"  # https://github.com/scop/bash-completion?tab=readme-ov-file#faq

###
# aliases
###
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
