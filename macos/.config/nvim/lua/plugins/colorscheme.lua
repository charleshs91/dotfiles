return {

  -- set colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- install and configure gruvbox: https://github.com/ellisonleao/gruvbox.nvim
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_mode = true,
    },
  },

  -- -- install and configure tokyonight
  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = "normal",
  --       floats = "normal",
  --     },
  --   },
  -- },
}
