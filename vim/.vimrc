set number
set relativenumber
syntax on
set mouse=a
set clipboard=unnamed
set ruler
"set shellpipe=2>&1
autocmd filetype markdown set backupcopy=yes "To stop the deleting renaming of original file for mkdocs to work properly

"searching options
set hls
set is
"-----------------

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

"To make scripts executable
nnoremap <leader>x :!chmod +x %<CR>

autocmd filetype c nnoremap <F9> :w <bar> !gcc -Wall % -o %:r<CR>
autocmd filetype c nnoremap <F10> :!./%:r<CR>
autocmd filetype c nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

autocmd filetype go nnoremap <F10> :!./fuzzer_run.sh<CR>
autocmd filetype go nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

autocmd filetype java nnoremap <F9> :w <bar> !javac %<CR>
autocmd filetype java nnoremap <F10> :!java %:r<CR>

"below lines saves .md files automatically for real time changes in
"Marked app. Also a new shortcut has been added to Keyboard shortcuts in
"Mac <ctrl><cmd>H to tile all windows to left
autocmd TextChanged,TextChangedI *.md silent write
autocmd filetype markdown nnoremap <F10> :MarkedToggle!<CR>

nmap <F7> :tabp<CR>
nmap <F8> :tabn<CR>


"plugin options
call plug#begin()

"syntax highlighting for solidity
"Plug 'tomlion/vim-solidity'	

"better status line
"Plug 'vim-airline/vim-airline'	

"for using Marked2 to read markdown files (Mac specific)
Plug 'itspriddle/vim-marked', {'for': 'markdown'}

call plug#end()
"-----------------
