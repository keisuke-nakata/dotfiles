Mac の場合は最初から入っているのですることはない。

Linux の場合は：

```bash
# install pbcopy
read -r -p "Install pbcopy? (Do not install it on OSX) [y/N] " response
case "$response" in
  [yY][eE][sS]|[yY])
    wget https://raw.githubusercontent.com/skaji/remote-pbcopy-iterm2/master/pbcopy
    chmod +x pbcopy
    mv pbcopy $HOME/bin
    ;;
  *)
    echo "skip installing pbcpy"
    ;;
esac
```
