alias を張ったコマンドに対しても bash-completion する方法

https://github.com/cykerway/complete-alias
https://unix.stackexchange.com/a/332522
https://formulae.brew.sh/formula/bash-completion@2

```
brew insatall bash-completion@2
curl https://raw.githubusercontent.com/cykerway/complete-alias/master/complete_alias > ~/.bash_completion.d/complete_alias
```

`.bash_profile` に `. ~/.bash_completion.d/complete_alias` を追加すると使える。
例： `complete -F _complete_alias kc`
(↑は、`alias kc=kubectl` というエイリアスが張られているという前提)


.bash_profile に記載されている `BASH_COMPLETION_USER_DIR="$HOME/.bash_completion.d"` に従って、
このディレクトリに各コマンドの completion の定義ファイルを置いておく。
see: https://github.com/scop/bash-completion?tab=readme-ov-file#faq
例： `kubectl completion bash > ${BASH_COMPLETION_USER_DIR}/kubectl`
(`kubectl` コマンド自身が自分の completion を生成するコマンドを持つので、その結果をリダイレクトする)
