return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require("lspconfig").lua_ls.setup { capabilites = capabilities }
      require("lspconfig").pyright.setup { capabilities = capabilities }
      require("lspconfig").cssls.setup { capabilities = capabilities }
      require("lspconfig").clangd.setup { capabilities = capabilities }
      require("lspconfig").eslint.setup { capabilities = capabilities }
      require("lspconfig").gopls.setup { capabilities = capabilities }
      require("lspconfig").rust_analyzer.setup {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
          },
        },
      }
      require("lspconfig").cmake.setup { capabilities = capabilities }

      require('lspconfig').elixirls.setup({
        cmd = { "/opt/homebrew/bin/elixir-ls" },
        capabilities = capabilities,
        settings = {
          elixirLS = {
            dialyzerEnabled = false,
            fetchDeps = false,
            suggestSpecs = false, -- Disable if you don't want spec suggestions
          }
        },
      })



      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then return end

          if vim.bo.filetype == "cpp" or vim.bo.filetype == "lua" or vim.bo.filetype == "python" or vim.bo.filetype == "rust" or vim.bo.filetype == "elixir" or vim.bo.filetype == "go" or vim.bo.filetype == "css" or vim.bo.filetype == "javascript" then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
              end,
            })
          end
        end,
      })
    end,
  }
}
