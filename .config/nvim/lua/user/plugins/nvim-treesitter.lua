return {
	{
		"nvim-treesitter/nvim-treesitter",
		enabled = true,
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
			"luckasRanarison/tree-sitter-hyprlang", -- Hyprland syntax highlighting
		},
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
					disable = { "hyprlang" },
				},
				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = {
					enable = true,
				},
				-- ensure these language parsers are installed
				ensure_installed = {
					"bash",
					"bibtex",
					"c",
					"cmake",
					"cpp",
					"css",
					"csv",
					"dockerfile",
					"fortran",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"go",
					"html",
					-- "hyprlang", -- Hyprland syntax highlighting
					"java",
					"javascript",
					"json",
					"latex",
					"lua",
					"make",
					"markdown",
					"markdown_inline",
					"matlab",
					"nix",
					"perl",
					"python",
					"query",
					"ruby",
					"rust",
					"tsv",
					"vim",
					"yaml",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},
}
