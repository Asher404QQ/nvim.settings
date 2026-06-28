return {
  -- {
  --   "nobbmaestro/nvim-andromeda",
  --   dependencies = { "tjdevries/colorbuddy.nvim" },
  --
  --   config = function()
  --     require("andromeda").setup({
  --       preset = "andromeda",
  --     })
  --   end,
  -- },
  -- {
  --   "navarasu/onedark.nvim",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require('onedark').setup {
  --       style = 'warmer'
  --     }
  --     require('onedark').load()
  --   end
  -- },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      -- Default options
      require('nightfox').setup({
        options = {
          -- Compiled file's destination location
          compile_path = vim.fn.stdpath("cache") .. "/nightfox",
          compile_file_suffix = "_compiled", -- Compiled file suffix
          transparent = false,               -- Disable setting background
          terminal_colors = true,            -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = false,              -- Non focused panes set to alternative background
          module_default = true,             -- Default enable value for modules
          colorblind = {
            enable = false,                  -- Enable colorblind support
            simulate_only = false,           -- Only show simulated colorblind colors and not diff shifted
            severity = {
              protan = 0,                    -- Severity [0,1] for protan (red)
              deutan = 0,                    -- Severity [0,1] for deutan (green)
              tritan = 0,                    -- Severity [0,1] for tritan (blue)
            },
          },
          styles = {           -- Style to be applied to different syntax groups
            comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
          },
          inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
          modules = { -- List of various plugins and additional options
            -- ...
          },
        },
        palettes = {},
        specs = {},
        groups = {
          all = {
            ["@number"] = { fg = "#C97430" },
            ["@boolean"] = { fg = "#C97430" },
            ["@parameter"] = { fg = "#BD2A37" },
            ["@variable.parameter"] = { fg = "#BD2A37" },
            ["Number"] = { fg = "#C97430" },
            ["Type"] = { fg = "#E5C07B" },
          }
        },
      })

      -- setup must be called before loading
      vim.cmd("colorscheme carbonfox")
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'everforest',
        component_separators = '|',
        section_separators = '',
      }
    },
  }
}
