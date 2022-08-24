-- https://github.com/lukas-reineke/indent-blankline.nvim

local status_ok, indent_blankline = pcall(require, 'indent_blankline')

if (not status_ok) then
    return
end

vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"
vim.opt.termguicolors = true
vim.g.indentLine_enabled = 1 -- slows down cpu?

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#002b36 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#073642 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#465a61 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#52676d gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#708183 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#e9e2cb gui=nocombine]]

--vim.cmd [[highlight IndentBlanklineContextChar guifg=#738a05  gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#52676d  gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextStart guisp=#d01b24 gui=bold]]
vim.cmd([[highlight NvimTreeIndentMarker guifg=#c61c6f gui=nocombine]])

-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#002831 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#073642 gui=nocombine]]

indent_blankline.setup({
    char = '┊',
    -- char = "",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
    space_char_blankline = ' ',
    -- space_char_blankline = '',
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    show_trailing_blankline_indent = false,
})

vim.wo.colorcolumn = "99999"

vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type",
}

vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
    "help",
    "startify",
    "starship",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "Trouble",
}
