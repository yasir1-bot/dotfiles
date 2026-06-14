{ pkgs, inputs, ... }:

{
  imports = [
    ./config/niri/home.nix       # niri window manager config
  ];

  home.username    = "yasir";
  home.homeDirectory = "/home/yasir";
  home.stateVersion  = "26.05";

  # ── Packages ──────────────────────────────────────────────────────────────
  home.packages = with pkgs; [
    flatpak
    mpv
    mpd
    ani-cli
    cava
    btop
    cmatrix
    cbonsai
    tty-clock
    pywal16
    pywalfox-native
    musikcube
    gnome-boxes
    gnome-tweaks
    virtualbox
    linuxKernel.packages.linux_5_10.virtualbox
    xwayland-satellite
    eza
    pokemon-colorscripts
  ];

  # ── Fish Shell ────────────────────────────────────────────────────────────
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      fastfetch
      set -g fish_greeting
      set -gx EDITOR nvim
      set -gx SUDO_EDITOR nvim
      set -gx VISUAL nvim
      set -gx TERMINAL kitty
      set -gx MANPAGER "nvim +Man!"
    '';
    shellAliases = {
      ll  = "eza -la";
      n   = "nvim";
      rip = ''yt-dlp -x --audio-format="mp3"'';
      c   = "codium .";
    };
  };

  # ── MPD ───────────────────────────────────────────────────────────────────
  services.mpd = {
    enable         = true;
    musicDirectory = "~/Music/Playlist";
    extraConfig    = ''
      audio_output {
        type "pipewire"
        name "PipeWire"
      }
    '';
  };
}
