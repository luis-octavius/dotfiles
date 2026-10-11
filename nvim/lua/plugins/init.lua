-- ~/.config/nvim/lua/plugins/init.lua
return {
  -- Mason
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {},
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "lua-language-server",
        "gopls",
        "pyright",
        "prettier",
        "stylua",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)

      -- Adicionar Mason ao PATH
      local mason_path = vim.fn.stdpath "data" .. "/mason/bin"
      vim.env.PATH = mason_path .. ":" .. vim.env.PATH
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "go",
        "python",
        "javascript",
        "typescript",
        "html",
        "css",
        "rust",
        "toml"
      },
      auto_install = true,
      highlight = { enable = true },
    },
  },

  -- rust
  {
    "mrcjkb/rustaceanvim",
    lazy = false, -- o plugin já faz lazy loading por conta própria
    init = function()
      vim.g.rustaceanvim = function()
        local nvlsp = require "nvchad.configs.lspconfig"
        return {
          server = {
          on_attach = nvlsp.on_attach,
          capabilities = nvlsp.capabilities,
          default_settings = {
            ["rust-analyzer"] = {
              check = { command = "clippy" }, -- clippy ao salvar, em vez de cargo check
              cargo = { allFeatures = true },
            },
          },
        },
      }
      end
    end,
  },

  {
    "saecki/crates.nvim", -- versões e features de dependências no Cargo.toml
    event = { "BufRead Cargo.toml" },
    opts = {},
  },
}
