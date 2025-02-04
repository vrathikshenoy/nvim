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
    require("neo-tree").setup({
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
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<space>"] = "toggle_node",
          ["<cr>"] = "open",
          ["P"] = { "toggle_preview", config = { use_float = true } },
          ["l"] = "focus_preview",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- Use expander (arrow) icons
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    })

    -- Function to check if Neo-tree is open and get its window
    local function get_neo_tree_window()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "neo-tree" then
          return win
        end
      end
      return nil
    end

    -- Enhanced toggle function with window focus handling
    local function smart_toggle()
      local current_win = vim.api.nvim_get_current_win()
      local neo_tree_win = get_neo_tree_window()

      if not neo_tree_win then
        vim.cmd("Neotree show")
      else
        if vim.api.nvim_get_current_win() == neo_tree_win then
          vim.api.nvim_set_current_win(current_win)
        else
          vim.api.nvim_set_current_win(neo_tree_win)
        end
      end
    end

    -- Keymaps
    vim.keymap.set("n", "<C-x>", smart_toggle, { noremap = true, silent = true, desc = "Toggle Neo-tree focus" })

    vim.keymap.set(
      "n",
      "<C-n>",
      ":Neotree toggle left<CR>",
      { noremap = true, silent = true, desc = "Toggle Neo-tree sidebar" }
    )

    vim.keymap.set(
      "n",
      "<leader>bf",
      ":Neotree buffers reveal float<CR>",
      { noremap = true, silent = true, desc = "Show buffers in Neo-tree" }
    )
  end,
}
