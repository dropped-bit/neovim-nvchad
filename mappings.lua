-- add my key mappins here

local M = {}

local opts = { noremap = true, silent = true }
M.general = {
  n = {
    ["<C-h>"] = { " <cmd> TmuxNavigateLeft<CR> ", "window left" },
    ["<C-l>"] = { " <cmd> TmuxNavigateRight<CR> ", "window right" },
    ["<C-j>"] = { " <cmd> TmuxNavigateDown<CR> ", "window down" },
    ["<C-k>"] = { " <cmd> TmuxNavigateUp<CR> ", "window up" },
    -- Resize with arrows
    ["<C-Up>"] = { ":resize -2<CR>", "description", opts },
    ["<C-Down>"] = { ":resize +2<CR>", "description2", opts },
    ["<C-Left>"] = { ":vertical resize -2<CR>", "description3", opts },
    ["<C-Right>"] = { ":vertical resize +2<CR>", "description5", opts },
    --navigate buffers
    ["<S-l>"] = { ":bnext<CR>", "next buffer", opts },
    ["<S-h>"] = { ":bprevious<CR>", "previous buffer", opts },
    ["<leader>jk"] = { ":bdelete<CR>", "close buffer", opts },
    -- move text
    ["<A-j>"] = { ":m .+1<CR>==", "move text down", opts },
    ["<A-k>"] = { ":m .-2<CR>==", "move text up", opts },
  },
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },
  v = {
    ["<A-j>"] = { ":m '>+1<CR>gv==gv", "move text down", opts },
    ["<A-k>"] = { ":m '<-2<CR>gv==gv", "move text up", opts },
  }
}

M.nvimtree = {
  plugin = true,
  n = {
    -- toggle
    ["<leader>ee"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>ef"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  }
}
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" }
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

return M
