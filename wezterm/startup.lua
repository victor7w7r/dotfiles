local wezterm = require 'wezterm'

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

wezterm.on('format-tab-title', function(tab)
  local process = string.gsub(tab.active_pane.foreground_process_name, '(.*[/\\])(.*)', '%2')

  local cwd = tab.active_pane.current_working_dir
  cwd = cwd and string.format('%s ', cwd.file_path:gsub(os.getenv 'HOME', '~')) or ''

  return string.format('(%d %s) %s', tab.tab_index + 1, process, cwd)
end)