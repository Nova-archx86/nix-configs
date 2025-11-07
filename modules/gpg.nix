{ config, lib, pkgs, ... }:

{
  programs.gpg.enable = true;
  programs.gpg.publicKeys = [ { source = /home/nova/moorcode66.gpg; } ];
  services.gpg-agent.enable = true;
  services.gpg-agent.pinentry.package = pkgs.pinentry-gtk2;
}
