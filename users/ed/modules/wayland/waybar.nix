{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 7;
        modules-center = [
          "clock"
        ];
        clock.format = "{:%H:%M %d %B %Y}";
        modules-right = [
          "pulseaudio"
          "network"
          "battery"
        ];
        battery = {
          states = {
            warning = 30;
            critical = 10;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󰂄";
          format-plugged = "{capacity}% 󰂄";
          format-icons = [
            "󰁻"
            "󰁽"
            "󰁿"
            "󰂁"
            "󰁹"
          ];
        };
        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
        };
        pulseaudio = {
          format = "{volume}% {icon}";
          format-icons = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
        };
      };
    };
    style = with config.colorScheme.colors; ''
        * {
          font-family: "Symbols Nerd Font", "IBM Plex Sans";
          font-size: 14px;
        }

        window#waybar {
          background-color: transparent;
        }

        #battery,
        #clock,
        #network,
        #pulseaudio {
          border-radius: 7px;
          color: alpha(#${base01}, 0.8);
          margin-top: 1.75px;
          padding: 3.5px 14px;
        }

        #battery {
          background-color: alpha(#${base0B}, 0.8);
        }

        #battery.charging, #battery.plugged {
          background-color: alpha(#${base09}, 0.8);
        }

        #battery.warning:not(.charging) {
          background-color: alpha(#${base09}, 0.8);
        }

        @keyframes blink {
          to {
              background-color: alpha(#${base05}, 0.8);
              color: alpha(#${base08}, 0.8);
          }
        }

        #battery.critical:not(.charging) {
          background-color: alpha(#${base08}, 0.8);
          color: alpha(#${base05}, 0.8);
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
        }

      #clock {
        background-color: alpha(#${base00}, 0.8);
        color: alpha(#${base05}, 0.8);
      }

      #network {
        background-color: alpha(#${base0D}, 0.8);
      }

      #network.disconnected {
        background-color: alpha(#${base08}, 0.8);
      }

      #pulseaudio {
        background-color: alpha(#${base0A}, 0.8);
      }

      #pulseaudio.muted {
        background-color: alpha(#${base0C}, 0.8);
      }
    '';
  };
}
# base00: "1e1e2e" # base
# base01: "181825" # mantle
# base02: "313244" # surface0
# base03: "45475a" # surface1
# base04: "585b70" # surface2
# base05: "cdd6f4" # text
# base06: "f5e0dc" # rosewater
# base07: "b4befe" # lavender
# base08: "f38ba8" # red
# base09: "fab387" # peach
# base0A: "f9e2af" # yellow
# base0B: "a6e3a1" # green
# base0C: "94e2d5" # teal
# base0D: "89b4fa" # blue
# base0E: "cba6f7" # mauve
# base0F: "f2cdcd" # flamingo

