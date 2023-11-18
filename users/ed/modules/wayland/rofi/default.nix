{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    pass.enable = true;
    theme = "catppuccin-mocha";
    terminal = "alacritty";
    font = "IBM Plex Mono";
    extraConfig = {
      modi = "run,drun,window";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
    };
  };
}
