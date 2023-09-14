local awful = require'awful'
local beautiful = require'beautiful'
local wibox = require'wibox'

local dpi = beautiful.xresources.apply_dpi

local cairo = require("lgi").cairo

local helpers require'config.helpers'
local apps = require'config.apps'
   
local awesomemenu = {
   {'reload', awesome.restart},
   {'end', awesome.quit},
}

local mainmenu = awful.menu{
   items = {
      {'awesome', awesomemenu},
      {'files', apps.files},
      {'browser', apps.browser},
      {'wallpaper', apps.nitrogen},
      {'terminal', apps.terminal}
   }
}

local cloc = wibox.widget {
{
    {
        format = '%I:%M %p',
        font = 'Roboto 10',
        halign = 'center',
        valign = 'center',
        widget = wibox.widget.textclock
    },
    layout = wibox.layout.fixed.vertical
},
fg = beautiful.fg_focus,
widget = wibox.container.background

}

local launcher = awful.widget.launcher{
    image = beautiful.awesome_icon,
    resize = true,
    menu = mainmenu,
}

screen.connect_signal('request::desktop_decoration', function(s)

s.taglist = awful.widget.taglist {
    screen = s,
    filter  = awful.widget.taglist.filter.all,
    widget_template = {
        {
            {
                id = "text_role",
                widget = wibox.widget.textbox
            },
            margins = {left = dpi(3), right = dpi(3),top = dpi(2),bottom = dpi(2)},
            widget = wibox.container.margin
        },
        layout = wibox.layout.align.horizontal
    },
}

s.tasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
		widget_template = {
			{
                {
                    {
                        {
                            id = "icon_role",
                            widget = wibox.widget.imagebox,
                        },
                        top = dpi(6),
                        bottom = dpi(7),
                        widget = wibox.container.margin
                    },
                    {
                        {
                            id = "text_role",
                            widget = wibox.widget.textbox,
                        },
                        margins = dpi(6.5),
                        widget = wibox.container.margin,
                    },
                    layout = wibox.layout.align.horizontal
                },
				halign = "center",
				widget = wibox.container.place
			},
			id = "background_role",
			widget = wibox.container.background
    	},
        buttons = {
            awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end)
        },

}

s.mainbar = awful.wibar({
    screen = s,
    position = "bottom",
    --width = dpi(1200),
    height = dpi(50),
    --margins = {top=dpi(10)},
    --stretch = false,

-- bar config
}):setup {
        {
            {
                launcher,
                margins = 14,
                widget = wibox.container.margin
            },
            s.taglist,
            layout = wibox.layout.align.horizontal
        },
        {
            s.tasklist,
            margins = dpi(9),
            widget = wibox.container.margin
        },
        {
            {
                cloc,
                top = dpi(16),
                right = dpi(14),
                widget = wibox.container.margin
            },
            layout = wibox.layout.align.horizontal
        },
        layout = wibox.layout.align.horizontal
    }


end)
