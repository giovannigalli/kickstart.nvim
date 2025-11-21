-- -- Configure Nvim-R
-- -- vim.g.R_app = 'radian'
-- vim.g.R_app = 'R'
-- vim.g.R_app = 'R'
-- vim.g.R_hl_term = 0
-- vim.g.R_args = { '--no-save', '--no-restore', '--quiet' }
-- vim.g.R_bracketed_paste = 1
-- vim.g.R_rmdchunk = 0

-- vim.cmd [[
-- " map <silent> <leader> :call g:SendCmdToR("roxygen::roxygenise()")<CR>
-- map <silent> <LocalLeader>rx :call g:SendCmdToR("roxygen2::roxygenise()")<CR>
-- " map <silent> <LocalLeader>in :call g:SendCmdToR("devtools::install()")<CR>
-- map <silent> <LocalLeader>in :call g:SendCmdToR("try(detach(paste0(\'package:\', pkgload::pkg_name()), unload = TRUE, character.only = TRUE)) ; devtools::install() ; library(pkgload::pkg_name(), character.only = TRUE)")<CR>
-- map <silent> <LocalLeader>lo :call g:SendCmdToR("devtools::load_all()")<CR>
-- map <silent> <LocalLeader>hh :call g:SendCmdToR("setwd(here::here())")<CR>

--   " This will close/open R depending on the state
-- map <silent> <LocalLeader>RR :call SendCmdToR("q()")<CR>:call StartR("R")<CR>

-- " Autostart R when .R is loaded
-- let R_auto_start = 1

-- " Automatically rearrange windows
-- " let R_after_ob_open = [':wincmd l', ':wincmd L', ':wincmd l', ':call g:SendCmdToR("setwd(here::here())")<CR>']

-- " Disable automatic transformation of _ into <-.
-- let R_assign = 0
-- ]]

-- -- require('lspconfig').air.setup {
-- --   on_attach = function(_, bufnr)
-- --     vim.api.nvim_create_autocmd('BufWritePre', {
-- --       buffer = bufnr,
-- --       callback = function()
-- --         vim.lsp.buf.format()
-- --       end,
-- --     })
-- --   end,
-- -- }

-- -- Disable formatting for r_language_server so only air is used
-- require('lspconfig').r_language_server.setup {
--   on_attach = function(client, _)
--     client.server_capabilities.documentFormattingProvider = false
--     client.server_capabilities.documentRangeFormattingProvider = false
--   end,
-- }

-- -- Notes:
-- -- Install r-languageserver with Mason

-- -- Bits commented out:
-- -- " Autostart object browswer when .R is loaded
-- -- let R_objbr_auto_start = 1
-- -- " Automatically rearrange windows
-- -- let R_after_ob_open = [':wincmd l', ':wincmd L', ':Neotree', ':wincmd l']
-- File: ~/.config/nvim/lua/custom/config/r.lua

-- File: ~/.config/nvim/lua/custom/config/r.lua

-- Ensure Tree-sitter parsers are installed for R.nvim
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'r', 'rnoweb', 'markdown', 'yaml' },
  highlight = { enable = true },
}

-- R.nvim setup
require('r').setup {
  R_cmd = 'R', -- Change to "radian" if you prefer
  R_args = { '--no-save', '--no-restore', '--quiet' },
  min_editor_width = 72, -- minimum width for editor window
  rconsole_width = 78, -- width of R console window
}

local r = require 'r'

-- Keymaps for common R commands
local function map(lhs, rhs)
  vim.keymap.set('n', lhs, rhs, { silent = true, noremap = true })
end

map('<LocalLeader>rx', function()
  r.send_line 'roxygen2::roxygenise()'
end)

map('<LocalLeader>in', function()
  r.send_line [[
try(detach(paste0('package:', pkgload::pkg_name()), unload = TRUE, character.only = TRUE));
devtools::install();
library(pkgload::pkg_name(), character.only = TRUE)
]]
end)

map('<LocalLeader>lo', function()
  r.send_line 'devtools::load_all()'
end)

map('<LocalLeader>hh', function()
  r.send_line 'setwd(here::here())'
end)

-- Restart R session (just quit, next send_line will reopen console)
map('<LocalLeader>RR', function()
  r.send_line 'q()'
end)

-- Disable formatting for r_language_server if using another formatter (like 'air')
require('lspconfig').r_language_server.setup {
  on_attach = function(client, _)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}
