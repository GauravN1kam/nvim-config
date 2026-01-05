require("config.lazy")
-- require("gaurav.remap")

vim.keymap.set("n", "<space>example", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 5)
end)

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.keymap.set("n", "<space><space>x", ":source %<CR>")

vim.keymap.set("n", "<space>to", ":tabnew<CR>")   -- open new tab
vim.keymap.set("n", "<space>tx", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<space>tn", ":tabn<CR>")     --  go to next tab
vim.keymap.set("n", "<space>tp", ":tabp<CR>")     --  go to previous tab
vim.keymap.set("n", "<space>ex", ":Ex<CR>")       -- go to files

vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
vim.api.nvim_set_hl(0, "TabLine", { bg = "None" })


function ToggleBackground(toggleBack)
  if toggleBack == false then
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
  if toggleBack == true then
    vim.api.nvim_set_hl(0, "Normal", { bg = "#111111" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#111111" })
  end
end

-- vim.cmd [[guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]]
-- vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"


vim.cmd [[highlight LineNr guibg=NONE ctermbg=NONE]]
vim.o.termguicolors = true
--   virtual_text = {
--     prefix = "●", -- or "■", "▶", "", etc.
--     spacing = 4,
--   },
--   signs = true,
--   underline = true,
--   update_in_insert = true,
--   severity_sort = true,
--   float = {
--     border = "rounded",
--     source = true, -- Or "if_many"
--     header = "",
--     prefix = "",
--   },
-- })
