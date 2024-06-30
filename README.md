# lazysql.nvim 

A Simple Plugin for calling [lazysql](https://github.com/jorgerojas26/lazysql) from within neovim.
In the same vein [crnvl96/lazydocker.nvim](https://github.com/crnvl96/lazydocker.nvim/tree/main) and [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)

# Alternatives

- [akinsho/nvim-toggleterm](https://github.com/akinsho/nvim-toggleterm.lua#custom-terminals)
- [voldikss/vim-floaterm](https://github.com/voldikss/vim-floaterm)

But if like "Do One Thing and Do It Well" just continue on.

# Dependencies

You will need [lazysql](https://github.com/jorgerojas26/lazysql) installed on your system for this plugin to work.

# Install

```lua
-- Packer
use({
  "LostbBlizzard/lazysql.nvim",
  config = function()
    require("lazysql").setup()
  end,
  requires = {
    "MunifTanjim/nui.nvim",
  }
})

-- Lazy
{
  "LostbBlizzard/lazysql.nvim",
  opts = {},  -- automatically calls `require("lazysql").setup()`
  dependencies = {
    "MunifTanjim/nui.nvim",
  }
}
```

# Usage

just use the command `LazySql` to toggle the floating panel

or set a keybind


```lua
vim.keymap.set("n", "<leader>ls", "<cmd>LazySql<CR>", { desc = "Toggle LazySql", noremap = true, silent = true })
```
