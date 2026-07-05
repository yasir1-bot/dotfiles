{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting

      nitch
    '';

    shellAliases = {
    n = "nvim";
    nrs = "sudo nixos-rebuild switch --flake /home/yasir/dotfiles/#nixos-btw --show-trace";
   };

  };
}
