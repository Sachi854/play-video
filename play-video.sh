#!/bin/bash
setterm -cursor off
video_path="$HOME/playlist"
video_files=($(find "$video_path"/* -type f -name "*.mp4"))
random_number=$(("$RANDOM" % ${#video_files[*]}))
omxplayer --loop --no-osd -o both "${video_files["$random_number"]}"