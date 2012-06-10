" ~/.vim/filetype.vim 
" Mateusz Loskot <mateusz@loskot.net>
"
if exists("did_load_filetypes")
        finish
endif

" jam detection
augroup filetypedetect
        au! BufRead,BufNewFile Jamroot        setfiletype jam
augroup END
