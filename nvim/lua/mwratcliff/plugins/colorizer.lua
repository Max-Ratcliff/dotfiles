-- ~/nvim/lua/mwratcliff/plugins/colorizer.lua

return {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup({ "*" })
    end,
}

