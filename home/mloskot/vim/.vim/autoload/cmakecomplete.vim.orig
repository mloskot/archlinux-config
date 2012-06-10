" Description: Omni completion for CMake
" Maintainer:  Richard Quirk richard.quirk at gmail.com
" License:     Apache License 2.0
"
" To install this, copy the contents of this file to
"   $HOME/.vim/autoload/cmakecomplete.vim
" and add the following line to your .vimrc file
"   autocmd FileType cmake  set omnifunc=cmakecomplete#Complete
" (uncommented, of course!)
" Then in a CMakeLists.txt file, use C-X C-O to autocomplete cmake
" keywords with the corresponding info shown in the info buffer.

" this is the list of potential completions
let s:cmake_items = []
let s:cmake_properties = []
let s:cmake_modules = []

function cmakecomplete#AddWord(word, info, list, ignore_case)
  " strip the leading spaces, add the info
  call add(a:list, {'word': substitute(a:word, '^\W\+', '', 'g'),
        \ 'icase': a:ignore_case,
        \ 'info': a:info})
endfunction

function cmakecomplete#Init(help, list, ignore_case)
  " parse the help to get completions
  let output = system('cmake --help-' . a:help)
  let word = ''
  let info = ''
  let re = '^\W\W[a-zA-Z_]\+$'
  if !a:ignore_case
    let re = '^\W\W[A-Z_]\+$'
  endif
  for c in split(output, '\n')
    " CMake commands start with 2 blanks and then a lowercase letter
    if c =~ re
      if word != ''
        call cmakecomplete#AddWord(word, info, a:list, a:ignore_case)
      endif
      let info = c . "\n"
      let word = c
    else
      " if we have a command, then the rest is the help
      if word != ''
        " End of the help is marked with line of dashes
        " But only after getting at least one command
        if c =~ '^-\+$'
          continue
        endif
        let info = info . c . "\n"
      endif
    endif
  endfor
  " add the last command to the list
  if word != ''
    call cmakecomplete#AddWord(word, info, a:list, a:ignore_case)
  endif
endfunction

function! cmakecomplete#InComment()
  return match(synIDattr(synID(line("."), col(".")-1, 1), "name"), '\<cmakeComment') >= 0
endfunction

function! cmakecomplete#InFunction(line)
  let current_method = matchstr(a:line, '.*([^)]*$')
  if current_method != ''
    return 1
  endif
  return 0
endfunction

function! cmakecomplete#InInclude(line)
  let current_method = matchstr(tolower(a:line), 'include([^)]*$')
  if current_method != ''
    return 1
  endif
  return 0
endfunction

function! cmakecomplete#Complete(findstart, base)
  if a:findstart == 1
    let s:cmakeNoComplete = 0
    " first time, wants to know where the word starts
    if cmakecomplete#InComment()
      let s:cmakeNoComplete = 1
      return -1
    endif
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '[a-zA-Z_]'
      let start -= 1
    endwhile
    let s:compl_context = line[0:col('.')-2]
    return start
  endif
  if exists("s:compl_context")
    let line = s:compl_context
    unlet! s:compl_context
  else
    let line = a:base
  endif

  if s:cmakeNoComplete
    return []
  endif

  let res = []
  let list = s:cmake_items
  let match = '^' . tolower(a:base)
  if cmakecomplete#InInclude(line)
    " return modules
    let match = '^' . a:base
    let list = s:cmake_modules
  elseif cmakecomplete#InFunction(line)
    " return completion variables
    let match = '^' . a:base
    let list = s:cmake_properties
  endif
  " return the completion words
  for m in list
    if m['word'] =~ match
      call add(res, m)
    endif
  endfor
  " problem here: always returns lower case
  return res
endfunction
call cmakecomplete#Init('commands', s:cmake_items, 1)
call cmakecomplete#Init('properties', s:cmake_properties, 0)
call cmakecomplete#Init('modules', s:cmake_modules, 1)
