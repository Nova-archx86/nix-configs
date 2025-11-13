{ config, pkgs, ... }:

{
  imports = [
    ../../modules/git.nix
    ../../modules/gh.nix
    ../../modules/zsh.nix
    ../../modules/gpg.nix
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
    ../../modules/firefox.nix
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
      man
      gcc
      gnumake
    ];
  };
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        "lt-caesium" = { id = "2HSEPQR-MHW6MFW-VPPYBOO-66ALYGF-4FIIQC4-VCRHBAZ-Q5EXSHL-BEUHVQG"; };
      };
      folders = {
        "Org" = { path = "/home/nova/Sync/org/"; devices = [ "lt-caesium" ]; };
        "Pictures" = { path = "/home/nova/Pictures/"; devices = [ "lt-caesium" ]; };
        "Pass" = {path = "/home/nova/.password-store/"; devices = [ "lt-caesium" ]; };
      };
    };
  }; 

  
}
