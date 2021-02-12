#!/usr/bin/env sh

: "${wm:=frankenwm}"
: "${ff:="/tmp/frankenwm.fifo"}"

tags=('1' '2' '3' '4' '5' '6' '7' '8' '9' '0')

layouts=('[T]' '[M]' '[B]' '[G]' '[F]' '[D]' '[E]')

# Add some conky?
# conky | dzen2 -h 18 -x 320 -ta r -e -p -fn &

# Check if it's a pipe, otherwise create it
[[ -p $ff ]] || mkfifo -m 600 "$ff"

while read -t 60 -r wmout || true; do
    desktops=( $(cut -d"|" -f1 <<< "$wmout") )

    if [[ "${desktops[@]}" =~ ^(([[:digit:]]+:)+[[:digit:]]+ ?)+$ ]]; then
        unset tmp
        for desktop in "${desktops[@]}"; do
            IFS=':' read -r d w m c u <<< "$desktop"
            # Tags labels
            label="${tags[$d]}"
            # Is this the current desktop ? save the layout
            ((c)) && fg="#fefefe" bg="#204a87" && layout="${layouts[$m]}" \
                  || fg="#b3b3b3" bg=""

            # Has windows ?
            ((w)) && fg="#fce94f"

            # Urgent windows ?
            ((u)) && fg="#ef2929"

            tmp+="^fg($fg)^bg($bg) $label ^bg()^fg()"
        done
    fi

    # Merge the clients indications, the tile and the info
    echo "$tmp $layout"
done < "$ff" | dzen2 -h 18 -ta l -e -p &

while :; do "$wm" || break; done | tee -a "$ff"
