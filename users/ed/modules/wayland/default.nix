{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./sway.nix
    ./waybar.nix
    ./rofi/default.nix
    ./mako.nix
    ./kanshi.nix
    ./swaylock.nix
  ];
}