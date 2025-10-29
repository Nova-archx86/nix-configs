{ config, lib, pkgs, ... }:

{
  programs.keepassxc = {
    enable = true;
    settings = {
      browser.enable = true;
      GUI = {
        ApplicationTheme = "dark";
        CompactMode = true;
        ShowTrayIcon = true;
        MinimizeToTray = true;
        MinimizeOnClose = true;
      };
    };
  };
}
