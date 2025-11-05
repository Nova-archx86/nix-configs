{ config, lib, pkgs, ... }:

{
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [exts.pass-import]);
    settings = {
      PASSWORD_STORE_DIR = "/home/nova/.password-store";
    };
  };
}
