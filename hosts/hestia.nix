
{ config, pkgs, ... }: {
  imports = [ ./../modules/system.nix ];
  ./../hosts/hardware-configuration.nix

  networking.hostName = "hestia";

  users.users.xdenotte = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" ];
  };

  system.stateVersion = "25.05";
}
