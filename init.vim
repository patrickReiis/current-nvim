" start - search stuff
:set path=src/** " to use: :find <file>, or :find *<file>* (hit TAB)
:set wildignorecase
" end   - search stuff
"
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

" display variable type
let g:go_auto_type_info = 1

"Use this option to configure the delay until it starts some jobs (see
"|'g:go_auto_type_info'|, |'g:go_auto_sameids'|). If set to 0, it uses the
"value from 'updatetime'. By default it's set to 800ms
"reference: https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt
let g:go_updatetime = 0

nmap <M-Right> :vertical resize +1<CR>
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

let g:denops#deno = '/home/winlectro/.deno/bin/deno'

" == VIM PLUG ================================
call plug#begin('~/.vim/plugged')
"------------------------ COC ------------------------
" coc for tslinting, auto complete and prettier
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-deno']
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

" ALE
Plug 'dense-analysis/ale'

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
":set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
" for anything that needs 2 spaces as indentation
:set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" my current preferred theme
color minimalist

" highlight yank text
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=700})
augroup END


" ------------------- START REACT SETUP
""  1 - :CocList extensions
""  2 - Disable 'coc-deno 3.14.0  ~/.config/coc/extensions/node_modules/coc-deno'
""  3 - Optional: Enable 'coc-tsserver 2.2.0 ~/.config/coc/extensions/node_modules/coc-tsserver'
"let g:ale_linter_aliases = {'typescriptreact': ['typescript', 'tsx']}
"let g:ale_linters_ignore = {'typescript':['biome', 'cspell', 'eslint', 'tslint', 'standard', 'deno', 'typecheck', 'xo']}
"let b:ale_fixers = ['eslint', 'tslint']
" ------------------- END REACT SETUP


"" ------------------- START DENO SETUP
"  1 - :CocList extensions
"  2 - Enable 'coc-deno 3.14.0  ~/.config/coc/extensions/node_modules/coc-deno'
"  3 - Disable 'coc-tsserver 2.2.0 ~/.config/coc/extensions/node_modules/coc-tsserver'
let g:ale_deno_executable = 'deno'
" Author: Mohammed Chelouti - https://github.com/motato1
"         Arnold Chand <creativenull@outlook.com>
" Description: Deno lsp linter for TypeScript files.

call ale#linter#Define('typescript', {
\   'name': 'deno',
\   'lsp': 'stdio',
\   'executable': function('ale#handlers#deno#GetExecutable'),
\   'command': '%e lsp',
\   'project_root': function('ale#handlers#deno#GetProjectRoot'),
\   'initialization_options': function('ale#handlers#deno#GetInitializationOptions'),
\})

let g:ale_linters_ignore = {'typescript':['biome', 'cspell', 'eslint', 'tslint', 'standard', 'tsserver', 'typecheck', 'xo']}
let b:ale_fixers = {'typescript': ['deno']}
let g:ale_completion_autoimport = 1
" ------------------- END DENO SETUP



" ALE offers some commands with <Plug> keybinds for moving between warnings and errors quickly. You can map the keys Ctrl+j and Ctrl+k to moving between errors for example:
" The 2 lines above define keybinds for ALE, it allows to switch between errors messages
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" should be able to go to implementation - ALE
nmap <C-]> <Plug>(ale_go_to_implementation)

" Call a fixer when saving, run :ALEFixSuggest
let g:ale_fix_on_save = 1

nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)

" should work
nmap [a <Plug>(ale_hover)
