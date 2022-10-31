{ runCommand, mkDoc, texlive, pandoc, fontconfig, beamer-theme-serokell
, # google-fonts,
pygments, which }:
let
  texlive-packages = {
    inherit (texlive)
      scheme-small noto mweights cm-super cmbright fontaxes beamer minted
      fvextra catchfile xstring framed;
  };

  texlive-combined = texlive.combine texlive-packages;

in mkDoc {
  name = "alignable-structures-kickoff";
  src = ./.;
  # font = google-fonts;
  inherit texlive-combined;
  HOME = "/build";
  extraTexInputs = [ beamer-theme-serokell ];
  extraBuildInputs = [ which pygments ];
}
