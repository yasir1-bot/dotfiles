{ pkgs, ... }:

{
  home.username = "yasir";
  home.homeDirectory = "/home/yasir";

  home.stateVersion = "26.05";
  home.file.".config/niri".source = ./config/niri;
  
  programs.fish.enable = true;
  services.mpd.enable = true;

  services.mpd.musicDirectory = "~/Music/Playlist";

  services.mpd.extraConfig = ''
    audio_output {
      type "pipewire"
      name "PipeWire"
  }
'';


  programs.fish = {
    interactiveShellInit = ''
    fastfetch
    set -g fish_greeting
    set -gx EDITOR nvim
    set -gx SUDO_EDITOR $EDITOR
    set -gx VISUAL nvim
    set -gx TERMINAL kitty
    set -gx MANPAGER "nvim +Man!"
  '';
  

  shellAliases = {
    ll = "eza -la";
    n = "nvim";
    rip = "yt-dlp -x --audio-format=\"mp3\"";
    c = "codium .";
  };
};

  home.packages = with pkgs; [
    eza
    mpd
    btop
    mpv
  ];
}
