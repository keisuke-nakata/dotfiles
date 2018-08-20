インタラクティブ検索コマンド `fzy` のインストール方法メモ

[jhawthorn/fzy: A better fuzzy finder](https://github.com/jhawthorn/fzy "jhawthorn/fzy: A better fuzzy finder")

`history | fzy` とかが便利



```bash
cd $HOME
mkdir -p local/src
cd local/src
git clone git@github.com:jhawthorn/fzy.git
cd fzy
PREFIX=$HOME make
PREFIX=$HOME make install
```
