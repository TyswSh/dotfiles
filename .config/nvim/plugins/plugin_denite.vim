nnoremap <silent> <leader>fr :<C-u>Denite file_mru<CR>
nnoremap <silent> <leader>fb :<C-u>Denite buffer<CR>
nnoremap <silent> <leader>ff :<C-u>Denite file_rec<CR>
nnoremap <silent> <leader>fy :<C-u>Denite neoyank<CR>
nnoremap <silent> <leader>fu :<C-u>Denite outline<CR>
nnoremap <silent> <leader>fg :<C-u>Denite grep<CR>
nnoremap <silent> <leader>fl :<C-u>Denite line<CR>

let s:denite_win_width_precent = 0.85
let s:denite_win_height_percent = 0.7

call denite#custom#option('defalut', {
    \ 'split': 'floating',
    \ 'winwidth': float2nr(&columns * s:denite_win_width_precent),
    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_precent)) / 2),
    \ 'winheight': float2nr(&lines * s:denite_win_width_precent),
    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
    \ })

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <space>
                \ denite#do_map('toggle_select').'j'
endfunction

