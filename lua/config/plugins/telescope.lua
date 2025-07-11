return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
      }
    },
    config = function()
      require('telescope').setup {
        pickers =
        {
          find_files = {
            theme = "ivy"
          }
        },
        extentions = {
          fzf = {}
        }
      }
      require('telescope').load_extension('fzf')
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<space>pf", builtin.find_files)
      vim.keymap.set("n", "<space>ps", builtin.live_grep)
      vim.keymap.set("n", "<space>ht", builtin.help_tags)
      vim.keymap.set("n", "<space>en", function()
        builtin.find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)
      vim.keymap.set("n", "<space>ep", function()
        builtin.find_files {
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        }
      end)
      require "config.telescope.multigrep".setup()
    end
  }
}
