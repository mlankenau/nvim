"set background=dark
" set spell
set nowrap
set hidden
set number
set tabstop=2
set shiftwidth=2
set expandtab
set runtimepath^=~/.vim/bundle/neobundle.vim/
set clipboard=unnamed
set omnifunc=syntaxcomplete#Complete
set noswapfile
au BufRead,BufNewFile *.pegjs set filetype=javascript
au BufRead,BufNewFile *.ts set filetype=typescript
au BufRead,BufNewFile *.tsx set filetype=typescript

let b:did_indent = 1
let NERDTreeIgnore = ['\.pyc$']

let g:ctrlp_custom_ignore = {'dir': '\v\/(deps|\.git|node_modules|_build)$'}
let g:neomake_logfile = '/tmp/neomake.log'
let g:neomake_typescript_tslint_errorformat = '%EERROR: %f:%l:%c - %m'

hi clear SpellBad
hi SpellBad cterm=underline

filetype plugin on
sy on

let g:RubyRunner_key = "\-0"
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:neomake_javascript_enabled_makers = ['eslint']
let g:buffergator_sort_regime='basename'
"let g:buffergator_display_regime = "parentdir"
let g:buffergator_show_full_directory_path = 0
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'natebosch/vim-lsc'
NeoBundle 'natebosch/vim-lsc-dart'
NeoBundle 'dart-lang/dart-vim-plugin'
NeoBundle 'thosakwe/vim-flutter'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'neomake/neomake'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'terryma/vim-multiple-cursors'
" NeoBundle 'bronson/vim-trailing-whitespace' " did not work,
NeoBundle 'bling/vim-airline'                 " status bar
NeoBundle 'airblade/vim-gitgutter'
" NeoBundle 'slashmili/alchemist.vim'
" NeoBundle 'ivalkeen/vim-simpledb'
NeoBundle 'ntpeters/vim-better-whitespace'
" NeoBundle 'dart-lang/dart-vim-plugin'
call neobundle#end()

highlight ExtraWhitespace ctermbg=red
set tabstop=2
set shiftwidth=2

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" flutter config
let g:lsc_auto_map = v:true

" key mappings
nmap \n :NERDTreeToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>
nmap \b :BufferGatorToggle<CR>
nmap <C-b> :BufferGatorToggle<CR>
map <C-,> :vertical resize -5<CR>
map <C-.> :vertical resize +5<CR>
nnoremap <leader>a :Ack<space>
nmap \w <C-w>
vmap iq i"
nmap <leader>csq f"r'F"r'
nmap <leader>el :execute getline(".")<CR>
" ensure that pasting in visual mode does not overwrite reg
xnoremap p pgvy

" window resize
nmap <C-s><Up> :resize -5<CR>
nmap <C-s><Down> :resize +5<CR>
nmap <C-s><Left> :vertical resize -10<CR>
nmap <C-s><Right> :vertical resize +10<CR>
nmap \rs :RunSpec<CR>
nmap \sc :so coverage.vim<CR>
nmap \ibb korequire 'byebug'; byebug<ESC>

nmap <C-Left> :wincmd h<CR>
nmap <C-Right> :wincmd l<CR>
nmap <C-Up> :wincmd k<CR>
nmap <C-Down> :wincmd j<CR>

tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <Leader>tb :TagbarToggle<CR>

" Enable CursorLine
set cursorline
" Change Color when entering Insert Mode
"autocmd InsertEnter * highlight  CursorLine ctermfg=Red
" ctermbg=DarkGrey 
" Revert Color to default when leaving Insert Mode
"autocmd InsertLeave * highlight  clear


" When writing a buffer (no delay).
"call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
"call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
"call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
" call neomake#configure#automake('nrwi', 500)

"call neomake#configure#automake('rw')

hi! Cursor ctermfg=1 ctermbg=1 guifg=#60aF60 guibg=#60aF60
set termguicolors
set guicursor=n-c-v:block-Cursor/Cursor-blinkon0
set guicursor+=i-ci:ver1-Cursor/Cursor-blinkwait300-blinkon200-blinkoff150
