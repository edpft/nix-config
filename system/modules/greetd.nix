{
  lib,
  pkgs,
  config,
  default,
  ...
}: let
  greetdSwayConfig = pkgs.writeText "greetd-sway-config" ''
    exec "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP"

    bindsym Mod4+shift+e exec swaynag \
    -t warning \
    -m 'What do you want to do?' \
    -b 'Poweroff' 'systemctl poweroff' \
    -b 'Reboot' 'systemctl reboot'

    exec "${lib.getExe config.programs.regreet.package} -l debug; swaymsg exit";
  '';
in {
  programs.regreet = {
    enable = true;
    settings = {
      background = {
        path = "/etc/darkest_hour_1920_1080.jpg";
        fit = "Cover";
      };
      GTK = {
        font_name = "IBM Plex Sans";
        application_prefer_dark_theme = true;
        theme_name = "Catppuccin-Macchiato-Compact-Lavendar-Dark";
        cursor_theme_name = "Catppuccin-Macchiato-Dark-Cursors";
      };
    };
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.getExe pkgs.sway} --config ${greetdSwayConfig}";
      };
    };
  };

  services.xserver.displayManager.sessionPackages = [
    pkgs.sway
  ];

  environment.systemPackages = with pkgs; [
    (catppuccin-gtk.override
      {
        accents = ["lavender"];
        size = "compact";
        tweaks = ["rimless" "black"]; # You can also specify multiple tweaks here
        variant = "macchiato";
      })
    catppuccin-cursors.macchiatoDark
  ];
}
