vim.g.mapleader = ' '
vim.g.have_nerd_font = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.winborder = 'rounded'
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

require('config.lsp-config')

-- Clear highlights on search when pressing <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymap
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<leader>e', '<CMD>Oil<CR>', { desc = 'Open file directory' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')

vim.keymap.set('n', '<leader>db', '<cmd> DapToggleBreakpoint <CR>', { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<leader>dr', '<cmd> DapContinue <CR>', { desc = 'Continue / run debugger' })
vim.keymap.set('n', '<F9>', '<cmd> DapContinue <CR>', { desc = 'Continue / run debugger' })
vim.keymap.set('n', '<F8>', '<cmd> DapStepOver <CR>', { desc = 'Step over' })
vim.keymap.set('n', '<F7>', '<cmd> DapStepInto <CR>', { desc = 'Step into' })
vim.keymap.set('n', '<F5>', '<cmd> DapTerminate | DapContinue <CR>', { desc = 'Restart debugger' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  {
    'behemothbucket/gruber-darker-theme.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('gruber-darker').setup()
      vim.cmd('colorscheme gruber-darker')
      -- for transparency:
      vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
      vim.cmd([[highlight NormalNC guibg=NONE ctermbg=NONE]])
      vim.cmd([[highlight EndOfBuffer guibg=NONE ctermbg=NONE]])
      vim.cmd([[highlight LineNr guibg=NONE ctermbg=NONE]])
      vim.cmd([[highlight SignColumn guibg=NONE ctermbg=NONE]])
      vim.cmd([[highlight CursorLineNr guibg=NONE ctermbg=NONE]])
      vim.cmd([[highlight Whitespace guibg=NONE ctermbg=NONE]])
      --
    end,
  },

  require('plugins.oil'),
  require('plugins.snacks'),
  require('plugins.noice'),
  require('plugins.harpoon'),
  require('plugins.eyeliner'),
  require('plugins.supermaven'),
  require('plugins.gitsigns'),

  require('plugins.debugging.nvim-dap'),
  require('plugins.debugging.nvim-nio'),
  require('plugins.debugging.nvim-dap-ui'),

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      delay = 0,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>f', group = '[F]ind' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>g', group = '[G]it' },
      },
    },
  },

  {
    'echasnovski/mini.nvim',
    config = function()
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup({ n_lines = 500 })

      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
      vim.keymap.set('n', 's', '<Nop>', { noremap = true, silent = true })
      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require('mini.statusline')
      -- set use_icons to true if you have a Nerd Font
      statusline.setup({ use_icons = vim.g.have_nerd_font })

      require('mini.jump2d').setup({view = { dim = true}})
      vim.api.nvim_set_hl(0, "MiniJump2dSpot", { fg = "#88E788", bold = true})
      vim.api.nvim_set_hl(0, "MiniJump2dLabel", { fg = "none"})
      require('mini.pick').setup()
      vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { fg = "#88E788"})
      --display color of color hex codes
      local hipatterns = require('mini.hipatterns')
      hipatterns.setup({
        highlighters = {
          hex_color = hipatterns.gen_highlighter.hex_color(),
        }
      })
      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
      },
    },
  },
})

vim.keymap.set('n', '<leader>gg', function()
  Snacks.lazygit.open()
end, { desc = 'Open Lazy[g]it' })

vim.keymap.set('n', '<leader>gl', function()
  Snacks.lazygit.log()
end, { desc = 'Open Lazy[g]it [L]og' })

function mini_pick_map(keys, funcname, opt, desc)
  local func = require('mini.pick').builtin[funcname]
  vim.keymap.set('n', '<leader>'..keys, function() func({}, opt or {}) end, { desc = desc})
end

mini_pick_map('fn', 'files', {source={cwd=vim.fn.stdpath('config')}}, 'Find neovim config')
mini_pick_map('ff', 'files', {}, 'Find files')
mini_pick_map('fg', 'grep_live', {}, 'Find grep')
mini_pick_map('fb', 'buffers', {}, 'Find buffers')
mini_pick_map('fr', 'resume', {}, 'Find resume')
mini_pick_map('fh', 'help', {}, 'Find help')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
