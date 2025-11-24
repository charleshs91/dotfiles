-- https://github.com/folke/snacks.nvim
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      layout = {
        cycle = false,
      },
      hidden = true,
      ignored = true,
      sources = {
        files = {
          hidden = true,
          ignored = true,
        },
      },
    },
  },
}
