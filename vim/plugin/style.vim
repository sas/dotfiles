set textwidth=80
set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab
set formatoptions=2tcroqlv
set cinoptions=g0,t0,c1s,(0,m1,l1 
set cinwords+=case

let c_comment_strings=1
let c_space_errors=1

let local_styles = {
      \ "~/Source/openbsd": "openbsd.vim"
      \ }

function ApplyStyle()
  for [ source_path, script_path ] in items(g:local_styles)
    if expand("%:p") =~ expand(source_path) . "*"
      exec ":runtime style/" . script_path
    endif
  endfor
endfunction

autocmd BufNewFile,BufRead * call ApplyStyle()
