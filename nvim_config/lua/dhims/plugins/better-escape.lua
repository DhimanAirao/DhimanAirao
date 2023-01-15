local status, better_escape = pcall(require, "better-escape")
if not status then
    return
end

better_escape.setup({
    mapping = { "jk", "jj" },
    timeout = vim.o.timeoutlen,
    clear_empty_lines = false,
    keys = "<ESC>",
})