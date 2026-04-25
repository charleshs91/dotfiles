-- Add this to your lazy.nvim plugins setup
-- https://github.com/mbbill/undotree
return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  keys = {
    { "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
  },
  config = function()
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_WindowLayout = 0
    vim.g.undotree_SplitWidth = 60
  end,
}
