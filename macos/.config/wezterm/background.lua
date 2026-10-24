local M = {}

local assets_loader = require("assets.loader")

function M.setup(config)
  local dimmer = { brightness = 0.07 }
  local opacity = 1

  config.background = {
    {
      source = {
        File = assets_loader.get_random_image(),
      },
      hsb = dimmer,
      opacity = opacity,
    },
  }
  config.window_background_opacity = opacity
end

return M
