return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local lspconfig = require("lspconfig")
    local servers = { "tsserver", "tailwindcss", "eslint" }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        on_attach = opts.on_attach,
        capabilities = opts.capabilities,
      })
    end
  end,
}
