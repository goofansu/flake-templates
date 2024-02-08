{
  description = "A basic flake for hugo";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.website = pkgs.stdenv.mkDerivation {
          name = "website";
          src = self;
          buildPhase = "${pkgs.hugo}/bin/hugo";
          installPhase = "cp -r public $out";
        };

        defaultPackage = self.packages.${system}.website;
        devShells.default = pkgs.mkShell { packages = [ pkgs.hugo ]; };
      });
}
