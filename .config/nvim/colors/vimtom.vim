" Vim color file
" Maintainer:   Lorenzo Ruiz <lars@sindrosoft.com>
" URL: https://github.com/larsbs/vimtom


" CONFIGURATION "{{{
" =============
set background=dark

hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name="vimtom"
" }}}

" UTILS "{{{
" =============
function! RemoveNewlines(string)
    return substitute(a:string, '\n', '', 'g')
endfunction

" Custom Hi command that accepts colors as variables.
" Usage -> Hi [group] [guifg_color] [guibg_colors]
command! -nargs=+ Hi call CustomHighlighter(<f-args>)
function! CustomHighlighter(name, ...)
    let colour_order = ['guifg', 'guibg']
    let command = 'hi! ' . a:name
    if (len(a:000) < 1) || (len(a:000) > (len(colour_order)))
        echoerr "No colour or too many colours specified"
    else
        for i in range(0, len(a:000) - 1)
            " Extract the color from the variable. If we don't do
            " this, then, the variable is parsed as a string and
            " we get a color asignation error.
            redir => s:color
            silent exe 'echo '.a:000[i]
            redir END
            let s:color = RemoveNewlines(s:color)
            if s:color != 'ignore'
                let command .= ' ' . colour_order[i] . '=' . s:color
            endif
        endfor
        exe command
    endif
endfunc
" }}}

" COLORS "{{{
" =======
let s:none              = 'NONE'
let s:ignore            = 'ignore'
let s:testing           = '#CDFF00'

let s:darkest_grey_blue = '#21252b'  " Highlighted background, airline, etc.
let s:darker_grey_blue  = '#282c34'  " Normal background
let s:dark_grey_blue    = '#4b5262'  " Line numbers, split, etc
let s:grey_blue         = '#5c6370'  " Folds, comments, etc
let s:light_grey_blue   = '#3e4451'  " Visual
let s:lighter_grey_blue = '#abb2bf'  " Normal text

let s:accent_teal       = '#56b6c2'  " Titles in NERDTree and TODO
let s:search_yellow     = '#f8e71c'  " Search color *
let s:cursor_blue       = '#3f5e9d'  " Cursor

let s:light_blue        = '#61afef'  " Functions
let s:soft_red          = '#e06c75'  " Errors
let s:dark_soft_red     = '#cc525b'  " Not used? *
let s:soft_green        = '#98c379'  " Strings
let s:soft_violet       = '#c678dd'  " Keyword
let s:soft_lime_green   = '#d9f5dd'  " Operators *
let s:soft_orange       = '#e5c06f'  " Global objects
let s:dark_orange       = '#d19a66'  " HTML args
let s:light_red         = '#e06c75'  " HTML Tag name

let s:pmenu_bg          = '#3a3f4b'  " PMenu background
" }}}

" GENERAL "{{{
" =======
Hi Normal               s:lighter_grey_blue  s:darker_grey_blue
"Hi ColorColumn          s:testing            s:testing
Hi Cursor               s:none               s:cursor_blue
"hi CursorIM
Hi CursorColumn         s:ignore             s:darkest_grey_blue
Hi CursorLine           s:ignore             s:darkest_grey_blue
Hi Directory            s:accent_teal        s:ignore
Hi DiffAdd              s:soft_green         s:darkest_grey_blue
hi DiffAdd              gui=bold
Hi DiffChange           s:soft_orange        s:darkest_grey_blue
hi DiffChange           gui=bold
Hi DiffDelete           s:soft_red           s:darkest_grey_blue
Hi DiffText             s:light_blue         s:darkest_grey_blue
Hi ErrorMsg             s:darker_grey_blue   s:dark_soft_red
hi ErrorMsg             gui=none
Hi VertSplit            s:darker_grey_blue   s:dark_grey_blue
Hi Folded               s:darker_grey_blue   s:grey_blue
Hi FoldedColumn         s:darker_grey_blue   s:grey_blue
Hi SignColumn           s:dark_grey_blue     s:ignore
Hi IncSearch            s:search_yellow      s:darkest_grey_blue
Hi Search               s:darkest_grey_blue  s:search_yellow
Hi LineNr               s:dark_grey_blue     s:ignore
Hi MatchParen           s:none               s:none
hi MatchParen           gui=underline
Hi ModeMsg              s:light_grey_blue    s:none
"Hi MoreMsg              s:testing            s:testing
Hi NonText              s:dark_grey_blue     s:ignore
Hi Question             s:light_grey_blue    s:none
hi Question             gui=none
"Hi SpecialKey           s:testing            s:testing
"Hi StatusLine           s:testing            s:testing
"Hi StatusLineNC         s:testing            s:testing
Hi Title                s:light_blue         s:ignore
Hi Visual               s:none               s:light_grey_blue
"Hi VisualNOS            s:testing            s:testing
Hi WarningMsg           s:dark_soft_red      s:ignore
Hi WildMenu             s:testing            s:testing
Hi Menu                 s:testing            s:testing
Hi Scrollbar            s:testing            s:testing
Hi Tooltip              s:testing            s:testing
Hi Pmenu                s:lighter_grey_blue  s:pmenu_bg
Hi PmenuSel             s:ignore             s:darkest_grey_blue
Hi PmenuSbar            s:ignore             s:grey_blue
Hi PmenuThumb           s:ignore             s:lighter_grey_blue
" }}}


" Syntax Highlighting Groups (see :he group-name)

" COMMENTS "{{{
" ========
" Any comment
Hi Comment              s:grey_blue          s:ignore
hi Comment              gui=italic
" }}}

" CONSTANTS "{{{
" =========
" Any constant
Hi Constant             s:dark_orange        s:ignore
" A string constant
Hi String               s:soft_green         s:ignore
" }}}

" IDENTIFIERS "{{{
" ===========
" Any variable name
Hi Identifier           s:soft_violet        s:ignore
hi Identifier           gui=none
" Function name (also: methods for classes)
Hi Function             s:light_blue         s:ignore
" }}}

" STATEMENTS "{{{
" ==========
" Any statement
Hi Statement            s:soft_violet        s:ignore
hi Statement            gui=none
" if, then, else, endif, switch, etc.
"hi Conditional
" for, do, while, etc.
"hi Repeat
" case, default, etc.
"hi Label
" sizeof, +, *, etc.
Hi Operator             s:soft_lime_green    s:ignore
" Any other keyword
"hi Keyword
" Try, catch, throw
"hi Exception
" }}}

" PREPROCS "{{{
" ========
" Generic preprocessor
Hi PreProc              s:soft_violet        s:ignore
" Preprocessor #include
"hi Include
" Preprocessor #define
"hi Define
" Same as define
"hi Macro
" Preprocessor #if, #else, #endif, etc.
"hi PreCondit
" }}}

" TYPES "{{{
" =====
" int, long, char, etc.
Hi Type                 s:soft_violet        s:ignore
hi Type                 gui=none
" static, register, volatile, etc.
"hi StorageClass
" struct, union, enum, etc.
"hi Structure
" a typedef
"hi Typedef
" }}}

" SPECIALS "{{{
" ========
" Any special symbol (ex: [, ], (, ), etc.)
Hi Special              s:lighter_grey_blue  s:ignore
" Special character in a constant (ex: \n, %s, etc.)
Hi SpecialChar          s:accent_teal        s:ignore
" You can use CTRL-] on this
"hi Tag
" Character that needs attention
"hi Delimiter
" Special things inside a comment
"hi SpecialComment
" Debugging statements
"hi Debug
" }}}

" UNDERLINEDS "{{{
" ===========
" Text that stands out, HTML links
"hi Underlined
" }}}

" IGNORES "{{{
" =======
" Left blank, hidden hl-Ignore
"hi Ignore
" }}}

" ERRORS "{{{
" ======
" Any erroneous construct
"hi Error
" }}}

" TODOS "{{{
" =====
" Anything that needs extra attention; mostly the kewords
" TODO FIXME and XXX
Hi Todo                 s:accent_teal    s:none
hi Todo                 gui=bold
" }}}


" JavaScript Highlighting "{{{
" =======================
"execute 'source ' . expand("<sfile>:p:h") . "/syntax/javascript/vim-javascript-syntax.vim"
execute 'source ' . expand("<sfile>:p:h") . "/syntax/javascript/pangloss-vim-javascript.vim"
" }}}
" HTML Highlighting "{{{
" =================
execute 'source ' . expand("<sfile>:p:h") . "/syntax/html/html5.vim"
" }}}
" XML Highlighting "{{{
" =================
execute 'source ' . expand("<sfile>:p:h") . "/syntax/xml/xml.vim"
" }}}
" Jinja Highlighting "{{{
" ==================
execute 'source ' . expand("<sfile>:p:h") . "/syntax/jinja/vim-jinja2-syntax.vim"
" }}}
" CSS Highlighting "{{{
" ================
execute 'source ' . expand("<sfile>:p:h") . "/syntax/css/juleswang-css.vim"
" }}}
" LESS Highlighting "{{{
" =================
execute 'source ' . expand("<sfile>:p:h") . "/syntax/less/genoma-vim-less.vim"
" }}}
" SH Highlighting "{{{
" ===============
execute 'source ' . expand("<sfile>:p:h") . "/syntax/bash/bash.vim"
" }}}
" NERDTree Highlighting "{{{
" =====================
execute 'source ' . expand("<sfile>:p:h") . "/syntax/nerdtree/nerdtree.vim"
" }}}
