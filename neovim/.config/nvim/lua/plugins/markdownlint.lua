return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      local lint = require("lint")

      lint.linters["markdownlint-cli2"].args = {
        "--config",
        vim.fn.stdpath("config") .. "/markdownlint-cli2.yaml",
        "-",
      }

      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.markdown = { "markdownlint-cli2" }
    end,
  },
}
