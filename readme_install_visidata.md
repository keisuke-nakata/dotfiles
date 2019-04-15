sudo 権限がないときの visidata install memo

http://visidata.org/install/#dpkg

- `wget https://github.com/saulpw/deb-vd/raw/master/pool/main/v/visidata/visidata_1.5.2-1_all.deb`
- `dpkg -x visidata_1.5.2-1_all.deb ${HOME}/local`
  - PATH も通しておく (`${HOME}/local/usr/bin/`)
- `/usr/bin/python3 -m pip install visidata`
  - `/usr/bin/python3` は `which vd` して出てきた `vd` スクリプトのシェバン
