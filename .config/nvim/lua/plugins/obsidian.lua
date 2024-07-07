return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    -- see below for full list of optional dependencies 👇
  },
  opts = {
    notes_subdir = "0 Inbox",
    workspaces = {
      {
        name = "Vault",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault",
      },
    },
    new_notes_location = "0 Inbox",

    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "Journal",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%B %-d, %Y",
      -- Optional, default tags to add to each new daily note created.
      default_tags = { "daily-notes" },
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = nil
    },

    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },

    -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
    -- way then set 'mappings = {}'.
    mappings = {
      ["<leader>Od"] = {
        action = function()
          return "<cmd>ObsidianToday<CR>"
        end,
        opts = { buffer = true, expr = true, desc = "Obsidian: Open today's daily note" },
      },
      ["<leader>Oo"] = {
        action = function()
          return "<cmd>ObsidianOpen<CR>"
        end,
        opts = { buffer = true, expr = true, desc = "Obsidian: Open in Obsidian" },
      },
      ["<leader>Ofp"] = {
        action = function()
          return "<cmd>ObsidianQuickSwitch<CR>"
        end,
        opts = { buffer = true, expr = true, desc = "Obsidian: Search Files" },
      },
      ["<leader>Ofa"] = {
        action = function()
          return "<cmd>ObsidianSearch<CR>"
        end,
        opts = { buffer = true, expr = true, desc = "Obsidian: Search In Files" },
      },
      ["<leader>On"] = {
        action = function()
          return "<cmd>ObsidianNew<CR>"
        end,
        opts = { buffer = true, expr = true, desc = "Obsidian: Create new note" },
      },
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      }
    },

    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.date("%Y-%m-%d")) .. "-" .. suffix
    end,

    -- see below for full list of options 👇
  },
}
