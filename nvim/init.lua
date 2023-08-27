require('victor7w7r.base')
require('victor7w7r.maps')
require('victor7w7r.packer')
require('victor7w7r.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_linux = has "unix"
local is_win = has "win32"

if is_mac == 1 then
  require('victor7w7r.macos')
end
if is_linux == 1 then
  require('victor7w7r.linux')
end
if is_win == 1 then
  require('victor7w7r.win')
end
