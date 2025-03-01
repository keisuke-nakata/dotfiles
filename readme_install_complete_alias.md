## alias を張ったコマンドに対しても bash-completion する方法

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

## bash-completion の設定
.bash_profile に記載されている `BASH_COMPLETION_USER_DIR="$HOME/.bash_completion.d"` に従って、
`${BASH_COMPLETION_USER_DIR}/completions` に completion の定義ファイルを置く。
see: https://github.com/scop/bash-completion?tab=readme-ov-file#faq

### 例
#### `kubectl`
`kubectl completion bash > ${BASH_COMPLETION_USER_DIR}/completions/kubectl`
(`kubectl` コマンド自身が自分の completion を生成するコマンドを持つので、その結果をリダイレクトする)
kubectl を brew で入れてるなら勝手に completion も入るので不要

#### `git`
`curl https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-completion.bash > ${BASH_COMPLETION_USER_DIR}/completions/git`
(`git` 本体のリポジトリに completion の定義ファイルがあるので、それをダウンロードしてくる)
