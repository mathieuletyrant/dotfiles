-- Pull in the wezterm API
local wezterm = require("wezterm")

local mux = wezterm.mux
local act = wezterm.action

local config = wezterm.config_builder()

config.set_environment_variables = {
  PATH = os.getenv("PATH"),
}

-- Set leader key
config.leader = { key = "b", mods = "OPT", timeout_milliseconds = 1500 }

config.font = wezterm.font("MesloLGS Nerd Font Mono")

config.color_scheme = 'Monokai Remastered'
config.default_cursor_style = 'BlinkingBar'
config.initial_rows = 24
config.initial_cols = 90
config.default_cwd = "/Users/mathieuletyrant/Documents"

config.keys = {
  { key = "d", mods = "SHIFT|CMD", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "DownArrow", mods = "SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
  { key = "UpArrow", mods = "SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
  { key = "LeftArrow", mods = "SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
  { key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },
  { key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
  { key = "Enter", mods = "LEADER", action = act.ActivateCopyMode },
  { key = "c", mods = "CMD", action = act.CopyTo("Clipboard") },
  { key = "n", mods = "CMD", action = act.SpawnWindow },
  { key = "v", mods = "CMD", action = act.PasteFrom("Clipboard") },
  { key = "k", mods = "CMD", action = act.ResetTerminal },
}

config.mouse_bindings = {
  -- Ctrl-click will open the link under the mouse cursor
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

wezterm.on("format-tab-title", function(tab)
  local cwd = get_current_working_dir(tab)
  local title = tab.tab_title
  local num = tab.tab_index + 1

  if title and #title > 0 then
    return string.format("  %s %s  ", num, title)
  end

  return string.format("  %s %s  ", num, cwd)
end)

return config