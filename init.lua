local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("config")
require("lazy").setup("plugins")

-- МодульВыводmini.pick vs TelescopeTelescope богаче, но тяжелее. mini.pick быстрее, но прощеmini.completion vs nvim-cmpnvim-cmp гибче и больше источников, mini.completion проще настроитьmini.snippets vs LuaSnipLuaSnip мощнее, mini.snippets достаточно для базовых нуждmini.files vs oil.nvimПримерно равны, дело вкусаmini.pairs vs nvim-autopairsПрактически одинаковы
