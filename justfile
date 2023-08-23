config_path := "$HOME" / "repos" / "nix-config"

apply-system:
    #!/bin/sh
    set -euxo pipefail
    pushd {{config_path}}
    sudo nixos-rebuild switch --flake .#
    popd

apply-user:
    #!/bin/sh
    set -euxo pipefail
    pushd {{config_path}}
    nix build .#homeManagerConfigurations.ed.activationPackage
    ./result/activate
    popd

update:
    #!/bin/sh
    set -euxo pipefail
    pushd {{config_path}}
    nix flake update
