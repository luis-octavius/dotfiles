-- ~/.config/nvim/lua/configs/lspconfig.lua
local M = {}
local utils = require "nvchad.configs.lspconfig.utils"
-- local nvchad_lsp = require "nvchad.configs.lspconfig"

M.on_attach = function(client, bufnr)
  utils.on_attach(client, bufnr)
end
return M
