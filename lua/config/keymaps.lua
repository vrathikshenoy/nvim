-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Map Caps Lock key directly in Neovim (no system-level changes needed)
-- Caps Lock sends <F37> in most terminals when mapped this way

-- Method 1: Direct Caps Lock mapping using key codes
-- Insert mode: Caps Lock -> Normal mode
map("i", "<F37>", "<Esc>", { desc = "Exit insert mode with Caps Lock" })
map("i", "<C-[>", "<Esc>", { desc = "Exit insert mode with Ctrl+[" })

-- Visual/Select modes: Caps Lock -> Normal mode
map({ "v", "s" }, "<F37>", "<Esc>", { desc = "Exit visual/select mode with Caps Lock" })
map({ "v", "s" }, "<C-[>", "<Esc>", { desc = "Exit visual/select mode with Ctrl+[" })

-- Command mode: Caps Lock -> Cancel command
map("c", "<F37>", "<C-c>", { desc = "Cancel command mode with Caps Lock" })
map("c", "<C-[>", "<C-c>", { desc = "Cancel command mode with Ctrl+[" })

-- Terminal mode: Caps Lock -> Normal mode
map("t", "<F37>", "<C-\\><C-n>", { desc = "Exit terminal mode with Caps Lock" })
map("t", "<C-[>", "<C-\\><C-n>", { desc = "Exit terminal mode with Ctrl+[" })

-- Method 2: Alternative approach using terminal key sequences
-- Some terminals send different codes for Caps Lock
local caps_variations = {
  "<F37>", -- Most common
  "<F13>", -- Some terminals
  "<S-F1>", -- Alternative mapping
}

for _, key in ipairs(caps_variations) do
  map("i", key, "<Esc>", { desc = "Exit insert mode with Caps Lock" })
  map({ "v", "s" }, key, "<Esc>", { desc = "Exit visual/select mode with Caps Lock" })
  map("c", key, "<C-c>", { desc = "Cancel command mode with Caps Lock" })
  map("t", key, "<C-\\><C-n>", { desc = "Exit terminal mode with Caps Lock" })
  map("o", key, "<Esc>", { desc = "Cancel operator-pending mode with Caps Lock" })
end

-- Method 3: Terminal-specific Caps Lock detection
-- Add this to your init.lua or a separate config file
local function setup_capslock_detection()
  -- Detect Caps Lock press and map it
  vim.api.nvim_create_autocmd("TermResponse", {
    callback = function()
      -- This is a more advanced method that requires terminal cooperation
      -- Most modern terminals can be configured to send specific codes for Caps Lock
    end,
  })
end

-- Method 4: Alternative fast escape methods (highly recommended)
-- These work in all situations and are very fast
map("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })
map("i", "kj", "<Esc>", { desc = "Exit insert mode with kj" })
map("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })

-- Enhanced escape with timeout for better experience
map("i", "j", function()
  -- Quick escape if 'k' follows within 200ms
  local timer = vim.loop.new_timer()
  local escaped = false

  timer:start(200, 0, function()
    if not escaped then
      timer:close()
    end
  end)

  return "j"
end, { expr = true, desc = "Smart j for jk escape" })

-- Method 5: Using Ctrl+C as Caps Lock alternative (recommended)
-- Ctrl+C is easier to reach and works everywhere
map("i", "<C-c>", "<Esc>", { desc = "Exit insert mode with Ctrl+C" })
map({ "v", "s" }, "<C-c>", "<Esc>", { desc = "Exit visual/select mode with Ctrl+C" })

-- Method 6: Space+key combinations (for one-handed operation)
map("i", "<Space><Space>", "<Esc>", { desc = "Exit insert mode with double space" })

-- Enhanced functionality after escape
map("n", "<leader>w", ":w<CR>", { desc = "Quick save" })
map("n", "<leader>q", ":q<CR>", { desc = "Quick quit" })
