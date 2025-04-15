-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  vim.keymap.set('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files({ hidden = true })<cr>', { desc = 'Find Files (with hidden)' }),
  vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]],
}
