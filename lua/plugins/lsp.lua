return {
  -- Mason
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- Mason LSP Config
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "tailwindcss", "eslint" },
        automatic_installation = true,
      })
    end,
  },

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      -- Ensure these are loaded
      require("mason")
      require("mason-lspconfig")

      local lspconfig = require("lspconfig")

      -- Directly set up the servers
      local servers = { "tsserver", "tailwindcss", "eslint" }
      for _, server in ipairs(servers) do
        lspconfig[server].setup({})
      end
    end,
  },
}
