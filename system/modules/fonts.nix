{
  lib,
  pkgs,
  config,
  default,
  ...
}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      ibm-plex
      (nerdfonts.override {fonts = ["FiraMono" "NerdFontsSymbolsOnly"];})
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = ["IBM Plex Serif"];
        sansSerif = ["IBM Plex Sans"];
        monospace = ["Fira Mono Nerd Font"];
        emoji = ["Symbols Nerd Font"];
      };
    };
  };
}
