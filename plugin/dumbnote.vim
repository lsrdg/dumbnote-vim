" Auto save

augroup autosave
  autocmd!
  autocmd CursorHold,CursorHoldI,BufLeave,BufWinLeave,
        \QuitPre,FocusLost,CursorMovedI,CursorMoved,
        \InsertLeave *.md update
augroup END

" Define path

let s:DumbNotePath = expand("<sfile>:p:h:h")
let s:currentworkingdirectory = getcwd()

set iskeyword+=[,]
"set path=.,s:DumbNotePath

" Set the default collection
"
if !exists('g:dumbnoteDefaultCollection')
    let g:dumbnoteDefaultCollection = $HOME . "/dumbnote/"
endif

"set path=.,g:dumbnoteDefaultCollection

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

execute "nnoremap" g:dumbnoteOpenNoteMap '<esc>:DumbnoteOpenNote '


function! DumbnoteOpenNote(...)
    let Note = a:1
    execute "e " Note 
endfunction

function! DumbnotePathsCompletion(ArgLead, CmdLine, CursorPos)
    let myList = split(globpath(g:dumbnoteDefaultCollection, '**/*'), '\n')
    return filter(myList, 'v:val =~ "^'. a:ArgLead .'"')
endfunction

command! -bang -complete=customlist,DumbnotePathsCompletion -nargs=* DumbnoteOpenNote call DumbnoteOpenNote(<f-args>)
"-------------------------------------------

" command! -bang -complete=customlist,DumbnotePathsCompletion -nargs=+ DumbnoteCreateNote call dumbnote#dumbnote#DumbnoteCreateNote(<f-args>)


if !exists('g:dumbnoteListNotesMap')
    let g:dumbnoteListNotesMap = "<leader>zl"
endif


execute "nnoremap" g:dumbnoteListNotesMap '<esc>:call dumbnote#dumbnote#DumbnoteListNotes()<cr>'

""""""""""""""""""""""""""""""""""""""""""""""
" Delete note(s) and collection(s)
"
" command! -nargs=1 -complete=file DumbnoteDelete
    \ :execute dumbnote#dumbnote#DumbnoteDelete(<f-args>)



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

