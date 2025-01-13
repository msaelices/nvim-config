local options = {
  ensure_installed = { "lua", "vim", "vimdoc", "vue", "python", "javascript" },

  highlight = {
    enable = true,
    use_languagetree = true,
    disable = { "vue" },
  },

  indent = { enable = true },
}

return options
