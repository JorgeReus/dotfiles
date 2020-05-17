call plug#begin('~/.local/share/nvim/plugged')
Plug 'neovim/nvim-lsp'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'herrbischoff/cobalt2.vim'
Plug 'scrooloose/nerdcommenter'
call plug#end()

" LSP configs
autocmd Filetype rust,python,go,c,cpp setl omnifunc=v:lua.vim.lsp.omnifunc
nnoremap <silent> ;dc <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ;df <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> ;h <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> ;i <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> ;s <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> ;td <cmd>lua vim.lsp.buf.type_definition()<CR>
"### LSP ###
:lua << EOF
    local nvim_lsp = require 'nvim_lsp'
    settings = {
      pyls = {
        enable = true;
        trace = { server = "verbose"; };
        commandPath = "";
        configurationSources = { "pycodestyle" };
        plugins = {
          jedi_completion = { enabled = true; };
          jedi_hover = { enabled = true; };
          jedi_references = { enabled = true; };
          jedi_signature_help = { enabled = true; };
          jedi_symbols = {
            enabled = true;
            all_scopes = true;
          };
          mccabe = {
            enabled = true;
            threshold = 15;
          };
          preload = { enabled = true; };
          pycodestyle = { enabled = true; };
          pydocstyle = {
            enabled = false;
            match = "(?!test_).*\\.py";
            matchDir = "[^\\.].*";
          };
          pyflakes = { enabled = true; };
          rope_completion = { enabled = true; };
          yapf = { enabled = true; };
        };
      };
    };
    nvim_lsp.pyls.setup(settings)
EOF
" disable preview window
set completeopt-=preview

" Autocmds
augroup myvimrchooks
    au!
    autocmd bufwritepost init.vim source ~/.config/nvim/init.vim
augroup END
" ### General ###
filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
set number
set relativenumber

let g:UltiSnipsExpandTrigger="<A-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

" ### Deoplete ###
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" ### Colors
set termguicolors
colorscheme cobalt2
let g:airline_theme='cool'
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
highlight Comment         guifg=#6699CC
highlight String          guifg=#99c8e8
highlight CursorLineNr    guifg=#ff00ff
highlight LineNr          guifg=#00ffff
highlight Type            guifg=#cce899
highlight Identifier      guifg=#cee904
highlight GitGutterAdd    guifg=#009901
highlight GitGutterChange guifg=#bbbb00
highlight GitGutterDelete guifg=#ff2222

" ### Mappings
nnoremap <C-l> :tabl<cr>
nnoremap <C-h> :tabr<cr>
nnoremap <C-k> :tabnew<cr>
nnoremap <C-j> :tabclose<cr>
map <C-s> :w<Cr>
map <C-q> :q!<Cr>
map <C-o> :edit 
" ### Deoplete ###
" Use tab to cycle through completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-TAB>  pumvisible() ? "\<C-p>" : "\<s-TAB>"
" ### NERD commenter ###
noremap - :call NERDComment(0, "toggle")<CR>
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 0

" ### Custom Syntax ###
au! BufNewFile,BufRead *.svelte set ft=html

" Clipboard
set clipboard+=unnamedplus
