{
  description =
    "Just building the kickoff slides. The docs site has nothing to do with nix";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nix-pandoc = {
      url = "github:serokell/nix-pandoc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    beamer-theme-serokell = {
      url = "github:serokell/beamer-theme-serokell";
      flake = false;
    };
    hercules-ci-effects = {
      url = "github:hercules-ci/hercules-ci-effects";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { self, nixpkgs, nix-pandoc, beamer-theme-serokell, hercules-ci-effects }:
    let
      system = "x86_64-linux";
      overlays = [ nix-pandoc.overlay hercules-ci-effects.overlay ];
      pkgs = import nixpkgs { inherit system overlays; };
    in {
      packages.${system}.default =
        (pkgs.extend nix-pandoc.overlay).callPackage ./kickoff/talk.nix {
          pygments = pkgs.python310Packages.pygments;
          inherit beamer-theme-serokell;
        };
      devShells.${system}.default = let pkg = self.packages.${system}.default;
      in pkgs.mkShell {
        inputsFrom = [ self.packages.${system}.default ];
        inherit (pkg) preBuild shellHook;
        buildInputs = [ pkgs.proselint ];
      };
      herculesCI = import ./kickoff/herc.nix {
        inherit pkgs;
        talk = self.packages.${system}.default;
      };
    };
}
