local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- font
config.font_size = 13
config.font = wezterm.font 'JetBrains Mono'
config.use_ime = true

-- colors & appearance
config.color_scheme = 'catppuccin-mocha'

config.window_background_opacity = 0.90
config.macos_window_background_blur = 10

-- tab bar
config.window_decorations = "RESIZE"

-- keymap
config.leader = { key = 'q', mods = 'CTRL' }
config.keys = {
  {
    key = '¥',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    desc = 'Split pane horizontally',
  },
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    desc = 'Split pane vertically',
  },
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = false },
    desc = 'Close current pane',
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Left',
    desc = 'Move to left pane',
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Right',
    desc = 'Move to right pane',
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Up',
    desc = 'Move to upper pane',
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Down',
    desc = 'Move to lower pane',
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.SpawnCommandInNewTab,
    desc = 'Create new tab',
  },
  {
    key = 'k',
    mods = 'CTRL',
    action = wezterm.action.ActivateTabRelative(1),
    desc = 'Switch to next tab',
  },
  {
    key = 'j',
    mods = 'CTRL',
    action = wezterm.action.ActivateTabRelative(-1),
    desc = 'Switch to previous tab',
  },
  {
    key = '[',
    mods = 'LEADER',
    action = wezterm.action.ActivateCopyMode,
    desc = 'Enter copy mode',
  },
  {
    key = "LeftArrow",
    mods = "OPT",
    action = wezterm.action.SendKey({ mods = "ALT", key = "b" }),
    desc = 'Move cursor one word left',
  },
  {
    key = "RightArrow",
    mods = "OPT",
    action = wezterm.action.SendKey({ mods = "ALT", key = "f" }),
    desc = 'Move cursor one word right',
  },
  {
    key = "LeftArrow",
    mods = "CMD",
    action = wezterm.action.SendKey({ mods = "CTRL", key = "a" }),
    desc = 'Move cursor to line start',
  },
  {
    key = "RightArrow",
    mods = "CMD",
    action = wezterm.action.SendKey({ mods = "CTRL", key = "e" }),
    desc = 'Move cursor to line end',
  },
  {
    key = "Backspace",
    mods = "CMD",
    action = wezterm.action.SendKey({ mods = "CTRL", key = "u" }),
    desc = 'Delete line before cursor',
  },
  {
    key = 'LeftArrow',
    mods = 'LEADER',
    action = wezterm.action.MoveTabRelative(-1),
    desc = 'Move tab left',
  },
  {
    key = 'RightArrow',
    mods = 'LEADER',
    action = wezterm.action.MoveTabRelative(1),
    desc = 'Move tab right',
  },
}

-- バックスラッシュ対応
config.send_composed_key_when_left_alt_is_pressed = true

return config
