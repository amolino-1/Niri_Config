-- Basic Configuration --
-- :help options

local options = {
	background = "dark", -- Use colours that look good on dark backgrounds
	backup = false, -- Disable backup files
	cursorcolumn = true, -- Highlight the current column
	cursorline = true, -- Highlight the current line
	expandtab = true, -- Convert tabs to spaces
	hidden = true, -- Ignore junk messages from buffer
	history = 1000, -- Set number of commands to store in history
	hlsearch = true, -- Highlight all matches of previous search pattern
	ignorecase = true, -- Ignore case in search
	incsearch = true, -- Incremental search as you type
	mouse = "", -- Compleatly disable the mouse
	nu = true, -- Turn ON number line
	numberwidth = 4, -- Set minimal number of columns to use in number line
	relativenumber = true, -- Make numberline relative to current line
	scrolloff = 8, -- Minimal number of screen lines to keep above/below cursor
	shiftwidth = 4, -- The number of soaces for TAB while edeting
	smartcase = true, -- Make search case sensitive when using capitals
	smartindent = false, -- Turn ON smart indent
	softtabstop = 4, -- Number of spaces for TAB while editing
	splitbelow = true, -- Force horizontal split to go below current window
	splitright = true, -- Force vertical split to go to the right of current window
	swapfile = false, -- Disable swap files
	syntax = enable, -- Turn on syntax highlighting
	tabstop = 4, -- Number of spaces for TAB in a file counts for
	termguicolors = true, -- Set term gui colours
	undodir = os.getenv("HOME") .. "/.vim/undodir", -- Set undo directory
	undofile = true, -- Enable persistent undo
	updatetime = 250, -- Set time in ms to wait for a mapped sequence to complete
	wrap = true, -- Turn On/Off line wrapping
	signcolumn = "yes", -- Always show the signcolumn
}

-- Set the Python3 host program
vim.g.python3_host_prog = "/sbin/python3"

-- Loop through each key-value pair in the 'options' table
for optionName, value in pairs(options) do
	-- Set each Neovim option using the 'vim.opt' interface
	vim.opt[optionName] = value
	-- 'optionName' is the name of the option (like 'background', 'backup', etc.)
	-- 'value' is the value to be set for that option
end
