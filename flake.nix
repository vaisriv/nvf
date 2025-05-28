{
	description = "vai's nvf neovim configuration";

	inputs = {
		# Nix Packages
		nixpkgs.url = "nixpkgs/nixos-24.11";

		# Better Nix Implementation - Lix
		lix-module = {
			url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-1.tar.gz";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Nix Formatter - Alejandra
		alejandra = {
			url = "github:kamadorueda/alejandra";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Generic Systems for Flakes
		systems = {
			url = "github:nix-systems/default";
		};

		# Flake Utils
		flake-utils = {
			url = "github:numtide/flake-utils";
			inputs.systems.follows = "systems";
		};

		# NVF Nix Neovim Module
		nvf = {
			url = "github:notashelf/nvf";
		};
	};

	outputs = inputs @ {
		nixpkgs,
		flake-utils,
		nvf,
		self,
		...
	}:
		flake-utils.lib.eachDefaultSystem (
			system: let
				pkgs = nixpkgs.legacyPackages.${system};
			in {
				packages.${system} = {
					default =
						(nvf.lib.neovimConfiguration {
								inherit pkgs;
								modules = [
									./versions/default
								];
							}).neovim;
					vai =
						(nvf.lib.neovimConfiguration {
								inherit pkgs;
								modules = [
									./versions/vai
								];
							}).neovim;
					lua =
						(nvf.lib.neovimConfiguration {
								inherit pkgs;
								modules = [
									./versions/lua
								];
							}).neovim;
				};
				defaultPackage.${system} = self.packages.${system}.neovim;
				formatter = inputs.alejandra.defaultPackage.${system};
			}
		);
}
