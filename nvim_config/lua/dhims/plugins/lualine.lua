local status, lualine = pcall(require, "lualine")
if not status then
    return
end

local lualine_theme = require("lualine.themes.onedark")

local new_colors = {
    blue   = "#65D1FF",
    green  = "#3EFFDC",
    violet = "#FF61EF",
    yellow = "#FFDA7B",
    black  = "#000000",
}

lualine_theme.normal.a.bg = new_colors.blue
lualine_theme.insert.a.bg = new_colors.green
lualine_theme.visual.a.bg = new_colors.violet
lualine_theme.command.a.bg = new_colors.yellow

lualine.setup({
    options = {
        theme = lualine_theme
    }
})