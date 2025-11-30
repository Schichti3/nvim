vim.g.mapleader = ' '
vim.g.have_nerd_font = true;
vim.o.termguicolors = true;
vim.o.number = true;
vim.o.relativenumber = true;
vim.o.wrap = false;
vim.o.swapfile = false;
vim.o.clipboard = 'unnamedplus'
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.signcolumn = 'yes'
vim.o.scrolloff = 10
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.undofile = true
vim.o.winborder = 'rounded'
vim.o.completeopt = 'menuone,noinsert'


vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight NormalNC guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight EndOfBuffer guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight LineNr guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight SignColumn guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight CursorLineNr guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight Whitespace guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight NormalFloat guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight FloatBoarder guibg=NONE ctermbg=NONE]])
