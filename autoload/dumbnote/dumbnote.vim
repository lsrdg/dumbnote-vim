" function! dumbnote#dumbnote#DumbnoteOpenNote(...)
" 
"     echom a:1
" endfunction

function! dumbnote#dumbnote#DumbnoteCreateCollection()
    
    call inputsave()

    let s:CollectionName = input("Collection's name, please: ")
    call inputrestore()
    let s:CollectionPath = g:dumbnoteDefaultCollection . s:CollectionName . "/"

    if !isdirectory(s:CollectionPath)
	call mkdir(s:CollectionPath)
    endif

    let s:CollectionIndex = s:CollectionPath . s:CollectionName . g:dumbnoteFileFormat

    if !filereadable(s:CollectionIndex) 
	execute "e " . s:CollectionIndex
    endif

    execute "normal! i# " . s:CollectionName

endfunction

function! dumbnote#dumbnote#DumbnoteNoteNameInput()

    call inputsave()

    let s:NoteName = input("Note: ", "", g:dumbnoteDefaultCollection)
    call inputrestore()
    return s:NoteName
endfunction


" g:dumbnoteDefaultCollection . 
"
function! dumbnote#dumbnote#DumbnoteCreateNote()

    call inputsave()
    let s:NoteName = input("Note: ", "", 'g:dumbnoteDefaultCollection')
    call inputrestore()

    let s:NotePath = s:NoteName . g:dumbnoteFileFormat

    execute "e " . s:NotePath
    execute "normal! i# " . s:NoteName


endfunction

function! dumbnote#dumbnote#DumbnoteListNotes()
    execute "vsplit " . g:dumbnoteDefaultCollection
endfunction

function! dumbnote#dumbnote#DumbnoteDelete(paths)
    let delete_arg = a:paths
    call delete(delete_arg)
endfunction
