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

alias mv='mv -i'
alias cp='cp -i'

alias targzx='tar zxvf'
alias targzc='tar zcvf'

alias rsync-git='rsync --exclude ".git" --exclude "__pycache__" -h'
# rsync-git -acvz --delete /path/to/project/prj_dir remote:/path/to/project/ --dry-run

function slack() {
  if [ -z "$SLACK_URL" ]; then
    echo "Please set environment variable SLACK_URL."
  else
    MESSAGE=$1
    curl -X POST -H 'Content-type: application/json' --data '{"text":"'"$MESSAGE"'"}' ${SLACK_URL}
  fi
}
