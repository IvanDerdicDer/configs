vim.cmd([[
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
filetype plugin on
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" Press i to enter insert mode, and ii to exit insert mode.
" :inoremap ii <Esc>
]])

vim.o.number = true -- Enable line numbers
vim.o.relativenumber = true -- Enable relative line numbers
vim.o.tabstop = 4 -- Number of spaces a tab represents
vim.o.shiftwidth = 4 -- Number of spaces for each indentation
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.smartindent = true -- Automatically indent new lines
vim.o.wrap = false -- Disable line wrapping
vim.o.cursorline = true -- Highlight the current line
vim.o.termguicolors = true -- Enable 24-bit RGB colors
vim.o.wildmode = 'longest,full' 
vim.o.cc = '120'
vim.o.clipboard = 'unnamedplus'
vim.o.spell = true

vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}

vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true;
      },
      inlayHints = {
        parameterHints = { enable = true },
        typeHints = { enable = true }
      }
    }
  }
})
vim.lsp.enable('rust_analyzer')
vim.lsp.config('texlab', {
    settings = {
        texlab = {
          build = {
            executable = 'tectonic',
            args = {
                '-X',
                'compile',
                '%f',
                '--synctex',
                '--keep-logs',
                '--keep-intermediates',
            },
            onSave = true,
            forwardSearchAfter = false,
          },
          forwardSearch = {
            executable = 'okular',
            args = { '--unique', 'file:%p#src:%l%f' },
          },
          chktex = {
            onOpenAndSave = true,
            onEdit = true,
          },
	    },
    },
})
vim.lsp.enable('texlab')
vim.lsp.enable('ltex')
vim.lsp.enable('mojo')

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

vim.g.mapleader = ' '

vim.keymap.set(
    {'n', 'v'},
	'<leader>l',
	function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end,
	{
		desc = 'Toggle inlay hints'
	}
)