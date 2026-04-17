return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {},
        bashls = {},
        sourcekit = {
          cmd = { "xcrun", "sourcekit-lsp" },
        },
      },
    },
  },
}
