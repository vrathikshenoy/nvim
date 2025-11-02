--[[
██████╗ ██╗   ██╗███████╗███████╗███╗   ██╗
██╔══██╗╚██╗ ██╔╝╚══███╔╝██╔════╝████╗  ██║
██████╔╝ ╚████╔╝   ███╔╝ █████╗  ██╔██╗ ██║
██╔══██╗  ╚██╔╝   ███╔╝  ██╔══╝  ██║╚██╗██║
██║  ██║   ██║   ███████╗███████╗██║ ╚████║
╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝╚═╝  ╚═══╝
--]]

-- RyzeN's LazyVim Configuration
-- Mini.starter configuration with custom dashboard

return {
  "nvim-mini/mini.starter",
  version = false,
  event = "VimEnter",
  opts = function()
    -- Set RyzeN header to green
    vim.api.nvim_set_hl(0, "MiniStarterHeader", { fg = "#25be66", bold = true })

    local logo = [[





      ██████╗ ██╗   ██╗███████╗███████╗███╗   ██╗
      ██╔══██╗╚██╗ ██╔╝╚══███╔╝██╔════╝████╗  ██║
      ██████╔╝ ╚████╔╝   ███╔╝ █████╗  ██╔██╗ ██║
      ██╔══██╗  ╚██╔╝   ███╔╝  ██╔══╝  ██║╚██╗██║
      ██║  ██║   ██║   ███████╗███████╗██║ ╚████║
      ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝╚═╝  ╚═══╝
    ]]

    local pad = string.rep(" ", 6) -- Align with start of RYZEN
    local new_section = function(name, action, section)
      return { name = name, action = action, section = pad .. section }
    end

    local starter = require "mini.starter"
    local config = {
      evaluate_single = true,
      header = logo,
      items = {
        new_section("Find file", "Telescope find_files", "Telescope"),
        new_section("Recent files", "Telescope oldfiles", "Telescope"),
        new_section("Find text", "Telescope live_grep", "Telescope"),
        new_section("Projects", "Telescope projects", "Telescope"),
        new_section("New file", "ene | startinsert", "Built-in"),
        new_section("Quit", "qa", "Built-in"),
        new_section("Config", "e $MYVIMRC", "Config"),
        new_section("Lazy Extras", "LazyExtras", "Config"),
        new_section("Lazy", "Lazy", "Config"),
        new_section("Restore session", [[lua require("persistence").load()]], "Session"),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(pad .. "░ ", false),
        starter.gen_hook.aligning("center", "top"),
      },
    }
    return config
  end,
  config = function(_, config)
    -- Close Lazy and re-open when starter is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniStarterOpened",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    local starter = require "mini.starter"
    starter.setup(config)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        local pad_footer = string.rep(" ", 8)
        starter.config.footer = pad_footer .. "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(starter.refresh)
      end,
    })
  end,
}
