return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
		ensure_installed = { "lua_ls" , "harper_ls" , "clangd" , "ast-grep" , "dartls"}
	})
    end,
  },
  {
    "neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.ast_grep.setup({})
			lspconfig.dartls.setup({})
	end
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "L3MON4D3/LuaSnip" },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = {
          { name = "luasnip" },
          { name = "buffer" },
          { name = "nvim_lsp" },
        },
      })
    end
  }
}
