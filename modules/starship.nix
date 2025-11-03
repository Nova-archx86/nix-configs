{ config, lib, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {

      add_newline = true;

      character = {
        success_symbol = "[λ](bold blue)";
        error_symbol = "[ ](bold red)";
      };

      directory = {
        truncation_length = 2;
        truncate_to_repo = true;
        read_only = " ";
      };

      nix_shell = {
        symbol = " ";
        style = "bold blue";
      };
      
    };
    
  };
}
