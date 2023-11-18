{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.bash.enable = true;
  programs.starship.enable = true;
  programs.alacritty.enable = true;
}
