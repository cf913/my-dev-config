return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  opts = {
    keymaps = {
      accept_suggestion = "<Tab>",
      clear_suggestion = "<C-]>",
    },
    color = {
      suggestion_color = "#00ffff",
    },
    ignore_filetypes = { "git", "node_modules", "dist", "build", "target", "vendor", '.env', '.env.local' }
  }
}
