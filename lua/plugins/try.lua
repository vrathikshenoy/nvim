return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    opts = {
      -- CORE FEATURES --
      dashboard = { enabled = true },
      scroll = { enabled = true },
      words = { enabled = true },

      -- Snacks.image tools (direct host usage)
      image = {
        enabled = true,
        tools = {
          kitty = { cmd = "kitty" },
          magick = { cmd = "magick" },
          gs = { cmd = "gs" },
          pdflatex = { cmd = "pdflatex" },
          mmdc = { cmd = "mmdc" },
        },
      },

      -- Snacks.picker & Snacks.lazygit (no flatpak)
      picker = {
        hidden = true,
        ignored = true,
        grep = { cmd = "rg" },
        files = { cmd = "fd" },
      },

      lazygit = {
        enabled = true,
        cmd = "lazygit",
      },
    },
    config = function(_, opts)
      -- Optional: Only needed if you still need to add host tools manually.
      -- vim.env.PATH = vim.env.PATH .. ":/run/host/usr/bin"

      require("snacks").setup(opts)

      -- If needed: override vim.ui settings here
    end,
  },
}
