" Basic Keybinds
" ================

"   Set <leader> to ','.
    let mapleader = ","

"   Navigate windows with ',m[w|a|s|d]'
    map <leader>mw <C-w><Up>
    map <leader>ma <C-w>h
    map <leader>ms <C-w><Down>
    map <leader>md <C-w>l


" Plugins (using vim-plug)
"   :PlugUpdate to install or update plugins.
"   :PlugUpgrade upgrade vim-plug itself.
" ========================
call plug#begin('~/.config/nvim/plugged')

"     Aesthetics
"     ==========
"         Solarized theme.
          Plug 'altercation/vim-colors-solarized'
  
"         Status line.
          Plug 'vim-airline/vim-airline'
  
"         Solarized status line.
          Plug 'vim-airline/vim-airline-themes'

"     Functionality
"     =============
"         Easily split a line and join multiple lines.
"           gS - split line.
"           gJ - join multiple lines. 
          Plug 'AndrewRadev/splitjoin.vim'

"         Full path fuzzy search.
"         ,p
"         Keybinds below.
          Plug 'ctrlpvim/ctrlp.vim'
          map <leader>p <C-p>

"         Align a block around some chosen character.
"         * vipga2= => align v-selected paragraph around second '='.
"         * gaip2=  => same without v-select.
          Plug 'junegunn/vim-easy-align'

"         File system explorer.
          Plug 'scrooloose/nerdtree'

"         Comment and uncomment stuff.
"         <leader>cc to comment.
"         <leader>cu to uncomment.
          Plug 'scrooloose/nerdcommenter'

"         Comment and uncomment stuff.
          Plug 'SirVer/ultisnips'

  Plug 'shougo/deoplete.nvim'
  Plug 'tpope/vim-fugitive'

call plug#end()

" General keybinds
" ================

" Use tab to cycle through auto-complete suggestions
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"


" Open vimrc in a in vertical split
map <leader>vm :vsp $MYVIMRC<CR>

" Reload the vimrc
map <leader>vs :source $MYVIMRC<CR>

" So we can save on running builds
set autowrite

" Navigate errors
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Easy align
" ==========

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" NERDTree
" ========

" Open if no file is givem
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Deoplete
" ========

let g:deoplete#enable_at_startup = 1

" Use omni_patterns for go files
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" Airline theme
" =============

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Ultisnips
" =============

let g:UltiSnipsExpandTrigger="<enter>"

" Local config
" =============
source ~/.config/nvim/local.vim
