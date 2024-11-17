sudo 権限がないときの nano install memo

https://askubuntu.com/a/350

- `apt-get download nano`
- `dpkg -x nano_XXX.deb ${HOME}/local`
  - PATH も通しておく


nanorc の設定
https://github.com/scopatz/nanorc

```bash
git clone git@github.com:scopatz/nanorc.git ~/Projects/nanorc
ln -s ~/Projects/dotfiles/.nanorc ~/.nanorc
```