local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- set leader key to space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keybindings --
-- Modes
--   normal_mode       = 'n'
--   insert_mode       = 'i'
--   visual_mode       = 'v'
--   visual_block_mode = 'x'
--   terminal_mode     = 't'
--   command_mode      = 'c'

-- Super Keys --
--   Leader  = '<leader>'
--   Enter   = '<CR>'
--   Control = '<C>'
--   Shift   = '<S>'
--   Alt     = '<A>'

-- keymap({mode}, {keymap}, {mapped to}, {options})

-- Normal Mode --
-- Better Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Keymaps for terminal mode navigation
-- Open a vertical split terminal to the right and enter insert mode
keymap("n", "<leader>tt", ":vsplit term://bash<CR>i", opts)
keymap("t", "<Esc>", "<C-\\><C-n>", term_opts)
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", term_opts)

-- Resize Splits with Alt + Arrow Key
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize -2<CR>", opts)
-- Spellcheck On/Off
keymap("n", "<leader>s", ":setlocal spell!<CR>", opts)
-- Alias to replace
keymap("n", "<S-s>", ":%s///g<Left><Left><Left>", opts)
-- Remove highlighting
keymap("n", "<leader>nh", ":nohl<CR>", opts)

-- Add a new line above and exit insert mode
keymap("n", "<leader>O", "O<Esc>j", opts)
-- Add a new line below and exit insert mode
keymap("n", "<leader>o", "o<Esc>k", opts)

-- Undotree
keymap("n", "<leader>u", ":UndotreeToggle<CR>:UndotreeFocus<CR>", opts)
-- Buffer Tabs
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<Tab>", ":bnext<CR>", opts)
-- Create a vertical split and open a file
keymap("n", "<leader>vs", ":vsplit<CR>:e ", opts)

-- Visual Mode --
-- Move Text Blocks Left/Right (Shift + </>)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Disable Arrow Keys in all Modes
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)
keymap("i", "<Up>", "<Nop>", opts)
keymap("i", "<Down>", "<Nop>", opts)
keymap("i", "<Left>", "<Nop>", opts)
keymap("i", "<Right>", "<Nop>", opts)
keymap("v", "<Up>", "<Nop>", opts)
keymap("v", "<Down>", "<Nop>", opts)
keymap("v", "<Left>", "<Nop>", opts)
keymap("v", "<Right>", "<Nop>", opts)
keymap("n", "<C-Up>", "<Nop>", opts)
keymap("n", "<C-Down>", "<Nop>", opts)
keymap("n", "<C-Left>", "<Nop>", opts)
keymap("n", "<C-Right>", "<Nop>", opts)
keymap("i", "<C-Up>", "<Nop>", opts)
keymap("i", "<C-Down>", "<Nop>", opts)
keymap("i", "<C-Left>", "<Nop>", opts)
keymap("i", "<C-Right>", "<Nop>", opts)
keymap("n", "<S-Up>", "<Nop>", opts)
keymap("n", "<S-Down>", "<Nop>", opts)
keymap("n", "<S-Left>", "<Nop>", opts)
keymap("n", "<S-Right>", "<Nop>", opts)
keymap("i", "<S-Up>", "<Nop>", opts)
keymap("i", "<S-Down>", "<Nop>", opts)
keymap("i", "<S-Left>", "<Nop>", opts)
keymap("i", "<S-Right>", "<Nop>", opts)

-- Disable Arrow keys in dropdown menu
keymap("c", "<Up>", "<Nop>", opts)
keymap("c", "<Down>", "<Nop>", opts)
keymap("c", "<C-Up>", "<Nop>", opts)
keymap("c", "<C-Down>", "<Nop>", opts)

-- Disable Control + Z in Normal Mode
keymap("n", "<C-z>", "<Nop>", opts)
