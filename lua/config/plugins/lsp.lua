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
          -- servers = {
          --   lua_ls = {},
          --   rust_analyzer = {
          --     cargo = { allFeatures = true },
          --     checkOnSave = { command = "clippy" }
          --   }
          -- }
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require('blink.cmp').setup({
        sources = {
          default = { "lsp", "path", "snippets", "buffer" }
        }
      })
      require("lspconfig").lua_ls.setup { capabilites = capabilities }
      vim.lsp.enable('pyright')
      require("lspconfig").pyright.setup { capabilities = capabilities }
      vim.lsp.enable('rust_analyzer')
      require("lspconfig").rust_analyzer.setup {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      }

      vim.lsp.enable('csharp_ls')
      -- local pid = vim.fn.getpid()
      -- vim.lsp.enable('omnisharp')
      -- vim.lsp.enable('c_sharp')
      -- require("lspconfig").omnisharp.setup {
      --   cmd = {
      --     "C:/DEV/Plugins/omnisharp/omnisharp.http-win-x64-net6.0/OmniSharp.exe", "--languageserver", "--hostPID", tostring(pid)
      --   },
      --   capabilities = capabilities,
      --   on_attach = function(client, bufnr)
      --     if client.name == "omnisharp" then
      --       client.server_capabilities.semanticTokensProvider = nil
      --     end
      --   end,
      --   root_dir = require('lspconfig').util.root_pattern("*.sln", ".git", "AssemblyInfo.cs", "*.csproj"),
      --   handlers = {
      --     ["textDocument/definition"] = require('omnisharp_extended').handler,
      --   },
      -- }
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then return end

          if vim.bo.filetype == "lua" or vim.bo.filetype == "python" or vim.bo.filetype == "rust" then
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
