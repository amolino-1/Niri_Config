return {
	"stevearc/conform.nvim",
	enabled = true,
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				bash = { "beautysh", "shellharden" },
				css = { "prettier" },
				html = { "prettier" },
				javascript = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				python = { "isort", "black" },
				sh = { "beautysh", "shellharden" },
				tex = { "latexindent" },
				yaml = { "prettier" },
			},
			format_on_save = function(bufnr)
				local ft = vim.api.nvim_buf_get_option(bufnr, "filetype") -- Disable format-on-save for bash and sh filetypes
				if ft == "bash" or ft == "sh" then
					return false
				end

				return {
					lsp_fallback = false,
					async = false,
					timeout_ms = 1000,
				}
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
