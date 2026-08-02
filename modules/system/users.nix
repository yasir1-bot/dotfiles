{ pkgs, ... }:

{
  users.users.yasir = {
    isNormalUser = true;
    description = "yasir";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };
}
