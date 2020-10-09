call plug#begin('~/.config/nvim/plugged')
" Git Wrapper
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
" Status bar
Plug 'vim-airline/vim-airline'
" Auto complete matching brackets,quotes.
Plug 'jiangmiao/auto-pairs'
" Handle commenting and file explorer
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
" Fancy icons in nerdtree
Plug 'ryanoasis/vim-devicons'
" Better syntax highlighting
Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-surround'
" List all tags in buffer
Plug 'majutsushi/tagbar'
" Fuzzy file finder
Plug 'junegunn/fzf.vim'
" Autocomplete engine with lsp support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Visualise the undo tree
Plug 'mbbill/undotree'

" Colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'dracula/vim'

call plug#end()

if(has("termguicolors"))
	set termguicolors
endif

" let g:dracula_italic = 1
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_italic=1
colorscheme gruvbox
set noshowmode

filetype plugin on

" Enable spell checking
" set spell

" Indents
set autoindent
set smartindent
set cindent

""" Search
set ignorecase   " case-insensitive search
set smartcase
" but case-sensitive if expression contains a capital letter

""" Buffers
set hidden       " Handle multiple buffers better

" You can abandon a buffer with unsaved changes without a warning
"""Editor
set scrolloff=3  " show 3 lines of context around cursor
set list         " show invisible characters

""" Global Tabs and Spaces configurations
" set expandtab    " use spaces instead of tabs
set tabstop=4    " global tab width
set shiftwidth=4 " spaces to use when indenting

" Turn on syntax highlighting
syntax on

" Set min pane height to 0
set wmh=0

" Enable line numbers
set relativenumber number

" Fzf conf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" Custom hooks

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

" Run xrdb whenever Xdefaults or Xresources are updated.
" autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost init.vim source %

" Custom shortcuts

" Remap leader to space
let mapleader="\<Space>"

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" UndoTree keybindings
noremap <C-U> :UndotreeToggle<CR>

" Fugitive keybindings
noremap <leader>gs :Git<CR>

" Easy merge conflict resolution
" remote branch on right
noremap <leader>gj :diffget RE<CR>
" local branch on left
noremap <leader>gf :diffget LO<CR>

" Nerd Commenter remaps for change in leader
map <leader>ct <plug>NERDCommenterToggle<CR>

" NerdTree stuff
" NerdTree Toggle
map <C-n> :NERDTreeToggle<CR>

" Automatically start NERDTree if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Fzf toggle
map <C-p> :Files<CR>
map <C-b> :Buffers<CR>

" Tagbar toggle
nmap <C-t> :TagbarToggle<CR>

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
noremap <Leader>th <C-w>t<C-w>H
noremap <Leader>tk <C-w>t<C-w>K

" Easy switching between panes
noremap <A-h> :wincmd h<CR>
noremap <A-j> :wincmd j<CR>
noremap <A-k> :wincmd k<CR>
noremap <A-l> :wincmd l<CR>
" Map jk to escape in insert mode
inoremap jk <Esc>

" Easy closing of panes
nnoremap <A-q> <C-w>q

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" Quit vim if nerd tree is the only tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Fix j,k keys when lines are wrapped
nnoremap j gj
nnoremap k gk

" yank to clipboard
" set clipboard+=unnamedplus


" Split below current window
set splitbelow splitright

"""Airline

let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
" Use with urxvt because unicode support is bad.
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" lt g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1

" Nerd Commenter stuff
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
let NERDDefaultAlign="left"
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Coc example config

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=4000

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=auto

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"     autocmd!
"     " Setup formatexpr specified filetype(s).
"     autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"     " Update signature help on jump placeholder.
"     autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
