" Define path

let s:DumbNotePath = expand("<sfile>:p:h:h")
let s:currentworkingdirectory = getcwd()

set iskeyword+=[,]
set path=s:DumbNotePath

" Set the default collection
"
if !exists('g:dumbnoteDefaultCollection')
    let g:dumbnoteDefaultCollection = $HOME . "/dumbnote/"
endif

if !exists('g:dumbnoteFileFormat')
    let g:dumbnoteFileFormat = ".md"
endif

if !isdirectory(g:dumbnoteDefaultCollection)
    call mkdir(g:dumbnoteDefaultCollection)
endif

if !exists('g:dumbnoteCreateCollectionMap')
    let g:dumbnoteCreateCollectionMap = "<leader>zc"
endif

execute "nnoremap" g:dumbnoteCreateCollectionMap '<esc>:call dumbnote#dumbnote#DumbnoteCreateCollection()<cr>'



" Map to create or open a new note
"
if !exists('g:dumbnoteCreateNoteMap')
    let g:dumbnoteCreateNoteMap = "<leader>za"
endif



execute "nnoremap" g:dumbnoteCreateNoteMap '<esc>:call dumbnote#dumbnote#DumbnoteCreateNote()<cr>'



if !exists('g:dumbnoteOpenNoteMap')
    let g:dumbnoteOpenNoteMap = "<leader>zz"
endif

execute "nnoremap" g:dumbnoteOpenNoteMap '<esc>:e' g:dumbnoteDefaultCollection 



if !exists('g:dumbnoteListNotesMap')
    let g:dumbnoteListNotesMap = "<leader>zl"
endif


execute "nnoremap" g:dumbnoteListNotesMap '<esc>:call dumbnote#dumbnote#DumbnoteListNotes()<cr>'



"	if !exists('g:dumbnoteOpenIndexMap')
"	        let g:dumbnoteOpenIndexMap = "<leader>zo"
"	endif
"	
"	if !exists('g:dumbnoteMainIndexPath')
"	    let g:dumbnoteMainIndexPath = g:dumbnoteDefaultCollection . "index.md"
"	endif
"	
"	function! OpenIndex()
"	
"	    if !filereadable(g:dumbnoteMainIndexPath)
"		execute "e " . g:dumbnoteMainIndexPath
"	
"	    else filereadable(g:dumbnoteMainIndexPath)
"		execute "e " . g:dumbnoteMainIndexPath
"	    endif
"	
"	endfunction
"	
"	execute "nnoremap<plug>" g:dumbnoteOpenIndexMap '<esc>:call dumbnote#OpenIndex()<cr>'
"	
"	
"	
"	if !exists('g:dumbnoteCreateLinkMap')
"	    let g:dumbnoteCreateLinkMap = "<enter>"
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
"	execute "nnoremap<plug>" g:dumbnoteCreateLinkMap '<esc>:call dumbnote#CreateLink()<cr>'

