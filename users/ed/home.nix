{ config, pkgs, ... }:

{
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
    gh
    git-crypt
    gnupg
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ed/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

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

#  programs.vscode = {
#    enable = true;
#    extensions = with pkgs.vscode-extensions; [
#      rust-lang.rust-analyzer
#      streetsidesoftware.code-spell-checker
#      tamasfe.even-better-toml
#      usernamehw.errorlens
#      jnoortheen.nix-ide      
#    ];
#    userSettings = {
#      "git.autofetch" = true;
#      "[rust]" = {
#        "editor.formatOnSave" = true;
#        "editor.tabSize" = 4;
#      };
#      "rust-analyzer.checkOnSave.command": "clippy";
#      "[nix]"."editor.tabSize" = 2;
#    };
#  };
}
