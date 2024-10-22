local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- ensure_installed = { "bashls", "jdtls", "pyright" },
  ensure_installed = { "bashls", "pyright" },
  handlers = {
    lsp_zero.default_setup,
    -- jdtls = lsp_zero.noop, -- nvim-jdtls to start up jdtls (more functionality)
  },
})
