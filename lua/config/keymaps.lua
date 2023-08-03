-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps Hhere
-- To update the init.vim press sv
vim.api.nvim_set_keymap("n", "<Leader>sv", ":source ~/.config/nvim/init.lua<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>sc", ":e $MYVIMRC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-j>", "ciw<C-r>0<ESC>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>a", ":Autoformat<CR>", { noremap = true })
-- substitute
vim.keymap.set("n", "s", require("substitute").operator, { noremap = true })
vim.keymap.set("n", "ss", require("substitute").line, { noremap = true })
vim.keymap.set("n", "S", require("substitute").eol, { noremap = true })
vim.keymap.set("x", "s", require("substitute").visual, { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>vb", "C-v", { noremap = true, silent = true })
vim.keymap.set("n", "<BS>", "<Leader>", { noremap = true })

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local mappings = {
  -- Terminal Mode
  { mode = "t", lhs = "<M-h>", rhs = "<C-\\><C-N><C-w>h" },
  { mode = "t", lhs = "<M-j>", rhs = "<C-\\><C-N><C-w>j" },
  { mode = "t", lhs = "<M-k>", rhs = "<C-\\><C-N><C-w>k" },
  { mode = "t", lhs = "<M-l>", rhs = "<C-\\><C-N><C-w>l" },
  { mode = "t", lhs = "<Esc>", rhs = "<C-\\><C-n>" },

  -- Insert Mode
  { mode = "i", lhs = "<M-h>", rhs = "<C-\\e<C-N><C-w>h" },
  { mode = "i", lhs = "<M-j>", rhs = "<C-\\><C-N><C-w>j" },
  { mode = "i", lhs = "<M-k>", rhs = "<C-\\><C-N><C-w>k" },
  { mode = "i", lhs = "<M-l>", rhs = "<C-\\><C-N><C-w>l" },

  -- Normal Mode
  { mode = "n", lhs = "<M-h>", rhs = "<C-w>h" },
  { mode = "n", lhs = "<M-j>", rhs = "<C-w>j" },
  { mode = "n", lhs = "<M-k>", rhs = "<C-w>k" },
  { mode = "n", lhs = "<M-l>", rhs = "<C-w>l" },

  -- nnoremap <PageUp> <C-u>
  -- nnoremap <PageDown> <C-d>
  { mode = "n", lhs = "<PageUp>", rhs = "10<C-u>zz" },
  { mode = "n", lhs = "<PageDown>", rhs = "10<C-d>zz" },
  -- nnoremap <End>  $
  -- nnoremap <Home> 0
  { mode = "n", lhs = "<End>", rhs = "$" },
  { mode = "n", lhs = "<Home>", rhs = "0" },
  -- inoremap <C-c> <NOP>
  -- " imap ;; <ESC>A;<ESC>
  -- nnoremap <A-right> <C-i>
  -- nnoremap <A-left> <C-o>
  { mode = "n", lhs = "<A-right>", rhs = "<C-i>" },
  { mode = "n", lhs = "<A-left>", rhs = "<C-o>" },

  -- " HARPOON Config
  -- nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
  -- nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
  -- nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
  -- nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
  -- nnoremap <leader>5 :lua require("harpoon.ui").nav_file(5)<CR>
  -- nnoremap <leader>6 :lua require("harpoon.ui").nav_file(6)<CR>
  -- nnoremap <leader>7 :lua require("harpoon.ui").nav_file(7)<CR>
  -- nnoremap <leader>8 :lua require("harpoon.ui").nav_file(8)<CR>
  -- nnoremap <leader>fa :lua require("harpoon.mark").add_file()<CR>
  -- nnoremap <leader>fr :lua require("harpoon.ui").toggle_quick_menu()<CR>
  -- nnoremap gf :e <cfile><cr>
  -- { mode = "n", lhs = "gf", rhs = "<C-o>" },
}
for _, mapTable in ipairs(mappings) do
  map(mapTable.mode, mapTable.lhs, mapTable.rhs)
end
if vim.g.vscode then
  -- vim.api.nvim_set_keymap('n', 'gcc', "<Cmd>lua require('vscode').VSCodeNotify('editor.action.revealDefinitionAside')<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>db",
    "<Cmd>lua require('vscode').VSCodeNotify('editor.debug.action.toggleBreakpoint')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "gr",
    "<Cmd>lua require('vscode').VSCodeNotify('references-view.findReferences')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>h",
    "<Cmd>lua require('vscode').VSCodeNotify('editor.fold')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>l",
    "<Cmd>lua require('vscode').VSCodeNotify('editor.unfold')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>j",
    "<Cmd>lua require('vscode').VSCodeNotify('editor.foldRecursively')<CR>j",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>k",
    "<Cmd>lua require('vscode').VSCodeNotify('editor.unfoldAll')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>1",
    "<Cmd>lua require('vscode').VSCodeNotify('workbench.action.openEditorAtIndex1')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>2",
    "<Cmd>lua require('vscode').VSCodeNotify('workbench.action.openEditorAtIndex2')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>3",
    "<Cmd>lua require('vscode').VSCodeNotify('workbench.action.openEditorAtIndex3')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>4",
    "<Cmd>lua require('vscode').VSCodeNotify('workbench.action.openEditorAtIndex4')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>5",
    "<Cmd>lua require('vscode').VSCodeNotify('workbench.action.openEditorAtIndex5')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>6",
    "<Cmd>lua require('vscode').VSCodeNotify('workbench.action.openEditorAtIndex6')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader><BS>fr",
    "<Cmd>lua require('vscode').VSCodeNotify('workbench.action.openEditorAtIndex6')<CR><Cmd>lua require('vscode').VSCodeNotify('workbench.action.openEditorAtIndex5')<CR><Cmd>lua require('vscode').VSCodeNotify('workbench.action.openEditorAtIndex4')<CR><Cmd>lua require('vscode').VSCodeNotify('workbench.action.openEditorAtIndex3')<CR><Cmd>lua require('vscode').VSCodeNotify('workbench.action.openEditorAtIndex2')<CR><Cmd>lua require('vscode').VSCodeNotify('workbench.action.openEditorAtIndex1')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>fa",
    "<Cmd>lua require('vscode').VSCodeNotify('workbench.action.pinEditor')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>fd",
    "<Cmd>lua require('vscode').VSCodeNotify('workbench.action.unpinEditor')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>sv",
    "<Cmd>lua require('vscode').VSCodeNotify('workbench.action.reloadWindow')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>z",
    "<Cmd>lua require('vscode').VSCodeNotify('workbench.action.toggleZenMode')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>a",
    "<Cmd>lua require('vscode').VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>t",
    "<Cmd>lua require('vscode').VSCodeNotify('workbench.action.togglePanel')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>ct",
    "<Cmd>lua require('vscode').VSCodeNotify('workbench.action.quickOpenTerm')<CR>",
    { noremap = true, silent = true }
  )
end
