local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

require("base46").load_highlight "treesitter"

local options = {
  ensure_installed = {
      "hcl", "svelte", "go", "javascript", "typescript", "bash", "graphql",
      "java", "json", "lua", "python", "rust", "tsx", "css", "terraform"
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = {
    enable = true,
  },
}

-- check for any override
options = require("core.utils").load_override(options, "nvim-treesitter/nvim-treesitter")

treesitter.setup(options)
