-- Autocommands --

-- General Template
--vim.cmd [[
--  augroup <_user_specified_name_of_autocmd>
--    autocmd!
--    autocmd <on event do something>
--  augroup end
--]]

-- Autocommand List
-- (1) Remove Whitespace on BufWrite
-- (2) Highlight Yanked Region
-- (3) Turn ON Rainbow Parentheses      - If Filetype = *, then activate RainbowParentheses
-- (4) Set File Type Themes             - If filetype = orca, then set colorscheme to candycode
-- (5) Save Folds on Write              - When BufWrite is triggered on any file :mkview
-- (6) Load Folds on Read               - When BufRead is triggered on anyfile :loadview (silent = no message)

vim.cmd([[
  augroup _custom_autocommands
    autocmd!
    autocmd BufWrite * %s/\s\+$//e
    autocmd BufWrite * mkview
    autocmd BufRead * silent! loadview
    autocmd FileType orca setlocal commentstring=#\ %s
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=6500}
  augroup end
]])

-- autocmd FileType * RainbowParentheses
-- autocmd FileType orca colorscheme candycode
