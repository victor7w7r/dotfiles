local wezterm = require 'wezterm'
local platform = require 'utils.platform'
local act = wezterm.action

local mod = {}

if platform.is_mac then
  mod.SUPER = 'SUPER'
  mod.SUPER_REV = 'SUPER|CTRL'
elseif platform.is_win or platform.is_linux then
  mod.SUPER = 'ALT'
  mod.SUPER_REV = 'ALT|CTRL'
end

local keys = {
  -- misc/useful --
  { key = 'F6', mods = 'NONE', action = act.ShowLauncher },
  { key = 'F4', mods = 'NONE', action = act.ActivateCommandPalette },
  { key = 'F11', mods = 'NONE',    action = act.ToggleFullScreen },
  { key = 'F12', mods = 'NONE',    action = act.ShowDebugOverlay },

  -- cursor movement --
  { key = 'LeftArrow',  mods = mod.SUPER,     action = act.SendString '\u{1b}OH' },
  { key = 'RightArrow', mods = mod.SUPER,     action = act.SendString '\u{1b}OF' },
  { key = 'Backspace',  mods = mod.SUPER,     action = act.SendString '\u{15}' },
  {
    key = "RightArrow",
    mods = "SHIFT",
    action = wezterm.action.SendString("\x1b[1;2C"),
  },
  {
    key = "LeftArrow",
    mods = "SHIFT",
    action = wezterm.action.SendString("\x1b[1;2D"),
  },

  -- copy/paste --
  { key = 'c',          mods = mod.SUPER,  action = act.CopyTo('Clipboard') },
  { key = 'v',          mods = mod.SUPER,  action = act.PasteFrom('Clipboard') },

  -- window --
  -- window: zoom window
  {
    key = '-',
    mods = mod.SUPER,
    action = wezterm.action_callback(function(window, _pane)
        local dimensions = window:get_dimensions()
        if dimensions.is_full_screen then
          return
        end
        local new_width = dimensions.pixel_width - 50
        local new_height = dimensions.pixel_height - 50
        window:set_inner_size(new_width, new_height)
    end)
  },
  {
    key = '=',
    mods = mod.SUPER,
    action = wezterm.action_callback(function(window, _pane)
        local dimensions = window:get_dimensions()
        if dimensions.is_full_screen then
          return
        end
        local new_width = dimensions.pixel_width + 50
        local new_height = dimensions.pixel_height + 50
        window:set_inner_size(new_width, new_height)
    end)
  },

  -- key-tables --
  -- resizes fonts
  {
    key = 'f',
    mods = 'LEADER',
    action = act.ActivateKeyTable({
        name = 'resize_font',
        one_shot = false,
        timemout_miliseconds = 1000,
    }),
  },
  -- resize panes
  {
    key = 'p',
    mods = 'LEADER',
    action = act.ActivateKeyTable({
        name = 'resize_pane',
        one_shot = false,
        timemout_miliseconds = 1000,
    }),
  },
}

-- stylua: ignore
local key_tables = {
  resize_font = {
    { key = 'k',      action = act.IncreaseFontSize },
    { key = 'j',      action = act.DecreaseFontSize },
    { key = 'r',      action = act.ResetFontSize },
    { key = 'Escape', action = 'PopKeyTable' },
    { key = 'q',      action = 'PopKeyTable' },
  },
  resize_pane = {
    { key = 'k',      action = act.AdjustPaneSize({ 'Up', 1 }) },
    { key = 'j',      action = act.AdjustPaneSize({ 'Down', 1 }) },
    { key = 'h',      action = act.AdjustPaneSize({ 'Left', 1 }) },
    { key = 'l',      action = act.AdjustPaneSize({ 'Right', 1 }) },
    { key = 'Escape', action = 'PopKeyTable' },
    { key = 'q',      action = 'PopKeyTable' },
  },
}

local mouse_bindings = {
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.OpenLinkAtMouseCursor,
  },
}

return {
  disable_default_key_bindings = true,
  leader = { key = 'Space', mods = mod.SUPER_REV },
  keys = keys,
  key_tables = key_tables,
  mouse_bindings = mouse_bindings,
}
