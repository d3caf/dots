local wezterm = require('wezterm');
local config = wezterm.config_builder();

config.font = wezterm.font("FiraCode Nerd Font");
config.font_size = 13.0
config.color_scheme = "catppuccin-mocha";
config.enable_scroll_bar = false;
config.window_padding = {
  left = "1cell",
  right = "1cell",
  top = "1.5cell",
  bottom = ".5cell"
};

config.unzoom_on_switch_pane = true;
config.initial_cols = 160;
config.initial_rows = 48;
config.window_decorations = "RESIZE";

-- Tab bar
config.use_fancy_tab_bar = false;
config.hide_tab_bar_if_only_one_tab = true;
config.show_new_tab_button_in_tab_bar = false;
-- config.show_close_tab_button_in_tabs = false;

-- Keys
config.leader = { key = "a", mods = "CTRL" };
config.keys = {
  {
    key = "P",
    mods = "CMD|SHIFT",
    action = wezterm.action.ActivateCommandPalette
  },
  {
    key = "Enter",
    mods = "LEADER",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
  },
  {
    key = "Enter",
    mods = "LEADER|SHIFT",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
  },
  {
    key = "x",
    mods = "LEADER",
    action = wezterm.action.CloseCurrentPane { confirm = true }
  },
  {
    key = "z",
    mods = "LEADER",
    action = wezterm.action.TogglePaneZoomState
  },
  {
    key = "h",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Left")
  },
  {
    key = "j",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Down")
  },
  {
    key = "k",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Up")
  },
  {
    key = "l",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Right")
  },
  {
    key = "v",
    mods = "LEADER",
    action = wezterm.action.ActivateCopyMode
  },
  {
    key = "k",
    mods = "CMD",
    action = wezterm.action.ClearScrollback("ScrollbackAndViewport")
  },
  {
    key = " ",
    mods = "LEADER",
    action = wezterm.action.RotatePanes("Clockwise")
  },
  {
    key = "f",
    mods = "LEADER",
    action = wezterm.action.Search("CurrentSelectionOrEmptyString")
  }
};

return config;
