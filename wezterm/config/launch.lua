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
    {
      label = 'Git Bash',
      args = { 'C:\\Users\\victor7w7r\\scoop\\apps\\git\\current\\bin\\bash.exe' },
    },
  }
elseif platform.is_mac then
  default_prog = { '/usr/local/bin/fish', '-l' }
  os_menu = {
    { label = 'Bash', args = { 'bash', '-l' } },
    { label = 'Fish', args = { '/usr/local/bin/fish', '-l' } },
  }
elseif platform.is_linux then
  default_prog = { 'fish', '-l' }
  os_menu = {
    { label = 'Bash', args = { 'bash', '-l' } },
    { label = 'Fish', args = { 'fish', '-l' } },
  }
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