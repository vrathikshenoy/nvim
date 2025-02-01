return {
  "terrortylor/nvim-comment",
  config = function()
    require("nvim_comment").setup({
      -- You can set more options here if needed
      line_mapping = "gcc", -- Comment line with gcc
      operator_mapping = "gc", -- Comment selection with gc in visual mode
    })
  end,
}
