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
    git-crypt
    gnupg
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
    extensions = with pkgs.vscode-extensions; [
      mkhl.direnv
      rust-lang.rust-analyzer
      streetsidesoftware.code-spell-checker-british-english
      tamasfe.even-better-toml
      usernamehw.errorlens
      jnoortheen.nix-ide
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      timonwong.shellcheck
      github.vscode-github-actions
      github.vscode-pull-request-github
      oderwat.indent-rainbow
      kamadorueda.alejandra
    ];
    userSettings = {
      "[html]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[json]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.tabSize" = 2;
      };
      "[nix]" = {
        "editor.defaultFormatter" = "kamadorueda.alejandra";
        "editor.tabSize" = 2;
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[yaml]" = {
        "editor.tabSize" = 2;
      };
      "css.validate" = false;
      "editor.fontFamily" = "Fira-Mono";
      "editor.fontSize" = 16;
      "editor.rulers" = [120];
      "editor.tabSize" = 4;
      "editor.formatOnSave" = true;
      "git.autofetch" = true;
      "less.validate" = false;
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

  qt = {
    enable = true;
    platformTheme = "kde";
    style.name = "breeze";
  };
}
