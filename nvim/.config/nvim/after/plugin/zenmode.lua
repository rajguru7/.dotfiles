vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").setup {
        window = {
            width = 86,
            height = 0.85,
            options = { }
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = true
    vim.wo.number = true
    vim.wo.rnu = true
    vim.wo.colorcolumn = "80"
end)
