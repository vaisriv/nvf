{
	config,
	pkgs,
	inputs,
	lib,
	...
}: {
	imports = [
		./config.nix
		./lsp.nix
		./plugins.nix
		./theme.nix
	];
}
