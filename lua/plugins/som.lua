return {
  {
    "EdenEast/nightfox.nvim",
    priority = 1000, -- Ensure it's loaded before other UI plugins
    config = function()
      require("nightfox").setup {
        options = {
          transparent = true, -- Enable transparent background
          dim_inactive = false, -- Dim inactive windows
          styles = {
            comments = "italic", -- Italic comments
            keywords = "bold", -- Bold keywords
            functions = "italic,bold",
            strings = "NONE",
            variables = "NONE",
          },
        },
      }

      vim.cmd "colorscheme carbonfox"
    end,
  },
}
