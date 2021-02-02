" Plug {{{
" Install vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" LSP
Plug 'neovim/nvim-lsp'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
" Plug 'terryma/vim-multiple-cursors'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}


" Use release branch (recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bkad/CamelCaseMotion'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'asvetliakov/vim-easymotion'

Plug 'vim-scripts/ReplaceWithRegister'

call plug#end()

:set background=light
:set smartcase
:set ignorecase
" colorscheme one

nnoremap gp `[v`]
vmap y y`]

nnoremap <leader><CR> i<CR><Esc>
:set scrolloff=10

let g:camelcasemotion_key = '<leader>'


" Search for selection
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

:set clipboard=unnamedplus


xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

nnoremap gp `[v`]