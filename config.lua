-- General
vim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "material"
lvim.leader = "space"

-- Default Options
vim.opt.timeoutlen = 500

-- Keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- Builtin Plugins
lvim.builtin.alpha.active                                   = true
lvim.builtin.alpha.mode                                     = "dashboard"
lvim.builtin.notify.active                                  = true
lvim.builtin.terminal.active                                = true
lvim.builtin.nvimtree.setup.view.side                       = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git         = false
lvim.builtin.nvimtree.setup.open_on_setup                   = true
lvim.builtin.nvimtree.setup.open_on_tab                     = true
lvim.builtin.nvimtree.setup.open_on_setup_file              = true
lvim.builtin.nvimtree.setup.filters.dotfiles                = false
lvim.builtin.nvimtree.setup.view.width                      = 60
lvim.builtin.nvimtree.setup.view.hide_root_folder           = false
lvim.builtin.nvimtree.setup.sort_by                         = "case_sensitive"
lvim.builtin.nvimtree.setup.view.auto_resize                = false
lvim.builtin.nvimtree.setup.actions.open_file.resize_window = true

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "ruby",
  "java",
  "yaml"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Formatters & Linters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  },
  {
    exe = "black",
    filetypes = { "python" }
  }
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint_d",
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  },
}

-- Additional Plugins
lvim.plugins = {
  { "marko-cerovac/material.nvim" },
  {
    "wfxr/minimap.vim",
    run = "cargo install --locked code-minimap",
    cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
    config = function()
      vim.cmd("let g:minimap_width = 10")
      vim.cmd("let g:minimap_auto_start = 1")
      vim.cmd("let g:minimap_auto_start_win_enter = 1")
      vim.cmd("let g:minimap_git_colors = 1")
    end,
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 1
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,
        stop_eof = true,
        use_local_scrolloff = false,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        easing_function = nil,
        pre_hook = nil,
        post_hook = nil,
      })
    end
  },
  {
    "editorconfig/editorconfig-vim",
    config = function()
      vim.cmd("let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'")
      vim.cmd("let g:EditorConfig_core_mode = 'external_command'")
    end
  }
}

vim.cmd "colorscheme material"
vim.g.material_style = "palenight"
