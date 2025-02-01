return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
    init = function()
      -- Disable default mappings to avoid conflicts
      vim.g.VM_default_mappings = 0

      -- Configure custom mappings similar to VS Code
      vim.g.VM_maps = {
        -- Start visual multi-cursor with Ctrl-c (like VS Code)
        ["Find Under"] = "<C-c>",
        -- Skip current and go to next occurrence
        ["Skip Region"] = "<C-x>",
        -- Remove current cursor/selection
        ["Remove Region"] = "<C-p>",
        -- Select all occurrences
        ["Select All"] = "<C-S-l>",
        -- Start visual multi-cursor mode with vertical block
        ["Start Regex Search"] = "<C-S-d>",
      }

      -- Additional visual-multi settings
      vim.g.VM_theme = "ocean" -- Use ocean theme for cursors
      vim.g.VM_highlight_matches = "underline" -- Highlight matches with underline
      vim.g.VM_show_warnings = 1 -- Show warnings when needed
      vim.g.VM_silent_exit = 1 -- Silent exit from visual-multi mode
    end,
  },
}
