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
    nix build .#homeManagerConfigurations.ed.activationPackage
    ./result/activate
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
    nix-collect-garbage --delete-old
    popd

