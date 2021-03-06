export PATH=$HOME/local/bin:$HOME/bin:/usr/local/opt/gettext/bin:/usr/local/sbin:$PATH

export LD_LIBRARY_PATH=${HOME}/local/lib:$LD_LIBRARY_PATH

export PS1='\[\e[0;36m\]\u@\h (\D{%Y-%m-%dT%H:%M:%S}): \w\n\[\e[0;37m\]\$ '

export EDITOR=nano

# for history
export HISTTIMEFORMAT='%F %T '
export HISTFILESIZE=100000  # HISTFILE save size
export HISTSIZE=100000  # bash history size

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# for pyenv
if [ -d ~/.pyenv/ ]; then
  export PATH="/Users/keisuke.nakata/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  # pyenv-virtualenv: prompt changing will be removed from future release. configure `export PYENV_VIRTUALENV_DISABLE_PROMPT=1' to simulate the behavior.
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
  # https://github.com/pyenv/pyenv-virtualenv/issues/135#issuecomment-754414842
  export BASE_PROMPT=$PS1
  function updatePrompt {
    PYENV_VER=$(pyenv version-name)                 # capture version name in variable
    if [[ "${PYENV_VER}" != "$(pyenv global | paste -sd ':' -)" ]]; then
      export PS1="(${PYENV_VER%%:*}) "$BASE_PROMPT  # grab text prior to first ':' character
    else
      export PS1=$BASE_PROMPT
    fi
  }
  export PROMPT_COMMAND='updatePrompt'
fi

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
