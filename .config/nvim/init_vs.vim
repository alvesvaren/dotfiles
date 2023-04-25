command! Nu call VSCodeNotify('extension.toggle') " This is above extension command, assuming you configured it to toggle relative/non-relative line numbers
AlterCommand nu Nu
AlterCommand rnu Nu

set magic
set autoindent
set nu
set softtabstop=4
set undolevels=1000
set shiftwidth=4
set smarttab
set smartindent
set smartcase
set number
set mouse=a
set termguicolors
set encoding=utf-8
set visualbell
set noshowmode
set clipboard=unnamedplus