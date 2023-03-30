" Base Configuration
" ===================

"   Set <leader> to ','.
    let mapleader = ","

"   'jj' to escape.
    imap jj <Esc>

"   Spaces, not tabs.
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4

"   Show me whitespace stuff.
    set list

"   Show line numbers...
    set number
"   apart from for terminals.
    autocmd TermOpen * setlocal nonumber norelativenumber

"   Open new vertical splits to the right.
    set splitright

"   Open new horizontal splits below.
    set splitbelow

"   ',q' to close current split.
    nnoremap <leader>q :q<CR>
"   ',t' to open a new tab.
    nnoremap <leader>t :tabnew<CR>
"   ',v' to open a new vsplit.
    nnoremap <leader>v :vsplit<CR>
"   ',s' to open a new split.
    nnoremap <leader>s :split<CR>

"   Navigate windows with WASD ',m<direction>'.
    map <leader>mw <C-w><Up>
    map <leader>ma <C-w>h
    map <leader>ms <C-w><Down>
    map <leader>md <C-w>l


"   ',t<number>' to go to numbered tab.
    nnoremap <leader>t1 1gt
    nnoremap <leader>t2 2gt
    nnoremap <leader>t3 3gt
    nnoremap <leader>t4 4gt
    nnoremap <leader>t5 5gt
    nnoremap <leader>t6 6gt
    nnoremap <leader>t7 7gt
    nnoremap <leader>t8 8gt
    nnoremap <leader>t9 9gt
    nnoremap <leader>t0 :tablast<CR>

"   ',cv' to open the vimrc in a in vertical split.
    map <leader>cv :vsp $MYVIMRC<CR>
"   ',cs' to open the vimrc in a in horizontal split.
    "map <leader>cs :sp $MYVIMRC<CR>
"   ',ct' to open the vimrc in a in a new tab.
    map <leader>ct :tabnew $MYVIMRC<CR>
"   ',c.' to open the vimrc in the current buffer.
    map <leader>c. :e $MYVIMRC<CR>
"   ',cr' to reload the vimrc.
    map <leader>cr :source $MYVIMRC<CR>

"   ',tv' to open a terminal in a vertical split.
    map <leader>tv :vsp<CR> :terminal<CR> GA
"   ',ts' to open a terminal in a horizontal split.
    map <leader>ts :sp<CR> :terminal<CR> GA
"   ',tt' to open a terminal in a new tab.
    map <leader>tt :tab ter<CR> GA

"   Use 'tab' to cycle through auto-complete suggestions
    inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

"    Navigate errors
     map <C-n> :cnext<CR>
     map <C-m> :cprevious<CR>
     nnoremap <leader>a :cclose<CR>

"    Copy to system clipboard
     map yc "*y


" Plugins (using vim-plug)
" ========================
"   :PlugUpdate to install or update plugins.
"   :PlugUpgrade upgrade vim-plug itself.

    call plug#begin('~/.config/nvim/plugged')

"     Aesthetics
"     ==========
"         Status line.
          Plug 'vim-airline/vim-airline'

"         Themes for the status line.
          Plug 'vim-airline/vim-airline-themes'

"              Set up solarized.
               let g:airline_theme='solarized'
               let g:airline_solarized_bg='dark'

"         JSON syntax highlighting.
          Plug 'elzr/vim-json'

"     Functionality
"     =============
"         Organise things into projects.
          Plug 'ahmedkhalf/project.nvim'


"         Language aware line splitting and joining.
          Plug 'AndrewRadev/splitjoin.vim'

"             'gS' to split a line.
"             'gJ' to join multiple lines.

"         IDE like tabs.
          Plug 'bagrat/vim-buffet'

"              Show numbers.
               let g:buffet_show_index=1

"              Switch between buffers.
               nmap <leader>1 <Plug>BuffetSwitch(1)
               nmap <leader>2 <Plug>BuffetSwitch(2)
               nmap <leader>3 <Plug>BuffetSwitch(3)
               nmap <leader>4 <Plug>BuffetSwitch(4)
               nmap <leader>5 <Plug>BuffetSwitch(5)
               nmap <leader>6 <Plug>BuffetSwitch(6)
               nmap <leader>7 <Plug>BuffetSwitch(7)
               nmap <leader>8 <Plug>BuffetSwitch(8)
               nmap <leader>9 <Plug>BuffetSwitch(9)
               nmap <leader>0 <Plug>BuffetSwitch(10)

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
              nnoremap <leader>lg :lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>
              nnoremap <leader>p :lua require'telescope'.extensions.projects.projects{}<CR>


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

"         File explorer.
          Plug 'nvim-tree/nvim-web-devicons'
          Plug 'nvim-tree/nvim-tree.lua'

"             ', ' to open and focus the tree view.
              nnoremap <leader><space> <cmd>NvimTreeFocus<cr>

"             ',w' focus on current open file in tre view.
              nnoremap <leader>w <cmd>NvimTreeFocus<cr>

"         Comment and uncomment stuff.
          Plug 'scrooloose/nerdcommenter'

"             ',cc' to comment.
"             ',cu' to uncomment.

"         Autocomplete.
          Plug 'shougo/deoplete.nvim'

"             Run at startup.
              let g:deoplete#enable_at_startup = 1

"         Run git commands.
          Plug 'tpope/vim-fugitive'

"             ':Git <cmd>' to do your usual git shenanigans.

    call plug#end()


" Start configuration
" ===================
"
lua << EOF
  -- Default project.nvim configuration.
  require("project_nvim").setup{}

  -- Add project.nvim extension to telescope.
  require('telescope').load_extension('projects')

  -- Configure nvim.tree for project.nvim.
  require("nvim-tree").setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true
    },
  })

  -- Alywas open nvim.tree.
  local function open_nvim_tree()
      require("nvim-tree.api").tree.open()
  end
  vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

EOF

" Additional Config
" =================

"   Load configuration specific to this machine.
    source ~/.config/nvim/local.vim
