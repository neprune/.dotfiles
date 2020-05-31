call plug#begin('~/.config/nvim/plugged')

" Aesthetics
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Functionality
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'shougo/deoplete.nvim'
Plug 'tpope/vim-fugitive'

call plug#end()

" General keybinds
" ================

let mapleader = ","

" Use tab to cycle through auto-complete suggestions
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" Make ctrl+p less akward
map <leader>p <C-p>

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

" Go
" ==

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

let g:go_metalinter_autosave = 1
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1

autocmd FileType go nmap <leader>b  :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>T  <Plug>(go-test-func)
autocmd FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>f  :GoDecls<CR>
autocmd FileType go nmap <Leader>F  :GoDeclsDir<CR>
autocmd FileType go nmap <Leader>d  :GoDef<CR>
autocmd FileType go nmap <Leader>D  :GoDefPop<CR>

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

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

" Ultisnips
" =============

let g:UltiSnipsExpandTrigger="<enter>"

" Local config
" =============
source ~/.config/nvim/local.vim
