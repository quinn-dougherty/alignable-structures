{ pkgs, talk }: {
  onPush.talk.outputs.effects.slides = pkgs.effects.mkEffect {
    effectScript = ''
      putStateFile slides.pdf ${talk}/presentation.pdf
    '';
  };
}
