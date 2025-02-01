local wezterm = require 'wezterm'

local utils = require 'utils'
local hyperlink = require 'hyperlink'
local gpu = require 'gpu'
local menus = require 'menus'
local ui = require 'ui'
local _ = require 'startup'

local config = {}

config = utils.merge({
  {
    automatically_reload_config = true,
    check_for_updates = false,
  },
  hyperlink,
  menus,
  gpu,
  ui
})

wezterm
  .plugin
  .require("https://gitlab.com/xarvex/presentation.wez")
  .apply_to_config(config)

return config