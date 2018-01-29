" Vim completion script
" Language: Stylus
" Author: Ilia Loginov <i.loginow@outlook.com>
" Created: 2018 Jan 28

fun! stylcomplete#CompleteStyl(findstart, base)

  if a:findstart
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] !~ '\(\s\|\[\|(\|{\|.:\@=\)'
      let start -= 1
    endwhile
    let b:start = line[start]
    " let b:curr_el_type = synIDattr(synID(line, start, 1), 'name')
    return start
  endif

  if b:start =~ '\w'

    " Complete properties

    let res = []
    for m in g:css_props
      if m =~ '^' . a:base
        call add(res, m)
      endif
    endfor

    return res

  endif

  return []

endfun
