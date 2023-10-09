{
  config,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ed";
  home.homeDirectory = "/home/ed";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    just
    fira-mono
  ];

  fonts.fontconfig.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Ed Fawcett-Taylor";
    userEmail = "edwardpaultaylor@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.gh = {
    enable = true;
  };

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions;
      [
        dbaeumer.vscode-eslint
        esbenp.prettier-vscode
        github.vscode-github-actions
        github.vscode-pull-request-github
        jnoortheen.nix-ide
        kamadorueda.alejandra
        mkhl.direnv
        oderwat.indent-rainbow
        rust-lang.rust-analyzer
        streetsidesoftware.code-spell-checker
        tamasfe.even-better-toml
        timonwong.shellcheck
        usernamehw.errorlens
        yzhang.markdown-all-in-one
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "code-spell-checker-british-english";
          publisher = "streetsidesoftware";
          version = "1.3.0";
          sha256 = "sha256-w6RNWJH8Orc3dM0iH0sFh+WdvYTThn74HJ89KTPNAUA=";
        }
        {
          name = "better-comments";
          publisher = "aaron-bond";
          version = "3.0.2";
          sha256 = "sha256-hQmA8PWjf2Nd60v5EAuqqD8LIEu7slrNs8luc3ePgZc=";
        }
        {
          name = "vscode-conventional-commits";
          publisher = "vivaxy";
          version = "1.25.0";
          sha256 = "sha256-KPP1suR16rIJkwj8Gomqa2ExaFunuG42fp14lBAZuwI=";
        }
      ];
    userSettings = {
      "[html]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.tabSize" = 2;
      };
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.tabSize" = 2;
      };
      "[json]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.tabSize" = 2;
      };
      "[nix]" = {
        "editor.defaultFormatter" = "kamadorueda.alejandra";
        "editor.tabSize" = 2;
      };
      "[rust]" = {
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.tabSize" = 2;
      };
      "[yaml]" = {
        "editor.tabSize" = 2;
      };
      "cSpell.language" = "en,en-GB";
      "css.validate" = false;
      "editor.fontFamily" = "Fira-Mono";
      "editor.fontSize" = 16;
      "editor.formatOnSave" = true;
      "editor.rulers" = [120];
      "git.autofetch" = true;
      "less.validate" = false;
      "prettier.printWidth" = 120;
      "rust-analyzer.check.command" = "clippy";
      "rust-analyzer.checkOnSave" = true;
      "scss.validate" = false;
      "terminal.integrated.fontFamily" = "Fira-Mono";
      "window.titleBarStyle" = "custom";
      "workbench.colorTheme" = "Default Dark+";
      "workbench.preferredDarkColorTheme" = "Default Dark+";
    };
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true; # see note on other shells below
    nix-direnv.enable = true;
  };

  programs.bash.enable = true;
  programs.starship.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
