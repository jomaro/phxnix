{ sources ? import ./nix/sources.nix
, pkgs ? import <nixpkgs> { }
}:

with pkgs;
let
  inherit (lib) optional optionals;
in

mkShell {
  buildInputs = [
    (import ./nix/default.nix { inherit pkgs; })
    niv
  ] ++ optional stdenv.isLinux inotify-tools
  ++ optional stdenv.isDarwin terminal-notifier
  ++ optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
    CoreFoundation
    CoreServices
  ]);

  shellHook = ''
    export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive
    export LANG=en_US.UTF-8
    export LC_COLLATE="en_US.UTF-8"
    export LC_ALL=en_US.UTF-8
  '';
}