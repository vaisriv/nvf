{...}: {
    vim = {
        viAlias = false;
        vimAlias = false;
        enableLuaLoader = true;

        additionalRuntimePaths = [
            ./nvim
        ];

        luaConfigRC.myconfig =
            # lua
            ''
                require("options")
                require("keymaps")
                require("autocommands")

                local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
                if not (vim.uv or vim.loop).fs_stat(lazypath) then
                        vim.fn.system({
                                "git",
                                "clone",
                                "--filter=blob:none",
                                "https://github.com/folke/lazy.nvim.git",
                                "--branch=stable", -- latest stable release
                                lazypath,
                        })
                end
                vim.opt.rtp:prepend(lazypath)

                require("lazy").setup({ import = "plugins" })
            '';
    };
}
