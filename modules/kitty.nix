{ config, lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "3024_Night"; # Usually set by kitty +kitten themes
    font.package = pkgs.nerd-fonts._0xproto;
    font.name = "0xProtoNerdFont";
    enableGitIntegration = true;

    settings = {
      background_opacity = 1.0;
    };
    
  };
}
