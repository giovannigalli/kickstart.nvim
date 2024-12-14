-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  'David-Kunz/jester',
  'tpope/vim-commentary',
  'jalvesaq/Nvim-R',
  'github/copilot.vim',
  'luochen1990/rainbow',

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
}
