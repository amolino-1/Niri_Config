return {
	"projekt0n/github-nvim-theme",
    enabled = false,
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("github-theme").setup({
			options = {
				transparent = true,
				hide_end_of_buffer = true,
				hide_nc_statusline = true,
				styles = {
					comments = "italic,bold",
					functions = "NONE",
					keywords = "bold",
					variables = "underline",
				},
				darken = {
					floats = true,
					sidebars = {
						enable = true,
						list = {},
					},
				},
			},

			specs = {
				-- Change the color of only the 'github_dark' theme's 'hint' color to magenta and make the 'error' color a dim red.
				github_dark = {
					diag = {
						error = "#660000",
						hint = "magenta.base",
					},
				},
				-- Change the "hint" color to the "orange" color, and make the "error" color bright red.
				all = {
					diag = {
						error = "#ff0000",
						hint = "orange",
					},
				},
			},

			-- Overwrite the highlight groups for all colorschemes
			groups = {
				all = {
					htmlTag = { fg = "palette.red", bg = "#282c34", sp = "diag.hint", style = "underline,bold" },
					DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
					-- this will remove the highlight groups
					TSField = {},
				},
			},
		})
		-- Set the colore scheme
		vim.cmd("colorscheme github_dark_high_contrast")
		-- Set cross-hair colors
		vim.cmd([[highlight CursorLine ctermbg=Yellow cterm=bold guibg=#32394a]])
		vim.cmd([[highlight CursorColumn ctermbg=Yellow cterm=bold guibg=#32394a]])
	end,
}
