{ pkgs, ... }: {
  home-manager.users.xdenotte = {
    home.stateVersion = "25.05";

    home.packages = with pkgs; [
      papirus-icon-theme
      pkgs.kdePackages.breeze
      pkgs.qt6Packages.qtstyleplugin-kvantum
      pkgs.qt6ct
    ];

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

    home.sessionVariables = {
      GTK_THEME = "Adwaita-dark";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      QT_STYLE_OVERRIDE = "Breeze";
      XCURSOR_THEME = "Papirus";
    };
  };
}
