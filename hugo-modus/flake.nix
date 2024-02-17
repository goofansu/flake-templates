{
  description = "Hugo development environment with hugo-modus theme";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.hugo-modus = {
    url = "sourcehut:~goofansu/hugo-modus";
    flake = false;
  };

  outputs = { self, nixpkgs, flake-utils, hugo-modus }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.website = pkgs.stdenv.mkDerivation {
          name = "blog";
          src = self;
          buildPhase = ''
            mkdir -p themes
            ln -s ${hugo-modus} themes/modus
            ${pkgs.hugo}/bin/hugo
          '';
          installPhase = "cp -r public $out";
        };

        defaultPackage = self.packages.${system}.website;
        devShells.default = with pkgs;
          mkShell {
            packages = [ hugo ];
            shellHook = ''
              if [ ! -d themes/modus/ ]; then
                mkdir -p themes
                ln -sf ${hugo-modus} themes/modus
              fi
            '';
          };
      });
}
