alias ll='ls -alF'
alias la='ls -Alh'
alias l='ls -CF'

alias targzx='tar zxvf'
alias targzc='tar zcvf'

alias rsync-git='rsync --exclude ".git" --exclude "__pycache__"'
# rsync-git -acvz --delete /path/to/project/prj_dir remote:/path/to/project/ --dry-run

function slack() {
  if [ -z "$SLACK_URL" ]; then
    echo "Please set an environment variable SLACK_URL."
  else
    MESSAGE=$1
    curl -X POST -H 'Content-type: application/json' --data '{"text":"'"$MESSAGE"'"}' ${SLACK_URL}
  fi
}