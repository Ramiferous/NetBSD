#!/bin/sh -e
case $(file -bi "$1") in 
    image/png*|image/jpeg*) 
	feh -g 700x393 --scale-down "$1" 
    ;;
    *.mp3|*.flac|*.wav)
	mpv --no-video "$1"
    ;;

    video/*.mp4|*.mkv|*.webm)
	mpv --geometry=700x393 "$1"
    ;;

    *) xdg-open "$1" 
    ;; 
esac
