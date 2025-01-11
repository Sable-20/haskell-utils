let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    git
    ghc
    haskellPackages.cabal-install
  ];

  shellHook = ''
    echo "Now in a nix shell\n"
  '';
}
