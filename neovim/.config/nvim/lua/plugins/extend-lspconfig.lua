return {
  {
    "neovim/nvim-lspconfig",
    ---@type vim.lsp.Config
    opts = {
      servers = {
        tailwindcss = {},
        bashls = {},
        sourcekit = {
          cmd = { "xcrun", "sourcekit-lsp" },
        },
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = true,
              },
            },
          },
        },
      },
    },
  },
}
