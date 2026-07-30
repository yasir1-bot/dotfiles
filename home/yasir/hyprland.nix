# ---------------------------------------------------------------------------
# Hyprland configuration (Home Manager).
# ---------------------------------------------------------------------------
{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang"; # see note above -- deliberate, not a typo

    # Matches the nixpkgs Hyprland used by modules/hyprland.nix (system
    # module). Keep these two in sync: mixing a flake Hyprland with the
    # nixpkgs one is the classic source of hard-to-debug crashes.
    package = pkgs.hyprland;
    xwayland.enable = true;

    # Re-exports the right env vars (PATH, WAYLAND_DISPLAY, etc.) into the
    # systemd --user session, so services started via systemd (like
    # Noctalia's, see home/yasir/noctalia.nix) actually see them.
    systemd = {
      enable = true;
      variables = [ "--all" ];
    };

    settings = {
      # -----------------------------------------------------------------
      # Variables
      # -----------------------------------------------------------------
      "$terminal" = "kitty";
      "$menu" = "fuzzel";
      "$mod" = "SUPER";

      # -----------------------------------------------------------------
      # Monitors -- replace with real `hyprctl monitors` output once
      # you're on actual hardware. ",preferred,auto,1" auto-detects
      # resolution/refresh/position at 1x scale.
      # -----------------------------------------------------------------
      monitor = [ ",preferred,auto,1" ];

      # Example of pinning workspaces to a monitor so Noctalia's workspace
      # indicator shows empty workspaces too, not just ones with windows
      # (see docs.noctalia.dev/v5/compositor-settings/hyprland/#persistent-workspaces).
      # Swap "DP-1" for your real connector name (`hyprctl monitors`), then
      # uncomment:
      # workspace = [
      #   "1, monitor:DP-1, persistent:true"
      #   "2, monitor:DP-1, persistent:true"
      #   "3, monitor:DP-1, persistent:true"
      # ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      input = {
        kb_layout = "gb";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad.natural_scroll = true;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        layout = "dwindle";
        "col.active_border" = "rgba(89b4faee)";
        "col.inactive_border" = "rgba(595959aa)";
      };

      decoration = {
        rounding = 12;
        active_opacity = 1.0;
        inactive_opacity = 0.95;

        blur = {
          enabled = true;
          size = 3;
          passes = 2;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = [ "myBezier, 0.05, 0.9, 0.1, 1.05" ];
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        preserve_split = true;
      };

      # Hyprland's touchpad gesture system was reworked back in 0.51 (Sept
      # 2025): the old `gestures { workspace_swipe = true }` block is gone
      # entirely, replaced by top-level `gesture = fingers, direction, action`
      # lines. 3-finger horizontal swipe = switch workspace.
      gesture = [ "3, horizontal, workspace" ];

      # -----------------------------------------------------------------
      # Window rules
      # -----------------------------------------------------------------
      windowrule = [
        "float true, pin true, size 25% 25%, move 73% 72%, match:title ^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"
        "workspace special:spotify silent, match:class ^(Spotify|com\\.spotify\\.Client)$"
      ];

      # -----------------------------------------------------------------
      # Noctalia integration: stop Hyprland's own layer-surface animations
      # from fighting with Noctalia's bar/panels/dock/OSD, and blur them.
      # -----------------------------------------------------------------
      layerrule = [
        "no_anim true, match:namespace ^(noctalia-(bar-.+|notification|dock|panel|attached-panel|osd))$"
        "blur true, match:namespace ^(noctalia-(bar-.+|notification|dock|panel|attached-panel|osd))$"
        "ignore_alpha 0.5, match:namespace ^(noctalia-(bar-.+|notification|dock|panel|attached-panel|osd))$"
      ];

      # -----------------------------------------------------------------
      # Keybinds
      # -----------------------------------------------------------------
      bind =
        [
          "$mod, Return, exec, $terminal"
          "$mod, Q, killactive,"
          "$mod SHIFT, E, exit," # was $mod SHIFT Q; E now free for "Exit" -- see $mod+M below
          "$mod, E, exec, $terminal fish -c yazi" # Win+E -> file manager
          "$mod, V, togglefloating,"
          "$mod, R, exec, $menu" # Win+R -> "Run"
          "$mod, P, pseudo,"
          "$mod, J, layoutmsg, togglesplit"
          "$mod, F, fullscreen,"
          "$mod, L, exec, noctalia msg session lock" # Win+L -> lock

          # Ctrl+Alt+Delete -> Noctalia's session menu (logout/reboot/
          # shutdown), the nearest Linux-desktop equivalent of the classic
          # Windows security-screen shortcut.
          "CTRL ALT, Delete, exec, noctalia msg panel-toggle session"

          # Alt+Tab -> Noctalia's Alt-Tab-style window switcher overlay,
          # per docs.noctalia.dev/v5/ipc/shell/#window-switcher.
          "ALT, Tab, exec, noctalia msg window-switcher"

          # Windows puts clipboard history on Win+V, but $mod+V was already
          # "toggle floating" in this config (a very common Hyprland
          # convention) -- so clipboard gets the next-door key instead.
          "$mod SHIFT, V, exec, noctalia msg panel-toggle clipboard"

          # --- Noctalia panels ---------------------------------------
          "$mod, SPACE, exec, noctalia msg panel-toggle launcher"
          "$mod, S, exec, noctalia msg panel-toggle control-center"
          "$mod, comma, exec, noctalia msg settings-toggle"
          "$mod, B, exec, noctalia msg bar-toggle" # B = "Bar"

          # --- Wallpaper ------------------------------------------------
          # W = "Wallpaper" (instant random change); Ctrl+W = "Control
          # Wallpaper" (open the picker menu to choose one deliberately).
          "$mod, W, exec, noctalia msg wallpaper-random"
          "$mod CTRL, W, exec, noctalia msg panel-toggle wallpaper"

          # --- Screenshots ------------------------------------------------
          # Win+Shift+S convention for region capture; bare Print for a
          # full, immediate capture of the focused monitor. Both need
          # wlr-screencopy support, which Hyprland provides natively.
          "$mod SHIFT, S, exec, noctalia msg screenshot-region"
          ", Print, exec, noctalia msg screenshot-fullscreen"

          # --- Spotify ----------------------------------------------------
          # M = "Music". Opens Spotify (via Flatpak) into its own special
          # workspace (a scratchpad-style hidden workspace you can summon
          # over whatever you're doing) if it isn't already running;
          # otherwise just toggles that workspace's visibility. The
          # windowrule above silently assigns new Spotify windows to that
          # special workspace the moment they're created.
          "$mod, M, exec, pgrep -f com.spotify.Client >/dev/null && hyprctl dispatch togglespecialworkspace spotify || flatpak run com.spotify.Client"
        ]
        ++ (
          # $mod + [1-9,0] -> switch workspace; $mod SHIFT + [1-9,0] -> move
          # window to that workspace. i=0..9, wrapping 10 back to "0".
          builtins.concatLists (
            builtins.genList (
              i:
              let
                ws = toString (if i == 9 then 0 else i + 1);
              in
              [
                "$mod, ${ws}, workspace, ${ws}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${ws}"
              ]
            ) 10
          )
        );

      # Mouse-drag bindings for moving/resizing floating windows.
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      # Media keys -> Noctalia OSD, via "bindel" (repeats while held,
      # doesn't require the "l" lockscreen flag since these aren't
      # security-sensitive).
      bindel = [
        ", XF86AudioRaiseVolume, exec, noctalia msg volume-up"
        ", XF86AudioLowerVolume, exec, noctalia msg volume-down"
        ", XF86AudioMute, exec, noctalia msg volume-mute"
        ", XF86MonBrightnessUp, exec, noctalia msg brightness-up"
        ", XF86MonBrightnessDown, exec, noctalia msg brightness-down"
      ];
    };
  };

  # ---------------------------------------------------------------------
  # hypridle -- idle timeouts (lock, then suspend).
  #
  # Worth knowing: Noctalia v5 also ships its *own* idle system
  # ([idle.behavior.*] in its settings, see docs.noctalia.dev/v5/services/idle/),
  # which would double-fire alongside hypridle if you ever enable it too.
  # Its built-in Lock/Monitor-off behaviors ship *disabled* by default, so
  # there's no conflict right now -- just don't turn those on in Noctalia's
  # settings UI later without turning this off (or vice versa).
  # ---------------------------------------------------------------------
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        # Route lock/suspend through Noctalia rather than hyprlock, so you
        # get Noctalia's own lock screen consistently, no matter what
        # triggered the lock (idle timeout, lid close, manual keybind).
        lock_cmd = "noctalia msg session lock";
        before_sleep_cmd = "noctalia msg session lock";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 600; # 10 minutes
          on-timeout = "noctalia msg session lock";
        }
        {
          timeout = 900; # 15 minutes -- already locked by the 10-minute
          # listener above, so this just needs to suspend, not lock again.
          on-timeout = "noctalia msg session suspend";
        }
      ];
    };
  };
}
