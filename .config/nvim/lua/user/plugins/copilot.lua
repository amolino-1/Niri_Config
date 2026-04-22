return {
	"github/copilot.vim",
	enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.g.copilot_filetypes = { -- Disable copilot for cetain filetypes
			["ampl"] = false,
			["dcl"] = false,
			log = false,
			["orca"] = false,
			out = false,
			xyz = false,
			tex = false,
			py = false,
		}
		vim.cmd([[highlight CopilotSuggestion guifg=#06D6A0 ctermfg=8]]) -- Change the color of the copilot suggestion
	end,
}
