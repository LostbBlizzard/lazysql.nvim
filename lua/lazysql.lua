local M = {}

local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

M.setup = function() end

local function islazysqlinstalled()
	return vim.fn.executable("lazysql") == 1
end

local function showcantfindlazysqlpopup()
	local popup = Popup({
		enter = true,
		focusable = true,
		border = {
			style = "rounded",
		},
		position = "50%",
		size = {
			width = "90%",
			height = "90%",
		},
	})

	popup:mount()

	popup:on(event.BufLeave, function()
		popup:unmount()
	end)
	popup:map("n", "q", function()
		popup:unmount()
	end)
	vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, {
		"lazysql is not installed or its not in path...      Press q to close.",
	})
end

local function showlazysqlui()
	local popup = Popup({
		enter = true,
		focusable = true,
		border = {
			style = "rounded",
			text = {
				top = "lazysql",
			},
		},
		position = "50%",
		size = {
			width = "90%",
			height = "90%",
		},
	})

	local function closelazysqlpopup(currentpopup)
		currentpopup:unmount()
		vim.cmd("silent! :checktime")
	end
	popup:mount()

	popup:on(event.BufLeave, function()
		closelazysqlpopup(popup)
	end)

	popup:map("i", "q", function()
		closelazysqlpopup(popup)
	end)

	popup:on({ "VimResized", "WinResized" }, function()
		popup:update_layout()
		vim.api.nvim_win_set_cursor(0, { 1, 0 })
	end)

	vim.fn.termopen("lazysql", {
		on_exit = function()
			closelazysqlpopup(popup)
		end,
	})
	vim.cmd("startinsert")
end

M.toggle = function()
	if not islazysqlinstalled() then
		showcantfindlazysqlpopup()
		return
	end
	showlazysqlui()
end

return M
