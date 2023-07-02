# Mac 用に書いているので、Linux 向けには適当に内容を選んで、デフォルトの ~/.bashrc を編集してください

export PATH=$HOME/local/bin:$HOME/bin:/usr/local/opt/gettext/bin:/usr/local/sbin:$PATH

export LD_LIBRARY_PATH=${HOME}/local/lib:$LD_LIBRARY_PATH

export PS1='\[\e[0;36m\]\u@\h (\D{%Y-%m-%dT%H:%M:%S}): \w\n\[\e[0;37m\]\$ '

export EDITOR=nano

###
# for history
###
HISTTIMEFORMAT='%F %T '
HISTSIZE=10000  # bash history size
HISTFILESIZE=10000  # HISTFILE save size

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi


# for pyenv (via https://github.com/pyenv/pyenv-installer)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
# if [ -n "$PS1" -a -n "$BASH_VERSION" ]; then source ~/.bashrc; fi

# eval "$(pyenv init -)"
eval "$(pyenv init - --no-rehash)"

eval "$(pyenv virtualenv-init -)"
# pyenv-virtualenv: prompt changing will be removed from future release. configure `export PYENV_VIRTUALENV_DISABLE_PROMPT=1' to simulate the behavior.
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# for jenv
if [ -d ~/.jenv/ ]; then
  # export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

if [ -f ~/.secret_profile ]; then
  . ~/.secret_profile
fi

# openssl
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

# poetry
export PATH="$HOME/.poetry/bin:$PATH"

# RUST
. "$HOME/.cargo/env"

# google cloud sdk
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/google-cloud-sdk/path.bash.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/google-cloud-sdk/completion.bash.inc"; fi

# NVM (via homebrew)
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# gvm (https://github.com/moovweb/gvm)
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# https://gpanders.com/blog/the-definitive-guide-to-using-tmux-256color-on-macos/
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo

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

  # # nvm
  # NODE_VER=$(node -v)
}
export PROMPT_COMMAND='updatePrompt'

# for iterm2
# this setting should be put at end.
if [ -d ~/.iterm2/ ]; then
  source ~/.iterm2_shell_integration.bash
fi

# This should be put the last!
# for bash completion
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

if [ -f ~/.bash_completion.d/complete_alias ]; then
  . ~/.bash_completion.d/complete_alias
fi
