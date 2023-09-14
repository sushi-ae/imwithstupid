local awful = require'awful'
local xres = require("beautiful.xresources")
local dpi = xres.apply_dpi
local beautiful = require'beautiful'
local wibox = require'wibox'

local cairo = require("lgi").cairo

local helpers = require'config.helpers'

client.connect_signal('mouse::enter', function(c)
   c:activate{context = 'mouse_enter', raise = false}
end)

client.connect_signal('request::titlebars', function(c)
   -- buttons for the titlebar
   local buttons = {
      awful.button{
         modifiers = {},
         button    = 1,
         on_press  = function()
            c:activate{context = 'titlebar', action = 'mouse_move'}
         end
      },
      awful.button{
         modifiers = {},
         button    = 3,
         on_press  = function()
            c:activate{context = 'titlebar', action = 'mouse_resize'}
         end
      },
   }
    awful.titlebar(c,{
        size = dpi(20),
        position='top',
        bg="#00000000"
    }):setup {
        {
            {
                bg = beautiful.innermost_border_color,
                widget = wibox.container.background
            },
            left = dpi(18),
            right = dpi(18),
            top = dpi(18),
            widget = wibox.container.margin,
        },
        bg = beautiful.middle_border_color,
        widget = wibox.container.background,
    }

    awful.titlebar(c,{
        size = dpi(20),
        position='bottom',
        bg="#00000000"
    }):setup {
        {
            {
                bg = beautiful.innermost_border_color,
                widget = wibox.container.background
            },
            left = dpi(18),
            right = dpi(18),
            bottom = dpi(18),
            widget = wibox.container.margin,
        },
        bg = beautiful.middle_border_color,
        widget = wibox.container.background,
    }
    awful.titlebar(c,{
        size = dpi(20),
        position='left',
        bg = "#00000000",
    }):setup {
        {
            {
                bg = beautiful.innermost_border_color,
                widget = wibox.container.background
            },
            left = dpi(18),
            widget = wibox.container.margin,
        },
        bg = beautiful.middle_border_color,
        widget = wibox.container.background,
    }
    awful.titlebar(c,{
        size = dpi(20),
        position='right',
        bg="#00000000"
    }):setup {
        {
            {
                bg = beautiful.innermost_border_color,
                widget = wibox.container.background
            },
            right = dpi(18),
            widget = wibox.container.margin,
        },
        bg = beautiful.middle_border_color,
        widget = wibox.container.background,
    }

   --[[
   top = awful.titlebar(c,{
        position = beautiful.titlebar_pos,
        size = beautiful.titlebar_height,
   })

   top:setup {
        {
            {
                {
                    awful.titlebar.widget.iconwidget(c),
                    right = dpi(9),
                    widget = wibox.container.margin
                },
                --awful.titlebar.widget.titlewidget(c),
                layout = wibox.layout.align.horizontal
            },
            buttons = buttons,
            margins = dpi(10),
            layout = wibox.container.margin,
        },
        {
            awful.titlebar.widget.titlewidget(c),
            buttons = buttons,
            halign = 'center',
            layout = wibox.container.place
        },
        {
            {
                awful.titlebar.widget.maximizedbutton(c),
                awful.titlebar.widget.ontopbutton(c),
                awful.titlebar.widget.closebutton(c),
                spacing = dpi(2),
                layout = wibox.layout.fixed.horizontal
            },
            margins = dpi(12),
            widget = wibox.container.margin
        },
        layout = wibox.layout.align.horizontal
   } --]]
	
end)
