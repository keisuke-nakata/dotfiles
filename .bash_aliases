if [[ "$(uname)" == "Linux" ]]; then  # linux
  # l: long
  # h: humanize disk usage
  # a: show hiddens
  # A: show hiddens except `.` and `..`
  # p: trailing directory mark `/`
  alias ls='ls --color=auto -p'
  alias ll='ls --color=auto -lhp'
  alias la='ls --color=auto -lAhp'
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
fi

alias mv='mv -iv'
alias cp='cp -iv'

alias df='df -h'

cd() { builtin cd "$@" && ls }  # list directory upon 'cd'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

alias targzx='tar zxvf'
alias targzc='tar zcvf'

alias rsync-git-core='rsync --exclude ".git" --exclude "__pycache__" -h'
# rsync-git-core -acvz --delete /path/to/project/prj_dir remote:/path/to/project/ --dry-run

functionrsyncgit() {  # hyphen/underscore is not allowed for function names...
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
alias rsync-git='functionrsyncgit'
# rsync-git -acvz --delete /path/to/project/prj_dir remote:/path/to/project/


alias sshrm='ssh-keygen -R'  # remove the entry from `known_hosts`.

alias abs='readlink -f'  # get absolute path of file/dir

alias tree='tree -CF'  # C: color, F: Appends '/', '=', '*', '@', '|' or '>' as per ls -F.

slack() {
  if [ -z "$SLACK_URL" ]; then
    echo "Please set environment variable SLACK_URL."
  else
    MESSAGE=$1
    curl -X POST -H 'Content-type: application/json' --data '{"text":"'"$MESSAGE"'"}' ${SLACK_URL}
  fi
}
