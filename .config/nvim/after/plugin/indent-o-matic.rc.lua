local status_ok, indent_o_matic = pcall(require, "indent-o-matic")
if not status_ok then return end

indent_o_matic.setup {
    -- The values indicated here are the defaults
    -- Number of lines without indentation before giving up (use -1 for infinite)
    max_lines = 2048,

    -- Space indentations that should be detected
    standard_widths = { 2, 4, 8 },

    -- Skip multi-line comments and strings (more accurate detection but less performant)
    skip_multiline = true,

    -- Disable indent-o-matic for LISP files
    filetype_lisp = {
        max_lines = 0,
    },

    -- Only detect 4 spaces and tabs for Rust files
    filetype_rust = {
        standard_widths = { 4 },
    },

    -- Don't detect 8 spaces indentations inside files without a filetype
    filetype_ = {
        standard_widths = { 2, 4 },
    },
}

