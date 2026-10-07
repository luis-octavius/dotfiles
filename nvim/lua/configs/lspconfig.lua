-- ~/.config/nvim/lua/configs/lspconfig.lua
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

vim.lsp.config("gopls", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    gopls = {
      semanticTokens = false,
      completeUnimported = true,
      usePlaceholders = true,
      matcher = "Fuzzy",
    },
  },
})

vim.lsp.config("ts_ls", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  init_options = {
    preferences = { includeCompletionsForModuleExports = true },
  },
})

local servers = {
  "lua_ls",
  "clangd",
  "html",
  "css",
  "typescript-language-server",
  "gopls",
  "tailwindcss-language-server",
  "docker-language-server",
  "docker-compose-language-server",
}

vim.lsp.enable(servers)
