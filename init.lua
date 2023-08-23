-- bootstrap lazy.nvim, LazyVim and your plugins
-- local ensure_packer = function()
--   local fn = vim.fn
--   local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
--   if fn.empty(fn.glob(install_path)) > 0 then
--     fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
--     print(install_path)
--     vim.cmd([[packadd packer.nvim]])
--     return true
--   end
--   return false
-- end
--
-- local packer_bootstrap = ensure_packer()
-- require("packer").startup(function(use)
--   use("wbthomason/packer.nvim")
--   if packer_bootstrap then
--     require("packer").sync()
--   end
-- end)
if vim.g.vscode then
  -- vim.cmd([[packadd packer.nvim]])
  -- require("packer").startup(function(use)
  --   use("wbthomason/packer.nvim")
  --   use("EtiamNullam/deferred-clipboard.nvim")
  --   use("tpope/vim-capslock")
  --   use("easymotion/vim-easymotion")
  --   use("svermeulen/vim-subversive")
  --   use("tpope/vim-surround")
  --   use("Pocco81/auto-save.nvim")
  --   use("tpope/vim-commentary")
  --   use("asvetliakov/vim-easymotion")
  --   -- use 'inkarkat/vim-mark'
  --   use({ "mg979/vim-visual-multi", branch = "master" })
  --   -- Automatically set up your configuration after cloning packer.nvim
  --   -- Put this at the end after all plugins
  --   if packer_bootstrap then
  --     require("packer").sync()
  --   end
  -- end)
  -- vim.g.clipboard = {
  --   name = "win32yank-wsl",
  --   copy = {
  --     ["+"] = "win32yank.exe -i --crlf",
  --     ["*"] = "win32yank.exe -i --crlf",
  --   },
  --   paste = {
  --     ["+"] = "win32yank.exe -o --lf",
  --     ["*"] = "win32yank.exe -o --lf",
  --   },
  --   cache_enabled = 1,
  -- }
  package.path = vim.fn.stdpath("config") .. "/lua/?.lua;" .. package.path
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
-- bootstrap lazy.nvim
-- stylua: ignore
vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  end
  vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
  require("core.vim.deferClip").setup()
  require("lazy").setup({
    -- add LazyVim and import its plugins
    -- { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    "svermeulen/vim-subversive",
    {
      "ur4ltz/surround.nvim",
      config = function()
        require("surround").setup({ mappings_style = "surround" })
      end,
    },
    "tpope/vim-commentary",
    -- "asvetliakov/vim-easymotion",
  })
  vim.cmd("source ~/.config/nvim/init.vim")
  -- package.path = "/home/vw/.config/nvim/lua/config/lazy.lua;/home/vw/.config/nvim/lua/config/?.lua;/home/vw/.config/nvim/lua/core/vim/deferClip.lua;"
  --   .. package.path
  -- require("config.lazy")
else
  require("config.lazy")
end
