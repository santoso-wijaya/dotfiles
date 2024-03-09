-- ######### mini.nvim plugin configs ##########################################

-- Extend a/i textobjects, useful in Visual mode.
-- e.g. va' would select 'mini.ai' and vi' would select the same without ''
require('mini.ai').setup()

-- Use [ and ] to go backward/forward to certain targets.
-- e.g. ]b is :bn and ]B to go forward to the last buffer
--      ]c, ]C, [c, [C to move between comment blocks
-- etc
require('mini.bracketed').setup()

-- Automatic creation of closing pairs (brackets, quotes, etc) with <BS> support
-- Pairs are not inserted after backslash `\`, and `'` after a letter is not
-- recognized, either (e.g. Ness').
require('mini.pairs').setup()

-- Alternative to vim-easymotion; activate with <CR><CR>
require('mini.jump2d').setup({
  -- Same as vim-easymotion
  labels = 'hklyuiopnm,qwertzxcvbasdgjf;',
  mappings = {
    start_jumping = '<Leader><Leader>',
  },
})
vim.cmd([[
  highlight MiniJump2dSpot cterm=undercurl,bold ctermfg=1
      \ gui=undercurl,bold guisp=Red guifg=Red guibg=None
]])

-- Highlight trailing whitespaces; trim all with :MiniTrailspace.trim();
-- trim all trailing empty lines with :MiniTrailspace.trim_last_lines()
require('mini.trailspace').setup()

-- After selecting in Visual mode, move blocks of text with <M-hjkl>, etc
-- Also works in Normal mode, it moves the current line under cursor
require('mini.move').setup()

-- Highlight certain patterns (TODO, FIXME, etc)
require('mini.hipatterns').setup()

-- ######### end mini.nvim plugin configs ######################################

vim.o.guifont = "MonaspiceNe Nerd Font,FiraCode Nerd Font,Monaspace Neon,Fira Code"
vim.g.neovide_theme = 'solarized'
vim.g.neovide_input_macos_alt_is_meta = true
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_remember_window_size = true

