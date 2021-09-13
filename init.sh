#!/bin/bash

# software update
sudo apt update -y
sudo apt upgrade -y
sudo apt install curl -y
sudo apt install tee -y
sudo apt install omxplayer -y
sudo apt install samba samba-common-bin -y

# download demo video
mkdir -m 1777 "$HOME"/playlist
curl https://raw.githubusercontent.com/Sachi854/play-video/main/playlist/a.mp4 -o "$HOME"/playlist/a.mp4
curl https://raw.githubusercontent.com/Sachi854/play-video/main/playlist/b.mp4 -o "$HOME"/playlist/b.mp4
curl https://raw.githubusercontent.com/Sachi854/play-video/main/playlist/c.mp4 -o "$HOME"/playlist/c.mp4

# set play video script
curl https://raw.githubusercontent.com/Sachi854/play-video/main/play-video.sh -o "$HOME"/playlist/play-video.sh
curl https://raw.githubusercontent.com/Sachi854/play-video/main/LICENSE -o "$HOME"/playlist/LICENSE
sudo mkdir -p /opt/pv/bin
sudo mv "$HOME"/playlist/play-video.sh /opt/pv/bin
sudo mv "$HOME"/playlist/LICENSE /opt/pv/bin
sudo chmod 755 /opt/pv/bin
sudo chmod 755 /opt/pv/bin/play-video.sh

# enable play video demon
curl https://raw.githubusercontent.com/Sachi854/play-video/main/play-video.service -o "$HOME"/playlist/play-video.service
sudo mv "$HOME"/playlist/play-video.service /etc/systemd/system
sudo chmod 644 /etc/systemd/system/play-video.service 

sudo systemctl daemon-reload
sudo systemctl enable play-video.service

# enable samba server
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf~
curl https://raw.githubusercontent.com/Sachi854/play-video/main/smb.conf | sudo tee -a /etc/samba/smb.conf
sudo systemctl restart smbd
