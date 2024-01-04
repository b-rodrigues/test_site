let
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/976fa3369d722e76f37c77493d99829540d43845.tar.gz") {};
  system_packages = builtins.attrValues {
    inherit (pkgs) R ;
  };
 rpkgs = builtins.attrValues {
  inherit (pkgs.rPackages) blogdown;
};
hugo_0251 = pkgs.stdenv.mkDerivation {
    name = "hugo_0251";
    src = pkgs.fetchFromGitHub {
      owner = "gohugoio";
      repo = "hugo";
      rev = "v0.25.1";
      sha256 = "sha256-fwU1EHwui0OflOovzIOGdwjGoVsJyX0tKrwlT46uniU=";
    };
    buildInputs = [pkgs.go];
    installPhase = ''
      mkdir -p $out/bin
      cp -r . $out/bin/
    '';
};
in
  pkgs.mkShell {
    buildInputs = [ system_packages rpkgs hugo_0251];
  }