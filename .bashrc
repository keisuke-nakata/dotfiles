# .bash_profile, .bashrc の違いについては次の記事を参照: https://blog1.mammb.com/entry/2019/12/01/090000
#
# 達成したいこと
# if ログインシェル?:
#   ~/.bash_profile を読み込む
# if インタラクティブシェル?:
#   ~/.bashrc を読み込む
#
# しかし、OS の読み込みロジックは次のようになっている。
# if ログインシェル?:
#   ~/.bash_profile を読み込む
# else if インタラクティブシェル?:
#   ~/.bashrc を読み込む
#
# そこで、 ~/.bash_profile の最後で ~/.bashrc を読み込むようにしたうえで、 ~/.bashrc の冒頭に「not インタラクティブならば何もしない」というロジックを仕込むことで所望の動作を達成する。
#
# ログインシェルとは、ユーザセッションの開始時に起動するシェルのこと。(つまり、すでに動いている bash 上で `bash` で新しくシェルを起動したときや、shell script 実行のために起動されたシェルはログインシェルではない)
# インタラクティブシェルとは、ユーザが対話的にコマンドを入力するためのシェルのこと。(つまり、shell script 実行のために起動されたシェルはインタラクティブシェルではない)
#
# よって、`~/.bash_profile` には `PATH` をはじめとする環境変数を設定し、`~/.bashrc` にはエイリアスやプロンプトを設定する。
#
# ターミナルアプリで新しいターミナルを開いたとき
#   - (Mac) yes ログインシェル, (Linux) not ログインシェル
#   - yes インタラクティブシェル
# ssh login したとき
#   - yes ログインシェル
#   - yes インタラクティブシェル
# tmux で新しい pane を開いたとき
#   - yes ログインシェル (not ログインシェルであることが想定されるが、実際には yes ログインシェル)
#   - yes インタラクティブシェル
# shell script を実行したとき
#   - not ログインシェル
#   - not インタラクティブシェル

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

###
# prompt
###
export PS1='\[\e[0;36m\]\u@\h (\D{%Y-%m-%dT%H:%M:%S}): \w\n\[\e[0;37m\]\$ '
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
# pyenv (via https://github.com/pyenv/pyenv-installer)
###
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

###
# jenv (via homebrew)
###
if command -v jenv >/dev/null 2>&1; then
  eval "$(jenv init -)"
fi

###
# NVM (via homebrew)
###
# TODO: bashrc は毎回読み込まれるため、nvm load のために毎回ターミナル起動に時間がかかる問題が有名。気になったら lazy load するようにする。
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm


###
# alias
###
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

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
