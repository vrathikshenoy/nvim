return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Neo-tree setup with enhanced configuration
    require("neo-tree").setup {
      filesystem = {
        filtered_items = {
          visible = true, -- Show hidden files by default
          hide_dotfiles = false, -- Don't hide dotfiles
          hide_gitignored = false, -- Don't hide gitignored files
        },
        --[[  follow_current_file = {
          enabled = true, -- Follow the current file when changing buffers
        }, ]]
        use_libuv_file_watcher = true, -- Use more efficient file watcher
      },

      default_component_configs = {
        indent = {
          with_expanders = true, -- Use expander (arrow) icons
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    }
    -- Function to check if Neo-tree is open and get its window

    -- Key mappings
    vim.keymap.set(
      "n",
      "<leader>bf",
      ":Neotree buffers reveal float<CR>",
      { noremap = true, silent = true, desc = "Show buffers in Neo-tree" }
    )
  end,
}
