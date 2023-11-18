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
          color: #${base01};
          margin-top: 1.75px;
          padding: 3.5px 14px;
        }

        #battery {
          background-color: #${base0B};
        }

        #battery.charging, #battery.plugged {
          background-color: #${base09};
        }

        #battery.warning:not(.charging) {
          background-color: #${base09};
        }

        @keyframes blink {
          to {
              background-color: #${base05};
              color: #${base08};
          }
        }

        #battery.critical:not(.charging) {
          background-color: #${base08};
          color: #${base05};
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
        }

      #clock {
        background-color: #${base00};
        color: #${base05};
      }

      #network {
        background-color: #${base0D};
      }

      #network.disconnected {
        background-color: #${base08};
      }

      #pulseaudio {
        background-color: #${base0A};
      }

      #pulseaudio.muted {
        background-color: #${base0C};
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

