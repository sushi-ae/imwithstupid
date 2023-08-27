---------------------------
-- colors and stuff lmao --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()

local gears = require'gears'
local themes_path = gears.filesystem.get_configuration_dir()..'theme/'

local theme = {}

theme.font = "IosevkaTerm Nerd Font 10"

-- Specific
theme.titlebar_height = dpi(40)
theme.titlebar_pos = "top"

theme.tasklist_bg_focus = "#fafafa"

theme.titlebar_bg_normal = "#171717"
theme.titlebar_bg_focus = "#171717"

-- Colors
theme.bg_normal     = "#171717"
theme.bg_focus      = "#303030"
theme.bg_urgent     = "#ff2525"
theme.bg_minimize   = "#151515"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#252525"
theme.fg_focus      = "#fafafa"
theme.fg_urgent     = "#fffafa"
theme.fg_minimize   = "#080808"

theme.useless_gap         = dpi(5)
theme.border_width        = dpi(3)
theme.border_color_normal = theme.bg_normal
theme.border_color_active = theme.bg_normal
theme.border_color_marked = "#91231c"

-- Rightclick Menu
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(40)
theme.menu_width  = dpi(150)

-- Titlebar Icons
theme.titlebar_close_button_normal = themes_path.."icons/titlebar/inac.svg"
theme.titlebar_close_button_focus  = themes_path.."icons/titlebar/close.svg"

theme.titlebar_maximized_button_normal_inactive = themes_path.."icons/titlebar/inac.svg"
theme.titlebar_maximized_button_normal_active = themes_path.."icons/titlebar/inac.svg"
theme.titlebar_maximized_button_focus_inactive = themes_path.."icons/titlebar/max.svg"
theme.titlebar_maximized_button_focus_active = themes_path.."icons/titlebar/max.svg"

theme.titlebar_ontop_button_normal_inactive = themes_path.."icons/titlebar/inac.svg"
theme.titlebar_ontop_button_normal_active = themes_path.."icons/titlebar/inac.svg"
theme.titlebar_ontop_button_focus_inactive = themes_path.."icons/titlebar/ontop.svg"
theme.titlebar_ontop_button_focus_active = themes_path.."icons/titlebar/ontop.svg"


-- I don't use this wtf
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"

-- icon shit
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.fg_focus, theme.bg_focus
)

-- this shit nerdy af frfr
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

return theme

--vim: filetype=lua:expandtab:shiftwidth=4:tabstop=4:softtabstop=4:textwidth=80
