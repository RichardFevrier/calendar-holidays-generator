{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        customOdin = pkgs.odin.overrideAttrs (_: {
          src = pkgs.fetchgit {
            url = "https://github.com/odin-lang/Odin.git";
            rev = "6ef91e2";
            sha256 = "sha256-kwjiQ7IIBRpnMtQS2zgoHlaimQCdl/3Td+L83l1fhH4=";
            fetchSubmodules = true;
          };
        });
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            customOdin
            pkgs.just
            pkgs.nixfmt
          ];

          shellHook = ''
            if [ "$(git config core.hooksPath)" != ".githooks" ]; then
              just setup
            fi
          '';
        };
      }
    );
}
