{ config, lib, pkgs, inputs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix # requires --impure to be passed
      inputs.home-manager.nixosModules.default
    ];

  networking.hostName = "lt-caesium"; # Define your hostname.
  networking.wireless.iwd.enable = true;

  nix.settings.experimental-features = [ "nix-command"  "flakes" ];

  security.polkit.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
    font-awesome
  ];

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-tty;
  };
  
  programs.zsh.enable = true;

  # bar
  programs.waybar.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nova = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "nova";
    extraGroups = [ "networkmanager" "wheel" "syncthing" "storage" "video" "optical" ];
    packages = with pkgs; [];
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.nova = import ./home.nix;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  hardware = {
    graphics.enable = true;
  };

  # Hint to electron to use wayland over xwayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    vim
    git
    libnotify
    kitty
    mako
    wofi
    pcmanfm
    iwd
    ripgrep
    fd
    cmake
    gnumake
    gcc
    libvterm
    libtool
    brightnessctl
    nh
    gvfs
    gnupg
    pinentry-tty
    nodejs
    man-db
  ];
  
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; 

  security.rtkit.enable = true;
  programs.hyprland = { enable = true; xwayland.enable = true; };

  services = {
    openssh.enable = false;
    printing.enable = true;
    hypridle.enable = true;
    gvfs.enable = true;

    xserver.xkb = { layout = "us"; variant = ""; };

    emacs = {
      enable = true;
      package = pkgs.emacs;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  # Clean up old pkgs automatically
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
  system.stateVersion = "24.11";
 
}
