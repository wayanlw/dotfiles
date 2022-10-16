#~/bin/bash
sudo cp $HOME/.dotfiles/evremap-keybinder/evremap.service /usr/lib/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable evremap.service
sudo systemctl start evremap.service
