# Vim-Cats
Learning vimscript so I can have my cat in vim (Changed to neovim so I am now using lua)

## Installation
##### No plugin manager support at the moment
   
Download the cats.lua file and add it to a folder under ```~/.config/nvim/```. I personally use ```~/.config/nvim/lua/```

In your init.vim add:
```   
lua require('cats')   
   ```

## Customization
To have the cat spawn on neovim launch add the following line to your init.vim
```
let g:cat_on_start = 1
   ```

To have a different cat edit the ascii_art variable at the top of the function, try to make it a rectangle for best results.

### Credits
The cat ascii art was made by Blazej Kozlowski
