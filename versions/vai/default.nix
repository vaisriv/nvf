{
	config,
	pkgs,
	inputs,
	lib,
	...
}: {
	imports = [
		./autocommands.nix
		./autocomplete.nix
		./config.nix
		./keymaps.nix
		./lsp.nix
		./plugins.nix
	];
}
