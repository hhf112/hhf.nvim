require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local opts = { noremap = true, silent = true }

map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", vim.tbl_extend("force", opts, { desc = "DAP: Toggle breakpoint" }))
map("n", "<leader>dr", "<cmd>DapContinue<CR>", vim.tbl_extend("force", opts, { desc = "DAP: Continue / Start debugger" }))

-- optional: you can add more dap mappings if you want
-- map("n", "<leader>ds", "<cmd>DapStepOver<CR>", vim.tbl_extend("force", opts, { desc = "DAP: Step over" }))
-- map("n", "<leader>di", "<cmd>DapStepInto<CR>", vim.tbl_extend("force", opts, { desc = "DAP: Step into" }))
-- map("n", "<leader>do", "<cmd>DapStepOut<CR>", vim.tbl_extend("force", opts, { desc = "DAP: Step out" }))
-- map("n", "<leader>dt", "<cmd>DapTerminate<CR>", vim.tbl_extend("force", opts, { desc = "DAP: Terminate" }))

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
