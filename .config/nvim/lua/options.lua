local options = {
	encoding = "utf-8",
	fileencoding = "utf-8",
	updatetime = 300,
	number = true,
	relativenumber = true,
	expandtab = true,
	tabstop = 4,
	shiftwidth = 4,
	autoindent = true,
	smartindent = true
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

