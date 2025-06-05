{ pkgs, ... }:
let
  customOdin = pkgs.odin.overrideAttrs (_: {
    src = pkgs.fetchgit {
      url = "https://github.com/odin-lang/Odin.git";
      rev = "6ef91e2";
      sha256 = "sha256-kwjiQ7IIBRpnMtQS2zgoHlaimQCdl/3Td+L83l1fhH4=";
      fetchSubmodules = true;
    };
  });
  odinBuildCmd = "odin build src -out:$(basename $PWD)";
in
{
  packages = [
    customOdin
  ];

  scripts = {
    dev.exec = "${odinBuildCmd} -debug -o:none";
    prod.exec = "${odinBuildCmd} -o:speed";
  };
}
