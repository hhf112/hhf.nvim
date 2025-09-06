require "nvchad.autocmds"

-- faster for accidental mistype
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Q', 'q', {})

-- remove windows carriager returns on copy-pasting
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd("silent! %s/\r//g")
  end,
})

