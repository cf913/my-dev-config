-- return {
--   "nvim-tree/nvim-tree.lua",
--   version = "*",
--   lazy = false,
--   dependencies = {
--     "nvim-tree/nvim-web-devicons",
--   },
--   config = function()
--     require("nvim-tree").setup {
--       filters             = {
--         dotfiles = false,
--         custom = { ".git" },
--       },
--       actions             = {
--         open_file = { quit_on_open = true },
--       },
--       renderer            = {
--         indent_markers = { enable = true }
--       },
--       respect_buf_cwd     = true,
--       update_cwd          = true,
--       update_focused_file = { enable = true },
--       view                = {
--         adaptive_size = true,
--       }
--     }
--   end
-- }

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
    -- {
    --   "<leader>fe",
    --   function()
    --     require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
    --   end,
    --   desc = "Explorer NeoTree (Root Dir)",
    -- },
    {
      "<leader>fe",
      function()
        require("neo-tree.command").execute({ reveal = true, dir = vim.uv.cwd(), position = 'right' })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    -- { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
    { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
    {
      "<leader>ge",
      function()
        require("neo-tree.command").execute({ source = "git_status" })
      end,
      desc = "Git Explorer",
    },
    {
      "<leader>be",
      function()
        require("neo-tree.command").execute({ source = "buffers", reveal = true })
      end,
      desc = "Buffer Explorer",
    },
  },
  opts = {
    reveal = true
  }
}
