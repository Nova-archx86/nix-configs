{ config, lib, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {

      add_newline = false;

      format = [
        "$git_status"
        "$character"
      ];

      character = {
        success_symbol = "[λ](bold blue)";
        error_symbol = "[ ](bold red)";
      };

    };
    
  };
}
