local wezterm = require 'wezterm'

local font_family = 'JetBrainsMono Nerd Font'

return {
  font = wezterm.font({
    family = font_family,
    weight = 'Medium',
  }),

  font_size = 14,
  freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
  freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
