{ pkgs, lib, inputs, ... }:

# programs.niri.config accepts a KDL string.
# We split it into focused sub-files and concatenate them here
# so each concern stays in its own file — exactly like your old KDL split.
#
# Sub-files live next to this file:
#   misc.kdl          spawn-at-startup, screenshot-path, hotkey-overlay, etc.
#   input.kdl         keyboard / touchpad / mouse settings
#   layout.kdl        gaps, column widths, focus-ring, cursor, overview
#   binds.kdl         all keybinds
#   animations.kdl    animation block
#   window-rules.kdl  window-rule blocks

{
  programs.niri = {
    # The niri-flake home-manager module provides programs.niri.config
    # as a KDL string that gets written to ~/.config/niri/config.kdl.
    config = builtins.concatStringsSep "\n" (map builtins.readFile [
      ./misc.kdl
      ./input.kdl
      ./layout.kdl
      ./binds.kdl
      ./animations.kdl
      ./window-rules.kdl
    ]);
  };
}
