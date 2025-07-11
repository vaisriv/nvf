-- Highlight, edit, and navigate code

return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"html",
				"javascript",
				"latex",
				"lua",
				"luadoc",
				"markdown",
				"matlab",
				"nix",
				"vim",
				"vimdoc",
			},
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"nvim-treesitter/playground",
		cmd = "TSPlaygroundToggle",
		config = function()
			require("nvim-treesitter.configs").setup({
				playground = {
					enable = true,
					updatetime = 25,
					persist_queries = false,
				},
			})
		end,
	},
}
