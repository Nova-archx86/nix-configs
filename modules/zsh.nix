{ config, lib, pkgs, ... }:

{
   programs.zsh = {
    enable = true;

    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    
    initContent = ''
      export PATH=/home/nova/.config/emacs/bin/:$PATH
      eval "$(starship init zsh)"
    '';
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --impure --flake /home/nova/nixos-config/";
      bdupdate = "betterdiscordctl -f canary install";
      py-dev = "nix develop /home/nova/nixos-config/dev/#python";
      c-dev = "nix develop /home/nova/nixos-config/dev/#default";
      zigc-dev = "nix develop /home/nova/nixos-config/dev/#zigc";
    };
  };

}
