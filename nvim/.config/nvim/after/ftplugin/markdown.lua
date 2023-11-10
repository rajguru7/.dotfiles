-- TODO: convert this to lua
vim.cmd([[
    autocmd filetype markdown setlocal backupcopy=yes 
    function! Math()
        " This gets rid of the nasty _ italic bug in tpope's vim-markdown
        " block $$...$$
        syn region math start=/\$\$/ end=/\$\$/
        " inline math
        syn match math_block '\$[^$].\{-}\$'

        " actually highlight the region we defined as math
        hi link math Statement
        hi link math_block Function
    endfunction
    autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call Math()
]])
vim.keymap.set("x", "<leader>b", [[mode() ==# "v" ? "di**<Esc>gpi**<Esc>" : "dO**<C-r>\"<C-h>**<Esc>"]], { expr = true, noremap = true })
