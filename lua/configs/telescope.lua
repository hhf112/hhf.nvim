-- Reset Telescope highlights to normal/transparent
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE", fg = nil })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE", fg = nil })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE", fg = nil })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "NONE", fg = nil })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "NONE", fg = nil })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "NONE", fg = nil })

--CONFIG
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules/.*",
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
