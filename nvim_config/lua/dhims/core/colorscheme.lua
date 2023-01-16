local status, onedark = pcall(require, "onedark")
if not status then
	print("Colorscheme not found!")
	return
end

vim.cmd [[ colorscheme onedark ]]

onedark.setup({
	style = 'darker',
	transparent = false,
	term_colors = true,
	ending_tildes = false,
	code_style = {
        comments = 'bold,italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },
})

onedark.load()