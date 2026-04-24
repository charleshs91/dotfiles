local M = {}

local wezterm = require("wezterm")

-- Helper function to get the basename of a path
local function basename(s)
  return string.gsub(s, "(.*[/\\\\])(.*)", "%2")
end

M.setup_tab_title_format = function()
  wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane

    -- Get the process name
    local process = basename(pane.foreground_process_name)

    -- Get the current directory, defaulting to home if unknown
    local cwd = "?"
    if pane.current_working_dir then
      -- Get basename of CWD
      cwd = basename(tostring(pane.current_working_dir))
    end

    -- Get Tab Index (1-based index)
    local index = tab.tab_index + 1

    local title = string.format("%d. %s | %s ", index, process, cwd)

    return {
      { Text = title },
    }
  end)
end

return M
