{ sources ? import ./sources.nix
, pkgs ? import sources.nixpkgs { }
}:

with pkgs;

buildEnv {
  name = "builder";
  paths = [
    beam.packages.erlangR25.elixir_1_13
    beam.packages.erlangR25.hex
    beam.packages.erlangR25.rebar3
  ];
  postBuild = ''
    export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive
    export LANG=en_US.UTF-8
    export LC_COLLATE="en_US.UTF-8"
    export LC_ALL=C.UTF-8
    # mix local.hex --force
    # mix compile
  '';
}