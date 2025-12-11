return {
  -- https://github.com/ellisonleao/gruvbox.nvim
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_mode = true,
      contrast = "hard",
    },
  },

  -- https://github.com/folke/tokyonight.nvim
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      style = "night",
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  -- set colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
      -- colorscheme = "tokyonight",
    },
  },
}
