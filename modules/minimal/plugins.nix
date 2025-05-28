{
	config,
	pkgs,
	inputs,
	lib,
	...
}: {
	vim = {
		mini = {
			clue.enable = true;
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
			starter.enable = true;
			statusline.enable = true;
			tabline.enable = true;
		};
	};
}
