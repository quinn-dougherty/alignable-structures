{
  description = "Alignable Structures docs site";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    hercules-ci-effects = {
      url = "github:hercules-ci/hercules-ci-effects";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, hercules-ci-effects, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      system = system;
      overlays = [];
    };
    effects = hercules-ci-effects.lib.withPkgs pkgs;
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
      buildPhase = "yarn --offline build";
      installPhase = ''
        mkdir -p $out
        cp -r build $out
      '';
    };
    in {
      packages.${system}.docusaurus = docusaurus;
      defaultPackage.${system} = self.packages.${system}.docusaurus;
      herculesCI.onPush.docusaurus.outputs = self.packages.${system}.docusaurus;

      effects = { branch, ... }: {
        netlify = effects.netlifyDeploy {
          content = self.packages.${system}.docusaurus;
          secretName = "netlify";
          siteId = "e8604b0c-5357-47e7-899b-5cde997a05b4";
          productionDeployment = branch == "main";
        };
      };
    };
}
