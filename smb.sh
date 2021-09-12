#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install curl -y
sudo apt install tee -y
sudo apt install samba samba-common-bin -y

sudo cp /etc/samba/smb.conf /etc/samba/smb.conf~
mkdir -m 1777 $HOME/playlist
curl https://raw.githubusercontent.com/Sachi854/play-video/main/smb.conf -o $HOME/smb.conf
cat ~/smb.conf | sudo tee -a /etc/samba/smb.conf
rm $HOME/smb.conf
sudo systemctl restart smbd
