{ pkgs, ... }:

{
  home.username = "yasir";
  home.homeDirectory = "/home/yasir";

  home.stateVersion = "26.05";
  home.file.".config/niri".source = ./niri;
  
  programs.fish.enable = true;
  programs.mpd.enable = true;
###  programs.git.enable = true;

  programs.git = {
    userEmail = "yasir.ahmed10113@gmail.com";
    userName = "yasir1-bot";
  };

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
    fastfetch
    eza
    niri
    fish
    mpd
  ];
}
