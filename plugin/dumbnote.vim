" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

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

function! CreateCollection()
    
    call inputsave()

    let s:CollectionName = input("Collection's name, please: ")
    call inputrestore()
    let s:CollectionPath = g:DefaultCollection . s:CollectionName . "/"

    if !isdirectory(s:CollectionPath)
	call mkdir(s:CollectionPath)
    endif

    let s:CollectionIndex = s:CollectionPath . s:CollectionName . ".md"

    if !filereadable(s:CollectionIndex) 
	execute "e " . s:CollectionIndex
    endif

    execute "normal! i# " . s:CollectionName

endfunction

execute "nnoremap" g:CreateCollectionMap '<esc>:call CreateCollection()<cr>'



" Map to create or open a new note
"
if !exists('g:CreateNoteMap')
    let g:CreateNoteMap = "<leader>za"
endif

function! NoteNameInput()

    call inputsave()

    let s:NoteName = input("Note: ")
    call inputrestore()
    return s:NoteName
endfunction

function! CreateNote()

    call NoteNameInput()

    let s:NotePath = g:DefaultCollection . s:NoteName . ".md"

    execute "e " . s:NotePath
    execute "normal! i# " . s:NoteName


endfunction

execute "nnoremap" g:CreateNoteMap '<esc>:call CreateNote()<cr>'



if !exists('g:OpenNoteMap')
    let g:OpenNoteMap = "<leader>zz"
endif

execute "nnoremap" g:OpenNoteMap '<esc>:e' g:DefaultCollection 



if !exists('g:ListNotesMap')
    let g:ListNotesMap = "<leader>zl"
endif

function! ListNotes()
    execute "vsplit " . g:DefaultCollection
endfunction

execute "nnoremap" g:ListNotesMap '<esc>:call ListNotes()<cr>'



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
"	execute "nnoremap" g:OpenIndexMap '<esc>:call OpenIndex()<cr>'
"	
"	
"	
"	if !exists('g:CreateLinkMap')
"	    let g:CreateLinkMap = "<enter>"
"	endif
"	
"	function! CreateLink()
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
"	execute "nnoremap" g:CreateLinkMap '<esc>:call CreateLink()<cr>'

