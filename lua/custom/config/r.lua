-- Configure Nvim-R
vim.g.R_app = 'radian'
vim.g.R_cmd = 'R'
vim.g.R_hl_term = 0
vim.g.R_args = { '--no-save', '--no-restore', '--quiet' }
vim.g.R_bracketed_paste = 1
vim.g.R_rmdchunk = 0

vim.cmd [[
" map <silent> <leader> :call g:SendCmdToR("roxygen::roxygenise()")<CR>
map <silent> <LocalLeader>rx :call g:SendCmdToR("roxygen2::roxygenise()")<CR>
" map <silent> <LocalLeader>in :call g:SendCmdToR("devtools::install()")<CR>
map <silent> <LocalLeader>in :call g:SendCmdToR("try(detach(paste0(\'package:\', pkgload::pkg_name()), unload = TRUE, character.only = TRUE)) ; devtools::install() ; library(pkgload::pkg_name(), character.only = TRUE)")<CR>
map <silent> <LocalLeader>lo :call g:SendCmdToR("devtools::load_all()")<CR>
map <silent> <LocalLeader>hh :call g:SendCmdToR("setwd(here::here())")<CR>

  " This will close/open R depending on the state
map <silent> <LocalLeader>RR :call SendCmdToR("q()")<CR>:call StartR("R")<CR>

" Autostart R when .R is loaded
let R_auto_start = 1

" Automatically rearrange windows
let R_after_ob_open = [':wincmd l', ':wincmd L', ':wincmd l']

" Disable automatic transformation of _ into <-.
let R_assign = 0
]]

-- Notes:
-- Install r-languageserver with Mason

-- Bits commented out:
-- " Autostart object browswer when .R is loaded
-- let R_objbr_auto_start = 1
-- " Automatically rearrange windows
-- let R_after_ob_open = [':wincmd l', ':wincmd L', ':Neotree', ':wincmd l']
