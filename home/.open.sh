#!/bin/sh -e
#
# fff & shfm open file in application based on file extension

case $(file -bi "$1") in 
    image/png*|image/jpg*|image/jpeg*) 
	feh -g 700x393 --scale-down "$1" 
    ;;
    audio/*)
	mpv --no-video "$1"
    ;;

    video/*)
	mpv --geometry=700x393 "$1"
    ;;

    *.html)
	luakit "$1"
    ;;

    *.pdf)
	zathura "$1"
    ;;

    # all other filr types
    *) 
	"${EDITOR:=vim}" "$1"
	#xdg-open "$1" 
    ;; 
esac
