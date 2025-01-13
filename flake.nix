{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        #packages = with pkgs; [
        #  git
        #  ghc
        #  haskellPackages.cabal-install
        #];

        devShell = pkgs.mkShell {
          buildInputs = [
            pkgs.hpack
            pkgs.zlib
            pkgs.git
            pkgs.ghc
            pkgs.haskellPackages.cabal-install
            pkgs.haskellPackages.zlib
          ];
        };
      } );
}
