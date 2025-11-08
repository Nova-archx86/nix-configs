{ config, lib, pkgs, ... }:

{
 programs.git = {
    enable = true;

    settings = {
      user.email = "moorcode66@yahoo.com";
      user.name = "Nova-archx86";
    };

    signing = {
      key = "moorcode66@yahoo.com";
      signByDefault = true;
    };

 };

 programs.git-credential-oauth.enable = true;

}
