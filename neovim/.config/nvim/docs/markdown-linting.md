# Markdown linting in LazyVim

This Neovim config uses LazyVim's Markdown extra, which configures
[`nvim-lint`](https://github.com/mfussenegger/nvim-lint) to run
[`markdownlint-cli2`](https://github.com/DavidAnson/markdownlint-cli2) for Markdown files.

## Current setup

Markdown linting is customized with two files:

```text
lua/plugins/markdownlint.lua
markdownlint-cli2.yaml
```

### `lua/plugins/markdownlint.lua`

This LazyVim plugin override tells `nvim-lint` to run `markdownlint-cli2` with a Neovim-level config file:

```lua
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
```

### `markdownlint-cli2.yaml`

This file contains the actual Markdown lint rule overrides:

```yaml
config:
  MD013: false # line length
```

## Disabled rules

| Rule | Description | Status |
| --- | --- | --- |
| `MD013` | Line length | Disabled |

`MD013` is disabled so Markdown files can contain long lines without showing lint warnings in Neovim.

## Applying changes

After editing the config, either restart Neovim or reload the plugin with:

```vim
:Lazy reload nvim-lint
```

## Adding more disabled rules

To disable another Markdown lint rule, add it to `markdownlint-cli2.yaml`:

```yaml
config:
  MD013: false # line length
  MD033: false # inline HTML
  MD041: false # first line should be a top-level heading
```

Then reload `nvim-lint`:

```vim
:Lazy reload nvim-lint
```

## Useful links

- <https://github.com/mfussenegger/nvim-lint>
- <https://github.com/DavidAnson/markdownlint-cli2>
- <https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md>
