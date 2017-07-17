" Define path

let s:DumbNotePath = expand("<sfile>:p:h:h")
let s:currentworkingdirectory = getcwd()

set iskeyword+=[,]
set path=s:DumbNotePath

" Set the default collection
"
if !exists('g:DefaultCollection')
    let g:DefaultCollection = $HOME . "/dumbnote/"
endif

if !isdirectory(g:DefaultCollection)
    call mkdir(g:DefaultCollection)
endif


if !exists('g:CreateCollectionMap')
    let g:CreateCollectionMap = "<leader>zc"
endif

execute "nnoremap" g:CreateCollectionMap '<esc>:call dumbnote#dumbnote#DumbnoteCreateCollection()<cr>'



" Map to create or open a new note
"
if !exists('g:CreateNoteMap')
    let g:CreateNoteMap = "<leader>za"
endif



execute "nnoremap" g:CreateNoteMap '<esc>:call dumbnote#dumbnote#DumbnoteCreateNote()<cr>'



if !exists('g:OpenNoteMap')
    let g:OpenNoteMap = "<leader>zz"
endif

execute "nnoremap" g:OpenNoteMap '<esc>:e' g:DefaultCollection 



if !exists('g:ListNotesMap')
    let g:ListNotesMap = "<leader>zl"
endif


execute "nnoremap" g:ListNotesMap '<esc>:call dumbnote#dumbnote#DumbnoteListNotes()<cr>'



"	if !exists('g:OpenIndexMap')
"	        let g:OpenIndexMap = "<leader>zo"
"	endif
"	
"	if !exists('g:MainIndexPath')
"	    let g:MainIndexPath = g:DefaultCollection . "index.md"
"	endif
"	
"	function! OpenIndex()
"	
"	    if !filereadable(g:MainIndexPath)
"		execute "e " . g:MainIndexPath
"	
"	    else filereadable(g:MainIndexPath)
"		execute "e " . g:MainIndexPath
"	    endif
"	
"	endfunction
"	
"	execute "nnoremap<plug>" g:OpenIndexMap '<esc>:call dumbnote#OpenIndex()<cr>'
"	
"	
"	
"	if !exists('g:CreateLinkMap')
"	    let g:CreateLinkMap = "<enter>"
"	endif
"	
"	function! DumbnoteCreateLink()
"	    let s:Link = expand("<cword>")
"	    let s:pattern = "\v\[{2}\w+\]{2}"
"	    let s:matchLinkPattern = s:Link =~? s:pattern
"	
"	    if s:Link
"	        echom "uhuuuuu"
"	
"	    elseif s:Link !=? s:pattern
"	        echom "Ooooops"
"		"execute "normal! ?\<\<cr>i[["
"		"execute "normal! ea]]"
"	        "execute "normal! :s/\<<C-r><C-w>\>/\[[\<<C-r><C-w>\>]]/"
"	
"	    else
"		echom "num funfa..."
"	    endif	
"	
"	
"	endfunction
"	
"	execute "nnoremap<plug>" g:CreateLinkMap '<esc>:call dumbnote#CreateLink()<cr>'

