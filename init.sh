#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install curl -y
sudo apt install omxplayer -y
sudo apt install samba samba-common-bin -y

mkdir -m 1777 $HOME/playlist
curl https://raw.githubusercontent.com/Sachi854/play-video/main/playlist/a.mp4 -o $HOME/playlist/a.mp4
curl https://raw.githubusercontent.com/Sachi854/play-video/main/playlist/b.mp4 -o $HOME/playlist/b.mp4
curl https://raw.githubusercontent.com/Sachi854/play-video/main/playlist/c.mp4 -o $HOME/playlist/c.mp4

curl https://raw.githubusercontent.com/Sachi854/play-video/main/play-video.sh -o $HOME/playlist/play-video.sh
sudo mkdir -p /opt/pv/bin
sudo mv $HOME/playlist/play-video.sh /opt/pv/bin
sudo chmod 755 /opt/pv/bin
sudo chmod 755 /opt/pv/bin/play-video.sh

curl https://raw.githubusercontent.com/Sachi854/play-video/main/play-video.service -o $HOME/playlist/play-video.service
sudo mv $HOME/playlist/play-video.service /etc/systemd/system
sudo chmod 644 /etc/systemd/system/play-video.service 

sudo systemctl daemon-reload
sudo systemctl enable play-video.service

curl https://raw.githubusercontent.com/Sachi854/play-video/main/smb.conf -o $HOME/playlist/smb.conf
sudo mkdir /etc/samba/
sudo chmod 644 /etc/samba/
sudo touch /etc/samba/smb.conf
sudo mv $HOME/playlist/smb.conf /etc/samba/smb.conf
sudo chmod 644 /etc/samba/smb.conf

sudo systemctl restart smbd
