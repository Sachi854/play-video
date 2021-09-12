#!/bin/bash

sudo apt update -y
sudo apt full-upgrade -y
sudo apt install curl -y
sudo apt install omxplayer -y
mkdir $HOME/playlist
curl https://raw.githubusercontent.com/Sachi854/play-video/main/play-video.sh -o $HOME/playlist/play-video.sh
curl https://raw.githubusercontent.com/Sachi854/play-video/main/playlist/a.mp4 -o $HOME/playlist/a.mp4
curl https://raw.githubusercontent.com/Sachi854/play-video/main/playlist/b.mp4 -o $HOME/playlist/b.mp4
curl https://raw.githubusercontent.com/Sachi854/play-video/main/playlist/c.mp4 -o $HOME/playlist/c.mp4
chmod +x $HOME/playlist/play-video.sh
mkdir -p $HOME/.config/lxsession/LXDE-pi
cp /etc/xdg/lxsession/LXDE-pi/autostart $HOME/.config/lxsession/LXDE-pi/
echo "@bash ~/playlist/play-video.sh" >> $HOME/.config/lxsession/LXDE-pi/autostart
