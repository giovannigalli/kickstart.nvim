return {
  -- Set leader key to space
  vim.api.nvim_set_keymap('n', '<leader>py', ':w<CR>:!python3 %<CR>', { noremap = true, silent = true }),
}
