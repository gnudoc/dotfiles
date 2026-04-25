# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "sure";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "ter-v18n";
    packages = with pkgs; [ terminus_font ];
    useXkbConfig = true;
  };

  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "gb";
    variant = "dvorak";
    options = "ctrl:swapcaps,compose:ralt";
  };
  services.libinput.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  users.users.nij = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # fix some theming issues in sway
  };
  programs.dconf.enable = true; # let sway/gtk apps store settings

  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim
    nano
    emacs
    git
    wget
    btop
    waybar
    rofi
    foot
    imv
    qutebrowser
  ];

  # List services that you want to enable:
  services.openssh.enable = true;

  system.stateVersion = "25.11"; # DON'T CHANGE THIS!

}

