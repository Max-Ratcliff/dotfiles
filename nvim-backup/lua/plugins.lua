-- plugins.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- LSP + Mason
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  -- colorscheme & tree
  "tanvirtin/monokai.nvim",

  -- nvim-tree.lua
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({})
    end,
  },

  -- 1) Core nvim-cmp + sources
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]     = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })

      -- cmdline “:” completion
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "path" },
          { name = "cmdline" },
        },
      })

      -- for “/” searches
      vim.o.omnifunc = "v:lua.vim.lsp.omnifunc"
      cmp.setup.cmdline("/", {
        sources = { { name = "buffer" } },
      })
    end,
  },

  -- 2) blink.cmp plugin
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "*",
    opts = {
      keymap = {
        preset     = "enter",
        ["<Up>"]   = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-b>"]  = { "scroll_documentation_up", "fallback" },
        ["<C-f>"]  = { "scroll_documentation_down", "fallback" },
        ["<C-k>"]  = { "show_signature", "hide_signature", "fallback" },
      },
      appearance = { nerd_font_variant = "mono" },
      sources    = { default = { "lsp", "path", "snippets", "buffer" } },
      fuzzy      = { implementation = "prefer_rust_with_warning" },
      completion = {
        keyword       = { range = "prefix" },
        menu          = { draw = { treesitter = { "lsp" } } },
        trigger       = { show_on_trigger_character = true },
        documentation = { auto_show = true },
      },
      signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
  },

  -- dashboard-nvim
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        -- add any custom dashboard config here
      })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- GitHub Copilot (use default settings; configure via Vimscript if needed)
  {
    "github/copilot.vim",
    cmd = "Copilot",
    event = "InsertEnter",
  },

  -- Comment.nvim
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
})
