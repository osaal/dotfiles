set number		" Line numbers
set relativenumber	" Relative line numbers
set title		" Show file title
set expandtab		" Use spaces instead of <Tab>
set tabstop=4		" Number of spaces in a <Tab>
set shiftwidth=4	" Number of spaces in auto-indentation
set softtabstop=4	" Number of spaces for <Tab> in Insert mode

set list		" Set list mode for showing non-printing chars
set listchars=tab:<->,space:·,extends:»,precedes:«
let &showbreak = "> "	" Prepended to wrapped lines

" KEYBINDS
set <S-Tab>=^[[Z
inoremap <S-Tab> <C-d>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap <lt> <gv
vnoremap > >gv
