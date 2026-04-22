return {
	"mechatroner/rainbow_csv",
	enabled = true,
	ft = { "csv" },
	-- set the filetype using vim command
	config = function()
		vim.cmd("autocmd BufNewFile,BufRead *.csv set filetype=rfc_csv")
	end,
}
