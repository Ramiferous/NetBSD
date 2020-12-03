/* FrankenWM config.def.h */

#ifndef CONFIG_H
#define CONFIG_H

/* Key definitions */
#define MOD1            Mod1Mask     /* ALT key */
#define MOD4            Mod4Mask     /* Super/Windows key */
#define CONTROL         ControlMask  /* Control key */
#define SHIFT           ShiftMask    /* Shift key */

/* General settings */
#define MASTER_SIZE     0.6          /* master-stack ratio */
#define SHOW_PANEL      False        /* show panel by default on exec */
#define TOP_PANEL       True         /* False means panel is on bottom */
#define PANEL_HEIGHT    18           /* 0 for no space for panel, thus no panel */
#define DEFAULT_MODE    TILE         /* TILE MONOCLE BSTACK GRID FIBONACCI EQUAL */
#define ATTACH_ASIDE    True         /* False means new window is master */
#define FOLLOW_MOUSE    False        /* Focus the window the mouse just entered */
#define FOLLOW_WINDOW   False        /* Follow the window when moved to a different desktop */
#define CLICK_TO_FOCUS  True         /* Focus an unfocused window when clicked */
#define BORDER_WIDTH    2            /* window border width */
#define SCRATCH_WIDTH   1            /* scratch window border width, 0 to disable */
#define FOCUS           "#e1aa5d"    /* focused window border color   */
#define UNFOCUS         "#1c1c1c"    /* unfocused window border color */
#define SCRATCH         "#c34646"    /* scratchpad border color */
#define DESKTOPS        10           /* number of desktops - edit DESKTOPCHANGE keys to suit */
#define DEFAULT_DESKTOP 0            /* the desktop to focus on exec */
#define MINWSZ          50           /* minimum window size in pixels */
#define USELESSGAP      6            /* the size of the useless gap in pixels */
#define GLOBALGAPS      True         /* use the same gap size on all desktops */
#define MONOCLE_BORDERS True         /* display borders in monocle mode */
#define INVERT          False        /* use alternative modes by default */
#define AUTOCENTER      True         /* automatically center windows floating by default */
#define OUTPUT_TITLE    False        /* output the title of the currently active window */
#define USE_SCRATCHPAD  False        /* enable the scratchpad functionality */
#define CLOSE_SCRATCHPAD True        /* close scratchpad on quit */
#define SCRPDNAME       "scratchpad" /* the name of the scratchpad window */
#define EWMH_TASKBAR    True         /* False if text (or no) panel/taskbar */

/* Applicaton specific rules */
static const AppRule rules[] = { \
    /* WM_NAME(STRING)  desktop  follow  float border_width */
    { "Calculator",     -1,      False,  True, 2 },
};

/* Helper for spawning shell commands, usually you don't edit this */
#define SHCMD(cmd) {.com = (const char*[]){"/bin/sh", "-c", cmd, NULL}}

/* Commands */
static const char *termcmd[]            = { "xterm", NULL };
static const char *menucmd[]            = { "dmenu_run", "-fn", "xft:PragmataPro:pixelsize=10:antialias=true", "-nb", "#1c1c1c", "-nf", "#ffebcd", "-sb", "#e1aa5d", "-sf", "#000000", NULL };
static const char *passmenucmd[]        = { "/home/dave/.config/spectrwm/passmenu.sh", "-fn", "xft:PragmataPro:pixelsize=10:antialias=true", "-nb", "#1c1c1c", "-nf", "#ffebcd", "-sb", "#e1aa5d", "-sf", "#000000", NULL };
static const char *lockcmd[]            = { "slock", NULL };
static const char *shutdowncmd[]        = { "doas", "shutdown", "-p", "now", NULL };
static const char *voldowncmd[]         = { "mixerctl", "-w", "outputs.master-=12", NULL };
static const char *volupcmd[]           = { "mixerctl", "-w", "outputs.master+=12", NULL };
static const char *volmutecmd[]         = { "mixerctl", "-w", "outputs.master=[192 0]", NULL };
static const char *scrpcmd[]            = { "xterm", "-T", "scratchpad", NULL };
static const char *scrotallcmd[]        = { "scrot", "'%m-%d-%Y-%R.png'", "-e", "'mv $f ~/Pictures/dumps'", NULL };
static const char *scrotwindcmd[]       = { "scrot", "-ub", "'%m-%d-%Y-%R.png'", "-e", "'mv $f ~/Pictures/dumps'", NULL };
static const char *mntcmd[]             = { "doas", "mount", "-t", "msdos", "/dev/sd0e /mnt", NULL };
static const char *umntcmd[]            = { "doas", "umount", "-t", "msdos /mnt", NULL };
static const char *skippycmd[]          = { "skippy-xd", "--toggle-window-picker", NULL };

#define DESKTOPCHANGE(K,N) \
    {  MOD4,             K,              change_desktop, {.i = N}}, \
    {  MOD4|ShiftMask,   K,              client_to_desktop, {.i = N}},

/* Keybindings */
static key keys[] = {
    /* modifier          key            function           argument */

    /* select windows */
    {  MOD4,             XK_j,          next_win,          {NULL}},
    {  MOD4,             XK_k,          prev_win,          {NULL}},
    /* select the master window, or the previously focussed slave */
    {  MOD4|SHIFT,       XK_Return,     focusmaster,       {NULL}},
    /* select urgent window */
    {  MOD4,             XK_BackSpace,  focusurgent,       {NULL}},

    /* move windows */
    {  MOD4|SHIFT,       XK_j,          move_down,         {NULL}},
    {  MOD4|SHIFT,       XK_k,          move_up,           {NULL}},
    /* swap the current window to master */
    {  MOD4|CONTROL,     XK_Return,     swap_master,       {NULL}},
    /* maximize the current window */
    {  MOD4,             XK_f,          maximize,          {NULL}},
    /* minimize window to queue/pull window from queue */
    {  MOD4,             XK_m,          minimize,          {NULL}},
    {  MOD4,             XK_n,          restore,           {NULL}},
    /* move the current window to the center of the screen, floating */
    {  MOD4,             XK_c,          centerwindow,      {NULL}},
    /* toggles inverted stacking modes (left/top stack) */
    {  MOD4|SHIFT,       XK_i,          invertstack,       {NULL}},
    /* show/hide all windows on all desktops */
    {  MOD4|CONTROL,     XK_s,          showhide,          {NULL}},
    /* toggle the scratchpad terminal, if enabled */
    {  MOD4,             XK_s,          togglescratchpad,  {NULL}},

    /* move floating windows */
    {  MOD1,             XK_j,          float_y,           {.i = +10}},
    {  MOD1,             XK_k,          float_y,           {.i = -10}},
    {  MOD1,             XK_h,          float_x,           {.i = -10}},
    {  MOD1,             XK_l,          float_x,           {.i = +10}},
    /* resize floating windows */
    {  MOD1|CONTROL,     XK_j,          resize_y,          {.i = +10}},
    {  MOD1|CONTROL,     XK_k,          resize_y,          {.i = -10}},
    {  MOD1|CONTROL,     XK_h,          resize_x,          {.i = -10}},
    {  MOD1|CONTROL,     XK_l,          resize_x,          {.i = +10}},
    /* reset the selected floating window to tiling */
    {  MOD4,             XK_t,          tilemize,          {NULL}},

    /* mode selection */
    {  MOD4|SHIFT,       XK_t,          switch_mode,       {.i = TILE}},
    {  MOD4|SHIFT,       XK_m,          switch_mode,       {.i = MONOCLE}},
    {  MOD4|SHIFT,       XK_b,          switch_mode,       {.i = BSTACK}},
    {  MOD4|SHIFT,       XK_g,          switch_mode,       {.i = GRID}},
    {  MOD4|SHIFT,       XK_f,          switch_mode,       {.i = FIBONACCI}},
    {  MOD4|SHIFT,       XK_d,          switch_mode,       {.i = DUALSTACK}},
    {  MOD4|SHIFT,       XK_e,          switch_mode,       {.i = EQUAL}},
    {  MOD4|SHIFT,       XK_z,          rotate_mode,       {.i = -1}},
    {  MOD4|SHIFT,       XK_x,          rotate_mode,       {.i = +1}},

    /* spawn terminal, dmenu, w/e you want to */
    {  MOD4,             XK_Return,     spawn,             {.com = termcmd}},
    {  MOD4,             XK_d,          spawn,             {.com = menucmd}},
    {  MOD4|SHIFT,       XK_p,          spawn,             {.com = passmenucmd}},
    {  MOD4,             XK_Delete,     spawn,             {.com = lockcmd}},
    {  MOD4|SHIFT,       XK_Delete,     spawn,             {.com = shutdowncmd}},
    {  0,                0x1008ff11,    spawn,             {.com = voldowncmd}},
    {  0,                0x1008ff13,    spawn,             {.com = volupcmd}},
    {  0,                0x1008ff12,    spawn,             {.com = volmutecmd}},
    {  MOD1|CONTROL,     XK_m,          spawn,             {.com = mntcmd}},
    {  MOD1|CONTROL,     XK_u,          spawn,             {.com = umntcmd}},
    {  MOD1,             XK_Tab,        spawn,             {.com = skippycmd}},
    {  MOD1|CONTROL,     XK_s,          spawn,             {.com = scrotallcmd}},
    {  MOD1|CONTROL|SHIFT, XK_s,        spawn,             {.com = scrotwindcmd}},
    /* kill current window */
    {  MOD4|SHIFT,       XK_c,          killclient,        {NULL}},

    /* desktop selection */
       DESKTOPCHANGE(    XK_1,                             0)
       DESKTOPCHANGE(    XK_2,                             1)
       DESKTOPCHANGE(    XK_3,                             2)
       DESKTOPCHANGE(    XK_4,                             3)
       DESKTOPCHANGE(    XK_5,                             4)
       DESKTOPCHANGE(    XK_6,                             5)
       DESKTOPCHANGE(    XK_7,                             6)
       DESKTOPCHANGE(    XK_8,                             7)
       DESKTOPCHANGE(    XK_9,                             8)
       DESKTOPCHANGE(    XK_0,                             9)
    /* toggle to last desktop */
    {  MOD4,             XK_Tab,        last_desktop,      {NULL}},
    /* jump to the next/previous desktop */
    {  MOD4|SHIFT,       XK_h,          rotate,            {.i = -1}},
    {  MOD4|SHIFT,       XK_l,          rotate,            {.i = +1}},
    /* jump to the next/previous desktop with just the current window */
    {  MOD4|CONTROL,     XK_h,          rotate_client,     {.i = -1}},
    {  MOD4|CONTROL,     XK_l,          rotate_client,     {.i = +1}},
    /* jump to the next/previous desktop with all windows */
    {  MOD4|CONTROL|SHIFT, XK_h,        rotate_filled,     {.i = -1}},
    {  MOD4|CONTROL|SHIFT, XK_l,        rotate_filled,     {.i = +1}},

    /* resize master/first stack window */
    {  MOD4,             XK_h,          resize_master,     {.i = -10}},
    {  MOD4,             XK_l,          resize_master,     {.i = +10}},
    {  MOD4,             XK_o,          resize_stack,      {.i = -10}},
    {  MOD4,             XK_p,          resize_stack,      {.i = +10}},

    /* resize the borders */
    {  MOD4|CONTROL,     XK_u,          adjust_borders,    {.i = -1}},
    {  MOD4|CONTROL,     XK_i,          adjust_borders,    {.i = +1}},
    /* resize the useless gaps between the windows */
    {  MOD4|CONTROL,     XK_o,          adjust_gaps,       {.i = -1}},
    {  MOD4|CONTROL,     XK_p,          adjust_gaps,       {.i = +1}},
    /* toggle the panel space */
    {  MOD4|CONTROL,     XK_b,          togglepanel,       {NULL}},

    /* exit */
    {  MOD4|SHIFT,       XK_q,          quit,              {.i = 0}},
};

/* EDIT THIS: mouse-based shortcuts */
static Button buttons[] = {
    /* move/resize using the mouse */
    {  MOD4,    Button1,     mousemotion,   {.i = MOVE}},
    {  MOD4,    Button3,     mousemotion,   {.i = RESIZE}},
};
#endif
