vim.api.nvim_create_user_command("LazySql", function()
	if vim.fn.has("nvim-0.5") == 0 then
		print("lazysql.nvim needs Neovim >= 0.5")
		return
	end

	require("lazysql").toggle()
end, {})
