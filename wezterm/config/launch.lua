local platform = require 'utils.platform'
local tables = require 'utils.tables'

local options = {}
local default_prog = {}
local os_menu = {}

if platform.is_win then
  default_prog = { 'pwsh', '-NoLogo' }
  os_menu = {
    { label = 'PowerShell Core', args = { 'pwsh', '-NoLogo' } },
    { label = 'PowerShell Desktop', args = { 'powershell' } },
    { label = 'Command Prompt', args = { 'cmd' } },
    { label = 'Msys2', args = { 'ucrt64.cmd' } },
  }
elseif platform.is_mac then
  default_prog = { "/usr/local/bin/zsh", "-l"}
elseif platform.is_linux then
  default_prog = { 'zsh', '-l' }
end

options.default_prog = default_prog
options.launch_menu = tables.merge({
  os_menu,
  {
    { label = 'btop', args = { 'btop' } },
    { label = 'cmatrix',  args = { 'cmatrix' } },
  }
})

return options