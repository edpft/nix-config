{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  programs.swaylock = {
    enable = true;
    settings = {
      color = "${colorScheme.colours.base00}";
    };
  };
}
