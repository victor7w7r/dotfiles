local wezterm = require 'wezterm'
local utils = require 'utils'

local os = {}

if wezterm.target_triple:find("darwin") ~= nil then
    os.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
    os.window_padding = { left = 12, right = 12, top = 30, bottom = 0 }
    os.macos_window_background_blur = 10
    os.native_macos_fullscreen_mode = true
else
    os.window_decorations = "RESIZE"
    os.window_padding = { left = 5, right = 5, top = 0, bottom = 0 }
end

return utils.merge({
  os,
  {
    color_scheme = 'Catppuccin Mocha',
    inactive_pane_hsb = { saturation = 0.9, brightness = 0.7 },

    default_cursor_style = 'BlinkingBar',
    cursor_blink_rate = 800,
    text_background_opacity = 0.4,
    window_background_opacity = 0.93,
    window_close_confirmation = 'NeverPrompt',

    font_size = 13,
    font = wezterm.font('MesloLGS Nerd Font Mono'),

    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
  }
})
