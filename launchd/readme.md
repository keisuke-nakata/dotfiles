参考： https://qiita.com/rsahara/items/7d37a4cb6c73329d4683

```bash
sudo chown root /Users/keisuke.nakata/Projects/dotfiles/launchd/DownloadArchive.plist
cd /Library/LaunchDaemons
sudo ln -s /Users/keisuke.nakata/Projects/dotfiles/launchd/DownloadArchive.plist
sudo launchctl load /Library/LaunchDaemons/DownloadArchive.plist
```
