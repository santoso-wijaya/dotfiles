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

require('oil').setup({
  -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
  -- Set to false if you still want to use netrw.
  default_file_explorer = true,
  columns = {
    "icon",
    -- "permissions",
    -- "size",
  },
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
    -- This function defines what will never be shown, even when `show_hidden` is set
    is_always_hidden = function(name, bufnr)
      return name == '.DS_Store'
    end,
  },
})

-- ######### end mini.nvim plugin configs ######################################

vim.o.guifont = "MonaspiceNe Nerd Font,FiraCode Nerd Font,Monaspace Neon,Fira Code"

if vim.g.neovide then
  require 'neovide_config'
end

