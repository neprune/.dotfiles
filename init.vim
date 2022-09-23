" Base Configuration
" ===================

"   Set <leader> to ','.
    let mapleader = ","

"   'jj' to escape.
    imap jj <Esc>

"   Show line numbers...
    set number
"   apart from for terminals.
    autocmd TermOpen * setlocal nonumber norelativenumber

"   Open new vertical splits to the right.
    set splitright

"   Open new horizontal splits below.
    set splitbelow

"   Navigate windows with WASD ',m<direction>'.
    map <leader>mw <C-w><Up>
    map <leader>ma <C-w>h
    map <leader>ms <C-w><Down>
    map <leader>md <C-w>l

"   ',c' to go to next tab.
    nnoremap <leader>f gt
"   ',C' to go to previous tab.
    nnoremap <leader>F gT

"   ',<number>' to go to numbered tab.
    nnoremap <leader>1 1gt
    nnoremap <leader>2 2gt
    nnoremap <leader>3 3gt
    nnoremap <leader>4 4gt
    nnoremap <leader>5 5gt
    nnoremap <leader>6 6gt
    nnoremap <leader>7 7gt
    nnoremap <leader>8 8gt
    nnoremap <leader>9 9gt
    nnoremap <leader>0 :tablast<CR>

"   ',vv' to open the vimrc in a in vertical split.
    map <leader>vv :vsp $MYVIMRC<CR>
"   ',vs' to open the vimrc in a in horizontal split.
    map <leader>vs :sp $MYVIMRC<CR>
"   ',vt' to open the vimrc in a in a new tab.
    map <leader>vt :tabnew $MYVIMRC<CR>
"   ',vr' to reload the vimrc.
    map <leader>vr :source $MYVIMRC<CR>

"   ',tv' to open a terminal in a vertical split.
    map <leader>tv :vsp<CR> :terminal<CR> GA
"   ',ts' to open a terminal in a horizontal split.
    map <leader>ts :sp<CR> :terminal<CR> GA
"   ',tt' to open a terminal in a horizontal split.
    map <leader>tt :tab ter<CR> GA

"   Use 'tab' to cycle through auto-complete suggestions
    inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

"    Navigate errors
     map <C-n> :cnext<CR>
     map <C-m> :cprevious<CR>
     nnoremap <leader>a :cclose<CR>


" Plugins (using vim-plug)
" ========================
"   :PlugUpdate to install or update plugins.
"   :PlugUpgrade upgrade vim-plug itself.

    call plug#begin('~/.config/nvim/plugged')

"     Aesthetics
"     ==========
"         Solarized colors.
          Plug 'altercation/vim-colors-solarized'
  
"         Status line.
          Plug 'vim-airline/vim-airline'
  
"         Themes for the status line.
          Plug 'vim-airline/vim-airline-themes'

"              Set up solarized.
               let g:airline_theme='solarized'
               let g:airline_solarized_bg='dark'

"     Functionality
"     =============
"         Languagae aware line splitting and joining.
          Plug 'AndrewRadev/splitjoin.vim'

"             'gS' to split a line.
"             'gJ' to join multiple lines.

"         Autocomplete and code navigation for Python.
          Plug 'davidhalter/jedi-vim'

"             ',d' go to definition / declaration.
	      autocmd FileType python let g:jedi#goto_command = "<leader>d"
"             ',g' go to assignments.
              autocmd FileType python let g:jedi#goto_assignments_command = "<leader>g"
"             ',K' go to docs.
              autocmd FileType python let g:jedi#documentation_command = "K"
"             ',n' go to usages.
              autocmd FileType python let g:jedi#usages_command = "<leader>n"
"             'Ctrl+Space' completion.
              autocmd FileType python let g:jedi#completions_command = "<C-Space>"
"             ',r' rename.
              autocmd FileType python let g:jedi#rename_command = "<leader>r"

"         Fuzzy finder.
	  Plug 'nvim-lua/plenary.nvim'
          Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

"             ',ff' to search files.
	      nnoremap <leader>ff <cmd>Telescope find_files<cr>
"             ',fg' to search git files.
	      nnoremap <leader>fg <cmd>Telescope git_files<cr>
"             ',fl' to live grep.
              nnoremap <leader>fl <cmd>Telescope live_grep<cr>
"             ',fb' to search buffers.
              nnoremap <leader>fb <cmd>Telescope buffers<cr>

"             In normal mode:
"             'Ctrl+t' open entry in new tab.
"             'Ctrl+v' and 'Ctrl+x' open entry in a new vertical/horizontal split.
"             '?' view mappings.


"         Align a block around some chosen character.
          Plug 'junegunn/vim-easy-align'

"             Use EasyAlign with 'ga' in visual mode.
"             e.g. 'vipga2=' - align selected para around second equals.
              xmap ga <Plug>(EasyAlign)

"             Use EasyAlign with 'ga' in normal mode.
"             e.g. 'gaip2=' - align selected para around second equals.
              nmap ga <Plug>(EasyAlign)


"         File system explorer.
          Plug 'scrooloose/nerdtree'

"             Open the explorer if vim is open without a specific file.
              autocmd StdinReadPre * let s:std_in=1
              autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"         Comment and uncomment stuff.
          Plug 'scrooloose/nerdcommenter'

"             ',cc' to comment.
"             ',cu' to uncomment.

"         Autocomplete.
          Plug 'shougo/deoplete.nvim'

"	      Run at startup.
              let g:deoplete#enable_at_startup = 1

"         Run git commands.
          Plug 'tpope/vim-fugitive'

"             ':Git <cmd>' to do your usual git shenanigans.

    call plug#end()

" Additional Config
" =================

"   Load configuration specific to this machine.
    source ~/.config/nvim/local.vim
