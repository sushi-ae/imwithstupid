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
                awful.titlebar.widget.titlewidget(c),
                layout = wibox.layout.align.horizontal
            },
            margins = dpi(9),
            layout = wibox.container.margin,
        },
        {
            --awful.titlebar.widget.titlewidget(c),
            halign = 'center',
            layout = wibox.container.place
        },
        {
            {
                awful.titlebar.widget.maximizedbutton(c),
                awful.titlebar.widget.ontopbutton(c),
                awful.titlebar.widget.closebutton(c),
                spacing = dpi(4),
                layout = wibox.layout.fixed.horizontal
            },
            margins = dpi(12),
            widget = wibox.container.margin
        },
        layout = wibox.layout.align.horizontal
   }
	
end)
