sy on
set hidden
set number
set tabstop=2
set shiftwidth=2
set expandtab
set runtimepath^=~/.vim/bundle/neobundle.vim/
set clipboard=unnamed
let g:ackprg = 'ag --nogroup --nocolor --column'
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'benekastah/neomake'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'skalnik/vim-vroom'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'bling/vim-airline'
NeoBundle 'ervandew/supertab'
NeoBundle 'airblade/vim-gitgutter'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" key mappings
nmap \n :NERDTreeToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>
nmap \b :BufferGatorToggle<CR>
nmap <C-b> :BufferGatorToggle<CR>
map , :vertical resize -5<CR>
map . :vertical resize +5<CR>
nnoremap <leader>a :Ack<space>

"function CheckElixir()
"  let result = system("mix compile")
"  let parts = matchlist(result, '\v\(.*Error\) ([^:]*):(\d*): (.*)')
"  if len(parts) > 1
"    let file = parts[1]
"    let line = parts[2]
"    let message = parts[3]
"    echo file . ":" . line . ": " . message
"    execute("e +" . line . " " . file)
"    execute("sy on")
"    " cal cursor(line, 1)
"  endif
"endfunction
"autocmd BufWritePost *.{ex,exs} call CheckElixir()

autocmd! BufWritePost * Neomake
