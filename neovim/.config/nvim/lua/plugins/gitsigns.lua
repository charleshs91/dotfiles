-- https://github.com/lewis6991/gitsigns.nvim
return {
  "lewis6991/gitsigns.nvim",
  opts = function(_, opts)
    local gs = package.loaded.gitsigns
    local lazyvim_on_attach = opts.on_attach

    -- Enable current line blame by default
    opts.current_line_blame = true
    -- Optional: Further customize the appearance or behavior
    opts.current_line_blame_opts = {
      virt_text = true, -- Show blame as virtual text
      virt_text_pos = "eol", -- Position the text at the end of the line
      delay = 500, -- Delay in milliseconds
      ignore_whitespace = false,
    }
    -- Customize the blame message format
    opts.current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>"

    opts.on_attach = function(buffer)
      if lazyvim_on_attach then
        lazyvim_on_attach(buffer)
      end

      -- Navigate staged *and* unstaged hunks with ]h/[h/]H/[H
      local function map(lhs, direction, diff_key, desc)
        vim.keymap.set("n", lhs, function()
          if diff_key and vim.wo.diff then
            vim.cmd.normal({ diff_key, bang = true })
          else
            gs.nav_hunk(direction, { target = "all" })
          end
        end, { buffer = buffer, desc = desc, silent = true })
      end

      map("]h", "next", "]c", "Next Git hunk")
      map("[h", "prev", "[c", "Prev Git hunk")
      map("]H", "last", nil, "Last Git hunk")
      map("[H", "first", nil, "First Git hunk")
    end
  end,
}
