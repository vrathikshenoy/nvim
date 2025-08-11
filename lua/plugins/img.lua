return {
  {
    "3rd/image.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      backend = "kitty",
      integrations = {
        markdown = { enabled = true },
        neorg = { enabled = true },
      },
      max_width = 100,
      max_height = 50,
    },
    -- Add proper filetype detection
    init = function()
      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { "neo-tree" },
        callback = function()
          vim.keymap.set("n", "<CR>", function()
            local node = require("neo-tree.ui.renderer").get_node()
            if node and node.path then
              local ext = node.path:match "%.([^%.]+)$"
              if ext and vim.tbl_contains({ "png", "jpg", "jpeg", "gif" }, ext:lower()) then
                -- Open in new split
                vim.cmd("vs " .. node.path)
                -- Set binary mode off and enable image viewing
                vim.bo.binary = false
                require("image").setup()
              else
                require("neo-tree.command").execute { action = "open" }
              end
            end
          end, { buffer = true, silent = true })
        end,
      })

      -- Set up filetype detection for images
      vim.filetype.add {
        extension = {
          png = "image",
          jpg = "image",
          jpeg = "image",
          gif = "image",
        },
      }
    end,
  },
}
