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
alias kc='kubectl'

cd() { builtin cd "$@" && ls; }  # list directory upon 'cd'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

git-pr() {  # git fetch pull-request's change into a new branch "PR/<id>".
  if [ $# -eq 0 ]; then
    echo "Error: Please specify pull-request number. Usage: git-pr 42"
    return 1
  else
    git fetch upstream pull/"$@"/head:PR/"$@" --update-head-ok  # https://stackoverflow.com/a/19205680/2500650
    echo "Branch PR/""$@"" is created/updated."
  fi
}

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


black?() {
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

isort?() {
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

lint?() {
  isort? "$@"
  black? "$@"
}

difff() {
  diff -u "$@" | diff-so-fancy
}
