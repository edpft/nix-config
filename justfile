config_path := "$HOME" / "repos" / "nix-config"
user := "ed"

apply-system:
    #!/bin/sh
    set -euxo pipefail
    sudo nixos-rebuild switch -I nixos-config={{config_path}}/system/configuration.nix

apply-user user=user:
    #!/bin/sh
    set -euxo pipefail
    home-manager switch -f {{config_path}}/users/{{user}}/home.nix

update-system:
    #!/bin/sh
    sudo nix-channel --update

update-user:
    #!/bin/sh
    nix-channel --update

