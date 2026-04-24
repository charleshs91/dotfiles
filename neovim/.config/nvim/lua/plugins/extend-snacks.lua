-- https://github.com/folke/snacks.nvim
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      layout = {
        cycle = false,
      },
      hidden = true,
      ignored = true,
      sources = {
        explorer = {
          auto_close = true,
          cycle = true,
          layout = {
            preview = "main",
            width = 0.3,
            min_width = 30,
          },
        },
        files = {
          hidden = true,
          ignored = true,
        },
      },
    },
  },
}
