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
    ../../modules/mbsync.nix
    ../../modules/gtk.nix
    ../../modules/keepassxc.nix
  ];

  home.username = "nova";
  home.homeDirectory = "/home/nova";
  home.stateVersion = "18.09";

  home.packages = with pkgs; [
    zsh
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
    librewolf
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
    #steam
  ];
 # bar

}
