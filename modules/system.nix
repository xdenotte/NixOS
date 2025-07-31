
{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver.enable = false;
  hardware.opengl.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = true;
    nvidiaSettings = true;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  networking.networkmanager.enable = true;
  services.timesyncd.enable = true;

  services.displayManager.ly = {
    enable = true;
    settings.default_session = {
      user = "xdenotte";
    };
  };

  environment.systemPackages = with pkgs; [
    chromium
    discord
    steam
    niri
    quickshell
    networkmanagerapplet
    kdePackages.kate

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    corefonts
    dejavu_fonts
  ];

  programs.niri.enable = true;
}
