{
	config,
	pkgs,
	inputs,
	lib,
	...
}: {
	vim = {
		mini = {
			ai.enable = true;
			clue.enable = true;
			completion.enable = true;
			files.enable = true;
			icons.enable = true;
			jump.enable = true;
			jump2d = {
				enable = true;
				setupOpts = {
					mappings = {
						start_jumping = "s";
					};
				};
			};
			notify.enable = true;
			snippets.enable = true;
			starter.enable = true;
			statusline.enable = true;
			surround.enable = true;
			tabline.enable = true;
		};
	};
}
