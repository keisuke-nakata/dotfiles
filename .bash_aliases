# Mac/Linx 共通で設定したい aliases

if [[ "$(uname)" == "Linux" ]]; then  # linux
  if [ -f ~/.bash_aliases.linux ]; then
      . ~/.bash_aliases.linux
  fi
elif [[ "$(uname)" == "Darwin" ]]; then  # mac
  if [ -f ~/.bash_aliases.macos ]; then
      . ~/.bash_aliases.macos
  fi
fi

alias mv='mv -iv'
alias cp='cp -iv'
alias rename='rename -v'
alias less='less -R'  # color sequence
alias tree='tree -CF'  # C: color, F: Appends '/', '=', '*', '@', '|' or '>' as per ls -F.
alias histfzy='history | tac | fzy'
alias kc='kubectl' && complete -F _complete_alias kc

cd() { builtin cd "$@" && ls; }  # list directory upon 'cd'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

# https://stackoverflow.com/a/28464339/2500650
git-prune-untracked() {
  git branch --merged | egrep -v "(^\*|master|main)"
  read -r -p "Remove branches listed below? [y/N] " response
  case "$response" in
    [yY][eE][sS]|[yY])
      echo ""
      git branch --merged | egrep -v "(^\*|master|main|develop)" | xargs git branch -d
      ;;
    *)
      echo "quit without git-prune-untracked"
      ;;
  esac
}


alias rsync-git-core='rsync --exclude ".git" --exclude "__pycache__" --exclude ".mypy_cache" --exclude \".eggs\" --exclude \"*.egg-info\" -h'
# Usage: rsync-git-core -acvz --delete /path/to/project/prj_dir remote:/path/to/project/ --dry-run

rsync-git() {
  rsync-git-core "$@" --dry-run

  read -r -p "Execute rsync? [y/N] " response
  case "$response" in
    [yY][eE][sS]|[yY])
      echo ""
      rsync-git-core "$@"
      ;;
    *)
      echo "quit without rsync"
      ;;
  esac
}
# Usage: rsync-git -acvz --delete /path/to/project/prj_dir remote:/path/to/project/


# black?() {} と書くのが推奨だけど、本来 "?" はワイルドカードなのでコマンド名に使えないので、古いスタイルの関数定義を使う
function black? {
  echo -n "black..."
  black --check --diff -q "$@"

  if [ $? -eq 0 ]; then
    echo "OK"
    return 0;
  fi

  read -r -p "Execute black? [y/N] " response
  case "$response" in
    [yY][eE][sS]|[yY])
      echo ""
      black -q "$@"
      ;;
    *)
      echo "quit without black"
      ;;
  esac
}

function isort? {
  echo -n "isort..."
  isort --check-only --diff "$@"

  if [ $? -eq 0 ]; then
    echo "OK"
    return 0;
  fi

  read -r -p "Execute isort? [y/N] " response
  case "$response" in
    [yY][eE][sS]|[yY])
      echo ""
      isort "$@"
      ;;
    *)
      echo "quit without isort"
      ;;
  esac
}

function lint? {
  isort? "$@"
  black? "$@"
}

difff() {
  diff -u "$@" | diff-so-fancy
}

# see https://github.com/keisuke-nakata/texlive-ja/blob/main/Makefile
latexmk() {
  local cmd="latexmk $@"
	docker run --rm -it -v ${PWD}:/workdir texlive-ja:latest sh -c "${cmd}"
}
