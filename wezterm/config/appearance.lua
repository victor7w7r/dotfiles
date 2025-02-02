local colors = require 'colors.catppuccin'
local platform = require 'utils.platform'
local tables = require 'utils.tables'

local os = {}

if platform.is_mac then
  os.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
  os.window_padding = { left = 12, right = 12, top = 30, bottom = 0 }
  os.macos_window_background_blur = 10
  os.native_macos_fullscreen_mode = true
elseif platform.is_win then
  os.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
  os.integrated_title_button_alignment = "Right"
  os.integrated_title_button_style = "Windows"
  os.win32_system_backdrop = "Acrylic"
  os.integrated_title_buttons = { "Hide", "Maximize", "Close" }
else
  os.window_decorations = "RESIZE"
  os.window_padding = { left = 5, right = 5, top = 0, bottom = 0 }
end

return tables.merge({
  os,
  {
    colors = colors,
    inactive_pane_hsb = { saturation = 0.9, brightness = 0.7 },

    default_cursor_style = 'BlinkingBar',
    cursor_blink_rate = 800,
    hide_mouse_cursor_when_typing = true,
    force_reverse_video_cursor = true,
    text_background_opacity = 0.4,
    window_background_opacity = 0.93,
    window_close_confirmation = 'NeverPrompt',
    window_frame = { active_titlebar_bg = '#090909' },

    text_blink_ease_in = "EaseIn",
    text_blink_ease_out = "EaseOut",
    text_blink_rapid_ease_in = "Linear",
    text_blink_rapid_ease_out = "Linear",
    text_blink_rate = 500,
    text_blink_rate_rapid = 250,

    command_palette_rows = 7,
    command_palette_font_size = 15,
    command_palette_bg_color = '#cba6f7',
    command_palette_fg_color = '#eba0ac',

    audible_bell = "SystemBeep",
    visual_bell = {
      fade_in_function = "EaseOut",
      fade_in_duration_ms = 250,
      fade_out_function = "EaseIn",
      fade_out_duration_ms = 250,
      target = 'CursorColor'
    },

    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    show_new_tab_button_in_tab_bar = false,
    tab_bar_at_bottom = true,
    tab_max_width = 26,
    use_fancy_tab_bar = false,
  }
})
