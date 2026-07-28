{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-odin.url = "github:NixOS/nixpkgs/200c8267178b8626971e33e8d9e33bfc3573ebcb";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-odin,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        odinPkgs = nixpkgs-odin.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.just
            pkgs.nixfmt
            odinPkgs.odin
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
