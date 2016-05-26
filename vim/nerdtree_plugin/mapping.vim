call NERDTreeAddKeyMap({
     \ 'key': '<CR>',
     \ 'callback': 'NERDTreeFileTabHandler',
     \ 'quickhelpText': 'Open in new tab, but not directory',
     \ 'scope': 'Node' })

function! NERDTreeFileTabHandler(node)
    if a:node.path.isDirectory
        call a:node.activate()
    else
        call a:node.activate({'where': 't'})
    endif
endfunction

" vim: set sw=4 sts=4 et fdm=marker:
