vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.colorcolumn = "80"
-- when you are mounting files in containers with let's say prometheus.yml in prometheus and thanos
-- vim edits a copy of the file and then renames it to the original file. This breaks the mount
-- as it changes the inode of the file. To prevent this you should make vim backupcopy to 'yes'
-- to allow in place editing of the original file. 
-- Refer https://github.com/moby/moby/issues/15793#issuecomment-135411504

--searching options
vim.opt.hlsearch = false
vim.opt.incsearch = true
-------------------

--netrw options
-- vim.g.netrw_winsize = 25

--wrap options
vim.opt.wrap = false
vim.opt.textwidth = 80
-- vim.opt.linebreak = true
-- vim.opt.showbreak = "--->"
--vim.opt.breakindent
-------------------
  
--indentation options
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true --expand tab press to spaces
-------------------

vim.opt.termguicolors = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true


-- enables pyright to detect the correct python venvs
vim.env.PYENV_VERSION = vim.fn.system('pyenv version'):match('(%S+)%s+%(.-%)')
