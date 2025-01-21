-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup()
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = '[O]il' })
    end,
  },
  {
    'tpope/vim-fugitive',
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "R", mode = { "o", "x", "n" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
  },
  -- {
  --   'folke/trouble.nvim',
  --   branch = 'dev', -- IMPORTANT!
  --   keys = {
  --     {
  --       '<leader>xx',
  --       '<cmd>Trouble diagnostics toggle<cr>',
  --       desc = 'Diagnostics (Trouble)',
  --     },
  --     {
  --       '<leader>xX',
  --       '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
  --       desc = 'Buffer Diagnostics (Trouble)',
  --     },
  --     {
  --       '<leader>cs',
  --       '<cmd>Trouble symbols toggle focus=false<cr>',
  --       desc = 'Symbols (Trouble)',
  --     },
  --     {
  --       '<leader>cl',
  --       '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
  --       desc = 'LSP Definitions / references / ... (Trouble)',
  --     },
  --     {
  --       '<leader>xL',
  --       '<cmd>Trouble loclist toggle<cr>',
  --       desc = 'Location List (Trouble)',
  --     },
  --     {
  --       '<leader>xQ',
  --       '<cmd>Trouble qflist toggle<cr>',
  --       desc = 'Quickfix List (Trouble)',
  --     },
  --   },
  --   opts = {}, -- for default options, refer to the configuration section for custom setup.
  -- },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    config = function()
      local harpoon = require 'harpoon'

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      -- vim.keymap.set('n', '<C-h>', function()
      --   harpoon:list():select(1)
      -- end)
      -- vim.keymap.set('n', '<C-t>', function()
      --   harpoon:list():select(2)
      -- end)
      -- vim.keymap.set('n', '<C-n>', function()
      --   harpoon:list():select(3)
      -- end)
      -- vim.keymap.set('n', '<C-s>', function()
      --   harpoon:list():select(4)
      -- end)

      -- Toggle previous & next buffers stored within Harpoon list
      -- vim.keymap.set('n', '<C-S-P>', function()
      --   harpoon:list():prev()
      -- end)
      -- vim.keymap.set('n', '<C-S-N>', function()
      --   harpoon:list():next()
      -- end)

      -- basic telescope configuration
      -- local conf = require('telescope.config').values
      -- local function toggle_telescope(harpoon_files)
      --   local file_paths = {}
      --   for _, item in ipairs(harpoon_files.items) do
      --     table.insert(file_paths, item.value)
      --   end
      --
      --   require('telescope.pickers')
      --     .new({}, {
      --       prompt_title = 'Harpoon',
      --       finder = require('telescope.finders').new_table {
      --         results = file_paths,
      --       },
      --       previewer = conf.file_previewer {},
      --       sorter = conf.generic_sorter {},
      --     })
      --     :find()
      -- end
      --
      -- vim.keymap.set('n', '<C-e>', function()
      --   toggle_telescope(harpoon:list())
      -- end, { desc = 'Open harpoon window' })
    end,
  },
  {
    'f-person/git-blame.nvim',
  },
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   event = 'VeryLazy',
  --   opts = function()
  --     local colors = require('cyberdream.colors').default
  --     local cyberdream = require 'lualine.themes.cyberdream'
  --     local copilot_colors = {
  --       [''] = { fg = colors.grey, bg = colors.none },
  --       ['Normal'] = { fg = colors.grey, bg = colors.none },
  --       ['Warning'] = { fg = colors.red, bg = colors.none },
  --       ['InProgress'] = { fg = colors.yellow, bg = colors.none },
  --     }
  --     return {
  --       options = {
  --         component_separators = { left = ' ', right = ' ' },
  --         section_separators = { left = ' ', right = ' ' },
  --         theme = cyberdream,
  --         globalstatus = true,
  --         disabled_filetypes = { statusline = { 'dashboard', 'alpha' } },
  --       },
  --       sections = {
  --         lualine_a = { { 'mode', icon = '' } },
  --         lualine_b = { { 'branch', icon = '' } },
  --         lualine_c = {
  --           {
  --             'diagnostics',
  --             symbols = {
  --               error = ' ',
  --               warn = ' ',
  --               info = ' ',
  --               hint = '󰝶 ',
  --             },
  --           },
  --           { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
  --           {
  --             'filename',
  --             symbols = { modified = '  ', readonly = '', unnamed = '' },
  --           },
  --           {
  --             function()
  --               return require('nvim-navic').get_location()
  --             end,
  --             cond = function()
  --               return package.loaded['nvim-navic'] and require('nvim-navic').is_available()
  --             end,
  --             color = { fg = colors.grey, bg = colors.none },
  --           },
  --         },
  --         lualine_x = {
  --           {
  --             require('lazy.status').updates,
  --             cond = require('lazy.status').has_updates,
  --             color = { fg = colors.green },
  --           },
  --           {
  --             function()
  --               local icon = ' '
  --               local status = require('copilot.api').status.data
  --               return icon .. (status.message or '')
  --             end,
  --             cond = function()
  --               local ok, clients = pcall(vim.lsp.get_active_clients, { name = 'copilot', bufnr = 0 })
  --               return ok and #clients > 0
  --             end,
  --             color = function()
  --               if not package.loaded['copilot'] then
  --                 return
  --               end
  --               local status = require('copilot.api').status.data
  --               return copilot_colors[status.status] or copilot_colors['']
  --             end,
  --           },
  --           { 'diff' },
  --         },
  --         lualine_y = {
  --           {
  --             'progress',
  --           },
  --           {
  --             'location',
  --             color = { fg = colors.cyan, bg = colors.none },
  --           },
  --         },
  --         lualine_z = {
  --           function()
  --             return '  ' .. os.date '%X' .. ' 🚀 '
  --           end,
  --         },
  --       },
  --
  --       extensions = { 'lazy', 'toggleterm', 'mason', 'neo-tree', 'trouble' },
  --     }
  --   end,
  -- },
  { 'junegunn/fzf.vim', dependencies = {
    'junegunn/fzf',
  } },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
}
