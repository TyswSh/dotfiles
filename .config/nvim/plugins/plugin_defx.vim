call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 1,
      \ 'buffer_name': 'exlorer',
      \ 'toggle': 1,
      \ 'resume': 1,
      \ })

call defx#custom#column('icon', {
    \ 'directory_icon': '▸',
    \ 'opened_icon': '▾',
    \ 'root_icon': ' ',
    \ })
call defx#custom#column('filename', {
    \ 'min_width': 40,
    \ 'max_width': 100,
    \ })
call defx#custom#column('mark', {
    \ 'readonly_icon': '✗',
    \ 'selected_icon': '✓',
    \ })

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_tree', 'recursive:10') :
  \ defx#do_action('open')
  noremap <silent><buffer><expr> o
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> l
  \ defx#is_directory() ? defx#do_action('open') : 0
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('preview')
endfunction

