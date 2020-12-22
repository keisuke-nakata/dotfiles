alias を張ったコマンドに対しても bash-completion する方法

https://github.com/cykerway/complete-alias
https://unix.stackexchange.com/a/332522

```
brew insatall bash-completion@2
mkdir ~/.bash_completion.d
curl https://raw.githubusercontent.com/cykerway/complete-alias/master/complete_alias > ~/.bash_completion.d/complete_alias
```

`.bash_profile` に `source ~/.bash_completion.d/complete_alias` を追加して、 そのスクリプトの末尾に alias の completion を追記する。
例： `complete -F _complete_alias kc`
(↑は、`alias kc=kubectl` というエイリアスが張られているという前提)


.bash_profile に記載されている `export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"` に従って、
このディレクトリに各コマンドの completion の定義ファイルを置いておく。
例： `kubectl completion bash > ${BASH_COMPLETION_COMPAT_DIR}/kubectl`
(`kubectl` コマンド自身が自分の completion を生成するコマンドを持つので、その結果をリダイレクトする)
