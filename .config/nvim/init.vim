
"    ##############..... ##############   
"    ##############......##############   
"      ##########..........##########     
"      ##########........##########       
"      ##########.......##########        
"      ##########.....##########..        
"      ##########....##########.....      
"    ..##########..##########.........    
"  ....##########.#########.............  
"    ..################JJJ............    
"      ################.............      
"      ##############.JJJ.JJJJJJJJJJ      
"      ############...JJ...JJ..JJ  JJ     
"      ##########....JJ...JJ..JJ  JJ      
"      ########......JJJ..JJJ JJJ JJJ     
"      ######    .........                
"                  .....                  
"                    .                    

" vim-plug
call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion
    Plug 'itchyny/lightline.vim' " Cooler bar
    Plug 'airblade/vim-gitgutter', {'on': 'GitGutterEnable'} " Git integration
    Plug 'flrnd/plastic.vim' " Color scheme
    Plug 'ap/vim-css-color' " Color code highlighting
    Plug 'preservim/nerdtree' " File explorer
    Plug 'tmsvg/pear-tree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'lambdalisue/suda.vim' " Sudo write to files
    Plug 'lervag/vimtex'
call plug#end()

set magic
set autoindent
set nu
set softtabstop=4
set shiftwidth=4
set tabstop=4
set smarttab
set smartindent
set undolevels=1000
set smartcase
set number
set mouse=a
set termguicolors
set encoding=utf-8
set visualbell
set noshowmode
set clipboard=unnamedplus
colorscheme plastic

" Clear background for various elements
hi Normal guibg=NONE ctermbg=NONE
hi LineNr ctermbg=NONE guibg=NONE

" Coc bindings
inoremap <silent><expr> <c-space> coc#refresh()

" Add keybinds to move lines using Alt+Up/Down
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up> <Esc>:m .-2<CR>==gi
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv

" Allow :Wq and :W
command W :execute ':SudaWrite'
command Wq :execute ':W' | :q

" Set variables
let g:lightline = {"colorscheme": "deus"}
let g:coc_global_extensions = ['coc-prettier', 'coc-tsserver', 'coc-solargraph', 'coc-sh', 'coc-pyright', 'coc-json', 'coc-html', 'coc-css', 'coc-cmake', 'coc-clangd', 'coc-emmet', 'coc-vimtex', 'coc-tabnine']

" Stop deselection on indention
vnoremap < <gv
vnoremap > >gv

map <C-b> :NERDTreeToggle<CR>
map <C-i> :CocCommand prettier.formatFile<CR>

augroup configgroup
	autocmd FileType ruby setlocal shiftwidth=4
augroup END

