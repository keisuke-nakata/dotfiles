[tmuxをローカルインストールする時のメモ - Qiita](https://qiita.com/makisyu/items/d6b32d88cdd97b01a00f "tmuxをローカルインストールする時のメモ - Qiita")

# そもそも
`sudo yum/apt-get install tmux` で新しいバージョン (`tmux -V` -> 2.7 とか) が入るならそれで終わり。  
以下は `sudo` がなかったり OS が古くて `tmux` が古い場合の対処


```bash
cd $HOME
mkdir -p local/src
# Get&build libevent
wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
tar zxf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
./configure --prefix=${HOME}/local
make
make install
cd ../
# Get & build ncurses
wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz
tar zxf ncurses-6.1.tar.gz
cd ncurses-6.1
./configure --enable-pc-files --prefix=${HOME}/local --with-pkg-config-libdir=${HOME}/local/lib/pkgconfig --with-termlib
make
make install
cd ../
# Get tmux
wget https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz
tar zxf tmux-2.7.tar.gz
cd tmux-2.7
PKG_CONFIG_PATH=${HOME}/local/lib/pkgconfig ./configure --prefix=${HOME}/local
make
make install
```
