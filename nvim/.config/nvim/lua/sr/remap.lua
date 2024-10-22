vim.g.mapleader = " "

-- To open file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- For moving lines up and down with indenting (doesn't take away visual K use)
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("x", "K", [[mode() ==# "V" ? ":m '<-2<CR>gv=gv" : "K"]], { expr = true, noremap = true })

vim.keymap.set("n", "J", "mzJ`z")

-- create file under cursor if doesn't exist
vim.keymap.set("n", "<leader>gf", "<cmd>e <cfile><CR>")

-- scrolling options
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- To make scripts executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- To source files
vim.keymap.set("n", "<leader><CR>", "<cmd>so %<CR>", { silent = true })

-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<C-f>", "<cmd>!tmux neww tmux-sessionizer.bash<CR>")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- remap for test and submit shortcut in leetcode-cli. Reference chatgpt
vim.api.nvim_exec([[
  augroup DirectoryMappings
    autocmd!
    autocmd BufEnter * lua map_leetcode_dir_keys()
  augroup END
]], false)

function map_leetcode_dir_keys()
  local current_directory = vim.fn.expand('%:p:h')

  if current_directory:match('/.leetcode/code$') then
    -- Your mapping for the 'example' directory goes here
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>\'', [[:execute "!leetcode test " . split(expand("%:t:r"), '\.')[0]<CR>]], { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader><CR>', [[:execute "!leetcode exec " . split(expand("%:t:r"), '\.')[0]<CR>]], { noremap = true, silent = true })
  end
end

------
