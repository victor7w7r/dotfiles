local wezterm = require 'wezterm'

---@class Config
---@field options table
local Config = {}
Config.__index = Config

---@return Config
function Config:init()
  local config = setmetatable({ options = {} }, self)
  return config
end

---@param new_options table new options to append
---@return Config
function Config:append(new_options)
  for k, v in pairs(new_options) do
    if self.options[k] ~= nil then
        wezterm.log_warn(
          'Configuración duplicada detectada: ',
          { old = self.options[k], new = new_options[k] }
        )
        goto continue
    end
    self.options[k] = v
      ::continue::
  end
  return self
end

return Config