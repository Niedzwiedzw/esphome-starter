{
  description = "dev shell for esphome";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
        buildInputs = with pkgs; [
          esphome
        ];
      in {
        devShells.default = with pkgs;
          mkShell {
            inherit buildInputs;
          };
      }
    );
}
