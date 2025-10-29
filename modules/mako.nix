{ config, lib, pkgs, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      actions = true;
      default-timeout = 15000;
      ignore-timeout = false;
      background-color = "#3b4252";
      border-color = "#5e81ac";
    };
  };
}
