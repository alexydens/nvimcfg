return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        autoformat = false,
        ensure_installed = {
          "clangd",
          "asm_lsp",
          "lua_ls",
          "vimls",
          --"tsserver",
          "rust_analyzer",
          "html",
          "cssls",
          "csharp_ls",
          "glsl_analyzer",
          "jdtls",
          "zls",
        },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      --lspconfig.ccls.setup({
        --init_options = {
          --index = {
            --intitialBlacklist = {
              --"./tx-tooolchain/*"
            --}
          --}
        --}
      --})
      lspconfig.clangd.setup({})
      lspconfig.asm_lsp.setup({})
      lspconfig.vimls.setup({})
      --lspconfig.tsserver.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.lua_ls.setup({
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })
      lspconfig.html.setup({})
      lspconfig.cssls.setup({})
      lspconfig.csharp_ls.setup({})
      lspconfig.glsl_analyzer.setup({})
      lspconfig.jdtls.setup({})
      lspconfig.zls.setup({})
      lspconfig.pylsp.setup({})
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local lsp_opts = { buffer = ev.buf }
          vim.keymap.set("n", "fmt", vim.lsp.buf.format, lsp_opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, lsp_opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, lsp_opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, lsp_opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, lsp_opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, lsp_opts)
          vim.keymap.set("n", "rn", vim.lsp.buf.rename, lsp_opts)
          vim.keymap.set("n", "ac", vim.lsp.buf.code_action, lsp_opts)
        end,
      })
    end
  }
}
