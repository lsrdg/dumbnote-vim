" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

" Define path
"

let s:DumbNotePath = expand("<sfile>:p:h:h")

let s:currentworkingdirectory = getcwd()

set path=s:DumbNotePath

if !exists('OpenIndexMap')
        let g:OpenIndexMap = "<leader>zo"
endif

" Set the default collection
"
if !exists('DefaultCollection')
    let g:DefaultCollection = $HOME . "/dumbnote/"
endif

if !isdirectory(g:DefaultCollection)
    call mkdir(g:DefaultCollection)
endif

if !exists('CreateCollectionMap')
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

execute "nnoremap" CreateCollectionMap '<esc>:call CreateCollection()<cr>'

" Map to create or open a new note
"
if !exists('CreateNoteMap')
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

execute "nnoremap" CreateNoteMap '<esc>:call CreateNote()<cr>'

if !exists("OpenNoteMap")
    let g:OpenNoteMap = "<leader>zz"
endif

function! OpenNote()
    let pattern = '/^#/'

    execute '1lvimgrep ' . pattern . g:DefaultCollection . "*.md"
    execute 'vert lopen 35'

    execute 'setlocal modifiable'
    execute '%normal! dt#'
endfunction

execute "nnoremap" OpenNoteMap '<esc>:call OpenNote()<cr>'

function! OpenIndex()

    echo s:currentworkingdirectory

    if filereadable("collections/index.md")

	let s:indexfile = findfile("collections/index.md")

	echom "Uhu"
	execute "e collections/index.md"

    else
	echom "You should have an index file, damn!"
	echom "Here it goes"
	execute "e collections/index.md"
    endif
endfunction

execute "nnoremap" OpenIndexMap '<esc>:call OpenIndex()<cr>'

if !exists('CreateLinkMap')
    let g:CreateLinkMap = "<enter>"
endif

function! CreateLink()
    let s:Link = expand("<cword>")

" \[\{2}\a\+[^\s]]\{2}    
" \(\s\|[\)\<

    "if s:Link =~? "\[\{2}\<\a\+[^\s]\>]\{2}"
    let s:pattern = s:Link =~? "[\{2}\<\a\+[^\s]\>]\{2}"
    if s:pattern
        echom "uhuuuuu"

    elseif !s:pattern
        echom "Ooooops"
	execute "normal! ?\<\<cr>i[["
	"execute "normal! ea]]"
        "execute "normal! :s/\<<C-r><C-w>\>/\[[\<<C-r><C-w>\>]]/"

    else
	echom "num funfa..."
    endif	


endfunction

execute "nnoremap" CreateLinkMap '<esc>:call CreateLink()<cr>'

