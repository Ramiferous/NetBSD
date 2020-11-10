--------------------------
-- Default luakit theme --
--------------------------

local theme = {}

-- Default settings
theme.font = "12px PragmataPro"
theme.fg   = "#FFEBCD"
theme.bg   = "#1C1C1C"

-- Genaral colours
theme.success_fg = "#0f0"
theme.loaded_fg  = "#33AADD"
theme.error_fg = "#FFF"
theme.error_bg = "#F00"

-- Warning colours
theme.warning_fg = "#F00"
theme.warning_bg = "#FFF"

-- Notification colours
theme.notif_fg = "#444"
theme.notif_bg = "#FFF"

-- Menu colours
theme.menu_fg                   = "#FFEBCD"
theme.menu_bg                   = "#1C1C1C"
theme.menu_selected_fg          = "#000"
theme.menu_selected_bg          = "#FF0"
theme.menu_title_bg             = "#1C1C1C"
theme.menu_primary_title_fg     = "#f00"
theme.menu_secondary_title_fg   = "#666"

theme.menu_disabled_fg = "#999"
theme.menu_disabled_bg = theme.menu_bg
theme.menu_enabled_fg = theme.menu_fg
theme.menu_enabled_bg = theme.menu_bg
theme.menu_active_fg = "#060"
theme.menu_active_bg = theme.menu_bg

-- Proxy manager
theme.proxy_active_menu_fg      = '#000'
theme.proxy_active_menu_bg      = '#FFF'
theme.proxy_inactive_menu_fg    = '#888'
theme.proxy_inactive_menu_bg    = '#FFF'

-- Statusbar specific
theme.sbar_fg         = "#FFEBCD"
theme.sbar_bg         = "#1C1C1C"

-- Downloadbar specific
theme.dbar_fg         = "#FFEBCD"
theme.dbar_bg         = "#1C1C1C"
theme.dbar_error_fg   = "#F00"

-- Input bar specific
theme.ibar_fg           = "#000"
theme.ibar_bg           = "rgba(0,0,0,0)"

-- Tab label
theme.tab_fg            = "#888888"
theme.tab_bg            = "#1C1C1C"
theme.tab_hover_bg      = "#292929"
theme.tab_ntheme        = "#ddd"
theme.selected_fg       = "#1C1C1C"
theme.selected_bg       = "#E1AA5D"
theme.selected_ntheme   = "#ddd"
theme.loading_fg        = "#33AADD"
theme.loading_bg        = "#000"

theme.selected_private_tab_bg = "#3D295B"
theme.private_tab_bg    = "#22254A"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#A0CF5D"
theme.notrust_fg        = "#D23D3D"

-- Follow mode hints
theme.hint_font = "10px monospace, courier, sans-serif"
theme.hint_fg = "#FFF"
theme.hint_bg = "#0000CD"
theme.hint_border = "1px dashed #000"
theme.hint_opacity = "0.3"
theme.hint_overlay_bg = "rgba(255,255,153,0.3)"
theme.hint_overlay_border = "1px dotted #000"
theme.hint_overlay_selected_bg = "rgba(0,255,0,0.3)"
theme.hint_overlay_selected_border = theme.hint_overlay_border

-- General colour pairings
theme.ok = { fg = "#FFEBCD", bg = "#1C1C1C" }
theme.warn = { fg = "#FFEBCD", bg = "#D23D3D" }
theme.error = { fg = "#D23D3D", bg = "#1C1C1C" }

return theme

-- vim: et:sw=4:ts=8:sts=4:tw=80
