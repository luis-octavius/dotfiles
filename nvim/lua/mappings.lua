require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- ~/.config/nvim/lua/mappings.lua
local M = {}

M.general = {
  n = {
    -- Navegação entre buffers
    ["<C-h>"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
    ["<C-l>"] = { "<cmd> NvimTreeClose <CR>", "Close nvimtree" },

    -- LSP
    ["<leader>lr"] = { "<cmd> LspRestart <CR>", "Restart LSP" },
    ["<leader>li"] = { "<cmd> LspInfo <CR>", "LSP Info" },
  },
}

-- Mapeamentos específicos para LSP
M.lspconfig = {
  n = {
    ["gd"] = { "<cmd> Telescope lsp_definitions <CR>", "Go to definition" },
    ["gD"] = { "<cmd> Telescope lsp_declarations <CR>", "Go to declaration" },
    ["gr"] = { "<cmd> Telescope lsp_references <CR>", "Find references" },
    ["gi"] = { "<cmd> Telescope lsp_implementations <CR>", "Go to implementation" },
    ["K"] = { vim.lsp.buf.hover, "Show documentation" },
    ["<leader>ca"] = { vim.lsp.buf.code_action, "Code action" },
    ["<leader>rn"] = { vim.lsp.buf.rename, "Rename" },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "Format buffer",
    },
  },
}

-- Mapeamentos para Go específico (se usar go.nvim)
M.go = {
  n = {
    ["<leader>gt"] = { "<cmd> GoTest <CR>", "Run Go test" },
    ["<leader>gT"] = { "<cmd> GoTestFunc <CR>", "Run Go test for function" },
    ["<leader>gb"] = { "<cmd> GoBuild <CR>", "Build Go project" },
    ["<leader>gr"] = { "<cmd> GoRun <CR>", "Run Go file" },
  },
}

return M
