return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {},
        bashls = {
          filetypes = { "sh", "zsh" },
        },
        sourcekit = {
          cmd = { "xcrun", "sourcekit-lsp" },
        },
      },
    },
  },
}
