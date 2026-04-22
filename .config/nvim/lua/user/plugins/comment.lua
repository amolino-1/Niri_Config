return {
	"numToStr/Comment.nvim",
	enabled = true,
	event = { "BufReadPre", "BufNewFile" },
	config = true, -- runs require('Comment').setup
}
