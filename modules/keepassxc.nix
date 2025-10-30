{ config, lib, pkgs, ... }:

{
  programs.keepassxc = {
    enable = true;
    settings = {
      Browser.Enabled = true;
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
