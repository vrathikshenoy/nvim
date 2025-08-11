-- ~/.config/nvim/lua/plugins/fzf.lua
return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional for file icons

  config = function()
    require("fzf-lua").setup {
      winopts = {
        height = 0.85,
        width = 0.80,
        row = 0.35,
        col = 0.50,
        border = "rounded",
        preview = { layout = "vertical" },
        on_create = function()
          vim.cmd "stopinsert" -- Exit insert mode on open
        end,
      },
      keymap = {
        builtin = {
          ["<C-d>"] = "preview-page-down",
          ["<C-u>"] = "preview-page-up",
        },
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },
      files = {
        previewer = "bat",
      },
      grep = {
        previewer = "bat",
      },
    }
  end,
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find buffers" },
    { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help tags" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
    { "<leader>fc", "<cmd>FzfLua commands<cr>", desc = "Commands" },
    { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
  },
}
