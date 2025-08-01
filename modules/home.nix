{ pkgs, ... }: {
  home-manager.users.xdenotte = {
    home.stateVersion = "25.05";

    home.packages = with pkgs; [
      papirus-icon-theme
      pkgs.kdePackages.breeze
      pkgs.qt6Packages.qtstyleplugin-kvantum
      pkgs.qt6ct
      bibata-cursors
    ];

    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
      iconTheme = {
        name = "Papirus";
        package = pkgs.papirus-icon-theme;
      };
    };

    qt = {
      enable = true;
      platformTheme.name = "qt6ct";
      style = {
        name = "Breeze";
        package = pkgs.kdePackages.breeze;
      };
    };

    xdg.enable = true;

    xdg.desktopEntries.spotify = {
      name = "Spotify";
      genericName = "Music Player";
      comment = "Listen to music";
      exec = "env GTK_THEME=Adwaita:dark spotify --force-device-scale-factor=1.25";
      icon = "spotify";
      terminal = false;
      type = "Application";
      categories = [ "Audio" "Music" "Player" "AudioVideo" ];
    };

    home.sessionVariables = {
      GTK_THEME = "Adwaita-dark";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      QT_STYLE_OVERRIDE = "Breeze";
      XCURSOR_THEME = "Bibata-Modern-Classic";
    };
  };
}
