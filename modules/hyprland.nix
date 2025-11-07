{ config, lib, pkgs, ... }:

let
  terminal = "kitty";
  fileManager = "pcmanfm";
  menu = "wofi --show run";
  screenshot = "hyprshot --mode region --output-folder /tmp";
  lock = "hyprlock";
  emacs = "emacsclient -c";
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/nixos-config/wallpapers/nord-mountains.png" ];
      wallpaper = [ "DP-1,~/nixos-config/wallpapers/nord-mountains.png" "LVDS-1,~/nixos-config/wallpapers/nord-mountains.png" ];
    };
  };

  services.hypridle.enable = true;
  programs.hyprlock.enable = true;
   
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {

      # startup apps
      exec-once = [ "keepassxc" ];
      monitor = "DP-1,1920x1080@180.06,0x0,1";

      animations = {
          enabled = true;
      };

      general = {
          gaps_in = "5";
          gaps_out = "10";
          border_size = "3";

          "col.active_border" = "rgb(4c566a)";
          "col.inactive_border" = "rgb(4c566a)";

          resize_on_border = true;

          layout = "dwindle";

          allow_tearing = false;
      };

      decoration = {
          rounding = "8";

          active_opacity = "1.0";
          inactive_opacity = "1.0";
          blur = {
            enabled = true;
            size = 8;
            passes = 1;
            new_optimizations = true;
          };

          "shadow:enabled" = true;
          "shadow:range" = 2;
          "shadow:render_power" = 5;
          "shadow:sharp" = false;
          "shadow:color" = "rgba(0,0,0,0.85)";
          "shadow:ignore_window" = true;
          "shadow:offset" = "2 2";
          "shadow:scale" = 1;
      };

      dwindle = {
          pseudotile = true;
          preserve_split = true;
      };

      master = {
          new_status = "master";
      };

      misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
      };


      "$mainMod" = "ALT";

      bind = [
        "$mainMod, Return, exec, ${terminal}"
        "$mainMod, Q, killactive,"
        "$mainMod SHIFT, S, exec, ${screenshot}"
        "$mainMod, E, exec, ${fileManager}"
        "$mainMod, F, fullscreen"
        "$mainMod, D, exec, ${menu}"
        "$mainMod, L, exec, ${lock}"
        "$mainMod SHIFT, e, exec, ${emacs}"
        "$mainMod SHIFT, c, exec, hyprctl dispatch exit"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      # Fix dragging issues with XWayland
      windowrulev2 = [
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        #"forcergbx, class:^(Emacs)$"
        "float, class: ^(org.keepassxc.KeePassXC)$"
        "float, class: ^(steam)$"
        "float, class: ^(discord)$"
        "float, class: ^(org.telegram.desktop)$"
        "float, class: ^(pcmanfm)$"
        "float, class: ^(VirtualBox)$"
        "float, class: ^(.virt-manager-wrapped)$"
        #"opacity 0.85 override 0.85 override, class: ^(Emacs)$"
      ];
    };
  };
}
