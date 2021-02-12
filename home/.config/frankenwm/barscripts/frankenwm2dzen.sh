#!/usr/bin/env sh

# create a fifo to send output
wm="frankenwm"
ff="/tmp/frankenwm.fifo"
[[ -p $ff ]] || mkfifo -m 600 "$ff"

while read -r; do
    # filter output to only what we want to match and parse
    [[ $REPLY =~ ^(([[:digit:]]+:)+[[:digit:]]+ ?)+$ ]] && read -ra desktops <<< "$REPLY" || continue
    for desktop in "${desktops[@]}"; do
        # set values for
        # d - the desktop id
        # w - number of windows in that desktop
        # m - tiling layout/mode for that desktop
        # c - whether that desktop is the current (1) or not (0)
        # u - whether a window in that desktop has an urgent hint set (1) or not (0)
        IFS=':' read -r d w m c u <<< "$desktop"
        # name each desktop
        case $d in
            0) d="I" s=""   ;;
            1) d="II" s="::" ;;
            2) d="III" s="::" ;;
            3) d="IV" s="::" ;;
            4) d="V" s="::" ;;
            5) d="VI" s="::" ;;
            6) d="VII" s="::" ;;
            7) d="VIII" s="::" ;;
            8) d="IX" s="::" ;;
            9) d="X" s="::" ;;
        esac
        # the current desktop color should be #cccccc
        # we will also display the current desktop's tiling layout/mode
        ((c)) && f="#cccccc" && case $m in
            # name each layout/mode with a symbol
            0) i="[T]" ;;
            1) i="[B]" ;;
            2) i="[G]" ;;
            3) i="[M]" ;;
            4) i="[F]" ;;
            5) i="[D]" ;;
            6) i="[E]" ;;
        esac  || f="#777777"

        # if the desktop has an urgent hint its color should be #ff0000
        ((u)) && f="#ff0000"

        # if the desktop has windows print that number next to the desktop name
        # else just print the desktop name
        ((w)) && r+="$s ^fg($f)$d ($w)^fg() " || r+="$s ^fg($f)$d^fg() "
    done

    # read from fifo and output to dzen2
    printf "%s%s\n" "$r" "$i" && unset r
done < "$ff" | dzen2 -h 18 -ta l -e -p -fn "-misc-terminusmod.icons-medium-r-normal--12-120-72-72-c-60-*-*" &

# pass output to fifo
"$wm"> "$ff"
