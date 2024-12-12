
return {
    'MagicDuck/grug-far.nvim',
    config = function()
        require('grug-far').setup({
            -- Add plugin-specific options here if needed
        })
    end,
    keys = {
        { '<leader>sr', function() 
            require('grug-far').open() 
        end, desc = 'Search and Replace' }
    },
}

