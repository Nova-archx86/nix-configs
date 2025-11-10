{ config, lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''

      * {
          font-size:15px;
          font-family: "CodeNewRoman Nerd Font Propo";
      }
      window#waybar{
          all:unset;
      }
      .modules-left {
          padding:7px;
          margin:10 0 5 10;
          border-radius:10px;
          background: alpha(@background,.6);
          box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
      }
      .modules-center {
          padding:7px;
          margin:10 0 5 0;
          border-radius:10px;
          background: alpha(@background,.6);
          box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
      }
      .modules-right {
          padding:7px;
          margin: 10 10 5 0;
          border-radius:10px;
          background: alpha(@background,.6);
          box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
      }
      tooltip {
          background:@background;
          color: @color7;
      }
      #clock:hover, #custom-pacman:hover, #custom-notification:hover,#bluetooth:hover,#network:hover,#battery:hover, #cpu:hover,#memory:hover,#temperature:hover{
          transition: all .3s ease;
          color:@color9;
      }
      #custom-notification {
          padding: 0px 5px;
          transition: all .3s ease;
          color:@color7;
      }
      #clock{
          padding: 0px 5px;
          color:@color7;
          transition: all .3s ease;
      }
      #custom-pacman{
          padding: 0px 5px;
          transition: all .3s ease;
          color:@color7;

      }
      #workspaces {
          padding: 0px 5px;
      }
      #workspaces button {
          all:unset;
          padding: 0px 5px;
          color: alpha(@color9,.4);
          transition: all .2s ease;
      }
      #workspaces button:hover {
          color:rgba(0,0,0,0);
          border: none;
          text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
          transition: all 1s ease;
      }
      #workspaces button.active {
          color: @color9;
          border: none;
          text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
      }
      #workspaces button.empty {
          color: rgba(0,0,0,0);
          border: none;
          text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .2);
      }
      #workspaces button.empty:hover {
          color: rgba(0,0,0,0);
          border: none;
          text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
          transition: all 1s ease;
      }
      #workspaces button.empty.active {
          color: @color9;
          border: none;
          text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
      }
      #bluetooth{
          padding: 0px 5px;
          transition: all .3s ease;
          color:@color7;

      }
      #network{
          padding: 0px 5px;
          transition: all .3s ease;
          color:@color7;

      }
      #battery{
          padding: 0px 5px;
          transition: all .3s ease;
          color:@color7;


      }
      #battery.charging {
          color: #26A65B;
      }

      #battery.warning:not(.charging) {
          color: #ffbe61;
      }

      #battery.critical:not(.charging) {
          color: #f53c3c;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }
      #group-expand{
          padding: 0px 5px;
          transition: all .3s ease; 
      }
      #custom-expand{
          padding: 0px 5px;
          color:alpha(@foreground,.2);
          text-shadow: 0px 0px 2px rgba(0, 0, 0, .7);
          transition: all .3s ease; 
      }
      #custom-expand:hover{
          color:rgba(255,255,255,.2);
          text-shadow: 0px 0px 2px rgba(255, 255, 255, .5);
      }
      #custom-colorpicker{
          padding: 0px 5px;
      }
      #cpu,#memory,#temperature{
          padding: 0px 5px;
          transition: all .3s ease; 
          color:@color7;

      }
      #custom-endpoint{
          color:transparent;
          text-shadow: 0px 0px 1.5px rgba(0, 0, 0, 1);

      }
      #tray{
          padding: 0px 5px;
          transition: all .3s ease; 

      }
      #tray menu * {
          padding: 0px 5px;
          transition: all .3s ease; 
      }

      #tray menu separator {
          padding: 0px 5px;
          transition: all .3s ease; 
      }
    '';
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [ "clock" "idle_inhibitor" ];
        modules-center = [ "hyprland/workspaces"];
        modules-right = [ "battery" "backlight" "pulseaudio" "network" "tray" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            "1" = "";
            "2" = "󰖟";
            "3" = "󰭹";
            "4" = "";
            "5" = "󰮂";
          };
          sort-by-number = true;
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          tooltip = true;
        };

        "tray" = { spacing = 5; };

        "clock" = {
          format = "  {:%H:%M    %e %b}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          today-format = "<b>{}</b>";
        };

        "network" = {
          format-wifi = " {essid}";
          format-ethernet = " {ipaddr}/{cidr}";
          format-linked = " {ifname}: (No IP)";
          format-disconnected = "{ifname}: ";
          family = "ipv4";
        };

        "pulseaudio" = {
          scroll-step = 3;
          format = "{icon} {volume}% {format_source}";
          format-muted = "";
          format-source = "";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };

        "battery" = {
          interval = 2;
          format = "{icon} %{capacity}";
          format-icons = [ "󰂃" "󰁿" "󱧥" ];
          format-charging = "󰂄 %{capacity}";
        };

        "backlight" = {
          device = "intel_backlight";
          interval = 2;
          format = "{icon} %{percent}";
          format-icons = [ "󰃞 " "󰃝 " "󰃠 "];
        };
        
      };
    };
  };
}

    
