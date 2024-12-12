return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-x>", function()
			local is_neo_tree_open = false
			for _, win in ipairs(vim.api.nvim_list_wins()) do
				local buf = vim.api.nvim_win_get_buf(win)
				if vim.bo[buf].filetype == "neo-tree" then
					is_neo_tree_open = true
					vim.api.nvim_set_current_win(win)
					break
				end
			end

			if not is_neo_tree_open then
				vim.cmd("Neotree show")
			end
		end, { noremap = true, silent = true })
		vim.keymap.set("n", "<C-n>", ":Neotree toggle left<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}
