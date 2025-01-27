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

Plug 'leafgarland/typescript-vim'

Plug 'dense-analysis/ale'

"------------------------ THEME ------------------------
" most importantly you need a good color scheme to write good code :D
Plug 'dikiaap/minimalist'

call plug#end()

" ALE offers some commands with <Plug> keybinds for moving between warnings and errors quickly. You can map the keys Ctrl+j and Ctrl+k to moving between errors for example:
" The 2 lines above define keybinds for ALE, it allows to switch between errors messages
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" should be able to go to implementation - ALE
nmap <C-]> <Plug>(ale_go_to_implementation)

" my current preferred theme
color minimalist

nmap [a <Plug>(ale_hover)
