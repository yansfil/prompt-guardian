{
  description = "Prompt Guardian Project flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

    outputs = { self, nixpkgs, flake-utils }:
      flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.nodePackages.pnpm           # `pnpm`
            pkgs.nodePackages_latest.nodejs  # `node`
            pkgs.jq                   
          ];

          shellHook = ''
            echo "Welcome to the TypeScript project environment!"
            export NODE_ENV=development
            # Install npm dependencies if exist
            if [ -f package.json ]; then
              pnpm install
            fi
          '';
        };
      }
    );
}