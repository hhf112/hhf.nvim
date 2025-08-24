local builtin = require("telescope.builtin")
-- Reset Telescope highlights to normal/transparent
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE", fg = nil })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE", fg = nil })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE", fg = nil })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "NONE", fg = nil })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "NONE", fg = nil })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "NONE", fg = nil })


---CUSTOM KEYBINDS
vim.keymap.set("n", "<space>fd", builtin.find_files)
vim.keymap.set("n", "<space>fht", builtin.help_tags)
vim.keymap.set("n", "<space>fc",
  function()
    local opts = require('telescope.themes').get_ivy({
      cwd = vim.fn.stdpath("config")
    })
    builtin.find_files(opts)
  end
)
vim.keymap.set("n", "<space>fh",
  function()
    local opts = require('telescope.themes').get_dropdown({
      cwd = "/home/hrsh/squashfs-root/usr/share/nvim/runtime"
    })
    builtin.find_files(opts)
  end
)

--CONFIG
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "^./node_modules/",
    },
  },
  pickers = {
    -- default is the best
    -- find_files = {
    --   theme = "dropdown",
    -- },

  },
  extensions = {
    fzf = {}
  }
}

require('telescope').load_extension('fzf');
