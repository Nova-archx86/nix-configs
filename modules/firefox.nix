{ config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = with pkgs; [ passff-host ];
  };
}
