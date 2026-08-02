{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
      nitch
      starship init fish | source
    '';

    shellAliases = {
    n = "nvim";
    update = "sudo nixos-rebuild switch --flake /home/yasir/dotfiles#nixos-btw --show-trace";
    cleanup = "sudo nix-collect-garbage -d";
   };

  };
}
