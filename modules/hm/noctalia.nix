# ---------------------------------------------------------------------------
# Noctalia shell (Home Manager).
#
# Noctalia isn't in nixpkgs yet, so it's brought in as its own flake input
# (see flake.nix) and reached here via `inputs`, which is available in
# every home-manager module because flake.nix sets
# `home-manager.extraSpecialArgs = { inherit inputs; };`.
#
# Startup method: Noctalia's own systemd --user service, NOT a Hyprland
# exec-once. Noctalia's FAQ explicitly warns that running it from more than
# one startup method at once (compositor autostart + systemd, etc.) causes
# duplicate instances that fight over layout space -- so pick exactly one.
# We picked systemd because it also gets you automatic restart-on-crash.
#
# One thing worth verifying once this is running: Home Manager systemd
# --user services typically activate via `graphical-session.target`, which
# fires for *any* compositor session -- GNOME included, since we kept
# modules/gnome.nix around as a fallback. If you notice Noctalia's bar
# fighting with GNOME's shell when you log into GNOME, check
# `systemctl --user status noctalia` there and gate/disable it for that
# session (e.g. via an `ExecCondition`/environment check on `$XDG_CURRENT_DESKTOP`).
# ---------------------------------------------------------------------------
{ inputs, ... }:

{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;

    systemd.enable = true;

    settings = {
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
      };

      wallpaper = {
        enabled = true;
        # Point this at a real wallpaper once you've got one -- e.g. copy
        # it into the repo and reference it with `home.file`, so the whole
        # setup (wallpaper included) stays reproducible from one `git clone`.
        default.path = "/home/yasir/Pictures/Wallpapers/den.jpg";
      };

      shell = {
        # Recommended whenever programs.noctalia.systemd.enable = true:
        # apps launched from the launcher/dock/taskbar run as their own
        # transient systemd scopes, so they survive a Noctalia restart
        # instead of getting killed alongside it.
        launch_apps_as_systemd_services = true;

        # Noctalia can register itself as the system's polkit auth agent,
        # which covers the same job a separate polkit-gnome/polkit-kde
        # exec-once would otherwise do. Only one polkit agent should be
        # active at a time -- since GNOME (modules/gnome.nix) already runs
        # its own when you log into the GNOME session, this only takes
        # effect while Noctalia/Hyprland is the active session.
        polkit_agent = true;
      };
    };
  };
}
