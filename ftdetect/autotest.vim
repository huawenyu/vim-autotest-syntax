"let blacklist = ['c', 'h', 'hpp', 'C', 'c++', 'cpp', 'vim', 'py', 'txt']
au BufNewFile,BufRead *.case set filetype=autotest
au BufNewFile,BufRead *.suite set filetype=autotest
"au BufNewFile,BufRead log.* if index(blacklist, &ft) < 0 | set filetype=autotest
"command -count=1 -nargs=0 Log silent! call log#Ignore(<count>)
