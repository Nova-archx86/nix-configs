{ config, lib, pkgs, ... }:

{
  services.syncthing = {
    enable = true;
    tray.enable = false; # broken

    settings = { gui.theme = "black"; };

    overrideDevices = true;
    overrideFolders = true;
  };
}
