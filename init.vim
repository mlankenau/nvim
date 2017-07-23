set background=dark
set spell
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

let g:ctrlp_custom_ignore = {'dir': '\v\/(deps|\.git|node_modules|_build)$'}

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

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'bling/vim-airline'                 " status bar
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'slashmili/alchemist.vim'
NeoBundle 'ivalkeen/vim-simpledb'
NeoBundle 'digitaltoad/vim-pug'
NeoBundle 'posva/vim-vue'
call neobundle#end()

set tabstop=2
set shiftwidth=2

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

let g:RspecBin="bundle exec rspec"

" depending on the filename (ruby file or spec run ruby or spec runner)
function Runner()
  let filename = bufname('%')
  if filename =~ 'spec.exs'
    execute(":! mix espec % --cover")
  elseif filename =~ 'test.exs'
    execute(":! mix test %")
  elseif filename =~ 'spec.rb'
    execute(":! rspec %")
  elseif filename =~ '.rb'
    execute(":! ruby %")
  endif
endfunction
function RunnerSpecial()
  let filename = bufname('%')
  if filename =~ 'spec.exs'
    execute(":! mix espec %:" . line(".") . " --cover")
  elseif filename =~ 'test.exs'
    execute(":! mix test %:" . line(".") . " --cover")
  elseif filename =~ 'spec.rb'
    execute(":! rspec %")
  elseif filename =~ '.rb'
  endif
endfunction

map \rr :call RunnerSpecial()<CR>
map \r :call Runner()<CR>

function GoSpec()
  let strategies = [
        \ {'pattern': 'app/models/\(.*\)\(.rb\)', 'prefix': 'spec/models/', 'suffix': '_spec.rb'},
        \ {'pattern': 'app/services/\(.*\)\(.rb\)', 'prefix': 'spec/services/', 'suffix': '_spec.rb'},
        \ {'pattern': 'app/controllers/\(.*\)\(.rb\)', 'prefix': 'spec/controllers/', 'suffix': '_spec.rb'},
        \ {'pattern': '\(.*\)\(.rb\)', 'prefix': 'spec/', 'suffix': '_spec.rb'},
        \ {'pattern': 'spec/models/\(.*\)\(_spec.rb\)', 'prefix': 'app/models/', 'suffix': '.rb'},
        \ {'pattern': 'spec/services/\(.*\)\(_spec.rb\)', 'prefix': 'app/services/', 'suffix': '.rb'},
        \ {'pattern': 'spec/controllers/\(.*\)\(_spec.rb\)', 'prefix': 'app/controllers/', 'suffix': '.rb'},
        \ {'pattern': 'spec/\(.*\)\(_spec.rb\)', 'prefix': '', 'suffix': '.rb'} ]
  let filename = bufname('%')

  for p in strategies
    let parts = matchlist(filename, p.pattern)
    if len(parts) > 1
      let spec_file = p.prefix . parts[1] . p.suffix
      if filereadable(spec_file)
        execute("e " . spec_file)
        return
      endif
    endif
  endfor
endfunction
map \gs :call GoSpec()<CR>

au BufNewFile,BufRead *.vue set filetype=html
"autocmd! BufWritePost *.{rb,rake,js} Neomake
au BufNewFile,BufRead *.god set filetype=ruby

