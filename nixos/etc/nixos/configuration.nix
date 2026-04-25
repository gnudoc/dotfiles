{ config, lib, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix ];

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

  services.xserver.xkb = {
    layout = "gb";
    variant = "dvorak";
    options = "ctrl:swapcaps,compose:ralt";
  };
  services.libinput.enable = true;

  security.rtkit.enable = true;
  security.polkit.enable = true;
  security.pam.services.swaylock = {};

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  users.users.nij = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  #programs.nm-applet.enable = true; # put it in systemPackages for now
  programs.starship.enable = true;
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # fix some theming issues in sway
  };
  programs.nano = {
    enable = true;
    syntaxHighlight = true;
  };
  programs.dconf.enable = true; # let sway/gtk apps store settings

  environment.systemPackages = with pkgs; [
    vim
    emacs
    networkmanagerapplet
    git
    wget
    btop
    waybar
    rofi
    foot
    imv
    qutebrowser
    keychain
    grim
    slurp
    wl-clipboard
    swaylock
    swayidle
    brightnessctl
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  services.openssh.enable = true;
  services.displayManager.ly.enable = true;

  # in arch, this is a sway config exec line and an installed package
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  system.stateVersion = "25.11"; # DON'T CHANGE THIS!

}

