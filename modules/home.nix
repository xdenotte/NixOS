{ pkgs, ... }: {
  home-manager.users.xdenotte = {
    home.homeDirectory = "/home/xdenotte";
    home.stateVersion = "25.05";

    home.packages = with pkgs; [
      papirus-icon-theme
      colloid-gtk-theme
      pkgs.kdePackages.breeze
      pkgs.qt6Packages.qtstyleplugin-kvantum
      pkgs.qt6ct
      bibata-cursors
    ];

    xdg.desktopEntries.spotify = {
      name = "Spotify";
      genericName = "Music Player";
      comment = "Listen to music";
      exec = "spotify --force-device-scale-factor=1.25";
      icon = "spotify";
      terminal = false;
      type = "Application";
      categories = [ "Audio" "Music" "Player" "AudioVideo" ];
    };
  };
}
