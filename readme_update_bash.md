Mac では bash のバージョンが古いので更新したい
https://itnext.io/upgrading-bash-on-macos-7138bd1066ba

`brew install bash` して、 `which -a bash` で

```
/opt/homebrew/bin/bash  ← 5.0
/bin/bash               ← 最初から入ってるやつ
```

になることを確認。

`/etc/shells` を編集して、末尾に `/opt/homebrew/bin/bash` を追記 (要 sudo)

あとは `chsh -s /opt/homebrew/bin/bash` をすれば OK!
