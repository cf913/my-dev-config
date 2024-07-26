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
    {
      "<leader>fe",
      function()
        require("neo-tree.command").execute({ toggle = true, reveal = true, dir = vim.uv.cwd(), position = 'right' })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ reveal = true, dir = vim.uv.cwd(), position = 'right' })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    -- { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
    -- { "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
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
        require("neo-tree.command").execute({ source = "buffers", reveal = true, position = 'float' })
      end,
      desc = "Buffer Explorer",
    },
  },
  opts = {
    reveal = true,
    close_if_last_window = true,
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          -- '.git',
          -- '.DS_Store',
          -- 'thumbs.db',
        },
        never_show = {},
      },
    }
  }
}
