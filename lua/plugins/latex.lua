return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_fold_enabled = 1
      vim.g.vimtex_complete_enabled = 1
      
      -- Simple latexmk configuration
      vim.g.vimtex_compiler_latexmk = {
        executable = "latexmk",
        options = {
          "-pdf",
          "-interaction=nonstopmode",
          "-synctex=1",
          "-file-line-error",
        },
      }
    end,
    keys = {
      { "<leader>tc", "<cmd>VimtexCompile<cr>", desc = "Compile LaTeX", ft = "tex" },
      { "<leader>tv", "<cmd>VimtexView<cr>", desc = "View PDF", ft = "tex" },
      { "<leader>tC", "<cmd>VimtexClean<cr>", desc = "Clean auxiliary files", ft = "tex" },
      { "<leader>tA", "<cmd>VimtexCleanAll<cr>", desc = "Clean all files", ft = "tex" },
      { "<leader>ts", "<cmd>VimtexStatus<cr>", desc = "Show compilation status", ft = "tex" },
      { "<leader>te", "<cmd>VimtexErrors<cr>", desc = "Show errors", ft = "tex" },
      { "<leader>to", "<cmd>VimtexCompileOutput<cr>", desc = "Show compilation output", ft = "tex" },
      { "<leader>tt", "<cmd>VimtexTocOpen<cr>", desc = "Open table of contents", ft = "tex" },
      { "<leader>tT", "<cmd>VimtexTocToggle<cr>", desc = "Toggle table of contents", ft = "tex" },
      { "<leader>tS", "<cmd>VimtexStop<cr>", desc = "Stop compilation", ft = "tex" },
      { "<leader>tr", "<cmd>VimtexReload<cr>", desc = "Reload vimtex", ft = "tex" },
      { "<leader>ti", "<cmd>VimtexInfo<cr>", desc = "Show vimtex info", ft = "tex" },
      { "<leader>tf", "<cmd>VimtexForwardSearch<cr>", desc = "Forward search", ft = "tex" },
      { "<leader>tx", "<cmd>VimtexToggleMain<cr>", desc = "Toggle main file", ft = "tex" },
      { "<leader>tb", "<cmd>VimtexBibTeX<cr>", desc = "Run BibTeX", ft = "tex" },
      { "<leader>tp", "<cmd>!xdg-open %:p:r.pdf<cr>", desc = "Open PDF with system viewer", ft = "tex" },
    },
  },
}