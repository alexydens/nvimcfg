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
        "markdown_inline",
        "glsl",
        "nasm",
        "python",
        "rust",
        "toml",
        "c_sharp",
        "make",
        "zig"
      },
      highlight = { enable = true, },
    })
  end
}
