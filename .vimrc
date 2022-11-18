set number
set relativenumber
"set laststatus=2
syntax on

"set fenc=utf-8
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4

set mouse=a

" cursole type config -------------------
if has('vim_starting')
	let &t_SI .= "\e[6 q"
	let &t_EI .= "\e[2 q"
	let &t_SR .= "\e[4 q"
endif
"----------------------------------------

" auto complementation of brackets and quotations---
inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
" --------------------------------------------------
" furthermore keymap settings----------------------
noremap j gj
noremap k gk
"---------------------------------------------------

" recognize the blank .tex file as tex, not as plaintex
" (This helps the plugin mattn/sonictemplate-vim to work correctly)
let g:tex_flavor = "latex"

"dein Scripts-----------------------------
if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

let s:toml = '$HOME/.cache/dein/dein.toml'
let s:toml_lazy = '$HOME/.cache/dein/dein_lazy.toml'
if dein#load_state('$HOME/.cache/dein')
	call dein#begin('$HOME/.cache/dein')

	call dein#load_toml(s:toml, {'lazy':0})
	call dein#load_toml(s:toml_lazy, {'lazy':1})

	call dein#end()
	call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif
"End dein Scripts-------------------------

" airline config -----------------
let g:airline_theme = 'tender'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" ----------------------------------------

set ttimeoutlen=50 " time loss reduction

" tender colorscheme config --------------
if (has("termguicolors"))
		set termguicolors
endif

syntax enable
colorscheme tender
" ----------------------------------------

" vim-quickhl config ---------------------
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
"-----------------------------------------

let maplocalleader=' '


" dcc.vim configulations------------------
" Customize global settings

" You must set the default ui.
" Note: native ui
" https://github.com/Shougo/ddc-ui-native
call ddc#custom#patch_global('ui', 'native')

" Use around source.
" https://github.com/Shougo/ddc-source-around
call ddc#custom#patch_global('sources', ['around', 'vim-lsp'])

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank'],
	  \   'minAutoCompleteLength': 1,
	  \ },
	  \ 'vim-lsp': {
	  \   'matchers': ['matcher_head'],
	  \   'mark': 'lsp'
	  \ }
      \ })

" Change source options
call ddc#custom#patch_global('sourceOptions', {
      \ 'around': {'mark': 'A'},
      \ })
call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })

" Mappings

" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ pumvisible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

" Use ddc.
call ddc#enable()
" --------------------------------------------

let g:sonictemplate_vim_template_dir = '~/Documents/.sonic-templates/'
