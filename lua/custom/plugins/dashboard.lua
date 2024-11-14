local logo = [[
           _       _    _                    _             _              _            _          _   _         _                   _          
        / /\    / /\ / /\                /\ \           /\_\           /\ \         /\ \       /\_\/\_\ _    / /\                /\ \     _  
       / / /   / / // /  \              /  \ \         / / /  _       /  \ \       /  \ \     / / / / //\_\ / /  \              /  \ \   /\_\
      / /_/   / / // / /\ \            / /\ \ \       / / /  /\_\    / /\ \ \     / /\ \ \   /\ \/ \ \/ / // / /\ \            / /\ \ \_/ / /
     / /\ \__/ / // / /\ \ \          / / /\ \ \     / / /__/ / /   / / /\ \_\   / / /\ \_\ /  \____\__/ // / /\ \ \          / / /\ \___/ / 
    / /\ \___\/ // / /  \ \ \        / / /  \ \_\   / /\_____/ /   / /_/_ \/_/  / / /_/ / // /\/________// / /  \ \ \        / / /  \/____/  
   / / /\/___/ // / /___/ /\ \      / / /    \/_/  / /\_______/   / /____/\    / / /__\/ // / /\/_// / // / /___/ /\ \      / / /    / / /   
  / / /   / / // / /_____/ /\ \    / / /          / / /\ \ \     / /\____\/   / / /_____// / /    / / // / /_____/ /\ \    / / /    / / /    
 / / /   / / // /_________/\ \ \  / / /________  / / /  \ \ \   / / /______  / / /\ \ \ / / /    / / // /_________/\ \ \  / / /    / / /     
/ / /   / / // / /_       __\ \_\/ / /_________\/ / /    \ \ \ / / /_______\/ / /  \ \ \\/_/    / / // / /_       __\ \_\/ / /    / / /      
\/_/    \/_/ \_\___\     /____/_/\/____________/\/_/      \_\_\\/__________/\/_/    \_\/        \/_/ \_\___\     /____/_/\/_/     \/_/       
                                                                                                                                             

  ]]
return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = vim.split(logo, '\n'),
        -- stylua: ignore
        center = {
          -- { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
          -- { action = "func(path) vim.cmd('Telescope find_files cwd=' .. path) end",                           desc = " Find File",       icon = " ", key = "f" },
          { action = "lua builtin.find_files{ cwd = vim.fn.stdpath 'config' }",                           desc = " Find File",       icon = " ", key = "f" },
          { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
          { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
          { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
        end,
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}

--
--   local opts = {
--     theme = "doom",
--     hide = {
--       -- this is taken care of by lualine
--       -- enabling this messes up the actual laststatus setting after loading a file
--       statusline = false,
--     },
--     config = {
--       header = vim.split(logo, "\n"),
--       -- stylua: ignore
--       center = {
--         { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
--         { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
--         { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
--         { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
--         { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
--         { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
--         { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
--         { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
--         { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
--       },
--       footer = function()
--         local stats = require("lazy").stats()
--         local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
--         return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
--       end,
--     },
--   }
--
--   for _, button in ipairs(opts.config.center) do
--     button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
--     button.key_format = "  %s"
--   end
--
--   -- close Lazy and re-open when the dashboard is ready
--   if vim.o.filetype == "lazy" then
--     vim.cmd.close()
--     vim.api.nvim_create_autocmd("User", {
--       pattern = "DashboardLoaded",
--       callback = function()
--         require("lazy").show()
--       end,
--     })
--   end
--
--   return opts
-- end
