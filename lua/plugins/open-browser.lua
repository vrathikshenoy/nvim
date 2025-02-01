-- LazyVim plugin configuration for clickable links

-- Add the open-browser.vim plugin
return {
  {
    "tyru/open-browser.vim",
    config = function()
      -- Optionally configure any settings here
    end,
  },

  -- Keybinding to open URL under cursor
  vim.keymap.set("n", "<leader>o", ":OpenBrowser<CR>", { silent = true }),
}
