{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell { nativeBuildInputs = [ pkgs.elixir_1_14 ]; }

