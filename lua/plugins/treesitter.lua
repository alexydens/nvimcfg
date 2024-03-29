return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c", "cpp", "cmake",
        "lua", "vim", "vimdoc",
        "javascript", "html", "css",
        "markdown",
        "glsl",
        "nasm",
        "python",
        "rust"
      },
      highlight = { enable = true, },
    })
  end
}
