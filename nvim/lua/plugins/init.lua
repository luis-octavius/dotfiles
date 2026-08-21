-- ~/.config/nvim/lua/plugins/init.lua
return {
  -- Mason
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
      local mason_path = vim.fn.stdpath("data") .. "/mason/bin"
      vim.env.PATH = mason_path .. ":" .. vim.env.PATH
    end,
  },

  -- NOVA CONFIGURAÇÃO: Usando vim.lsp (API nativa do Neovim 0.11)
  {
    "neovim/nvim-lspconfig",
    config = function()
      local nvchad_lsp = require("nvchad.configs.lspconfig")
      
      -- Configuração do TypeScript/JavaScript usando a nova API
      vim.lsp.config('tsserver', {
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/typescript-language-server", "--stdio" },
        filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
        root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
        on_attach = nvchad_lsp.on_attach,
        capabilities = nvchad_lsp.capabilities,
        init_options = {
          preferences = {
            includeCompletionsForModuleExports = true,
          },
        },
      })
      
      -- Configuração do Lua
      vim.lsp.config('lua_ls', {
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
        filetypes = { 'lua' },
        root_markers = { '.luarc.json', '.luacheckrc', '.git' },
        on_attach = nvchad_lsp.on_attach,
        capabilities = nvchad_lsp.capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
            },
          },
        },
      })
      
      -- Configuração do Go
      vim.lsp.config('gopls', {
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/gopls" },
        filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
        root_markers = { 'go.mod', '.git' },
        on_attach = nvchad_lsp.on_attach,
        capabilities = nvchad_lsp.capabilities,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      })
      
      -- Configuração do Python
      vim.lsp.config('pyright', {
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/pyright-langserver", "--stdio" },
        filetypes = { 'python' },
        root_markers = { 'pyproject.toml', 'setup.py', '.git' },
        on_attach = nvchad_lsp.on_attach,
        capabilities = nvchad_lsp.capabilities,
      })
      
      -- Habilitar os servidores
      vim.lsp.enable('tsserver')
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('gopls')
      vim.lsp.enable('pyright')
    end,
  },

  -- Formatters
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "black" },
          go = { "gofumpt", "goimports" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
        },
        format_on_save = true,
      })
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua", "vim", "go", "python", "javascript", "typescript", "html", "css",
      },
      auto_install = true,
      highlight = { enable = true },
    },
  },
}
