if filereadable("cscope.out")
  cs add cscope.out  
elseif $CSCOPE_DB != ""
  cs add $CSCOPE_DB
endif

set cscopetag
set cscopetagorder=0
set cscopeverbose

nmap <C-\>s :cscope find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>g :cscope find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :cscope find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :cscope find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :cscope find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :cscope find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :cscope find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cscope find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

nmap <C-@><C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-@><C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
nmap <C-@><C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>
