-- Add relative numbering
vim.wo.relativenumber = true

-- Add column reference at 80 characters
vim.opt.colorcolumn = '120'

-- Add package facilities
vim.cmd [[
" Delete instead of cut
" nnoremap d "_d

" Toggle indent guides on start
let g:indent_guides_enable_on_vim_startup = 1
]]

-- Save files in a safe location
vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.backupdir = '/home/gio/.nvim_backup'
