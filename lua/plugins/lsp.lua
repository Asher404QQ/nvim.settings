return {
  { "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Global
      vim.lsp.config('*', {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
      })

      -- LUA LS
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            workspace = {
              preloadFileSize = 10000,
              library = {
                vim.env.VIMRUNTIME,
              }
            },
          },
        },
      })
      vim.lsp.enable("lua_ls")

      -- CLANGD
      vim.lsp.enable('clangd')

      -- SQL
      vim.lsp.enable('sqls')

      -- GO
      vim.lsp.config("gopls", {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        settings = {
          gopls = {
            -- gofumpt = true,
            -- formatTool = "goimports",
            semanticTokens = true,
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            }
          }
        }
      })
      vim.lsp.enable('gopls')
      -- vim.lsp.start({
      --   cmd = { "gopls" },
      --   name = "gopls",
      --   -- root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      --   root_dir = vim.uv.cwd()
      -- }, { attach = true })
    end
  },
  {
    'nanotee/sqls.nvim',
  },
}
