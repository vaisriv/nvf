{
	config,
	pkgs,
	inputs,
	lib,
	...
}: {
	vim = {
		viAlias = false;
		vimAlias = false;
		enableLuaLoader = true;
	};

	# TODO: import lua
}
