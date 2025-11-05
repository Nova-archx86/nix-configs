{ config, lib, pkgs, ... }:
let
  email = "moorcode66@yahoo.com";
  maildir = "/home/nova/.mail";
in
{
  programs.mbsync.enable = true;
  programs.mbsync.package = pkgs.isync;
  accounts.email = {
    accounts = {
      maildirBasePath = "${maildir}";
      yahoo = {
        userName = "${email}";
        flavor = "yahoo.com";
        passwordCommand = "${pkgs.pass}/bin/pass Email/Yahoo";
        primary = true;
        mbsync = {
          enable = true;
          create = "both";
          expunge = "both";
          msmtp.enable = true;
        };
      };
    };
    
  };

  services.mbsync = {
    enable = true;
    package = pkgs.isync;
  };

}
