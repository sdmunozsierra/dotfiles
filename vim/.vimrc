set nocompatible              " be iMproved, required
filetype off                  " required

"----------------------------------------
"------------- PLUG INS -----------------
"----------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" -- Interface -- " 
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'zefei/vim-wintabs'
"Plugin 'zefei/vim-wintabs-powerline'
Plugin 'https://github.com/kshenoy/vim-signature.git'
Plugin 'https://github.com/google/vim-searchindex.git'
Plugin 'badwolf'
Plugin 'hhff/SpacegrayEighties.vim'
Plugin 'chase/focuspoint-vim'
Plugin 'ajh17/spacegray.vim'
"Plugin 'severin-lemaignan/vim-minimap' "Still alpha
" -- Tools -- "
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tommcdo/vim-exchange'
Plugin 'junegunn/vim-easy-align'
Plugin 'Valloric/YouCompleteMe' "run ./install.py if disconnection
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ryanoasis/vim-devicons'
" -- Python in Vim -- " USE ATOM [With VIM keybindings of course]
"Plugin 'https://github.com/python-mode/python-mode.git'
"Plugin 'https://github.com/plytophogy/vim-virtualenv.git'
" -- C Programming -- "
"Plugin 'vim-scripts/Conque-GDB'
"Plugin 'c.vim'
" -- Smart Contract -- "
"Plugin 'tomlion/vim-solidity'
" -- JS & Angular Dev -- "
"Plugin 'burnettk/vim-angular'
"Plugin 'https://github.com/pangloss/vim-javascript'
"Plugin 'https://github.com/othree/javascript-libraries-syntax.vim.git'
"Plugin 'alvan/vim-closetag'
call vundle#end() 
" To ignore plugin indent changes, instead use:
filetype plugin indent on

" "----------------------------------------
" "-------------- DISPLAY -----------------
" "----------------------------------------

" set <leader> to ,
let mapleader = ","

set encoding=utf8
set antialias

" numbers, scheme, syntax
set number         " Enable line numbers
set relativenumber " Enable relative number
set softtabstop=0 noexpandtab
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab " Fixes new line to 4 spaces

"Folding
set foldmethod=manual
" Save folds in buffer
au BufWinLeave ?* mkview 1
au BufWinEnter ?* silent loadview 1

" Colorscheme
set t_Co=256  "Color 256 :)
"set termguicolors "for tmux
let base16colorspace=256  " Access colors present in 256 colorspace
syntax on
colorscheme delek     "New rice comming up!
let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1
"let g:badwolf_darkgutter = 1 " Make the gutters darker than the background.
"let g:badwolf_tabline = 3

"set status bar on bottom
set laststatus=2 

" check one time after 4s of inactivity in normal mode
set autoread
au CursorHold * checktime                                                                                                                                                                       
" Airline
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 0

let g:airline#extensions#tabline#enabled = 1 "Buffer list on top
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline#extensions#syntastic#enabled = 1

"----------------------------------------
"------------- PLUGGINS -----------------
"----------------------------------------

"------------- SYNTASTIC ----------------
"Please read the documentation for this
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_solidity_checkers=['solidity','solc','Solhint','Soluim']

"----------------------------------------
"------------- ANGULARJS ----------------
"----------------------------------------
"------------- Jslibsybtax --------------
let g:used_javascript_libs = 'angularjs' "https://github.com/othree/javascript-libraries-syntax.vim
"------------- vim javascript -----------
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1    "Needs to have JSDoc Plugin enabled
map <leader>g :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

"------------- ultsnips -----------------
let g:UltiSnipsExpandTrigger = '<C-l>'
let g:UltiSnipsJumpForwardTrigger = '<C-k>'
let g:UltiSnipsJumpBackwardTrigger = '<C-j>'

let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

"------------- Marks Vim ----------------
nmap <leader>ma :SignatureToggle<CR>

"------------- NERDTree -----------------
nmap <leader>o :NERDTreeToggle<CR>

" Starts NERDTree if no file was selevtionated
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if NERDTree is the onlything open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Delete the buffer of a deleted file
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

"------------- NERDCOMME -----------------

" Toggle comment as most IDEs
nnoremap <C-_> :call NERDComment(0,"toggle")<CR>
vnoremap <C-_> :call NERDComment(0,"toggle")<CR>

"------------- EasyAlign -----------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"------------- ConqueGDB ----------------
let g:ConqueTerm_Color = 2
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_StartMessages = 0

function DebugSession()
    silent make -o vimgdb -gcflags "-N -l"
    redraw!
    if (filereadable("vimgdb"))
        ConqueGdb vimgdb
    else
        echom "Couldn't find debug file"
    endif
endfunction
function DebugSessionCleanup(term)
    if (filereadable("vimgdb"))
        let ds=delete("vimgdb")
    endif
endfunction

"call conque_term#register_function("after_close", "DebugSessionCleanup")
nmap <leader>d :call DebugSession()<CR>;

"------------- Copy Stuff ---------------
" After searching something copy to clip
" :CopyMatches
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

"----------------------------------------
"------------- MAPPINGS EXTRA -----------
"----------------------------------------

"Press F4 to toggle highlighting on/off and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>
set hlsearch

"Press F5 to maximize current window
map <F5> <C-W>_<C-W><Bar>

"Beautify code see gh.com/Chiel92 for specific languages
noremap <F6> :Autoformat<CR>
"Indent all file `mzgg=G'z`
vmap <F7> mzgg=G`z<CR>

"Copy and paste from xclip
map <F10> ggvG :!xclip -f -sel clip<CR>
vmap <F11> :!xclip -f -sel clip<CR>
map <F12> :r !xclip -o -sel clip<CR>
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>

"Use :ws to write as sudo
cmap ws w !sudo tee > /dev/null %

"Visual mode pressing * or # searches for the current selection:
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
"Visual mode pressing // will search and then n for foward
vnoremap // y/<C-R>"<CR>

"Move between splits with vimlike keys Ctrl + hjkl
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Move to last visited split
nnoremap -- <C-W><C-W>
map <Tab><Tab> <C-W>w

"Quick buffers
map <leader>bd :bd<cr> 
map <leader>bn :bnext<cr>
map <leader>bp :bprev<cr>
nnoremap gb :ls<CR>:b<Space>

map ]q :cnext<CR>
map [q :cprevious<CR>
map ]b :bnext<CR>
map [b :bprevious<CR>
map ]t :tabnext<CR>
map [t :tabprevious<CR>

"Jump to mark to return to last extension used
augroup VIMRC
  autocmd!
  autocmd BufLeave *.css  normal! mC
  autocmd BufLeave *.html normal! mH
  autocmd BufLeave *.js   normal! mJ
  autocmd BufLeave *.php  normal! mP
augroup END

" Pressing Alt o will insert new line without insert mode FIX YOUR TERM
" nnoremap <silent><o-o> :set paste<CR>m`o<Esc>``:set nopaste<CR>
" nnoremap <silent><O-O> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Pressing oo or OO will insert new line without insert mode.
nmap oo o<Esc>k
nmap OO O<Esc>j
" This makes faster going into insert mode
set timeoutlen=170

" Shell current line insert (magik)
:noremap Q !!$SHELL<CR>

" Run a macro in @q
:nnoremap <Space><Space> @q

" Jump to the previous function
nnoremap <silent> [f :call
\ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "bw")<CR>
" Jump to the next function
nnoremap <silent> ]f :call
\ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "w")<CR>

" Use gt to foward and gT or gp to rewind buffers
map gt :bn<cr>
map gp :bp<cr>
map gT :bp<cr>
" Close gd current buffer
map gd :bd<cr>
"
"----------------------------------------
"------------- OPTIONS ------------------
"----------------------------------------
" set autocompletition of paths
set wildmenu

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting to misusing tabs
set hidden
set confirm
" dont save backups
set nobackup
