function! dumbnote#dumbnote#DumbnoteCreateCollection()
    
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

function! dumbnote#dumbnote#DumbnoteNoteNameInput()

    call inputsave()

    let s:NoteName = input("Note: ")
    call inputrestore()
    return s:NoteName
endfunction

function! dumbnote#dumbnote#DumbnoteCreateNote()

    call dumbnote#dumbnote#DumbnoteNoteNameInput()

    let s:NotePath = g:DefaultCollection . s:NoteName . ".md"

    execute "e " . s:NotePath
    execute "normal! i# " . s:NoteName


endfunction

function! dumbnote#dumbnote#DumbnoteListNotes()
    execute "vsplit " . g:DefaultCollection
endfunction
