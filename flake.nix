{
  description = "Alignable Structures docs site";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    hercules-ci-effects = {
      url = "github:hercules-ci/hercules-ci-effects";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      system = system;
      overlays = [];
    };
    site-source = pkgs.mkYarnPackage {
      name = "alignablestructures-docusaurus_source";
      src = ./.;
      packageJSON = ./package.json;
      yarnLock = ./yarn.lock;
    };
    docusaurus = pkgs.stdenv.mkDerivation {
      name = "Alignable Structures";
      src = site-source + "/libexec/alignable-structures/deps/alignable-structures";
      buildInputs = with pkgs; [ yarn ];
      buildPhase = "yarn build";
      installPhase = ''
        mkdir -p $out
        cp -r build
      '';
    };
    in {
      packages.${system}.docusaurus = docusaurus;
      defaultPackage.${system} = self.packages.${system}.docusaurus;
      herculesCI.onPush.docusaurus.outputs = self.packages.${system}.docusaurus;
    };
}
