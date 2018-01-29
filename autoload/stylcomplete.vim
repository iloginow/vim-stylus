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
    " Check if there is more than one word on the current line
    let b:word_break = 0
    let b:first_word_type = ''
    if strridx(line[0:start], '.\{-}\S\(\s\|\[\|(\|{\|.:\@=\)\S') >= 0
      b:word_break = 1
      " If that is the case, find out what kind of word it is
      b:first_word_type = synIDattr(synID(line, cindent('.') + 1, 1), 'name')
    endif
    return start
  endif

  " Complete properties
  if b:start =~ '\w' && b:word_break == 0
    let res = []
    for m in g:css_props
      if m =~ '^' . a:base
        call add(res, m)
      endif
    endfor
    return res

  " Complete values
  elseif b:start =~ '\w' && b:word_break == 1 && b:first_word_type == 'stylusProperty'
    let res = []
    for m in g:css_values
      if m =~ '^' . a:base
        call add(res, m)
      endif
    endfor
    return res

  endif

  return []

endfun
