return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      bashls = {
        filetypes = { "sh", "zsh" },
      },
      sourcekit = {
        cmd = { "xcrun", "sourcekit-lsp" },
      },
    },
  },
}
