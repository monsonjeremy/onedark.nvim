local util = require("onedark.util")
local theme = require("onedark.theme")
local configModule = require("onedark.config")

local function setup(userConfig)
  -- Applying user configuration
  if userConfig then configModule.applyConfiguration(userConfig) end

  -- Load colorscheme
  util.load(theme.setup(configModule.config))
end

return {setup = setup}
