-- Keep personal configuration outside the upstream Kickstart init.lua.

local termfeatures = vim.g.termfeatures or {}
termfeatures.osc52 = false
vim.g.termfeatures = termfeatures

require 'custom.plugins'
require 'custom.config.formatting'
require 'custom.config.treesitter'
require 'custom.config.r'
require 'custom.config.python'
require 'custom.config.general'
