config_path := "$HOME" / "repos" / "nix-config"

upgrade-system:
    #!/bin/sh
    set -euxo pipefail
    pushd {{config_path}}
    sudo nixos-rebuild switch --flake .#
    popd

upgrade-user:
    #!/bin/sh
    set -euxo pipefail
    pushd {{config_path}}
    home-manager switch --flake .#ed@laptop
    popd

update:
    #!/bin/sh
    set -euxo pipefail
    pushd {{config_path}}
    nix flake update
    popd

prune:
    #!/bin/sh
    set -euxo pipefail
    pushd {{config_path}}
    nix-collect-garbage --delete-older-than 7d
    popd

purge:
    #!/bin/sh
    set -euxo pipefail
    pushd {{config_path}}
    sudo nix-env --delete-generations 7d --profile /nix/var/nix/profiles/system
    sudo /nix/var/nix/profiles/system/bin/switch-to-configuration switch
    nix-store --gc
    popd