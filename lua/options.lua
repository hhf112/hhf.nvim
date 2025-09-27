require "nvchad.options"

vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.termguicolors = true

-- Enable true transparency
vim.opt.termguicolors = true
vim.cmd [[hi Normal guibg=none ctermbg=none]]
vim.cmd [[hi NormalNC guibg=none ctermbg=none]] -- for non-current windows

-- Optional: make floating windows transparent
vim.cmd [[hi FloatBorder guibg=none ctermbg=none]]
vim.cmd [[hi NormalFloat guibg=none ctermbg=none]]

-- Optional: tweak popup menu transparency
vim.cmd [[hi Pmenu guibg=none ctermbg=none]]
vim.cmd [[hi PmenuSel guibg=#5f5f87]] -- you can set a slightly darker background if needed

-- Optional: adjust floating window transparency for LSP, telescope, etc.
vim.cmd [[hi TelescopeNormal guibg=none]]
vim.cmd [[hi TelescopeBorder guibg=none]]
