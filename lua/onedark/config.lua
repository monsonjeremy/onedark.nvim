---@class Config
local config

local vimConfig = false

-- shim vim for kitty and other generators
vim = vim or { g = {}, o = {} }

local function opt(key, default)
  if vim.g[key] == nil then
    return default
  else
    vimConfig = true
    if vim.g[key] == 0 then
      return false
    else
      return vim.g[key]
    end
  end
end

local g = {
  transparent = "onedark_transparent",
  commentStyle = "onedark_italic_comments",
  keywordStyle = "onedark_italic_keywords",
  functionStyle = "onedark_italic_functions",
  variableStyle = "onedark_italic_variables",
  hideInactiveStatusline = "onedark_hide_inactive_statusline",
  sidebars = "onedark_sidebars",
  colors = "onedark_colors",
  dev = "onedark_dev",
  hideNonText = "onedark_hide_nontext",
  darkFloat = "onedark_dark_float",
  darkSidebar = "onedark_dark_sidebar",
}

config = {
  transparent = opt(g.transparent, false),
  commentStyle = opt(g.commentStyle, true) and "italic" or "NONE",
  keywordStyle = opt(g.keywordStyle, true) and "italic" or "NONE",
  functionStyle = opt(g.functionStyle, false) and "italic" or "NONE",
  variableStyle = opt(g.variableStyle, false) and "italic" or "NONE",
  hideInactiveStatusline = opt(g.hideInactiveStatusline, false),
  sidebars = opt(g.sidebars, {}),
  colors = opt(g.colors, {}),
  dev = opt(g.dev, false),
  hideNonText = opt(g.hideNonText, true),
  darkFloat = opt(g.darkFloat, true),
  darkSidebar = opt(g.darkSidebar, true),
  transform_colors = false,
}

---@param userConfig Config
local function applyConfiguration(userConfig)
  for key, value in pairs(userConfig) do
    if value ~= nil then
      if config[key] ~= nil then
        config[key] = value
      else
        error("monsonjeremy/onedark: Option " .. key .. " does not exist") -- luacheck: ignore
      end
    end
  end
end

return { config = config, vimConfig = vimConfig, applyConfiguration = applyConfiguration }

