$NetBSD$

/* Personal mods */

--- config.def.h.orig	2020-07-29 08:36:13.000000000 +0000
+++ config.def.h
@@ -1,85 +1,77 @@
-/* see LICENSE for copyright and license */
+/* FrankenWM config.def.h */
 
 #ifndef CONFIG_H
 #define CONFIG_H
 
-/* Button definitions, nothing to edit for you */
-#define MOD1            Mod1Mask    /* ALT key */
-#define MOD4            Mod4Mask    /* Super/Windows key */
-#define CONTROL         ControlMask /* Control key */
-#define SHIFT           ShiftMask   /* Shift key */
-
-/* EDIT THIS: general settings */
-#define MASTER_SIZE     0.6       /* master-stack ratio */
-#define SHOW_PANEL      False     /* show panel by default on exec */
-#define TOP_PANEL       True      /* False means panel is on bottom */
-#define PANEL_HEIGHT    18        /* 0 for no space for panel, thus no panel */
-#define DEFAULT_MODE    TILE      /* TILE MONOCLE BSTACK GRID FIBONACCI EQUAL */
-#define ATTACH_ASIDE    True      /* False means new window is master */
-#define FOLLOW_MOUSE    False     /* Focus the window the mouse just entered */
-#define FOLLOW_WINDOW   False     /* Follow the window when moved to a different desktop */
-#define CLICK_TO_FOCUS  True      /* Focus an unfocused window when clicked */
-#define BORDER_WIDTH    2         /* window border width */
-#define SCRATCH_WIDTH   1         /* scratch window border width, 0 to disable */
-#define FOCUS           "#cccccc" /* focused window border color   */
-#define UNFOCUS         "#121212" /* unfocused window border color */
-#define SCRATCH         "#cc0000" /* scratchpad border color */
-#define DESKTOPS        10        /* number of desktops - edit DESKTOPCHANGE keys to suit */
-#define DEFAULT_DESKTOP 0         /* the desktop to focus on exec */
-#define MINWSZ          50        /* minimum window size in pixels */
-#define USELESSGAP      8         /* the size of the useless gap in pixels */
-#define GLOBALGAPS      True      /* use the same gap size on all desktops */
-#define MONOCLE_BORDERS False     /* display borders in monocle mode */
-#define INVERT          False     /* use alternative modes by default */
-#define AUTOCENTER      True      /* automatically center windows floating by default */
-#define OUTPUT_TITLE    False     /* output the title of the currently active window */
-#define USE_SCRATCHPAD  False     /* enable the scratchpad functionality */
-#define CLOSE_SCRATCHPAD True     /* close scratchpad on quit */
+/* Key definitions */
+#define MOD1            Mod1Mask     /* ALT key */
+#define MOD4            Mod4Mask     /* Super/Windows key */
+#define CONTROL         ControlMask  /* Control key */
+#define SHIFT           ShiftMask    /* Shift key */
+
+/* General settings */
+#define MASTER_SIZE     0.6          /* master-stack ratio */
+#define SHOW_PANEL      False        /* show panel by default on exec */
+#define TOP_PANEL       True         /* False means panel is on bottom */
+#define PANEL_HEIGHT    18           /* 0 for no space for panel, thus no panel */
+#define DEFAULT_MODE    TILE         /* TILE MONOCLE BSTACK GRID FIBONACCI EQUAL */
+#define ATTACH_ASIDE    True         /* False means new window is master */
+#define FOLLOW_MOUSE    False        /* Focus the window the mouse just entered */
+#define FOLLOW_WINDOW   False        /* Follow the window when moved to a different desktop */
+#define CLICK_TO_FOCUS  True         /* Focus an unfocused window when clicked */
+#define BORDER_WIDTH    2            /* window border width */
+#define SCRATCH_WIDTH   1            /* scratch window border width, 0 to disable */
+#define FOCUS           "#e1aa5d"    /* focused window border color   */
+#define UNFOCUS         "#262626"    /* unfocused window border color */
+#define SCRATCH         "#c34646"    /* scratchpad border color */
+#define DESKTOPS        6            /* number of desktops - edit DESKTOPCHANGE keys to suit */
+#define DEFAULT_DESKTOP 0            /* the desktop to focus on exec */
+#define MINWSZ          50           /* minimum window size in pixels */
+#define USELESSGAP      6            /* the size of the useless gap in pixels */
+#define GLOBALGAPS      False        /* use the same gap size on all desktops */
+#define MONOCLE_BORDERS False        /* display borders in monocle mode */
+#define INVERT          False        /* use alternative modes by default */
+#define AUTOCENTER      True         /* automatically center windows floating by default */
+#define OUTPUT_TITLE    False        /* output the title of the currently active window */
+#define USE_SCRATCHPAD  False        /* enable the scratchpad functionality */
+#define CLOSE_SCRATCHPAD True        /* close scratchpad on quit */
 #define SCRPDNAME       "scratchpad" /* the name of the scratchpad window */
-#define EWMH_TASKBAR    True      /* False if text (or no) panel/taskbar */
+#define EWMH_TASKBAR    True         /* False if text (or no) panel/taskbar */
 
-/*
- * EDIT THIS: applicaton specific rules
- * Open applications to specified desktop with specified mode.
- * If desktop is negative, then current is assumed. Desktops are 0-indexed.
- * The matching is done via POSIX-regexes on the window title, see
- * https://en.wikipedia.org/wiki/Regular_expression#POSIX_extended for syntax
- * Sadly, this can not be empty (for now), so enter something non-existent if
- * you do not wish to use this functionality.
- */
+/* Applicaton specific rules */
 static const AppRule rules[] = { \
-    /* title regex  desktop  follow  float border_with */
-    { "GNU Image",  -1,      False,  True, 0 },
-    { "Skype",       3,      False,  True, -1 },
+    /* WM_NAME(STRING)  desktop  follow  float border_width */
+    { "sxiv",     -1,      False,  True,   2 },
+    { "mpv",      -1,      False,  True,   2 },
+    { "feh",      -1,      False,  True,   2 },
 };
 
-/* helper for spawning shell commands, usually you don't edit this */
+/* Helper for spawning shell commands, usually you don't edit this */
 #define SHCMD(cmd) {.com = (const char*[]){"/bin/sh", "-c", cmd, NULL}}
 
-/*
- * EDIT THIS: commands
- * Adjust and add these to the shortcuts below to launch anything you want by
- * pressing a key (combination). The last argument should ALWAYS be a null
- * pointer. scrpcmd needs to be defined and different from all other commands
- * (like the example) so FrankenWM can tell when you want to open a scratchpad
- * window. The title of the scratchpad window should also match SCRPDNAME from
- * above
- */
-static const char *termcmd[] = { "xterm",     NULL };
-static const char *menucmd[] = { "dmenu_run", NULL };
-static const char *scrpcmd[] = { "xterm", "-T", "scratchpad", NULL };
-/* static const char *scrpcmd[] = { "urxvt", "-name", "scratchpad",  NULL }; */
+/* Commands */
+static const char *termcmd[]            = { "xterm", NULL };
+static const char *menucmd[]            = { "dmenu_run", "-fn", "xft:PragmataPro:pixelsize=10:antialias=true", "-nb", "#1c1c1c", "-nf", "#ffebcd", "-sb", "#e1aa5d", "-sf", "#000000", NULL };
+static const char *passmenucmd[]        = { "/home/dave/.config/spectrwm/passmenu.sh", "-fn", "xft:PragmataPro:pixelsize=10:antialias=true", "-nb", "#1c1c1c", "-nf", "#ffebcd", "-sb", "#e1aa5d", "-sf", "#000000", NULL };
+static const char *lockcmd[]            = { "slock", NULL };
+static const char *shutdowncmd[]        = { "doas", "shutdown", "-p", "now", NULL };
+static const char *voldowncmd[]         = { "mixerctl", "-w", "outputs.master-=12", NULL };
+static const char *volupcmd[]           = { "mixerctl", "-w", "outputs.master+=12", NULL };
+static const char *volmutecmd[]         = { "mixerctl", "-w", "outputs.master=[254 0]", NULL };
+static const char *scrpcmd[]            = { "xterm", "-T", "scratchpad", NULL };
+static const char *mntcmd[]             = { "doas", "mount", "-t", "msdos", "/dev/sd0e /mnt", NULL };
+static const char *umntcmd[]            = { "doas", "umount", "-t", "msdos /mnt", NULL };
+static const char *skippycmd[]          = { "skippy-xd", "--toggle-window-picker", NULL };
+static const char *scrotallcmd[]        = { "scrot", NULL };
+static const char *scrotwincmd[]        = { "scrot", "-ub", NULL };
+static const char *killbarcmd[]         = { "killall", "unibar", NULL };
+static const char *unibarcmd[]          = { "/home/dave/.config/unibar/ubar_run.sh", NULL };
 
 #define DESKTOPCHANGE(K,N) \
     {  MOD4,             K,              change_desktop, {.i = N}}, \
     {  MOD4|ShiftMask,   K,              client_to_desktop, {.i = N}},
 
-/*
- * EDIT THIS: shortcuts
- * By default, all shortcuts use only Mod4 (+ Shift/Control), but you can use
- * Mod1 as well if you like to, I just prefer not to. (Update: handling
- * floating windows makes more sense when using Mod1 as well, so there's that)
- */
+/* Keybindings */
 static key keys[] = {
     /* modifier          key            function           argument */
 
@@ -87,7 +79,7 @@ static key keys[] = {
     {  MOD4,             XK_j,          next_win,          {NULL}},
     {  MOD4,             XK_k,          prev_win,          {NULL}},
     /* select the master window, or the previously focussed slave */
-    {  MOD4,             XK_w,          focusmaster,       {NULL}},
+    {  MOD4|SHIFT,       XK_Return,     focusmaster,       {NULL}},
     /* select urgent window */
     {  MOD4,             XK_BackSpace,  focusurgent,       {NULL}},
 
@@ -95,7 +87,7 @@ static key keys[] = {
     {  MOD4|SHIFT,       XK_j,          move_down,         {NULL}},
     {  MOD4|SHIFT,       XK_k,          move_up,           {NULL}},
     /* swap the current window to master */
-    {  MOD4,             XK_Return,     swap_master,       {NULL}},
+    {  MOD4|CONTROL,     XK_Return,     swap_master,       {NULL}},
     /* maximize the current window */
     {  MOD4,             XK_f,          maximize,          {NULL}},
     /* minimize window to queue/pull window from queue */
@@ -111,15 +103,15 @@ static key keys[] = {
     {  MOD4,             XK_s,          togglescratchpad,  {NULL}},
 
     /* move floating windows */
-    {  MOD4|MOD1,        XK_j,          float_y,           {.i = +10}},
-    {  MOD4|MOD1,        XK_k,          float_y,           {.i = -10}},
-    {  MOD4|MOD1,        XK_h,          float_x,           {.i = -10}},
-    {  MOD4|MOD1,        XK_l,          float_x,           {.i = +10}},
+    {  MOD1,             XK_j,          float_y,           {.i = +10}},
+    {  MOD1,             XK_k,          float_y,           {.i = -10}},
+    {  MOD1,             XK_h,          float_x,           {.i = -10}},
+    {  MOD1,             XK_l,          float_x,           {.i = +10}},
     /* resize floating windows */
-    {  MOD4|MOD1|CONTROL,XK_j,          resize_y,          {.i = +10}},
-    {  MOD4|MOD1|CONTROL,XK_k,          resize_y,          {.i = -10}},
-    {  MOD4|MOD1|CONTROL,XK_h,          resize_x,          {.i = -10}},
-    {  MOD4|MOD1|CONTROL,XK_l,          resize_x,          {.i = +10}},
+    {  MOD1|CONTROL,     XK_j,          resize_y,          {.i = +10}},
+    {  MOD1|CONTROL,     XK_k,          resize_y,          {.i = -10}},
+    {  MOD1|CONTROL,     XK_h,          resize_x,          {.i = -10}},
+    {  MOD1|CONTROL,     XK_l,          resize_x,          {.i = +10}},
     /* reset the selected floating window to tiling */
     {  MOD4,             XK_t,          tilemize,          {NULL}},
 
@@ -135,8 +127,21 @@ static key keys[] = {
     {  MOD4|SHIFT,       XK_x,          rotate_mode,       {.i = +1}},
 
     /* spawn terminal, dmenu, w/e you want to */
-    {  MOD4|SHIFT,       XK_Return,     spawn,             {.com = termcmd}},
-    {  MOD4,             XK_r,          spawn,             {.com = menucmd}},
+    {  MOD4,             XK_Return,     spawn,             {.com = termcmd}},
+    {  MOD4,             XK_d,          spawn,             {.com = menucmd}},
+    {  MOD4|SHIFT,       XK_p,          spawn,             {.com = passmenucmd}},
+    {  MOD4,             XK_Delete,     spawn,             {.com = lockcmd}},
+    {  MOD4|SHIFT,       XK_Delete,     spawn,             {.com = shutdowncmd}},
+    {  0,                0x1008ff11,    spawn,             {.com = voldowncmd}},
+    {  0,                0x1008ff13,    spawn,             {.com = volupcmd}},
+    {  0,                0x1008ff12,    spawn,             {.com = volmutecmd}},
+    {  MOD1|CONTROL,     XK_m,          spawn,             {.com = mntcmd}},
+    {  MOD1|CONTROL,     XK_u,          spawn,             {.com = umntcmd}},
+    {  MOD1,             XK_Tab,        spawn,             {.com = skippycmd}},
+    {  MOD1|CONTROL,     XK_u,          spawn,             {.com = killbarcmd}},
+    {  MOD1|CONTROL|SHIFT, XK_u,        spawn,             {.com = unibarcmd}},
+    {  MOD1|CONTROL,     XK_s,          spawn,             {.com = scrotallcmd}},
+    {  MOD1|CONTROL|SHIFT, XK_s,        spawn,             {.com = scrotwincmd}},
     /* kill current window */
     {  MOD4|SHIFT,       XK_c,          killclient,        {NULL}},
 
@@ -147,10 +152,6 @@ static key keys[] = {
        DESKTOPCHANGE(    XK_4,                             3)
        DESKTOPCHANGE(    XK_5,                             4)
        DESKTOPCHANGE(    XK_6,                             5)
-       DESKTOPCHANGE(    XK_7,                             6)
-       DESKTOPCHANGE(    XK_8,                             7)
-       DESKTOPCHANGE(    XK_9,                             8)
-       DESKTOPCHANGE(    XK_0,                             9)
     /* toggle to last desktop */
     {  MOD4,             XK_Tab,        last_desktop,      {NULL}},
     /* jump to the next/previous desktop */
@@ -179,7 +180,7 @@ static key keys[] = {
     {  MOD4|CONTROL,     XK_b,          togglepanel,       {NULL}},
 
     /* exit */
-    {  MOD4|CONTROL,     XK_q,          quit,              {.i = 0}},
+    {  MOD4|SHIFT,       XK_q,          quit,              {.i = 0}},
 };
 
 /* EDIT THIS: mouse-based shortcuts */
@@ -189,4 +190,3 @@ static Button buttons[] = {
     {  MOD4,    Button3,     mousemotion,   {.i = RESIZE}},
 };
 #endif
-
