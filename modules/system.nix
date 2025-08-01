
{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nixpkgs.config.allowUnfree = true;
  services.xserver.enable = false;
  services.xserver.videoDrivers = ["nvidia"];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = true;
    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 5d";
  };

  systemd = {
  user.services.polkit-gnome-authentication-agent-1 = {
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
  };
  
  # Audio and Some settings
  services.pulseaudio.enable = false;
  services.upower.enable = true;
  security.polkit.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    extraConfig = {
      pipewire = {
       "bullshit-sound" = {
         "context.properties" = {
           "default.clock.min-quantum" = 1024;
         };
       };
      };
    };
  };

  environment.sessionVariables = {
    QML_IMPORT_PATH = "${pkgs.qt6.qt5compat}/lib/qt-6/qml:${pkgs.qt6.qtdeclarative}/lib/qt-6/qml";
  };

  xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config = {
        common = {
          default = ["gtk"]; "org.freedesktop.impl.portal.ScreenCast" = "gnome";
        };
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
    };

  networking.networkmanager.enable = true;
  services.timesyncd.enable = true;

  services.displayManager.ly.enable = true;
  xdg.icons.enable = true;

  environment.systemPackages = with pkgs; [
    git
    chromium
    discord
    vesktop
    steam
    niri
    networkmanagerapplet
    kdePackages.kate
    fastfetch
    kitty
    xwayland-satellite
    brightnessctl
    nemo
    xdg-desktop-portal-gnome
    papirus-icon-theme
    bibata-cursors
    gnome-themes-extra
    nwg-look
    pavucontrol
    qt6ct
    material-symbols
    material-icons
    swww
    wallust
    cava
    xdg-user-dirs
    qt6Packages.qt5compat
    loupe
    libsForQt5.qt5.qtgraphicaleffects
    kdePackages.qtbase
    kdePackages.qtdeclarative
    kdePackages.qtstyleplugin-kvantum
    polkit_gnome
    hypridle
    upower
    heroic
    prismlauncher
    spotify
    power-profiles-daemon
    mangohud
    htop
    windsurf
    mpv

    font-manager
    fira
    noto-fonts
    corefonts
    noto-fonts-cjk-sans
    google-fonts
    lilex
    noto-fonts-emoji
    liberation_ttf
    corefonts
    dejavu_fonts
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    lshw
  ];

  programs.niri.enable = true;
  programs.gamemode.enable = true;
}
