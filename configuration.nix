{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # ── Boot ──────────────────────────────────────────────────────────────────
  boot.loader.systemd-boot.enable      = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages                  = pkgs.linuxPackages_latest;

  # ── Networking ────────────────────────────────────────────────────────────
  networking.hostName               = "nixos-btw";
  networking.networkmanager.enable  = true;

  # ── Locale & Time ─────────────────────────────────────────────────────────
  time.timeZone      = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT    = "en_GB.UTF-8";
    LC_MONETARY       = "en_GB.UTF-8";
    LC_NAME           = "en_GB.UTF-8";
    LC_NUMERIC        = "en_GB.UTF-8";
    LC_PAPER          = "en_GB.UTF-8";
    LC_TELEPHONE      = "en_GB.UTF-8";
    LC_TIME           = "en_GB.UTF-8";
  };

  services.xserver.xkb = {
    layout  = "us";
    variant = "";
  };

  # ── Users ─────────────────────────────────────────────────────────────────
  users.users.yasir = {
    isNormalUser = true;
    description  = "Yasir";
    extraGroups  = [ "networkmanager" "wheel" ];
  };
  users.defaultUserShell = pkgs.fish;

  # ── Niri ──────────────────────────────────────────────────────────────────
  programs.niri.enable = true;   # provided by niri-flake nixosModule

  # ── Display ───────────────────────────────────────────────────────────────
  services.displayManager.ly.enable           = false;
  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.enable                     = true;
  programs.xwayland.enable                    = true;

  # ── XDG Portal ────────────────────────────────────────────────────────────
  xdg.portal = {
    enable       = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # ── Shell & Core Programs ─────────────────────────────────────────────────
  programs.fish.enable    = true;
  programs.firefox.enable = true;

  # ── Bluetooth ─────────────────────────────────────────────────────────────
  hardware.bluetooth.enable      = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable        = true;

  # ── Services ──────────────────────────────────────────────────────────────
  services.power-profiles-daemon.enable = true;
  services.upower.enable                = true;
  services.gvfs.enable                  = true;
  services.tumbler.enable               = true;
  services.dbus.enable                  = true;
  services.flatpak.enable               = true;

  # ── Virtualisation ────────────────────────────────────────────────────────
  virtualisation.virtualbox.host.enable = true;

  # ── Fonts ─────────────────────────────────────────────────────────────────
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    inter
  ];

  # ── System Packages ───────────────────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    fish
    bluez
    bluez-tools
    neovim
    fastfetch
    tmux
    quickshell
    niri
    kitty
    xwayland-satellite
    nerd-fonts.jetbrains-mono
    ntfs3g
    vscodium
    kdePackages.breeze
    nautilus
    dank-material-shell
  ];

  # ── Nix ───────────────────────────────────────────────────────────────────
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";
}
