:set wildignorecase

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

set wildmenu
set wildmode=longest,list,full
set number
set termguicolors
set foldmethod=syntax
set cursorline
set showcmd

nmap <M-Right> :vertical resize +1<CR>
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

call plug#begin()

" List your plugins here
Plug 'dense-analysis/ale'

call plug#end()
