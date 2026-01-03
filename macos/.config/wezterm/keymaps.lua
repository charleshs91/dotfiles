local M = {}

function M.setup(config)
  local wezterm = require("wezterm")
  local act = wezterm.action

  config.disable_default_key_bindings = true
  config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
  config.keys = {
    { key = "R", mods = "SHIFT|CTRL", action = act.ReloadConfiguration },

    -- Window
    { key = "N", mods = "SHIFT|CTRL", action = act.SpawnWindow },

    -- Tab
    { key = "l", mods = "CMD|SHIFT", action = act.ActivateTabRelative(1) },
    { key = "h", mods = "CMD|SHIFT", action = act.ActivateTabRelative(-1) },
    { key = "PageDown", mods = "CTRL", action = act.ActivateTabRelative(1) },
    { key = "PageUp", mods = "CTRL", action = act.ActivateTabRelative(-1) },
    { key = "[", mods = "LEADER", action = act.MoveTabRelative(-1) },
    { key = "]", mods = "LEADER", action = act.MoveTabRelative(1) },
    { key = "w", mods = "CMD", action = act.CloseCurrentTab({ confirm = false }) },
    { key = "t", mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },

    -- Pane
    { key = "j", mods = "CMD", action = act.ActivatePaneDirection("Down") },
    { key = "k", mods = "CMD", action = act.ActivatePaneDirection("Up") },
    { key = "h", mods = "CMD", action = act.ActivatePaneDirection("Left") },
    { key = "l", mods = "CMD", action = act.ActivatePaneDirection("Right") },
    { key = "f", mods = "CMD", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "x", mods = "CMD", action = act.CloseCurrentPane({ confirm = false }) },
    { key = "LeftArrow", mods = "SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
    { key = "DownArrow", mods = "SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
    { key = "UpArrow", mods = "SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
    { key = "RightArrow", mods = "SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
    { key = "z", mods = "CMD", action = act.TogglePaneZoomState },

    -- Copy and paste
    { key = "Enter", mods = "CMD", action = act.ActivateCopyMode },
    { key = "Enter", mods = "LEADER", action = act.ActivateCopyMode },
    { key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
    { key = "v", mods = "CMD", action = act.PasteFrom("Clipboard") },

    -- Font size
    { key = "=", mods = "CTRL", action = act.IncreaseFontSize },
    { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
    { key = "0", mods = "CTRL", action = act.ResetFontSize },

    -- Unicode characters
    {
      key = "U",
      mods = "SHIFT|CTRL",
      action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
    },

    -- Command line editing
    { key = "LeftArrow", mods = "OPT", action = act.SendKey({ mods = "ALT", key = "b" }) },
    { key = "RightArrow", mods = "OPT", action = act.SendKey({ mods = "ALT", key = "f" }) },
    { key = "LeftArrow", mods = "CMD", action = act.SendKey({ mods = "CTRL", key = "a" }) },
    { key = "RightArrow", mods = "CMD", action = act.SendKey({ mods = "CTRL", key = "e" }) },
    { key = "Backspace", mods = "CMD", action = act.SendKey({ mods = "CTRL", key = "u" }) },

    -- Change tab title
    {
      key = ",",
      mods = "LEADER",
      action = act.PromptInputLine({
        description = "Enter a new name for this tab:",
        action = wezterm.action_callback(function(window, pane, line)
          -- line will be `nil` if they hit escape without entering anything
          -- An empty string if they just hit enter
          -- Or the actual line of text they wrote
          if line then
            window:active_tab():set_title(line)
          end
        end),
      }),
    },
  }

  for i = 1, 9 do
    -- Cmd + number to activate that tab
    table.insert(config.keys, {
      key = tostring(i),
      mods = "CMD",
      action = act.ActivateTab(i - 1),
    })
  end
end

return M
