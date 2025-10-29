{ config, lib, pkgs, ... }:

{
  programs.mbsync.enable = true;
  programs.mbsync.package = pkgs.isync;

  services.mbsync = {
    enable = true;
    package = pkgs.isync;
  };

}
