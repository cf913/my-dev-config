return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      color = {
        suggestion_color = "#ffffff",
      },
      ignore_filtetypes = { "git", "node_modules", "dist", "build", "target", "vendor", '.env', '.env.local' }
    })
  end,
}
