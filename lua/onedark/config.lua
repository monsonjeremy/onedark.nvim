local M = {}

---@class Config
local defaults = {
  transparent = false,
  commentStyle = 'italic',
  keywordStyle = 'NONE',
  functionStyle = 'NONE',
  variableStyle = 'NONE',
  hideInactiveStatusline = false,
  sidebars = {},
  colors = {},
  dev = false,
  hideNonText = true,
  darkFloat = true,
  darkSidebar = true,
  customTelescope = false,
  transform_colors = false,
}

---@type Config
M.config = {}

---@param options Config|nil
function M.setup(options)
  M.config = vim.tbl_deep_extend('force', {}, defaults, options or {})
end

---@param options Config|nil
function M.extend(options)
  M.config = vim.tbl_deep_extend('force', {}, M.options or defaults, options or {})
end

M.setup()

return M
