-- add my key mappins here
local M = {}

local opts = { noremap = true, silent = true }

M.general = {
  n = {
    ["<C-h>"] = {" <cmd> TmuxNavigateLeft<CR> ", "window left"},
    ["<C-l>"] = {" <cmd> TmuxNavigateRight<CR> ", "window right"},
    ["<C-j>"] = {" <cmd> TmuxNavigateDown<CR> ", "window down"},
    ["<C-k>"] = {" <cmd> TmuxNavigateUp<CR> ", "window up"},
    -- Resize with arrows
    ["<C-Up>"] = {":resize -2<CR>", opts},
    ["<C-Down>"] = {":resize +2<CR>", opts},
    ["<C-Left>"] = {":vertical resize -2<CR>", opts},
    ["<C-Right>"] = {":vertical resize +2<CR>", opts},
    ["<leader>pe"] = {":lua require('swenv.api').pick_venv()<CR>", "Choose python environment"}
  },
  i = {
    ["jk"] = {"<ESC>", "escape insert mode", opts = { nowait = true }},
  }
}

M.text = {
  n = {
    ["<A-j>"] = {"<Esc>:m .+1<CR>==g", "move text down", opts},
    ["<A-k>"] = {"<Esc>:m .-2<CR>==g", "move text up", opts}
  }
}

M.nvimtree = {
  plugin = true,
  n = {
    -- toggle 
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>o"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  }
}
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
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

-- M.swenv = {
--   plugin = true,
--   n = {
--     ["<leader>pe"] = {
--       "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose python environment"
--     }
--   }
-- }
return M
