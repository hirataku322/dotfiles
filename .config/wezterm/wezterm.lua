local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- font
config.font_size = 13
config.font = wezterm.font 'JetBrains Mono'
config.use_ime = true

-- colors & appearance
config.color_scheme = 'iceberg-dark'

config.window_background_opacity = 0.85
config.macos_window_background_blur = 20

-- tab bar
config.window_decorations = "RESIZE"
config.show_tabs_in_tab_bar = true

-- keymap
config.leader = {key = 'q', mods='CTRL'}
config.keys = {
  {
    key = '¥',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal {domain = 'CurrentPaneDomain'},
  },
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane {confirm = false} ,
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.SpawnCommandInNewTab,
  },
  { 
    key = 'n', 
    mods = 'LEADER', 
    action = wezterm.action.ActivateTabRelative(1) 
  },
  { 
    key = '[', 
    mods = 'LEADER', 
    action = wezterm.action.ActivateCopyMode 
  },
	{ 
    key = "LeftArrow", 
    mods = "OPT", 
    action = wezterm.action.SendKey({ mods = "ALT", key = "b" }) 
  },
	{ 
    key = "RightArrow", 
    mods = "OPT", 
    action = wezterm.action.SendKey({ mods = "ALT", key = "f" }) 
  },
  { 
    key = "LeftArrow",
    mods = "CMD",
    action = wezterm.action.SendKey({ mods = "CTRL", key = "a" }) 
  },
  {
    mods = "CMD",
    key = "RightArrow",
    action = wezterm.action.SendKey({ mods = "CTRL", key = "e" }) 
  },
  {
    mods = "CMD",
    key = "Backspace",
    action = wezterm.action.SendKey({ mods = "CTRL", key = "u" }) 
  },
  {
    mods = "CMD|OPT",
    key = "LeftArrow",
    action = wezterm.action.ActivateTabRelative(-1) },
  {
    mods = "CMD|OPT",
    key = "RightArrow",
    action = wezterm.action.ActivateTabRelative(1) },
}

-- バックスラッシュ対応
config.send_composed_key_when_left_alt_is_pressed = true

return config
