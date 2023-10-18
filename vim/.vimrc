set number
set relativenumber
syntax on
set mouse=a
set clipboard=unnamed
set ruler
set colorcolumn=80
highlight ColorColumn ctermbg=234 
"set shellpipe=2>&1
"To stop the deleting renaming of original file for mkdocs to work properly
autocmd filetype markdown set backupcopy=yes 

"scrolling options
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

"searching options
set nohls
set is
"-----------------

"netrw options
let g:netrw_winsize = 25


"wrap options
set wrap
set linebreak
set showbreak=--->
"set breakindent
"-----------------

"indentation options
set si
set tabstop=4
set shiftwidth=4
set expandtab "expand tab press to spaces
"-----------------

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {} {}
inoremap {{ {

"For moving lines up and down with indenting
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

let mapleader = " "
"To make scripts executable
nnoremap <leader>x :!chmod +x %<CR>
"To source files
nnoremap <leader><CR> :so %<CR>
"To open file explorer
nnoremap <leader>pv :Vex<CR>

au BufRead,BufNewFile *.r2py set filetype=python
autocmd filetype c nnoremap <F9> :w <bar> !gcc -Wall % -o %:r<CR>
autocmd filetype c nnoremap <F10> :!./%:r<CR>
autocmd filetype c nnoremap 
            \ <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

autocmd filetype go nnoremap <F10> :!./fuzzer_run.sh<CR>
autocmd filetype go nnoremap 
            \ <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

autocmd filetype java nnoremap <F9> :w <bar> !javac %<CR>
autocmd filetype java nnoremap <F10> :!java %:r<CR>

"below lines saves .md files automatically for real time changes in
"Marked app. Also a new shortcut has been added to Keyboard shortcuts in
"Mac <ctrl><cmd>H to tile all windows to left
"autocmd TextChanged,TextChangedI *.md silent write
"autocmd filetype markdown nnoremap <F10> :MarkedToggle!<CR>
"Using map expression below to exhibit different behaviour for visual line and
"visual/visual block mode Refer:
"https://vi.stackexchange.com/questions/9276/how-can-i-create-a-mapping-only-in
"-plain-visual-mode

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


autocmd filetype 
    \ markdown vnoremap 
    \ <expr> <leader>b mode() ==# "v" ? "di**<Esc>gpi**<Esc>" : 'dO**<C-r>"<BS>**<Esc>'
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call Math()


nmap <F7> :tabp<CR>
nmap <F8> :tabn<CR>


"plugin options
call plug#begin()

"fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"git wrapper
Plug 'tpope/vim-fugitive'

"for aligning (I am using it for help with md tables)
Plug 'junegunn/vim-easy-align'

"syntax highlighting for solidity
"Plug 'tomlion/vim-solidity'	

"better status line
"Plug 'vim-airline/vim-airline'	

"for using Marked2 to read markdown files (Mac specific)
"Plug 'itspriddle/vim-marked', {'for': 'markdown'}

call plug#end()
"-----------------

"call mkdx#configure({ 'enter': { 'enable': 1, 'shift': 0, 'o': 1,
"                    'shifto': 1, 'malformed': 0 },
"                  \   'tab': { 'enable': 0 }, 
"                  \   'table': { 'align': { 'default': 'left' }}})

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
