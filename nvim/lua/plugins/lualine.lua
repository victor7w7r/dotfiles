return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = "tokyonight",
			globalstatus = true,
			section_separators = { left = "", right = "" },
			component_separators = "",
			disabled_filetypes = { "dashboard", "lazy", "alpha" },
		},
		sections = {
			lualine_a = { { "mode", icon = "" } },
			lualine_b = { { "branch", icon = "" }, "diff" },
			lualine_c = {
				{ "filename", path = 1, symbols = { modified = "", readonly = "" } },
			},
			lualine_x = {
				{ "diagnostics" },
				{ "encoding" },
				{ "filetype",   icon_only = true },
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}
