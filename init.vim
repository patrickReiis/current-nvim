set wildmenu
set wildmode=longest,list,full

set number
set termguicolors
set foldmethod=syntax
set cursorline
set showcmd

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" display variable type
let g:go_auto_type_info = 1

"Use this option to configure the delay until it starts some jobs (see
"|'g:go_auto_type_info'|, |'g:go_auto_sameids'|). If set to 0, it uses the
"value from 'updatetime'. By default it's set to 800ms
"reference: https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt
let g:go_updatetime = 0

" Automatically format the current file on save
autocmd BufWritePre *.vue :CocCommand prettier.formatFile

nmap <M-Right> :vertical resize +1<CR>
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>


" == VIM PLUG ================================
call plug#begin('~/.vim/plugged')
"------------------------ COC ------------------------
" coc for tslinting, auto complete and prettier
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" vim-tsx will do all the coloring for jsx in the .tsx file
Plug 'ianks/vim-tsx'
"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" typescript-vim will do all the coloring for typescript keywords
Plug 'leafgarland/typescript-vim'
"------------------------ THEME ------------------------
" most importantly you need a good color scheme to write good code :D
Plug 'dikiaap/minimalist'

"------------------------ VIM GO ----------------------
"shall display the type of the variable and some other things
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"

call plug#end()
" == VIMPLUG END ================================
" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================

" for go development: 
:set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
" for anything that needs 2 spaces as indentation
":set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" my current preferred theme
color minimalist

" highlight yank text
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=700})
augroup END
