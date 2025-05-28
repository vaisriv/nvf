{
	config,
	pkgs,
	inputs,
	lib,
	...
}: {
	vim.theme = {
		enable = true;
		transparent = false;
		name = "catppuccin";
		style = "mocha";
	};
}
