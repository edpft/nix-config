{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.swaylock = let
    colors = inputs.nix-colors.colorSchemes.catppuccin-mocha.colors;
  in {
    enable = true;
    settings = {
      bs-hl-color = "${colors.base08}cc";
      image = "/etc/darkest_hour_1920_1080.jpg";
      inside-clear-color = "${colors.base09}99";
      inside-color = "${colors.base00}99";
      inside-ver-color = "${colors.base0D}99";
      inside-wrong-color = "${colors.base08}99";
      key-hl-color = "${colors.base0B}cc";
      line-clear-color = "${colors.base09}";
      line-color = "${colors.base02}";
      line-ver-color = "${colors.base0D}";
      line-wrong-color = "${colors.base08}";
      ring-clear-color = "${colors.base09}cc";
      ring-color = "${colors.base00}cc";
      ring-ver-color = "${colors.base0D}cc";
      ring-wrong-color = "${colors.base08}cc";
      separator-color = "${colors.base02}cc";
      text-color = "${colors.base05}cc";
    };
  };
}
