{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    catppuccin-whiskers.url = "github:catppuccin/whiskers";
  };

  outputs = {
    self,
    flake-utils,
    nixpkgs,
    catppuccin-whiskers,
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        whiskers = inputs.catppuccin-whiskers.packages.${system}.whiskers;
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            whiskers
            just
          ];
        };
      }
    );
}
