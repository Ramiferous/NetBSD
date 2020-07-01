# .profile

# Set text editor
export EDITOR=vim

# Set configuration tool for Qt5-applications
export QT_QPA_PLATFORMTHEME=qt5ct

# Set the search path for programs.
PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R7/bin:/usr/pkg/bin
PATH=${PATH}:/usr/pkg/sbin:/usr/games:/usr/local/bin:/usr/local/sbin
export PATH

# Configure the shell to load .shrc at startup time.
# This will happen for every shell started, not just login shells.
export ENV=$HOME/.shrc
