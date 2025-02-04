return {
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      -- Load context_commentstring first
      require("ts_context_commentstring").setup({
        enable_autocmd = false,
        -- Add Python to the list of supported languages
        config = {
          python = "# %s",
        },
      })

      require("Comment").setup({
        -- Enable pre_hook to detect filetype-specific comment strings
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),

        -- Optional: Customize keymappings
        -- Toggle comment for current line
        toggler = {
          line = "gcc", -- Normal mode
          block = "gbc", -- Block mode
        },
        -- Toggle comment for selected lines
        opleader = {
          line = "gc", -- Normal mode
          block = "gb", -- Block mode
        },

        -- Enable comment string detection for common file types
        mappings = {
          basic = true, -- Enable basic mappings
          extra = false, -- Enable extra mappings
        },
      })
    end,
  },
}
