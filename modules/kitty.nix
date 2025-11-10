{ config, lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "Nord";
    font.package = pkgs.nerd-fonts._0xproto;
    font.name = "0xProtoNerdFont";
    enableGitIntegration = true;

    settings = {
      background_opacity = 0.9;
    };
    
  };
}
