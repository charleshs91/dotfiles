return {
  -- set colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
      -- colorscheme = "gruvbox",
      -- colorscheme = "kanagawa",
    },
  },

  -- https://github.com/ellisonleao/gruvbox.nvim
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent_mode = true,
  --     contrast = "hard",
  --   },
  -- },

  -- https://github.com/rebelot/kanagawa.nvim
  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = false, -- Or use `event = 'VeryLazy'` if you prefer
  --   opts = {
  --     -- Optional: Customize Kanagawa settings here if needed
  --     transparent = true,
  --     colors = {
  --       theme = {
  --         all = {
  --           ui = {
  --             bg_gutter = "none",
  --           },
  --         },
  --       },
  --     },
  --   },
  --   config = function(_, opts)
  --     require("kanagawa").setup(opts) -- Setup Kanagawa
  --   end,
  -- },
}
