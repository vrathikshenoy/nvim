-- lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  opts = {},
  event = { "BufWritePre" },
  cmd = "ConformInfo",
}
