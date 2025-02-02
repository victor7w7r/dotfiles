return {
  automatically_reload_config = true,
  exit_behavior = 'CloseOnCleanExit',
  exit_behavior_messaging = 'Verbose',
  warn_about_missing_glyphs = false,
  scrollback_lines = 5000,
  status_update_interval = 1000,
  check_for_updates = false,

  hyperlink_rules = {
    { regex = '\\((\\w+://\\S+)\\)', format = '$1', highlight = 1 },
    { regex = '\\[(\\w+://\\S+)\\]', format = '$1', highlight = 1 },
    { regex = '\\{(\\w+://\\S+)\\}', format = '$1', highlight = 1 },
    { regex = '<(\\w+://\\S+)>', format = '$1', highlight = 1 },
    { regex = '[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)', format = '$1', highlight = 1 },
    { regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b', format = 'mailto:$0' }
  }
}