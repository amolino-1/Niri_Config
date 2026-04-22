return {
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{
		"baliestri/aura-theme",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
			vim.cmd([[colorscheme aura-dark]])

			-- Set cross-hair colors
			vim.cmd([[highlight CursorLine ctermbg=Yellow cterm=bold guibg=#32394a]])
			vim.cmd([[highlight CursorColumn ctermbg=Yellow cterm=bold guibg=#32394a]])
		end,
	},
}
