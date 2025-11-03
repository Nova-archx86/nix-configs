{ config, lib, pkgs, ... }:

{
   programs.zsh = {
    enable = true;

    syntaxHighlighting.enable = true;
    enableCompletion = true;
    initContent = ''
      export PATH=/home/nova/.config/emacs/bin/:$PATH
      eval "$(starship init zsh)"
    '';
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --impure --flake /home/nova/nix-configs/";
      bdupdate = "betterdiscordctl -f canary install";
    };
  };

}
