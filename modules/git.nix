{ config, lib, pkgs, ... }:

{
 programs.git = {
    enable = true;

    userName = "Nova-archx86";
    userEmail = "moorcode66@yahoo.com";

    signing = {
      key = "moorcode66@yahoo.com";
      signByDefault = true;
    };

 };

 programs.git-credential-oauth.enable = true;

}
