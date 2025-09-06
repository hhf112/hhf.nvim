-- these mappings are loaded on startup. Any lazy-loaded plugin mappings should not be included here.

require "nvchad.mappings"

-- miscellenous {
vim.keymap.set("n", "<leader>e", function()
  vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Show diagnostic popup" })
-- }

--util {
  --floaterminal { 
  vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true })
  local toggleTerminal = require "util.floaterminal"
  vim.api.nvim_create_user_command("Floaterminal", toggleTerminal, {})
  vim.keymap.set({ "t", "n" }, "<Space>tr", toggleTerminal, { noremap = true })
  -- }
-- }

-- telescope {
local builtin = require("telescope.builtin")
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
--}

--oil {
vim.keymap.set("n", "<C-O>", function()
  vim.cmd "Oil"
  vim.api.nvim_feedkeys("_", "n", false) --directory of current buffer
end, { noremap = true })
-- }

-- copilot {
-- restore literal <Esc> behavior in Insert and Select modes
vim.keymap.set("i", "<Esc>", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("s", "<Esc>", "<Esc>", { noremap = true, silent = true })
 -- }

-- toggleterm {
vim.keymap.set(
  { "n", "t" },
  "<leader>tv",
  "<cmd>ToggleTerm direction=vertical size=40<CR>",
  { desc = "Toggle vertical terminal (80 columns)" }
)

vim.keymap.set(
  "n",
  "<C-\\>",
  "<>ToggleTerm size=40 dir=" .. vim.fn.getcwd() .. " direction=horizontal name=somethingelse",
  { noremap = true, silent = true }
)
 -- }

-- nvim-dap {
vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
vim.keymap.set("i", "jk", "<ESC>")

local opts = { noremap = true, silent = true }
vim.keymap.set(
  "n",
  "<leader>db",
  "<cmd>DapToggleBreakpoint<CR>",
  vim.tbl_extend("force", opts, { desc = "DAP: Toggle breakpoint" })
)
vim.keymap.set(
  "n",
  "<leader>dr",
  "<cmd>DapContinue<CR>",
  vim.tbl_extend("force", opts, { desc = "DAP: Continue / Start debugger" })
)
-- vim.keymap.set("n", "<leader>ds", "<cmd>DapStepOver<CR>", vim.tbl_extend("force", opts, { desc = "DAP: Step over" }))
-- vim.keymap.set("n", "<leader>di", "<cmd>DapStepInto<CR>", vim.tbl_extend("force", opts, { desc = "DAP: Step into" }))
-- vim.keymap.set("n", "<leader>do", "<cmd>DapStepOut<CR>", vim.tbl_extend("force", opts, { desc = "DAP: Step out" }))
-- vim.keymap.set("n", "<leader>dt", "<cmd>DapTerminate<CR>", vim.tbl_extend("force", opts, { desc = "DAP: Terminate" }))

-- vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- }
