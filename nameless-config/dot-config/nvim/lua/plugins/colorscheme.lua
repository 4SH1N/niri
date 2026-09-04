return {
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
    build = false, -- يمنع lazy.nvim من لمحاولة استخدام luarocks لبنائه
    config = function()
      vim.cmd.colorscheme("oxocarbon")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "oxocarbon",
    },
  },
}
