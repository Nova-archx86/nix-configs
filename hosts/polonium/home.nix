{ config, pkgs, ... }:

{
  imports = [
    ../../modules/git.nix
    ../../modules/gh.nix
    ../../modules/zsh.nix
    ../../modules/gpg.nix
    ../../modules/syncthing.nix
    ../../modules/hyprland.nix
    ../../modules/waybar.nix
    ../../modules/kitty.nix
    ../../modules/mako.nix
    ../../modules/wofi.nix
    ../../modules/mu.nix
    #../../modules/mail.nix
    ../../modules/gtk.nix
    ../../modules/starship.nix
    ../../modules/pass.nix
    ../../modules/yt-dlp.nix
  ];

  home = {
    username = "nova";
    homeDirectory = "/home/nova";
    stateVersion = "18.09";

    pointerCursor.hyprcursor.enable = true;
    #pointerCursor.x11.enable = true;
    pointerCursor.name = "Nordzy-hyprcursors-catppuccin-frappe-blue";
    pointerCursor.package = pkgs.nordzy-cursor-theme;

    packages = with pkgs; [
      zsh
      starship
      bat
      lsd
      spotify
      discord-canary
      telegram-desktop
      betterdiscordctl
      gh
      pika-backup
      keepassxc
      syncthing
      emacs
      gh-markdown-preview
      graphviz
      sbclPackages.simple-inferiors
      hyprpaper
      #librewolf
      firefox
      waybar
      wireplumber
      xdg-desktop-portal
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
      wofi
      shellcheck
      fastfetch
      hyprshot
      mu
      pavucontrol
      isync
      hyprland-workspaces
      clang-tools
      nixfmt
      bluez
      bluez-tools
      mupdf
      wl-clipboard
      gzdoom
      virt-manager
    ];
  };
  
}
