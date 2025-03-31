return {
	cmd = { "jdtls", "-configuration", "/home/user/.cache/jdtls/config", "-data", "/home/user/.cache/jdtls/workspace" },
	root_markers = {
		-- Multi-module projects
		{ ".git", "build.gradle", "build.gradle.kts" },
		-- Single-module projects
		{
			"build.xml", -- Ant
			"pom.xml", -- Maven
			"settings.gradle", -- Gradle
			"settings.gradle.kts", -- Gradle
		},
	},
	filetypes = { "java" },
}
