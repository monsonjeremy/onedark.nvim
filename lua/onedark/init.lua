local util = require('onedark.util')
local theme = require('onedark.theme')
local config = require('onedark.config')

local M = {}

---@param opts Config|nil
function M.load(opts)
  if opts then
    require('onedark.config').extend(opts)
  end
  util.load(theme.setup())
end

M.setup = config.setup

-- keep for backward compatibility
M.colorscheme = M.load

return M
