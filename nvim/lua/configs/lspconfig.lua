-- ~/.config/nvim/lua/configs/lspconfig.lua
require("nvchad.configs.lspconfig").defaults()

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
