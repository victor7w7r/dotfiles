local gpu_adapters = require 'utils.gpu-adapter'
local platform = require 'utils.platform'
local tables = require 'utils.tables'

local gpu = {}

if platform.is_linux then
  gpu.enable_wayland = false
  gpu.prefer_egl = true
end

return tables.merge({
  gpu,
  {
    animation_fps = 120,
    front_end = 'OpenGL',
    max_fps = 120,
    webgpu_force_fallback_adapter = false,
    webgpu_power_preference = "HighPerformance",
    webgpu_preferred_adapter = gpu_adapters:pick_best(),
    -- webgpu_preferred_adapter = gpu_adapters:pick_manual('Dx12', 'IntegratedGpu'),
    -- webgpu_preferred_adapter = gpu_adapters:pick_manual('Gl', 'Other'),
  }
})
