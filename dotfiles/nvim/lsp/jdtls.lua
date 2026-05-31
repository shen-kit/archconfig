return {
	cmd = { "/usr/bin/jdtls" },
	root_markers = {
		-- Java build files.
		{
			"gradlew",
			"mvnw",
			"build.gradle",
			"build.gradle.kts",
			"pom.xml",
			"settings.gradle",
			"settings.gradle.kts",
			"build.xml",
		},
		-- Project markers.
		{ ".idea", ".gitignore", ".git" },
	},
	filetypes = { "java" },
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
