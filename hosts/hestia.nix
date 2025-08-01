{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./../modules/system.nix
    ./../modules/home.nix
  ];

  networking.hostName = "hestia";
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.plymouth.enable = true;
  boot.plymouth.theme = "bgrt";
  boot.plymouth.themePackages = [ pkgs.plymouth ];

  boot.initrd.systemd.enable = true;

  users.users.xdenotte = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" ];
    packages = with pkgs; [ home-manager ];
  };

  i18n.defaultLocale = "ru_RU.UTF-8";
  time.timeZone = "Europe/Berlin";

  system.stateVersion = "25.05";
}
