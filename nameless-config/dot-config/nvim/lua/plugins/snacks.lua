return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true, -- Show dotfiles / hidden files
            ignored = false, -- Include files from .gitignore
          },
        },
      },
    },
  },
}
