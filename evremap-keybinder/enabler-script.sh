#~/bin/bash
MYHOME="/home/ww"
sudo systemctl stop evremap.service
sudo cp $MYHOME/.dotfiles/evremap-keybinder/evremap.service /usr/lib/systemd/system/
sudo cp ./evremap /usr/bin/evremap
sudo cp ./ww-evremap.toml $MYHOME/.config/
sudo systemctl daemon-reload
sudo systemctl enable evremap.service
sudo systemctl start evremap.service
