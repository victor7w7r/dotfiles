local wezterm = require 'wezterm'
local platform = require 'utils.platform'
local tables = require 'utils.tables'

local font_family = 'JetBrainsMono Nerd Font'

local fonts = {}

if platform.is_mac then
  fonts.font_size = 14
else
  fonts.font_size = 11
end

return tables.merge({
  fonts,
  {
    font = wezterm.font({
      family = font_family,
      weight = 'Medium',
    }),
    freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
    freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
  }
})



