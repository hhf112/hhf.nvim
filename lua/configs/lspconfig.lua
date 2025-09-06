require("nvchad.configs.lspconfig").defaults()
local servers = {
  "html",
  "cssls",
  "clangd",
  "clang-format",
  "rust-analyzer",
  "codelldb",
  "ts_ls",
  "pyright",
  "gopls",
  "tailwindcss",
}

vim.lsp.config("clangd", {
  cmd = {
    -- see clangd --help-hidden
    "clangd",
    "--background-index",
    -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
    -- to add more checks, create .clang-tidy file in the root directory
    -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
    "--clang-tidy",
  },
  init_options = {
    fallbackFlags = { "-std=c++23" },
  },
})

vim.lsp.config("ts_ls", {
  init_options = {
    cmd = { "typescript-language-server", "--stdio" },
    preferences = {
      disableSuggestions = true,
    },
  },
})

vim.lsp.config("rust-analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = false,
      },
    },
  },
})

vim.lsp.enable(servers)
