`~/Downloads` 以下のファイルを定期的に日付名のフォルダにアーカイブする

参考： https://qiita.com/rsahara/items/7d37a4cb6c73329d4683

```bash
sudo chown root ~/Projects/dotfiles/launchd/DownloadArchive.plist
cd /Library/LaunchDaemons
sudo ln -s ~/Projects/dotfiles/launchd/DownloadArchive.plist
sudo launchctl load /Library/LaunchDaemons/DownloadArchive.plist
```
