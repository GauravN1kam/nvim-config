-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.runtimepath:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim

require("lazy").setup({
  spec = {
    {
      "bluz71/vim-moonfly-colors",
      name = "moonfly",
      lazy = false,
      priority = 1000,
      -- config = function()
      --   vim.cmd
      --       .colorscheme "moonfly"
      -- end
    },
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
      config = function()
        vim.cmd
            .colorscheme "tokyonight"
      end
    },
    {
      "navarasu/onedark.nvim",
      name = "onedark",
      lazy = false,
      priority = 1000,
      -- config = function()
      --   require("onedark").setup {
      --     style = 'darker'
      --   }
      --   require("onedark").laod()
      -- end
    },
    {
      "scottmckendry/cyberdream.nvim",
      lazy = false,
      name = "cyber",
      priority = 1000,
      -- config = function()
      --   require('cyberdream').load()
      -- end
    },
    { import = "config.plugins" }


  }
})
