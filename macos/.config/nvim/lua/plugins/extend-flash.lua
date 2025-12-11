-- https://github.com/folke/flash.nvim
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  vscode = true,
  opts = {
    modes = {
      char = {
        jump_labels = true,
      },
      search = {
        enabled = true,
      },
    },
  },
}
