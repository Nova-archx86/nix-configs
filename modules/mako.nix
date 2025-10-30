{ config, lib, pkgs, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      actions = true;
      default-timeout = 5000;
      ignore-timeout = true;
      background-color = "#3b4252";
      border-color = "#5e81ac";
    };
  };
}
