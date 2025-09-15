vim.g.terminal_emulator='nu'
vim.o.clipboard = 'unnamed'
vim.o.relativenumber = true
vim.o.number = true
 
vim.lsp.enable('basedpyright')
 
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
