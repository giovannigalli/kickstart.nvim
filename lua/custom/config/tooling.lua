-- Use native tools on NixOS and let Mason manage them elsewhere.

local mason_tool_installer = require 'mason-tool-installer'

if vim.fn.filereadable('/etc/NIXOS') == 1 then
  local mason_bin = vim.fs.normalize(vim.fs.joinpath(vim.fn.stdpath 'data', 'mason', 'bin'))
  local path = vim.split(vim.env.PATH or '', ':', { plain = true, trimempty = true })

  vim.env.PATH = table.concat(vim.tbl_filter(function(entry) return vim.fs.normalize(entry) ~= mason_bin end, path), ':')
  mason_tool_installer.setup { run_on_start = false }
  return
end

mason_tool_installer.setup {
  ensure_installed = {
    'lua-language-server',
    'stylua',
    'black',
    'isort',
    'air',
    'prettier',
  },
}
