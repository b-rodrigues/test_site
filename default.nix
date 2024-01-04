let
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/976fa3369d722e76f37c77493d99829540d43845.tar.gz") {};
  system_packages = builtins.attrValues {
    inherit (pkgs) R ;
  };
 rpkgs = builtins.attrValues {
  inherit (pkgs.rPackages) blogdown;
};
in
  pkgs.mkShell {
    buildInputs = [ system_packages rpkgs ];
  }
