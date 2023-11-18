{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  services.kanshi = {
    enable = true;

    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            mode = "1920x1080@60Hz";
            status = "enable";
          }
        ];
      };
      home_office = {
        outputs = [
          {
            criteria = "DP-1";
            scale = 1.0;
            mode = "1920x1080@60Hz";
            status = "enable";
            position = "0,0";
          }
          {
            criteria = "eDP-1";
            scale = 1.1;
            mode = "1920x1080@60Hz";
            status = "enable";
            position = "1920,0";
          }
        ];
      };
    };
  };
}
