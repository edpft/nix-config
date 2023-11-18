{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.sway = with pkgs; {
    enable = true;
    config = rec {
      bars = [
        {
          command = "${waybar}/bin/waybar";
        }
      ];
      fonts = {
        names = ["Fira" "Fira Mono"];
        size = 12.0;
      };
      gaps = {
        inner = 10;
        outer = 10;
      };
      input = {
        "*" = {
          xkb_layout = "gb";
        };
      };
      keybindings = {
        "${modifier}+B" = "exec ${firefox-devedition-unwrapped}/bin/firefox";
        "${modifier}+E" = "exec ${vscode}/bin/code";
        "${modifier}+L" = "exec ${swaylock}/bin/swaylock";
        "${modifier}+D" = "exec ${rofi}/bin/rofi -show run,drun,window";
      };
      menu = "${rofi}/bin/rofi -show run,drun,window";
      modifier = "Mod4";
      output = {
        "*" = {
          bg = "/etc/darkest_hour_1920_1080.jpg fill";
        };
      };
      startup = [
        {
          command = "${firefox-devedition-unwrapped}/bin/firefox";
        }
        {
          command = "${vscode}/bin/code";
        }
      ];
      terminal = "alacritty";
      window = {
        titlebar = false;
        commands = [
          {
            command = "opacity 0.8";
            criteria = {
              workspace = ".*";
            };
          }
        ];
      };
    };
  };
}
