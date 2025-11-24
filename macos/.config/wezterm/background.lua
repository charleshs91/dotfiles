-- Get a random image
local function get_image()
  local assets_dir = os.getenv("HOME") .. "/.config/wezterm/assets"

  local image_exts = {
    png = true,
    jpg = true,
    jpeg = true,
    gif = true,
    bmp = true,
    webp = true,
  }

  local function get_images()
    local images = {}
    for file in io.popen('ls "' .. assets_dir .. '"'):lines() do
      local ext = file:match("%.([^%.]+)$")
      if ext and image_exts[ext:lower()] then
        table.insert(images, assets_dir .. "/" .. file)
      end
    end
    return images
  end

  local image_list = get_images()

  local bg_image = image_list[math.random(#image_list)]
  return bg_image
end

local config = {}
local dimmer = { brightness = 0.07 }
local opacity = 0.95

config.background = {
  {
    source = {
      File = get_image(),
    },
    hsb = dimmer,
    opacity = opacity,
  },
}
config.window_background_opacity = opacity
config.macos_window_background_blur = 60
return config
