{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions;
      [
        catppuccin.catppuccin-vsc
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
      "editor.semanticHighlighting.enabled" = true;
      "files.watcherExclude" = {
        "**/.direnv/*/**" = true;
      };
      "git.autofetch" = true;
      "less.validate" = false;
      "prettier.printWidth" = 120;
      "rust-analyzer.check.command" = "clippy";
      "rust-analyzer.checkOnSave" = true;
      "scss.validate" = false;
      "terminal.integrated.fontFamily" = "Fira-Mono";
      "terminal.integrated.minimumContrastRatio" = 1;
      "window.titleBarStyle" = "custom";
      "workbench.colorTheme" = "Catppuccin Macchiato";
      "workbench.preferredDarkColorTheme" = "Catppuccin Macchiato";
      "catppuccin.accentColor" = "lavender";
      "catppuccin.customUIColors" = {
        "macchiato" = {
          "statusBar.foreground" = "accent";
        };
      };
      "catppuccin.italicKeywords" = false;
    };
  };
}
