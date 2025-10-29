{ config, lib, pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };

    cursorTheme = {
      name = "Nordzy-catppuccin-frappe-blue";
      package = pkgs.nordzy-cursor-theme;
    };

    iconTheme = {
      name = "Nordzy";
      package = pkgs.nordzy-icon-theme;
    };

  };
}
