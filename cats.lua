-- Define the function to display ASCII art in a new buffer
function display_ascii_art()
    local ascii_art = {
[[  _._     _,-'""`-._]],
"(,-.`._,'(       |\\`-/|",
"    `-.-' \\ )-`( , o o)",
[[          `-    \\`_`"'-]]   
    }
    -- Calculate the position of the bottom right corner
    local win_width = vim.api.nvim_get_option("columns")
    local win_height = vim.api.nvim_get_option("lines")
    local art_width = 30
    local art_height = 5
    local row = win_height - art_height - 2 -- Leave space for status line
    local col = win_width - art_width - 1

    -- Create a new buffer
    local buf = vim.api.nvim_create_buf(false, true)
    
    -- Set the buffer content to the ASCII art
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, ascii_art)
   
    vim.api.nvim_buf_set_option(buf, 'modifiable', false)

    -- Open the buffer in a new split window at the calculated position
    vim.api.nvim_command("split")
    vim.api.nvim_win_set_buf(0, buf)
    vim.api.nvim_win_set_option(0, "winhl", "Normal:Normal")  -- Disable window highlighting
    vim.api.nvim_win_set_config(0, {relative='editor', row=row, col=col, width=art_width, height=art_height, style='minimal'})
end

-- Define a command to trigger the function
vim.cmd([[command! Sirius lua display_ascii_art()]])
