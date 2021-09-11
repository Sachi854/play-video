#!/bin/sh

sudo apt update -y
sudo apt full-upgrade -y
sudo apt install curl -y
sudo apt install omxplayer -y
mkdir ~/playlist
curl https://raw.githubusercontent.com/Sachi854/play-video/main/play-video.sh -o ~/playlist/play-video.sh
curl https://raw.githubusercontent.com/Sachi854/play-video/main/list/a.mp4 -o ~/playlist/a.mp4
curl https://raw.githubusercontent.com/Sachi854/play-video/main/list/b.mp4 -o ~/playlist/b.mp4
curl https://raw.githubusercontent.com/Sachi854/play-video/main/list/c.mp4 -o ~/playlist/c.mp4
chmod +x ~/playlist/play-video.sh
mkdir -p ~/.config/lxsession/LXDE-pi
cp /etc/xdg/lxsession/LXDE-pi/autostart ~/.config/lxsession/LXDE-pi/
echo "@bash ~/playlist/play-video.sh" >> ~/.config/lxsession/LXDE-pi/autostart
