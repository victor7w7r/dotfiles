local wezterm = require 'wezterm'

local M = {}

M.setup = function()
  wezterm.on("gui-startup", function(cmd)
    local ratio = 0.75

    local screen = wezterm.gui.screens().active
    local width, height = screen.width * ratio, screen.height * ratio
    local tab, pane, window = wezterm.mux.spawn_window {
      position = {
        x = (screen.width - width) / 2,
        y = (screen.height - height) / 2,
        origin = 'ActiveScreen'
      }
    }
    window:gui_window():set_inner_size(width, height)
  end)
end

return M
