local harpoon = require('harpoon')

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: Add Buffer" })
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
  { desc = "Harpoon: Open Window" })

vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end, { desc = "Harpoon: Buffer 1" })
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end, { desc = "Harpoon: Buffer 2" })
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end, { desc = "Harpoon: Buffer 3" })
vim.keymap.set("n", "<C-p>", function() harpoon:list():select(4) end, { desc = "Harpoon: Buffer 4" })
vim.keymap.set("n", "<leader>k", function() harpoon:list():select(5) end, { desc = "Harpoon: Buffer 5" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon: Buffer PREV" })
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon: Buffer NEXT" })
