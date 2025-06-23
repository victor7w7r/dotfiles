local Config = require 'config'
local wezterm = require 'wezterm'

require('config.events').setup()
require('config.events').setup_title()

wezterm.on('mux-is-process-stateful', function(proc)
  print(proc)

  -- Just use the default behavior
  return nil
end)

return Config:init()
  :append(require('config.appearance'))
  :append(require('config.bindings'))
  :append(require('config.domains'))
  :append(require('config.general'))
  :append(require('config.launch')).options