vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

--remove windows carriage return on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd("silent! %s/\r//g")
  end,
})

vim.opt.relativenumber = false
vim.opt.swapfile = false
-- COPILOT OVERRIDE
-- restore literal <Esc> behavior in Insert and Select modes
vim.keymap.set('i', '<Esc>', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('s', '<Esc>', '<Esc>', { noremap = true, silent = true })

vim.keymap.set({"n", "t"}, "<leader>tv", "<cmd>ToggleTerm direction=vertical size=40<CR>", { desc = "Toggle vertical terminal (80 columns)" })

vim.keymap.set('n', '<C-\\>', '<>ToggleTerm size=40 dir=' .. vim.fn.getcwd() .. ' direction=horizontal name=somethingelse', { noremap = true, silent = true })


---CONVINIENCE
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Q', 'q', {})
vim.opt.termguicolors = true


-- --FLOATERMINAL KEYBINDS
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true })
local toggleTerminal = require("plugins.floaterminal")
vim.api.nvim_create_user_command("Floaterminal", toggleTerminal, {})
vim.keymap.set({ "t", "n" }, "<Space>tr", toggleTerminal, { noremap = true })


--OIL
vim.keymap.set("n", "<C-O>", function()
  vim.cmd("Oil")
  vim.api.nvim_feedkeys("_", "n", false) --directory of current buffer
end, { noremap = true })
