# .profile

# Set text editor
export EDITOR=vim

# Set configuration tool for Qt5-applications
#export QT_QPA_PLATFORMTHEME=qt5ct

# Set the search path for programs.
PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R7/bin:/usr/pkg/bin
PATH=${PATH}:/usr/pkg/sbin:/usr/games:/usr/local/bin:/usr/local/sbin:/home/dave/.cargo/bin:/home/dave/.local/bin
export PATH

# Configure the shell to load .shrc at startup time.
# This will happen for every shell started, not just login shells.
export ENV=$HOME/.shrc

# shfm & fff opener
export SHFM_OPENER="/home/dave/.open.sh"
export FFF_OPENER="/home/dave/.open.sh"

# fff
export FFF_FILE_FORMAT="%f"
export FFF_MARK_FORMAT="  %f*"
export FFF_TRASH=~/.local/share/fff/trash
export FFF_W3M_XOFFSET=0
export FFF_W3M_YOFFSET=0

# Show/Hide hidden files on open (Off by default)
export FFF_HIDDEN=1

# dir color
export FFF_COL1=2
# status bg color
export FFF_COL2=9
# selection color
export FFF_COL3=1
# cursor color
export FFF_COL4=3
# status fg color
export FFF_COL5=7

# use fd with fzf
export FZF_DEFAULT_COMMAND='fdfind --type file --follow --hidden --color=always' 
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --ansi'

# Hairloom-mailx
export NAILRC=$HOME/.nailrc

# UTF-8 Locale setting
export LANG=en_AU.UTF-8
export LC_CTYPE="$LANG"
export LC_ALL=""

# gpg
GPG_TTY=$(tty)
export GPG_TTY
