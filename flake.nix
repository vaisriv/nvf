{
	description = "vai's nvf neovim configuration";

	inputs = {
		# Nix Packages
		nixpkgs.url = "nixpkgs/nixos-unstable";

		# Flake Utils
		flake-utils = {
			url = "github:numtide/flake-utils";
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
				packages = {
					default =
						(inputs.nvf.lib.neovimConfiguration {
								inherit pkgs;
								modules = [./modules/minimal];
							}).neovim;

					minimal =
						(inputs.nvf.lib.neovimConfiguration {
								inherit pkgs;
								modules = [./modules/minimal];
							}).neovim;

					vai =
						(inputs.nvf.lib.neovimConfiguration {
								inherit pkgs;
								modules = [./modules/vai];
							}).neovim;

					lua =
						(inputs.nvf.lib.neovimConfiguration {
								inherit pkgs;
								modules = [./modules/lua];
							}).neovim;
				};

				formatter = pkgs.alejandra;
			}
		);
}
