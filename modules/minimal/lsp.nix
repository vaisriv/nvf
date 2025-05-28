{
	config,
	pkgs,
	inputs,
	lib,
	...
}: {
	vim = {
		lsp = {
			enable = true;
			formatOnSave = true;
			trouble.enable = true;
		};

		languages = {
			# config
			enableTreesitter = true;
			enableFormat = true;

			# languages
			lua.enable = true;
			nix.enable = true;
		};
	};
}
