-- https://github.com/monkoose/neocodeium
return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")

    neocodeium.setup({
      show_label = true,
      debounce = false,
      silent = true,
    })

    vim.keymap.set("i", "<A-f>", neocodeium.accept, { desc = "Accept AI suggestion" })
    vim.keymap.set("i", "<A-w>", neocodeium.accept_word, { desc = "Accept AI suggestion word" })
    vim.keymap.set("i", "<A-a>", neocodeium.accept_line, { desc = "Accept AI suggestion line" })
    vim.keymap.set("i", "<A-e>", neocodeium.cycle_or_complete, { desc = "Next AI suggestion" })
    vim.keymap.set("i", "<A-r>", function()
      neocodeium.cycle_or_complete(-1)
    end, { desc = "Previous AI suggestion" })
    vim.keymap.set("i", "<A-c>", neocodeium.clear, { desc = "Clear AI suggestion" })
  end,
}
