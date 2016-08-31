let g:airline#themes#MoonMaster#palette = {}

  let g:airline#themes#MoonMaster#palette.accents = {
        \ 'red': [ '#66d9ef' , '' , 12 , '' , '' ],
        \ }

  " Normal Mode:
  let s:N1 = [ '#2f343f' , '#ffffff' , 15 , 8 ] " Mode
  let s:N2 = [ '#2f343f' , '#5294e2' , 8 , 12  ] " Info
  let s:N3 = [ '#ffffff' , '#2f343f' , 8 , 15  ] " StatusLine

  let g:airline#themes#MoonMaster#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
  let g:airline#themes#MoonMaster#palette.normal.airline_warning = [ '#2f343f' , '#fac536' , 15 , 11 ]
  let g:airline#themes#MoonMaster#palette.normal.airline_error = [ '#ffffff' , '#990000' , 15 , 140 ]
  let g:airline#themes#MoonMaster#palette.normal_modified = {
        \ 'airline_c': [ '#fac536' , '#2f343f' , 11 , 15 , '' ] ,
        \ 'airline_warning': [ '#2f343f' , '#fac536' , 15 , 11 , '' ] ,
        \ 'airline_error': [ '#ffffff' , '#990000' , 15 , 140 , '' ] ,
        \ }


  " Insert Mode:
  let s:I1 = [ '#2f343f' , '#ffffff' , 15 , 8 ] " Mode
  let s:I2 = [ '#2f343f' , '#5294e2' , 8 , 12 ] " Info
  let s:I3 = [ '#ffffff' , '#2f343f' , 8 , 15 ] " StatusLine


  let g:airline#themes#MoonMaster#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  let g:airline#themes#MoonMaster#palette.insert.airline_warning = [ '#2f343f' , '#fac536' , 15 , 11 ]
  let g:airline#themes#MoonMaster#palette.insert.airline_error = [ '#ffffff' , '#990000' , 15 , 140 ]
  let g:airline#themes#MoonMaster#palette.insert_modified = {
        \ 'airline_c': [ '#fac536' , '#2f343f' , 11 , 15 , '' ] ,
        \ 'airline_warning': [ '#2f343f' , '#fac536' , 15 , 11 , '' ] ,
        \ 'airline_error': [ '#ffffff' , '#990000' , 15 , 140 , '' ] ,
        \ }


  " Replace Mode:
  let g:airline#themes#MoonMaster#palette.replace = copy(g:airline#themes#MoonMaster#palette.insert)
  let g:airline#themes#MoonMaster#palette.replace.airline_a = [ '#f25056' , '#ffffff' , 8 , 9 , ''     ]
  let g:airline#themes#MoonMaster#palette.replace.airline_warning = [ '#2f343f' , '#fac536' , 15 , 11 ]
  let g:airline#themes#MoonMaster#palette.replace.airline_error = [ '#ffffff' , '#990000' , 15 , 140 ]
  let g:airline#themes#MoonMaster#palette.replace_modified = {
        \ 'airline_c': [ '#fac536' , '#2f343f' , 11 , 15 , '' ] ,
        \ 'airline_warning': [ '#2f343f' , '#fac536' , 15 , 11 , '' ] ,
        \ 'airline_error': [ '#ffffff' , '#990000' , 15 , 140 , '' ] ,
        \ }


  " Visual Mode:
  let s:V1 = [ '#2f343f', '#ffffff', 15, 8 ]
  let s:V2 = [ '#2f343f', '#5294e2', 8,  12 ]
  let s:V3 = [ '#ffffff', '#2f343f', 8 , 15  ]

  let g:airline#themes#MoonMaster#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  let g:airline#themes#MoonMaster#palette.visual.airline_warning = [ '#2f343f' , '#fac536' , 15 , 11 ]
  let g:airline#themes#MoonMaster#palette.visual.airline_error = [ '#ffffff' , '#990000' , 15 , 140 ]
  let g:airline#themes#MoonMaster#palette.visual_modified = {
        \ 'airline_c': [ '#fac536' , '#2f343f' , 11 , 15 ] ,
        \ 'airline_warning': [ '#2f343f' , '#fac536' , 15 , 11 , '' ] ,
        \ 'airline_error': [ '#ffffff' , '#990000' , 15 , 140 , '' ] ,
        \ }

  " Inactive:
  let s:IA1 = [ '#2f343f' , '#ffffff' , 15 , 8 , '' ]
  let s:IA2 = [ '#ffffff' , '#454c5c' , 12 , 8 , '' ]
  let s:IA3 = [ '#ffffff' , '#2f343f' , 15 , 8 , '' ]
  let g:airline#themes#MoonMaster#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
  let g:airline#themes#MoonMaster#palette.inactive.airline_warning = [ '#2f343f' , '#fac536' , 15 , 11 ]
  let g:airline#themes#MoonMaster#palette.inactive.airline_error = [ '#ffffff' , '#990000' , 15 , 140 ]
  let g:airline#themes#MoonMaster#palette.inactive_modified = {
        \ 'airline_c': [ '#fac536' , '#2f343f' , 11 , 15 , '' ] ,
        \ 'airline_warning': [ '#2f343f' , '#fac536' , 15 , 11 , '' ] ,
        \ 'airline_error': [ '#ffffff' , '#990000' , 15 , 140 , '' ] ,
        \ }


  " CtrlP:
  " if !get(g:, 'loaded_ctrlp', 0)
    " finish
  " endif
  " let g:airline#themes#MoonMaster#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
        " \ [ '#2f343f' , '#ffffff' , 15 , 8  , ''     ] ,
        " \ [ '#2f343f' , '#5294e2' , 8 , 12  , ''     ] ,
        " \ [ '#2f343f' , '#5294e2' , 8 , 15 , '' ] )
