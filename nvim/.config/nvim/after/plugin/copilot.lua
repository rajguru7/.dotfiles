vim.cmd("silent! Copilot disable")
vim.keymap.set('i', '<M-f>', '<Plug>(copilot-accept-word)')
vim.keymap.set('i', '<C-e>', '<Plug>(copilot-accept-line)')
vim.api.nvim_set_keymap('n', '<leader>ce', ':Copilot enable<CR>', { noremap = true, silent = true })
