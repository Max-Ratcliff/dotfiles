require('options')
require('keymaps')
require('plugins')
require('colorscheme')
require('lsp')

local cmp = require("cmp")

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "path" },
    { name = "cmdline" },
  },
})

vim.o.omnifunc = "v:lua.vim.lsp.omnifunc"
cmp.setup.cmdline("/", {
  sources = { { name = "buffer" } },
})


