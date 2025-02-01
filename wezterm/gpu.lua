local wezterm = require 'wezterm'
local utils = require 'utils'

local gpu = {}

if wezterm.target_triple:find("linux") ~= nil then
  gpu.enable_wayland = true
  gpu.prefer_egl = true
end

return utils.merge({
  gpu,
  {
    front_end = 'WebGpu',
    force_reverse_video_cursor = true,

    max_fps = 120,
    animation_fps = 10,
  }
})