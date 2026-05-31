return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git",
	},
	settings = {},
	on_attach = function(client)
		-- Disable hover in favor of BasedPyright.
		client.server_capabilities.hoverProvider = false
	end,
}
