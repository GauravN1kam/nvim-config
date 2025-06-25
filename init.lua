require("config.lazy")
-- require("gaurav.remap")

vim.keymap.set("n", "<space>example", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 5)
end)
