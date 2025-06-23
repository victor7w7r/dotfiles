local wezterm = require 'wezterm'
local gpu_adapters = require 'utils.gpu-adapter'
local platform = require 'utils.platform'
local tables = require 'utils.tables'

local gpu = {}

if platform.is_linux then
  gpu.enable_wayland = true
  gpu.prefer_egl = true
end

return tables.merge({
  gpu,
  {
    automatically_reload_config = true,
    exit_behavior = 'CloseOnCleanExit',
    exit_behavior_messaging = 'Verbose',
    warn_about_missing_glyphs = false,
    scrollback_lines = 5000,
    status_update_interval = 200,
    check_for_updates = false,
    window_close_confirmation = 'NeverPrompt',

    audible_bell = "SystemBeep",
    visual_bell = {
      fade_in_function = "EaseOut",
      fade_in_duration_ms = 250,
      fade_out_function = "EaseIn",
      fade_out_duration_ms = 250,
      target = 'CursorColor'
    },
    set_environment_variables = {
      TERM = "xterm-256color",
    },

    animation_fps = 120,
    front_end = 'WebGpu',
    max_fps = 120,
    webgpu_force_fallback_adapter = false,
    webgpu_power_preference = "HighPerformance",
    webgpu_preferred_adapter = gpu_adapters:pick_best(),
    -- webgpu_preferred_adapter = gpu_adapters:pick_manual('Dx12', 'IntegratedGpu'),
    -- webgpu_preferred_adapter = gpu_adapters:pick_manual('Gl', 'Other'),

    font_size = 14,
    freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
    freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
    font = wezterm.font({
      family = 'JetBrainsMono Nerd Font',
      weight = 'Medium',
    }),

    hyperlink_rules = {
      { regex = '\\((\\w+://\\S+)\\)', format = '$1', highlight = 1 },
      { regex = '\\[(\\w+://\\S+)\\]', format = '$1', highlight = 1 },
      { regex = '\\{(\\w+://\\S+)\\}', format = '$1', highlight = 1 },
      { regex = '<(\\w+://\\S+)>', format = '$1', highlight = 1 },
      { regex = '[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)', format = '$1', highlight = 1 },
      { regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b', format = 'mailto:$0' }
    }
  }
})