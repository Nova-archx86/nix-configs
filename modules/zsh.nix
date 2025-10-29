{ config, lib, pkgs, ... }:

{
   programs.zsh = {
    enable = true;

    syntaxHighlighting.enable = true;
    enableCompletion = true;
    initContent = ''
      export PROMPT="%F{cyan} %3~%f"$'\n'" λ "
      export PATH=/home/nova/.config/emacs/bin/:$PATH
    '';
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --impure --flake /home/nova/dotfiles/";
      bdupdate = "betterdiscordctl -f canary install";
    };
  };

}
