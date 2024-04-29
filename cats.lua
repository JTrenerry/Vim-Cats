-- Global value so I can toggle
local buf = nil

local on_start = vim.api.nvim_get_var("cat_on_start")

function display_ascii_art()
    local ascii_art = {
        [[  _._     _,-'""`-._    ]],
        [[(,-.`._,'(       |\`-/| ]],
        [[    `-.-' \ )-`( , o o) ]],
        [[          `-    \`_`"'- ]]   
    }

    -- Kill the buffer if it exists
    if buf and vim.api.nvim_buf_is_valid(buf) then
        vim.api.nvim_buf_delete(buf, {force=true})
        buf = nil
        return
    end

    -- Save the current window
    local current_win = vim.api.nvim_get_current_win()

    -- Save the cursor position
    local cursor = vim.api.nvim_win_get_cursor(current_win)

    -- Calculate the position of the bottom right corner
    local win_width = vim.api.nvim_get_option("columns")
    local win_height = vim.api.nvim_get_option("lines")
    local art_width = ascii_art[1]:len()
    local art_height = #ascii_art
    local row = win_height - art_height - 2 -- Leave space for status line & white thingy
    local col = win_width - art_width - 1

    -- Create a new buffer
    buf = vim.api.nvim_create_buf(false, true)
    
    -- Set the buffer content to the ASCII art
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, ascii_art)
   
    vim.api.nvim_buf_set_option(buf, 'modifiable', false)

    -- Open the buffer in a new split window at the calculated position
    vim.api.nvim_command("split")
    vim.api.nvim_win_set_buf(0, buf)
    vim.api.nvim_win_set_option(0, "winhl", "Normal:Normal")  -- Disable window highlighting
    vim.api.nvim_win_set_config(0, {relative='editor', row=row, col=col, width=art_width, height=art_height, style='minimal'})
    
    -- Return to the original window
    vim.api.nvim_set_current_win(current_win)

    -- Restore the cursor position
    vim.api.nvim_win_set_cursor(current_win, cursor)
end

-- Define a command to trigger the function
vim.cmd([[command! Sirius lua display_ascii_art()]])

-- Check if the option is set
if on_start == nil then
    on_start = false
end

-- Display the art on startup if the option is set
if on_start then
    display_ascii_art()
end
