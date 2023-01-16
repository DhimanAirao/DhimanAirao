local status, indent_matic = pcall(require, "indent-blankline")
if not status then
    return
end

indent_matic.setup({
    max_lines = -1,
    standard_widths = {2, 4, 8},
    skip_multiline = true,
})