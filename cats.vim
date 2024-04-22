" Define the command Meow
" First Meow is from the input and the second is function to call
" nargs is amount of arguements
command -nargs=0 Meow Meow

" Define the function Meow()
function! Meow()
  echo "Meow"
endfunction
