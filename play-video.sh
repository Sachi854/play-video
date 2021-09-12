#!/bin/sh
setterm -cursor off
VIDEOPATH="$HOME/playlist"
SERVICE="omxplayer"

signals() {
  echo "exit"
  exit
}

trap signals SIGHUP SIGINT SIGKILL SIGTERM SIGQUIT

while true; do
        if ps ax | grep -v grep | grep $SERVICE > /dev/null; then
        	sleep 1;
	else
        	for entry in $VIDEOPATH/*; do
                	clear
                	omxplayer --refresh -o both $entry > /dev/null
       		done
	fi
done
