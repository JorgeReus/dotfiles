-- Enable NERDCommenterToggle to check all selected lines is commented or not 
-- vim.g['NERDToggleCheckAllLines'] = 0
-- -- Add spaces after comment delimiters by default
-- vim.g['NERDSpaceDelims'] = 1
-- -- Use compact syntax for prettified multi-line comments
-- vim.g['NERDCompactSexyComs'] = 1
-- -- Align line-wise comment delimiters flush left instead of following code indentation
-- vim.g['NERDDefaultAlign'] = 'left'
-- -- Add your own custom formats or override the defaults
-- vim.g['NERDCustomDelimiters'] = {terraform = {left = '#'}}
-- -- Allow commenting and inverting empty lines (useful when commenting a region)
-- vim.g['NERDCommentEmptyLines'] = 1
-- -- Enable trimming of trailing whitespace when uncommenting
-- vim.g['NERDTrimTrailingWhitespace'] = 
require('Comment').setup({
    toggler = {
        ---Line-comment toggle keymap
        line = 'gclt',
        ---Block-comment toggle keymap
        block = 'gcbt'
    },
    opleader = {
        ---Line-comment keymap
        line = 'gcl',
        ---Block-comment keymap
        block = 'gcb'
    },
    extra = {
        ---Add comment on the line above
        above = 'gclO',
        ---Add comment on the line below
        below = 'gclo',
        ---Add comment at the end of line
        eol = 'gclA'
    },
    mappings = {
        ---Operator-pending mapping
        ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
        ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
        basic = true,
        ---Extra mapping
        ---Includes `gco`, `gcO`, `gcA`
        extra = true,
        ---Extended mapping
        ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
        extended = false
    }
})
