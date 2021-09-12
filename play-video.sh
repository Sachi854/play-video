#!/bin/sh
setterm -cursor off
VIDEOPATH="/home/pi/playlist"
SERVICE="omxplayer"

trap 'exit' SIGINT

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
