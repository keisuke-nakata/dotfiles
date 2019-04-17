alias を張ったコマンドに対しても bash-completion する方法

https://github.com/cykerway/complete-alias
https://unix.stackexchange.com/a/332522

```
mkdir ~/.bash_completion.d
curl https://raw.githubusercontent.com/cykerway/complete-alias/master/bash_completion.sh > ~/.bash_completion.d/complete_alias
```

`.bash_profile` に `source ~/.bash_completion.d/complete_alias` を追加して、 そのスクリプトの末尾に alias の completion を追記する
