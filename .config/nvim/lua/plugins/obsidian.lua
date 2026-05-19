return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function(args)
        local map = function(lhs, rhs, opts)
          opts = vim.tbl_extend("force", { buffer = args.buf, silent = true }, opts or {})
          vim.keymap.set("n", lhs, rhs, opts)
        end
        map("<leader>ch", function() require("obsidian.actions").toggle_checkbox() end,
          { desc = "Obsidian: Toggle checkbox" })
        map("<cr>", function() require("obsidian.actions").smart_action() end,
          { desc = "Obsidian: Smart action" })
      end,
    })
  end,
  keys = {
    { "<leader>Od",  "<cmd>Obsidian today<CR>",        desc = "Obsidian: Open today's daily note" },
    { "<leader>Oo",  "<cmd>Obsidian open<CR>",         desc = "Obsidian: Open in Obsidian" },
    { "<leader>On",  "<cmd>Obsidian new<CR>",          desc = "Obsidian: Open New Note" },
    { "<leader>Ofp", "<cmd>Obsidian quick_switch<CR>", desc = "Obsidian: Search Files" },
    { "<leader>Ofa", "<cmd>Obsidian search<CR>",       desc = "Obsidian: Search In Files" },
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    workspaces = {
      {
        name = "Vault",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault",
      },
    },
    notes_subdir = "0 Inbox",
    new_notes_location = "notes_subdir",

    daily_notes = {
      folder = "Journal",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      default_tags = { "daily-notes" },
      template = nil,
    },

    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
    },

    legacy_commands = false,

    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.date("%Y-%m-%d")) .. "-" .. suffix
    end,
  },
}
