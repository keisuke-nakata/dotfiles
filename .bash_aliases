if [[ "$(uname)" == "Linux" ]]; then  # linux
  # l: long
  # h: humanize disk usage
  # a: show hiddens
  # A: show hiddens except `.` and `..`
  # p: trailing directory mark `/`
  alias ls='ls --color=auto -p'
  alias ll='ls --color=auto -lhp'
  alias la='ls --color=auto -lAhp'

  alias abs='readlink -f'  # get absolute path of file/dir
elif [[ "$(uname)" == "Darwin" ]]; then  # mac
  # G: color
  # l: long
  # h: humanize disk usage
  # a: show hiddens
  # A: show hiddens except `.` and `..`
  # p: trailing directory mark `/`
  alias ls='ls -Gp'
  alias ll='ls -Glhp'
  alias la='ls -GlAhp'

  # requires `brew install coreutils` beforehand
  alias abs='greadlink -f'  # get absolute path of file/dir
  alias tac='gtac'
  alias sed='gsed'
fi

alias mv='mv -iv'
alias cp='cp -iv'
alias rename='rename -v'
alias less='less -R'  # color sequence

alias df='df -h'

cd() { builtin cd "$@" && ls; }  # list directory upon 'cd'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

git-pr() {  # git fetch pull-request's change into a new branch "PR/<id>".
  if [ $# -eq 0 ]; then
    echo "Error: Please specify pull-request number. Usage: git-pr 42"
    return 1
  else
    git fetch upstream pull/"$@"/head:PR/"$@"
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

# sshrm() {
#   ssh-keygen -R "$@"  # remove the entry from `known_hosts`.
#   ssh "$@"
# }
# alias sshrm='ssh-keygen -R '  # remove the entry from `known_hosts`.

alias tree='tree -CF'  # C: color, F: Appends '/', '=', '*', '@', '|' or '>' as per ls -F.

alias histfzy='history | tac | fzy'

alias atom='atom -a'  # open file within the existing atom window

slack() {
  if [ -z "$SLACK_URL" ]; then
    echo "Please set environment variable SLACK_URL."
  else
    MESSAGE=$1
    curl -X POST -H 'Content-type: application/json' --data '{"text":"'"$MESSAGE"'"}' ${SLACK_URL}
  fi
}

alias ipdb='python -m ipdb -c continue'

alias kc='kubectl'

if [ -f ~/.pfn_aliases ]; then
    . ~/.pfn_aliases
fi

black?() {
  black --check --diff "$@"

  if [ $? -eq 0 ]; then
    return 0;
  fi

  read -r -p "Execute black? [y/N] " response
  case "$response" in
    [yY][eE][sS]|[yY])
      echo ""
      black "$@"
      ;;
    *)
      echo "quit without black"
      ;;
  esac
}

isort?() {
  isort --check-only --diff "$@"

  if [ $? -eq 0 ]; then
    echo "isort: OK"
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
