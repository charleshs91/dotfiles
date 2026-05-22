return {
  "nvim-neotest/neotest",
  dependencies = {
    "antoinemadec/FixCursorHold.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-neotest/neotest-jest",
    "nvim-neotest/nvim-nio",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    adapters = {
      "neotest-jest",
    },
  },
}
