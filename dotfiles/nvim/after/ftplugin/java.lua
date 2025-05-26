local config = {
	cmd = { "/usr/bin/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".idea", ".gitignore", ".git", "mvnw" }, { upward = true })[1]),
	-- use google code style
	settings = {
		java = {
			format = {
				settings = {
					url = vim.fn.expand("~/.config/nvim/codestyles/google-java-codestyle.xml"),
				},
			},
		},
	},
}
require("jdtls").start_or_attach(config)
