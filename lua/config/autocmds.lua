-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Watch for changes in python dependency files and restart LSP
local watched_files = { "uv.lock", "poetry.lock", "requirements.txt", "pyproject.toml" }
local file_mtimes = {}

local function get_mtime(path)
  local stat = vim.uv.fs_stat(path)
  return stat and stat.mtime.sec or nil
end

local function update_mtimes()
  local cwd = vim.fn.getcwd()
  for _, file in ipairs(watched_files) do
    local path = cwd .. "/" .. file
    file_mtimes[path] = get_mtime(path)
  end
end

-- Initialize mtimes
update_mtimes()

vim.api.nvim_create_autocmd({ "FocusGained", "DirChanged" }, {
  callback = function()
    local cwd = vim.fn.getcwd()
    local restart = false
    for _, file in ipairs(watched_files) do
      local path = cwd .. "/" .. file
      local current_mtime = get_mtime(path)
      local old_mtime = file_mtimes[path]

      if current_mtime and old_mtime and current_mtime > old_mtime then
        restart = true
      end
      
      -- Update stored mtime
      if current_mtime then
        file_mtimes[path] = current_mtime
      end
    end

    if restart then
      vim.notify("Python dependencies changed. Restarting LSP...", vim.log.levels.INFO)
      vim.cmd("LspRestart")
    end
  end,
})