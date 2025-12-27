return {
	"rmagatti/auto-session",
	lazy = false,

	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		-- log_level = 'debug',

		-- called when no session is restored
		no_restore_cmds = {
			"Neotree show",
		},

		-- called after a session is restored
		post_restore_cmds = {
			"Neotree show",
		},
	},
}
