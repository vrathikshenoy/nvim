return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },
      },
    },
    keys = {
      { "<leader>lR", "<cmd>LspRestart<cr>", desc = "Restart LSP" },
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    opts = {
      auto_refresh = true,
      search_venv_managers = true,
      search_workspace = true,
      dap_enabled = true,
      hooks = {
        PostrunActiveVenv = function()
          vim.cmd("LspRestart")
          return 1
        end,
      },
    },
    event = "VeryLazy",
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
    },
  },
}
